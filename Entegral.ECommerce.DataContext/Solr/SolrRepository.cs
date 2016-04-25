using Entegral.ECommerce.DataContext.Solr.Model;
using Microsoft.Practices.ServiceLocation;
using SolrNet;
using SolrNet.Commands.Parameters;
using SolrNet.Utils;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;

namespace Entegral.ECommerce.DataContext.Solr
{
    public sealed class SolrRepository<T> where T : SolrProduct
    {

        private static SolrRepository<T> _instance;
        private static readonly object _lock = new object();

        private ISolrOperations<T> _solr
        {
            get
            {
                return ServiceLocator.Current.GetInstance<ISolrOperations<T>>();
            }
        }

        public static SolrRepository<T> GetInstance(int languageId)
        {
            lock (_lock)
            {
                return _instance ?? (_instance = new SolrRepository<T>(languageId));
            }
        }

        private SolrRepository(int languageId)
        {
            //TODO: move to a more suitable place (app start?) with constants to config            
            Startup.Init<T>(SolrUtils.GetSolrCorePathFor<T>(languageId));
        }

        public SolrQueryResults<T> GetListingProducts(SolrFilters filters)
        {          
            var phrasePattern = HttpUtility.HtmlDecode(ConfigurationManager.AppSettings["SolrSearchPhrasePattern"] ?? "&quot;{0}&quot;^20");
            var wordPattern = HttpUtility.HtmlDecode(ConfigurationManager.AppSettings["SolrSearchWordPattern"] ?? "+(&quot;{0}&quot;^10 {0}*^5 {0}~0.6)");

            var queryOptions = new QueryOptions()
            {                
                Start = filters.Start,
                Rows = filters.Rows,
                FilterQueries = new List<ISolrQuery>(),
                Facet = new FacetParameters()
            };

            var mainQuery = SolrQuery.All;
            if(!string.IsNullOrEmpty(filters.SearchText))            
                mainQuery = new SolrQuery(string.Format("{0} ({1})"
                            , string.Format(phrasePattern, filters.SearchText)
                            , string.Join(" ", filters.SearchText.Split(new[] { " " }, StringSplitOptions.RemoveEmptyEntries)
                                    .Select(t => string.Format(wordPattern, t)))));

            if (!string.IsNullOrEmpty(filters.Barcode))
                mainQuery = new SolrQuery(string.Format("\"{0}*\"", filters.Barcode));

            //queryOptions.FilterQueries.Add(new SolrQueryByField(SolrField.Barcode, filters.Barcode));

            if (filters.HideProductsWithNoImage)
                queryOptions.FilterQueries.Add(new SolrQueryByRange<string>(SolrField.ListingImageUri, null, null, true, true));

            queryOptions.FilterQueries.Add(new LocalParams { { "tag", string.Format("{0}t,{1}", SolrField.Price, string.IsNullOrEmpty(filters.PriceExcludeGroupName) ? string.Empty : string.Format(",{0}", filters.PriceExcludeGroupName)) } } + new SolrQueryByRange<decimal?>(SolrField.Price, filters.MinPrice, filters.MaxPrice, true, true));

            //facets and facet filters
            if(filters.FacetFields != null && filters.FacetFields.Count > 0)
            {
                foreach(var facet in filters.FacetFields)
                {
                    queryOptions.Facet.Queries.Add(new SolrFacetFieldQuery(
                        facet.Exclude ? new LocalParams { { "ex", string.Format("{0}t", facet.FieldName) } } + facet.FieldName
                                      : facet.FieldName
                    ) { MinCount = facet.MinCount, Limit = facet.Limit });


                    if (facet.QueryWithNonFiltered && !string.IsNullOrEmpty(facet.ExcludeGroupName))
                    {
                        queryOptions.Facet.Queries.Add(new SolrFacetFieldQuery(
                            new LocalParams { { "ex", facet.ExcludeGroupName }, { "key", string.Format(SolrField.NonFilteredFieldPattern, facet.FieldName) } } + facet.FieldName
                        ) { MinCount = facet.MinCount, Limit = facet.Limit });

                    }

                    if (facet.FilterValues == null || facet.FilterValues.Count == 0)
                        continue;

                    var filterValue = string.Join(" ", facet.FilterValues.Select(f => string.Format("\"{0}\"", f)));
                    queryOptions.FilterQueries.Add(
                        facet.Exclude ? new LocalParams { { "tag", string.Format("{0}t{1}", facet.FieldName, string.IsNullOrEmpty(facet.ExcludeGroupName) ? string.Empty : string.Format(",{0}",facet.ExcludeGroupName)) } } + new SolrQuery(string.Format("{1}:({0})", filterValue, facet.FieldName))
                                      : new SolrQuery(string.Format("{1}:({0})", filterValue, facet.FieldName)));
                }
            }

            if(filters.SortData != null)            
                queryOptions.OrderBy = filters.SortData;

            return _solr.Query(mainQuery, queryOptions);
        }

        public bool Commit()
        {
            _solr.Commit();
            return true;
        }

        public bool Optimize()
        {
            _solr.Optimize();
            return true;
        }

        public bool DeleteByQuery(string query)
        {
            _solr.Delete(new SolrQuery(query));
            return true;
        }

        public bool IndexProducts(IList<T> products, bool commit = true, bool optimize = true)
        {
            try
            {
                ResponseHeader response;
                if ((response = _solr.AddRange(products)) == null
                    || response.Status != 0)
                    throw new Exception("Unable to add documents to index!");

                if (commit)
                    Commit();

                if (optimize)
                    Optimize();

                return true;
            }
            catch(Exception e)
            {
                //TODO: log
                throw new Exception(string.Format("Unable to add documents to index!: {0}", e.Message));
            }

            //return false;
        }

        public void RollBack()
        {
            _solr.Rollback();
        }
    }
}

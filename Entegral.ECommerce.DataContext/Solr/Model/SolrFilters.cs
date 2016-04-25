using SolrNet;
//using Entegral.ECommerce.Global.Enum;
using System.Collections.Generic;

namespace Entegral.ECommerce.DataContext.Solr.Model
{
    public class SolrFilters
    {
        public int Start { get; set; }
        
        public int Rows { get; set; }
        
        public string SearchText { get; set; }

        public decimal? MinPrice { get; set; }

        public decimal? MaxPrice { get; set; }

        public string PriceExcludeGroupName { get; set; }

        public bool HideProductsWithNoImage { get; set; }

        public string Barcode { get; set; }

        public ICollection<Facet> FacetFields { get; set; }

        public ICollection<SortOrder> SortData { get; set; }
                
        public class Facet
        {
            public Facet() { MinCount = 1; Limit = -1; }
            public Facet(string fieldName, ICollection<string> filterValues = null, bool exclude = true, int minCount = 1, int limit = -1, bool queryNonFiltered = false)
            {
                FieldName = fieldName;
                FilterValues = filterValues;
                Exclude = exclude;
                MinCount = minCount;
                Limit = limit;
                QueryWithNonFiltered = queryNonFiltered;
            }

            public string FieldName { get; set; }

            public bool QueryWithNonFiltered { get; set; }

            public ICollection<string> FilterValues { get; set; }

            public bool Exclude { get; set; }

            public int MinCount { get; set; }

            public int Limit { get; set; }

            public string ExcludeGroupName { get; set; }
        }
    }
}

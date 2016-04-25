using Entegral.ECommerce.DataContext.Solr.Model.Interface;
using SolrNet.Attributes;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Xml.Linq;

namespace Entegral.ECommerce.DataContext.Solr.Model
{

    public abstract class SolrProduct
    {
        [SolrUniqueKey(SolrField.ProductId)]
        public int ProductId { get; set; }

        [SolrField(SolrField.Title)]
        public string Title { get; set; }

        [SolrField(SolrField.Description)]
        public string Description { get; set; }

        [SolrField(SolrField.ProductKey)]
        public string ProductKey { get; set; }

        [SolrField(SolrField.Price)]
        public decimal Price { get; set; }

        [SolrField(SolrField.DiscountedPrice)]
        public decimal? DiscountedPrice { get; set; }

        [SolrField(SolrField.CategoryId)]
        public ICollection<int> CategoryId { get; set; }

        [SolrField(SolrField.CategoryPath)]
        public ICollection<string> CategoryPath { get; set; }

        [SolrField(SolrField.CategoryKey)]
        public ICollection<string> CategoryKey { get; set; }

        [SolrField(SolrField.ListingImageUri)]
        public ICollection<string> ListingImageUri { get; set; }

        [SolrField(SolrField.StockQuantity)]
        public int StockQuantity { get; set; }

        [SolrField(SolrField.IsVatIncluded)]
        public bool IsVatIncluded { get; set; }

        [SolrField(SolrField.IsPreOrder)]
        public bool IsPreOrder { get; set; }

        [SolrField(SolrField.Tag)]
        public ICollection<string> Tag { get; set; } //TODO

        [SolrField(SolrField.Attributes)]
        public IDictionary<string, ICollection<int>> Attributes { get; set; }

        [SolrField(SolrField.AttributeMaxValues)]
        public IDictionary<string, string> AttributeMaxValues { get; set; }

        [SolrField(SolrField.AttributeMinValues)]
        public IDictionary<string, string> AttributeMinValues { get; set; }

        [SolrField(SolrField.CategorySort)]
        public IDictionary<string, int> CategorySort { get; set; }

        [SolrField(SolrField.MetaData)]
        public ICollection<string> MetaData { get; set; }

        [SolrField(SolrField.DisplayOrder)]
        public int DisplayOrder { get; set; }

        [SolrField(SolrField.VatRate)]
        public int VatRate { get; set; }

        [SolrField(SolrField.Price1)]
        public decimal Price1 { get; set; }

        [SolrField(SolrField.Price2)]
        public decimal? Price2 { get; set; }

        [SolrField(SolrField.Price2_Start)]
        public DateTime? Price2_StartTime { get; set; }

        [SolrField(SolrField.Price2_End)]
        public DateTime? Price2_EndTime { get; set; }

        [SolrField(SolrField.Price3)]
        public decimal? Price3 { get; set; }

        [SolrField(SolrField.Price3_Start)]
        public DateTime? Price3_StartTime { get; set; }

        [SolrField(SolrField.Price3_End)]
        public DateTime? Price3_EndTime { get; set; }

        [SolrField(SolrField.Price4)]
        public decimal? Price4 { get; set; }

        [SolrField(SolrField.Price4_Start)]
        public DateTime? Price4_StartTime { get; set; }

        [SolrField(SolrField.Price4_End)]
        public DateTime? Price4_EndTime { get; set; }

        [SolrField(SolrField.Barcode)]
        public string Barcode { get; set; }

        [SolrField(SolrField.Suggest)]
        public ICollection<string> Suggest { get; set; }

        [SolrField(SolrField.SmartTags)]
        public ICollection<string> SmartTags { get; set; }

        [SolrField(SolrField.SortPriority)]
        public decimal SortPriority { get; set; }

        //public bool MapResult { get; private set; }

        public T Map<T>(ISolrMapableResult result) where T : SolrProduct
        {
            MapFrom(result);
            return (T)this;
        }

        protected void MapFrom(ISolrMapableResult result)
        {
            var suggestAttributes = ConfigurationManager.AppSettings["SolrSuggestAttributes"] == null
                                    ? null
                                    : ConfigurationManager.AppSettings["SolrSuggestAttributes"].Split(new[] { "," }, StringSplitOptions.RemoveEmptyEntries).ToList();

            var metaDataAttributes = ConfigurationManager.AppSettings["SolrMetadataAttributes"] == null
                                    ? null
                                    : ConfigurationManager.AppSettings["SolrMetadataAttributes"].Split(new[] { "," }, StringSplitOptions.RemoveEmptyEntries).ToList();

                Description = result.Description;
                IsPreOrder = result.IsPreOrder.HasValue ? result.IsPreOrder.Value : false;
                IsVatIncluded = result.IsVatIncluded.HasValue ? result.IsVatIncluded.Value : false;
                ProductId = result.ProductId;
                ProductKey = result.ProductKey;
                StockQuantity = result.StockQuantity.HasValue ? result.StockQuantity.Value : 0; //should have at least 1
                Title = result.Title;
                VatRate = result.VatRate.HasValue ? result.VatRate.Value : 0;
                Barcode = result.ProductCode;
                SortPriority = result.SortPriority.HasValue ? result.SortPriority.Value : 0;

                Price1 = result.Price1.Value;
                Price2 = result.Price2;
                Price3 = result.Price3;
                Price4 = result.Price4;
                Price2_StartTime = result.Price2_StartTime;
                Price2_EndTime = result.Price2_EndTime;
                Price3_StartTime = result.Price3_StartTime;
                Price3_EndTime = result.Price3_EndTime;
                Price4_StartTime = result.Price4_StartTime;
                Price4_EndTime = result.Price4_EndTime;

                Price = result.IsVatIncluded.Value ? result.GetPrice() / (1 + (result.VatRate.Value / 100)) : result.GetPrice();
                if (result.IsStrikeThroughPriceExists())
                    DiscountedPrice = result.IsVatIncluded.Value ? result.Price1.Value / (1 + (result.VatRate.Value / 100)) : result.Price1.Value;

                Suggest = new List<string>() {
                   Title
                };

                MetaData = new List<string>();

                if (result.ProductImages != null)
                    ListingImageUri = XDocument.Parse(result.ProductImages)
                                                        .Element("images")
                                                        .Elements("img")
                                                        .Select(i => string.Format("{0}:{1}:{2}:{3}:{4}:{5}", i.Attribute("ID").Value, i.Attribute("MediaFileID").Value, i.Attribute("MediaFormat").Value, i.Attribute("SizeID").Value, i.Attribute("DisplayOrder").Value, i.Attribute("CDNPath").Value))
                                                        .ToList();
                
                var categoryData = XDocument.Parse(result.ProductCategories)
                                                    .Element("categories")
                                                    .Elements("cat")
                                                    .Select(i => new
                                                    {
                                                        CategoryID = Convert.ToInt32(i.Attribute("CategoryID").Value),
                                                        CategoryKey = i.Attribute("CategoryKey").Value,
                                                        CategoryPath = string.Format("/{0}", i.Attribute("CategoryPath").Value),
                                                        DisplayOrder = Convert.ToInt32(i.Attribute("DisplayOrder").Value),
                                                    });

                if(result.SmartTags != null)
                    SmartTags = XDocument.Parse(result.ProductImages)
                                                        .Element("smart_tags")
                                                        .Elements("st")
                                                        .Select(i => string.Format("{0}:{1}", i.Attribute("Value").Value, i.Attribute("ImageUrl").Value))
                                                        .ToList();
                
                CategoryId = categoryData.Select(a => a.CategoryID).ToList();
                CategoryKey = categoryData.Select(a => a.CategoryKey).ToList();
                CategoryPath = categoryData.Select(a => a.CategoryPath).ToList();

                var categorySortingDic = categoryData.ToDictionary(cat => cat.CategoryID.ToString(), cat => cat.DisplayOrder);

                if (categorySortingDic.Count > 0)
                    CategorySort = categorySortingDic;

                DisplayOrder = result.DisplayOrder.Value;

                Attributes = new Dictionary<string, ICollection<int>>();
                var attributeValues = new Dictionary<string, ICollection<string>>();
                foreach (var attr in XDocument.Parse(result.ProductAttributes)
                                                    .Element("attributes")
                                                    .Elements("attr"))
                {
                    var key = attr.Attribute("AttributeID").Value;
                    if (!Attributes.ContainsKey(key))
                        Attributes.Add(key, new List<int>());

                    Attributes[key].Add(Convert.ToInt32(attr.Attribute("AttributeOptionID").Value));

                    if (!attributeValues.ContainsKey(key))
                        attributeValues.Add(key, new List<string>());

                    var valueText = attr.Attribute("ValueText").Value;
                    attributeValues[key].Add(valueText);

                    var attributeCode = attr.Attribute("CodeName").Value;

                    if (metaDataAttributes != null && metaDataAttributes.Contains(attributeCode))
                        MetaData.Add(valueText);

                    if (suggestAttributes != null && suggestAttributes.Contains(attributeCode))
                        Suggest.Add(valueText);
                }

                AttributeMaxValues = new Dictionary<string, string>();
                AttributeMinValues = new Dictionary<string, string>();
                foreach (var attributeValue in attributeValues)
                {
                    //string comparison
                    AttributeMaxValues.Add(attributeValue.Key, attributeValue.Value.Max());
                    AttributeMinValues.Add(attributeValue.Key, attributeValue.Value.Min());
                }                

                if (!string.IsNullOrEmpty(result.MetaData))
                    ((List<string>)MetaData).AddRange(result.MetaData.Split(new[] { "::" }, StringSplitOptions.RemoveEmptyEntries));
                
                MetaData.Add(ProductId.ToString());
                MetaData.Add(Title);
                MetaData.Add(Description);
                MetaData.Add(Barcode);
                ((List<string>)MetaData).AddRange(CategoryKey);
                ((List<string>)MetaData).RemoveAll(m => m == null);

                //converts utf8 chars to ascii equivalent
                if (!string.IsNullOrEmpty(ConfigurationManager.AppSettings["SolrMapAsciiChars"]))
                    ((List<string>)MetaData).AddRange(MetaData.Select(SolrUtils.RemoveDiacritics).ToList());
        }

    }
}

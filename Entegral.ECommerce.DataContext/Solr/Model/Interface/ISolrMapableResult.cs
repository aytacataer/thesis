using System;
namespace Entegral.ECommerce.DataContext.Solr.Model.Interface
{
    public interface ISolrMapableResult
    {
        string Description { get; set; }
        int? DisplayOrder { get; set; }
        decimal GetPrice();
        bool? IsPreOrder { get; set; }
        bool IsPrice1Active();
        bool IsPrice2Active();
        bool IsPrice3Active();
        bool IsPrice4Active();
        bool IsStrikeThroughPriceExists();
        bool? IsVatIncluded { get; set; }
        decimal? Price1 { get; set; }
        decimal? Price2 { get; set; }
        DateTime? Price2_EndTime { get; set; }
        DateTime? Price2_StartTime { get; set; }
        decimal? Price3 { get; set; }
        DateTime? Price3_EndTime { get; set; }
        DateTime? Price3_StartTime { get; set; }
        decimal? Price4 { get; set; }
        DateTime? Price4_EndTime { get; set; }
        DateTime? Price4_StartTime { get; set; }
        string ProductAttributes { get; set; }
        string ProductCategories { get; set; }
        int ProductId { get; set; }
        string ProductImages { get; set; }
        string ProductKey { get; set; }
        int? VatRate { get; set; }
        int? StockQuantity { get; set; }
        string Title { get; set; }
        string MetaData { get; set; }
        string ProductCode { get; set; }
        string SmartTags { get; set; }
        decimal? SortPriority { get; set; }
    }
}

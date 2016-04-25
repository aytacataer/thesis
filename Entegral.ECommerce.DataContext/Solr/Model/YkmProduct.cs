using Entegral.ECommerce.DataContext.Solr.Model.Interface;

namespace Entegral.ECommerce.DataContext.Solr.Model
{
    public class YkmProduct : SolrProduct
    {
        public YkmProduct() { }
        public YkmProduct(ISolrMapableResult result)
        {
            MapFrom(result);
        }
    }
}

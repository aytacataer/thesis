using Entegral.ECommerce.DataContext.Solr.Model.Interface;

namespace Entegral.ECommerce.DataContext.Solr.Model
{
    public class BoynerProduct : SolrProduct
    {
        public BoynerProduct() { }
        public BoynerProduct(ISolrMapableResult result)
        {
            MapFrom(result);
        }
    }
}

using Entegral.ECommerce.DataContext.Solr.Model.Interface;

namespace Entegral.ECommerce.DataContext.Solr.Model
{
    public class NetworkProduct : SolrProduct
    {
        public NetworkProduct() { }
        public NetworkProduct(ISolrMapableResult result)
        {
            MapFrom(result);
        }
    }
}

using Entegral.ECommerce.DataContext.Solr.Model.Interface;

namespace Entegral.ECommerce.DataContext.Solr.Model
{
    public class DivareseProduct : SolrProduct
    {
        public DivareseProduct() { }
        public DivareseProduct(ISolrMapableResult result)
        {
            MapFrom(result);
        }
    }
}

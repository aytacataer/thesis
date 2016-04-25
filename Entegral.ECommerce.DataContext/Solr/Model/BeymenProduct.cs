using Entegral.ECommerce.DataContext.Solr.Model.Interface;

namespace Entegral.ECommerce.DataContext.Solr.Model
{
    public class BeymenProduct : SolrProduct
    {
        public BeymenProduct() { }
        public BeymenProduct(ISolrMapableResult result)
        {
            MapFrom(result);
        }
    }
}

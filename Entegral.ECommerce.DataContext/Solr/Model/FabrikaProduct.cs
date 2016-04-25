using Entegral.ECommerce.DataContext.Solr.Model.Interface;

namespace Entegral.ECommerce.DataContext.Solr.Model
{
    public class FabrikaProduct : SolrProduct
    {
        public FabrikaProduct() { }
        public FabrikaProduct(ISolrMapableResult result)
        {
            MapFrom(result);
        }
    }
}

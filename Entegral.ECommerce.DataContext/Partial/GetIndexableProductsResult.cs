using Entegral.ECommerce.DataContext.Solr.Model.Interface;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entegral.ECommerce.DataContext
{
    public partial class GetIndexableProductsResult : ISolrMapableResult
    {
        public bool IsStrikeThroughPriceExists() { return IsPrice2Enabled() || IsPrice3Enabled() || IsPrice4Enabled(); }

        public decimal GetPrice() { return IsPrice4Enabled() ? Price4.Value : (IsPrice3Enabled() ? Price3.Value : (IsPrice2Enabled() ? Price2.Value : Price1.Value)); }

        private bool IsPrice4Enabled() { return IsPrice4Active() == true; }

        private bool IsPrice3Enabled() { return IsPrice3Active() == true && IsPrice4Enabled() == false; }

        private bool IsPrice2Enabled() { return IsPrice2Active() == true && IsPrice3Enabled() == false; }

        private bool IsPrice1Enabled() { return IsPrice2Enabled() == false && IsPrice3Enabled() == false; }

        public bool IsPrice1Active() { return Price1 > 0;  }

        public bool IsPrice2Active()
        {

                return Price2.HasValue
                        && Price2_StartTime.HasValue
                        && Price2_EndTime.HasValue
                        && Price2_StartTime <= DateTime.UtcNow
                        && Price2_EndTime >= DateTime.UtcNow
                        && Price2 != Price1;
            
        }

        public bool IsPrice3Active()
        {

                return Price3.HasValue
                    && Price3_StartTime.HasValue
                    && Price3_EndTime.HasValue
                    && Price3_StartTime <= DateTime.UtcNow
                    && Price3_EndTime >= DateTime.UtcNow
                    && Price3 != Price1
                    && Price3 != Price2;
            
        }

        public bool IsPrice4Active()
        {

                return Price4.HasValue
                    && Price4_StartTime.HasValue
                    && Price4_EndTime.HasValue
                    && Price4_StartTime <= DateTime.UtcNow
                    && Price4_EndTime >= DateTime.UtcNow
                    && Price4 != Price1
                    && Price4 != Price2
                    && Price4 != Price3;
            
        }
    }
}

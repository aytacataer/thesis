using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entegral.ECommerce.DataContext
{
    public partial class vBO_OrderMain
    {
        public string PaymentDescription
        {
            get
            {
                if (PaymentAmount.HasValue == true)
                {
                    return string.Format("{0} - {1}, {2} Taksit, {3:0.00} TL",
                        this.PaymentMethod,
                        this.PaymentBankName,
                        this.InstallmentCount ?? 0,
                        this.PaymentAmount ?? 0);
                }
                else
                {
                    return string.Format("{0} - Henüz Ödeme Yok",
                        this.PaymentMethod, 0);
                }
            }
        }
    }
}

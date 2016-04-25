namespace Entegral.ECommerce.DataContext
{
    public partial class OrderItem
    {
        public bool IsCancelled
        {
            get
            {
                return this.CancelReasonID.HasValue;
            }
        }
    }
}
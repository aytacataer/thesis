using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Linq.Dynamic;

namespace Entegral.ECommerce.DataContext
{
    public static class QueryHelper
    {
        public static IQueryable<T> AddStoreRestriction<T>(this IQueryable<T> source, int storeID)
        {
            return source.Where("StoreID = @0 OR StoreID = 0", storeID);
        }

        public static IEnumerable<T> AddStoreRestriction<T>(this IEnumerable<T> source, int storeID)
        {
            return source.AsQueryable().Where("StoreID = @0 OR StoreID = 0", storeID).AsEnumerable();
        }
    }
}

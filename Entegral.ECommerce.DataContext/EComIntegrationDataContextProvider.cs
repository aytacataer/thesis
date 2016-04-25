using System.Configuration;
using Entegral.ExtendedDataContext;

namespace Entegral.ECommerce.DataContext
{
    public class EComIntegrationDataContextProvider : IDataContextProvider
    {
        public static EComIntegrationDataContextProvider Instance
        {
            get
            {
                return new EComIntegrationDataContextProvider();
            }
        }

        private EComIntegrationDBDataContext _dataContext;
        private EComHistoryDBDataContext _historyDataContext;
        private static readonly string connectionStringName = "EComConnectionString";
        private static readonly string integrationConnectionStringName = "EComIntegrationConnectionString";

        public EComIntegrationDBDataContext GetEComIntegrationDataContext()
        {
            return (EComIntegrationDBDataContext)GetDataContext();
        }

        public System.Data.Linq.DataContext GetDataContext()
        {
            // TODO: Connection string icin encryption yapılacak...
            if (_dataContext == null)
                _dataContext = new EComIntegrationDBDataContext(ConfigurationManager.ConnectionStrings[integrationConnectionStringName].ToString());

            return _dataContext;
        }

        public System.Data.Linq.DataContext GetHistoryDataContext()
        {
            // TODO: Connection string icin encryption yapılacak...
            if (_historyDataContext == null)
                _historyDataContext = new EComHistoryDBDataContext(ConfigurationManager.ConnectionStrings[connectionStringName].ToString());

            return _historyDataContext;
        }

        public void DestroyContext()
        {
            if (_dataContext != null)
            {
                _dataContext.Connection.Close();
                _dataContext.Dispose();
                _dataContext = null;
            }
        }

        public CommitDBResult CommitChanges(int UserID)
        {
            return DataContextHelper.CommitChanges(this.GetDataContext(), this.GetHistoryDataContext(), UserID);
        }

        public CommitDBResult CommitChangesWithoutHistory(int UserID)
        {
            return DataContextHelper.CommitChangesWithoutHistory(this.GetDataContext(), UserID);
        }

        public void DiscardPendingChanges()
        {
            DataContextHelper.DiscardPendingChanges(this.GetDataContext());
        }
    }
}
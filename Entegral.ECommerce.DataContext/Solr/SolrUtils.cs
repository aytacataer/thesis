using Entegral.ECommerce.DataContext.Solr.Model;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Globalization;
using System.Linq;
using System.Text;

namespace Entegral.ECommerce.DataContext.Solr
{
    public class SolrUtils
    {
        private static readonly IDictionary<Type, IDictionary<string, string>> _storeObjectMappings = new Dictionary<Type, IDictionary<string, string>>()
                                                                    { 
                                                                        { typeof(BeymenProduct), new Dictionary<string, string>(){ {"store_key", "BYM"},{"path", ConfigurationManager.AppSettings["SolrUriPattern"]} } },
                                                                        { typeof(BoynerProduct), new Dictionary<string, string>(){ {"store_key", "BYN"},{"path", ConfigurationManager.AppSettings["SolrUriPattern"]} } },
                                                                        { typeof(YkmProduct), new Dictionary<string, string>(){ {"store_key", "YKM"},{"path", ConfigurationManager.AppSettings["SolrUriPattern"]} } },
                                                                        { typeof(DivareseProduct), new Dictionary<string, string>(){ {"store_key", "7726"},{"path", ConfigurationManager.AppSettings["SolrUriPattern"]} } },
                                                                        { typeof(FabrikaProduct), new Dictionary<string, string>(){ {"store_key", "7725"},{"path", ConfigurationManager.AppSettings["SolrUriPattern"]} } },
                                                                        { typeof(NetworkProduct), new Dictionary<string, string>(){ {"store_key", "7721"},{"path", ConfigurationManager.AppSettings["SolrUriPattern"]} } }
                                                                    };

        public static int GetStoreIdFor<T>() where T : SolrProduct
        {
            var storeId = ConfigurationManager.AppSettings["StoreMappings"].Split(new[] { "," }, StringSplitOptions.RemoveEmptyEntries)
                    .Select(a => a.Split(new[] { ":" }, StringSplitOptions.RemoveEmptyEntries))
                    .Single(a => _storeObjectMappings[typeof(T)]["store_key"] == a.Last())
                    .First();
            return Convert.ToInt32(storeId);
        }

        public static string GetSolrCorePathFor<T>(int languageId) where T : SolrProduct
        {
            return string.Format(_storeObjectMappings[typeof(T)]["path"], GetStoreIdFor<T>(), languageId);
        }

        public static string RemoveDiacritics(string text)
        {
            Encoding srcEncoding = Encoding.UTF8;
            Encoding destEncoding = Encoding.GetEncoding(1252); // Latin alphabet

            text = destEncoding.GetString(Encoding.Convert(srcEncoding, destEncoding, srcEncoding.GetBytes(text)));

            string normalizedString = text.Normalize(NormalizationForm.FormD);
            StringBuilder result = new StringBuilder();

            for (int i = 0; i < normalizedString.Length; i++)
            {
                if (!CharUnicodeInfo.GetUnicodeCategory(normalizedString[i]).Equals(UnicodeCategory.NonSpacingMark))
                {
                    result.Append(normalizedString[i]);
                }
            }

            return result.ToString();
        }

    }
}

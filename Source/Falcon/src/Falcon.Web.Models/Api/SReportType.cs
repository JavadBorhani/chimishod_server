namespace Falcon.Web.Models.Api
{


    public class SReportType
    {
        
        public int ID { get; set; }
        public string Name { get; set; }
        public string Description { get; set; }
        public bool ShouldBanUser { get; set; }
        public int ReportCountToFilter { get; set; }
    }
}

using System.ComponentModel.DataAnnotations;

namespace Falcon.Web.Models.Api.Report
{
    public class SReportedQuestion
    {
        [Required]
        public int QuestionID { get; set; }
        [Required]
        public int ReportID { get; set; }
    }
}

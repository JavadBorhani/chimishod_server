using System.ComponentModel.DataAnnotations;

namespace Falcon.Web.Models.Api.User
{
    public class SInputSearchExpression
    {
        [StringLength(maximumLength:50 , MinimumLength = 3 )]
        [Required(AllowEmptyStrings =false)]
        public string Expression { get; set; }
        [Required]
        public int PageNumber { get; set; }
    }
}

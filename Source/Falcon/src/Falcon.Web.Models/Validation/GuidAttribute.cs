using System;
using System.ComponentModel.DataAnnotations;

namespace Falcon.Web.Models.Validation
{
    [AttributeUsage(AttributeTargets.Field | AttributeTargets.Property , AllowMultiple = false)]
    sealed public class GuidAttribute : ValidationAttribute
    {
        public override bool IsValid(object value)
        {
            var uuid = (string)value;
            if (string.IsNullOrEmpty(uuid))
                return true;

            Guid item;
            var isValid = Guid.TryParse(uuid, out item);
            return isValid;
        }
        public override string FormatErrorMessage(string name)
        {
            return base.FormatErrorMessage(name);
        }
    }
}

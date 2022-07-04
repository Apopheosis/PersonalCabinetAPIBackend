using System;
using System.ComponentModel.DataAnnotations;
using System.Diagnostics.CodeAnalysis;

namespace PersonalCabinetAPI.DTO
{
    public class Account
    {
        [Key]
        public int account_id { get; set; }
        [Required]
        public string login { get; set; }
        [Required]
        public string password { get; set; }
    }
}
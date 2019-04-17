using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace TrendWay.BOL.Entities
{
    [Table("Address")]
    public class Address
    {
        public int ID { get; set; }

        [StringLength(30), Column(TypeName = "varchar"), Display(Name = "Adres Adı")]
        public string Name { get; set; }

        [StringLength(150), Column(TypeName = "varchar"), Display(Name = "Adresi")]
        public string MemberAddress { get; set; }

        [StringLength(50), Column(TypeName = "varchar"), Display(Name = "Şehir")]
        public string City { get; set; }

        [StringLength(50), Column(TypeName = "varchar"), Display(Name = "İlçe")]
        public string District { get; set; }

        public int MemberID { get; set; }
        public Member Member { get; set; }
    }
}

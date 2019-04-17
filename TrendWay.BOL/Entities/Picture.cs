using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace TrendWay.BOL.Entities
{
    [Table("Picture")]
    public class Picture
    {
        public int ID { get; set; }

        [StringLength(150), Column(TypeName = "varchar"), Display(Name = "Resim Dosyası")]
        public string FPath { get; set; }

        [Display(Name = "Görüntülenme Sırası")]
        public int PIndex { get; set; }

        public int ProductID { get; set; }
        public Product Product { get; set; }
    }
}

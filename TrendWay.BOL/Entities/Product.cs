using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace TrendWay.BOL.Entities
{
    [Table("Product")]
    public class Product
    {
        public int ID { get; set; }

        [StringLength(150), Column(TypeName = "varchar"), Display(Name = "Ürün Adı")]
        public string Name { get; set; }

        [Display(Name = "Ürün Resmi")]
        public ICollection<Picture> Pictures { get; set; }      

        [Display(Name = "Ürün Fiyatı")]
        public decimal Price { get; set; }

        [Display(Name = "Görüntülenme Sırası")]
        public int PIndex { get; set; }

        public int CategoryID { get; set; }
        public Category Category { get; set; }

        public int BrandID { get; set; }
        public Brand Brand { get; set; }

        [Display(Name = "Stok Miktarı")]
        public int Stock { get; set; }

        [Display(Name = "Yenilik")]
        public bool IsNew { get; set; }

        [Display(Name = "İndirim")]
        public bool IsDiscount { get; set; }

        [Column(TypeName = "text"), Display(Name = "Ürün Detayları")]
        public string Detail { get; set; }

        public ICollection<Favorite> Favorites { get; set; }
        public ICollection<OrderDetail> OrderDetail { get; set; }
    }
}

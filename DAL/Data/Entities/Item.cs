﻿using System.Collections.Generic;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using DAL.Data.Entities.Base;
using DAL.Models;

namespace DAL.Data.Entities
{
    public class Item : EntityBase
    {
        public Item()
        {
            CartDetails = new HashSet<CartDetail>();
            Comments = new HashSet<Comment>();
            GoodsReceiptDetails = new HashSet<GoodsReceiptDetail>();
            LineItems = new HashSet<LineItem>();
        }

        //public int Id { get; set; }
        [DisplayName("Tên sản phẩm")]
        [Required]
        [Column(TypeName="nvarchar(100)")]
        public string Name { get; set; }

        [Display(Name = "Giá")]
        [Column(TypeName = "decimal(18,2)")]
        public decimal Price { get; set; }

        [Display(Name = "Mô tả")]
        [Column(TypeName = "nvarchar(MAX)")]
        public string Description { get; set; }

        [Display(Name = "Hình ảnh")]
        public string Image { get; set; }

        [Display(Name = "Số lượng tồn")]
        public int Inventory { get; set; }

        [Display(Name = "Số lượt xem")]
        public int View { get; set; }

        [Display(Name = "Mã mặt hàng")]
        public int CategoryId { get; set; }

        [Display(Name = "Thương hiệu")]
        public string BrandName { get; set; }

        //[Display(Name = "Gỡ khỏi web")]
        public bool IsDeleted { get; set; }

        [Display(Name = "Đánh giá")]
        public decimal? AverageEvaluation { get; set; }

        public int? EventId { get; set; }
        //public byte[] Timestamp { get; set; }

        [Display(Name = "Loại mặt hàng")]
        public virtual Category Category { get; set; }

        public virtual Event Event { get; set; }
        public virtual ICollection<CartDetail> CartDetails { get; set; }
        public virtual ICollection<Comment> Comments { get; set; }
        public virtual ICollection<GoodsReceiptDetail> GoodsReceiptDetails { get; set; }
        public virtual ICollection<LineItem> LineItems { get; set; }
    }
}

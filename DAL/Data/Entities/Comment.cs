﻿using System.ComponentModel.DataAnnotations;
using DAL.Data.Entities.Base;

namespace DAL.Data.Entities
{
    public class Comment : EntityBase
    {
        //public int Id { get; set; }
        [StringLength(200)]
        public string Content { get; set; }

        public int ItemId { get; set; }

        [Range(1, 5)]
        public int Evaluation { get; set; }

        public int CustomerId { get; set; }

        public Customer Customer { get; set; }
        public Item Item { get; set; }
    }
}
﻿using System;
using System.ComponentModel.DataAnnotations.Schema;
using DAL.Data.Enums;
using DAL.Data.Interfaces;
using Microsoft.AspNetCore.Identity;

namespace DAL.Data.Entities
{
    [Table("AppUsers")]
    public class AppUser : IdentityUser<Guid>, IDateTracking, ISwitchable
    {
        public AppUser() {  }
        public AppUser(Guid id, string fullName, string userName, 
            string email, string phoneNumber, string avatar, Status status)
        {
            Id = id;
            FullName = fullName;
            UserName = userName;
            Email = email;
            PhoneNumber = phoneNumber;
            Avatar = avatar;
            Status = status;
        }
       
        public string FullName { get; set; }
        public string PhoneNumber { get; set; }
        public string Email { get; set; }
        public string UserName { get; set; }
        public Guid Id { get; set; }



        public DateTime? BirthDay { set; get; }

        public decimal Balance { get; set; }

        public string Avatar { get; set; }

        public DateTime DateCreated { get; set; }
        public DateTime DateModified { get; set; }
        public Status Status { get; set; }
        Status ISwitchable.Status { get => throw new NotImplementedException(); set => throw new NotImplementedException(); }
    }
}
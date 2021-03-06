﻿using System;
using System.Collections.Generic;
using System.Linq.Expressions;
using DAL.Data.Entities;

namespace DAL.Repositories
{
    public interface IUserRepository
    {
        ApplicationUser FindUser(Expression<Func<ApplicationUser, bool>> where);

        ApplicationUser FindUserByUserName(string userName);

        bool IsDuplicatePhoneNumber(string phoneNumber);

        bool IsDuplicateEmail(string email, Guid userId);

        bool IsDuplicateEmail(string email);

        bool IsAdmin(ApplicationUser user);

        bool IsProductManager(string userName);

        int AddUserRole(Guid userId, Guid roleId);

        int SaveChanges();
        List<ApplicationUser> GetUsersByRole(Guid roleId);
        List<ApplicationUser> GetEmployees();
    }
}
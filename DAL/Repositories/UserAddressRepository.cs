﻿using System;
using System.Linq;
using System.Linq.Expressions;
using DAL.Data.Entities;
using DAL.EF;
using Microsoft.EntityFrameworkCore;

namespace DAL.Repositories
{
    public class UserAddressRepository : IUserAddressRepository
    {
        public DbSet<UserAddress> Table;
        public readonly OnlineStoreDbContext Db;

        public UserAddressRepository(DbContextOptions<OnlineStoreDbContext> options)
        {
            Db = new OnlineStoreDbContext(options);
            Table = Db.Set<UserAddress>();
        }

        public UserAddress Find(Expression<Func<UserAddress, bool>> where) => Table.FirstOrDefault(where);

        public UserAddress GetByUserAndAddress(Guid userId, int addressId)
        {
            return Table.FirstOrDefault(x => x.CustomerId == userId && x.AddressId == addressId);
        }
    }
}

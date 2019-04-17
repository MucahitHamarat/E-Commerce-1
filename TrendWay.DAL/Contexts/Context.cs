using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using TrendWay.BOL.Entities;

namespace TrendWay.DAL.Contexts
{
    public class Context:DbContext
    {
        public DbSet<Slider> Slider { get; set; }
        public DbSet<Admin> Admin { get; set; }
        public DbSet<Category> Category { get; set; }
        public DbSet<Brand> Brand { get; set; }
        public DbSet<Favorite> Favorite { get; set; }
        public DbSet<Member> Member { get; set; }
        public DbSet<Picture> Picture { get; set; }
        public DbSet<Product> Product { get; set; }
        public DbSet<Order> Order { get; set; }
        public DbSet<OrderDetail> OrderDetail { get; set; }
        public DbSet<Advertisement> Advertisement { get; set; }
        public DbSet<TContent> TContent { get; set; }
        public DbSet<Address> Address { get; set; }

        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            modelBuilder.Entity<Order>().HasIndex(hi => hi.OrderNumber).IsUnique();
        }
    }
}

using System;
using System.ComponentModel.DataAnnotations.Schema;
using System.Data.Entity;
using System.Linq;

namespace ZD1.DataBase
{
    public partial class EntityContext : DbContext
    {
        public EntityContext()
            : base("name=EntityContext1")
        {
        }

        public virtual DbSet<Client> Client { get; set; }
        public virtual DbSet<Manager> Manager { get; set; }
        public virtual DbSet<Order> Order { get; set; }
        public virtual DbSet<Products> Products { get; set; }
        public virtual DbSet<User> User { get; set; }

        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            modelBuilder.Entity<Client>()
                .HasMany(e => e.Order)
                .WithMany(e => e.Client)
                .Map(m => m.ToTable("ClientHasOrder").MapLeftKey("ClientId").MapRightKey("OrderId"));

            modelBuilder.Entity<Order>()
                .HasMany(e => e.Products)
                .WithMany(e => e.Order)
                .Map(m => m.ToTable("ListOfProductsInOrder").MapLeftKey("OrderID").MapRightKey("ProductID"));

            modelBuilder.Entity<Products>()
                .Property(e => e.Price)
                .HasPrecision(7, 2);

            modelBuilder.Entity<User>()
                .HasMany(e => e.Manager)
                .WithRequired(e => e.User)
                .WillCascadeOnDelete(false);
        }
    }
}

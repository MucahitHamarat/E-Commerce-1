using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Linq.Expressions;
using System.Text;
using System.Threading.Tasks;
using TrendWay.DAL.Contexts;

namespace TrendWay.BLL.Repositories
{
    public class Repository<T> : IRepository<T> where T : class
    {
        Context db = new Context();
        public T GetBy(Expression<Func<T, bool>> expression)
        {
            return db.Set<T>().Where(expression).FirstOrDefault();
        }
        public IQueryable<T> GetAll()
        {
            return db.Set<T>();
        }
        public void Add(T entity)
        {
            db.Set<T>().Add(entity);
            db.SaveChanges();
        }
        public void AddRange(ICollection<T> entities)
        {
            db.Set<T>().AddRange(entities);
            db.SaveChanges();
        }
        public void Remove(T entity)
        {
            db.Set<T>().Remove(entity);
            db.SaveChanges();
        }
        public void RemoveRange(ICollection<T> entities)
        {
            db.Set<T>().RemoveRange(entities);
            db.SaveChanges();
        }
        public void Update(T entity)
        {
            db.Entry(entity).State = EntityState.Modified;
            db.SaveChanges();
        }
    }
}

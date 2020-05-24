using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;
using NetCore.Data;
using NetCore.Models;

namespace NetCore.Controllers
{
    public class BaseController<T> : Controller where T:class
    {
        private readonly PrestamoDbContext context;

        public BaseController(PrestamoDbContext context)
        {
            this.context = context;
        }

        // GET: Cliente
        public async Task<IActionResult> Index()
        {
            return View(await context.Set<T>().ToListAsync());
        }

        // GET: Cliente/Details/5
        public virtual  async Task<IActionResult> Details(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var entity = await context.Set<T>().FindAsync(id); 

            if (entity == null)
            {
                return NotFound();
            }

            return View(entity);
        }

        // GET: Cliente/Create
        public IActionResult Create()
        {
            return View();
        }

        // POST: Cliente/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public virtual async Task<IActionResult> Create(T entity)
        {
            if (ModelState.IsValid)
            {
                context.Add(entity);
                await context.SaveChangesAsync();
                return RedirectToAction(nameof(Index));
            }
            return View(entity);
        }

        // GET: Cliente/Edit/5
        public async Task<IActionResult> Edit(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var entity = await context.Set<T>().FindAsync(id);
            if (entity == null)
            {
                return NotFound();
            }
            return View(entity);
        }

        // POST: Cliente/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public virtual  async Task<IActionResult> Edit(int id, T entity)
        {

            if (ModelState.IsValid)
            {
                try
                {
                    context.Update(entity);
                    await context.SaveChangesAsync();
                }
                catch (DbUpdateConcurrencyException)
                {
                    throw;
                }
                return RedirectToAction(nameof(Index));
            }
            return View(entity);
        }

        // GET: Cliente/Delete/5
        public async Task<IActionResult> Delete(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var entity = await context.Set<T>().FindAsync(id);
            if (entity == null)
            {
                return NotFound();
            }

            return View(entity);
        }

        // POST: Cliente/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public virtual async Task<IActionResult> DeleteConfirmed(int id)
        {
            var entity = await context.Set<T>().FindAsync(id);
            context.Set<T>().Remove(entity);
            await context.SaveChangesAsync();
            return RedirectToAction(nameof(Index));
        }
        
    }
}

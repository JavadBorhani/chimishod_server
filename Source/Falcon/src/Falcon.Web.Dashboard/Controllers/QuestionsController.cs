using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Threading.Tasks;
using System.Net;
using System.Web;
using System.Web.Mvc;
using Falcon.EFCommonContext.DbModel;

namespace Falcon.Web.Site.Controllers
{
    public class QuestionsController : Controller
    {
        private DbEntity db = new DbEntity();

        // GET: Questions
        public async Task<ActionResult> Index()
        {
            var questions = db.Questions.Include(q => q.Category).Include(q => q.QuestionAction).Include(q => q.QuestionBoost);
            return View(await questions.ToListAsync());
        }

        // GET: Questions/Details/5
        public async Task<ActionResult> Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Question question = await db.Questions.FindAsync(id);
            if (question == null)
            {
                return HttpNotFound();
            }
            return View(question);
        }

        // GET: Questions/Create
        public ActionResult Create()
        {
            ViewBag.Catgory_ID = new SelectList(db.Categories, "ID", "Name");
            ViewBag.ActionID = new SelectList(db.QuestionActions, "ID", "Name");
            ViewBag.QuestionBoostID = new SelectList(db.QuestionBoosts, "ID", "Name");
            return View();
        }

        // POST: Questions/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> Create([Bind(Include = "ID,What_if,But,Catgory_ID,Yes_Count,No_Count,Like_Count,Dislike_Count,Weight,CommentCount,CreatedDate,UpdateDate,Banned,QuestionBoostID,ActionID")] Question question)
        {
            if (ModelState.IsValid)
            {
                db.Questions.Add(question);
                await db.SaveChangesAsync();
                return RedirectToAction("Index");
            }

            ViewBag.Catgory_ID = new SelectList(db.Categories, "ID", "Name", question.Catgory_ID);
            ViewBag.ActionID = new SelectList(db.QuestionActions, "ID", "Name", question.ActionID);
            ViewBag.QuestionBoostID = new SelectList(db.QuestionBoosts, "ID", "Name", question.QuestionBoostID);
            return View(question);
        }

        // GET: Questions/Edit/5
        public async Task<ActionResult> Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Question question = await db.Questions.FindAsync(id);
            if (question == null)
            {
                return HttpNotFound();
            }
            ViewBag.Catgory_ID = new SelectList(db.Categories, "ID", "Name", question.Catgory_ID);
            ViewBag.ActionID = new SelectList(db.QuestionActions, "ID", "Name", question.ActionID);
            ViewBag.QuestionBoostID = new SelectList(db.QuestionBoosts, "ID", "Name", question.QuestionBoostID);
            return View(question);
        }

        // POST: Questions/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> Edit([Bind(Include = "ID,What_if,But,Catgory_ID,Yes_Count,No_Count,Like_Count,Dislike_Count,Weight,CommentCount,CreatedDate,UpdateDate,Banned,QuestionBoostID,ActionID")] Question question)
        {
            if (ModelState.IsValid)
            {
                db.Entry(question).State = EntityState.Modified;
                await db.SaveChangesAsync();
                return RedirectToAction("Index");
            }
            ViewBag.Catgory_ID = new SelectList(db.Categories, "ID", "Name", question.Catgory_ID);
            ViewBag.ActionID = new SelectList(db.QuestionActions, "ID", "Name", question.ActionID);
            ViewBag.QuestionBoostID = new SelectList(db.QuestionBoosts, "ID", "Name", question.QuestionBoostID);
            return View(question);
        }

        // GET: Questions/Delete/5
        public async Task<ActionResult> Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Question question = await db.Questions.FindAsync(id);
            if (question == null)
            {
                return HttpNotFound();
            }
            return View(question);
        }

        // POST: Questions/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> DeleteConfirmed(int id)
        {
            Question question = await db.Questions.FindAsync(id);
            db.Questions.Remove(question);
            await db.SaveChangesAsync();
            return RedirectToAction("Index");
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }
    }
}

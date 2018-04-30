package controller;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import entity.Major;

@Transactional
@Controller
@RequestMapping("/major")
public class MajorController {
	@Autowired
	SessionFactory factory;
	
	@RequestMapping()
	public String index(ModelMap model) {
		model.addAttribute("major", new Major());
		model.addAttribute("majors", getMajors());
		return "major";
	}
	
	@RequestMapping(params="btnInsert")
	public String insert(ModelMap model, @ModelAttribute("major") Major major) {
		Session session = factory.openSession();
		Transaction t = session.beginTransaction();
		try {
			session.save(major);
			t.commit();
			model.addAttribute("message", "Thêm mới thành công !");
		} 
		catch (Exception e) {
			t.rollback();
			model.addAttribute("message", "Thêm mới thất bại !");
		}
		finally {
			session.close();
		}
		model.addAttribute("majors", getMajors());
		return "major";
	}
	
	@RequestMapping(params="btnUpdate")
	public String update(ModelMap model, @ModelAttribute("major") Major major) {
		Session session = factory.openSession();
		Transaction t = session.beginTransaction();
		try {
			session.update(major);
			t.commit();
			model.addAttribute("message", "Cập nhật thành công !");
		} 
		catch (Exception e) {
			t.rollback();
			model.addAttribute("message", "Cập nhật thất bại !");
		}
		finally {
			session.close();
		}
		model.addAttribute("majors", getMajors());
		return "major";
	}
	
	@RequestMapping(params="btnDelete")
	public String delete(ModelMap model, Major major) {
		Session session = factory.openSession();
		Transaction t = session.beginTransaction();
		try {
			session.delete(major);
			t.commit();
			model.addAttribute("message", "Xóa thành công !");
		} 
		catch (Exception e) {
			t.rollback();
			model.addAttribute("message", "Xóa thất bại !");
		}
		finally {
			session.close();
		}
		model.addAttribute("major", new Major());
		model.addAttribute("majors", getMajors());
		return "major";
	}
	
	@RequestMapping("{id}")
	public String edit(ModelMap model, @PathVariable("id") String id) {
		Session session = factory.getCurrentSession();
		Major major = (Major) session.get(Major.class, id);

		model.addAttribute("major", major);
		model.addAttribute("majors", getMajors());
		return "major";
	}
	
	@SuppressWarnings("unchecked")
	public List<Major> getMajors() {
		Session session = factory.getCurrentSession();
		String hql = "FROM Major";
		Query query = session.createQuery(hql);
		List<Major> list = query.list();
		return list;
	}
        
}

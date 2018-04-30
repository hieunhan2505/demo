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
import entity.Student;
import org.springframework.web.bind.annotation.RequestParam;

@Transactional
@Controller
@RequestMapping("/student")
public class StudentController {
	@Autowired
	SessionFactory factory;
	
	@RequestMapping()
	public String index(ModelMap model) {
		model.addAttribute("student", new Student());
		model.addAttribute("students", getTopStudents());
                model.addAttribute("studentss", getTopStudentsLT());
                model.addAttribute("studentsss", getTopStudentMAR());
                model.addAttribute("studentssss", getStudents());
		return "student";
                
	}
        @RequestMapping("student_1")
        public String doi(){
            return "student_1";
        }
	
	@RequestMapping(params="btnInsert")
	public String insert(ModelMap model, @ModelAttribute("student") Student student) {
		Session session = factory.openSession();
		Transaction t = session.beginTransaction();
		try {
			session.save(student);
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
		model.addAttribute("students", getTopStudents());
                 model.addAttribute("studentss", getTopStudentsLT());
                 model.addAttribute("studentsss", getTopStudentMAR());
		return "student";
	}
	
	@RequestMapping(params="btnUpdate")
	public String update(ModelMap model, @ModelAttribute("student") Student student) {
		Session session = factory.openSession();
		Transaction t = session.beginTransaction();
		try {
			session.update(student);
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
		model.addAttribute("students", getTopStudents());
                 model.addAttribute("studentss", getTopStudentsLT());
                 model.addAttribute("studentsss", getTopStudentMAR());
		return "student";
	}
	
	
	@RequestMapping(params="btnDelete")
	public String delete(ModelMap model,@RequestParam("id") int id) {
		Session session = factory.openSession();
		Transaction t = session.beginTransaction();
		try {
                   Student student = (Student) session.get(Student.class, id);
			session.delete(student);
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
		model.addAttribute("student", new Student());
		model.addAttribute("students", getTopStudents());
                 model.addAttribute("studentss", getTopStudentsLT());
                 model.addAttribute("studentsss", getTopStudentMAR());
		return "student";
	}

	
	
	@RequestMapping("{id}")
	public String edit(ModelMap model, @PathVariable("id") Integer id) {
		Session session = factory.getCurrentSession();
		Student student = (Student) session.get(Student.class, id);

		model.addAttribute("student", student);
		model.addAttribute("students", getTopStudents());
                 model.addAttribute("studentss", getTopStudentsLT());
                 model.addAttribute("studentsss", getTopStudentMAR());
		return "student";
	}
	
	@SuppressWarnings("unchecked")
	public List<Student> getStudents() {
		Session session = factory.getCurrentSession();
		String hql = "FROM Student";
		Query query = session.createQuery(hql);
		List<Student> list = query.list();
		return list;
	}
        
        
        @SuppressWarnings("unchecked")
	public List<Student> getTopStudents() {
		Session session = factory.getCurrentSession();
                Query query = session.createQuery("from Student as o order by o.mark desc");
                query.setFirstResult(0);
                query.setMaxResults(6); 
		List<Student> list = query.list();
		return list;
	}
        @SuppressWarnings("unchecked")
	public List<Student> getTopStudentsLT() {
		Session session = factory.getCurrentSession();
                Query query = session.createQuery("from Student as o where o.major = 'MUL' order by o.mark desc");
                query.setFirstResult(0);
                query.setMaxResults(6); 
		List<Student> list = query.list();
		return list;
	}
        
         @SuppressWarnings("unchecked")
	public List<Student> getTopStudentMAR() {
		Session session = factory.getCurrentSession();
                Query query = session.createQuery("from Student as o where o.major = 'MAR' order by o.mark desc");
                query.setFirstResult(0);
                query.setMaxResults(6); 
		List<Student> list = query.list();
		return list;
	}
        
        
        
        
        

    @ModelAttribute("majors")
    @SuppressWarnings("unchecked")
    public List<Major> getMajors() {
        Session session = factory.getCurrentSession();
        String hql = "FROM Major";
        Query query = session.createQuery(hql);
        List<Major> list = query.list();
        return list;
    }
	
}

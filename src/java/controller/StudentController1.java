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
import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

@Transactional
@Controller
@RequestMapping("/student_1")
public class StudentController1 {

    @Autowired
    SessionFactory factory;
    @Autowired
    ServletContext context;

    @RequestMapping()
    public String index(ModelMap model) {
        model.addAttribute("student", new Student());
        model.addAttribute("students", getTopStudents());
        model.addAttribute("studentss", getTopStudentsLT());
        model.addAttribute("studentsss", getTopStudentMAR());
        return "student_1";

    }

    @RequestMapping(params = "insert", method = RequestMethod.POST)
    public String insert(ModelMap model, @ModelAttribute("student") Student student, @RequestParam("avatar") MultipartFile avatar, HttpServletRequest request) throws Exception {
        Calendar cal = Calendar.getInstance();
        Date date = cal.getTime();
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd");
        String ngayhientai = sdf.format(date);
        student.setNgaydanhgia(date);
        Session session = factory.openSession();
        Transaction t = session.beginTransaction();
        String photo;
        try {
            if (avatar.isEmpty() || avatar.getOriginalFilename().equalsIgnoreCase("nv.png")) {
                photo = "img/nv.png";
            } else {

                if (student.getMark() > 10) {
                    model.addAttribute("messagee", "Điểm không được quá hơn 10");
                    model.addAttribute("students", getTopStudents());
                    model.addAttribute("studentss", getTopStudentsLT());
                    model.addAttribute("studentsss", getTopStudentMAR());
                    return "student_1";

                }
                String photoPath = context.getRealPath("/img/" + avatar.getOriginalFilename());
                File file = new File(photoPath + avatar.getOriginalFilename());
                File renameFile = new File(photoPath);
                avatar.transferTo(renameFile);
                if (file.exists()) {
                    file.delete();
                }
                photo = renameFile.getName();
            }
            student.setPhoto(photo);

            //Insert Object Data
            session.save(student);
            t.commit();
            model.addAttribute("message", "Thêm mới thành công !");

        } catch (Exception e) {
            t.rollback();
            model.addAttribute("message", "Thêm mới thất bại !" + e);
        } finally {
            session.close();
        }
        model.addAttribute("students", getTopStudents());
        model.addAttribute("studentss", getTopStudentsLT());
        model.addAttribute("studentsss", getTopStudentMAR());
        return "student_1";
    }

    @RequestMapping(params = "btnUpdate")
    public String update(ModelMap model, @ModelAttribute("student") Student student, @RequestParam("txtimg") String img, HttpServletRequest request) {
        Session session = factory.openSession();
        Transaction t = session.beginTransaction();
       

        String image = request.getParameter("txtimg");
        try {
        
            student.setPhoto(image);
            if (student.getMark() > 10) {
                model.addAttribute("message", "Điểm không được lớn hơn 10");
            }
            session.update(student);    
            t.commit();
            model.addAttribute("message", "Cập nhật thành công !");

        } catch (Exception e) {
            t.rollback();
            model.addAttribute("message", "Cập nhật thất bại !");
        } finally {
            session.close();
        }
        model.addAttribute("students", getTopStudents());
        model.addAttribute("studentss", getTopStudentsLT());
        model.addAttribute("studentsss", getTopStudentMAR());
        return "student_1";
    }

    @RequestMapping(params = "btnCapNhat")
    public String capnhat(ModelMap model, @ModelAttribute("student") Student student, HttpServletRequest request, @RequestParam("txtimg") String img) {
        Session session = factory.openSession();
        Transaction t = session.beginTransaction();
        double mark = Double.parseDouble(request.getParameter("txtTru"));
        String image = request.getParameter("txtimg");

        try {
            student.setMark(mark);
            student.setPhoto(image);

            if (student.getMark() > 10) {
                model.addAttribute("message", "Điểm không được lớn hơn 10");
            }
            session.update(student);
            t.commit();
            model.addAttribute("message", "Cập nhật thành công !");
        } catch (Exception e) {
            t.rollback();
            model.addAttribute("message", "Cập nhật thất bại !");
        } finally {
            session.close();
        }
        model.addAttribute("students", getTopStudents());
        model.addAttribute("studentss", getTopStudentsLT());
        model.addAttribute("studentsss", getTopStudentMAR());
        return "student_1";
    }

    @RequestMapping(params = "btnKhen")
    public String khen(ModelMap model, @ModelAttribute("student") Student student, HttpServletRequest request, @RequestParam("txtimg") String img) {
        Session session = factory.openSession();
        Transaction t = session.beginTransaction();
        double mark = Double.parseDouble(request.getParameter("txtCong"));
        String image = request.getParameter("txtimg");

        try {
            student.setMark(mark);
            student.setPhoto(image);

            if (student.getMark() > 10) {
                model.addAttribute("message", "Điểm không được lớn hơn 10");
            }
            session.update(student);
            t.commit();
            model.addAttribute("message", "Cập nhật thành công !");
        } catch (Exception e) {
            t.rollback();
            model.addAttribute("message", "Cập nhật thất bại !");
        } finally {
            session.close();
        }
        model.addAttribute("students", getTopStudents());
        model.addAttribute("studentss", getTopStudentsLT());
        model.addAttribute("studentsss", getTopStudentMAR());
        return "student_1";
    }

    @RequestMapping(params = "btnDelete")
    public String delete(ModelMap model, @RequestParam("id") int id) {
        Session session = factory.openSession();
        Transaction t = session.beginTransaction();
        try {
            Student student = (Student) session.get(Student.class, id);
            session.delete(student);
            t.commit();
            model.addAttribute("message", "Xóa thành công !");
        } catch (Exception e) {
            t.rollback();
            model.addAttribute("message", "Xóa thất bại !");
        } finally {
            session.close();
        }
        model.addAttribute("student", new Student());
        model.addAttribute("students", getTopStudents());
        model.addAttribute("studentss", getTopStudentsLT());
        model.addAttribute("studentsss", getTopStudentMAR());
        return "student_1";
    }

    @RequestMapping("{id}")
    public String edit(ModelMap model, @PathVariable("id") Integer id) {
        Session session = factory.getCurrentSession();
        Student student = (Student) session.get(Student.class, id);

        model.addAttribute("student", student);
        model.addAttribute("students", getTopStudents());
        model.addAttribute("studentss", getTopStudentsLT());
        model.addAttribute("studentsss", getTopStudentMAR());
        return "student_1";
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

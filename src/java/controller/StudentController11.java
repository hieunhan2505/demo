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
import java.util.Calendar;
import java.util.Date;
import javax.mail.internet.MimeMessage;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import org.apache.commons.io.FilenameUtils;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

@Transactional
@Controller
@RequestMapping("/thanhtich")
public class StudentController11 {

    @Autowired
    SessionFactory factory;
    @Autowired
    ServletContext context;
    @Autowired
    JavaMailSender mailer;

    @RequestMapping("student")
    public String quaylai(ModelMap model) {
        model.addAttribute("student", new Student());
        model.addAttribute("students", getTopStudents());
        model.addAttribute("studentss", getTopStudentsLT());
        model.addAttribute("studentsss", getTopStudentMAR());
        model.addAttribute("studentssss", getStudents());
        return "student";

    }

    @RequestMapping()
    public String index(ModelMap model) {
        model.addAttribute("student", new Student());
        model.addAttribute("students", getTopStudents());
        model.addAttribute("studentss", getTopStudentsLT());
        model.addAttribute("studentsss", getTopStudentMAR());
        return "student";

    }

    @RequestMapping("send")
    public String send(ModelMap model, @RequestParam("from") String from,
            @RequestParam("to") String to,
            @RequestParam("subject") String subject,
            @RequestParam("body") String body) {
        try {
// Tạo mail    
            MimeMessage mail = mailer.createMimeMessage();
// Sử dụng lớp trợ giúp   
            MimeMessageHelper helper = new MimeMessageHelper(mail);
            helper.setFrom(from, from);
            helper.setTo(to);
            helper.setReplyTo(from, from);
            helper.setSubject(subject);
            helper.setText(body, true);

            // Gửi mail   
            mailer.send(mail);
            model.addAttribute("message", "Gửi email thành công !");
        } catch (Exception ex) {
            model.addAttribute("message", "Gửi email thất bại !");
        }
        return "sendmail";
    }

    @RequestMapping(params = "btnCapNhat")
    public String capnhat(ModelMap model, @ModelAttribute("student") Student student, HttpServletRequest request, @RequestParam("txtimg") String img) {
        Session session = factory.openSession();
        Transaction t = session.beginTransaction();
        double mark = Double.parseDouble(request.getParameter("txtTru"));

        double kyluat = Double.parseDouble(request.getParameter("txtKyluat"));
        String image = request.getParameter("txtimg");

        try {
            student.setMark(mark);
            student.setPhoto(image);

            student.setKyluat(kyluat);

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
        return "thanhtich";
    }

    @RequestMapping(params = "btnKhen")
    public String khen(ModelMap model, @ModelAttribute("student") Student student, HttpServletRequest request, @RequestParam("txtimg") String img) {
        Session session = factory.openSession();
        Transaction t = session.beginTransaction();
        double mark = Double.parseDouble(request.getParameter("txtCong"));
        double thanhtich = Double.parseDouble(request.getParameter("txtThanhtich"));
        String image = request.getParameter("txtimg");

        try {
            student.setMark(mark);
            student.setPhoto(image);
            student.setThanhtich(thanhtich);

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
        return "thanhtich";
    }

    @RequestMapping("{id}")
    public String edit(ModelMap model, @PathVariable("id") Integer id) {
        Session session = factory.getCurrentSession();
        Student student = (Student) session.get(Student.class, id);

        model.addAttribute("student", student);
        model.addAttribute("students", getTopStudents());
        model.addAttribute("studentss", getTopStudentsLT());
        model.addAttribute("studentsss", getTopStudentMAR());
        return "thanhtich";
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

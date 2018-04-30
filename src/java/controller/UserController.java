package controller;

import entity.Student;
import entity.User;
import java.util.List;
import javax.mail.internet.MimeMessage;

import javax.servlet.http.HttpSession;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Transactional
@Controller
@RequestMapping("/user/")
public class UserController {

    @Autowired
    SessionFactory factory;
 @Autowired
    JavaMailSender mailer;
    @RequestMapping("list")
    public String list(ModelMap model) {
        Session session = factory.getCurrentSession();
        String hql = "FROM User";
        Query query = session.createQuery(hql);
        List<User> list = query.list();
        model.addAttribute("users", list);
        return "user/list";
    }

    @RequestMapping("index")
    public String index() {
        return "user/index";
    }

    @RequestMapping("detail/{id}")
    public String detail(ModelMap model, @PathVariable("id") String id) {
        Session session = factory.getCurrentSession();
        User user = (User) session.get(User.class, id);
        model.addAttribute("user", user);
        return "user/detail";
    }
 

    @RequestMapping("delete/{id}")
    public String delete(ModelMap model, @PathVariable("id") String id) {
        Session session = factory.getCurrentSession();
        User user = (User) session.get(User.class, id);
        session.delete(user);
        return "redirect:/user/list.htm";
    }

    @RequestMapping("register")
    public String register(ModelMap model) {
        model.addAttribute("user", new User());
        return "user/register";
    }
    @RequestMapping("form/{id}")
	public String form(ModelMap model, @PathVariable("id") String id) {
		Session session = factory.getCurrentSession();
		User user = (User) session.get(User.class, id);
		model.addAttribute("user", user);
		return "user/form";
	}

    @RequestMapping(value = "register", method = RequestMethod.POST)
    public String register(ModelMap model, @ModelAttribute("user") User user) {
        Session session = factory.openSession();
        Transaction t = session.beginTransaction();
        try {
            session.save(user);
            t.commit();
            model.addAttribute("message", "Đăng ký thành công !");
        } catch (Exception e) {
            t.rollback();
            model.addAttribute("message", "Không thể đăng ký !");
        } finally {
            session.close();
        }
        return "user/register";
    }

    @RequestMapping("login")
    public String login() {
        return "user/login";
    }
 

    @RequestMapping(value = "login", method = RequestMethod.POST)
    public String login(ModelMap model,
            @RequestParam("id") String id,
            @RequestParam("password") String password,
            HttpSession httpSession) {
        Session session = factory.getCurrentSession();
        
		model.addAttribute("student", new Student());
		model.addAttribute("students", getTopStudents());
        try {
            User user = (User) session.get(User.class, id);
            if (!user.getPassword().equals(password)) {
                model.addAttribute("messagee", "PassWord Fsail !");
            } else {
                httpSession.setAttribute("user", user);
                return "user/index";
            }
        } catch (Exception e) {
            model.addAttribute("message", "Username Fail");
        }

        return "user/login";
    }



    @RequestMapping("logoff")
    public String logoff(HttpSession httpSession) {
        httpSession.removeAttribute("user");
        return "redirect:/user/login.htm";
    }

    @RequestMapping("change")
    public String change() {
        return "user/change";
    }

    @RequestMapping(value = "change", method = RequestMethod.POST)
    public String change(ModelMap model,
            @RequestParam("id") String id,
            @RequestParam("password") String password,
            @RequestParam("newpass1") String newpass1,
            @RequestParam("newpass2") String newpass2) {
        if (!newpass1.equals(newpass2)) {
            model.addAttribute("message", "Xác nhận mật khẩu mới không đúng !");
        } else {
            Session session = factory.getCurrentSession();
            try {
                User user = (User) session.get(User.class, id);
                if (!user.getPassword().equals(password)) {
                    model.addAttribute("message", "Sai mật khẩu !");
                } else {
                    model.addAttribute("message", "Mật khẩu đã được đỏi !");
                    user.setPassword(newpass2);
                }
            } catch (Exception e) {
                model.addAttribute("message", "Sai tên đăng nhập !");
            }
        }
        return "user/change";
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
        @RequestMapping("sendmail")
        public String sendmail(){
            return "user/requestmail";
        }
     
    @SuppressWarnings("unchecked")
	public List<User> getUsers() {
		Session session = factory.getCurrentSession();
		String hql = "FROM User";
		Query query = session.createQuery(hql);
		List<User> list = query.list();
		return list;
	}
        
    @RequestMapping(value = "checkmail", method = {RequestMethod.GET, RequestMethod.POST})
    public String search(ModelMap model, @RequestParam(value = "txtemail", defaultValue = "") String email) {
        String hql = "FROM User WHERE email LIKE :email ";
        System.out.println("SEARCH: " + email);
        Session session = factory.openSession();
        session.getTransaction().begin();
        Query query = session.createQuery(hql);
        query.setParameter("email", "%" + email + "%");
        List<User> list = query.list();
        model.addAttribute("users", list);
        if(email.equalsIgnoreCase("")){
             model.addAttribute("message", "Không có email nào");
        return "user/requestmail"; 
        }
        if(list.isEmpty()){
            model.addAttribute("message", "Không có email nào");
        return "user/requestmail";    
        }
        else if(list.equals("")){
          model.addAttribute("message", "Không có email nào");
        return "user/requestmail";  
        }
        else{
        model.addAttribute("message", "Email Tồn Tại");
        model.addAttribute("user", list);
        }
        return "user/Send";
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
String chuoi = "Mật Khẩu của bạn là : ";
            MimeMessageHelper helper = new MimeMessageHelper(mail);
            helper.setFrom(from, from);
            helper.setTo(to);
            helper.setReplyTo(from, from);
            helper.setSubject(subject);
            helper.setText(chuoi+body, true);

            // Gửi mail   
            mailer.send(mail);
            model.addAttribute("message", "Gửi email thành công !");
        } catch (Exception ex) {
            model.addAttribute("message", "Gửi email thất bại !");
        }
        return "user/Send";
    }
}

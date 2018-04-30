package controller;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

@Transactional
@Controller
@RequestMapping("/report/")
public class ReportController {
	@Autowired
	SessionFactory factory;
	
	@RequestMapping("by-major")
	public String list(ModelMap model) {
		Session session = factory.getCurrentSession();
		String hql = "SELECT s.major.name, COUNT(s), MIN(s.mark), MAX(s.mark), AVG(s.mark),SUM(s.mark) FROM Student s GROUP BY s.major.name";
		Query query = session.createQuery(hql);
		List<Object[]> list = query.list();
		model.addAttribute("arrays", list);
		return "report/by-major";
	}
}

package com.guest.honolja.main;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;



@Controller
public class MainController {
	
	private static final Logger logger = LoggerFactory.getLogger(MainController.class);

	@Autowired
	MainDAO dao;
	
	@Autowired
	HttpSession session;
	
	@RequestMapping("/main.do")
	public ModelAndView main_page() {
		ModelAndView mav = new ModelAndView();
			mav.setViewName("/main/main");
		return mav;
	}
	
	@RequestMapping("/popup.do")
	public ModelAndView main_login_popup(HttpServletRequest request) {
		
		String id = request.getParameter("id");
		String pwd = request.getParameter("pwd");
		
		String scriptMsg;
		
		ModelAndView mav = new ModelAndView();
			mav.setViewName("/main/login_popup");
		
		int idCheck = 1; //0 ���� �ٲ� �� ���� �׽�Ʈ �� 1;
		//int idCheck = dao.dbSelect ���̵� üũ ;
		
		//if(idCheck > 0) {
		if(id == "sky") {
			session.setAttribute("checked", id);
			session.setMaxInactiveInterval(3600); // �α��� �ð� 1�ð� �ο�
			
			scriptMsg = "<script type=\"text/javascript\">";
			scriptMsg += "opener.location.href = \"main.do\";";
			scriptMsg += "self.close();";
			scriptMsg += "</script>";
			
		}else {	
			scriptMsg = "<script type='text/javascript'>";
			scriptMsg = "alert('���̵� �Ǵ� ��й�ȣ�� Ʋ�Ƚ��ϴ�.');";
			scriptMsg += "</script>";
		}
		
		mav.addObject("script", scriptMsg);
		
		return mav;
	}
	
	@RequestMapping("/test.do")
	public ModelAndView main_test() {
		
		ModelAndView mav = new ModelAndView();
			mav.setViewName("/main/test");
			mav.addObject("test", "class='active'");
			
		return mav;
	}
	
}

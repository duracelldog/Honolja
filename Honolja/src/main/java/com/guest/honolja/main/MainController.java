package com.guest.honolja.main;

import java.io.PrintWriter;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.util.WebUtils;



@Controller
public class MainController {
	
	private static final Logger logger = LoggerFactory.getLogger(MainController.class);

	@Autowired
	MainDAO dao;
	
	@RequestMapping("/main.do")
	public ModelAndView main_page(Model model) {
		
		ModelAndView mav = new ModelAndView();
			mav.setViewName("/main/main");;
			
		return mav;
	}
	
	@RequestMapping("/popup.do")
	public ModelAndView main_login_popup(HttpServletRequest request, Model model) {
		
		String id = request.getParameter("id");
		String pwd = request.getParameter("pwd");
		String host =  request.getParameter("host");

		HttpSession session = request.getSession();
		
		if(id == null) {
			id = "";
		}			
		
		String scriptMsg = null;
		String alertMsg = null;
		
		ModelAndView mav = new ModelAndView();
			mav.setViewName("/main/login_popup");
		
		int idCheck = 1; //0 ���� �ٲ� �� ���� �׽�Ʈ �� 1;
		//int idCheck = dao.dbSelect ���̵� üũ ;
		
		//if(idCheck > 0) {
		if(id.equals("sky")) {
			
			model.addAttribute("checked", id);
			
			alertMsg = "�α��� ����!";
				
			scriptMsg = "opener.parent.location='"+host+"';";
			scriptMsg += "self.close();";
			
			
			
		}else {	
			alertMsg = "���̵� �Ǵ� ��й�ȣ�� Ʋ�Ƚ��ϴ�.";
		}
		
			//JavaScript ���� ����
			mav.addObject("scriptMsg", scriptMsg);
			mav.addObject("alertMsg", alertMsg);
			
		//�� �α��� ���¿���, ���̵� ��� ���� ��Ű�� �������� ��� ���̵� �� ����
		if(session.getAttribute("checked") == null) {
			try {
				Cookie loginCookie = WebUtils.getCookie(request, "loginCookie");
				mav.addObject("loginCookie", loginCookie.getValue());
			}catch (Exception e) {
				// TODO: handle exception
			}
		}
			
			
		
		return mav;
	}
	
	@RequestMapping("/header.do")
	public ModelAndView common_header() {
			
		ModelAndView mav = new ModelAndView();
			mav.setViewName("/main/header");

		return mav;		
	}
	
	@RequestMapping("/logout.do")
	public String common_logout(HttpSession session, HttpServletRequest request, HttpServletResponse response) {
	
		
		if(session.getAttribute("checked") != null) {
			session.removeAttribute("checked");
			session.invalidate();
			
			//Cookie loginCookie = WebUtils.getCookie(request, "loginCookie");
			
			//if(loginCookie != null) {
			//	loginCookie.setMaxAge(0);
			//response.addCookie(loginCookie);
			
			//}
		}
		
		return "/main/logout";
	}
	
	@RequestMapping("/test.do")
	public ModelAndView main_test() {
		
		ModelAndView mav = new ModelAndView();
			mav.setViewName("/main/test");
			mav.addObject("test", "class='active'");
			
		return mav;
	}
	
}

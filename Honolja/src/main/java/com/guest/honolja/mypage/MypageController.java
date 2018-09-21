package com.guest.honolja.mypage;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.guest.honolja.member.MemberDTO;

@Controller
public class MypageController {
	@Autowired
	MypageDAO dao;
	
	private static final Logger logger = LoggerFactory.getLogger(MypageController.class);
	
	@RequestMapping("/mypage.do")
	public String mypage() {
		return "/mypage/mypage_menu";
	}//mypage end
	
	
	//ȸ������
	@RequestMapping("/mypageuser.do")
	public ModelAndView mypageuser(HttpSession session) {
		ModelAndView mav = new ModelAndView();
		MemberDTO mto = new MemberDTO();
		String u_id = session.getAttribute("checked").toString();
			mto = dao.mypageselect(u_id);
			mav.addObject("mto", mto);
			mav.setViewName("/mypage/mypageuser");
		return mav;
	}//end
	
<<<<<<< HEAD
=======
	//ȸ������
	@RequestMapping("/useredit.do")
	public ModelAndView useredit(HttpSession session) {
		ModelAndView mav = new ModelAndView();
		String u_id = (String)session.getAttribute("checked");
		MemberDTO mto = dao.useredit(u_id);
		mav.addObject("mto", mto);
		mav.setViewName("mypage/useredit");
		return mav;
	}//end
	
	//ȸ������ ����
	@RequestMapping("/usereditsave.do")
	public String usereditsave(MemberDTO mto) {
		dao.usereditsave(mto);
		return "redirect:useredit.do";
	}//end
	
>>>>>>> branch 'master' of https://github.com/duracelldog/Honolja
	//ȸ��Ż��
	@RequestMapping("/mypageDelete.do")
	public ModelAndView mypage_delete(HttpSession session) {
		String u_id = session.getAttribute("checked").toString();
		String u_pwd = dao.mypageDelete(u_id);
		ModelAndView mav = new ModelAndView();
		mav.addObject("u_pwd", u_pwd);
		mav.setViewName("mypage/mypageDelete");

		return mav;
	}// end
	
	//ȸ��delete
	@RequestMapping("m_delete.do")
	public String m_delete(HttpSession session, MemberDTO mto) {
		mto.setU_id(session.getAttribute("checked").toString());
		dao.m_delete(mto);
		session.invalidate(); //���ǻ���
		
		return "redirect:main.do";
	}//end

}

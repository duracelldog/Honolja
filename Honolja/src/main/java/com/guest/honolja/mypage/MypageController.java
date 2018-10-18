package com.guest.honolja.mypage;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.guest.honolja.board.BoardDTO;
import com.guest.honolja.list.ListDTO;
import com.guest.honolja.member.MemberDTO;
import com.guest.honolja.reservation.ReservationDTO;

@Controller
public class MypageController {
	@Autowired
	MypageDAO dao;
	
	private static final Logger logger = LoggerFactory.getLogger(MypageController.class);
	
	//���������� �޴���
	@RequestMapping("/mypage.do")
	public String mypage() {
		return "/mypage/mypage_menu";
	}//mypage end
	
	
	//���� �� ��
	@RequestMapping("/mypage_board.do")
	public ModelAndView mypage_board(HttpSession session) {
		ModelAndView mav = new ModelAndView();
		String u_id = (String)session.getAttribute("checked");
		List<BoardDTO> listB = dao.mypage_board(u_id);
		mav.addObject("listB", listB);
		mav.setViewName("/mypage/mypage_board");
		return mav;
	}//end
	
	//�� ���
	@RequestMapping("/mypage_like.do")
	public ModelAndView mypage_like(HttpSession session) {
		ModelAndView mav = new ModelAndView();
		String u_id = (String)session.getAttribute("checked");
		List<ListDTO> listL = dao.mypage_like(u_id);
		mav.addObject("listL", listL);
		mav.setViewName("/mypage/mypage_like");
		return mav;
	}//end
	
	//���� ��Ȳ
	@RequestMapping("/mypage_rsvt.do")
	public ModelAndView mypage_rsvt(HttpSession session) {
		ModelAndView mav = new ModelAndView();
		String u_id = (String)session.getAttribute("checked");
		List<ReservationDTO> listRS = dao.mypage_rsvt(u_id);
		mav.addObject("listRS", listRS);
		mav.setViewName("/mypage/mypage_rsvt");
		return mav;
	}//end
	
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

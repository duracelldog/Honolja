package com.guest.honolja.mypage;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.guest.honolja.member.MemberDTO;

@Repository
public class MypageDAO {
	
	@Autowired
	SqlSessionTemplate temp;
	
	//ȸ������
	public MemberDTO mypageselect(String u_id) {
		MemberDTO mto = new MemberDTO();
		mto = temp.selectOne("mypage.mypageselect", u_id);
		return mto;

	}//end
	
	//ȸ������
	public MemberDTO useredit(String u_id) {
		MemberDTO mto = new MemberDTO();
		mto = temp.selectOne("mypage.useredit", u_id);
		return mto;
	}//end
	
	//ȸ������ ����
	public void usereditsave(MemberDTO mto) {
		temp.update("mypage.usereditsave", mto);
	}

	
	//ȸ��Ż��
	public String mypageDelete(String u_id) {
		String u_pwd = temp.selectOne("mypage.mypagedelete", u_id);
		return u_pwd;
	}//end
	
	//ȸ��delete
	public void m_delete(MemberDTO mto) {
		temp.delete("mypage.m_delete", mto);
	}//end

}

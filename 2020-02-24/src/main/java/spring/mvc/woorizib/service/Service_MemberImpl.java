package spring.mvc.woorizib.service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import spring.mvc.woorizib.persistence.DAO_All;
import spring.mvc.woorizib.vo.VO_Member;

@Service
public class Service_MemberImpl implements Service_Member{
	
	@Autowired
	DAO_All daoAll;
	
	@Autowired
	BCryptPasswordEncoder passwordEncoder;	// 스프링 암호화
	
	/* ▶ 회원수정 및 탈퇴 */
	
	/* 전영현 2020.02.13 */
	
	//회원정보 수정 화면 
	@Override
	public void modifyView(HttpServletRequest req, Model model) {
		String strId=(String)req.getSession().getAttribute("memID");
		//String strPwd=req.getParameter("member_pw");
		
		//String pwd=daoAll.pwdCheck(strId);
		
		//int selectCnt=0;
		//if(passwordEncoder.matches(strPwd, pwd)) {
			//selectCnt=1;
			VO_Member vo=daoAll.readMember(strId);
			model.addAttribute("vo", vo);
	
		//}
		
		//model.addAttribute("dto", vo);
	
	}

	//회원정보 수정 처리 
	@Override
	public void updateMemberPro(HttpServletRequest req, Model model) {
		String strId=(String)req.getSession().getAttribute("memID");	
		
		String member_pw=req.getParameter("member_pw");
		String member_hp=req.getParameter("member_hp");
		String encodepwd = passwordEncoder.encode(member_pw);
		
		VO_Member vo=new VO_Member();
		
		vo.setMem_id(strId);
		vo.setMem_pw(encodepwd);
		vo.setMem_phone(member_hp);
		
		int updateCnt=daoAll.updateMember(vo);
		model.addAttribute("updateCnt", updateCnt);
		
	}

	//회원탈퇴 처리 
	@Override
	public void deleteMemberPro(HttpServletRequest req, Model model) {
		String strId=(String)req.getSession().getAttribute("memID");
		
		String strPwd=req.getParameter("member_pw");
		
		String pwd=daoAll.pwdCheck(strId);

		int deleteCnt=0;
		int selectCnt=0;
		
		if(passwordEncoder.matches(strPwd, pwd)) {
			selectCnt = 1;
			deleteCnt=daoAll.deleteMember(strId);
		}
		
		model.addAttribute("selectCnt", selectCnt);
		model.addAttribute("deleteCnt", deleteCnt);
		
	}
	/* 전영현 2020.02.13 */
	
	/* ▶ 회원수정 및 탈퇴 */
	

	
}

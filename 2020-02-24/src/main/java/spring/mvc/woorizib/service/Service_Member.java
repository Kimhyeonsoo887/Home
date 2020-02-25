package spring.mvc.woorizib.service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

public interface Service_Member {
	
	/* ▶ 회원수정 및 탈퇴 */
	/* 전영현 2020.02.13 */
	
	//회원정보 수정화면 
	public void modifyView(HttpServletRequest req, Model model);	
	//회원정보 수정 처리
	public void updateMemberPro(HttpServletRequest req, Model model);	
	//회원탈퇴 처리 
	public void deleteMemberPro(HttpServletRequest req, Model model);
	
	/* 전영현 2020.02.13 */
	/* ▶ 회원수정 및 탈퇴 */
		
}

package spring.mvc.bridge.service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

public interface Service_Main {
	
	public void signup(HttpServletRequest req, Model model);
	
	//회원수정 및 탈퇴 ----------------------전영현
	
	//회원정보 수정화면 
	public void modifyView(HttpServletRequest req, Model model);
	
	//회원정보 수정 처리
	public void updateMemberPro(HttpServletRequest req, Model model);
	
	//회원탈퇴 처리 
	public void deleteMemberPro(HttpServletRequest req, Model model);
	
	//------------------------------------문성혁

	//아이디 찾기
	public void find_account(HttpServletRequest req, Model model);
	
	//비밀번호 변경 링크보내기
	public void change_password(HttpServletRequest req, Model model);
//	
	//비밀번호 변경 처리
	public void change_passoword_page_pro(HttpServletRequest req, Model model);
}

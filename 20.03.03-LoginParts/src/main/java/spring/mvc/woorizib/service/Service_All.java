package spring.mvc.woorizib.service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartHttpServletRequest;

public interface Service_All {
	
	/* 20.02.26 - 회원가입, 아이디 & 비밀번호 인증 */
	//회원가입
	public void signup(HttpServletRequest req, Model model);
	//셀러회원가입
	public void signupSeller(MultipartHttpServletRequest req, Model model);
	//회원가입 중복확인
	public void signupconfirmid(HttpServletRequest req, Model model);
	
	//아이디 찾기
	public void find_account(HttpServletRequest req, Model model);
	//비밀번호 변경 링크보내기
	public void change_password(HttpServletRequest req, Model model);	
	//비밀번호 변경 처리
	public void change_passoword_page_pro(HttpServletRequest req, Model model);
	
	//멤버 이메일 인증(certification 업데이트)
	public void membercertification(HttpServletRequest req, Model model);
	//셀러 이메일 인증(certification 업데이트)
	public void sellercertification(HttpServletRequest req, Model model);
	/* 20.02.26 - 회원가입, 아이디 & 비밀번호 인증 */
	
	

}

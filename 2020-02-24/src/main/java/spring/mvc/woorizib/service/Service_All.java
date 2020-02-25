package spring.mvc.woorizib.service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

public interface Service_All {
	
	
	/* ▶ 로그인 메뉴 */
	/* 문성혁 2020.02.13 */

	//회원가입
	public void signup(HttpServletRequest req, Model model);
	//아이디 찾기
	public void find_account(HttpServletRequest req, Model model);	
	//비밀번호 변경 링크보내기
	public void change_password(HttpServletRequest req, Model model);	
	//비밀번호 변경 처리
	public void change_passoword_page_pro(HttpServletRequest req, Model model);
	
	/* 문성혁 2020.02.13 */
	/* ▶ 로그인 메뉴 */
}

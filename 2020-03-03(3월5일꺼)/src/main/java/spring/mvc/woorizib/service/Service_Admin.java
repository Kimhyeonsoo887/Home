package spring.mvc.woorizib.service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

public interface Service_Admin {

	void signupAdmin(HttpServletRequest req, Model model);

	// ---------------------------------------2020.02.26 유기복
	// 셀러 승인관리
	public void admin_approveseller(HttpServletRequest req, Model model);

	// 셀러 승인관리 (검색 기능 및 셀러승인)
	public void admin_approvesellerSearchAuth(HttpServletRequest req, Model model);

	// 회원상태 관리
	public void admin_administratemembers(HttpServletRequest req, Model model);

	// 회원상태 관리 (검색)
	public void admin_administratemembersSearch(HttpServletRequest req, Model model);

	// 불량회원 신고관리
	public void admin_report(HttpServletRequest req, Model model);

	// 불량회원 신고관리(검색 기능 및 신고누적수정)
	public void admin_reportSearchModifycnt(HttpServletRequest req, Model model);

	// ---------------------------------------2020.02.26 유기복 END

}

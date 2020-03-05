package spring.mvc.woorizib.controller;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import spring.mvc.woorizib.service.Service_Admin;
import spring.mvc.woorizib.service.Service_All;


@Controller
public class Controller_Admin {
	
private static final Logger logger = LoggerFactory.getLogger(Controller_Admin.class);

	@Autowired
	Service_Admin serviceAdmin;
	
	/* 20.02.24 - 문성혁, 호스트 회원가입 - 평소 비활성화 처리해놓기 */
//	@RequestMapping("/admin_signup.all")
//	public String admin_signup() {
//		logger.info("▶ /admin_signup.adm");
//		
//		return "admin/admin_signup";
//	}
//	@RequestMapping("/admin_signup_pro.all")
//	public String admin_signup_pro(HttpServletRequest req, Model model) {
//		logger.info("▶ /admin_signup_pro.adm");
//		
//		serviceAdmin.signupAdmin(req, model);
//		
//		return "admin/admin_signup_pro";
//	}
	/* 20.02.24 - 문성혁, 호스트 회원가입 - 평소 비활성화 처리해놓기 */

	/* 김현수 */
	//호스트 메인화면
	@RequestMapping("/admin_index.all")
	public String admin_index(HttpServletRequest req, Model model) {
		logger.info("▶ /admin_index.adm");
		
		return "admin/admin_index";
	}
	/* 김현수 */
	
	
	
	/* 2020.02.26 유기복  */
	//셀러 승인관리
	@RequestMapping("/admin_approveseller.all")    
	public String admin_approveseller(HttpServletRequest req, Model model) {	
		logger.info("▶ /admin_approveseller.adm");
		serviceAdmin.admin_approveseller(req, model);
		return "admin/admin_approveseller"; 
	}
	//셀러 승인관리 (검색 기능 및 권한승인)
	@RequestMapping("/admin_approvesellerSearchAuth.all")    
	public String admin_approvesellerSearchAuth(HttpServletRequest req, Model model) {	
		logger.info("▶ /admin_approvesellerSearchAuth.adm");
		serviceAdmin.admin_approvesellerSearchAuth(req, model);
		String authoriZation = req.getParameter("authoriZation");
		
		if(authoriZation==null) {			
			return "admin/admin_approveseller"; 
		}
		System.out.println("2_authoriZation : " + authoriZation);
		return "admin/admin_approvesellerAuth";
	}
		
	//회원상태 관리
	@RequestMapping("/admin_administratemembers.all")
	public String admin_administratemembers(HttpServletRequest req, Model model) {	
		logger.info("▶ /admin_administratemembers.adm");
		serviceAdmin.admin_administratemembers(req, model);
		return "admin/admin_administratemembers";
	}
	//회원상태 관리 검색
	@RequestMapping("/admin_administratemembersSearch.all")
	public String admin_administratemembersSearch(HttpServletRequest req, Model model) {	
		logger.info("▶ /admin_administratemembersSearch.adm");
		serviceAdmin.admin_administratemembersSearch(req, model);
		return "admin/admin_administratemembers";
	}
	
	//불량회원 신고관리
	@RequestMapping("/admin_report.all")
	public String admin_report(HttpServletRequest req, Model model) {	
		logger.info("▶ /admin_report.adm");
		serviceAdmin.admin_report(req, model);
		return "admin/admin_report";
	}
	//불량회원 신고관리 (검색 기능 및 신고누적수정)
	@RequestMapping("/admin_reportSearchModifycnt.all")    
	public String admin_reportSearchModifycnt(HttpServletRequest req, Model model) {	
		logger.info("▶ /admin_reportSearchModifycnt.adm");
		serviceAdmin.admin_reportSearchModifycnt(req, model);
		String reportModifyCnt = req.getParameter("reportModifyCnt");
		
		if(reportModifyCnt==null) {			
			return "admin/admin_report"; 
		}
		System.out.println("reportModifyCnt : " + reportModifyCnt);
		return "admin/admin_reportModifycnt";
	}
	//셀러입점 신청서 - 보류중
//	@RequestMapping("/sellerApply.all")
//	public String sellerApply(HttpServletRequest req, Model model) {	
//		logger.info("▶ sellerApply.all");
//		
//		return "admin/sellerApply";
//	}
//=================	/* 2020.02.26 유기복  END*/
	
	
	
	//공지사항
	@RequestMapping("admin_notice.all")
	public String admin_notice() {
		logger.info("▶ /admin_notice.adm");
		
		return"admin/admin_notice";
	}
	
	//공지사항 - 상세페이지
	@RequestMapping("admin_noticedetail.all")
	public String admin_noticedetail() {
		//상세페이지는 유저가 보는 화면이기에 .all이다.
		logger.info("▶ /admin_noticedetail.all");
		
		return"admin/admin_noticedetail";
	}
	
	//커뮤니티
	@RequestMapping("admin_community.all")
	public String admin_community() {
		logger.info("▶ /admin_community.adm");
		
		return"admin/admin_community";
	}
	
}

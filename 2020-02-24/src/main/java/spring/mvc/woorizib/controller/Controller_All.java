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
public class Controller_All {
	
private static final Logger logger = LoggerFactory.getLogger(Controller_All.class);
	
	//모두의 서비스
	@Autowired
	Service_All serviceAll;
	//관리자 서비스
	@Autowired
	Service_Admin serviceAdmin;
	
	//메인페이지
	@RequestMapping("/")
	public String first(HttpServletRequest req, Model model) {
		logger.info("▶ /");
		return "all_index";
	}
	//메인페이지 2
	@RequestMapping("/all_index.all")
	public String index(HttpServletRequest req, Model model) {
		logger.info("▶ /all_index");
		return "all_index";
	}
	//회원로그인
	@RequestMapping("/all_login.all")
	public String login(HttpServletRequest req, Model model) {
		logger.info("url ==> /login");
		return "all_login";
	}
	
	//회원로그인Pro
	@RequestMapping("/all_loginPro.all")
	public String all_loginPro() {
		logger.info("all_loginPro");
		
		return "all_loginPro";
	}
	
	//회원로그아웃
	@RequestMapping("/all_logout.all")
	public String logout(HttpServletRequest req, Model model) {
		logger.info("url ==> /logout");
		req.getSession().invalidate();
		return "all_index";
	}
	//회원가입 처리
	@RequestMapping("/all_signup_pro.all")
	public String all_signup_pro(HttpServletRequest req, Model model) {
		logger.info("▶ /all_signup_pro");
		serviceAll.signup(req, model);
		return "all_signup_pro";
	}
		

	/* 20.02.13 - 문성혁, 아이디 찾아주는 Controller 메서드 */
	//아이디 찾기
	@RequestMapping("all_find_account.all")
	public String all_find_account(HttpServletRequest req, Model model) {
		logger.info("▶ /all_find_account");
		serviceAll.find_account(req, model);
		return "all_login";
	}
	//비밀번호 변경 - 링크보내기
	@RequestMapping("all_change_password.all")
	public String all_change_password(HttpServletRequest req, Model model) {
		logger.info("▶ /all_change_password");
		serviceAll.change_password(req, model);
		return "all_login";
	}
	//비밀번호 변경 - 페이지
	@RequestMapping("all_changePasswordPage.all")
	public String all_changePasswordPage(HttpServletRequest req, Model model) {
		logger.info("▶ /all_changePasswordPage");
		String member_id = req.getParameter("member_id");
		model.addAttribute("member_id",member_id);
		return "all_changePasswordPage";
	}
	//비밀번호 변경 - 처리
	@RequestMapping("all_changePasswordPagePro.all")
	public String all_changePasswordPagePro(HttpServletRequest req, Model model) {
		logger.info("▶ /all_changePasswordPagePro");
		serviceAll.change_passoword_page_pro(req, model);
		return "all_changePasswordPagePro";
	}
	/* 20.02.13 - 문성혁, 아이디 찾아주는 Controller 메서드 */
	
	
	
	/* 2020.02.16 - 전영현 */
	
	//마이페이지 (내가 만든것 테스트 용)
	@RequestMapping("all_myPage.all")
	public String all_myPage(HttpServletRequest req, Model model) {
		logger.info("▶ /all_myPage");
		return "all_myPage";
	}
	//나의 관심 (지역/단지)
	@RequestMapping("all_myFavorite.all")
	public String all_myFavorite(HttpServletRequest req, Model model) {
		logger.info("▶ /all_myFavorite");
		return "all_myFavorite";
	}
	//내가 만든것 (테스트) 의뢰내역
	@RequestMapping("all_request.all")
	public String all_request(HttpServletRequest req, Model model) {
		logger.info("▶ /all_request");
		return "all_request";
	}
	
	//나의관심(매물)
	@RequestMapping("all_building.all")
	public String all_building(HttpServletRequest req, Model model) {
		logger.info("▶ /all_building");
		return "all_building";
	}
	
	
//	@RequestMapping("requestDetail.all")
//	public String requestDetail() {
//		
//		logger.info("requestDetail.all");
//		
//		return"requestDetail";
//	}
	/* 2020.02.16 - 전영현 */
	
	
	
	/* 2020.02.17 - 박은슬  */
	
	//경매 메인페이지
	@RequestMapping("all_auctionMain.all")
	public String all_auctionMain() {
		logger.info("▶ /all_auctionMain.all");
		
		return "all_auctionMain";
	}
	
	//경매 조회
	@RequestMapping("all_auctionList.all")
	public String all_auctionList() {
		logger.info("all_auctionList");
		
		return "all_auctionList";
	}
	//경매 검색페이지
	@RequestMapping("all_auctionSearch.all")
	public String all_auctionSearch() {
		logger.info("▶ /all_auctionSearch.all");
				
		return "all_auctionSearch";
	}
	//경매 결과페이지
	@RequestMapping("all_auctionResult.all")
	public String all_auctionResult() {
		logger.info("▶ /all_auctionResult.all");
				
		return "all_auctionResult";
	}
	
	/* 2020.02.17 - 박은슬  */
	
	/* 박찬하 */
//	@RequestMapping("/all_registPage")
//	public String all_registPage( HttpServletRequest req, Model model) {
//		logger.info("▶ all_registPage");
//		
//		return "all_registPage";
//	}
	//등록 페이지
	@RequestMapping("/all_auctionRegister")	
	public String all_auctionRegister( HttpServletRequest req, Model model) {
		logger.info("▶ all_auctionRegister");
		
		return "all_auctionRegister";
	}	
	//정보 수정
	@RequestMapping("/all_actionModify")	
	public String all_actionModify( HttpServletRequest req, Model model) {
		logger.info("▶ all_actionModify");
		
		return "all_actionModify";
	}	
	//경매 조회
	@RequestMapping("/all_auctionList")	
	public String all_auctionList( HttpServletRequest req, Model model) {
		logger.info("▶ all_auctionList");
		
		return "all_auctionList";
	}	
	/* 박찬하 */

		 
		
	//[핵심기능] - 검색
	@RequestMapping("/all_searchHouse.all")
	public String all_searchHouse() {
		logger.info("▶ /all_searchHouse.all");
		
		return "all_searchHouse";
	}
		

	
	
	//QnA(테스트)----20200223 수정 
	@RequestMapping("all_qna.all")
	public String all_qna(HttpServletRequest req, Model model) {
		return "all_qna";
	}
	
	//QnA Detail (테스트)----20200223 수정
	@RequestMapping("all_qnaDetail.all")
	public String all_qnaDatail(HttpServletRequest req, Model model) {
		return "all_qnaDetail";
	}
	
	//공지사항 (테스트)----20200223 수정
	@RequestMapping("all_notice.all")
	public String all_notice(HttpServletRequest req, Model model) {
		return "all_notice";
	}
	
	//공지사항 디테일 (테스트)----20200223 수정
	@RequestMapping("all_noticeDetail.all")
	public String all_noticeDetail(HttpServletRequest req, Model model) {
		return "all_noticeDetail";
	}
	
	//결제 내역 (테스트)----20200223 수정
	@RequestMapping("all_paylist.all")
	public String all_paylist(HttpServletRequest req, Model model) {
		return "all_paylist";
	}
	
	//FAQ----20200223 수정
	@RequestMapping("all_faq.all")
	public String all_faq(HttpServletRequest req, Model model) {
		return "all_faq";
	}

}

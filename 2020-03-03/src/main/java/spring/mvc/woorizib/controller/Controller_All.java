package spring.mvc.woorizib.controller;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import spring.mvc.woorizib.service.Service_Admin;
import spring.mvc.woorizib.service.Service_All;
import spring.mvc.woorizib.service.Service_Seller;

@Controller
public class Controller_All {

	private static final Logger logger = LoggerFactory.getLogger(Controller_All.class);

	// 모두의 서비스
	@Autowired
	Service_All serviceAll;
	@Autowired
	Service_Seller serviceSeller;

	// 관리자 서비스
	@Autowired
	Service_Admin serviceAdmin;

	// 메인페이지
	@RequestMapping("/")
	public String first(HttpServletRequest req, Model model) {
		logger.info("▶ /");
		return "all_index";
	}

	// 메인페이지 2
	@RequestMapping("/all_index.all")
	public String index(HttpServletRequest req, Model model) {
		logger.info("▶ /all_index");
		return "all_index";
	}

	/* 공통 ------------------------------------------------- */
	// [20.02.25 - 문성혁] //
	// 에러페이지 404
	@RequestMapping("/404")
	public String error404(HttpServletRequest req, Model model) {
		logger.info("▶ /404");
		return "error/error_404";
	}

	// 에러페이지 500
	@RequestMapping("/500")
	public String error500(HttpServletRequest req, Model model) {
		logger.info("▶ /all_signup_pro");
		return "error/error_500";
	}

	// 에러페이지 503
	@RequestMapping("/503")
	public String error503(HttpServletRequest req, Model model) {
		logger.info("▶ /503");
		return "error/error_503";
	}
	// [20.02.25 - 문성혁] //
	/* 공통 ------------------------------------------------- */

	/* 로그인, 회원가입, 아이디 & 비밀번호 찾기-------------- */
	// [20.02.25 - 문성혁: 로그인, 회원가입, 아이디 중복확인, 이메일인증] //
	// 로그인
	@RequestMapping("/all_login.all")
	public String login(HttpServletRequest req, Model model) {
		logger.info("url ==> /login");
		return "all_login";
	}

	// 회원 로그아웃
	@RequestMapping("/all_logout.all")
	public String logout(HttpServletRequest req, Model model) {
		logger.info("url ==> /logout");
		req.getSession().invalidate();
		return "all_index";
	}

	// 일반 회원가입 처리
	@RequestMapping("/all_signup_pro.all")
	public String all_signup_pro(HttpServletRequest req, Model model) {
		logger.info("▶ /all_signup_pro");
		serviceAll.signup(req, model);
		return "all_signup_pro";
	}

	// 셀러 회원가입처리
	@RequestMapping(value = "/seller_signup_pro.all", method = RequestMethod.POST)
	public String admin_signup_pro(MultipartHttpServletRequest req, Model model) {
		logger.info("▶ /seller_signup_pro.sel");
		serviceAll.signupSeller(req, model);
		return "seller_signup_pro";
	}

	// 회원 아이디 중복검사
	@RequestMapping("/all_memberconfirmid.all")
	public String all_memberconfirmid(HttpServletRequest req, Model model) {
		logger.info("▶ /all_memberconfirmid.all");
		serviceAll.signupconfirmid(req, model);
		return "all_memberconfirmid";
	}

	// 셀러 아이디 중복검사
	@RequestMapping("/all_sellerconfirmid.all")
	public String all_sellerconfirmid(HttpServletRequest req, Model model) {
		logger.info("▶ /all_sellerconfirmid.all");
		serviceAll.signupconfirmid(req, model);
		return "all_sellerconfirmid";
	}

	// 회원 이메일 인증
	@RequestMapping("/all_membercertification.all")
	public String all_membercertification(HttpServletRequest req, Model model) {
		logger.info("▶ /all_membercertification.all");
		serviceAll.membercertification(req, model);
		return "all_membercertification";
	}

	// 셀러 이메일 인증
	@RequestMapping("/all_sellercertification.all")
	public String all_sellercertification(HttpServletRequest req, Model model) {
		logger.info("▶ /all_sellercertification.all");
		serviceAll.sellercertification(req, model);
		return "all_sellercertification";
	}
	// [20.02.25 - 문성혁: 로그인, 회원가입, 아이디 중복확인, 이메일인증] //

	// [20.02.26 - 문성혁, 아이디 & 비밀번호 찾기] //
	// 아이디 찾기 (일반회원, 셀러 둘다 됨)
	@RequestMapping("all_find_account.all")
	public String all_find_account(HttpServletRequest req, Model model) {
		logger.info("▶ /all_find_account");
		serviceAll.find_account(req, model);
		return "all_showregisteredid";
	}

	// 비밀번호 변경 - 링크보내기
	@RequestMapping("all_change_password.all")
	public String all_change_password(HttpServletRequest req, Model model) {
		logger.info("▶ /all_change_password");
		serviceAll.change_password(req, model);
		return "all_login";
	}

	// 비밀번호 변경 - 페이지
	@RequestMapping("all_changePasswordPage.all")
	public String all_changePasswordPage(HttpServletRequest req, Model model) {
		logger.info("▶ /all_changePasswordPage");
//		String id = req.getParameter("id");
//		model.addAttribute("id", id);
		return "all_changePasswordPage";
	}

	// 비밀번호 변경 - 처리
	@RequestMapping("all_changePasswordPagePro.all")
	public String all_changePasswordPagePro(HttpServletRequest req, Model model) {
		logger.info("▶ /all_changePasswordPagePro");
		serviceAll.change_passoword_page_pro(req, model);
		return "all_changePasswordPagePro";
	}
	// [20.02.26 - 문성혁, 아이디 & 비밀번호 찾기] //
	/* 로그인, 회원가입, 아이디 & 비밀번호 찾기-------------- */

	/* 2020.02.16 - 전영현 */

	// 마이페이지 (내가 만든것 테스트 용)
	@RequestMapping("all_myPage.all")
	public String all_myPage(HttpServletRequest req, Model model) {
		logger.info("▶ /all_myPage");
		return "all_myPage";
	}

	// 나의 관심 (지역/단지)
	@RequestMapping("all_myFavorite.all")
	public String all_myFavorite(HttpServletRequest req, Model model) {
		logger.info("▶ /all_myFavorite");
		return "all_myFavorite";
	}

	// 내가 만든것 (테스트) 의뢰내역
	@RequestMapping("all_request.all")
	public String all_request(HttpServletRequest req, Model model) {
		logger.info("▶ /all_request");
		return "all_request";
	}

	// 나의관심(매물)
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

	/* 2020.02.17 - 박은슬 */

	// 경매 메인페이지
	@RequestMapping("all_auctionMain.all")
	public String all_auctionMain() {
		logger.info("▶ /all_auctionMain.all");

		return "all_auctionMain";
	}

	// 경매 조회
	@RequestMapping("all_auctionList.all")
	public String all_auctionList() {
		logger.info("all_auctionList");

		return "all_auctionList";
	}

	// 경매 검색페이지
	@RequestMapping("all_auctionSearch.all")
	public String all_auctionSearch() {
		logger.info("▶ /all_auctionSearch.all");

		return "all_auctionSearch";
	}

	// 경매 결과페이지
	@RequestMapping("all_auctionResult.all")
	public String all_auctionResult() {
		logger.info("▶ /all_auctionResult.all");

		return "all_auctionResult";
	}

	/* 2020.02.17 - 박은슬 */

	/* 박찬하 */
//	@RequestMapping("/all_registPage")
//	public String all_registPage( HttpServletRequest req, Model model) {
//		logger.info("▶ all_registPage");
//		
//		return "all_registPage";
//	}
	// 등록 페이지
//	@RequestMapping("/all_auctionRegister")
//	public String all_auctionRegister(HttpServletRequest req, Model model) {
//		logger.info("▶ all_auctionRegister");
//
//		return "all_auctionRegister";
//	}

	// 정보 수정
	@RequestMapping("/all_actionModify")
	public String all_actionModify(HttpServletRequest req, Model model) {
		logger.info("▶ all_actionModify");

		return "all_actionModify";
	}

	// 경매 조회
	@RequestMapping("/all_auctionList")
	public String all_auctionList(HttpServletRequest req, Model model) {
		logger.info("▶ all_auctionList");

		return "all_auctionList";
	}
	/* 박찬하 */

	// [핵심기능] - 검색
	@RequestMapping("/all_searchHouse.all")
	public String all_searchHouse() {
		logger.info("▶ /all_searchHouse.all");

		return "all_searchHouse";
	}

	// QnA(테스트)----20200223 수정
	@RequestMapping("all_qna.all")
	public String all_qna(HttpServletRequest req, Model model) {

		serviceAll.qnaList(req, model);

		return "all_community_qna";
	}

	// QnA Detail (테스트)----20200223 수정
	@RequestMapping("all_qnaDetail.all")
	public String all_qnaDatail(HttpServletRequest req, Model model) {
		return "all_qnaDetail";
	}

	
	@RequestMapping("all_notice.all")
	public String all_notice() {
		
		return "all_notice";
	}
	


	
	
	
	// 결제 내역 (테스트)----20200223 수정
	@RequestMapping("all_paylist.all")
	public String all_paylist(HttpServletRequest req, Model model) {
		return "all_paylist";
	}

	// FAQ----20200223 수정
	@RequestMapping("all_faq.all")
	public String all_faq(HttpServletRequest req, Model model) {
		return "all_faq";
	}

	// ---------------------------------------------------------------20200225 허은정

	// 커뮤니티
	@RequestMapping("all_community_List.all")
	public String all_community_List(HttpServletRequest req, Model model) {
		logger.info("url ==> all_community_List.all");
		serviceAll.community_List(req, model);
		return "all_community_List";
	}

	// 커뮤니티 - 글쓰기 페이지
	@RequestMapping("all_community_writeForm.all")
	public String all_community_writeForm(HttpServletRequest req, Model model) {
		logger.info("url ==> all_community_writeForm");
		String id = (String) req.getSession().getAttribute("memID");
		if (id != null) {
			serviceAll.community_writeForm(req, model);
		}
		return "all_community_writeForm";
	}

	// 커뮤니티 - 글쓰기 처리페이지
	@RequestMapping("all_community_writePro.all")
	public String all_community_writePro(HttpServletRequest req, Model model) {
		logger.info("url ==> all_community__writePro");
		serviceAll.community_writePro(req, model);
		return "all_community_writePro";
	}

	// 커뮤니티 - 글 수정 상세페이지
	@RequestMapping("all_community_modifyForm.all")
	public String all_community_modifyForm(HttpServletRequest req, Model model) {
		logger.info("url ==> all_community_modifyForm");
		serviceAll.community_modifyForm(req, model);
		return "all_community_modifyForm";
	}

	// 커뮤니티 - 게시글 상세페이지
	@RequestMapping("all_community_contentForm.all")
	public String all_community_contentForm(HttpServletRequest req, Model model) {
		logger.info("url ==> all_community_contentForm.all");
		serviceAll.community_form(req, model);
		return "all_community_contentForm";
	}

	// 커뮤니티 - 글 수정 처리페이지
	@RequestMapping("all_community_modifyPro.all")
	public String community_modifyPro(HttpServletRequest req, Model model) {
		logger.info("url ==> all_community_modifyPro");
		serviceAll.community_modifyPro(req, model);
		return "all_community_modifyPro";
	}

	// 커뮤니티 - 글 삭제 처리 페이지
	@RequestMapping("all_community_deletePro.all")
	public String community_deletePro(HttpServletRequest req, Model model) {
		logger.info("url ==> all_community_deletePro");
		serviceAll.community_deletePro(req, model);
		return "all_community_deletePro";
	}

	
	
	
	// 박은슬 경매 상세 2020-03-05
	@RequestMapping("/all_auctionDetail.all")
	public String all_auctionDetail(HttpServletRequest req, Model model) {
		logger.info("url ==> /all_auctionDetail");
		serviceAll.auctionDetail(req, model);
		return "all_auctionDetail";
	}

	@RequestMapping("/all_auctionLive.all")
	public String all_auctionLive(HttpServletRequest req, Model model) {
		logger.info("url ==> /auctionLive");
		serviceAll.auctionLive(req, model);
		return "all_auctionLive";
	}

	@RequestMapping("/all_auctionNowPrice.all")
	@ResponseBody
	public int all_auctionNowPrice(HttpServletRequest req, Model model) {
		logger.info("url ==> /auctionNowPrice");

		return serviceAll.auctionNowPrice(req, model);
	}

}

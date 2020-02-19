package spring.mvc.bridge.controller;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import spring.mvc.bridge.service.Service_Main;


@Controller
public class Controller_Main {
	
private static final Logger logger = LoggerFactory.getLogger(Controller_Main.class);
	
	
	@Autowired
	Service_Main serviceM;
	
	@RequestMapping("/")
	public String first(HttpServletRequest req, Model model) {
		logger.info("url ==> /firstPage");
		return "index";
	}
	
	
	@RequestMapping("/index.all")
	public String index(HttpServletRequest req, Model model) {
		logger.info("url ==> /index");
		return "index";
	}
	
	@RequestMapping("/login.all")
	public String login(HttpServletRequest req, Model model) {
		logger.info("url ==> /login");
		return "login2";
	}
	
	@RequestMapping("/logout.all")
	public String logout(HttpServletRequest req, Model model) {
		logger.info("url ==> /logout");
		
		req.getSession().invalidate();
		
		return "login2";
	}
	
	@RequestMapping("/signup.all")
	public String signup(HttpServletRequest req, Model model) {
		logger.info("url ==> /signup");
		
		return "signup";
	}
	
	@RequestMapping("/signup_pro.all")
	public String signup_pro(HttpServletRequest req, Model model) {
		logger.info("url ==> /signup_pro");
		
		serviceM.signup(req, model);
		return "signup_pro";
	}
	
	
	// 회원수정--------------------------------------전영현 2020-02-13
	@RequestMapping("/updateMember.cust")
	public String updateMember(HttpServletRequest req, Model model) {
		logger.info("url==>/updateMember.cust");
		serviceM.modifyView(req,model);
		return "updateMember";
	}
	
	//회원정보 수정 처리 
	@RequestMapping("/updateMemberPro.cust")
	public String updateMemberPro(HttpServletRequest req, Model model) {
		logger.info("url==>/updateMemberPro.cust");
		serviceM.updateMemberPro(req,model);
		return "updateMemberPro";
	}
	
	//회원탈퇴화면
	@RequestMapping("/deleteMember.cust")
	public String deleteMemeber(HttpServletRequest req, Model model) {
		logger.info("/deleteMember.cust");
		return "deleteMember";
	}
	
	//회원 탈퇴 처리 
	@RequestMapping("/deleteMemberPro.cust")
	public String deleteMemberPro(HttpServletRequest req, Model model) {
		logger.info("/deleteMemberPro.cust");
		serviceM.deleteMemberPro(req,model);
		return "deleteMemberPro";
	}
	
	//-------------------------------------------------------------------
	
	/* 20.02.13 - 문성혁, 아이디 찾아주는 Controller 메서드 */
	//아이디 찾기
	@RequestMapping("find_account.all")
	public String find_account(HttpServletRequest req, Model model) {
		logger.info("url ==> /find_account");
			
		serviceM.find_account(req, model);
		
		return "login2";
	}
	
	//비밀번호 변경 - 링크보내기
	@RequestMapping("change_password.all")
	public String change_password(HttpServletRequest req, Model model) {
		logger.info("url ==> /find_password");
		
		serviceM.change_password(req, model);
		
		return "login2";
	}
	
	//비밀번호 변경 - 페이지
	@RequestMapping("change_passoword_page.all")
	public String change_passoword_page(HttpServletRequest req, Model model) {
		logger.info("url ==> /change_passoword_page");
			
		String member_id = req.getParameter("member_id");
		model.addAttribute("member_id",member_id);
		
		return "rePWD";
	}
	
	//비밀번호 변경 - 처리
	@RequestMapping("change_passoword_page_pro.all")
	public String change_passoword_page_pro(HttpServletRequest req, Model model) {
		logger.info("url ==> /change_passoword_page_pro");
		
		serviceM.change_passoword_page_pro(req, model);
			
		return "change_passoword_page_pro";
	}
	/* 20.02.13 - 문성혁, 아이디 찾아주는 Controller 메서드 */
	
	
	//////////////////////////////////////////////////////
	//전영현 2020-02-16
	
	//마이페이지 (내가 만든것 테스트 용)
	@RequestMapping("MyPage.all")
	public String MyPage(HttpServletRequest req, Model model) {
		logger.info("/MyPage");
		return "MyPage";
	}
	
	//나의 관심 (테스트) 나의 관심
	@RequestMapping("MyFavorite.all")
	public String MyFavorite(HttpServletRequest req, Model model) {
		return "MyFavorite";
	}
	
	//내가 만든것 (테스트) 의뢰내역
	@RequestMapping("request.all")
	public String New(HttpServletRequest req, Model model) {
		return "request";
	}
	
	//지역 단지 (테스트)
	@RequestMapping("region.all")
	public String region(HttpServletRequest req, Model model) {
		return "region";
	}
	
	//매물
	@RequestMapping("building.all")
	public String building(HttpServletRequest req, Model model) {
		return "building";
	}
	
	/*
	 * //내놓기 .. seller만 방을 내놓는다.
	 * 
	 * @RequestMapping("/selling.all") public String selling(HttpServletRequest req,
	 * Model model) { return "selling"; }
	 */
	
	//구하기(테스트)
	@RequestMapping("buying.all")
	public String buying(HttpServletRequest req, Model model) {
		return "buying";
	}
	
	@RequestMapping("requestDetail.all")
	public String requestDetail() {
		
		logger.info("requestDetail.all");
		
		return"requestDetail";
	}
	
	
	/////////////////////////////////////////////////
	
	//박은슬 2020-02-17
	//경매관리
	@RequestMapping("acmain")
	public String main() {
		
		logger.info("acmain.all");
		
		return"acmain";
	}
	
	
	@RequestMapping("auctionMain")
	public String auctionMain() {
		logger.info("url==> auctionMain.all");
				
		return "auctionMain";
	}

	@RequestMapping("auctionResult")
	public String auctionResult() {
		logger.info("url==> auctionResult.cust");
				
		return "auctionResult";
	}
	/////////////////////////////////////////////////
	
	//--------------------------------------박찬하
		@RequestMapping("registPage")
		public String registPage( HttpServletRequest req, Model model) {
			logger.info("url --> registPage");
			
			return "registPage";
		}
		
		@RequestMapping("auctionRegist")	//등록 페이지
		public String auctionRegist( HttpServletRequest req, Model model) {
			logger.info("url --> auctionRegist");
			
			return "auctionRegist";
		}	
		@RequestMapping("actionModify")	//정보 수정
		public String actionModify( HttpServletRequest req, Model model) {
			logger.info("url --> actionModify");
			
			return "actionModify";
		}	
		@RequestMapping("auctionlist")	//경매 조회
		public String auctionlist( HttpServletRequest req, Model model) {
			logger.info("url --> auctionlist");
			
			return "auctionlist";
		}	
		//--------------------------------------박찬하
		
	
	//검색창
	@RequestMapping("selectHouse")
	public String selectHouse() {
		logger.info("selectHouse");
		
		return "selectHouse";
	}
		
	/////////////////////////////////////////////////////host
	
	//host Main
	@RequestMapping("/hoMain")
	public String admin_index(HttpServletRequest req, Model model) {
		logger.info("url ==> admin-index");
		
		return "admin/admin-index";
	}
	
	
//	====================================================유기복           
//	//회원상태 승인관리
//	@RequestMapping("/memberAdmin")    
//	public String memberAdmin(HttpServletRequest req, Model model) {	
//		logger.info("url ==> /memberAdmin");
//		
//		return "memberAdmin";
//	}
	
//	//회원상태 관리
//	@RequestMapping("/memberState")
//	public String memberState(HttpServletRequest req, Model model) {	
//		logger.info("url ==> /memberState");
//		
//		return "memberState";
//	}
//	
//	//불량회원 신고관리
//	@RequestMapping("/memberDecl")
//	public String memberDecl(HttpServletRequest req, Model model) {	
//		logger.info("url ==> /memberDecl");
//		
//		return "memberDecl";
//	}
//	
//	//회원관리 AJax
//	@RequestMapping("/memberManagement")
//	public String memberManagement(HttpServletRequest req, Model model) {	
//		logger.info("url ==> /memberManagement");
//		
//		return "memberManagement";
//	}
//	
	//셀러입점 신청서
	@RequestMapping("/sellerApply")
	public String sellerApply(HttpServletRequest req, Model model) {	
		logger.info("url ==> /sellerApply");
		
		return "admin/sellerApply";
	}
	
	
	
	
	
	
//	//셀러 가입승인
//	@RequestMapping("/buttons.all")
//	public String buttons(HttpServletRequest req, Model model) {
//		logger.info("url ==> buttons");
//		
//		return "admin/buttons";
//	}
//	//회원상태관리
//	@RequestMapping("/cards.all")
//	public String cards(HttpServletRequest req, Model model) {
//		logger.info("url ==> cards");
//		
//		return "admin/cards";
//	}
//	//신고관리
//	@RequestMapping("/charts.all")
//	public String charts(HttpServletRequest req, Model model) {
//		logger.info("url ==> charts");
//		
//		return "admin/charts";
//	}
	
	
	
	
////	커뮤니티
//	@RequestMapping("/utilities-border.all")
//	public String utilities_border(HttpServletRequest req, Model model) {
//		logger.info("url ==> utilities-border");
//		
//		return "admin/utilities-border";
//	}
////	커뮤니티 상세페이지
//	@RequestMapping("notice.all")
//	public String notice() {
//		logger.info("notice");
//		
//		return"admin/notice";
//	}
//	
//	//공지사항
//	@RequestMapping("/utilities-color.all")
//	public String utilities_color(HttpServletRequest req, Model model) {
//		logger.info("url ==> utilities-color");
//		
//		return "admin/utilities-color";
//	}
	
	
}

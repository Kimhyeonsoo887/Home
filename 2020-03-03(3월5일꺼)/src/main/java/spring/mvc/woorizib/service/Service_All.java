package spring.mvc.woorizib.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import spring.mvc.woorizib.vo.VO_LiveAuc;

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
	
	
	/* ▶ 커뮤니티 */
	/* 허은정2020.02.25 */
	
	//커뮤니티 - 글목록
	public void community_List(HttpServletRequest req, Model model);
	//커뮤니티 - 게시글 상세페이지
	public void community_form(HttpServletRequest req, Model model);
	//커뮤니티 - 글 수정 처리페이지
	public void community_modifyForm(HttpServletRequest req, Model model);
	//커뮤니티 - 글 수정 처리페이지
	public void community_modifyPro(HttpServletRequest req, Model model);
	//커뮤니티 - 글쓰기 페이지
	public void community_writeForm(HttpServletRequest req, Model model);
	//커뮤니티 - 글쓰기 처리페이지
	public void community_writePro(HttpServletRequest req, Model model);
	//커뮤니티 - 글 삭제 처리페이지
	public void community_deletePro(HttpServletRequest req, Model model);
	
	/* 허은정2020.02.25 */
	/* ▶ 커뮤니티 */

	
	//qna목록 가져오기 
	public void qnaList(HttpServletRequest req, Model model);
		
		
	//박은슬 2020-03-05
	//경매 상세페이지
	public void auctionDetail(HttpServletRequest req, Model model);
	
	//경매 실시간 업데이트
	public List<VO_LiveAuc> auctionLive(HttpServletRequest req, Model model);
	
	//경매 현재 최고가
	public int auctionNowPrice(HttpServletRequest req, Model model);
	
	//경매 마감상태로 바꾸기
	public void scheduleRun();
}

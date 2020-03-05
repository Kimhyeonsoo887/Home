package spring.mvc.woorizib.service;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import spring.mvc.woorizib.vo.VO_Comments;

public interface Service_Member {

	/* ▶ 회원수정 및 탈퇴 */
	/* 전영현 2020.02.13 */

	// 회원정보 수정화면
	public void modifyView(HttpServletRequest req, Model model);

	// 회원정보 수정 처리
	public void updateMemberPro(HttpServletRequest req, Model model);

	// 회원탈퇴 처리
	public void deleteMemberPro(HttpServletRequest req, Model model);

	/* 전영현 2020.02.13 */
	/* ▶ 회원수정 및 탈퇴 */

	// qna 수정 화면
	// public void qnawriteForm(HttpServletRequest req, Model model);

	// qna 수정 처리
	public void qnawritePro(HttpServletRequest req, Model model);

	// qna 리스트
	// public void qnaList(HttpServletRequest req, Model model);

	// QNA 글 상세 페이지
	public void qnacontent(HttpServletRequest req, Model model);

	// QNA 글 수정 상세 페이지
	public void qnamodifyView(HttpServletRequest req, Model model);

	// QNA 글 수정 처리
	public void qnamodifyPro(HttpServletRequest req, Model model);

	// QNA 글 삭제 처리
	public void qnadeletePro(HttpServletRequest req, Model model);

	// 댓글 추가
	public void commentwritePro(HttpServletRequest req, Model model);

	// 댓글 가져오기
	public ArrayList<VO_Comments> commentList(HttpServletRequest req, Model model);

	
	/*박은슬*/
	//결제페이지 
	public void auctionPayment(HttpServletRequest req, Model model);
	//결제처리
	public void auctionpayPro(HttpServletRequest req, Model model);
	/*박은슬*/
}

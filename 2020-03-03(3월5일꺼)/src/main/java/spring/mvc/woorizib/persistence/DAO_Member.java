package spring.mvc.woorizib.persistence;

import java.util.ArrayList;
import java.util.Map;

import spring.mvc.woorizib.vo.VO_Comments;
import spring.mvc.woorizib.vo.VO_Member;
import spring.mvc.woorizib.vo.VO_QnA;

public interface DAO_Member {
	// QnA 글 추가
	public int insertQna(VO_QnA vo);

	// QnA 조회수 증가
	public void addReadCnt(String qna_number);

	// QnA 상세 페이지 조회
	public VO_QnA getQna(String qna_number);

	// 인증 처리 표함해야해서 바껴야 한다.
	public int updateQna(VO_QnA vo);

	// 인증 처리 포함 해야해서 바껴야 한다.
	public int deleteQna(String qna_number);

	// 댓글 등록
	public int insertComment(VO_Comments vo_comments);

	// 댓글 가져 오기
	public ArrayList<VO_Comments> selectComment(String qna_number);

	
	//박은슬 2020-03-05
	public int auctionpayPro(Map<String, Object> map);

}

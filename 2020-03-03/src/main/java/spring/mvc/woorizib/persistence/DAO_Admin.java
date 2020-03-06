package spring.mvc.woorizib.persistence;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import spring.mvc.woorizib.vo.VO_Admin;
import spring.mvc.woorizib.vo.VO_Member;
import spring.mvc.woorizib.vo.VO_Notice;
import spring.mvc.woorizib.vo.VO_Seller;

public interface DAO_Admin {

	int signupAdmin(VO_Admin vo);

	// ---------------------------------------2020.02.26 유기복
	// 셀러상태 승인관리 셀러요청 회원수
	public int admin_approvesellerCnt();

	// 셀러상태 승인관리 목록
	public ArrayList<VO_Seller> admin_approvesellerCntList(VO_Seller vo);

	// 셀러 승인관리 (셀러승인)
	public int admin_sellerAuth(String sel_id);

	// 셀러 승인관리 (이메일수동승인)
	public int admin_emailAuth(String sel_id);

	// 셀러 검색기능
	public ArrayList<VO_Seller> admin_sellerSearch(String search);

	// 회원상태 관리 승인요청 회원수
	public int admin_administratemembersCnt();

	// 회원상태 관리 목록
	public ArrayList<VO_Member> admin_administratemembersCntList(VO_Member vo2);

	// 회원상태 일반회원 검색
	public ArrayList<VO_Member> admin_memberSearch(String search);

	// 불량회원 신고관리 셀러 회원수
	public int admin_reportCnt();

	// 불량회원 신고관리 목록
	public ArrayList<VO_Seller> admin_reportCntList(VO_Seller vo);

	// 불량회원 신고관리 검색기능
	public ArrayList<VO_Seller> admin_reportSearch(String search3);

	// 불량회원 신고관리 (누적신고횟수 수정)
	public int admin_reportModifyCnt(VO_Seller vo);

	// ---------------------------------------2020.02.26 유기복 END
	
	/* 박찬하 2020.03.06 */
	//공지사항 글 갯수구하기
	public int getNoticeCnt();
	//공지사항 조회
	public List<VO_Notice> getNoticeList(Map<String, Object> map);
	//공지사항 글 가져오기
	public VO_Notice selectNotice( String ntc_number );
	//공지사항 글 삭제
	public int deleteNotice( String ntc_number );
	//공지사항 추가 
	public int insertNotice( VO_Notice notice );
	//공지사항 수정 
	public int updateNotice( VO_Notice notice );
	/* 박찬하 2020.03.06 */

}

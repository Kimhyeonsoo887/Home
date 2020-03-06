package spring.mvc.woorizib.persistence;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.mail.Message.RecipientType;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Repository;

import spring.mvc.woorizib.vo.VO_Admin;
import spring.mvc.woorizib.vo.VO_Member;
import spring.mvc.woorizib.vo.VO_Notice;
import spring.mvc.woorizib.vo.VO_Seller;

@Repository
public class DAO_AdminImpl implements DAO_Admin {

	@Autowired
	SqlSession sqlSession;

	@Override
	public int signupAdmin(VO_Admin vo) {
		return sqlSession.insert("spring.mvc.woorizib.persistence.DAO_Admin.signupAdmin", vo);
	}

	// ---------------------------------------2020.02.26 유기복
	// 셀러 승인관리 셀러요청 회원 수
	@Override
	public int admin_approvesellerCnt() {

		/* String sql = "SELECT COUNT(*) as cnt FROM Seller_tbl"; */
		return sqlSession.selectOne("spring.mvc.woorizib.persistence.DAO_Admin.admin_approvesellerCnt");
	}

	// 셀러 승인관리 셀러요청 목록
	@Override
	public ArrayList<VO_Seller> admin_approvesellerCntList(VO_Seller vo) {
		// 큰바구니 선언
		ArrayList<VO_Seller> list = null;
		DAO_Admin dao = sqlSession.getMapper(DAO_Admin.class);
		list = dao.admin_approvesellerCntList(vo);
		return list;
		/*
		 * String sql = "SELECT * " +
		 * "FROM (SELECT num, writer, pwd, subject, content, readCnt, " +
		 * "ref, ref_step, ref_level, reg_date, ip, rownum rNum " + "FROM (" +
		 * "SELECT * FROM Seller_tbl " + "ORDER BY ref DESC, ref_step ASC" + ")" + ")" +
		 * " WHERE rNum >= ? AND rNum <= ?";
		 */
	}

	// 셀러인증
	@Override
	public int admin_sellerAuth(String sel_id) {
		return sqlSession.update("spring.mvc.woorizib.persistence.DAO_Admin.admin_sellerAuth", sel_id);
//		    return sqlSession.getMapper(DAO_Host.class).sellerAz(sel_id); 
	}

	// 이메일수동인증
	@Override
	public int admin_emailAuth(String sel_id) {
		return sqlSession.update("spring.mvc.woorizib.persistence.DAO_Admin.admin_emailAuth", sel_id);
	}

	// 셀러 검색기능
	@Override
	public ArrayList<VO_Seller> admin_sellerSearch(String search) {
//			SELECT *
//			  FROM Seller_tbl
//			WHERE sel_id LIKE '%hong%';
		ArrayList<VO_Seller> list = null;
		DAO_Admin dao = sqlSession.getMapper(DAO_Admin.class);
		list = dao.admin_sellerSearch("%" + search + "%");
		return list;
	}

	// 회원상태관리 회원 수
	@Override
	public int admin_administratemembersCnt() {

		/* String sql = "SELECT COUNT(*) as cnt FROM Seller_tbl"; */
		return sqlSession.selectOne("spring.mvc.woorizib.persistence.DAO_Admin.admin_administratemembersCnt");
	}

	// 회원상태관리 목록
	@Override
	public ArrayList<VO_Member> admin_administratemembersCntList(VO_Member vo2) {
		// 큰바구니 선언
		ArrayList<VO_Member> list = null;
		DAO_Admin dao = sqlSession.getMapper(DAO_Admin.class);
		list = dao.admin_administratemembersCntList(vo2);
		return list;
		/*
		 * String sql = "SELECT * " +
		 * "FROM (SELECT num, writer, pwd, subject, content, readCnt, " +
		 * "ref, ref_step, ref_level, reg_date, ip, rownum rNum " + "FROM (" +
		 * "SELECT * FROM Seller_tbl " + "ORDER BY ref DESC, ref_step ASC" + ")" + ")" +
		 * " WHERE rNum >= ? AND rNum <= ?";
		 */
	}

	// 일반회원 검색기능
	@Override
	public ArrayList<VO_Member> admin_memberSearch(String search2) {
//				SELECT *
//				  FROM Seller_tbl
//				WHERE sel_id LIKE '%hong%';
		ArrayList<VO_Member> list = null;
		DAO_Admin dao = sqlSession.getMapper(DAO_Admin.class);
		list = dao.admin_memberSearch("%" + search2 + "%");
		return list;
	}

	// 불량회원 신고관리 셀러 회원 수
	@Override
	public int admin_reportCnt() {
		/* String sql = "SELECT COUNT(*) as cnt FROM Seller_tbl"; */
		return sqlSession.selectOne("spring.mvc.woorizib.persistence.DAO_Admin.admin_reportCnt");
	}

	// 불량회원 신고관리 셀러 목록
	@Override
	public ArrayList<VO_Seller> admin_reportCntList(VO_Seller vo) {
		// 큰바구니 선언
		ArrayList<VO_Seller> list = null;
		DAO_Admin dao = sqlSession.getMapper(DAO_Admin.class);
		list = dao.admin_reportCntList(vo);
		return list;
		/*
		 * String sql = "SELECT * " +
		 * "FROM (SELECT num, writer, pwd, subject, content, readCnt, " +
		 * "ref, ref_step, ref_level, reg_date, ip, rownum rNum " + "FROM (" +
		 * "SELECT * FROM Seller_tbl " + "ORDER BY ref DESC, ref_step ASC" + ")" + ")" +
		 * " WHERE rNum >= ? AND rNum <= ?";
		 */
	}

	// 불량회원 신고관리 검색기능
	@Override
	public ArrayList<VO_Seller> admin_reportSearch(String search3) {
		// SELECT *
		// FROM Seller_tbl
		// WHERE sel_id LIKE '%hong%';
		ArrayList<VO_Seller> list = null;
		DAO_Admin dao = sqlSession.getMapper(DAO_Admin.class);
		list = dao.admin_reportSearch("%" + search3 + "%");
		return list;
	}

	// 불량회원 신고관리 (누적신고횟수 수정)
	@Override
	public int admin_reportModifyCnt(VO_Seller vo) {

		return sqlSession.update("spring.mvc.woorizib.persistence.DAO_Admin.admin_reportModifyCnt", vo);
	}
	// ---------------------------------------2020.02.26 유기복 END

	
	/* 박찬하 2020.03.06 */
	//공지사항 글 갯수 구하기
	@Override
	public int getNoticeCnt() {
		return sqlSession.getMapper(DAO_Admin.class).getNoticeCnt();
	}
	//공지사항 조회
	@Override
	public List<VO_Notice> getNoticeList(Map<String, Object> map) {
		return sqlSession.getMapper(DAO_Admin.class).getNoticeList(map);
	}
	//공지사항 가지고오기
	@Override
	public VO_Notice selectNotice(String ntc_number) {
		return sqlSession.getMapper(DAO_Admin.class).selectNotice(ntc_number);
	}
	//공지사항 삭제
	@Override
	public int deleteNotice( String ntc_number ) {
		return sqlSession.getMapper(DAO_Admin.class).deleteNotice(ntc_number); 
	}
	//공지사항 추가
	@Override
	public int insertNotice(VO_Notice notice) {
		return sqlSession.getMapper(DAO_Admin.class).insertNotice(notice);
	}
	//공지사항 수정pro
	@Override
	public int updateNotice( VO_Notice notice ) {
		return sqlSession.getMapper(DAO_Admin.class).updateNotice(notice);
	}
	/* 박찬하 2020.03.06 */
	
	
}

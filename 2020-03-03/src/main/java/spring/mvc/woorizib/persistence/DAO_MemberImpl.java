package spring.mvc.woorizib.persistence;

import java.util.ArrayList;
import java.util.Map;

import javax.mail.Message.RecipientType;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Repository;

import spring.mvc.woorizib.vo.VO_Comments;
import spring.mvc.woorizib.vo.VO_Member;
import spring.mvc.woorizib.vo.VO_Property;
import spring.mvc.woorizib.vo.VO_QnA;

@Repository
public class DAO_MemberImpl implements DAO_Member {

	@Autowired
	SqlSession sqlSession;

	@Override
	public int insertQna(VO_QnA vo) {
		int insertCnt = 0;

		DAO_Member dao = sqlSession.getMapper(DAO_Member.class);
		insertCnt = dao.insertQna(vo);
		return insertCnt;

	}

	@Override
	public void addReadCnt(String qna_number) {
		DAO_Member dao = sqlSession.getMapper(DAO_Member.class);
		dao.addReadCnt(qna_number);

	}

	@Override
	public VO_QnA getQna(String qna_number) {
		DAO_Member dao = sqlSession.getMapper(DAO_Member.class);
		return dao.getQna(qna_number);

	}

	@Override
	public int updateQna(VO_QnA vo) {
		DAO_Member dao = sqlSession.getMapper(DAO_Member.class);
		return dao.updateQna(vo);

	}

	@Override
	public int deleteQna(String qna_number) {
		DAO_Member dao = sqlSession.getMapper(DAO_Member.class);
		return dao.deleteQna(qna_number);
	}

	// 댓글 등록
	@Override
	public int insertComment(VO_Comments vo_comments) {
		DAO_Member dao = sqlSession.getMapper(DAO_Member.class);
		return dao.insertComment(vo_comments);

	}

	// 댓글 추가

	@Override
	public ArrayList<VO_Comments> selectComment(String qna_number) {

		DAO_Member dao = sqlSession.getMapper(DAO_Member.class);

		return dao.selectComment(qna_number);

	}

	
	
	// 박은슬 2020-03-05
	@Override
	public int auctionpayPro(Map<String, Object> map) {
		return sqlSession.insert("spring.mvc.woorizib.persistence.DAO_Member.auctionpayPro", map);
	}

	@Override
	public ArrayList<VO_Property> selectProperty() {

		ArrayList<VO_Property> dtos;
		DAO_Member dao = sqlSession.getMapper(DAO_Member.class);
		
		dtos = dao.selectProperty();
		
		return dtos;
	}

	@Override
	public VO_Property selectPropertyDetail(String prp_number) {
		return sqlSession.selectOne("spring.mvc.woorizib.persistence.DAO_Member.selectPropertyDetail",prp_number);
	}

}

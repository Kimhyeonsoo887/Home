package spring.mvc.bridge.persistence;

import java.util.Map;

import javax.mail.Message.RecipientType;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Repository;

import spring.mvc.bridge.vo.VO_Member;

@Repository
public class DAO_MainImpl implements DAO_Main {

	@Autowired
	SqlSession sqlSession;

	@Autowired
	private JavaMailSender mailSender;

	@Override
	public int signUp(VO_Member vo) {
		return sqlSession.insert("spring.mvc.bridge.persistence.DAO_Main.signUp", vo);
	}

	// 회원수정 및 회원탈퇴 -----------------------------전영현

	// 패스워드 체크
	@Override
	public String pwdCheck(String mem_id) {
		return sqlSession.selectOne("spring.mvc.bridge.persistence.DAO_Main.pwdCheck", mem_id);

	}

	// 회원정보 가져오기
	@Override
	public VO_Member readMember(String mem_id) {
		return sqlSession.selectOne("spring.mvc.bridge.persistence.DAO_Main.readMember", mem_id);

	}

	// 회원정보 수정
	@Override
	public int updateMember(VO_Member vo) {

		return sqlSession.update("spring.mvc.bridge.persistence.DAO_Main.updateMember", vo);
	}

	// 회원탈퇴
	@Override
	public int deleteMember(String member_id) {

		return sqlSession.delete("spring.mvc.bridge.persistence.DAO_Main.deleteMember", member_id);
	}

	/* 20.02.13 - 문성혁, 아이디 찾아주는 DAO 메서드 */
	@Override
	public int checkName(String inputName) {
		return sqlSession.selectOne("spring.mvc.bridge.persistence.DAO_Main.checkName", inputName);
	}

	@Override
	public int checkPhone(Map<String, Object> info) {
		return sqlSession.selectOne("spring.mvc.bridge.persistence.DAO_Main.checkPhone", info);	
	}

	@Override
	public String findAccount(Map<String, Object> info) {
		return sqlSession.selectOne("spring.mvc.bridge.persistence.DAO_Main.findAccount", info);
	}
	
	
	@Override
	public int checkAccount(String member_id) {
		return sqlSession.selectOne("spring.mvc.bridge.persistence.DAO_Main.checkAccount", member_id);
	}

	@Override
	public String findEmail(String member_id) {
		return sqlSession.selectOne("spring.mvc.bridge.persistence.DAO_Main.findEmail", member_id);
	}
	
	//이메일 설정은 servlet-context에서 이뤄진다.
	@Override
	public void sendPwEmail(String member_id, String email) {
		
		try{
            MimeMessage message = mailSender.createMimeMessage();
            String txt = "비밀번호 변경 페이지 입니다. 링크를 눌러 비밀번호를 변경해주세요." 

			+ "[<a href='http://localhost/bridge/change_passoword_page.all?member_id=" + member_id + "'>변경</a>]";
          message.setSubject("[브릿지] 비밀번호 변경 페이지 입니다.");
          message.setText(txt, "UTF-8", "html");
          message.setFrom(new InternetAddress("admin@mss.com"));
          message.addRecipient(RecipientType.TO, new InternetAddress(email));
          mailSender.send(message);
		}catch(Exception e){
		          e.printStackTrace();
		}
		
	}

	@Override
	public int changePassword(Map<String, Object> info) {
		return sqlSession.update("spring.mvc.bridge.persistence.DAO_Main.changePassword", info);
	}
	/* 20.02.13 - 문성혁, 아이디 찾아주는 DAO 메서드 */
	
	
	
	
	
//	@Override
//	public int idCheck(String strId) {
//		int selectCnt = sqlSession.selectOne("spring.mvc.pj_test.persistence.LocalDAO.idCheck",strId);
//		
//		return selectCnt;
//	}
//	
//	@Override
//	public String pwdCheck(String strId) {
//		String pwd = sqlSession.selectOne("spring.mvc.pj_test.persistence.LocalDAO.pwdCheck",strId);
//		
//		return pwd;
//	}
//	@Override
//	public int insertMember(VO_Member vo) {
//		int insertCnt = sqlSession.insert("spring.mvc.pj_test.persistence.LocalDAO.insertMember", vo);
//		
//		return insertCnt;
//	}
//
//	
//	@Override
//	public String searchId(VO_Member vo) {
//		String id = sqlSession.selectOne("spring.mvc.pj_test.persistence.LocalDAO.searchId", vo);
//	
//		return id;
//	}
//	
//	@Override
//	public String searchPwd(VO_Member vo) {
//		String pwd = sqlSession.selectOne("spring.mvc.pj_test.persistence.LocalDAO.searchPwd", vo);
//		
//		return pwd;
//	}
//	
//	@Override
//	public int gradeCheck(String strId) {
//		String grade = sqlSession.selectOne("spring.mvc.pj_test.persistence.LocalDAO.gradeCheck", strId);
//		int gradeCnt = 0;
//		
//		if(grade.equals("ROLE_USER")) {
//			gradeCnt = 1;
//		}else {
//			gradeCnt = 0;
//		}
//			
//		return gradeCnt;
//	}
//	
//
//	@Override
//	public void sendMail(String toEmail, String key) {
//		
//		try{
//            MimeMessage message = mailSender.createMimeMessage();
//            String txt = "회원가입 인증 메일입니다. 링크를 눌러 회원가입을 완료하세요." 
//
//			+ "<a href='http://localhost/pj_test/emailChk.lo?key=" + key + "'>Please click</a>";
//            System.out.println(txt);
//          message.setSubject("회원가입 인증 메일입니다.");
//          message.setText(txt, "UTF-8", "html");
//          message.setFrom(new InternetAddress("admin@mss.com"));
//          message.addRecipient(RecipientType.TO, new InternetAddress(toEmail));
//          mailSender.send(message);
//		}catch(Exception e){
//		          e.printStackTrace();
//		}  
//		
//	}
//
//	@Override
//	public int selectKey(String key) {
//		int selectCnt = sqlSession.selectOne("spring.mvc.pj_test.persistence.LocalDAO.selectKey", key);
//		
//		return selectCnt;
//	}
//
//	@Override
//	public int updateGrade(String key) {
//		int updateCnt = sqlSession.update("spring.mvc.pj_test.persistence.LocalDAO.updateGrade", key);
//		return updateCnt;
//	}

}

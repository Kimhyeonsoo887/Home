package spring.mvc.woorizib.persistence;

import java.util.Map;

import javax.mail.Message.RecipientType;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Repository;

import spring.mvc.woorizib.vo.VO_Member;
import spring.mvc.woorizib.vo.VO_Seller;

@Repository
public class DAO_AllImpl implements DAO_All {

	@Autowired
	SqlSession sqlSession;

	@Autowired
	private JavaMailSender mailSender;

	@Override
	public int signUp(VO_Member vo) {
		return sqlSession.insert("spring.mvc.woorizib.persistence.DAO_All.signUp", vo);
	}

	// 회원수정 및 회원탈퇴 -----------------------------전영현

	// 패스워드 체크
	@Override
	public String pwdCheck(String mem_id) {
		return sqlSession.selectOne("spring.mvc.woorizib.persistence.DAO_All.pwdCheck", mem_id);

	}

	// 회원정보 가져오기
	@Override
	public VO_Member readMember(String input_id) {
		return sqlSession.selectOne("spring.mvc.woorizib.persistence.DAO_All.readMember", input_id);

	}

	// 회원정보 수정
	@Override
	public int updateMember(VO_Member vo) {
		return sqlSession.update("spring.mvc.woorizib.persistence.DAO_All.updateMember", vo);
	}

	// 회원탈퇴
	@Override
	public int deleteMember(String member_id) {

		return sqlSession.delete("spring.mvc.woorizib.persistence.DAO_All.deleteMember", member_id);
	}

	/* 20.02.13 - 문성혁, 아이디 찾아주는 DAO 메서드 */
	@Override
	public int checkName(String inputName) {
		return sqlSession.selectOne("spring.mvc.woorizib.persistence.DAO_All.checkName", inputName);
	}

	@Override
	public int checkPhone(Map<String, Object> info) {
		return sqlSession.selectOne("spring.mvc.woorizib.persistence.DAO_All.checkPhone", info);	
	}

	@Override
	public String findAccount(Map<String, Object> info) {
		return sqlSession.selectOne("spring.mvc.woorizib.persistence.DAO_All.findAccount", info);
	}
	
	
	@Override
	public int checkAccount(String member_id) {
		return sqlSession.selectOne("spring.mvc.woorizib.persistence.DAO_All.checkAccount", member_id);
	}

	@Override
	public String findEmail(String member_id) {
		return sqlSession.selectOne("spring.mvc.woorizib.persistence.DAO_All.findEmail", member_id);
	}
	
	@Override
	public int checkAccountS(String id) {
		return sqlSession.selectOne("spring.mvc.woorizib.persistence.DAO_All.checkAccountS", id);
	}
		
	@Override
	public String findEmailS(String id) {
		return sqlSession.selectOne("spring.mvc.woorizib.persistence.DAO_All.findEmailS", id);
	}
	
	
	@Override
	public int checkNameS(String inputName) {
		return sqlSession.selectOne("spring.mvc.woorizib.persistence.DAO_All.checkNameS", inputName);
	}

	@Override
	public int checkPhoneS(Map<String, Object> info) {
		return sqlSession.selectOne("spring.mvc.woorizib.persistence.DAO_All.checkPhoneS", info);	
	}

	@Override
	public String findAccountS(Map<String, Object> info) {
		return sqlSession.selectOne("spring.mvc.woorizib.persistence.DAO_All.findAccountS", info);
	}
	

	
	//이메일 설정은 servlet-context에서 이뤄진다.
	@Override
	public void sendPwEmail(String id, String email) {
		
		try{
            MimeMessage message = mailSender.createMimeMessage();
            String txt = id + "님의 비밀번호 변경 페이지 입니다. 변경을 눌러 비밀번호를 변경해주세요." 

			+ "[<a href='http://localhost/woorizib/all_changePasswordPage.all?id=" + id + "'>변경</a>]";
          message.setSubject("[우리집] 비밀번호 변경 페이지 입니다.");
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
		return sqlSession.update("spring.mvc.woorizib.persistence.DAO_All.changePassword", info);
	}
	/* 20.02.13 - 문성혁, 아이디 찾아주는 DAO 메서드 */
	
	/* 20.02.25 - 문성혁, 아이디 중복확인 */
	@Override
	public int signupconfirmid(String id) {
		return sqlSession.selectOne("spring.mvc.woorizib.persistence.DAO_All.signupconfirmid", id);
	}
	/* 20.02.25 - 문성혁, 아이디 중복확인 */

	@Override
	public void sendEmail(VO_Member vo) {
		try{
            MimeMessage message = mailSender.createMimeMessage();
            String txt = "안녕하세요, "+vo.getMem_id()+"님 우리집에 가입해주셔서 감사합니다. 인증 버튼을 눌러 인증을 완료해주세요." 

			+ "[<a href='http://localhost/woorizib/all_membercertification.all?key=" + vo.getMem_key() + "'>인증</a>]";
          message.setSubject("[우리집] 일반회원 인증 링크입니다.");
          message.setText(txt, "UTF-8", "html");
          message.setFrom(new InternetAddress("admin@mss.com"));
          message.addRecipient(RecipientType.TO, new InternetAddress(vo.getMem_email()));
          mailSender.send(message);
		}catch(Exception e){
		          e.printStackTrace();
		}
	}

	@Override
	public int findMemberByKey(String key) {
		return sqlSession.selectOne("spring.mvc.woorizib.persistence.DAO_All.findMemberByKey", key);
	}

	@Override
	public int updateMemberCertf(String key) {
		return sqlSession.update("spring.mvc.woorizib.persistence.DAO_All.updateMemberCertf", key);
	}

	@Override
	public int findSellerByKey(String key) {
		return sqlSession.selectOne("spring.mvc.woorizib.persistence.DAO_All.findSellerByKey", key);
	}

	@Override
	public int updateSellerCertf(String key) {
		return sqlSession.update("spring.mvc.woorizib.persistence.DAO_All.updateSellerCertf", key);
	}

	@Override
	public String checkAuthorityById(String id) {
		return sqlSession.selectOne("spring.mvc.woorizib.persistence.DAO_All.checkAuthorityById", id);
	}

	@Override
	public int changePasswordS(Map<String, Object> info) {
		return sqlSession.update("spring.mvc.woorizib.persistence.DAO_All.changePasswordS", info);
	}
	
	@Override
	public int signupSeller(VO_Seller vo) {
		return sqlSession.insert("spring.mvc.woorizib.persistence.DAO_Seller.signupSeller", vo);
	}

	@Override
	public void sendEmailS(VO_Seller vo) {
		try{
            MimeMessage message = mailSender.createMimeMessage();
            String txt = "안녕하세요, "+vo.getSel_id()+"님 우리집에 가입해주셔서 감사합니다. 인증 버튼을 눌러 인증을 완료해주세요." 

			+ "[<a href='http://localhost/woorizib/all_sellercertification.all?key=" + vo.getSel_key() + "'>인증</a>]";
          message.setSubject("[우리집] 셀러회원 인증 링크입니다.");
          message.setText(txt, "UTF-8", "html");
          message.setFrom(new InternetAddress("admin@mss.com"));
          message.addRecipient(RecipientType.TO, new InternetAddress(vo.getSel_email()));
          mailSender.send(message);
		}catch(Exception e){
		          e.printStackTrace();
		}
	}

	
	
	
	
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

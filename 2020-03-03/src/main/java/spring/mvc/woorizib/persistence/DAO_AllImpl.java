package spring.mvc.woorizib.persistence;

import java.util.List;
import java.util.Map;

import javax.mail.Message.RecipientType;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Repository;

import spring.mvc.woorizib.vo.VO_Auction;
import spring.mvc.woorizib.vo.VO_Community;
import spring.mvc.woorizib.vo.VO_LiveAuc;
import spring.mvc.woorizib.vo.VO_Member;
import spring.mvc.woorizib.vo.VO_Property;
import spring.mvc.woorizib.vo.VO_QnA;
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

	
	/* 20.02.25 - 허은정, 커뮤니티 DAO 메서드 */
	
	//게시글 갯수 구하기
	@Override
	public int getArticleCnt() {
		return sqlSession.selectOne("spring.mvc.woorizib.persistence.DAO_All.getArticleCnt");
	}

	//게시글 목록
	@Override
	public List<VO_Community> getArticleList(Map<String, Object> map) {
		return sqlSession.selectList("spring.mvc.woorizib.persistence.DAO_All.getArticleList", map);
	}

	//상세페이지 조회
	@Override
	public VO_Community getArticle(int gnd_number) {
		return sqlSession.selectOne("spring.mvc.woorizib.persistence.DAO_All.getArticle", gnd_number);
	}

	//게시글 수정
	@Override
	public int updateCommunity(VO_Community vo) {
		return sqlSession.insert("spring.mvc.woorizib.persistence.DAO_All.updateCommunity", vo);
	}

	//글쓰기 처리
	@Override
	public int insertCommunity(VO_Community vo) {
		return sqlSession.insert("spring.mvc.woorizib.persistence.DAO_All.insertCommunity", vo);
	}

	//게시글 삭제
	@Override
	public int deleteCommunity(int num) {
		return sqlSession.delete("spring.mvc.woorizib.persistence.DAO_All.deleteCommunity", num);
	}
	
	/* 20.02.25 - 허은정, 커뮤니티 DAO 메서드 */
	
	
	@Override
	public int getQnaCnt() {
		DAO_All dao=sqlSession.getMapper(DAO_All.class);
		return dao.getQnaCnt();
		
	}

	@Override
	public List<VO_QnA> getQnaList(Map<String, Object> map) {
		
		return sqlSession.selectList("spring.mvc.woorizib.persistence.DAO_All.getQnaList",map);
	}
	
	
	
	
	/*박은슬 경매  2020-03-05*/
	//경매 상세정보
	@Override
	public VO_Auction getAuction(String auc_number) {
		return sqlSession.selectOne("spring.mvc.woorizib.persistence.DAO_All.getAuction",auc_number);
	}

	//해당경매의 매물고유번호 가져오기
	@Override
	public String getPrp_number(String auc_number) {
		return sqlSession.selectOne("spring.mvc.woorizib.persistence.DAO_All.getPrp_number",auc_number);
	}

	//해당경매의 매물정보 가져오기
	@Override
	public VO_Property getProperty(String prp_number) {
		return sqlSession.selectOne("spring.mvc.woorizib.persistence.DAO_All.getProperty", prp_number);
	}

	//경매의 실시간 입찰현황
	@Override
	public List<VO_LiveAuc> getLiveAucs(String auc_number) {
		DAO_All dao=sqlSession.getMapper(DAO_All.class);
		return dao.getLiveAucs(auc_number);
	}

	//경매 현재최고가
	@Override
	public int getNowPrice(String auc_number) {
		return sqlSession.selectOne("spring.mvc.woorizib.persistence.DAO_All.getNowPrice", auc_number);
	}

	//마감시간이 된 경매 상태를 마감으로 바꿔주기
	@Override
	public int checkAuction(String time) {
		return sqlSession.update("spring.mvc.woorizib.persistence.DAO_All.checkAuction", time);
		
	}
	
	
	


}

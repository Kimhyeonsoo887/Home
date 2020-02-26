package spring.mvc.woorizib.persistence;

import java.util.Map;

import spring.mvc.woorizib.vo.VO_Member;
import spring.mvc.woorizib.vo.VO_Seller;

public interface DAO_All {
	
	/* 20.02.26 - 회원가입, 아이디 & 비밀번호 인증 */
	
	//일반회원정보 가져오기
	public VO_Member readMember(String input_id);
	
	//회원가입 중복확인
	public int signupconfirmid(String id);
	
	//멤버 회원가입
	public int signUp(VO_Member vo);
	//멤버 회원가입 - 이메일전송
	public void sendEmail(VO_Member vo);
	//셀러 회원가입
	public int signupSeller(VO_Seller vo);
	//셀러 회원가입 - 이메일 전송
	public void sendEmailS(VO_Seller vo);
	
	//멤버 패스워드 체크 
	public String pwdCheck(String mem_id);
	//셀러 패스워드 체크
	// > MAPPER에는 등록되어있습니다. 편의상 추가해놓음
	
	//비밀번호 찾기 - 계정으로 권한찾기
	public String checkAuthorityById(String id);
	
	//멤버 아이디 찾기 - 이름확인
	public int checkName(String inputName);
	//멤버 아이디 찾기 - 번호확인
	public int checkPhone(Map<String, Object> info);
	//멤버 아이디 찾기 - 계정찾기
	public String findAccount(Map<String, Object> info);
	//멤버 계정 존재유무 확인
	public int checkAccount(String member_id);
	//멤버 이메일 찾기
	public String findEmail(String member_id);
	//멤버 비밀번호 변경 쿼리
	public int changePassword(Map<String, Object> info);
	
	//셀러 아이디 찾기 - 이름확인
	public int checkNameS(String inputName);
	//셀러 아이디 찾기 - 번호확인
	public int checkPhoneS(Map<String, Object> info);
	//셀러 아이디 찾기 - 계정찾기
	public String findAccountS(Map<String, Object> info);
	//셀러 계정 존재유무 확인
	public int checkAccountS(String id);
	//셀러 이메일 찾기
	public String findEmailS(String id);
	//셀러 비밀번호 변경
	public int changePasswordS(Map<String, Object> info);
	
	//비밀번호 변경 메일전송
	public void sendPwEmail(String id, String email);
	
	
	/* 20.02.26 - 회원가입, 아이디 & 비밀번호 인증 */
	
	
	//회원수정 및 회원탈퇴 ----------------------전영현
	
	//회원정보 수정 
	public int updateMember(VO_Member vo);
	//회원 탈퇴 
	public int deleteMember(String member_id);
	
	public int findMemberByKey(String key);

	public int updateMemberCertf(String key);

	public int findSellerByKey(String key);

	public int updateSellerCertf(String key);
	
}

package spring.mvc.bridge.persistence;

import java.util.Map;

import spring.mvc.bridge.vo.VO_Member;

public interface DAO_Main {

	public int signUp(VO_Member vo);
	
	//회원수정 및 회원탈퇴 ----------------------전영현
	
	//패스워드 체크 
	public String pwdCheck(String mem_id);
	
	//회원정보 가져오기
	public VO_Member readMember(String mem_id);
	
	//회원정보 수정 
	public int updateMember(VO_Member vo);
	
	//회원 탈퇴 
	public int deleteMember(String member_id);
	
	/* 20.02.13 - 문성혁, 아이디 찾아주는 DAO 메서드 */
	//아이디 찾기
	public int checkName(String inputName);
	//전화번호 찾기
	public int checkPhone(Map<String, Object> info);
	//계정 찾기
	public String findAccount(Map<String, Object> info);
	
	//아이디 존재유무
	public int checkAccount(String member_id);
	//이메일 찾기
	public String findEmail(String member_id);
	//비밀번호 변경 메일전송
	public void sendPwEmail(String member_id, String email);
	//비밀번호 변경 쿼리
	public int changePassword(Map<String, Object> info);
	/* 20.02.13 - 문성혁, 아이디 찾아주는 DAO 메서드 */
}

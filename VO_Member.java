package spring.mvc.bridge.vo;

public class VO_Member {
	
	private String member_id; 		//PRIMARY KEY 이메일을 아이디로 사용한다.
	private String member_name;		//이름
	private String member_phone;		//핸드폰
	private String member_email;	//이메일
	private String member_pw; 		//VARCHAR2(20) NOT NULL,
	private String enabled; 		//CHAR(1) DEFAULT 0
	private String authority;
	
	public String getMember_pw() {
		return member_pw;
	}
	public void setMember_pw(String member_pw) {
		this.member_pw = member_pw;
	}
	
	public String getEnabled() {
		return enabled;
	}
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	public void setEnabled(String enabled) {
		this.enabled = enabled;
	}
	public String getAuthority() {
		return authority;
	}
	public void setAuthority(String authority) {
		this.authority = authority;
	}
	
	public String getMember_name() {
		return member_name;
	}
	
	
	public String getMember_phone() {
		return member_phone;
	}
	public void setMember_phone(String member_phone) {
		this.member_phone = member_phone;
	}
	public void setMember_name(String member_name) {
		this.member_name = member_name;
	}
	
	public String getMember_email() {
		return member_email;
	}
	public void setMember_email(String member_email) {
		this.member_email = member_email;
	}
	
	
}

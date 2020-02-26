package spring.mvc.woorizib.vo;

public class VO_Member {
	
	private String mem_id; 		//PRIMARY KEY 이메일을 아이디로 사용한다.
	private String mem_name;		//이름
	private String mem_phone;		//핸드폰
	private String mem_email;	//이메일
	private String mem_pw; 		//VARCHAR2(20) NOT NULL,
	private String mem_certification; 		//CHAR(1) DEFAULT 0
	private String authority;
	private String mem_key;
	
	public String getMem_key() {
		return mem_key;
	}
	public void setMem_key(String mem_key) {
		this.mem_key = mem_key;
	}
	public String getMem_pw() {
		return mem_pw;
	}
	public void setMem_pw(String mem_pw) {
		this.mem_pw = mem_pw;
	}
	

	public String getMem_certification() {
		return mem_certification;
	}
	public void setMem_certification(String mem_certification) {
		this.mem_certification = mem_certification;
	}
	public String getMem_id() {
		return mem_id;
	}
	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}
	
	public String getAuthority() {
		return authority;
	}
	public void setAuthority(String authority) {
		this.authority = authority;
	}
	
	public String getMem_name() {
		return mem_name;
	}
	
	public String getMem_phone() {
		return mem_phone;
	}
	public void setMem_phone(String mem_phone) {
		this.mem_phone = mem_phone;
	}
	public void setMem_name(String mem_name) {
		this.mem_name = mem_name;
	}
	
	public String getMem_email() {
		return mem_email;
	}
	public void setMem_email(String mem_email) {
		this.mem_email = mem_email;
	}
	
	
}

package spring.mvc.woorizib.vo;

public class VO_Admin {
	private String adm_id; //VARCHAR2(30) NOT NULL, /* 관리자계정 */
	private String adm_pw; //VARCHAR2(100) NOT NULL, /* 관리자비밀번호 */
	private String adm_email; //VARCHAR2(50) NOT NULL, /* 관리자이메일 */
	private String adm_name; //VARCHAR2(20), /* 관리자이름 */
	private int adm_phone; //NUMBER(11), /* 관리자전화번호 */
	private String authority; //VARCHAR2(20) NOT NULL, /* 권한 */.
	
	public String getAdm_id() {
		return adm_id;
	}
	public void setAdm_id(String adm_id) {
		this.adm_id = adm_id;
	}
	public String getAdm_pw() {
		return adm_pw;
	}
	public void setAdm_pw(String adm_pw) {
		this.adm_pw = adm_pw;
	}
	public String getAdm_email() {
		return adm_email;
	}
	public void setAdm_email(String adm_email) {
		this.adm_email = adm_email;
	}
	public String getAdm_name() {
		return adm_name;
	}
	public void setAdm_name(String adm_name) {
		this.adm_name = adm_name;
	}
	public int getAdm_phone() {
		return adm_phone;
	}
	public void setAdm_phone(int adm_phone) {
		this.adm_phone = adm_phone;
	}
	public String getAuthority() {
		return authority;
	}
	public void setAuthority(String authority) {
		this.authority = authority;
	}
	
	
	
}

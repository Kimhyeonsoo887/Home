package spring.mvc.woorizib.vo;

import java.sql.Timestamp;

public class VO_Seller {
	private String sel_id; //VARCHAR2(30) NOT NULL, /* 셀러계정 */
	private String sel_pw; //VARCHAR2(100) NOT NULL, /* 셀러비밀번호 */
	private String sel_name; //VARCHAR2(20) NOT NULL, /* 셀러이름 */
	private String sel_email; //VARCHAR2(20) NOT NULL, /* 셀러이메일 */
	private int sel_phone; //NUMBER(11) NOT NULL, /* 셀러전화번호 */
	private String sel_certification; //NUMBER(1) DEFAULT 0, /* 셀러인증여부 */
	private String sel_key; //VARCHAR2(10), /* 셀러인증코드 */
	private String sel_license; //VARCHAR2(100) NOT NULL, /* 셀러사업자등록증 */
	private String authority; //VARCHAR2(20) NOT NULL, /* 권한 */
	private String agn_number; //VARCHAR(30), /* 업체번호 */
	
	private int sel_reportcnt;
	
	private Timestamp sel_registerdate;
	

	
	private int start;
	private int end;
	
	
	public Timestamp getSel_registerdate() {
		return sel_registerdate;
	}
	public void setSel_registerdate(Timestamp sel_registerdate) {
		this.sel_registerdate = sel_registerdate;
	}
	
	
	public int getSel_reportcnt() {
		return sel_reportcnt;
	}
	public void setSel_reportcnt(int sel_reportcnt) {
		this.sel_reportcnt = sel_reportcnt;
	}
	public int getStart() {
		return start;
	}
	public void setStart(int start) {
		this.start = start;
	}
	public int getEnd() {
		return end;
	}
	public void setEnd(int end) {
		this.end = end;
	}
	public String getSel_id() {
		return sel_id;
	}
	public void setSel_id(String sel_id) {
		this.sel_id = sel_id;
	}
	public String getSel_pw() {
		return sel_pw;
	}
	public void setSel_pw(String sel_pw) {
		this.sel_pw = sel_pw;
	}
	public String getSel_name() {
		return sel_name;
	}
	public void setSel_name(String sel_name) {
		this.sel_name = sel_name;
	}
	public String getSel_email() {
		return sel_email;
	}
	public void setSel_email(String sel_email) {
		this.sel_email = sel_email;
	}
	public int getSel_phone() {
		return sel_phone;
	}
	public void setSel_phone(int sel_phone) {
		this.sel_phone = sel_phone;
	}
	public String getSel_certification() {
		return sel_certification;
	}
	public void setSel_certification(String sel_certification) {
		this.sel_certification = sel_certification;
	}
	public String getSel_key() {
		return sel_key;
	}
	public void setSel_key(String sel_key) {
		this.sel_key = sel_key;
	}
	public String getSel_license() {
		return sel_license;
	}
	public void setSel_license(String sel_license) {
		this.sel_license = sel_license;
	}
	public String getAuthority() {
		return authority;
	}
	public void setAuthority(String authority) {
		this.authority = authority;
	}
	public String getAgn_number() {
		return agn_number;
	}
	public void setAgn_number(String agn_number) {
		this.agn_number = agn_number;
	}
	
}

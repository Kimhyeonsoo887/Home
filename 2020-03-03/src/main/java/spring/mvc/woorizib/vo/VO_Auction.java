package spring.mvc.woorizib.vo;

import java.sql.Timestamp;

public class VO_Auction {

	private String auc_number; /* 경매번호 */
	private String auc_name; /* 경매명 */
	private String auc_state; /* 경매상태 */
	private Timestamp auc_starttime; /* 입찰시작시간 */
	private Timestamp auc_endtime; /* 입찰마감시간 */
	private Timestamp auc_opendate; /* 개찰일 */
	private String auc_paymethod; /* 대금납부방식 */
	private Timestamp auc_paydate; /* 대금납부기간 */
	private int auc_minbid; /* 최저입찰가 */
	private int auc_finalbid; /* 최종입찰가 */
	private String prp_number;
	public String getAuc_number() {
		return auc_number;
	}
	public void setAuc_number(String auc_number) {
		this.auc_number = auc_number;
	}
	public String getAuc_name() {
		return auc_name;
	}
	public void setAuc_name(String auc_name) {
		this.auc_name = auc_name;
	}
	public String getAuc_state() {
		return auc_state;
	}
	public void setAuc_state(String auc_state) {
		this.auc_state = auc_state;
	}
	public Timestamp getAuc_starttime() {
		return auc_starttime;
	}
	public void setAuc_starttime(Timestamp auc_starttime) {
		this.auc_starttime = auc_starttime;
	}
	public Timestamp getAuc_endtime() {
		return auc_endtime;
	}
	public void setAuct_endtime(Timestamp auc_endtime) {
		this.auc_endtime = auc_endtime;
	}
	public Timestamp getAuc_opendate() {
		return auc_opendate;
	}
	public void setAuc_opendate(Timestamp auc_opendate) {
		this.auc_opendate = auc_opendate;
	}
	public String getAuc_paymethod() {
		return auc_paymethod;
	}
	public void setAuc_paymethod(String auc_paymethod) {
		this.auc_paymethod = auc_paymethod;
	}
	public Timestamp getAuc_paydate() {
		return auc_paydate;
	}
	public void setAuc_paydate(Timestamp auc_paydate) {
		this.auc_paydate = auc_paydate;
	}
	public int getAuc_minbid() {
		return auc_minbid;
	}
	public void setAuc_minbid(int auc_minbid) {
		this.auc_minbid = auc_minbid;
	}
	public int getAuc_finalbid() {
		return auc_finalbid;
	}
	public void setAuc_finalbid(int auc_finalbid) {
		this.auc_finalbid = auc_finalbid;
	}
	public String getPrp_number() {
		return prp_number;
	}
	public void setPrp_number(String prp_number) {
		this.prp_number = prp_number;
	}
	
	
}

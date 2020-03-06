package spring.mvc.woorizib.vo;

import java.sql.Timestamp;

public class VO_LiveAuc {
	private String mem_id; /* 회원계정 */
	private int lac_account; /* 참가자계좌번호 */
	private int lac_tender; /* 참가자입찰액 */
	private int lac_winningbid; /* 참가자낙찰액 */
	private String auc_number; /* 경매번호 */
    private Timestamp lac_registerdate;
    
	public String getMem_id() {
		return mem_id;
	}
	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}
	public int getLac_account() {
		return lac_account;
	}
	public void setLac_account(int lac_account) {
		this.lac_account = lac_account;
	}
	public int getLac_tender() {
		return lac_tender;
	}
	public void setLac_tender(int lac_tender) {
		this.lac_tender = lac_tender;
	}
	public int getLac_winningbid() {
		return lac_winningbid;
	}
	public void setLac_winningbid(int lac_winningbid) {
		this.lac_winningbid = lac_winningbid;
	}
	public String getAuc_number() {
		return auc_number;
	}
	public void setAuc_number(String auc_number) {
		this.auc_number = auc_number;
	}
	public Timestamp getLac_registerdate() {
		return lac_registerdate;
	}
	public void setLac_registerdate(Timestamp lac_registerdate) {
		this.lac_registerdate = lac_registerdate;
	}
    
    
}

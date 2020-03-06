package spring.mvc.woorizib.vo;

import java.sql.Timestamp;

public class VO_QnA {
	
	private String qna_number;   		//QnA 번호
	private String qna_type;			//QnA 분류
	private String qna_accessibility;	//QnA 공개 여부 
	private String qna_title;			//QnA 제목
	private String qna_content;			//QnA 내용
	private Timestamp qna_registerdate;		//QnA 작성일
	private Timestamp qna_modifieddate;		//QnA 수정일
	private String mem_id;				//회원계정	
	private String sel_id;				//셀러 계정	
	private int	qna_readcnt;				//조회수 
	
	

	public String getMem_id() {
		return mem_id;
	}
	
	public Timestamp getQna_registerdate() {
		return qna_registerdate;
	}

	public void setQna_registerdate(Timestamp qna_registerdate) {
		this.qna_registerdate = qna_registerdate;
	}

	public Timestamp getQna_modifieddate() {
		return qna_modifieddate;
	}

	public void setQna_modifieddate(Timestamp qna_modifieddate) {
		this.qna_modifieddate = qna_modifieddate;
	}

	public int getQna_readcnt() {
		return qna_readcnt;
	}

	public void setQna_readcnt(int qna_readcnt) {
		this.qna_readcnt = qna_readcnt;
	}

	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}
	public String getSel_id() {
		return sel_id;
	}
	public void setSel_id(String sel_id) {
		this.sel_id = sel_id;
	}
	public String getQna_number() {
		return qna_number;
	}
	public void setQna_number(String qna_number) {
		this.qna_number = qna_number;
	}
	public String getQna_type() {
		return qna_type;
	}
	public void setQna_type(String qna_type) {
		this.qna_type = qna_type;
	}
	public String getQna_accessibility() {
		return qna_accessibility;
	}
	public void setQna_accessibility(String qna_accessibility) {
		this.qna_accessibility = qna_accessibility;
	}
	public String getQna_title() {
		return qna_title;
	}
	public void setQna_title(String qna_title) {
		this.qna_title = qna_title;
	}
	public String getQna_content() {
		return qna_content;
	}
	public void setQna_content(String qna_content) {
		this.qna_content = qna_content;
	}
	

}

package spring.mvc.woorizib.vo;

import java.sql.Timestamp;

//댓글 
public class VO_Comments {

	private String cmt_number;
	private String cmt_content;
	private Timestamp cmt_registerdate;
	private String cmt_writer;
	private String gnd_number;
	private String qna_number;
	
	public String getCmt_number() {
		return cmt_number;
	}
	public void setCmt_number(String cmt_number) {
		this.cmt_number = cmt_number;
	}
	public String getCmt_writer() {
		return cmt_writer;
	}
	public void setCmt_writer(String cmt_writer) {
		this.cmt_writer = cmt_writer;
	}
	public String getCmt_content() {
		return cmt_content;
	}
	public void setCmt_content(String cmt_content) {
		this.cmt_content = cmt_content;
	}
	public Timestamp getCmt_registerdate() {
		return cmt_registerdate;
	}
	public void setCmt_registerdate(Timestamp cmt_registerdate) {
		this.cmt_registerdate = cmt_registerdate;
	}
	
	public String getGnd_number() {
		return gnd_number;
	}
	public void setGnd_number(String gnd_number) {
		this.gnd_number = gnd_number;
	}
	
	public String getQna_number() {
		return qna_number;
	}
	public void setQna_number(String qna_number) {
		this.qna_number = qna_number;
	}
	
}

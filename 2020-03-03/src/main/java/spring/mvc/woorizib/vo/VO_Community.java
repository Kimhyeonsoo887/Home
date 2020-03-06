package spring.mvc.woorizib.vo;

import java.sql.Timestamp;

public class VO_Community {

	private String gnd_number; //VARCHAR2(30 BYTE)
	private String gnd_title; //VARCHAR2(100 BYTE)
	private String gnd_content; //VARCHAR2(3000 BYTE)
	private String mem_id; //VARCHAR2(30 BYTE)
	private String sel_id; //VARCHAR2(30 BYTE)
	private Timestamp gnd_registerdate;
	
	
	
	public Timestamp getGnd_registerdate() {
		return gnd_registerdate;
	}
	public void setGnd_registerdate(Timestamp gnd_registerdate) {
		this.gnd_registerdate = gnd_registerdate;
	}
	public Timestamp getReg_date() {
		return reg_date;
	}
	public void setReg_date(Timestamp reg_date) {
		this.reg_date = reg_date;
	}
	private Timestamp reg_date;
	
	public String getGnd_number() {
		return gnd_number;
	}
	public void setGnd_number(String gnd_number) {
		this.gnd_number = gnd_number;
	}
	public String getGnd_title() {
		return gnd_title;
	}
	public void setGnd_title(String gnd_title) {
		this.gnd_title = gnd_title;
	}
	public String getGnd_content() {
		return gnd_content;
	}
	public void setGnd_content(String gnd_content) {
		this.gnd_content = gnd_content;
	}
	public String getMem_id() {
		return mem_id;
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
	
}

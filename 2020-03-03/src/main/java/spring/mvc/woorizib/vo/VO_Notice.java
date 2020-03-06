package spring.mvc.woorizib.vo;

import java.sql.Timestamp;

public class VO_Notice {
	private String 		ntc_number;			//NTC_NUMBER		VARCHAR2(30 BYTE)		No				1	
	private String 		ntc_title;			//NTC_TITLE			VARCHAR2(100 BYTE)		No				2	
	private String 		ntc_content;		//NTC_CONTENT		VARCHAR2(3000 BYTE)		No				3	
	private Timestamp 	ntc_registerdate;	//NTC_REGISTERDATE	TIMESTAMP(6)			Yes		sysdate	4	
	private String 		adm_id;				//ADM_ID			VARCHAR2(30 BYTE)		Yes				5
	
	public VO_Notice() {
		System.out.println("VO_Notice neeeww!!");
	}

	public VO_Notice(String ntc_number, String ntc_title, String ntc_content, Timestamp ntc_registerdate,
			String adm_id) {
		this.ntc_number = ntc_number;
		this.ntc_title = ntc_title;
		this.ntc_content = ntc_content;
		this.ntc_registerdate = ntc_registerdate;
		this.adm_id = adm_id;
	}

	public String getNtc_number() {
		return ntc_number;
	}

	public void setNtc_number(String ntc_number) {
		this.ntc_number = ntc_number;
	}

	public String getNtc_title() {
		return ntc_title;
	}

	public void setNtc_title(String ntc_title) {
		this.ntc_title = ntc_title;
	}

	public String getNtc_content() {
		return ntc_content;
	}

	public void setNtc_content(String ntc_content) {
		this.ntc_content = ntc_content;
	}

	public Timestamp getNtc_registerdate() {
		return ntc_registerdate;
	}

	public void setNtc_registerdate(Timestamp ntc_registerdate) {
		this.ntc_registerdate = ntc_registerdate;
	}

	public String getAdm_id() {
		return adm_id;
	}

	public void setAdm_id(String adm_id) {
		this.adm_id = adm_id;
	}
}

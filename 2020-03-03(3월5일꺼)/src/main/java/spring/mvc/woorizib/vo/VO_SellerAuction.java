package spring.mvc.woorizib.vo;

import java.sql.Timestamp;

public class VO_SellerAuction {

      private String auc_number;            //AUC_NUMBER      VARCHAR2(30 BYTE)   
      private String auc_name;            //AUC_NAME         VARCHAR2(60 BYTE)
      private String auc_state;            //AUC_STATE         VARCHAR2(30 BYTE)
      private Timestamp auc_starttime;      //AUC_STARTTIME      TIMESTAMP(6)
      private Timestamp auc_opendate;         //AUC_OPENDATE      TIMESTAMP(6)
      private String auc_paymethod;         //AUC_PAYMETHOD      VARCHAR2(20 BYTE)
      private Timestamp auc_paydate;         //AUC_PAYDATE      TIMESTAMP(6)
      private int auc_minbid;               //AUC_MINBID      NUMBER(12,0)
      private int auc_finalbid;            //AUC_FINALBID      NUMBER(12,0)   
      private String prp_number;            //PRP_NUMBER      VARCHAR2(30 BYTE)
      private Timestamp auc_endtime;         //AUC_ENDTIME      TIMESTAMP(6)
      
      //++경매 조회에 필요한 이미지 
      private String prp_image;            //PRP_IMAGE1      VARCHAR2(300 BYTE)
      
      public VO_SellerAuction() {
         System.out.println("VO_SellerAuction new!!");
      }
      public VO_SellerAuction(String auc_number, String auc_name, String auc_state, Timestamp auc_starttime,
            Timestamp auc_opendate, String auc_paymethod, Timestamp auc_paydate, int auc_minbid, int auc_finalbid,
            String prp_number, Timestamp auc_endtime, String prp_image) {
         this.auc_number = auc_number;
         this.auc_name = auc_name;
         this.auc_state = auc_state;
         this.auc_starttime = auc_starttime;
         this.auc_opendate = auc_opendate;
         this.auc_paymethod = auc_paymethod;
         this.auc_paydate = auc_paydate;
         this.auc_minbid = auc_minbid;
         this.auc_finalbid = auc_finalbid;
         this.prp_number = prp_number;
         this.auc_endtime = auc_endtime;
         this.prp_image = prp_image;
      }

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

      public Timestamp getAuc_endtime() {
         return auc_endtime;
      }

      public void setAuc_endtime(Timestamp auc_endtime) {
         this.auc_endtime = auc_endtime;
      }
      public String getPrp_image() {
         return prp_image;
      }
      public void setPrp_image(String prp_image) {
         this.prp_image = prp_image;
      }
}
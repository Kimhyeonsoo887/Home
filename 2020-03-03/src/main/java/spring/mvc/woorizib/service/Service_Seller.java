package spring.mvc.woorizib.service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartHttpServletRequest;

public interface Service_Seller {

	// 셀러 매물등록
	void sellerSalePro(MultipartHttpServletRequest req, Model model);

	// 등록한 매물 select
	public void sellerSaleSelect(HttpServletRequest req, Model model);

	// 매물 상세페이지
	public void sellerSelectProperty(HttpServletRequest req, Model model);

	
	/* 박찬하 2020.02.24 */
	// 경매 매물 등록
	public void auctionRegisterPro(HttpServletRequest req, Model model);
	/* 박찬하 2020.02.24 */

	/* 박찬하 2020.02.25 */
	// 경매 매물 정보 가져오기
	public void auctionModify(HttpServletRequest req, Model model);

	// 경매 매물 정보 수정
	public void auctionModifyPro(HttpServletRequest req, Model model);
	/* 박찬하 2020.02.25 */

	/* 박찬하 2020.03.05 */
	//경매 조회
	public void getAuctionList(HttpServletRequest req, Model model);
	//경매 삭제
	public void auctionDelete( HttpServletRequest req, Model model );
	/* 박찬하 2020.03.05 */
	
	
	//매물수정 리스트
	public void sellerModifyView(HttpServletRequest req, Model model);
	
	//매물수정 데이터 가져오기
	public void sellerModifySelect(HttpServletRequest req, Model model);
	
	//매물수정  Pro
	public void sellerModifyPro(MultipartHttpServletRequest req, Model model);
	
	//매물 삭제
	public void sellerPropertyDelete(HttpServletRequest req, Model model);
}

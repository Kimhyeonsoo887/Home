package spring.mvc.woorizib.controller;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import spring.mvc.woorizib.service.Service_Admin;
import spring.mvc.woorizib.service.Service_All;
import spring.mvc.woorizib.service.Service_Seller;

@Controller
public class Controller_Seller {

	private static final Logger logger = LoggerFactory.getLogger(Controller_Seller.class);

	@Autowired
	Service_Seller serviceSeller;

	/* 김현수 2020.02.20 */

	// 셀러 메인
	@RequestMapping("/seller_main.sel")
	public String seller_main() {
		logger.info("seller_main");

		return "seller/seller_main";
	}

	// 셀러 매물등록 메인페이지
	@RequestMapping("/seller_sale.sel")
	public String seller_sale() {
		logger.info("▶ /seller_sale.sel");

		return "seller/seller_sale";
	}

	// 셀러 매물등록 Pro
	@RequestMapping(value = "sellerSalePro.sel", method = RequestMethod.POST)
	public String seller_sale_Pro(MultipartHttpServletRequest req, Model model) {

		logger.info("seller_sale_Pro2222222");

		serviceSeller.sellerSalePro(req, model);
		return "seller/seller_sale_Pro";
	}

	// 셀러 매물조회
	@RequestMapping("/seller_sale_Lookup.sel")
	public String seller_sale_Lookup(HttpServletRequest req, Model model) {
		logger.info("seller_sale_Lookup");

		serviceSeller.sellerSaleSelect(req, model);
		return "seller/seller_sale_Lookup";
	}

	// 셀러 매물 상세페이지
	@RequestMapping("selectSale.sel")
	public String selectSale(HttpServletRequest req, Model model) {
		logger.info("selectSale.sel");

		serviceSeller.sellerSelectProperty(req, model);

		return "seller/selectSale";
	}

	// 셀러 매물수정 리스트
	@RequestMapping("/seller_modifyView.sel")
	public String seller_modifyView(HttpServletRequest req, Model model) {
		logger.info("seller_modifyView");

		serviceSeller.sellerModifyView(req, model);
		return "seller/seller_modifyView";

	}
	//셀러 매물수정 화면
	@RequestMapping("/seller_modify.sel")
	public String seller_modify(HttpServletRequest req, Model model) {
		logger.info("▶ /seller_main.sel");

		//셀러 등록할매물 데이터 가져오기
		serviceSeller.sellerModifySelect(req, model);
		return "seller/seller_modify";
	}
	
	@RequestMapping(value = "seller_modifyPro.sel", method = RequestMethod.POST)
	public String seller_modifyPro(MultipartHttpServletRequest req, Model model) {

		logger.info("seller_modifyPro");
		
		serviceSeller.sellerModifyPro(req, model);
		return "seller/seller_modifyPro";
	}
	
	
	@RequestMapping("seller_Property_delete.sel")
	public String seller_delete(HttpServletRequest req, Model model){
		
		logger.info("seller_Property_delete");
		
		
		serviceSeller.sellerPropertyDelete(req, model);
		return "seller/seller_Property_delete";
	}
	
	/* 김현수 2020.02.20 */

	/* 20.02.24 - 문성혁, 셀러 회원가입 */
	@RequestMapping("/seller_signup.sel")
	public String admin_signup() {
		logger.info("▶ /seller_signup.sel");
		return "seller_signup";
	}
	/* 20.02.24 - 문성혁, 셀러 회원가입 */
	
	
	
	
	/* 박찬하 2020.03.05 */
//	@RequestMapping("/seller_modify.sel")
//	public String seller_modify() {
//		logger.info("▶ /seller_main.sel");
//
//		return "seller/seller_modify";
//	}
	
	@RequestMapping("seller_delete.sel")
	public String seller_auctiondelete( HttpServletRequest req, Model model ) {
		logger.info("▶ /seller_auctiondelete.sel");
		
		//경매 번호를 넘겨주면, 해당하는 경매를 삭제합니다.
		serviceSeller.auctionDelete( req, model );
		
		return "seller/seller_deletePro";
	}
	/* 박찬하 2020.03.05 */

	// 셀러 매물수정 리스트 - 2020.03.06 수정									
	@RequestMapping("/seller_auctionModifyView.sel")
	public String seller_modifyauctionView( HttpServletRequest req, Model model ) {
		logger.info("seller_auctionModifyView.sel");

		//call the service
		serviceSeller.getAuctionList( req, model );
		
		return "seller/seller_auctionModifyView";
	}
		
	/* 박찬하 2020.02.24 */
	//경매 등록 페이지 
	@RequestMapping("seller_auctionRegister.sel")
	public String seller_auctionRegister( HttpServletRequest req, Model model ) {
		logger.info("▶ seller_auctionRegister.sel");
		
		String prp_number = req.getParameter("prp_number");
		req.setAttribute("prp_number", prp_number);
		
		return "seller/seller_auctionRegister";
	}
	@RequestMapping("seller_auctionRegisterPro.sel")
	public String seller_auctionRegisterPro( HttpServletRequest req, Model model ) {
		logger.info("▶ seller_auctionRegister.sel");
		
		serviceSeller.auctionRegisterPro(req, model);
		
		return "seller/seller_auctionRegisterPro";
	}
	/* 박찬하 2020.02.24 */
	/* 박찬하 2020.02.25 */
	//경매 정보 수정 
	@RequestMapping("seller_auctionModify.sel")
	public String seller_auctionModify( HttpServletRequest req, Model model ) {
		logger.info("▶ seller_auctionModify.sel");
		
		//수정하고자하는 경매데이터를 불러와야합니다.
		serviceSeller.auctionModify(req, model);
		
		return "seller/seller_auctionModify";
	}
	@RequestMapping("seller_auctionModifyPro.sel")
	public String seller_auctionModifyPro( HttpServletRequest req, Model model ) {
		logger.info("▶ seller_auctionModifyPro.sel");
		
		//기존에 있던 데이터를 update해야합니다.
		//call the service
		serviceSeller.auctionModifyPro( req, model );
		
		return "seller/seller_auctionModifyPro";
	}
	/* 박찬하 2020.02.25 */
	
	
	/* 20.02.24 - 문성혁, 셀러 회원가입 */

	/* 20.02.24 - 문성혁, 셀러 회원가입 */

}

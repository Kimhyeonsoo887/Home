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
	
	//셀러 메인
	@RequestMapping("/seller_main.sel")
	public String seller_main() {
		logger.info("seller_main");
		
		return "seller/seller_main";
	}
	
	//셀러 매물등록 메인페이지
	@RequestMapping("/seller_sale.sel")
	public String seller_sale() {
		logger.info("▶ /seller_sale.sel");
		
		return "seller/seller_sale";
	}
	
	//셀러 매물등록 
	@RequestMapping(value="/seller_sale_Pro.sel", method=RequestMethod.POST)
	public String seller_sale_Pro(MultipartHttpServletRequest req, Model model) {
		
		logger.info("seller_sale_Pro");
		
		
		return "seller/seller_sale_Pro";
	}
	
	//셀러 매물수정 리스트
	@RequestMapping("/seller_modifyView.sel")
	public String seller_modifyView() {
		logger.info("seller_modifyView");
		
		return "seller/seller_modifyView";
		
	}
	@RequestMapping("/seller_modify.sel")
	public String seller_modify() {
		logger.info("▶ /seller_main.sel");
		
		return "seller/seller_modify";
	}
	/* 김현수 2020.02.20 */
	
	
	/* 20.02.24 - 문성혁, 셀러 회원가입 */


	/* 20.02.24 - 문성혁, 셀러 회원가입 */
	

	
}

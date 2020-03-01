package spring.mvc.woorizib.service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartHttpServletRequest;

public interface Service_Seller {

	void signupSeller(MultipartHttpServletRequest req, Model model);
	
	
	void sellerSalePro(MultipartHttpServletRequest req, Model model);
}

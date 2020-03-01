package spring.mvc.woorizib.persistence;

import java.util.Map;

import spring.mvc.woorizib.vo.VO_Property;
import spring.mvc.woorizib.vo.VO_Member;
import spring.mvc.woorizib.vo.VO_Seller;

public interface DAO_Seller {

	int signupSeller(VO_Seller vo);

	
	//매물등록
	public int sellerSalePro(VO_Property vo);
//	
//	//매물등록 (이미지)
//	public int seller_sale_Pro_Images(VO_Property vo);
}

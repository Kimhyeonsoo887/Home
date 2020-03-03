package spring.mvc.woorizib.persistence;

import java.util.Map;

import javax.mail.Message.RecipientType;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Repository;

import spring.mvc.woorizib.vo.VO_Property;
import spring.mvc.woorizib.vo.VO_Member;
import spring.mvc.woorizib.vo.VO_Seller;

@Repository
public class DAO_SellerImpl implements DAO_Seller {

	@Autowired
	SqlSession sqlSession;
<<<<<<< HEAD
	
=======

	@Override
	public int signupSeller(VO_Seller vo) {
		return sqlSession.insert("spring.mvc.woorizib.persistence.DAO_Seller.signupSeller", vo);
	}

	//매물등록
>>>>>>> 875bf54fdb72fbed0623eb04b4a5587032cae5b3
	@Override
	public int sellerSalePro(VO_Property vo) {
		
		return sqlSession.insert("spring.mvc.woorizib.persistence.DAO_Seller.sellerSalePro",vo);
	}
//
//	//매물등록 (이미지)
//	@Override
//	public int seller_sale_Pro_Images(VO_Property vo) {
//		return 0;
//	}

<<<<<<< HEAD


	
	
=======
>>>>>>> 875bf54fdb72fbed0623eb04b4a5587032cae5b3

}

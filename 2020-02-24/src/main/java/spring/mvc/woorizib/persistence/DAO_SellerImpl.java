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
	
	@Override
	public int seller_sale_Pro(VO_Property vo) {
		
		return sqlSession.insert("spring.mvc.woorizib.persistence.DAO_Seller.seller_sale_Pro",vo);
	}



	
	

}

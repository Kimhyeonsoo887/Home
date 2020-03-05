package spring.mvc.woorizib.persistence;

import java.util.ArrayList;
import java.util.List;
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
import spring.mvc.woorizib.vo.VO_SellerAuction;

@Repository
public class DAO_SellerImpl implements DAO_Seller {

	@Autowired
	SqlSession sqlSession;

	

	@Override
	public int sellerSalePro(VO_Property vo) {

		return sqlSession.insert("spring.mvc.woorizib.persistence.DAO_Seller.sellerSalePro", vo);
	}

	// 매물select
	@Override
	public List<VO_Property> sellerSaleSelect(Map<String, Object> map) {

		List<VO_Property> list;
		DAO_Seller sel = sqlSession.getMapper(DAO_Seller.class);

		list = sel.sellerSaleSelect(map);
		return list;
	}

	@Override
	public VO_Property sellerSelectProperty(String saleNum) {

		return sqlSession.selectOne("spring.mvc.woorizib.persistence.DAO_Seller.sellerSelectProperty", saleNum);
	}

	
	/* 박찬하 2020.02.25 */
	@Override
	public int insertAuction(VO_SellerAuction sellerAuction) {
		return sqlSession.getMapper(DAO_Seller.class).insertAuction(sellerAuction);
	}

	@Override
	public VO_SellerAuction selectAuction(String auc_number) {
		return sqlSession.getMapper(DAO_Seller.class).selectAuction(auc_number);
	}

	@Override
	public int updateAuction(VO_SellerAuction sellerAuction) {
		return sqlSession.getMapper(DAO_Seller.class).updateAuction(sellerAuction);
	}
	/* 박찬하 2020.02.25 */

	/* 박찬하 2020.03.05 */
	@Override
	public List<VO_SellerAuction> selectAuctionList() {
		return sqlSession.getMapper(DAO_Seller.class).selectAuctionList();
	}
	@Override
	public int auctionDelete(String auc_number) {
		return sqlSession.getMapper(DAO_Seller.class).auctionDelete(auc_number);
	}
	/* 박찬하 2020.03.05 */
	
	
	//글갯수구하기
	@Override
	public int getArticleCnt() {
		return sqlSession.selectOne("spring.mvc.woorizib.persistence.DAO_Seller.getArticleCnt");
	}

	@Override
	public int getModifyCnt() {

		return sqlSession.selectOne("spring.mvc.woorizib.persistence.DAO_Seller.getModifyCnt");
	}

	@Override
	public List<VO_Property> sellerModifySelect(Map<String, Object> map) {

		List<VO_Property> list;
		
		DAO_Seller dao = sqlSession.getMapper(DAO_Seller.class);
		
		list = dao.sellerModifySelect(map);
		
		
		return list;
	}

	@Override
	public VO_Property sellerModifySelectDate(String saleNum) {
		
		return sqlSession.selectOne("spring.mvc.woorizib.persistence.DAO_Seller.sellerModifySelectDate",saleNum);
	}

	@Override
	public int sellerModifyPro(VO_Property vo) {
		
		return sqlSession.update("spring.mvc.woorizib.persistence.DAO_Seller.sellerModifyPro",vo);
	}

	@Override
	public int sellerPropertyDelete(String saleNum) {
		
		return sqlSession.delete("spring.mvc.woorizib.persistence.DAO_Seller.sellerPropertyDelete",saleNum);
	}
	
	
}

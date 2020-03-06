package spring.mvc.woorizib.persistence;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import spring.mvc.woorizib.vo.VO_Property;
import spring.mvc.woorizib.vo.VO_Member;
import spring.mvc.woorizib.vo.VO_Seller;
import spring.mvc.woorizib.vo.VO_SellerAuction;

public interface DAO_Seller {

	// 매물등록
	public int sellerSalePro(VO_Property vo);

	// 매물select
	public List<VO_Property> sellerSaleSelect(Map<String, Object> map);

	// 매물 상세페이지
	public VO_Property sellerSelectProperty(String saleNum);

	/* 박찬하 2020.02.24 */
	// 경매 정보 insert
	public int insertAuction(VO_SellerAuction sellerAuction);

	/* 박찬하 2020.02.24 */
	/* 박찬하 2020.02.25 */
	// 경매 정보 가져오기
	public VO_SellerAuction selectAuction(String auc_number);

	// 경매 정보 수정
	public int updateAuction(VO_SellerAuction sellerAuction);
	/* 박찬하 2020.02.25 */
	
	/* 박찬하 2020.03.05 */
	//경매 조회
	public List<VO_SellerAuction> selectAuctionList();
	//경매 삭제
	public int auctionDelete( String auc_number );
	/* 박찬하 2020.03.05 */
	
	
	// 김현수 2020-03-05
	//매물갯수구하기
	public int getArticleCnt();

	//매물수정 갯수구하기
	public int getModifyCnt();
	
	//매물수정 리스트(일반)
	public List<VO_Property> sellerModifySelect(Map<String, Object> map);
	
	//매물수정 갑가져오기 
	public VO_Property sellerModifySelectDate(String saleNum);

	//매물수정 Pro
	public int sellerModifyPro(VO_Property vo);
	
	//매물삭제
	public int sellerPropertyDelete(String saleNum);
	
	// 김현수 2020-03-05
}

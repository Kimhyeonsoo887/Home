package spring.mvc.woorizib.service;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import spring.mvc.woorizib.persistence.DAO_All;
import spring.mvc.woorizib.persistence.DAO_Seller;
import spring.mvc.woorizib.vo.VO_Property;
import spring.mvc.woorizib.vo.VO_Community;
import spring.mvc.woorizib.vo.VO_Member;
import spring.mvc.woorizib.vo.VO_Seller;
import spring.mvc.woorizib.vo.VO_SellerAuction;

@Service
public class Service_SellerImpl implements Service_Seller{
	
	@Autowired
	DAO_All daoAll;
	
	@Autowired
	DAO_Seller daoSeller;
	
	@Autowired
	BCryptPasswordEncoder passwordEncoder;	// 비밀번호 암호화 객체



	@Override
	public void sellerSalePro(MultipartHttpServletRequest req, Model model) {
		
		int insertCnt = 0;
		
		model.addAttribute("insertCnt",insertCnt);
		
		MultipartFile file1 = req.getFile("picTitle");
		MultipartFile file2 = req.getFile("pic1");
		MultipartFile file3 = req.getFile("pic2");
		MultipartFile file4 = req.getFile("pic3");
		MultipartFile file5 = req.getFile("pic4");
		MultipartFile file6 = req.getFile("pic5");
		
		String saveDir = req.getRealPath("/resources/images/sellerImages"); // 저장
																// 경로(C:\Dev\workspace\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\wtpwebapps\SPRING_BMS_Project\resources\images\)

		String realDir = "D:\\workspace\\2020-03-03\\src\\main\\webapp\\resources\\images\\sellerImages"; // 저장 경로

		try {
			file1.transferTo(new File(saveDir + file1.getOriginalFilename()));
			file2.transferTo(new File(saveDir + file2.getOriginalFilename()));
			file3.transferTo(new File(saveDir + file3.getOriginalFilename()));
			file4.transferTo(new File(saveDir + file4.getOriginalFilename()));
			file5.transferTo(new File(saveDir + file5.getOriginalFilename()));
			file6.transferTo(new File(saveDir + file6.getOriginalFilename()));
			
			FileInputStream fis1 = new FileInputStream(saveDir + file1.getOriginalFilename());
			FileOutputStream fos1 = new FileOutputStream(realDir + file1.getOriginalFilename());
			FileInputStream fis2 = new FileInputStream(saveDir + file2.getOriginalFilename());
			FileOutputStream fos2 = new FileOutputStream(realDir + file2.getOriginalFilename());
			FileInputStream fis3 = new FileInputStream(saveDir + file3.getOriginalFilename());
			FileOutputStream fos3 = new FileOutputStream(realDir + file3.getOriginalFilename());
			FileInputStream fis4 = new FileInputStream(saveDir + file4.getOriginalFilename());
			FileOutputStream fos4 = new FileOutputStream(realDir + file4.getOriginalFilename());
			FileInputStream fis5 = new FileInputStream(saveDir + file5.getOriginalFilename());
			FileOutputStream fos5 = new FileOutputStream(realDir + file5.getOriginalFilename());
			FileInputStream fis6 = new FileInputStream(saveDir + file6.getOriginalFilename());
			FileOutputStream fos6 = new FileOutputStream(realDir + file6.getOriginalFilename());
			
			int data1 = 0;
			int data2 = 0;
			int data3 = 0;
			int data4 = 0;
			int data5 = 0;
			int data6 = 0;
			
			
			while ((data1 = fis1.read()) != -1) {
				fos1.write(data1);
			}
			fis1.close();
			fos1.close();

			while ((data2 = fis2.read()) != -1) {
				fos2.write(data2);
			}
			fis2.close();
			fos2.close();
			while ((data3 = fis3.read()) != -1) {
				fos3.write(data3);
			}
			fis3.close();
			fos3.close();
			while ((data4 = fis4.read()) != -1) {
				fos4.write(data4);
			}
			fis4.close();
			fos4.close();
			while ((data5 = fis5.read()) != -1) {
				fos5.write(data5);
			}
			fis5.close();
			fos5.close();
			while ((data6 = fis6.read()) != -1) {
				fos6.write(data6);
			}
			fis6.close();
			fos6.close();
			

			String prp_accessibility = req.getParameter("prp_accessibility");
			
			String prp_name = req.getParameter("prp_name");
			
			String prp_selltype = req.getParameter("prp_selltype");
			
			String prp_termtype = req.getParameter("prp_termtype");
			
			String address = req.getParameter("postcode") + req.getParameter("roadAddress")  + req.getParameter("detailAddress");
			
			System.out.println(address);
			String prp_type = req.getParameter("prp_type");
			
			//보증금
			int prp_deposit = Integer.parseInt(req.getParameter("prp_deposit"));
			
			//월세가격
			int prp_monthlycost = Integer.parseInt(req.getParameter("prp_monthlycost"));
			
			//전세가격
			int prp_leasecost = Integer.parseInt(req.getParameter("prp_leasecost"));
			
			//매매가격
			int prp_propertycost = Integer.parseInt(req.getParameter("prp_propertycost"));
			
			//입주가능일
			String prp_availabledate = req.getParameter("prp_availabledate");
			
			//관리비
			int prp_maintenancecost = Integer.parseInt(req.getParameter("prp_maintenancecost"));
			
			//공급 면적
			
			String prp_supplyarea = req.getParameter("prp_supplyarea1") + "평" + req.getParameter("prp_supplyarea2");
			
			//전역 면적
			String prp_dedicatedarea = req.getParameter("prp_dedicatedarea1") + "평" + req.getParameter("prp_dedicatedarea2");
			
			//최고층
			String prp_maxfloor = req.getParameter("prp_maxfloor");
			
			//해당 층수
			String prp_floor = req.getParameter("prp_floor");
			
			//매물 추가옵션
			String prp_moreoption = req.getParameter("prp_moreoption");
			
			//매물 엘리베이터 여부
			String prp_elevator = req.getParameter("prp_elevator");
			
			//매물 주차 여부
			String prp_parking = req.getParameter("prp_parking");
			
			//상세설명
			String prp_detail = req.getParameter("prp_detail");
			
			
			String sel_id = (String)req.getSession().getAttribute("memID");
			
			VO_Property vo = new VO_Property();
			
			
			
			
			String picTitle = file1.getOriginalFilename();
			String pic1 = file2.getOriginalFilename();
			String pic2 = file3.getOriginalFilename();
			String pic3 = file4.getOriginalFilename();
			String pic4 = file5.getOriginalFilename();
			String pic5 = file6.getOriginalFilename();
			
			vo.setPrp_title(picTitle);
			vo.setPrp_image1(pic1);
			vo.setPrp_image2(pic2);
			vo.setPrp_image3(pic3);
			vo.setPrp_image4(pic4);
			vo.setPrp_image5(pic5);
			
			vo.setPrp_accessibility(prp_accessibility);
			vo.setPrp_name(prp_name);
			vo.setPrp_selltype(prp_selltype);
			vo.setPrp_termtype(prp_termtype);
			vo.setPrp_address(address);
			vo.setPrp_type(prp_type);
			vo.setPrp_deposit(prp_deposit);
			vo.setPrp_monthlycost(prp_monthlycost);
			vo.setPrp_leasecost(prp_leasecost);
			vo.setPrp_propertycost(prp_propertycost);
			vo.setPrp_availabledate(prp_availabledate);
			vo.setPrp_maintenancecost(prp_maintenancecost);
			vo.setPrp_supplyarea(prp_supplyarea);
			vo.setPrp_dedicatedarea(prp_dedicatedarea);
			vo.setPrp_maxfloor(prp_maxfloor);
			vo.setPrp_floor(prp_floor);
			vo.setPrp_moreoption(prp_moreoption);
			vo.setPrp_elevator(prp_elevator);
			vo.setPrp_parking(prp_parking);
			vo.setSel_id(sel_id);
			vo.setPrp_detail(prp_detail);
			
			insertCnt = daoSeller.sellerSalePro(vo);
			
			model.addAttribute("insertCnt",insertCnt);
		}catch(IOException e) {
			e.printStackTrace();
		}
		
	}

	
	//등록한 매물 select
	@Override
	public void sellerSaleSelect(HttpServletRequest req, Model model) {
		
		int pageSize = 10;	//한페이지당 출력할 글의 개수
		int pageBlock = 20;	//한 블럭당 페이지 개수
		
		int cnt = 0;		//글개수
		int start = 0;		//현재 페이지 시작 글번호
		int end = 0;		//현재 페이지 마지막 글번호
		int number = 0;		//출력용 글번호
		String pageNum = "";//페이지 번호
		int currentPage = 0;//현재 페이지
		
		int pageCount = 0;	//페이지 갯수
		int startPage = 0;	//시작페이지
		int endPage = 0;	//마지막 페이지
		
		String id = (String)req.getSession().getAttribute("memID");
		
		
		//글갯수 구하기
		cnt = daoSeller.getArticleCnt();
		
		pageNum = req.getParameter("pageNum");
		
		if(pageNum == null) {
			pageNum = "1";	//첫페이지를 1페이지로 지정
		}
		
		//글 30건 기준
		currentPage = Integer.parseInt(pageNum);	//현재페이지 : 1
		
		//페이지 개수
		pageCount = (cnt/pageSize)+(cnt%pageSize > 0 ? 1 : 0);	//페이지 개수+나머지있으면 1
		
		//현재페이지 시작 글번호(페이지별)
		start = (currentPage - 1) * pageSize + 1;
		
		//현재페이지 마지막 글번호(페이지별)
		end = start + pageSize - 1;
		
		//출력용 글번호
		number = cnt - (currentPage - 1) * pageSize;
		
		if(cnt > 0) {
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("start", start);
			map.put("end", end);
			map.put("id", id);
			//5-2단계. 게시글 목록 조회
			List<VO_Property> dtos = daoSeller.sellerSaleSelect(map);
			model.addAttribute("dtos", dtos);
		}
		//시작페이지
		startPage = (currentPage/pageBlock) * pageBlock + 1;
		if(currentPage%pageBlock == 0)startPage -= pageBlock;
		
		//마지막페이지
		endPage = startPage + pageBlock - 1;
		if(endPage > pageCount)endPage = pageCount;
		model.addAttribute("cnt", cnt);			//글갯수
		model.addAttribute("number", number);		//출력용 글번호
		model.addAttribute("pageNum", pageNum);	//페이지 번호
		
		if(cnt > 0) {
			model.addAttribute("startPage", startPage);	//시작페이지
			model.addAttribute("endPage", endPage);		//마지막페이지
			model.addAttribute("pageBlock", pageBlock);	//한 블록당 페이지 갯수
			model.addAttribute("pageCount", pageCount);	//페이지 갯수
			model.addAttribute("currentPage", currentPage); //현재페이지
		}
		
//		ArrayList<VO_Property> list;
//		
//		String id = (String)req.getSession().getAttribute("memID");
//		
//		list = daoSeller.sellerSaleSelect(id);
//		
//		model.addAttribute("dtos", list);
	}

	@Override
	public void sellerSelectProperty(HttpServletRequest req, Model model) {

		String saleNum = req.getParameter("saleNum");
		
		
		VO_Property vo = daoSeller.sellerSelectProperty(saleNum);
		
		model.addAttribute("vo", vo);
	}
	
	
	/* 박찬하 2020.02.24 */
	//경매 매물 등록 
	@Override
	public void auctionRegisterPro(HttpServletRequest req, Model model) {
		
		System.out.println("call auctionRegisterPro");
		
		VO_SellerAuction auction = new VO_SellerAuction();							//작은바구니
		
		String prp_number 		= req.getParameter("prp_number");					//매물번호
		String auc_name 		= req.getParameter("auc_name");						//경매등록이름
		String auc_state 		= req.getParameter("auc_state");					//경매상태
		int auc_minbid 			= Integer.parseInt( req.getParameter("auc_minbid"));//최저입찰가
		String auc_paymethod 	= req.getParameter("auc_paymethod");				//대금납부방식
		Timestamp auc_starttime;													//입찰시작시간
		Timestamp auc_endtime;														//입찰마감시간
		Timestamp auc_paydate;														//대금납부기간 
		//개찰일 -> sysdata
		//Timestamp auc_opendate = Timestamp.valueOf(req.getParameter("auc_opendate").replace("T"," "));

		try {
			Date date1 = new SimpleDateFormat("yyyy-MM-dd").parse(req.getParameter("auc_paydate"));
			auc_paydate = new Timestamp(date1.getTime());  
			
			date1 = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm").parse(req.getParameter("auc_starttime"));
			auc_starttime = new Timestamp(date1.getTime());
			
			date1 = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm").parse(req.getParameter("auc_endtime"));
			auc_endtime = new Timestamp(date1.getTime()); 
			
			System.out.println("auc_paydate : " + auc_paydate);
			System.out.println("auc_starttime : " + auc_starttime );
			System.out.println("auc_endtime : " + auc_endtime );
			
			auction.setAuc_starttime(auc_starttime);
			auction.setAuc_endtime(auc_endtime);
			auction.setAuc_paydate(auc_paydate);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		
		//잘 받아오나요?
		System.out.println("prp_number : " + prp_number );
		System.out.println("auc_name : " + auc_name );
		System.out.println("auc_state : " + auc_state );
		System.out.println("auc_minbid : " + auc_minbid );
		System.out.println("auc_paymethod : " + auc_paymethod );
		
		auction.setPrp_number(prp_number);
		auction.setAuc_name(auc_name);
		auction.setAuc_state(auc_state);
		auction.setAuc_minbid(auc_minbid);
		auction.setAuc_paymethod(auc_paymethod);
		auction.setAuc_finalbid(0);
		
		//call the dao
		req.setAttribute("insertCnt", daoSeller.insertAuction(auction) );
	}
	/* 박찬하 2020.02.24 */
	/* 박찬하 2020.02.25 */
	@Override
	public void auctionModify(HttpServletRequest req, Model model) {
		
		//수정 요청을 받은 매물( 경매 ㄴㄴ )의 번호를 받아옵니다.
		String auc_number = req.getParameter("auc_number");
		//String prp_number = "PRP10041";		//더미 데이터
		System.out.println("auc_number : " + auc_number );
		
		//call the dao
		req.setAttribute( "dto" ,daoSeller.selectAuction( auc_number) );
	}
	
	@Override
	public void auctionModifyPro(HttpServletRequest req, Model model) {
		
		System.out.println("call auctionModifyPro");
		
		VO_SellerAuction auction = new VO_SellerAuction();							//작은바구니
		
		String prp_number 		= req.getParameter("prp_number");					//매물번호
		String auc_name 		= req.getParameter("auc_name");						//경매등록이름
		String auc_state 		= req.getParameter("auc_state");					//경매상태
		int auc_minbid 			= Integer.parseInt( req.getParameter("auc_minbid"));//최저입찰가
		String auc_paymethod 	= req.getParameter("auc_paymethod");				//대금납부방식
		Timestamp auc_starttime;													//입찰시작시간
		Timestamp auc_endtime;														//입찰마감시간
		Timestamp auc_paydate;														//대금납부기간 
		//개찰일 -> sysdata
		//Timestamp auc_opendate = Timestamp.valueOf(req.getParameter("auc_opendate").replace("T"," "));

		try {
			Date date1 = new SimpleDateFormat("yyyy-MM-dd").parse(req.getParameter("auc_paydate"));
			auc_paydate = new Timestamp(date1.getTime());  
			
			date1 = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm").parse(req.getParameter("auc_starttime"));
			auc_starttime = new Timestamp(date1.getTime());
			
			date1 = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm").parse(req.getParameter("auc_endtime"));
			auc_endtime = new Timestamp(date1.getTime()); 
			
			System.out.println("auc_paydate : " + auc_paydate);
			System.out.println("auc_starttime : " + auc_starttime );
			System.out.println("auc_endtime : " + auc_endtime );
			
			auction.setAuc_starttime(auc_starttime);
			auction.setAuc_endtime(auc_endtime);
			auction.setAuc_paydate(auc_paydate);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		
		//잘 받아오나요?
		System.out.println("prp_number : " + prp_number );
		System.out.println("auc_name : " + auc_name );
		System.out.println("auc_state : " + auc_state );
		System.out.println("auc_minbid : " + auc_minbid );
		System.out.println("auc_paymethod : " + auc_paymethod );
		
		auction.setPrp_number(prp_number);
		auction.setAuc_name(auc_name);
		auction.setAuc_state(auc_state);
		auction.setAuc_minbid(auc_minbid);
		auction.setAuc_paymethod(auc_paymethod);
		auction.setAuc_finalbid(0);
		
		//call the update dao
		req.setAttribute("updateCnt", daoSeller.updateAuction( auction ) );
	}
	/* 박찬하 2020.02.25 */

	/* 박찬하 2020.03.05*/								
	//경매 조회
	@Override					
	public void getAuctionList(HttpServletRequest req, Model model) {
		//call the dao
		req.setAttribute("auctionList", daoSeller.selectAuctionList());
	}
	//경매 삭제						
	@Override
	public void auctionDelete(HttpServletRequest req, Model model) {
		
		String auc_number = req.getParameter("auc_number");
		System.out.println("auc_number : " + auc_number );
		
		req.setAttribute( "deleteCnt", daoSeller.auctionDelete( auc_number ) );	
		
	}
	/* 박찬하 2020.03.05*/
	@Override
	public void sellerModifyView(HttpServletRequest req, Model model) {

		int pageSize = 10;	//한페이지당 출력할 글의 개수
		int pageBlock = 20;	//한 블럭당 페이지 개수
		
		int cnt = 0;		//글개수
		int start = 0;		//현재 페이지 시작 글번호
		int end = 0;		//현재 페이지 마지막 글번호
		int number = 0;		//출력용 글번호
		String pageNum = "";//페이지 번호
		int currentPage = 0;//현재 페이지
		
		int pageCount = 0;	//페이지 갯수
		int startPage = 0;	//시작페이지
		int endPage = 0;	//마지막 페이지
		
		String id = (String)req.getSession().getAttribute("memID");
		
		
		//글갯수 구하기
		cnt = daoSeller.getModifyCnt();
		
		System.out.println(cnt);
		pageNum = req.getParameter("pageNum");
		
		if(pageNum == null) {
			pageNum = "1";	//첫페이지를 1페이지로 지정
		}
		
		//글 30건 기준
		currentPage = Integer.parseInt(pageNum);	//현재페이지 : 1
		
		//페이지 개수
		pageCount = (cnt/pageSize)+(cnt%pageSize > 0 ? 1 : 0);	//페이지 개수+나머지있으면 1
		
		//현재페이지 시작 글번호(페이지별)
		start = (currentPage - 1) * pageSize + 1;
		
		//현재페이지 마지막 글번호(페이지별)
		end = start + pageSize - 1;
		
		//출력용 글번호
		number = cnt - (currentPage - 1) * pageSize;
		
		if(cnt > 0) {
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("start", start);
			map.put("end", end);
			//5-2단계. 게시글 목록 조회
			List<VO_Property> dtos = daoSeller.sellerModifySelect(map);
			
			VO_Property vo = dtos.get(1);
			
			System.out.println(vo.getPrp_registerdate());
			model.addAttribute("dtos", dtos);
		}
		//시작페이지
		startPage = (currentPage/pageBlock) * pageBlock + 1;
		if(currentPage%pageBlock == 0)startPage -= pageBlock;
		
		//마지막페이지
		endPage = startPage + pageBlock - 1;
		if(endPage > pageCount)endPage = pageCount;
		model.addAttribute("cnt", cnt);			//글갯수
		model.addAttribute("number", number);		//출력용 글번호
		model.addAttribute("pageNum", pageNum);	//페이지 번호
		
		if(cnt > 0) {
			model.addAttribute("startPage", startPage);	//시작페이지
			model.addAttribute("endPage", endPage);		//마지막페이지
			model.addAttribute("pageBlock", pageBlock);	//한 블록당 페이지 갯수
			model.addAttribute("pageCount", pageCount);	//페이지 갯수
			model.addAttribute("currentPage", currentPage); //현재페이지
		}
		
		
	}


	@Override
	public void sellerModifySelect(HttpServletRequest req, Model model) {

		
		String saleNum = req.getParameter("saleNum");
		
		System.out.println(saleNum);
		VO_Property vo = new VO_Property();
		
		vo = daoSeller.sellerModifySelectDate(saleNum);
		
		System.out.println(vo.getPrp_name());
		model.addAttribute("vo", vo);
		
	}


	@Override
	public void sellerModifyPro(MultipartHttpServletRequest req, Model model) {

		
		int updateCnt = 0;
		
		
		MultipartFile file1 = req.getFile("picTitle");
		MultipartFile file2 = req.getFile("pic1");
		MultipartFile file3 = req.getFile("pic2");
		MultipartFile file4 = req.getFile("pic3");
		MultipartFile file5 = req.getFile("pic4");
		MultipartFile file6 = req.getFile("pic5");
		
		String saveDir = req.getRealPath("/resources/images/sellerImages"); // 저장
																// 경로(C:\Dev\workspace\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\wtpwebapps\SPRING_BMS_Project\resources\images\)

		String realDir = "D:\\workspace\\2020-03-03\\src\\main\\webapp\\resources\\images\\sellerImages"; // 저장 경로

		try {
			file1.transferTo(new File(saveDir + file1.getOriginalFilename()));
			file2.transferTo(new File(saveDir + file2.getOriginalFilename()));
			file3.transferTo(new File(saveDir + file3.getOriginalFilename()));
			file4.transferTo(new File(saveDir + file4.getOriginalFilename()));
			file5.transferTo(new File(saveDir + file5.getOriginalFilename()));
			file6.transferTo(new File(saveDir + file6.getOriginalFilename()));
			
			FileInputStream fis1 = new FileInputStream(saveDir + file1.getOriginalFilename());
			FileOutputStream fos1 = new FileOutputStream(realDir + file1.getOriginalFilename());
			FileInputStream fis2 = new FileInputStream(saveDir + file2.getOriginalFilename());
			FileOutputStream fos2 = new FileOutputStream(realDir + file2.getOriginalFilename());
			FileInputStream fis3 = new FileInputStream(saveDir + file3.getOriginalFilename());
			FileOutputStream fos3 = new FileOutputStream(realDir + file3.getOriginalFilename());
			FileInputStream fis4 = new FileInputStream(saveDir + file4.getOriginalFilename());
			FileOutputStream fos4 = new FileOutputStream(realDir + file4.getOriginalFilename());
			FileInputStream fis5 = new FileInputStream(saveDir + file5.getOriginalFilename());
			FileOutputStream fos5 = new FileOutputStream(realDir + file5.getOriginalFilename());
			FileInputStream fis6 = new FileInputStream(saveDir + file6.getOriginalFilename());
			FileOutputStream fos6 = new FileOutputStream(realDir + file6.getOriginalFilename());
			
			int data1 = 0;
			int data2 = 0;
			int data3 = 0;
			int data4 = 0;
			int data5 = 0;
			int data6 = 0;
			
			
			while ((data1 = fis1.read()) != -1) {
				fos1.write(data1);
			}
			fis1.close();
			fos1.close();

			while ((data2 = fis2.read()) != -1) {
				fos2.write(data2);
			}
			fis2.close();
			fos2.close();
			while ((data3 = fis3.read()) != -1) {
				fos3.write(data3);
			}
			fis3.close();
			fos3.close();
			while ((data4 = fis4.read()) != -1) {
				fos4.write(data4);
			}
			fis4.close();
			fos4.close();
			while ((data5 = fis5.read()) != -1) {
				fos5.write(data5);
			}
			fis5.close();
			fos5.close();
			while ((data6 = fis6.read()) != -1) {
				fos6.write(data6);
			}
			fis6.close();
			fos6.close();
			

			String prp_accessibility = req.getParameter("prp_accessibility");
			
			String prp_name = req.getParameter("prp_name");
			
			String prp_selltype = req.getParameter("prp_selltype");
			
			String prp_termtype = req.getParameter("prp_termtype");
			
			String address = req.getParameter("postcode") + req.getParameter("roadAddress")  + req.getParameter("detailAddress");
			
			System.out.println(address);
			String prp_type = req.getParameter("prp_type");
			
			//보증금
			int prp_deposit = Integer.parseInt(req.getParameter("prp_deposit"));
			
			//월세가격
			int prp_monthlycost = Integer.parseInt(req.getParameter("prp_monthlycost"));
			
			//전세가격
			int prp_leasecost = Integer.parseInt(req.getParameter("prp_leasecost"));
			
			//매매가격
			int prp_propertycost = Integer.parseInt(req.getParameter("prp_propertycost"));
			
			//입주가능일
			String prp_availabledate = req.getParameter("prp_availabledate");
			
			//관리비
			int prp_maintenancecost = Integer.parseInt(req.getParameter("prp_maintenancecost"));
			
			//공급 면적
			
			String prp_supplyarea = req.getParameter("prp_supplyarea1") + "평" + req.getParameter("prp_supplyarea2");
			
			//전역 면적
			String prp_dedicatedarea = req.getParameter("prp_dedicatedarea1") + "평" + req.getParameter("prp_dedicatedarea2");
			
			//최고층
			String prp_maxfloor = req.getParameter("prp_maxfloor");
			
			//해당 층수
			String prp_floor = req.getParameter("prp_floor");
			
			//매물 추가옵션
			String prp_moreoption = req.getParameter("prp_moreoption");
			
			//매물 엘리베이터 여부
			String prp_elevator = req.getParameter("prp_elevator");
			
			//매물 주차 여부
			String prp_parking = req.getParameter("prp_parking");
			
			//상세설명
			String prp_detail = req.getParameter("prp_detail");
			
			
			String sel_id = (String)req.getSession().getAttribute("memID");
			
			VO_Property vo = new VO_Property();
			
			
			
			
			String picTitle = file1.getOriginalFilename();
			String pic1 = file2.getOriginalFilename();
			String pic2 = file3.getOriginalFilename();
			String pic3 = file4.getOriginalFilename();
			String pic4 = file5.getOriginalFilename();
			String pic5 = file6.getOriginalFilename();
			
			vo.setPrp_title(picTitle);
			vo.setPrp_image1(pic1);
			vo.setPrp_image2(pic2);
			vo.setPrp_image3(pic3);
			vo.setPrp_image4(pic4);
			vo.setPrp_image5(pic5);
			
			vo.setPrp_accessibility(prp_accessibility);
			vo.setPrp_name(prp_name);
			vo.setPrp_selltype(prp_selltype);
			vo.setPrp_termtype(prp_termtype);
			vo.setPrp_address(address);
			vo.setPrp_type(prp_type);
			vo.setPrp_deposit(prp_deposit);
			vo.setPrp_monthlycost(prp_monthlycost);
			vo.setPrp_leasecost(prp_leasecost);
			vo.setPrp_propertycost(prp_propertycost);
			vo.setPrp_availabledate(prp_availabledate);
			vo.setPrp_maintenancecost(prp_maintenancecost);
			vo.setPrp_supplyarea(prp_supplyarea);
			vo.setPrp_dedicatedarea(prp_dedicatedarea);
			vo.setPrp_maxfloor(prp_maxfloor);
			vo.setPrp_floor(prp_floor);
			vo.setPrp_moreoption(prp_moreoption);
			vo.setPrp_elevator(prp_elevator);
			vo.setPrp_parking(prp_parking);
			vo.setSel_id(sel_id);
			vo.setPrp_detail(prp_detail);
			
			updateCnt = daoSeller.sellerModifyPro(vo);
			
			model.addAttribute("updateCnt",updateCnt);
		}catch(IOException e) {
			e.printStackTrace();
		}
	}


	@Override
	public void sellerPropertyDelete(HttpServletRequest req, Model model) {

		int deleteCnt;
		String PropertyNum = req.getParameter("saleNum");
		
		System.out.println(PropertyNum);
		deleteCnt = daoSeller.sellerPropertyDelete(PropertyNum);
		
		model.addAttribute("deleteCnt", deleteCnt);
	}
	
	
}

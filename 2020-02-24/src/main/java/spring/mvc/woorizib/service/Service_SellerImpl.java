package spring.mvc.woorizib.service;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.security.Timestamp;
import java.util.Random;

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
import spring.mvc.woorizib.vo.VO_Member;
import spring.mvc.woorizib.vo.VO_Seller;

@Service
public class Service_SellerImpl implements Service_Seller{
	
	@Autowired
	DAO_All daoAll;
	
	@Autowired
	DAO_Seller daoSeller;
	
	@Autowired
	BCryptPasswordEncoder passwordEncoder;	// 비밀번호 암호화 객체

	

	@Override
	public void seller_sale_Pro(MultipartHttpServletRequest req, Model model) {

		
		int insertCnt = 0;
		
		String prp_accessibility = req.getParameter("prp_accessibility");
		
		String prp_name = req.getParameter("prp_name");
		
		String prp_selltype = req.getParameter("prp_selltype");
		
		String prp_termtype = req.getParameter("prp_termtype");
		
		String address = req.getParameter("postcode") + req.getParameter("roadAddress") + req.getParameter("jibunAddress") + req.getParameter("detailAddress");
		
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
		
		VO_Property vo = new VO_Property();
		
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
		
		
		insertCnt = daoSeller.seller_sale_Pro(vo);
		
		
		MultipartFile file1 = req.getFile("picTitle");
		MultipartFile file2 = req.getFile("pic1");
		MultipartFile file3 = req.getFile("pic2");
		MultipartFile file4 = req.getFile("pic3");
		MultipartFile file5 = req.getFile("pic4");
		MultipartFile file6 = req.getFile("pic5");
		
		String saveDir = req.getRealPath("/resources/images/"); // 저장
																// 경로(C:\Dev\workspace\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\wtpwebapps\SPRING_BMS_Project\resources\images\)

		String realDir = "D:\\images"; // 저장 경로

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

			int data1 = 0;
			int data2 = 0;
			int data3 = 0;
			int data4 = 0;
			int data5 = 0;

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
			
			
		}catch(IOException e) {
			e.printStackTrace();
		}
		
	}
	
	
}

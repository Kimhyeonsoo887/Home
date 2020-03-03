package spring.mvc.woorizib.service;

import java.io.File;
import java.io.IOException;
import java.sql.Timestamp;
import java.util.HashMap;
import java.util.Map;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import spring.mvc.woorizib.persistence.DAO_All;
import spring.mvc.woorizib.vo.VO_Member;
import spring.mvc.woorizib.vo.VO_Seller;

@Service
public class Service_AllImpl implements Service_All{
	@Autowired
	DAO_All daoAll;
	
	@Autowired
	BCryptPasswordEncoder passwordEncoder;	// 비밀번호 암호화 객체
	
	
	/* 20.02.26 - 회원가입, 아이디 & 비밀번호 인증 */
	//회원가입
	@Override
	public void signup(HttpServletRequest req, Model model) {
		
		VO_Member vo = new VO_Member();
		
		String member_id = req.getParameter("id");
		String member_pw = req.getParameter("pw");
		String encryptPw = passwordEncoder.encode(member_pw);
		String member_name=req.getParameter("name");
		String member_hp=req.getParameter("phone");
		String member_email=req.getParameter("email");
		
		vo.setMem_email(member_email);
		vo.setMem_id(member_id);
		vo.setMem_name(member_name);
		vo.setMem_phone(member_hp);
		vo.setMem_pw(encryptPw);
		
		// 이메일 인증키 생성
		// 추후 중복확인해야 할 듯
		StringBuffer temp = new StringBuffer();
		Random rnd = new Random();
		for(int i=0;i<6;i++) {
			int rIndex = rnd.nextInt(2);
			switch(rIndex) {
			case 0:
				temp.append((char)((int)(rnd.nextInt(26))+65));
				break;
			case 1:
				temp.append((rnd.nextInt(10)));
				break;
			}
		}
		String key = temp.toString();
		
		vo.setMem_key(key);
		
		int signupCnt = 0;
		signupCnt = daoAll.signUp(vo);
		
		if (signupCnt == 1) {
			daoAll.sendEmail(vo);
		}
		
		model.addAttribute("signupCnt", signupCnt);
	}
	
	//셀러 회원가입
	@Override
	public void signupSeller(MultipartHttpServletRequest req, Model model) {
		
		MultipartFile licenseImage = req.getFile("license");
		System.out.println("SERV licenseImage: "+licenseImage);
		
		String realDir="D:\\Dev57\\git_solo\\src\\main\\webapp\\resources\\images\\licenseimages\\"; // 저장 경로
		
		try {
			VO_Seller vo = new VO_Seller();
			
			licenseImage.transferTo(new File(realDir+licenseImage.getOriginalFilename()));
			System.out.println("파일 확인: "+licenseImage.getOriginalFilename());
			vo.setSel_license(licenseImage.getOriginalFilename());
			
			String sel_id = req.getParameter("id");
			String sel_pw = req.getParameter("pw");
			String encryptPw = passwordEncoder.encode(sel_pw);
			String sel_name = req.getParameter("name");
			int sel_phone = Integer.parseInt(req.getParameter("phone"));
			String sel_email = req.getParameter("email");
			
			vo.setSel_id(sel_id);
			vo.setSel_pw(encryptPw);
			vo.setSel_name(sel_name);
			vo.setSel_phone(sel_phone);
			vo.setSel_email(sel_email);
			
			
			// 이메일 인증키 생성
			// 추후 중복확인해야 할 듯
			StringBuffer temp = new StringBuffer();
			Random rnd = new Random();
			for(int i=0;i<6;i++) {
				int rIndex = rnd.nextInt(2);
				switch(rIndex) {
				case 0:
					temp.append((char)((int)(rnd.nextInt(26))+65));
					break;
				case 1:
					temp.append((rnd.nextInt(10)));
					break;
				}
			}
			String key = temp.toString();
			
			vo.setSel_key(key);
			
			int signupCnt = 0;
			signupCnt = daoAll.signupSeller(vo);
			
			if (signupCnt == 1) {
				daoAll.sendEmailS(vo);
			}
			
			model.addAttribute("signupCnt", signupCnt);
			
		}catch(IOException e) {
            e.printStackTrace();
        }
	}
	
	//아이디 찾기
	@Override
	public void find_account(HttpServletRequest req, Model model) {
		
		String findtype = req.getParameter("findtype");
		System.out.println("find_account > findtype: "+findtype);
		
		//아이디를 찾기 위해, 가입시 입력했던 이름과 
		String inputName = req.getParameter("name");
		
		//DB에는 NUMBER타입이라 앞에 0을 인식을 못함, 고로 substring()을 이용하여 첫번째 숫자(0)을 제외하고 인식한다.
		String inputPhoneString = req.getParameter("phone");
		String inputPhoneSubstring =  inputPhoneString.substring(1);
		int inputPhone = Integer.parseInt(inputPhoneSubstring);
		
		System.out.println("inputPhoneString: "+ inputPhoneString);
		System.out.println("inputPhoneSubstring: " +inputPhoneString.substring(1));
		System.out.println("inputPhone: "+inputPhone);
		
		//이름의 존재여부를 findCnt로 구분한다. (있음: 1, 없음: 0)
		int findName = 0;
		
		
		if (findtype.equals("member")) {
			//이름의 유무를 확인하는 쿼리문
			findName = daoAll.checkName(inputName);
			
			System.out.println("findName:" + findName);
			//만약 이름이 존재한다면, 해당 명의와 일치한 번호를 검색한다.
			//쿼리문에서 COUNT()함수를 사용하기에 동명이인이 존재할시 2이상의 값이 나올 수 있으므로 [!= 0]을 사용한다.
			if (findName != 0) {
				int findPhone = 0;
				
				Map<String, Object> info = new HashMap<String, Object>();
				info.put("mem_name", inputName);
				info.put("mem_phone", inputPhone);
				
				//이름, 번호가 일치한 정보가 존재하는지 확인하는 쿼리문
				findPhone = daoAll.checkPhone(info);
				System.out.println("findPhone:" + findPhone);
				
				//만약 일치하는 정보가 존재한다면,
				if (findPhone != 0) {
					//아이디 값을 받아와 JSP에 보여준다.
					String member_id = daoAll.findAccount(info);
					model.addAttribute("member_id", member_id);
					model.addAttribute("findPhone", findPhone);
					model.addAttribute("findCnt", findName);
				}else {
					//findPhone = 0, "입력하신 명의와 일치한 번호가 존재하지 않습니다."
					model.addAttribute("findPhone", findPhone);
				}
				model.addAttribute("findCnt", findName);
				model.addAttribute("findPhone", findPhone);
			}
		}else {
			//셀러파트
			findName = daoAll.checkNameS(inputName);
			if (findName != 0) {
				int findPhone = 0;
				Map<String, Object> info = new HashMap<String, Object>();
				info.put("sel_name", inputName);
				info.put("sel_phone", inputPhone);
				findPhone = daoAll.checkPhoneS(info);
				System.out.println("findPhone:" + findPhone);
				if (findPhone != 0) {
					String member_id = daoAll.findAccountS(info);
					model.addAttribute("member_id", member_id); // 출력용.. 딱히 신경쓰지말자규
					model.addAttribute("findPhone", findPhone);
					model.addAttribute("findCnt", findName);
				}else {
					model.addAttribute("findPhone", findPhone);
				}
				model.addAttribute("findCnt", findName);
				model.addAttribute("findPhone", findPhone);
			}
		}
		
		model.addAttribute("findCnt", findName);		
		
	}
	
	//비밀번호 변경 링크보내기
	@Override
	public void change_password(HttpServletRequest req, Model model) {
		//사용자의 id값을 받아온다.
		String id = req.getParameter("id");
		
		//해당계정이 멤버인지 셀러인지 구분하는 메서드
		String accountAuthority = daoAll.checkAuthorityById(id);
		
		//아이디 존재유무를 확인하는 checkCnt
		int checkCnt = 0;
		
		if(accountAuthority.equals("ROLE_MEMBER")) {
			//checkAccount 같은 경우 기존의 idCheck()와 겹치기 때문에 수정이 필요로 한 듯 하다.
			checkCnt = daoAll.checkAccount(id);
			System.out.println("checkCnt:" + checkCnt);
			if (checkCnt == 1) {
				String email = daoAll.findEmail(id);
				daoAll.sendPwEmail(id, email);
				//"등록하신 이메일로 전송되었습니다."
				model.addAttribute("member_id",id);
			}
		}else {
			//if(accountAuthority.equals("ROLE_SELLER")) {
			checkCnt = daoAll.checkAccountS(id);
			System.out.println("checkCnt:" + checkCnt);
			if (checkCnt == 1) {
				String email = daoAll.findEmailS(id);
				daoAll.sendPwEmail(id, email);
				//"등록하신 이메일로 전송되었습니다."
				model.addAttribute("member_id",id);
			}
		}
		
		//"아이디가 존재하지 않습니다."
		model.addAttribute("checkCnt", checkCnt);
		
		//받아온 id값에 저장된 이메일로 비밀번호 변경 링크를 보낸다.
		
		
		
		
	}
	
	//비밀번호 변경 처리
	@Override
	public void change_passoword_page_pro(HttpServletRequest req, Model model) {
		String id = req.getParameter("id");
		
		//해당계정이 멤버인지 셀러인지 구분하는 메서드
		String accountAuthority = daoAll.checkAuthorityById(id);
		
		//수정확인 CNT
		int changeCnt = 0;
		
		if(accountAuthority.equals("ROLE_MEMBER")) {
			System.out.println("멤버 비밀번호 변경");
			//Javascript을 통해 비밀번호 확인 검사는 해야 확실하다.
			String mem_pw = req.getParameter("pw");
			String encryptPw = passwordEncoder.encode(mem_pw);
			
			System.out.println("mem_id:" + id);
			Map<String, Object> info = new HashMap<String, Object>();
			info.put("mem_id", id);
			info.put("encryptPw", encryptPw);
			
			//HashMap 방식으로 저장된 아이디와 암호화된 비밀번호를 들고 쿼리문을 타 수정을 진행한다.
			changeCnt = daoAll.changePassword(info);
		}else {
			System.out.println("셀러 비밀번호 변경");
			String sel_pw = req.getParameter("pw");
			String encryptPw = passwordEncoder.encode(sel_pw);
			System.out.println("mem_id:" + id);
			Map<String, Object> info = new HashMap<String, Object>();
			info.put("sel_id", id);
			info.put("encryptPw", encryptPw);
			changeCnt = daoAll.changePasswordS(info);
		}
		
		model.addAttribute("changeCnt", changeCnt);
	}
	
	//멤버 이메일 인증(certification 업데이트)
	@Override
	public void signupconfirmid(HttpServletRequest req, Model model) {
		String id = req.getParameter("id");
		int checkCnt = 0;
		checkCnt = daoAll.signupconfirmid(id);
		System.out.println("checkCnt: "+checkCnt);
		model.addAttribute("checkCnt", checkCnt);
		model.addAttribute("id", id);
	}

	//셀러 이메일 인증(certification 업데이트)
	@Override
	public void membercertification(HttpServletRequest req, Model model) {
		String key = req.getParameter("key");
		
		int selectCnt = daoAll.findMemberByKey(key);
		int insertCnt = 0;
		
		if(selectCnt == 1) {
			insertCnt = daoAll.updateMemberCertf(key);
			model.addAttribute("insertCnt", insertCnt);
		}
	}
	
	@Override
	public void sellercertification(HttpServletRequest req, Model model) {
		String key = req.getParameter("key");
		
		int selectCnt = daoAll.findSellerByKey(key);
		int insertCnt = 0;
		
		if(selectCnt == 1) {
			insertCnt = daoAll.updateSellerCertf(key);
			model.addAttribute("insertCnt", insertCnt);
		}
	}
	/* 20.02.26 - 회원가입, 아이디 & 비밀번호 인증 */
	
}

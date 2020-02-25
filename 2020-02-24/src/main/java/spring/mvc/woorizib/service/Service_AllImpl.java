package spring.mvc.woorizib.service;

import java.sql.Timestamp;
import java.util.HashMap;
import java.util.Map;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import spring.mvc.woorizib.persistence.DAO_All;
import spring.mvc.woorizib.vo.VO_Member;

@Service
public class Service_AllImpl implements Service_All{
	@Autowired
	DAO_All daoAll;
	
	@Autowired
	BCryptPasswordEncoder passwordEncoder;	// 비밀번호 암호화 객체
	
	
	/* 20.02.13 - 문성혁, 아이디 찾아주는 Service 메서드 */
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
		
		
		int signupCnt = 0;
		
		signupCnt = daoAll.signUp(vo);
		
		model.addAttribute("signupCnt", signupCnt);
	}
	//아이디 찾기
	@Override
	public void find_account(HttpServletRequest req, Model model) {
		
		//아이디를 찾기 위해, 가입시 입력했던 이름과 
		String inputName = req.getParameter("member_name");
		int inputPhone = Integer.parseInt(req.getParameter("member_hp")); 
		
		//이름의 존재여부를 findCnt로 구분한다. (있음: 1, 없음: 0)
		int findName = 0;
		
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
		}else {
			//findName = 0, "입력하신 이름은 존재하지 않습니다."
			model.addAttribute("findCnt", findName);
		}
		
		
	}
	//비밀번호 변경 링크보내기
	@Override
	public void change_password(HttpServletRequest req, Model model) {
		//사용자의 id값을 받아온다.
		String member_id = req.getParameter("member_id");
		
		//아이디 존재유무를 확인하는 checkCnt
		int checkCnt = 0;
		
		//checkAccount 같은 경우 기존의 idCheck()와 겹치기 때문에 수정이 필요로 한 듯 하다.
		checkCnt = daoAll.checkAccount(member_id);
		System.out.println("checkCnt:" + checkCnt);
		if (checkCnt == 1) {
			String email = daoAll.findEmail(member_id);
			daoAll.sendPwEmail(member_id, email);
			//"등록하신 이메일로 전송되었습니다."
			model.addAttribute("checkCnt", checkCnt);
			model.addAttribute("member_id",member_id);
		}else {
			//"아이디가 존재하지 않습니다."
			model.addAttribute("checkCnt", checkCnt);
		}
		
		//받아온 id값에 저장된 이메일로 비밀번호 변경 링크를 보낸다.
	}
	//비밀번호 변경 처리
	@Override
	public void change_passoword_page_pro(HttpServletRequest req, Model model) {
		String mem_email = req.getParameter("member_id");
		
		//Javascript을 통해 비밀번호 확인 검사는 해야 확실하다.
		String member_pw = req.getParameter("member_pw");
		String encryptPw = passwordEncoder.encode(member_pw);
		
		System.out.println("member_id:" + mem_email);
		Map<String, Object> info = new HashMap<String, Object>();
		info.put("mem_email", mem_email);
		info.put("encryptPw", encryptPw);
		
		//수정확인 CNT
		int changeCnt = 0;
		
		//HashMap 방식으로 저장된 아이디와 암호화된 비밀번호를 들고 쿼리문을 타 수정을 진행한다.
		changeCnt = daoAll.changePassword(info);
		
		model.addAttribute("changeCnt", changeCnt);
	}
	/* 20.02.13 - 문성혁, 아이디 찾아주는 Service 메서드 */
		
		
//	@Override
//	public void join_usPro(HttpServletRequest req, Model model) {
//		// 3단계. 화면으로부터 입력받은 값을 받아온다.
//		// 바구니를 생성한다.
//		VO_Member vo = new VO_Member();
//		vo.setMember_code(req.getParameter("member_code"));
//		
//		String encryptPassword = passwordEncoder.encode(req.getParameter("m_pwd"));
//		vo.setM_pwd(encryptPassword);
//		
//		vo.setM_pwdQ(req.getParameter("m_pwdQ"));
//		vo.setM_pwdA(req.getParameter("m_pwdA"));
//		vo.setM_name(req.getParameter("m_name"));
//		
//		String email = "";
//		String email1 = req.getParameter("email1");
//		String email2 = req.getParameter("email2");
//		email = email1 + "@" + email2;
//		vo.setM_email(email);
//		
//		if(req.getParameter("m_email_chk") == null) {
//			vo.setM_email_chk("f");
//		}else {
//			vo.setM_email_chk("t");
//		}
//		String ph = "";
//		String ph1 = req.getParameter("phone1");
//		String ph2 = req.getParameter("phone2");
//		String ph3 = req.getParameter("phone3");
//		
//		// hp가 필수가 아니므로 null값이 들어올 수 있으므로
//		if(!ph2.equals("") && !ph3.equals("")) {
//			ph = ph1 + "-" + ph2 + "-" + ph3;
//		}
//		vo.setM_phone(ph);
//		
//		String hp = "";
//		String hp1 = req.getParameter("mobile1");
//		String hp2 = req.getParameter("mobile2");
//		String hp3 = req.getParameter("mobile3");
//		
//		// hp가 필수가 아니므로 null값이 들어올 수 있으므로
//		if(!hp2.equals("") && !hp3.equals("")) {
//			hp = hp1 + "-" + hp2 + "-" + hp3;
//		}
//		
//		vo.setM_mobile(hp);
//		
//		if(req.getParameter("m_mobile_chk") == null) {
//			vo.setM_mobile_chk("f");
//		}else {
//			vo.setM_mobile_chk("t");
//		}
//		
//		vo.setM_address1(req.getParameter("m_address1"));
//		vo.setM_address2(req.getParameter("m_address2"));
//		vo.setM_address3(req.getParameter("m_address3"));
//		
//		//reg_date
//		vo.setM_date(new Timestamp(System.currentTimeMillis()));
//		
//		// Email 인증
//		// 인증 키 부분
//		StringBuffer temp = new StringBuffer();
//		Random rnd = new Random();
//		for(int i=0;i<6;i++) {
//			int rIndex = rnd.nextInt(2);
//			switch(rIndex) {
//			case 0:
//				temp.append((char)((int)(rnd.nextInt(26))+65));
//				break;
//			case 1:
//				temp.append((rnd.nextInt(10)));
//				break;
//			}
//		}
//		String key = temp.toString();
//		
//		vo.setM_key(key);
//		
//		// 5단계. 회원가입 처리
//		int insertCnt = dao.insertMember(vo);
//		
//		if(insertCnt != 0) {
//			dao.sendMail(email,key);
//		}
//		
//		// 6단계. request나 session으로 처리결과를 저장(jsp에 전달하기 위함)
//		model.addAttribute("insertCnt", insertCnt);
//	}
//	@Override
//	public void emailChk(HttpServletRequest req, Model model) {
//		String key = req.getParameter("key");
//		
//		int selectCnt = dao.selectKey(key);
//		
//		if(selectCnt == 1) {
//			int insertCnt = dao.updateGrade(key);
//			model.addAttribute("insertCnt", insertCnt);
//		}
//	}
//
//	@Override
//	public void searchPwdPro(HttpServletRequest req, Model model) {
//		// 3단계. 화면으로부터 입력받은 값을 받아온다.
//		String id = req.getParameter("member_code");
//		String name = req.getParameter("m_name");
//		String pwdQ = req.getParameter("m_pwdQ");
//		String pwdA = req.getParameter("m_pwdA");
//		
//		// 5단계. 찾는 pwd가 있는지 확인
//		VO_Member vo = new VO_Member();
//		vo.setMember_code(id);
//		vo.setM_name(name);
//		vo.setM_pwdQ(pwdQ);
//		vo.setM_pwdA(pwdA);
//		String pwd = dao.searchPwd(vo);
//		// 6단계. request나 session으로 처리결과를 저장(jsp에 전달하기 위함)
//		model.addAttribute("m_pwd", pwd);
//	}
	
}

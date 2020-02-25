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

import spring.mvc.woorizib.persistence.DAO_Admin;
import spring.mvc.woorizib.persistence.DAO_All;
import spring.mvc.woorizib.vo.VO_Admin;
import spring.mvc.woorizib.vo.VO_Member;

@Service
public class Service_AdminImpl implements Service_Admin{
	
	@Autowired
	DAO_All daoAll;
	
	@Autowired
	DAO_Admin daoAdmin;
	
	@Autowired
	BCryptPasswordEncoder passwordEncoder;	// 비밀번호 암호화 객체

	@Override
	public void signupAdmin(HttpServletRequest req, Model model) {
		VO_Admin vo = new VO_Admin();
		
		String adm_id = req.getParameter("adm_id");
		System.out.println("adm_id: "+adm_id);
		String adm_pw = req.getParameter("adm_pw");
		System.out.println("adm_pw: "+adm_pw);
		String encryptPw = passwordEncoder.encode(adm_pw);
		System.out.println("encryptPw: "+encryptPw);
		String adm_name = req.getParameter("adm_name");
		System.out.println("adm_name: "+adm_name);
		int adm_phone= Integer.parseInt(req.getParameter("adm_phone"));
		System.out.println("adm_phone: "+adm_phone);
		String adm_email=req.getParameter("adm_email");
		System.out.println("adm_email: "+adm_email);
		
		
		
		vo.setAdm_id(adm_id);
		vo.setAdm_pw(encryptPw);
		vo.setAdm_name(adm_name);
		vo.setAdm_phone(adm_phone);
		vo.setAdm_email(adm_email);
		
		
		
		int signupCnt = 0;
		
		signupCnt = daoAdmin.signupAdmin(vo);
		
		model.addAttribute("signupCnt", signupCnt);
	}
	
	
	
	
	
}

package spring.mvc.woorizib.controller;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import spring.mvc.woorizib.service.Service_Admin;
import spring.mvc.woorizib.service.Service_All;
import spring.mvc.woorizib.service.Service_Member;


@Controller
public class Controller_Member {
	
private static final Logger logger = LoggerFactory.getLogger(Controller_Member.class);
	
	@Autowired
	Service_Member serviceMember;

	/* 전영현 2020.02.13 */
	
	@RequestMapping("all_updateMember.all")
	public String updateMember(HttpServletRequest req, Model model) {
		logger.info("▶ /updateMember.cust");
		serviceMember.modifyView(req,model);
		return "updateMember";
	}
	
	//회원정보 수정 처리 
	@RequestMapping("/updateMemberPro.cust")
	public String updateMemberPro(HttpServletRequest req, Model model) {
		logger.info("▶ /updateMemberPro.cust");
		serviceMember.updateMemberPro(req,model);
		return "updateMemberPro";
	}
	
	//회원탈퇴화면
	@RequestMapping("all_deleteMember.all")
	public String deleteMemeber(HttpServletRequest req, Model model) {
		logger.info("▶ /deleteMember.cust");
		return "deleteMember";
	}
	
	//회원 탈퇴 처리 
	@RequestMapping("/deleteMemberPro.cust")
	public String deleteMemberPro(HttpServletRequest req, Model model) {
		logger.info("▶ /deleteMemberPro.cust");
		serviceMember.deleteMemberPro(req,model);
		return "deleteMemberPro";
	}
	
	/* 전영현 2020.02.13 */
	
	
	
}
 
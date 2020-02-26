package spring.mvc.woorizib.service;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.web.authentication.AuthenticationFailureHandler;

public class UserLoginFailureHandler implements AuthenticationFailureHandler{

	@Autowired
	SqlSessionTemplate sqlSession;
	
	@Autowired
	BCryptPasswordEncoder passwordEncoder;
	
	public UserLoginFailureHandler(SqlSessionTemplate sqlSession, BCryptPasswordEncoder passwordEncoder ) {
		this.sqlSession = sqlSession;
		this.passwordEncoder = passwordEncoder;
	}
	
	// 로그인이 실패할 경우 자동으로 실행되는 코드 
	/**
	 *
	 */
	@Override
	public void onAuthenticationFailure(HttpServletRequest request, HttpServletResponse response,
			AuthenticationException exception) throws IOException, ServletException {
	
		System.out.println("[알림] 로그인에 실패하였습니다.");
		
		String input_id = request.getParameter("id");
		String input_pw = request.getParameter("pw");
		
		System.out.println("입력된 아이디: " + input_id);
		System.out.println("입력된 비밀번호: " + input_pw);
		
		String logintype = request.getParameter("logintype");
		System.out.println("입력된 로그인타입: " + logintype);
		
		int cnt = 0;
		
		if(logintype.equals("member")) {
			System.out.println("Member_tbl에 아이디 존재여부 확인중입니다.");
			cnt = sqlSession.selectOne("spring.mvc.woorizib.persistence.DAO_All.checkAccount", input_id);
		}else if(logintype.equals("seller")) {
			System.out.println("Seller_tbl에 아이디 존재여부 확인중입니다.");
			cnt = sqlSession.selectOne("spring.mvc.woorizib.persistence.DAO_All.checkAccountS", input_id);
		}
		
		//관리자는 확인하지 않는다.
		System.out.println("아이디 존재여부(0: 존재안함, 1: 존재함): " + cnt);
		
		
		if(cnt!=0) {
			if(logintype.equals("member")) {
				String mem_pw = sqlSession.selectOne("spring.mvc.woorizib.persistence.DAO_All.pwdCheck",input_id);
				if(passwordEncoder.matches(input_pw, mem_pw)) {
					request.setAttribute("errMsg", "이메일 인증이 완료되지 않았습니다.");
				}else {
					request.setAttribute("errMsg", "비밀번호가 일치하지 않습니다.");
				}
			}else if(logintype.equals("seller")) {
				String sel_pw = sqlSession.selectOne("spring.mvc.woorizib.persistence.DAO_All.pwdCheckS",input_id);
				if(passwordEncoder.matches(input_pw, sel_pw)) {
					request.setAttribute("errMsg", "이메일 인증이 완료되지 않았습니다.");
				}else {
					request.setAttribute("errMsg", "비밀번호가 일치하지 않습니다.");
				}
			}else {
				System.out.println("관리자 로그인 실패시 출력됩니다. 출력이 되면 안됩니다.");
			}
		}else {
			request.setAttribute("errMsg", "아이디가 존재하지 않습니다.");
		}
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("/all_login.all");
		dispatcher.forward(request, response);
	}

}

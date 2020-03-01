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
	
		System.out.println("[LOGIN FAILED]");
		
		String input_id =  request.getParameter("id");
		String input_pw = request.getParameter("pw");
		
		System.out.println("input_id" + input_id);
		System.out.println("input_pw" + input_pw);
		int cnt = sqlSession.selectOne("spring.mvc.woorizib.persistence.DAO_All.idCheck",input_id);
		System.out.println("cnt:" + cnt);
		
		if(cnt!=0) {
			
			String pwd = sqlSession.selectOne("spring.mvc.woorizib.persistence.DAO_All.pwdCheck",input_id);
			
			//이메일 인증에 따른 경고창 설정 부분, 어떻게 할지 지정하지 않았다.
			
			if(passwordEncoder.matches(input_pw, pwd)) {
				request.setAttribute("errMsg", "이메일 인증이 되지 않은 계정입니다.");
				request.setAttribute("selectCnt", 3); //이메일 인증 띄우기 예)
			}else {
				request.setAttribute("errMsg", "비밀번호가 일치하지 않습니다.");
				request.setAttribute("selectCnt", -1);
			}
			
		}else {
			request.setAttribute("errMsg", "아이디가 일치하지 않습니다.");
			request.setAttribute("selectCnt", 0);
		}
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("/all_loginPro.all");
		dispatcher.forward(request, response);
	}

}

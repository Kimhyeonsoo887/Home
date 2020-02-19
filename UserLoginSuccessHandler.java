package spring.mvc.bridge.service;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;

import spring.mvc.bridge.vo.VO_User;


/**
 * @author   : Sunghyuk Mun
 * @date     : 2020. 2. 12.
 * @comment  : 
 */
public class UserLoginSuccessHandler implements AuthenticationSuccessHandler{

	@Autowired
	SqlSessionTemplate sqlSession;
	
	public UserLoginSuccessHandler(SqlSessionTemplate sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	// 로그인이 성공한 경우에 실행한 코드
	@Override
	public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
			Authentication authentication) throws IOException, ServletException {
		
		VO_User vo = (VO_User) authentication.getPrincipal();
		
		String member_id = authentication.getName();
		String auth = sqlSession.selectOne("spring.mvc.bridge.persistence.DAO_Main.authCheck", member_id);
		
		int authCnt = 0;
		
		//로그인 성공시 authCnt값을 세션에 저장하여 권한에 따른 추가메뉴 등을 설정할 수 있다.
		if(auth.equals("ROLE_USER")) {
			authCnt = 1;
		}else {
			authCnt = 0;
		}
		if(auth.equals("ROLE_ADMIN")) {
			authCnt = 2;
		}
		
		request.getSession().setAttribute("memID", authentication.getName());
		request.getSession().setAttribute("authCnt", authCnt);
		
		System.out.println("★ AUTH AUTHCNT VALUE: "+ request.getSession().getAttribute("authCnt"));
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/views/index.jsp");
		
		dispatcher.forward(request, response);
	}

}

	package spring.mvc.woorizib.service;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;

import spring.mvc.woorizib.vo.VO_User;


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
		
		System.out.println("[알림] 로그인에 성공하였습니다.");
		
		VO_User vo = (VO_User) authentication.getPrincipal();
		System.out.println("로그인 정보: " + authentication.getPrincipal());
		System.out.println("로그인 권한: " + vo.getAuthorities());
		
		String login_id = authentication.getName();
		
		RequestDispatcher dispatcher = null;
		
		if(vo.getAuthorities().toString().equals("[ROLE_MEMBER]")) {
			//멤버
			System.out.println("MEMBER가 로그인 하였습니다.");
			request.setAttribute("logintype", vo.getAuthorities().toString());
			dispatcher = request.getRequestDispatcher("/all_index.all");
			
		}else if(vo.getAuthorities().toString().equals("[ROLE_SELLER]")){
			//셀러
			System.out.println("SELLER가 로그인 하였습니다.");
			request.setAttribute("logintype", vo.getAuthorities().toString());
			dispatcher = request.getRequestDispatcher("/seller_main.sel");
			
		}else if(vo.getAuthorities().toString().equals("[ROLE_ADMIN]")){
			//관리자
			System.out.println("ADMIN이 로그인 하였습니다.");
			request.setAttribute("logintype", vo.getAuthorities().toString());
			dispatcher = request.getRequestDispatcher("/admin_index.all");
			
		}else {
			//혹시모를 에러
			System.out.println("이것은 출력되면 안됩니다. (UserLoginSuccessHandler.java)");
			dispatcher = request.getRequestDispatcher("/all_index.all");
		}
		
		request.getSession().setAttribute("memID", login_id);
		dispatcher.forward(request, response);
		
	}

}

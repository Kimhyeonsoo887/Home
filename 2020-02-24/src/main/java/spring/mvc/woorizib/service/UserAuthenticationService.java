package spring.mvc.woorizib.service;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import spring.mvc.woorizib.vo.VO_Admin;
import spring.mvc.woorizib.vo.VO_Member;
import spring.mvc.woorizib.vo.VO_Seller;
import spring.mvc.woorizib.vo.VO_User;

// UserDetailService : 스프링 프레임웍에 내장된 인터페이스
// UserDetailService : users 테이블의 정보를 가지고 인증처리를 위해 사용자 상세정보를 제공하는 인터페이스 

public class UserAuthenticationService implements UserDetailsService{
	
	@Autowired
	SqlSessionTemplate sqlSession;
	
	@Autowired
	BCryptPasswordEncoder PasswordEncoder;
	
	/**
	 * @param sqlSession
	 */
	public UserAuthenticationService(SqlSessionTemplate sqlSession) {
		this.sqlSession = sqlSession;
	}
	// 핵심코드
	/*
	 * 로그인 인증을 처리하는 코드
	 * 매개변수가 userid뿐이지만 패스워드까지 전달된다.(username => userid로 수정)
	 * 매개변수가 userid에 해당하는 테이블의 레코드를 읽어옴
	 * 정보가 없으면 예외를 발생시키고, 있으면 map으로 리턴
	 * 
	 */
	@Override
	public UserDetails loadUserByUsername(String input_id) throws UsernameNotFoundException {
		
		System.out.println(" > "+input_id + "님이 로그인을 시도하였습니다.");
		
		HttpServletRequest req = ((ServletRequestAttributes)RequestContextHolder.getRequestAttributes()).getRequest();
		String logintype = req.getParameter("logintype");
		
		System.out.println("로그인 종류: "+ logintype);
		
		if(logintype.equals("member")) {
			System.out.println("[일반회원] 시큐리티가 작동중입니다.");
			// id와 패스워드가 불일치시 null이 넘어오고, 일치시 계정이 넘어온다.
			// 비밀번호 체크로직은 스프링 시큐리티안에 숨어있다.
			VO_Member vo = sqlSession.selectOne("spring.mvc.woorizib.persistence.DAO_All.readMember", input_id);
			// 인증 실패시 인위적으로 예외 발생
			if(vo == null) throw new UsernameNotFoundException(input_id);
			// List나 ArrayList 먼저 import하고 GrantedAuthority import
			List<GrantedAuthority> authority = new ArrayList<GrantedAuthority>();
			authority.add(new SimpleGrantedAuthority(vo.getAuthority()));
			/*
			 * 오라클에서는 필드명을 대문자로 취급
			 * 사용자가 입력한 값과 테이블의 USERNAME(=id), PASSWORD(아래)를 비교해서
			 * 비밀번호가 불일치시 LoginFailure, 일치시 LoginSuccess
			 * 테이블의 암호화된 비밀번호와 사용자가 입력한 비밀번호를 내부로직으로 비교처리
			 */
			return new VO_User(vo.getMem_id(),vo.getMem_pw(),vo.getMem_certification().equals("1"),
					true,true,true,authority);
		}else if(logintype.equals("seller")) {
			System.out.println("[셀러] 시큐리티가 작동중입니다.");
			//셀러 로그인 파트
			VO_Seller vo = sqlSession.selectOne("spring.mvc.woorizib.persistence.DAO_All.readSeller", input_id);
			if(vo == null) throw new UsernameNotFoundException(input_id);
			List<GrantedAuthority> authority = new ArrayList<GrantedAuthority>();
			authority.add(new SimpleGrantedAuthority(vo.getAuthority()));
			return new VO_User(vo.getSel_id(),vo.getSel_pw(),vo.getSel_certification().equals("2"),
					true,true,true,authority);
			
		}else{
			//관리자 로그인 파트
			System.out.println("[관리자] 시큐리티가 작동중입니다.");
			VO_Admin vo = sqlSession.selectOne("spring.mvc.woorizib.persistence.DAO_All.readAdmin", input_id);
			if(vo == null) throw new UsernameNotFoundException(input_id);
			List<GrantedAuthority> authority = new ArrayList<GrantedAuthority>();
			authority.add(new SimpleGrantedAuthority(vo.getAuthority()));
			return new VO_User(vo.getAdm_id(),vo.getAdm_pw(),true,
					true,true,true,authority);
		}
	}

}

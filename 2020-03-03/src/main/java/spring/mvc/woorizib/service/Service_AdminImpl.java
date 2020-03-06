package spring.mvc.woorizib.service;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
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
import spring.mvc.woorizib.vo.VO_Notice;
import spring.mvc.woorizib.vo.VO_Seller;

@Service
public class Service_AdminImpl implements Service_Admin {

	@Autowired
	DAO_All daoAll;

	@Autowired
	DAO_Admin daoAdmin;

	@Autowired
	BCryptPasswordEncoder passwordEncoder; // 비밀번호 암호화 객체

	@Override
	public void signupAdmin(HttpServletRequest req, Model model) {
		VO_Admin vo = new VO_Admin();

		String adm_id = req.getParameter("adm_id");
		System.out.println("adm_id: " + adm_id);
		String adm_pw = req.getParameter("adm_pw");
		System.out.println("adm_pw: " + adm_pw);
		String encryptPw = passwordEncoder.encode(adm_pw);
		System.out.println("encryptPw: " + encryptPw);
		String adm_name = req.getParameter("adm_name");
		System.out.println("adm_name: " + adm_name);
		int adm_phone = Integer.parseInt(req.getParameter("adm_phone"));
		System.out.println("adm_phone: " + adm_phone);
		String adm_email = req.getParameter("adm_email");
		System.out.println("adm_email: " + adm_email);

		vo.setAdm_id(adm_id);
		vo.setAdm_pw(encryptPw);
		vo.setAdm_name(adm_name);
		vo.setAdm_phone(adm_phone);
		vo.setAdm_email(adm_email);

		int signupCnt = 0;

		signupCnt = daoAdmin.signupAdmin(vo);

		model.addAttribute("signupCnt", signupCnt);
	}

	// ---------------------------------------2020.02.26 유기복
	// 셀러상태 승인관리
	@Override
	public void admin_approveseller(HttpServletRequest req, Model model) {
		// 3단계. 화면으로부터 입력받은 값을 받아온다.
		// 페이징
		int pageSize = 6; // 한페이지당 출력할 글 갯수
		int pageBlock = 1; // 한 블럭당 페이지 갯수

		int cnt = 0; // 글갯수
		int start = 0; // 현재 페이지 시작 글번호
		int end = 0; // 현재 페이지 마지막 글번호
		int number = 0; // 출력용 글번호
		String pageNum = ""; // 페이지 번호
		int currentPage = 0; // 현재 페이지

		int pageCount = 0; // 페이지 갯수
		int startPage = 0; // 시작페이지
		int endPage = 0; // 마지막 페이지

		// 5-1단계. 셀러상태 승인관리 승인요청 수
		cnt = daoAdmin.admin_approvesellerCnt();

		// cnt = 30;
		System.out.println("cnt : " + cnt);

		pageNum = req.getParameter("pageNum");

		if (pageNum == null) {
			pageNum = "1"; // 첫페이지를 1페이지로 지정
		}

		currentPage = Integer.parseInt(pageNum);
		System.out.println("currentPage : " + currentPage);

		// 페이지 갯수 6 = (30 / 5) + (0)
		pageCount = (cnt / pageSize) + (cnt % pageSize > 0 ? 1 : 0); // 페이지 갯수 + 나머지 있으면 1을 더한다

		// 현재 페이지 시작 글번호(페이지별)
		// 1= (1-1)*5+1;
		start = (currentPage - 1) * pageSize + 1;

		// 현재 페이지 마지막 글번호(페이지별)
		// 5 = 1+ 5 -1;
		end = start + pageSize - 1;
		System.out.println("start : " + start);
		System.out.println("end : " + end);

		// 출력용글번호
		// 30 = 30 -( 1 - 1) * 5
		number = cnt - (currentPage - 1) * pageSize;
		System.out.println("number : " + number);
		System.out.println("pageSize : " + pageSize);

		VO_Seller vo = new VO_Seller();
		vo.setStart(start);
		vo.setEnd(end);

		if (cnt > 0) {
			// 5-2단계. 게시글 목록 조회
			ArrayList<VO_Seller> dtos = daoAdmin.admin_approvesellerCntList(vo);
			req.setAttribute("dtos", dtos);
		}
		System.out.println("cnt : " + cnt);

		// 6단계. request나 session에 처리결과를 저장(jsp에 전달하기 위함)

		// 시작페이지
		// 1 = (1 / 3) * 3 + 1;
		startPage = (currentPage / pageBlock) * pageBlock + 1;
		if (currentPage % pageBlock == 0)
			startPage -= pageBlock;
		System.out.println("startPage : " + startPage);

		// 마지막페이지
		// 3 = 1 + 3 - 1
		endPage = startPage + pageBlock - 1;
		if (endPage > pageCount)
			endPage = pageCount;
		System.out.println("endPage : " + endPage);
		System.out.println("======================================");

		req.setAttribute("cnt", cnt); // 글갯수
		req.setAttribute("number", number); // 글갯수
		req.setAttribute("pageNum", pageNum); // 글갯수
		System.out.println("pageBlock : " + pageBlock);
		System.out.println("pageCount : " + pageCount);
		if (cnt > 0) {
			req.setAttribute("startPage", startPage); // 시작페이지
			req.setAttribute("endPage", endPage); // 마지막페이지
			req.setAttribute("pageBlock", pageBlock); // 한 블럭당 페이지 갯수
			req.setAttribute("pageCount", pageCount); // 페이지 갯수
			req.setAttribute("currentPage", currentPage); // 현재페이지
		}
	}

	// 셀러 승인관리 (검색 기능 및 셀러승인)
	@Override
	public void admin_approvesellerSearchAuth(HttpServletRequest req, Model model) {
		String authoriZation = req.getParameter("authoriZation");
		String search = req.getParameter("searchInput");
		System.out.println("search : " + search);
		System.out.println("authoriZation : " + authoriZation);
		// int cnt = 0;

		if (authoriZation == null) {
			// cnt = daoAdmin.admin_approvesellerCnt();
			ArrayList<VO_Seller> dtos = daoAdmin.admin_sellerSearch(search);
			System.out.println("dtos :" + dtos);
			model.addAttribute("dtos", dtos);
			// model.addAttribute("cnt", cnt); //사용자수
		} else {
			String[] iD = req.getParameterValues("check");
			if (authoriZation.equals("2")) {
				for (int i = 0; i < iD.length; i++) {
					System.out.println("i : " + i + " --> " + iD[i]);
					String id = iD[i];
					int updateCnt_Seller = daoAdmin.admin_sellerAuth(id);
					System.out.println("updateCnt_Seller :" + updateCnt_Seller);
					model.addAttribute("updateCnt_Seller", updateCnt_Seller);
				}
			}
			if (authoriZation.equals("1")) {
				for (int i = 0; i < iD.length; i++) {
					System.out.println("i : " + i + " --> " + iD[i]);
					String id = iD[i];
					int updateCnt_Email = daoAdmin.admin_emailAuth(id);
					System.out.println("updateCnt_Email :" + updateCnt_Email);
					model.addAttribute("updateCnt_Email", updateCnt_Email);
				}
			}
		}
	}

	// 회원상태 관리
	@Override
	public void admin_administratemembers(HttpServletRequest req, Model model) {
		// 3단계. 화면으로부터 입력받은 값을 받아온다.
		// 페이징
		int pageSize = 6; // 한페이지당 출력할 글 갯수
		int pageBlock = 1; // 한 블럭당 페이지 갯수

		int cnt = 0; // 셀러+회원 사용자수
		int cnt1 = 0; // 셀러 사용자수
		int cnt2 = 0; // 회원 사용자수
		int start = 0; // 현재 페이지 시작 글번호
		int end = 0; // 현재 페이지 마지막 글번호
		int number = 0; // 출력용 글번호
		String pageNum = ""; // 페이지 번호
		int currentPage = 0; // 현재 페이지

		int pageCount = 0; // 페이지 갯수
		int startPage = 0; // 시작페이지
		int endPage = 0; // 마지막 페이지

		// 5-1단계. 회원상태 관리 승인요청 수
		String state = req.getParameter("state");
		System.out.println("state : " + state);

		if (state.equals("일반회원")) {
			cnt2 = daoAdmin.admin_administratemembersCnt();
			cnt = cnt2;
			model.addAttribute("state", "일반회원");
		} else {
			cnt1 = daoAdmin.admin_approvesellerCnt();
			cnt = cnt1;
			model.addAttribute("state", "셀러회원");
		}
		System.out.println("state : " + state);

		// cnt = 30;
		System.out.println("cnt : " + cnt);

		pageNum = req.getParameter("pageNum");

		if (pageNum == null) {
			pageNum = "1"; // 첫페이지를 1페이지로 지정
		}

		// 글 30건 기준
		currentPage = Integer.parseInt(pageNum);
		System.out.println("currentPage : " + currentPage);

		// 페이지 갯수 6 = (30 / 5) + (0)
		pageCount = (cnt / pageSize) + (cnt % pageSize > 0 ? 1 : 0); // 페이지 갯수 + 나머지 있으면 1을 더한다

		// 현재 페이지 시작 글번호(페이지별)
		// 1= (1-1)*5+1;
		start = (currentPage - 1) * pageSize + 1;

		// 현재 페이지 마지막 글번호(페이지별)
		// 5 = 1+ 5 -1;
		end = start + pageSize - 1;
		System.out.println("start : " + start);
		System.out.println("end : " + end);

		// 출력용글번호
		// 30 = 30 -( 1 - 1) * 5
		number = cnt - (currentPage - 1) * pageSize;
		System.out.println("number : " + number);
		System.out.println("pageSize : " + pageSize);

		VO_Seller vo = new VO_Seller();
		vo.setStart(start);
		vo.setEnd(end);

		VO_Member vo2 = new VO_Member();
		vo2.setStart(start);
		vo2.setEnd(end);

		if (state.equals("일반회원")) {
			if (cnt2 > 0) {
				// 5-2단계. 게시글 목록 조회
				ArrayList<VO_Member> dtos2 = daoAdmin.admin_administratemembersCntList(vo2);
				req.setAttribute("dtos2", dtos2);
			}
			System.out.println("cnt2 : " + cnt2);
		} else {
			if (cnt1 > 0) {
				// 5-2단계. 게시글 목록 조회
				ArrayList<VO_Seller> dtos = daoAdmin.admin_approvesellerCntList(vo);
				req.setAttribute("dtos", dtos);
			}
			System.out.println("cnt1 : " + cnt1);
		}

		// 6단계. request나 session에 처리결과를 저장(jsp에 전달하기 위함)

		// 시작페이지
		// 1 = (1 / 3) * 3 + 1;
		startPage = (currentPage / pageBlock) * pageBlock + 1;
		if (currentPage % pageBlock == 0)
			startPage -= pageBlock;
		System.out.println("startPage : " + startPage);

		// 마지막페이지
		// 3 = 1 + 3 - 1
		endPage = startPage + pageBlock - 1;
		if (endPage > pageCount)
			endPage = pageCount;
		System.out.println("endPage : " + endPage);
		System.out.println("======================================");

		req.setAttribute("cnt", cnt); // 글갯수
		req.setAttribute("number", number); // 글갯수
		req.setAttribute("pageNum", pageNum); // 글갯수
		System.out.println("pageBlock : " + pageBlock);
		System.out.println("pageCount : " + pageCount);
		if (cnt > 0) {
			req.setAttribute("startPage", startPage); // 시작페이지
			req.setAttribute("endPage", endPage); // 마지막페이지
			req.setAttribute("pageBlock", pageBlock); // 한 블럭당 페이지 갯수
			req.setAttribute("pageCount", pageCount); // 페이지 갯수
			req.setAttribute("currentPage", currentPage); // 현재페이지
		}
	}

	@Override
	public void admin_administratemembersSearch(HttpServletRequest req, Model model) {
		String search2 = req.getParameter("searchInput2");
		System.out.println("search2 : " + search2);

		String state2 = req.getParameter("state2");
		System.out.println("state2 : " + state2);
		String state = "";

		if (state2.equals("일반회원")) {
			state = "일반회원";
			ArrayList<VO_Member> dtos2 = daoAdmin.admin_memberSearch(search2);
			System.out.println("dtos2 :" + dtos2);
			model.addAttribute("dtos2", dtos2);
			model.addAttribute("state", state);
		} else {
			state = "셀러회원";
			ArrayList<VO_Seller> dtos = daoAdmin.admin_sellerSearch(search2);
			System.out.println("dtos :" + dtos);
			model.addAttribute("dtos", dtos);
			model.addAttribute("state", state);
		}
	}

	// 불량회원 신고관리
	@Override
	public void admin_report(HttpServletRequest req, Model model) {
		// 3단계. 화면으로부터 입력받은 값을 받아온다.
		// 페이징
		int pageSize = 6; // 한페이지당 출력할 글 갯수
		int pageBlock = 1; // 한 블럭당 페이지 갯수

		int cnt = 0; // 글갯수
		int start = 0; // 현재 페이지 시작 글번호
		int end = 0; // 현재 페이지 마지막 글번호
		int number = 0; // 출력용 글번호
		String pageNum = ""; // 페이지 번호
		int currentPage = 0; // 현재 페이지

		int pageCount = 0; // 페이지 갯수
		int startPage = 0; // 시작페이지
		int endPage = 0; // 마지막 페이지

		// 5-1단계. 셀러상태 승인관리 승인요청 수
		cnt = daoAdmin.admin_reportCnt();

		// cnt = 30;
		System.out.println("cnt : " + cnt);

		pageNum = req.getParameter("pageNum");

		if (pageNum == null) {
			pageNum = "1"; // 첫페이지를 1페이지로 지정
		}

		currentPage = Integer.parseInt(pageNum);
		System.out.println("currentPage : " + currentPage);

		// 페이지 갯수 6 = (30 / 5) + (0)
		pageCount = (cnt / pageSize) + (cnt % pageSize > 0 ? 1 : 0); // 페이지 갯수 + 나머지 있으면 1을 더한다

		// 현재 페이지 시작 글번호(페이지별)
		// 1= (1-1)*5+1;
		start = (currentPage - 1) * pageSize + 1;

		// 현재 페이지 마지막 글번호(페이지별)
		// 5 = 1+ 5 -1;
		end = start + pageSize - 1;
		System.out.println("start : " + start);
		System.out.println("end : " + end);

		// 출력용글번호
		// 30 = 30 -( 1 - 1) * 5
		number = cnt - (currentPage - 1) * pageSize;
		System.out.println("number : " + number);
		System.out.println("pageSize : " + pageSize);

		VO_Seller vo = new VO_Seller();
		vo.setStart(start);
		vo.setEnd(end);

		if (cnt > 0) {
			// 5-2단계. 게시글 목록 조회
			ArrayList<VO_Seller> dtos = daoAdmin.admin_reportCntList(vo);
			req.setAttribute("dtos", dtos);
		}
		System.out.println("cnt : " + cnt);

		// 6단계. request나 session에 처리결과를 저장(jsp에 전달하기 위함)

		// 시작페이지
		// 1 = (1 / 3) * 3 + 1;
		startPage = (currentPage / pageBlock) * pageBlock + 1;
		if (currentPage % pageBlock == 0)
			startPage -= pageBlock;
		System.out.println("startPage : " + startPage);

		// 마지막페이지
		// 3 = 1 + 3 - 1
		endPage = startPage + pageBlock - 1;
		if (endPage > pageCount)
			endPage = pageCount;
		System.out.println("endPage : " + endPage);
		System.out.println("======================================");

		req.setAttribute("cnt", cnt); // 글갯수
		req.setAttribute("number", number); // 글갯수
		req.setAttribute("pageNum", pageNum); // 글갯수
		System.out.println("pageBlock : " + pageBlock);
		System.out.println("pageCount : " + pageCount);
		if (cnt > 0) {
			req.setAttribute("startPage", startPage); // 시작페이지
			req.setAttribute("endPage", endPage); // 마지막페이지
			req.setAttribute("pageBlock", pageBlock); // 한 블럭당 페이지 갯수
			req.setAttribute("pageCount", pageCount); // 페이지 갯수
			req.setAttribute("currentPage", currentPage); // 현재페이지
		}
	}

	// 불량회원 신고관리(검색 기능 및 신고누적수정)
	@Override
	public void admin_reportSearchModifycnt(HttpServletRequest req, Model model) {
		// int reportModifyCnt = Integer.parseInt(req.getParameter("reportModifyCnt"));
		String search3 = req.getParameter("searchInput3");
		System.out.println("search3 : " + search3);
		// System.out.println("reportModifyCnt : " + reportModifyCnt);
		// int cnt = 0;

		if (req.getParameter("reportModifyCnt") == null) {
			ArrayList<VO_Seller> dtos = daoAdmin.admin_reportSearch(search3);
			System.out.println("dtos :" + dtos);
			model.addAttribute("dtos", dtos);
		} else {
			int reportModifyCnt = Integer.parseInt(req.getParameter("reportModifyCnt"));
			System.out.println("reportModifyCnt : " + reportModifyCnt);
			String[] iD = req.getParameterValues("check3");

			for (int i = 0; i < iD.length; i++) {
				System.out.println("i : " + i + " --> " + iD[i]);
				String id = iD[i];
				VO_Seller vo = new VO_Seller();
				vo.setSel_id(id);
				vo.setSel_reportcnt(reportModifyCnt);
				int updateCnt_Seller = daoAdmin.admin_reportModifyCnt(vo);
				System.out.println("updateCnt_Seller :" + updateCnt_Seller);
				model.addAttribute("updateCnt_Seller", updateCnt_Seller);
			}
		}
	}
	// ---------------------------------------2020.02.26 유기복 END
	
	/* 박찬하 2020.03.06 */
	//공지사항 조회
	@Override
	public void getNoticeList( HttpServletRequest req, Model model ){
		// 3단계. 화면으로부터 입력받은 값을 받아온다.
		//페이징
		int pageSize = 5;		//한페이지당 출력할 글 개수
		int pageBlock = 3;		//한 블럭당 페이지 개수
		
		int cnt = 0;			//글갯수
		int start = 0;			//현재 페이지 시작 글번호
		int end = 0;			//현재페이지 마지막 글번호
		int number = 0;			//출력용 글번호
		String pageNum = "";	//페이지 번호
		int currentPage = 0;	//현재페이지
		
		int pageCount = 0;		//페이지 개수
		int startPage = 0; 		//시작페이지
		int endPage = 0;		//마지막페이지
		
		//5-1단계. 글 개수 구하기
		cnt = daoAdmin.getNoticeCnt();											//<<
		System.out.println("cnt : " + cnt);
		
		pageNum= req.getParameter("pageNum");
		
		if(pageNum==null) {
			pageNum = "1";		//첫페이지를 1페이지로 지정
		}
		
		currentPage = Integer.parseInt(pageNum);	//현재페이지 : 1
		System.out.println("currentPage : " + currentPage);
		
		//페이지 개수 6 = (30 / 5) + (0)
		pageCount = (cnt / pageSize) + (cnt%pageSize > 0 ? 1:0);	//페이지 개수  + 나머지 있으면 1
		
		//현재 페이지 시작 글번호(페이지별)
		// 1 = (1 - 1) * 5 + 1;
		start = (currentPage - 1) * pageSize +1;
		
		//현재 페이지 마지막 글번호(페이지별)
		// 5 = 1 + 5 - 1;
		end = start + pageSize -1;
		
		System.out.println("start : " + start);
		System.out.println("end : " + end);
		
		//출력용 글번호
		//30 = 30 -(1-1) * 5
		number = cnt - (currentPage-1) * pageSize;
		
		System.out.println("number = " + number);
		System.out.println("pageSize = " + pageSize);
		
		
		if(cnt>0) {
			//5-2단계. 게시글 목록조회
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("start", start);
			map.put("end", end);
			
			List<VO_Notice> dtos = daoAdmin.getNoticeList(map);					//<<
			model.addAttribute("notices", dtos);
		}
		
		//6단계. request나 session에 처리결과를 저장(jsp에 전달하기 위함)
		
		//시작페이지
		//1 = (1/3) * 3 + 1;
		startPage = (currentPage / pageBlock)*pageBlock + 1;
		
		if(currentPage % pageBlock == 0)  startPage -= pageBlock;
		
		System.out.println("startPage : " + startPage);
				
		//마지막페이지
		//3+1+3-1;
		endPage = startPage + pageBlock -1;
		if(endPage > pageCount) endPage = pageCount;
		
		System.out.println("endPage : " + endPage);
		System.out.println("=====================================");
			
		model.addAttribute("cnt", cnt);						//글갯수
		model.addAttribute("number", number);					//출력용글번호
		model.addAttribute("pageNum", pageNum);				//페이지번호
		
		if(cnt > 0) {
			model.addAttribute("startPage", startPage);		//시작페이지
			model.addAttribute("endPage", endPage);			//마지막페이지
			model.addAttribute("pageBlock", pageBlock);		//한 블럭당 페이지 개수
			model.addAttribute("pageCount", pageCount);		//페이지 개수
			model.addAttribute("currentPage", currentPage);	//현재페이지
		}
	}
	//공지사항 글 가져오기
	@Override
	public void getNoticeDetail(HttpServletRequest req, Model model) {
		String ntc_number = req.getParameter("ntc_number");
		System.out.println( "ntc_number : " + ntc_number );
		
		req.setAttribute("notice", daoAdmin.selectNotice( ntc_number ) );		
	}
	
	//공지사항 수정 pro
	@Override
	public void modifyPro( HttpServletRequest req, Model model ) {
		String ntc_number = req.getParameter("ntc_number");
		String adm_id = req.getParameter("adm_id");
		String ntc_title = req.getParameter("ntc_title");
		String ntc_content = req.getParameter("ntc_content");
		
		System.out.println("ntc_number : " + ntc_number);
		System.out.println("adm_id : " + adm_id );
		System.out.println("ntc_title : " + ntc_title );
		System.out.println("ntc_content : " + ntc_content );
		
		VO_Notice notice = new VO_Notice();
		notice.setNtc_number(ntc_number);
		notice.setAdm_id(adm_id);
		notice.setNtc_title(ntc_title);
		notice.setNtc_content(ntc_content);
		
		req.setAttribute("updateCnt", daoAdmin.updateNotice(notice));
	}
	
	//공지사항 삭제
	@Override
	public void deleteNotice(HttpServletRequest req, Model model) {
		String ntc_number = req.getParameter("ntc_number");
		System.out.println("ntc_number : " + ntc_number );
		
		daoAdmin.deleteNotice( ntc_number );
		
	}
	//공지사항 추가 pro
	@Override
	public void addNotice(HttpServletRequest req, Model model) {
		String ntc_title = req.getParameter("ntc_title");				//제목
		String ntc_content = req.getParameter("ntc_content");			//내용
		//String adm_id = (String)req.getSession().getAttribute("memId");	//관리자 == 작성자
		String adm_id = "admin";
		
		//output
		System.out.println("ntc_title : " + ntc_title );
		System.out.println("ntc_content : " + ntc_content );
		System.out.println("adm_id : " + adm_id );
		
		//setting VO
		VO_Notice notice = new VO_Notice();
		notice.setNtc_title(ntc_title);
		notice.setNtc_content(ntc_content);
		notice.setAdm_id(adm_id);
		
		req.setAttribute("insertCnt", daoAdmin.insertNotice( notice ));
	}
	/* 박찬하 2020.03.06 */
	
	

}

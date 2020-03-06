package spring.mvc.woorizib.service;

import java.io.File;
import java.io.IOException;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import spring.mvc.woorizib.persistence.DAO_All;
import spring.mvc.woorizib.vo.VO_Auction;
import spring.mvc.woorizib.vo.VO_Community;
import spring.mvc.woorizib.vo.VO_LiveAuc;
import spring.mvc.woorizib.vo.VO_Member;
import spring.mvc.woorizib.vo.VO_Property;
import spring.mvc.woorizib.vo.VO_QnA;
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
		
		String realDir="D:\\workspace\\2020-03-03\\src\\main\\webapp\\resources\\images"; // 저장 경로
		
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
	
	
	/* 20.02.25 - 허은정, 커뮤니티  Service 메서드 */
	@Override
	public void community_List(HttpServletRequest req, Model model) {
		int pageSize = 10;	//한페이지당 출력할 글의 개수
		int pageBlock = 20;	//한 블럭당 페이지 개수
		
		int cnt = 0;		//글개수
		int start = 0;		//현재 페이지 시작 글번호
		int end = 0;		//현재 페이지 마지막 글번호
		int number = 0;		//출력용 글번호
		String pageNum = "";//페이지 번호
		int currentPage = 0;//현재 페이지
		
		int pageCount = 0;	//페이지 갯수
		int startPage = 0;	//시작페이지
		int endPage = 0;	//마지막 페이지
		
		//글갯수 구하기
		cnt = daoAll.getArticleCnt();
		
		pageNum = req.getParameter("pageNum");
		
		if(pageNum == null) {
			pageNum = "1";	//첫페이지를 1페이지로 지정
		}
		
		//글 30건 기준
		currentPage = Integer.parseInt(pageNum);	//현재페이지 : 1
		
		//페이지 개수
		pageCount = (cnt/pageSize)+(cnt%pageSize > 0 ? 1 : 0);	//페이지 개수+나머지있으면 1
		
		//현재페이지 시작 글번호(페이지별)
		start = (currentPage - 1) * pageSize + 1;
		
		//현재페이지 마지막 글번호(페이지별)
		end = start + pageSize - 1;
		
		//출력용 글번호
		number = cnt - (currentPage - 1) * pageSize;
		
		if(cnt > 0) {
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("start", start);
			map.put("end", end);
			
			//5-2단계. 게시글 목록 조회
			List<VO_Community> dtos = daoAll.getArticleList(map);
			model.addAttribute("dtos", dtos);
		}
		//시작페이지
		startPage = (currentPage/pageBlock) * pageBlock + 1;
		if(currentPage%pageBlock == 0)startPage -= pageBlock;
		
		//마지막페이지
		endPage = startPage + pageBlock - 1;
		if(endPage > pageCount)endPage = pageCount;
		model.addAttribute("cnt", cnt);			//글갯수
		model.addAttribute("number", number);		//출력용 글번호
		model.addAttribute("pageNum", pageNum);	//페이지 번호
		
		if(cnt > 0) {
			model.addAttribute("startPage", startPage);	//시작페이지
			model.addAttribute("endPage", endPage);		//마지막페이지
			model.addAttribute("pageBlock", pageBlock);	//한 블록당 페이지 갯수
			model.addAttribute("pageCount", pageCount);	//페이지 갯수
			model.addAttribute("currentPage", currentPage); //현재페이지
		}
 	}
	
	@Override
	public void community_form(HttpServletRequest req, Model model) {
		int pageNum = Integer.parseInt(req.getParameter("pageNum"));
		System.out.println("pageNum"+pageNum);
		int gnd_number=Integer.parseInt(req.getParameter("gnd_number"));
		System.out.println("gnd_number"+gnd_number);
		
		//상세페이지 조회
		VO_Community dto = daoAll.getArticle(gnd_number);
		
		model.addAttribute("dto", dto);
		model.addAttribute("pageNum", pageNum);
		model.addAttribute("gnd_number",gnd_number);
	}
	
	@Override
	public void community_modifyForm(HttpServletRequest req, Model model) {
		VO_Community vo = null;
		int pageNum = Integer.parseInt(req.getParameter("pageNum"));
		int gnd_number = Integer.parseInt(req.getParameter("gnd_number"));
		
		vo = daoAll.getArticle(gnd_number);
		model.addAttribute("dto", vo);
		model.addAttribute("pageNum", pageNum);
		model.addAttribute("gnd_number", gnd_number);
	}
	
	@Override
	public void community_modifyPro(HttpServletRequest req, Model model) {
		int pageNum = Integer.parseInt(req.getParameter("pageNum"));
		String number = req.getParameter("gnd_number");
		String title = req.getParameter("gnd_title");
		String content = req.getParameter("gnd_content");
		
		//바구니 생성
		VO_Community vo = new VO_Community();
		
		//값을 VO_Community바구니에 담는다.
		vo.setGnd_number(number);
		vo.setGnd_title(title);
		vo.setGnd_content(content);
		
		//글수정 처리
		int updateCnt = daoAll.updateCommunity(vo);
		
		model.addAttribute("updateCnt", updateCnt);
		model.addAttribute("pageNum", pageNum);
	}
	
	@Override
	public void community_writeForm(HttpServletRequest req, Model model) {
		int num = 0;
		int pageNum = 0;
		
		model.addAttribute("gnd_number", num);
		model.addAttribute("pageNum", pageNum);
	}
	
	@Override
	public void community_writePro(HttpServletRequest req, Model model) {
		//바구니 생성
		VO_Community vo = new VO_Community();
		
		int pageNum = Integer.parseInt(req.getParameter("pageNum"));
		vo.setGnd_number(req.getParameter("gnd_number"));
		
		vo.setMem_id((String)req.getSession().getAttribute("memID"));
		vo.setGnd_title(req.getParameter("gnd_title"));
		vo.setGnd_content(req.getParameter("gnd_content"));
		
		vo.setReg_date(new Timestamp(System.currentTimeMillis()));
		
		int insertCnt = daoAll.insertCommunity(vo);
		
		model.addAttribute("insertCnt", insertCnt);
		model.addAttribute("pageNum", pageNum);
		System.out.println("pageNum="+pageNum);
	}
	
	@Override
	public void community_deletePro(HttpServletRequest req, Model model) {
		int num = Integer.parseInt(req.getParameter("gnd_number"));
		
		int deleteCnt = daoAll.deleteCommunity(num);
		model.addAttribute("deleteCnt", deleteCnt);
	}
	
	
	//qna목록 가져 오기 
		@Override
		public void qnaList(HttpServletRequest req, Model model) {
			//3단계. 화면으로부터 입력받은 값을 받아온다.
			//페이징
			int pageSize=5;		// 한페이지당 출력할 글의 갯수
			int pageBlock=3;	// 한 블럭당 페이지 갯수
			
			int cnt=0; 			// 글 갯수
			int start=0; 		// 현재 페이지 시작 글 번호
			int end=0;			// 현재 페이지 마지막 글번호
			int number=0;		// 출력용 글 번호
			int pageNum=0; 	// 페이지 번호
			int currentPage=0;	// 현재 페이지
			
			int pageCount=0;	// 페이징 갯수
			int startPage=0;	// 시작 페이지
			int endPage=0;		// 마지막 페이지
			
			//5-1단계. 글의 갯수 구하기
			cnt=daoAll.getQnaCnt();
			System.out.println("cnt:"+cnt);
			
			if(req.getParameter("pageNum") != null) {	
				pageNum= Integer.parseInt(req.getParameter("pageNum"));
			
			}
			
			
			
			if(pageNum == 0) {
				pageNum=1;	// 첫페이지를 1페이지로 지정
			}
			//글 30건 기준
			currentPage=pageNum;	// 현재 페이지:2
			System.out.println("currentPage:"+currentPage);
			
			// 페이지 갯수  6 = (30 /5) + (0)
			pageCount=(cnt/pageSize) + (cnt % pageSize > 0 ? 1: 0);	// 페이지 갯수+ 나머지 있으면 1
			
			// 현재 페이지 시작 글 번호 (페이지 별)
			// 1=(1-1) * 5 +1 ;
			start=(currentPage-1) * pageSize+1;
			
			// 현재 페이지 마지막 글 번호 (페이지 별)
			// 5 = 1 + 5-1 ;
			end= start + pageSize -1;
			
			System.out.println("start:"+start);
			System.out.println("end:"+end);
			
			// 출력용 글 번호
			// 30 = 30- (1-1) * 5
			number = cnt -(currentPage -1) * pageSize;
			
			System.out.println("number:"+number);
			System.out.println("pageSize:"+pageSize);
			
			
			if(cnt >0) {
				
				//5-2단계 게시글 목록 조회
				Map<String,Object> map= new HashMap<String,Object>();
				
				map.put("start", start);
				map.put("end", end);
				
				List<VO_QnA> dtos =daoAll.getQnaList(map);
				
				model.addAttribute("dtos", dtos);
			}
			
			//6단계. request나 session에 처리 결과를 저장(jsp에 전달하기 위함)
			
			
			// 시작 페이지
			// 1 = (1/3) * 3 +1 ;
			startPage =(currentPage/pageBlock) * pageBlock +1;
			if(currentPage % pageBlock ==0) startPage -= pageBlock;
			
			System.out.println("startPage:"+startPage);	
			
			// 마지막 페이지
			// 3 = 1 + 3 -1;
			endPage= startPage + pageBlock-1;
			if(endPage > pageCount) endPage= pageCount;
			
			System.out.println("endPage:"+endPage);
			System.out.println("=================");	
			
			model.addAttribute("cnt", cnt);			// 글갯수
			model.addAttribute("number", number); 	//출력용 글 번호
			model.addAttribute("pageNum", pageNum);	//페이지 번호
			
			if(cnt > 0) {
				model.addAttribute("startPage", startPage);		// 시작 페이지
				model.addAttribute("endPage", endPage);			// 마지막 페이지
				model.addAttribute("pageBlock", pageBlock);   	// 한 블럭당 페이지 갯수
				model.addAttribute("pageCount", pageCount);   	// 페이지 갯수
				model.addAttribute("currentPage", currentPage);	// 현재 페이지
				
			
				
			}

			System.out.println("pageNum:"+pageNum);
		}
		
		
		
		
		
		//박은슬 2020-03-05
		/*경매 상세페이지*/
		@Override
		public void auctionDetail(HttpServletRequest req, Model model) {
			//String auc_number=req.getParameter("auc_number");
			String auc_number="auc10021";
			VO_Auction dto=daoAll.getAuction(auc_number);
			VO_Property vo=daoAll.getProperty(daoAll.getPrp_number(auc_number));	//경매 매물 상세정보
			
			List<String> images=new ArrayList<String>();
			String prp_title=vo.getPrp_title();
			String image1=vo.getPrp_image1();
			String image2=vo.getPrp_image2();
			String image3=vo.getPrp_image3();
			String image4=vo.getPrp_image4();
			String image5=vo.getPrp_image5();
			
			if(prp_title!=null) {
				images.add(prp_title);
				
			}
			if(image1!=null) {
				images.add(image1);
				
			}
			if(image2!=null) {
				images.add(image2);
				
			}
			if(image3!=null) {
				images.add(image3);
				
			}
			if(image4!=null) {
				images.add(image4);
				
			}
			if(image5!=null) {
				images.add(image5);
				
			}
			
			model.addAttribute("dto", dto);	//경매 상세정보
			model.addAttribute("pimages",images);	//경매 매물 이미지
			model.addAttribute("prp_dto",vo);//경매 매물 상세정보
			
		}
		
		/*실시간 경매입찰 */
		@Override
		public List<VO_LiveAuc> auctionLive(HttpServletRequest req, Model model) {
			String auc_number=req.getParameter("auc_num");

			List<VO_LiveAuc> dtos=daoAll.getLiveAucs(auc_number);
			model.addAttribute("dtos",dtos);
			return dtos;
		}
		/*경매 현재가*/
		@Override
		public int auctionNowPrice(HttpServletRequest req, Model model) {
			String auc_number=req.getParameter("auc_num");
			
			return daoAll.getNowPrice(auc_number);
		}

		/*경매 마감 상태로 바꾸기*/
		@Scheduled(cron ="0 * * * * *")
	    public void scheduleRun(){
	        System.out.println("경매 상태 마감으로 바꾸기");
	        Calendar calendar = Calendar.getInstance();
			 SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			 
			 System.out.println("현재 시간 : " + dateFormat.format(calendar.getTime()));
			 String time=dateFormat.format(calendar.getTime());
			int insertCnt=daoAll.checkAuction(time);
			System.out.println("종료된 경매 갯수:"+insertCnt);
	    }	
}

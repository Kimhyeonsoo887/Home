package spring.mvc.woorizib.service;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import spring.mvc.woorizib.persistence.DAO_All;
import spring.mvc.woorizib.persistence.DAO_Member;
import spring.mvc.woorizib.vo.VO_Comments;
import spring.mvc.woorizib.vo.VO_Member;
import spring.mvc.woorizib.vo.VO_Property;
import spring.mvc.woorizib.vo.VO_QnA;

@Service
public class Service_MemberImpl implements Service_Member{
	
	@Autowired
	DAO_All daoAll;
	
	@Autowired
	DAO_Member daoMember;
	
	@Autowired
	BCryptPasswordEncoder passwordEncoder;	// 스프링 암호화
	
	/* ▶ 회원수정 및 탈퇴 */
	
	/* 전영현 2020.02.13 */
	
	//회원정보 수정 화면 
	@Override
	public void modifyView(HttpServletRequest req, Model model) {
		String strId=(String)req.getSession().getAttribute("memID");
		//String strPwd=req.getParameter("member_pw");
		
		//String pwd=daoAll.pwdCheck(strId);
		
		//int selectCnt=0;
		//if(passwordEncoder.matches(strPwd, pwd)) {
			//selectCnt=1;
			VO_Member vo=daoAll.readMember(strId);
			model.addAttribute("vo", vo);
	
		//}
		
		//model.addAttribute("dto", vo);
	
	}

	//회원정보 수정 처리 
	@Override
	public void updateMemberPro(HttpServletRequest req, Model model) {
		String strId=(String)req.getSession().getAttribute("memID");	
		
		String member_pw=req.getParameter("textPassword1");
		String member_hp=req.getParameter("textphone");
		String encodepwd = passwordEncoder.encode(member_pw);
		
		VO_Member vo=new VO_Member();
		
		vo.setMem_id(strId);
		vo.setMem_pw(encodepwd);
		vo.setMem_phone(member_hp);
		
		int updateCnt=daoAll.updateMember(vo);
		model.addAttribute("updateCnt", updateCnt);
		
	}

	//회원탈퇴 처리 
	@Override
	public void deleteMemberPro(HttpServletRequest req, Model model) {
		String strId=(String)req.getSession().getAttribute("memID");
		
		String strPwd=req.getParameter("user_pwd");
		
		String pwd=daoAll.pwdCheck(strId);

		int deleteCnt=0;
		int selectCnt=0;
		
		if(passwordEncoder.matches(strPwd, pwd)) {
			selectCnt = 1;
			deleteCnt=daoAll.deleteMember(strId);
		}
		
		model.addAttribute("selectCnt", selectCnt);
		model.addAttribute("deleteCnt", deleteCnt);
		
	}
	/* 전영현 2020.02.13 */
	
	/* ▶ 회원수정 및 탈퇴 */
	
	

	@Override
	public void qnawritePro(HttpServletRequest req, Model model) {
		//바구니 생성
		VO_QnA vo=new VO_QnA();
		//3-1단계.이전 화면(writeForm의 hidden)으로넘긴 값을 받아와서 바구니에 담는다.
		int pageNum=Integer.parseInt(req.getParameter("pageNum"));
	    String qna_number=req.getParameter("qna_number");
		
	    
	    System.out.println("qna_number2222" + qna_number);
	    System.out.println("pageNum2222222"+pageNum);
		//3-2단계 이전 화면에서 입력한 값 (작성자,제목,내용,비밀번호)를 바구니에 담는다.
	    
		vo.setMem_id((String)req.getSession().getAttribute("memID"));
		vo.setQna_title(req.getParameter("qna_title"));
		vo.setQna_content(req.getParameter("qna_content"));
		vo.setQna_accessibility(req.getParameter("qna_accessibility"));
		vo.setQna_registerdate((new Timestamp(System.currentTimeMillis())));
		vo.setQna_number(qna_number);
		vo.setQna_type(req.getParameter("qna_type"));
		
		//5단계.글쓰기 처리
		int insertCnt=daoMember.insertQna(vo);
		
		//6단계 request나 session에 처리 결과를 저장(jsp에 전달하기 위함)
		model.addAttribute("insertCnt", insertCnt);
		model.addAttribute("pageNum", pageNum);
		
	}

	@Override
	public void qnacontent(HttpServletRequest req, Model model) {
		//3단계.화면으로 입력받은 값(get 방식)을 받아온다.
		String qna_number=req.getParameter("qna_number");
		int pageNum=Integer.parseInt(req.getParameter("pageNum"));
		int number=Integer.parseInt(req.getParameter("number"));
		
		//5-1단계 조회수 증가
		daoMember.addReadCnt(qna_number);
		
		//5-2단계 상세페이지 조회
		VO_QnA vo=daoMember.getQna(qna_number);
		
		//6단계 request나 session에 처리 결과를 저장(jsp에 전달하기 위함)
		//바구니,pageNum, number
		model.addAttribute("dto",vo);	//참조변수
		model.addAttribute("pageNum",pageNum);
		model.addAttribute("number", number);
		
	}

	//수정 
	@Override
	public void qnamodifyView(HttpServletRequest req, Model model) {
		//3단계.화면으로부터 입력받은 값(hidden값,input값)을 받아온다.
		VO_QnA vo= null;
		String qna_number=req.getParameter("qna_number");
		int pageNum=Integer.parseInt(req.getParameter("pageNum"));
		//String strPwd=req.getParameter("pwd");
		

		//5-1단계 비밀번호 인증

		//Map<String,Object> map=new HashMap<String,Object>();
		//map.put("num", num);
		//map.put("strPwd", strPwd);

		//int selectCnt=dao.numPwdCheck(map);
		
		//5-2단계. 비밀번호가 일치하면, 해당 글 1건을 읽어서 BoardVO 바구니에 담는다.
		//if(selectCnt==1) {
			vo=daoMember.getQna(qna_number);
		//}
		
		//6단계 request나 session에 처리 결과를 저장(jsp에 전달하기 위함)
		//dto,selectCnt, num, pageNum
		model.addAttribute("qna_number",qna_number);
		model.addAttribute("pageNum", pageNum);
		//model.addAttribute("selectCnt", selectCnt);
		model.addAttribute("dto",vo );
	}

	@Override
	public void qnamodifyPro(HttpServletRequest req, Model model) {
		//3단계.화면으로부터 입력받은 값(hidden값,input값)을 받아온다.
		String qna_number=req.getParameter("qna_number");
		int pageNum=Integer.parseInt(req.getParameter("pageNum"));
		String qna_title=req.getParameter("qna_title");
		String qna_content=req.getParameter("qna_content");
		
		//바구니 생성
		VO_QnA vo= new VO_QnA();
		
		vo.setQna_number(qna_number);
		//System.out.println(qna_number);
		vo.setQna_title(qna_title);
		//System.out.println(qna_title);
		vo.setQna_content(qna_content);
		//System.out.println(qna_content);
		vo.setQna_modifieddate((new Timestamp(System.currentTimeMillis())));
		//System.out.println(new Timestamp(System.currentTimeMillis()));
		
		//5단계 글 수정 처리  수정 여부 int형으로 받는다.
		int updateCnt=daoMember.updateQna(vo);
		
		System.out.println("update:"+updateCnt);
		model.addAttribute("updateCnt", updateCnt);
		model.addAttribute("pageNum", pageNum);
		model.addAttribute("qna_number", qna_number);
		
		
	}

	@Override
	public void qnadeletePro(HttpServletRequest req, Model model) {
		//3단계.화면에서 입력받은 값(제목,내용) hidden 으로 넘긴 num 값을 BoardVO바구니에 담는다.
		String qna_number=req.getParameter("qna_number");
		int pageNum=Integer.parseInt(req.getParameter("pageNum"));
		//String strPwd=req.getParameter("pwd");
		
	
		//Map<String,Object> map=new HashMap<String,Object>();
		//map.put("num", num);
		//map.put("strPwd", strPwd);
	
		//5-1단계.비밀번호 인증
		//int selectCnt=dao.numPwdCheck(map);
		
		int deleteCnt=0;
		
		//5-2단계  비밀번호 인증 후 글삭제 처리
		
		// if(selectCnt == 1) { 
			 deleteCnt=daoMember.deleteQna(qna_number); 
		// }
		 
		System.out.println("deleteCnt"+deleteCnt);
		
		//6단계 request나 session에 처리 결과를 저장(jsp에 전달하기 위함)
		//model.addAttribute("selectCnt", selectCnt);
		model.addAttribute("pageNum", pageNum);
		model.addAttribute("deleteCnt", deleteCnt);
		
	}

	//댓글 등록 
	@Override
	public void commentwritePro(HttpServletRequest req, Model model) {
		String cmt_content=req.getParameter("cmt_content");
		
		System.out.println("cmt_content"+cmt_content);
		String strId=(String)req.getSession().getAttribute("memID");
		
		System.out.println("아이디"+strId);
		String qna_number=req.getParameter("qna_number");
		System.out.println("qna_number"+qna_number);
		
		VO_Comments vo_comments=new VO_Comments();
		
		vo_comments.setCmt_content(cmt_content);
		vo_comments.setCmt_registerdate(new Timestamp(System.currentTimeMillis()));
		vo_comments.setCmt_writer(strId);
		vo_comments.setQna_number(qna_number);
		
		int insertCnt=daoMember.insertComment(vo_comments);
		model.addAttribute("insertCnt", insertCnt);
	}

	//댓글 리스트 가져 오기 
	
	  @Override 
	  public ArrayList<VO_Comments> commentList(HttpServletRequest req, Model model) {
		  String qna_number=req.getParameter("qna_number"); 
		  
		  System.out.println("qna_numberdsfdsfdfsf"+qna_number);
		  
		  ArrayList<VO_Comments> vo=daoMember.selectComment(qna_number); 
		 
		  return vo;
	  }

	
	  
	  
	  /*박은슬 */
		//결제페이지 
		@Override
		public void auctionPayment(HttpServletRequest req, Model model) {
			String auc_number=req.getParameter("auc_number");
			//String mem_id=(String)req.getSession().getAttribute("memID");
			int nowPrice=daoAll.getNowPrice(auc_number);
			model.addAttribute("auc_number",auc_number);
			model.addAttribute("nowPrice",nowPrice);
			
		}
		//결제처리
		@Override
		public void auctionpayPro(HttpServletRequest req, Model model) {
			//String strId=(String)req.getSession().getAttribute("memID");
			System.out.println("---------------");
			String strId="member";
			int lac_tender=Integer.parseInt(req.getParameter("lac_tender"));
			
			System.out.println("auc"+req.getParameter("auc_number"));
			String auc_number=req.getParameter("auc_number");
			
			int insertCnt=0;
			int nowPrice=daoAll.getNowPrice(auc_number);
			if(lac_tender>nowPrice) {
				Map<String,Object> map=new HashMap<String,Object>();
				map.put("mem_id", strId);
				map.put("auc_number",auc_number);
				map.put("lac_tender",lac_tender);
				insertCnt=daoMember.auctionpayPro(map);
			}
			model.addAttribute("insertCnt",insertCnt);
		}
		/*박은슬 */

		@Override
		public void selectProperty(HttpServletRequest req, Model model) {
			
			ArrayList<VO_Property> dtos; 
			
			dtos = daoMember.selectProperty();
			
			VO_Property vo = dtos.get(1);
			
			System.out.println(vo.getPrp_monthlycost());
			System.out.println(vo.getPrp_propertycost());
			System.out.println(vo.getPrp_termtype());
			System.out.println(vo.getPrp_leasecost());
			model.addAttribute("dtos", dtos);
		}

		@Override
		public void selectPropertyDetail(HttpServletRequest req, Model model) {

			String prp_number = req.getParameter("prp_number");
				
			VO_Property vo = daoMember.selectPropertyDetail(prp_number);
			
			model.addAttribute("vo", vo);
		}
}

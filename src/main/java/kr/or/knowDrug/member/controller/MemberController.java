package kr.or.knowDrug.member.controller;

import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Properties;

import javax.annotation.Resource;
import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.aspectj.weaver.NewParentTypeMunger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import kr.or.knowDrug.member.service.MemberPage;
import kr.or.knowDrug.member.service.MemberService;
import kr.or.knowDrug.member.vo.MemberVO;


@Controller
public class MemberController {

	@Resource(name = "memberService")
	private MemberService memberService;

	private int size = 10;


	//사용자 - 메인
	@RequestMapping(value="/main.do", method=RequestMethod.GET)
	public String main() {
		return "/main";
	}


	/**
	 * 회원가입 뷰 열기
	 * @author
	 * @param
	 * @return
	 * @exception
	*/
	@RequestMapping(value="/join.do", method=RequestMethod.GET)
	public String join() {
		System.out.println("회원가입!!");
		return "/member/join";
	}



	/**
	 * 회원가입
	 * @author 길정우
	 * @param map
	 * @return "/member/join"
	 * @throws Exception
	*/
	@RequestMapping(value="/join.do", method=RequestMethod.POST)
	public String joinPost(@RequestParam Map<String,Object> map, Model model, HttpServletResponse response) throws Exception {
		System.out.println("회원가입!!");
		System.out.println("map : " + map);
		int res = memberService.join(map);

        response.setContentType("text/html; charset=UTF-8");
        PrintWriter out = response.getWriter();
        if(res > 0) {
        	out.println("<script>alert('Know Drug 회원이 되신 걸 축하드립니다.😊');</script>");
        }else {
        	out.println("<script>alert('회원가입에 실패하였습니다. 다시 시도해주세요.');</script>");
        }
        out.flush();

		return "/main";
	}


	/**
	 * 아이디 중복 확인
	 * @author 길정우
	 * @param map
	 * @return
	 * @exception Exception
	*/
	@ResponseBody
	@RequestMapping(value="/idDuplCheck.do")
	public String idDuplCheck(@RequestParam Map<String, Object> map) throws Exception {
		int res = memberService.idDuplCheck(map);
		return String.valueOf(res);
	}




	/**
	 * 로그인
	 * @author 길정우
	 * @param map - 멤버 아이디가 담김
	 * @param req
	 * @return "main"
	 * @exception Exception
	 */
	@RequestMapping(value="/login.do")
	public String login(@RequestParam Map<String, Object> map, HttpSession session,HttpServletResponse response) throws Exception {
		MemberVO member = memberService.mypage(map);
		String activeYn = member.getActiveYn();
		String memPwd = map.get("memPwd").toString();

		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();

		if(!member.getMemPwd().equals(memPwd)) {
            out.println("<script>alert('비밀번호가 맞지 않습니다'); location.replace('main.do');</script>");


		}else if(activeYn.equals("N")) {
			out.println("<script>alert('탈퇴한 회원입니다'); location.replace('main.do');</script>");

		}else if(activeYn.equals("D")) {
			out.println("<script>alert('비활성화 된 회원입니다. knowDrug@naver.com으로 연락주세요'); location.replace('main.do');</script>");
		}else {
			MemberVO mem =  memberService.selectMember(map);
			session.setAttribute("member", mem);
			session.setAttribute("memId", mem.getMemId());
			session.setAttribute("memName", mem.getMemName());
		}

		out.flush();
		return  "/main";

	}


	/**
	 * 로그아웃
	 * @author 길정우
	 * @param session
	 * @return "main"
	*/
	@RequestMapping(value="/logout.do")
	public String logout(HttpSession session) {
		session.removeAttribute("member");
		return "redirect:/main.do";
	}

	/**
	 * 마이페이지 조회
	 * @author 길정우
	 * @param req
	 * @return "mypage"
	 * @exception Exception
	*/
	@RequestMapping(value="/mypage.do", method=RequestMethod.GET)
	public String mypage(@RequestParam Map<String, Object> map, HttpServletRequest req)  throws Exception{
		MemberVO member = memberService.mypage(map);
		req.setAttribute("member", member);
		return "/member/mypage";
	}


	/**
	 * 마이페이지 수정 - 회원
	 * @author 길정우
	 * @param map
	 * @param req
	 * @return "mypage"
	 * @exception Exception
	*/
	@RequestMapping(value="/mypage.do", method=RequestMethod.POST)
	public String mypagePost(@RequestParam Map<String, Object> map, HttpServletRequest req)  throws Exception{
		System.out.println("mypagePost");
		System.out.println(map);
		int res = memberService.modiMypage(map);
		System.out.println("res : " + res);
		String memId = map.get("memId").toString();
		System.out.println(memId);
		return "redirect:/mypage.do?memId="+memId;
	}


	/**
	 * 회원 탈퇴
	 * @author 길정우
	 * @param
	 * @return
	 * @throws Exception
	*/
	@RequestMapping(value="/changeActive.do")
	public String changeActive(@RequestParam Map<String, Object> map, HttpSession session) throws Exception {
		System.out.println("회원탈퇴");
		System.out.println(map);
		map.put("memId", session.getAttribute("memId"));
		System.out.println(map);
		int res = memberService.changeActive(map);
		System.out.println("회원탈퇴  :"+ res);
		session.removeAttribute("member");
		return "/main";
	}


	/**
	 * 비밀번호 찾기 페이지 이동
	 * @author 하윤주
	 * @return /password
	 * @throws Exception
	*/
	@RequestMapping(value="/password.do")
	public String password() {

		return "/member/password";
	}

	/**
	 * 회원 관리 리스트
	 * @author 하윤주
	 * @param map
	 * @return /memberList
	 * @throws Exception
	*/
	@RequestMapping(value="/memberList.do")
	public String selectMemberList(@RequestParam Map<String, Object> map, Model model ) throws Exception {
		int total = memberService.selectCount();

		String strPageNum = map.get("pageNum") == null?"1":map.get("pageNum").toString();
		int pageNum =  Integer.parseInt(strPageNum);
		map.put("pageNum", pageNum);

		List<MemberVO> memberList = memberService.selectMemberList(map);

		model.addAttribute("memberList", new MemberPage(total, pageNum, size, memberList));

		return "/admin/memberList";
	}

	/**
	 * 회원 상태 수정 -비활성화
	 * @author 하윤주
	 * @param map
	 * @return /memberList
	 * @throws Exception
	 */
	@RequestMapping(value="/memberYn.do", method=RequestMethod.POST)
	public String memModify(@RequestParam Map<String, Object> map,HttpServletRequest req) throws Exception {
		int res = memberService.changeActiveD(map);
		System.out.println("res는"+ res);
		return  "redirect:/memberList.do";
	}

	/**
	 * 회원 상태 수정 -활성화
	 * @author 하윤주
	 * @param map
	 * @return /memberList
	 * @throws Exception
	 */
	@RequestMapping(value="/memact_y.do")
	public String memactY(@RequestParam Map<String, Object> map,HttpServletRequest req) throws Exception {
		String memId = (String) map.get("memId");
		map.put("memId", memId);

		memberService.changeActY(map);

		return  "redirect:/memberList.do";
	}




	/**
	 * 임시비밀번호전송ajax
	 * @param map
	 * @param model
	 * @return mav
	 * @throws Exception
	 */
	 @ResponseBody
	   @RequestMapping(value="/sendEmail.do")
	   public ModelAndView tempchangePwd(@RequestParam Map<String, Object> map, Model model) throws Exception {
	      String memId =  (String) map.get("memId");
	      String memName =  (String) map.get("memName");

	      MemberVO member = memberService.dupl_id(map);
	      if(member !=null) {
	    	  String temp_pwd = randomPassword(7);

	    	  Map<String, Object> pwdMap = new HashMap<>();
	    	  pwdMap.put("tempPwd", temp_pwd);
	    	  pwdMap.put("memId", memId);

	    	  memberService.setPwd(pwdMap);

	    	  String subject = "KnowDrug 임시비밀번호 발송";
	    	  String body = "임시비밀번호 발송 "+memName+"님의 임시비밀번호는 "+temp_pwd+"입니다.";
	    	  sendEmail(memId, subject, body);
	      }

	      ModelAndView mav = new ModelAndView("jsonView");
	      mav.addObject("data", member);

	      return mav;
	   }


	/**
	 * 비밀번호 변경뷰 열기
	 * @author 하윤주
	 * @return changePwd
	 * @exception
	*/
	@RequestMapping(value="/changePwdPage.do", method=RequestMethod.GET)
	public String changePwd() {
		return "/member/changePwd";
	}


	/**
	 * 비밀번호 변경ajax
	 * @author 하윤주
	 * @param map
	 * @param model
	 * @return mav
	 * @throws Exception
	 */
	   @ResponseBody
	   @RequestMapping(value="/changePwd.do", method=RequestMethod.POST)
	   public ModelAndView changePwd(@RequestParam Map<String, Object> map, Model model, HttpSession session, HttpServletResponse response) throws Exception {
			 String pwd =  (String) map.get("pwd");
		     String newPwd =  (String) map.get("newPwd");
		     String memId = session.getAttribute("memId").toString();

		     map.put("memId", memId);
		     MemberVO member = memberService.dupl_id(map);

		     String msg = "";
		     System.out.println(member.getMemPwd().toString().equals(pwd));
		     if(member.getMemPwd().equals(pwd)) {
		    	 memberService.changePwd(map);
	    		 msg ="ok";
		     }else {
		    	 msg = "ng";
		     }

		     ModelAndView mav = new ModelAndView("jsonView");
		     mav.addObject("data",msg);
		     logout(session);

		     return mav;
	   }

	/**
	 * 메일전송 메소드
	 * @author 하윤주
	 * @param memId
	 * @param subject
	 * @param body
	 * @throws Exception
	 */
	public void sendEmail(String memId, String subject, String body) throws Exception{

	        //메일 관련 정보
	        String host = "smtp.naver.com";
	        final String username = "dbswn4686"; //네이버 이메일 주소중 @ naver.com 앞주소만 작성
	        final String password = "gk44014401"; //네이버 이메일 비밀번호를 작성
	        int port=465;                      //네이버 STMP 포트 번호

	        Properties props = System.getProperties();

	        props.put("mail.smtp.host", host);
	        props.put("mail.smtp.port", port);
	        props.put("mail.smtp.auth", "true");
	        props.put("mail.smtp.ssl.enable", "true");
	        props.put("mail.smtp.ssl.trust", host);

	        Session session = Session.getDefaultInstance(props, new javax.mail.Authenticator() {
	            String un=username;
	            String pw=password;
	            protected PasswordAuthentication getPasswordAuthentication() {
	                return new PasswordAuthentication(un, pw);
	            }
	        });
	        session.setDebug(true); //for debug

	        Message mimeMessage = new MimeMessage(session);
	        mimeMessage.setFrom(new InternetAddress("dbswn4686@naver.com"));
	        mimeMessage.setRecipient(Message.RecipientType.TO, new InternetAddress(memId));
	        mimeMessage.setSubject(subject);
	        mimeMessage.setText(body);
	        Transport.send(mimeMessage);

	    }

	/**
	 * 임시비밀번호 생성 메서드
	 * @param length
	 * @return String
	 */
	public String randomPassword (int length) {
	    int index = 0;
	    char[] charSet = new char[] {
	            '0','1','2','3','4','5','6','7','8','9'
	            ,'A','B','C','D','E','F','G','H','I','J','K','L','M'
	            ,'N','O','P','Q','R','S','T','U','V','W','X','Y','Z'
	            ,'a','b','c','d','e','f','g','h','i','j','k','l','m'
	            ,'n','o','p','q','r','s','t','u','v','w','x','y','z'};

	    StringBuffer sb = new StringBuffer();
	    for (int i=0; i<length; i++) {
	        index =  (int) (charSet.length * Math.random());
	        sb.append(charSet[index]);
	    }
	    return sb.toString();
	}






}

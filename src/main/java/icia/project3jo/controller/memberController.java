package icia.project3jo.controller;

import java.net.URLEncoder;
import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import icia.project3jo.dto.favorite;
import icia.project3jo.dto.member;
import icia.project3jo.service.memberService;

@Controller
public class memberController {
	
	@Autowired
	private  memberService memberService;
	
	@Autowired
	private HttpSession session;
	
	@GetMapping(value = "/joinForm")
	public String joinPage() {
		System.out.println("/joinForm - get >> 회원가입페이지 이동");
		return "join"; // /WEB/views/MemberJoinForm.jsp
	}

	@GetMapping(value = "/mainForm")
	public String mainPage() {
		System.out.println("/mainForm - get >> 메인페이지 이동");
		return "redirect:/"; // /WEB/views/Main.jsp
	}

	@GetMapping(value = "/loginForm")
	public String loginPage() {
		System.out.println("/loginForm - get >> 로그인페이지 이동");
		return "login"; // /WEB/views/LoginForm.jsp
	}

	@GetMapping("/memberInfo")
	public String infoPage(Model model) {
		System.out.println("/memberInfo - get >> 내정보 페이지 이동 요청");
		// 1.회원정보를 조회
		// SELECT * FROM MEMBERS WHERE MEMBERID = 로그인된사용자아이디;
		// 1.session으로 부터 로그인 아이디 확인
		String loginId = (String) session.getAttribute("loginId");
		System.out.println("로그인 아이디 : " + loginId);
		if (loginId == null) {

			return "login";
		}
////		2. 회원정보 조회 기능 호출
		member memberInfo = memberService.findMemberInfo(loginId, null);
		System.out.println(memberInfo);
//		
//		//3.model에 회원정보를 저장
		model.addAttribute("minfo", memberInfo);
		
		
	 	ArrayList<favorite> favoriteList = memberService.isFavorite(loginId);
    	System.out.println(favoriteList);
    	model.addAttribute("favorite",favoriteList);
		
		
		
	
		
		//4.회원정보 페이지로 응답
		return "MyPage";
	}

	@PostMapping(value = "/joinForm")
	/* 페이지에서 입력한 회원정보 */
	public String memberJoin(member member) {
		System.out.println("/joinForm - post >> 회원가입 요청");
		// 1. 페이지에서 입력된 회원 정보 확인
		System.out.println("입력한 정보");

		System.out.println(member);

		try {
			memberService.registMember(member);
			return "redirect:/";
		} catch (Exception e) {
			// 가입 실패(MemberJoinForm페이지로 이동)
			e.printStackTrace();
			return "login";
		}

	}

	@PostMapping(value = "/loginForm")
	/* 페이지에서 입력한 회원정보 */
	public String memberLogin(String memberid, String memberpw, Model model) {
		System.out.println("/loginForm - post >> 로그인 요청");
		// 1.로그인을 위한 아이디, 비밀번호 확인
		System.out.println("입력한 정보");
		System.out.println("입력한 아이디 : " + memberid);
		System.out.println("입력한 비밀번호 : " + memberpw);
		// 2. 회원정보 조회
		member memberInfo = memberService.findMemberInfo(memberid, memberpw);

		// 3. 조회 결과에 따른 로그인처리와 응답
		if (memberInfo == null) {
			System.out.println("로그인 실패");
			model.addAttribute("msg", "아이디 또는 비밀번호가 일치하지 않습니다");
			return "login";
		} else {
			System.out.println("로그인 성공");
			// session을 활용한 로그인 처리
			session.setAttribute("loginId", memberInfo.getMemberid());
			return "redirect:/";
		}

	}

	// 로그아웃 기능
	@GetMapping(value = "/logout")
	public String memberLogout() {
		System.out.println("로그아웃");
		session.removeAttribute("loginId");// session loginId Attribute 삭제
//		session.setAttribute("loginId", null);
		return "redirect:/";
	}

	@GetMapping(value = "/memberLIst")
	public String memberList(Model model) {
		System.out.println("/memberLIst - get >> 회원목록 조회 이동");
		// 1.회원목록 조회 기능 호출
		ArrayList<member> memberList = memberService.findMemberList();
		// 2.조회된 데이터를 MODEL객체 저장
		System.out.println(memberList);
		model.addAttribute("mList",memberList);
		
		
		return "MemberList"; // 회원목록 출력 페이지
	}
	
	@PostMapping("/idCheck")
	@ResponseBody
	public String userIdCheck(String userId) {
		System.out.println("/idCheck - post >> 아이디 중복확인 요청");
		System.out.println("중복확인 할 아이디 : "+userId);
		
		String checkResult = memberService.memberIdCheck(userId);
		if(checkResult == null) {
			System.out.println("아이디 사용가능");
			return "Y";
		}else {
			System.out.println("아이디 중복");
			return "N";
			
		}
		
		
		
	}
	
	
	@GetMapping("/getMemberInfo")
	
	public String getMemberInfo(Model model) {
		System.out.println("/getMembrerInfi - get >> 내정보 조회요청");
		String loginId = (String) session.getAttribute("loginId");
		member memberInfo = memberService.findMemberInfo(loginId, null);
		model.addAttribute("info", memberInfo);
		return "MyPage";
		}
		
	@GetMapping("/addFavorite")
	public String addFavorite(String nx, String ny, String searchText, String date, String sido,String searchText1 ,Model model) {
		System.out.println("/addFavorite - get >> 즐겨찾기 추가 요청");
		System.out.println(sido);
		String beachURL = "/weather?nx="+nx+"&ny="+ny+"&searchText="+searchText+"&date="+date; 
		String loginId = (String) session.getAttribute("loginId");
		if (loginId == null) {
			return "login";
		}
		
		System.out.println(searchText1);
		try {
			memberService.addFavorite(loginId, searchText, beachURL);
			if(!searchText1.equals("zxc")) {
				return "redirect:/selectsido?searchDate="+URLEncoder.encode(date,"UTF-8")+"&searchText="+URLEncoder.encode(searchText1,"UTF-8");
			}else {
				
				return "redirect:/beachlist?sido="+URLEncoder.encode(sido,"UTF-8"); // 메인 페이지로 리다이렉트
			}
		} catch (Exception e) {
			e.printStackTrace();
			return "error"; // 에러 페이지로 이동
		}
	}

	@GetMapping("/removeFavorite")
	public String removeFavorite(String nx, String ny, String searchText, String date,String sido,String searchText1) {
		System.out.println("/removeFavorite - get >> 즐겨찾기 삭제 요청");
		System.out.println(sido);
		String loginId = (String) session.getAttribute("loginId");
		if (loginId == null) {
			return "login";
		}
		
		System.out.println(searchText1);
		try {
			memberService.removeFavorite(loginId, searchText);
			if(!searchText1.equals("zxc") ) {
				return "redirect:/selectsido?searchDate="+URLEncoder.encode(date,"UTF-8")+"&searchText="+URLEncoder.encode(searchText1,"UTF-8"); // 메인 페이지로 리다이렉트
			}else {
				
				return "redirect:/beachlist?sido="+URLEncoder.encode(sido,"UTF-8"); // 메인 페이지로 리다이렉트
			}
		} catch (Exception e) {
			e.printStackTrace();
			return "error"; // 에러 페이지로 이동
		}
	}

	}
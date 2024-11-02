package icia.project3jo.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import icia.project3jo.dao.memberdao;
import icia.project3jo.dto.favorite;
import icia.project3jo.dto.member;

@Service
public class memberService {
	/*회원가입 기능 메소드*/
	@Autowired
	private memberdao memberdao;
	
	
	public int registMember(member member) {
		System.out.println("MemberService - registMember 호출");
		return memberdao.insertMember(member);
//		DB - INSERT  
		
		
		
	}
	//회원 목록 조회 기능 메소드
	public ArrayList<member> findMemberList(){
		System.out.println("MemberService - findMemberList 호출");
		
		return memberdao.selectMemberList();
	}
	//회원 정보 조회 기능 메소드
	public member findMemberInfo(String memberid,String memberpw) {
		System.out.println("MemberService - findMemberInfo 호출");
				
		return memberdao.selectMemberInfo(memberid, memberpw);
	}
	
	public String memberIdCheck(String userId) {
		System.out.println("MemberService - memberIdCheck 호출");
		
		return memberdao.memberIdCheck(userId);
		
		
	}
	public void addFavorite(String memberid, String beachsta_nm, String beachURL) {
		System.out.println("서비스 addFavorite호출");
		memberdao.insertFavorite(memberid, beachsta_nm, beachURL);
	}

	public int removeFavorite(String memberid, String beachsta_nm) {
		System.out.println("서비스 removeFavorite 호출");
		System.out.println(memberid+","+beachsta_nm);
		
		return memberdao.deleteFavorite(memberid, beachsta_nm);
	}
	public ArrayList<favorite> isFavorite(String memberid) {
		System.out.println(" 서비스 즐겨찾기 목록 호출");
		return memberdao.isFavorite(memberid);
	}
}
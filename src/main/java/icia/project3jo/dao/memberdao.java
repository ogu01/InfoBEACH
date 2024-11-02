package icia.project3jo.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import icia.project3jo.dto.beach;
import icia.project3jo.dto.favorite;
import icia.project3jo.dto.member;

public interface memberdao {
	//회원가입 - Members INSERT
		int insertMember(member member);
		
		ArrayList<member>selectMemberList();
		
		member selectMemberInfo(@Param("memberid") String memberid 
				,@Param("memberpw") String memberpw);
		
		String memberIdCheck(String userId);

		void insertFavorite(@Param("memberid") String memberId, @Param("beachname") String beachsta_nm, @Param("beachURL") String beachURL);
		
		int deleteFavorite(@Param("memberid") String memberId, @Param("beachname") String beachname);
	
		ArrayList<favorite> isFavorite(@Param("memberid") String memberId);
		
		
		int insertbeach(beach beach);
		ArrayList<beach> selectsido(String searchText);
		
		
		
}

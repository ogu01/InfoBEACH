package icia.project3jo.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.Locale;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import icia.project3jo.dto.beach;
import icia.project3jo.dto.favorite;
import icia.project3jo.dto.naver;
import icia.project3jo.dto.weather;
import icia.project3jo.service.beachService;
import icia.project3jo.service.memberService;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	@Autowired 
	private beachService beachservice;
	
	@Autowired
	private memberService memberService;
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		Date today = new Date();
		SimpleDateFormat sd = new SimpleDateFormat("yyyyMMdd");
		String date = sd.format(today);
		
		Calendar calendar = Calendar.getInstance();
        calendar.setTime(today);
        calendar.add(Calendar.DATE, 1); // 다음 날짜로 이동

        // 다음 날짜를 SimpleDateFormat을 이용하여 포맷팅하여 출력
        Date nextDay = calendar.getTime();
        String nextDay1 = sd.format(nextDay);
        calendar.setTime(today);
        calendar.add(Calendar.DATE, 2); // 다음 날짜로 이동

        // 다음 날짜를 SimpleDateFormat을 이용하여 포맷팅하여 출력
        Date nexDay = calendar.getTime();
        String nextDay2 = sd.format(nexDay);
        
		model.addAttribute("today",date);
		model.addAttribute("nextDay1",nextDay1);
		model.addAttribute("nextDay2",nextDay2);
		
		return "main";
	}
	
	@GetMapping("/login")
	public String login() {
		return "login";
	}
	@GetMapping("/join")
	public String join() {
		return "join";
	}
	
	@GetMapping("/weather")
	public String weather( String nx, String ny, Model model, String searchText,String date) {
		System.out.println("/weather - 날씨조회");
		
		
		Date today = new Date();
		SimpleDateFormat sd = new SimpleDateFormat("yyyyMMdd");
		String date1 = sd.format(today);
		
		Calendar calendar = Calendar.getInstance();
        calendar.setTime(today);
        calendar.add(Calendar.DATE, 1); // 다음 날짜로 이동
        // 다음 날짜를 SimpleDateFormat을 이용하여 포맷팅하여 출력
        Date nextDay = calendar.getTime();
        String nextDay1 = sd.format(nextDay);
        
        calendar.setTime(today);
        calendar.add(Calendar.DATE, 2); // 다음 날짜로 이동

        // 다음 날짜를 SimpleDateFormat을 이용하여 포맷팅하여 출력
        Date nexDay = calendar.getTime();
        String nextDay2 = sd.format(nexDay);
		System.out.println(nx);
		System.out.println(ny);
		System.out.println(searchText);
		System.out.println("date : " + date);
		
		
		
		
		
		
		
		nx=nx.split("\\.")[0];
		ny=ny.split("\\.")[0];
		System.out.println("nx : " + nx);
		System.out.println("ny : " + ny);
		
		/* service - 좌표기반 정류소 목록 조회 기능 호출*/
		try {
			ArrayList<weather>weatherList=beachservice.beachWeather(date1,nx,ny);
			ArrayList<naver>SearchBeach = beachservice.SearchBeach(searchText);
			
			model.addAttribute("SearchBeach", SearchBeach);
			model.addAttribute("date",date);
			model.addAttribute("searchText",searchText);
			model.addAttribute("weatherList",weatherList);
			
			
			model.addAttribute("today",date1);
			model.addAttribute("nextDay1",nextDay1);
			model.addAttribute("nextDay2",nextDay2);
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			
		}
		return "detailbeach";
	}
	@Autowired
	HttpSession session;
	@GetMapping("/beachlist")
	
	public String beachlist(String sido, Model model){
		System.out.println("Controller - beachlist 실행");
		try {
			
			ArrayList<beach>beach = beachservice.findBeach(sido);
			int beachnum=beach.size();
			model.addAttribute("beachnum",beachnum);
			model.addAttribute("beach",beach);
			Date today = new Date();
			SimpleDateFormat sd = new SimpleDateFormat("yyyyMMdd");
			String date = sd.format(today);
			System.out.println("date : " + date);
			Calendar calendar = Calendar.getInstance();
	        calendar.setTime(today);
	        calendar.add(Calendar.DATE, 1); // 다음 날짜로 이동
	        String loginId = (String) session.getAttribute("loginId");
	      
	        // 다음 날짜를 SimpleDateFormat을 이용하여 포맷팅하여 출력
	        Date nextDay = calendar.getTime();
	        String nextDay1 = sd.format(nextDay);
	        
	        calendar.setTime(today);
	        calendar.add(Calendar.DATE, 2); // 다음 날짜로 이동

	        // 다음 날짜를 SimpleDateFormat을 이용하여 포맷팅하여 출력
	        Date nexDay = calendar.getTime();
	        String nextDay2 = sd.format(nexDay);
	        if(loginId != null) {
	        	
	        	  ArrayList<favorite> favoriteList = memberService.isFavorite(loginId);
	  			System.out.println(favoriteList);
	  	        model.addAttribute("favorite",favoriteList);
	        }
	        
		model.addAttribute("today",date);
				model.addAttribute("nextDay1",nextDay1);
				model.addAttribute("nextDay2",nextDay2);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "beachlist";
	}
	@GetMapping("/insertBeach")
	public String insertBeach() {
		 beachservice.ApiToDbBeach();
		return "redirect:/";
		
	}
	
	 @GetMapping("/selectsido") public String selectsido(String searchText,String searchDate,Model model) { 
		 ArrayList<beach>beachll = beachservice.selectsido(searchText);
	  model.addAttribute("beach", beachll);
	  int count = beachll.size();
	  model.addAttribute("sbeachnum", count);
	
		System.out.println("date : " + searchDate);
		
		model.addAttribute("date",searchDate);
      
      String loginId = (String) session.getAttribute("loginId");
    
      
      
      

      
      
		  if(loginId != null) {
		      	
	    	  ArrayList<favorite> favoriteList = memberService.isFavorite(loginId);
				System.out.println(favoriteList);
		        model.addAttribute("favorite",favoriteList);
	    }
	  return "sbeachlist";
	  
	  }

	

	
}
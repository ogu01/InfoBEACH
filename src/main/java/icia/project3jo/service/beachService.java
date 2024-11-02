package icia.project3jo.service;



import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.ArrayList;

import org.apache.hc.client5.http.impl.classic.CloseableHttpClient;
import org.apache.hc.client5.http.impl.classic.HttpClients;
import org.apache.hc.core5.http.ClassicHttpRequest;
import org.apache.hc.core5.http.HttpEntity;
import org.apache.hc.core5.http.io.entity.EntityUtils;
import org.apache.hc.core5.http.io.support.ClassicRequestBuilder;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

import icia.project3jo.dao.memberdao;
import icia.project3jo.dto.beach;
import icia.project3jo.dto.naver;
import icia.project3jo.dto.weather;



@Service
public class beachService {
	String APIKEY = "uKUTlevoYeGaFdHxFBKkbRsf7748MMtgbJ4VfvKL4oCqDgTdyLh5vq1Vsudk9OKl4lfMsCkFCJY9PiQxHmIqvA%3D%3D";
	public ArrayList<beach> findBeach(String sido)  {
		try (CloseableHttpClient httpclient = HttpClients.createDefault()) {
//			Request 생성	
		    ClassicHttpRequest httpGet = ClassicRequestBuilder.get("http://apis.data.go.kr/1192000/service/OceansBeachInfoService1/getOceansBeachInfo1")
		    		.addParameter("serviceKey","uKUTlevoYeGaFdHxFBKkbRsf7748MMtgbJ4VfvKL4oCqDgTdyLh5vq1Vsudk9OKl4lfMsCkFCJY9PiQxHmIqvA==")
		    		.addParameter("pageNo", "1")
		    		.addParameter("numOfRows", "10")
		    		.addParameter("SIDO_NM", sido)
		    		.addParameter("resultType", "json")
		            .build();
		    
//		    RESPONSE
		    String responseBody = httpclient.execute(httpGet, response -> {
		        System.out.println(response.getCode() + " " + response.getReasonPhrase());
		        
		        final HttpEntity entity1 = response.getEntity();
		        String responseData = EntityUtils.toString(entity1, "UTF-8");
		      
		      
		        EntityUtils.consume(entity1);
		        return responseData;
		        
		        
		    });
		    
		    System.out.println("응답 데이터 : "+ responseBody);
		    JsonObject response_Json = JsonParser.parseString(responseBody).getAsJsonObject();
		    JsonObject getOceansBeachInfo = response_Json.getAsJsonObject("getOceansBeachInfo");
		    JsonArray items = getOceansBeachInfo.getAsJsonArray("item");
		    System.out.println(items);

		    ArrayList<beach> beaches = new ArrayList<>();
		    Gson gson = new Gson();

		    for (JsonElement item : items) {
		        beach beach = gson.fromJson(item, beach.class);
		        beaches.add(beach);
		    }
		    System.out.println(beaches);
		    return beaches;

			

		} catch (IOException e) {
			e.printStackTrace();
		}
//		private String siodoNm; //시도
//		private String gugunNm; //군구
//		private String staNm; //이름
//		private String linkTel; //전번
//		private String linkAddr; //url
//		private String lat; // 위도
//		private String lon;	// 경도
		return null;
	
		
		
		
	}
	  
	  
	  public ArrayList<weather>beachWeather(String date, String nx, String ny) throws Exception {
	        StringBuilder urlBuilder = new StringBuilder("http://apis.data.go.kr/1360000/VilageFcstInfoService_2.0/getVilageFcst"); /*URL*/
	        urlBuilder.append("?" + URLEncoder.encode("serviceKey","UTF-8") + "=" + APIKEY); /*Service Key*/
	        urlBuilder.append("&" + URLEncoder.encode("pageNo","UTF-8") + "=" + URLEncoder.encode("1", "UTF-8")); /*페이지번호*/
	        urlBuilder.append("&" + URLEncoder.encode("numOfRows","UTF-8") + "=" + URLEncoder.encode("1000", "UTF-8")); /*한 페이지 결과 수*/
	        urlBuilder.append("&" + URLEncoder.encode("dataType","UTF-8") + "=" + URLEncoder.encode("json", "UTF-8")); /*요청자료형식(XML/JSON) Default: XML*/
	        urlBuilder.append("&" + URLEncoder.encode("base_date","UTF-8") + "=" + URLEncoder.encode(date, "UTF-8")); /*‘21년 6월 28일발표*/
	        urlBuilder.append("&" + URLEncoder.encode("base_time","UTF-8") + "=" + URLEncoder.encode("0500", "UTF-8")); /*05시 발표*/
	        urlBuilder.append("&" + URLEncoder.encode("nx","UTF-8") + "=" + URLEncoder.encode(nx, "UTF-8")); /*예보지점의 X 좌표값*/
	        urlBuilder.append("&" + URLEncoder.encode("ny","UTF-8") + "=" + URLEncoder.encode(ny, "UTF-8")); /*예보지점의 Y 좌표값*/
	        URL url = new URL(urlBuilder.toString());
	        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
	        conn.setRequestMethod("GET");
	        conn.setRequestProperty("Content-type", "application/json");
	        System.out.println("Response code: " + conn.getResponseCode());
	        BufferedReader rd;
	        if(conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
	            rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
	        } else {
	            rd = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
	        }
	        StringBuilder sb = new StringBuilder();
	        String line;
	        while ((line = rd.readLine()) != null) {
	            sb.append(line);
	        }
	        rd.close();
	        conn.disconnect();
	        System.out.println(sb.toString());
	        System.out.println(sb.toString());
	        JsonObject response_Json = JsonParser.parseString(sb.toString()).getAsJsonObject();

			JsonObject items_value = response_Json.get("response").getAsJsonObject().get("body").getAsJsonObject()
					.get("items").getAsJsonObject();
			System.out.println(items_value);

			// 응답 데이터를 JSON 으로 변환
			System.out.println(items_value.get("item").isJsonArray());
			JsonArray itemArr = items_value.get("item").getAsJsonArray();

			ArrayList<weather> weatherList = new ArrayList<>();
			for (JsonElement item : itemArr) {
				Gson gson = new Gson();
				// 버스도착정보를 정보JSON 을 버스도착정보 클래스로 변환
				weather weather = gson.fromJson(item, weather.class);
				
				weatherList.add(weather);
			}
			return weatherList;
	    }
	  public ArrayList<naver> SearchBeach(String searchText) throws Exception {
		  ArrayList<naver> naverList = new ArrayList<>();
		try (CloseableHttpClient httpclient = HttpClients.createDefault()) {
			/* Request 생성 */
		    ClassicHttpRequest httpGet = ClassicRequestBuilder.get("https://openapi.naver.com/v1/search/local.json")
		                                 .addParameter("query", searchText+"주변 맛집")
		                                 .addParameter("display", "5")
		    							 .build();
		    /* HEADER*/
		    httpGet.setHeader("X-Naver-Client-Id", "89ZJABRhirprCOf7rnim");
		    httpGet.setHeader("X-Naver-Client-Secret", "UzJX3FProq");
		    
		    /* RESPONSE */
		    String responseBody = httpclient.execute(httpGet, response -> {
		        System.out.println(response.getCode() + " " + response.getReasonPhrase());
		        final HttpEntity entity1 = response.getEntity();
		        String responseData =  EntityUtils.toString(entity1, "UTF-8");
		        EntityUtils.consume(entity1);
		        return responseData;
		    });
		    
		    System.out.println("응답 데이터 : " + responseBody);
		    JsonArray items = JsonParser.parseString(responseBody).getAsJsonObject()
		    		                    .get("items").getAsJsonArray();
		    for(JsonElement item : items) {
		    	naver nv = new Gson().fromJson(item, naver.class);
		    	naverList.add(nv);
		    }
		    
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		return naverList;
	  
}
	  
	  @Autowired
	  private memberdao memdao;

	public void ApiToDbBeach() {
		String[] sidoList = { "부산","울산","제주","경남","경북","전북","전남","충남","강원","인천" };
		ArrayList<beach> searchBeachList = new ArrayList<>();
		for(String sido : sidoList) {
			searchBeachList.addAll( findBeach(sido)  );
			
		}
		System.out.println(searchBeachList.get(0) );
		
		 for(int i=0; i<searchBeachList.size();i++) {
			 beach beach = searchBeachList.get(i);
			 memdao.insertbeach(beach); 
		 }
		// dao 
//		for(beach beach : searchBeachList) {
//			INSERT INTO BEACH(sido, gugun)
//		    VALUES( #{sido_nm},#{gugun_nm} )
//			dao.insert(beach);
//			
//		}
	
	}
	
	

	public ArrayList<beach> selectsido(String searchText) {
		return memdao.selectsido(searchText);
		
	
	}
	  
	  
	  
}
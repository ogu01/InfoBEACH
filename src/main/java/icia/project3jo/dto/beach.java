package icia.project3jo.dto;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class beach {
	private String sido_nm; //시도
	private String gugun_nm; //군구
	private String sta_nm; //이름
	private String link_tel; //전번
	private String link_addr; //url
	private String lat; // 위도
	private String lon;	// 경도
}
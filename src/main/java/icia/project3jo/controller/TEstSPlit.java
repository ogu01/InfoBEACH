package icia.project3jo.controller;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;

public class TEstSPlit {

	public static void main(String[] args) throws UnsupportedEncodingException {
		
		
		String aa = "35.0459570000";
		System.out.println(aa.split("\\.").length);
		System.out.println(aa.split("\\.")[0]);
		System.out.println(aa.split("\\.")[1]);
		
		String bb = "35_0459570000";
		System.out.println(bb.split("_").length);
		System.out.println(bb.split("_")[0]);
		System.out.println(bb.split("_")[1]);

	}

}

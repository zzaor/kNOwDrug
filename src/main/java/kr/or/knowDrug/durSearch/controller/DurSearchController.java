package kr.or.knowDrug.durSearch.controller;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.json.XML;
import org.json.simple.parser.ParseException;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;

import kr.or.knowDrug.durSearch.service.DurSearchService;

import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;


@Controller
public class DurSearchController {

	@Resource(name="durSearchService")
	private DurSearchService durSearchService;

	//사용자 - 의약품안전관리서비스(DUR)
	@RequestMapping(value="/dur.do")
	public String dur() {
		return "/member/dur";
	}

	//사용자 - 성분정보
	@RequestMapping(value="/ingredients_info.do")
	public String ingredients_info() {
		return "/drug_identify/ingredients_info";
	}

	//사용자 - 제품별 복약정보
	@RequestMapping(value="/drug_info.do")
	public String drug_info() {
		return "/member/drug_info";
	}

	//사용자 - 의약품 식별 검색 페이지
	@RequestMapping(value="/drug_identify.do")
	public String mdcinIdntfc() {
		return "/drug_identify/drug_identify";
	}

	//사용자 - 의약품 상세 검색 페이지
	@RequestMapping(value="/medi_search.do")
	public String medi_search() {
		return "/drug_identify/medi_search";
	}

	//사용자 - 의약품 상세 정보 페이지
	@RequestMapping(value="/medi_detail.do")
	public String medi_detail() {
		return "/drug_identify/medi_detail";
	}

	//약국찾기
	@RequestMapping(value="/find_pharmacy.do")
	public String findPharmacy() {
		return "/member/find_pharmacy";
	}


	/**
	 * DUR 검색 api
	 * @author 길정우
	 * @param map
	 * @param req
	 * @return "dur"
	 * @throws Exception
	*/
	@ResponseBody
	@RequestMapping(value="/durSearch.do")
	public ModelAndView durSearch(@RequestParam Map<String, Object> map, HttpSession session) throws Exception {
		System.out.println("durSearch!!!!");
		System.out.println(session.getAttribute("member"));
		System.out.println("map : " + map);


		String itemName = "";
		if(map.get("itemName") != null || map.get("itemName") != "") {
			itemName = map.get("itemName").toString();
		}

		System.out.println(itemName);

		String entpName = "";
		if(map.get("entpName") == null || map.get("entpName") == "") {
			entpName = "";
		}else {
			entpName = map.get("entpName").toString();
		}
		System.out.println(entpName);

		insertData(map, session);


		String apiUrl= "http://apis.data.go.kr/1470000/MdcinGrnIdntfcInfoService/getMdcinGrnIdntfcInfoList";
		String serviceKey = "o8e6zPlp2/ZfUlcCH+G9AMteWR4HaaSTdHB9sbpSavf6VKglDdyvn/Np+PhEmpnbTpKM+nBQCLBl+eZfFRQhGw=="; /*Service Key*/

		StringBuilder urlBuilder = new StringBuilder(apiUrl); /*URL*/
			urlBuilder.append("?" + URLEncoder.encode("ServiceKey","UTF-8")+ "=" + URLEncoder.encode(serviceKey,"UTF-8"));

			if(itemName != null || itemName!= "") {
			urlBuilder.append("&" + URLEncoder.encode("item_name","UTF-8") + "=" + URLEncoder.encode(itemName, "UTF-8")); /*품목명*/
			}

			if(entpName != null || entpName != "") {
				urlBuilder.append("&" + URLEncoder.encode("entp_name","UTF-8") + "=" + URLEncoder.encode(entpName, "UTF-8")); /*회사명*/
			}

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


	        //xml을 json으로
	        org.json.JSONObject xmlJsonObj = XML.toJSONObject(sb.toString());
	        String xmlJsonObjStr = xmlJsonObj.toString();
	        System.out.println("xmlJsonObjStr : " + xmlJsonObjStr);


	        ObjectMapper objectMapper = new ObjectMapper();
	        Map<String, Object> resMap = new HashMap<>();
	        map = objectMapper.readValue(xmlJsonObjStr, new TypeReference<Map<String, Object>>(){});
	        Map<String, Object> dataResponse = (Map<String, Object>) map.get("response");
	        Map<String, Object> body = (Map<String, Object>) dataResponse.get("body");
	        Map<String, Object> items = null;
	        List<Map<String, Object>> itemList = null;

	        items = (Map<String, Object>) body.get("items");
	        itemList = (List<Map<String, Object>>) items.get("item");
	        System.out.println(itemList);


	        ModelAndView mav = new ModelAndView("jsonView");
	        mav.addObject("data", itemList);


	        return mav;
	    }


		/**
		 * 성분검색 api
		 * @author 하윤주
		 * @param map
		 * @return mav
		 * @throws Exception
		*/
	   @ResponseBody
	   @RequestMapping(value="/ingreSearch.do")
	   public  ModelAndView ingredientSearch(@RequestParam Map<String, Object> map, HttpSession session) throws Exception {
	      System.out.println("map이다"+map);

	      String ingreName = map.get("ingreName").toString();
	      String durClassify = map.get("durClassify").toString();
	      System.out.println(ingreName);
	      System.out.println("durClassify이다"+durClassify);

	      insertData(map,session);

	      String apiUrl= "http://apis.data.go.kr/1470000/DURIrdntInfoService/getUsjntTabooInfoList";
	      String serviceKey = "Ry+5ON3HT98s2BL8PtWN+KQAlr9XzTx0kMLO8G5DwicGwsGvzkbGwfI2ods92BroIXHWFlJ5ZPtRaITVfTbsbg=="; /*Service Key*/

	      StringBuilder urlBuilder = new StringBuilder(apiUrl); /*URL*/
	        urlBuilder.append("?" + URLEncoder.encode("ServiceKey","UTF-8") + "=" + URLEncoder.encode(serviceKey, "UTF-8")); /*Service Key*/
	        urlBuilder.append("&" + URLEncoder.encode("ingrKorName","UTF-8") + "=" + URLEncoder.encode(ingreName, "UTF-8")); /*DUR성분*/

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


	      //xml을 json으로
	      org.json.JSONObject xmlJsonObj = XML.toJSONObject(sb.toString());
	      String xmlJsonObjStr = xmlJsonObj.toString();
	      System.out.println("xmlJsonObjStr : " + xmlJsonObjStr);


	      ObjectMapper objectMapper = new ObjectMapper();
	      Map<String, Object> resMap = new HashMap<>();
	      map = objectMapper.readValue(xmlJsonObjStr, new TypeReference<Map<String, Object>>(){});
	      Map<String, Object> dataResponse = (Map<String, Object>) map.get("response");
	      Map<String, Object> body = (Map<String, Object>) dataResponse.get("body");
	      Map<String, Object> items = null;
	      List<Map<String, Object>> itemList = null;

	      items = (Map<String, Object>) body.get("items");
	      itemList = (List<Map<String, Object>>) items.get("item");

	      ModelAndView mav  = new ModelAndView("jsonView");
	      mav.addObject("data", itemList);
	      System.out.println(mav);
	      return mav;

	   }


	   /**
		 * 복약정보 검색
		 * @author 이미라
		 * @param map
		 * @exception IOException
		 * @exception ParseException
		*/
	   @ResponseBody
	   @RequestMapping(value="/drugInfo.do")
	   public  ModelAndView drugInfo(@RequestParam Map<String, Object> map) throws IOException, ParseException {
		   System.out.println("drugInfo");

			String itemName = map.get("itemName").toString();

			String serviceKey = "FPAPQ2jOmwhfrBO0T234VGQkRN/rpKCQpjD0lSlJYQZK6vXdA0zLSTVepV9ziNhe84V+7mOp5Pu1EcJGSSibfw=="; /*Service Key*/


		   StringBuilder urlBuilder = new StringBuilder("http://apis.data.go.kr/1471000/DrbEasyDrugInfoService/getDrbEasyDrugList"); /*URL*/
		   	urlBuilder.append("?" + URLEncoder.encode("ServiceKey","UTF-8") + "=" + URLEncoder.encode(serviceKey, "UTF-8")); /*Service Key*/
	        urlBuilder.append("&" + URLEncoder.encode("itemName","UTF-8") + "=" + URLEncoder.encode(itemName, "UTF-8")); /*제품명*/


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

	        org.json.JSONObject xmlJsonObj = XML.toJSONObject(sb.toString());
	        String xmlJsonObjStr = xmlJsonObj.toString();
	        System.out.println("xmlJsonObjStr : " + xmlJsonObjStr);


	        ObjectMapper objectMapper = new ObjectMapper();
	        Map<String, Object> resMap = new HashMap<>();
	        map = objectMapper.readValue(xmlJsonObjStr, new TypeReference<Map<String, Object>>(){});
	        Map<String, Object> dataResponse = (Map<String, Object>) map.get("response");
	        Map<String, Object> body = (Map<String, Object>) dataResponse.get("body");
	        Map<String, Object> items = null;
	        List<Map<String, Object>> itemList = null;

	        items = (Map<String, Object>) body.get("items");
	        itemList = (List<Map<String, Object>>) items.get("item");

	        ModelAndView mav  = new ModelAndView("jsonView");
	        mav.addObject("data", itemList);
	        System.out.println(mav);
	        return mav;
	    }


	   /**
		 * DUR 전체 검색 (품목정보)
		 * @author 길정우
		 * @param
		 * @return
		 * @exception
		*/
	   @ResponseBody
	   @RequestMapping(value="/durTotalSearch.do")
	   public ModelAndView durTotalSearch(@RequestParam Map<String, Object> map)  throws IOException, ParseException {
		   

		   System.out.println("durTotalSearch");

		   System.out.println(map.get("itemName"));

		   String itemName = map.get("itemName").toString();

	       String apiUrl= "http://apis.data.go.kr/1470000/DURPrdlstInfoService/getUsjntTabooInfoList";
	       String serviceKey = "o8e6zPlp2/ZfUlcCH+G9AMteWR4HaaSTdHB9sbpSavf6VKglDdyvn/Np+PhEmpnbTpKM+nBQCLBl+eZfFRQhGw=="; /*Service Key*/

		   StringBuilder urlBuilder = new StringBuilder(apiUrl); /*URL*/
				urlBuilder.append("?" + URLEncoder.encode("ServiceKey","UTF-8")+ "=" + URLEncoder.encode(serviceKey,"UTF-8"));
		        urlBuilder.append("&" + URLEncoder.encode("itemName","UTF-8") + "=" + URLEncoder.encode(itemName, "UTF-8")); /*품목명*/

		        
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

	        org.json.JSONObject xmlJsonObj = XML.toJSONObject(sb.toString());
	        String xmlJsonObjStr = xmlJsonObj.toString();
	        System.out.println("xmlJsonObjStr : " + xmlJsonObjStr);


	        ObjectMapper objectMapper = new ObjectMapper();
	        Map<String, Object> resMap = new HashMap<>();
	        map = objectMapper.readValue(xmlJsonObjStr, new TypeReference<Map<String, Object>>(){});
	        Map<String, Object> dataResponse = (Map<String, Object>) map.get("response");
	        Map<String, Object> body = (Map<String, Object>) dataResponse.get("body");
	        System.out.println("body" + body);
	        System.out.println("body 아이템!!!" + body.get("items"));

	        Map<String, Object> items = (Map<String, Object>) body.get("items");
	        System.out.println("items" + items);


	        System.out.println("아이템 리스트 !!!!! " + items.get("item"));
	        List<Map<String, Object>> itemList = (List<Map<String, Object>>) items.get("item");

	        System.out.println("아이템 리스트~~~~~" + itemList);


	        ModelAndView mav  = new ModelAndView("jsonView");
	        mav.addObject("data", itemList);
	        System.out.println(mav);
	        return mav;

	   }


	   /**
		 * 의약품 검색어 인서트
		 * @author 길정우
		 * @param map
		 * @exception Exception
		*/
	   public void insertData(@RequestParam Map<String, Object> map, HttpSession session) throws Exception {
		   System.out.println("insertData");
		   System.out.println("map : " + map);
		   String memId = session.getAttribute("memId").toString();
		   map.put("memId", memId);

		   //제품명
		   if(map.get("itemName") == null || map.get("itemName") == "") {
			   map.put("itemName", "");
		   }
		   //약효분류
		   if(map.get("durClassify") == null || map.get("durClassify") == "") {
			   map.put("durClassify", "");
		   }

		   //성분명
		   if(map.get("ingreName") == null || map.get("ingreName") == "") {
			   map.put("ingreName", "");
		   }

		   //회사명
		   if(map.get("entpName") == null || map.get("entpName") == "") {
			   map.put("entpName", "");
		   }

		   //효능효과
		   if(map.get("efficacy") == null || map.get("efficacy") == "") {
			   map.put("efficacy", "");
		   }

		   //투여경로
		   if(map.get("route") == null || map.get("route") == "") {
			   map.put("route", "");
		   }

		   //제형
		   if(map.get("formName") == null || map.get("formName") == "") {
			   map.put("formName", "");
		   }

		   //식별문자
		   if(map.get("recognizeName") == null || map.get("recognizeName") == "") {
			   map.put("recognizeName", "");
		   }

		   //모양
		   if(map.get("durShape") == null || map.get("durShape") == "" || map.get("durShape") == "전체") {
			   map.put("durShape", "");
		   }

		   //색상
		   if(map.get("durColor") == null || map.get("durColor") == "" || map.get("durColor") == "전체") {
			   map.put("durColor", "");
		   }

		   //분할선
		   if(map.get("durLine")=="minus") {
			   map.put("durLine", "(-)형");
		   }
		   if(map.get("durLine")=="plus") {
			   map.put("durLine", "(+)형");
		   }
		   if(map.get("durLine") == null || map.get("durLine") == "" ||map.get("durLine") == "전체") {
			   map.put("durLine", "");
		   }


		   System.out.println("insertMap :" + map);
		   int res = durSearchService.insertData(map);
		   System.out.println("res : " + res);
	   }




	   /**
		 * 약국검색
		 * @author 길정우
		 * @param
		 * @return
		 * @exception
		*/
	   @ResponseBody
	   @RequestMapping(value="/pharmacySearch.do")
	   public ModelAndView pharmacySearch(@RequestParam Map<String, Object> map)  throws IOException, ParseException {

		   System.out.println("pharmacySearch");
		   System.out.println("map : " + map);
		   System.out.println(map.get("pharmacyName"));

		   String pharmacyName = map.get("pharmacyName").toString();

	        String apiUrl= "http://apis.data.go.kr/B551182/pharmacyInfoService/getParmacyBasisList";
			String serviceKey = "o8e6zPlp2/ZfUlcCH+G9AMteWR4HaaSTdHB9sbpSavf6VKglDdyvn/Np+PhEmpnbTpKM+nBQCLBl+eZfFRQhGw=="; /*Service Key*/

			 StringBuilder urlBuilder = new StringBuilder(apiUrl); /*URL*/
		        urlBuilder.append("?" + URLEncoder.encode("ServiceKey","UTF-8") +  "=" + URLEncoder.encode(serviceKey, "UTF-8")); /*Service Key*/
		        urlBuilder.append("&" + URLEncoder.encode("yadmNm","UTF-8") + "=" + URLEncoder.encode(pharmacyName, "UTF-8")); /*병원명*/

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

	        org.json.JSONObject xmlJsonObj = XML.toJSONObject(sb.toString());
	        String xmlJsonObjStr = xmlJsonObj.toString();
	        System.out.println("xmlJsonObjStr : " + xmlJsonObjStr);


	        ObjectMapper objectMapper = new ObjectMapper();
	        Map<String, Object> resMap = new HashMap<>();
	        map = objectMapper.readValue(xmlJsonObjStr, new TypeReference<Map<String, Object>>(){});
	        Map<String, Object> dataResponse = (Map<String, Object>) map.get("response");
	        Map<String, Object> body = (Map<String, Object>) dataResponse.get("body");
	        System.out.println("body" + body);
	        System.out.println("body 아이템!!!" + body.get("items"));

	        Map<String, Object> items = (Map<String, Object>) body.get("items");
	        System.out.println("items" + items);


	        System.out.println("아이템 리스트 !!!!! " + items.get("item"));
	        List<Map<String, Object>> itemList = (List<Map<String, Object>>) items.get("item");

	        System.out.println("아이템 리스트~~~~~" + itemList);


	        ModelAndView mav  = new ModelAndView("jsonView");
	        mav.addObject("data", itemList);
	        System.out.println(mav);
	        return mav;

	   }





}

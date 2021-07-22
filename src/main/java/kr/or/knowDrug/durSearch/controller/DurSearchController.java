package kr.or.knowDrug.durSearch.controller;


import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.json.XML;
import org.json.simple.parser.ParseException;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;

import kr.or.knowDrug.durSearch.service.DurSearchPage;
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
import java.io.InputStreamReader;


@Controller
public class DurSearchController {

	private String serviceKey  = "o8e6zPlp2/ZfUlcCH+G9AMteWR4HaaSTdHB9sbpSavf6VKglDdyvn/Np+PhEmpnbTpKM+nBQCLBl+eZfFRQhGw=="; /*Service Key*/
	private int size = 9;

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
	 * 검색어 그래프
	 * @author 길정우
	 * @param
	 * @return
	 * @throws Exception
	*/
	@RequestMapping(value="/graph.do", method=RequestMethod.GET)
	public String graph(@RequestParam Map<String,Object> map, Model model) throws Exception {
		System.out.println("검색어");
		int total = durSearchService.selectCount();

		String strPageNum = map.get("pageNum")==null?"1":map.get("pageNum").toString();
		int pageNum = Integer.parseInt(strPageNum);
		map.put("pageNum", pageNum);

		List<Map<String,Object>> graphData = durSearchService.selectGraph(map);

		System.out.println("graphData : " + graphData);

		model.addAttribute("dataList", new DurSearchPage(total, pageNum, size, graphData));
		return "/admin/graph";
	}


	/**
	 * 검색어 그래프 상세
	 * @author 길정우
	 * @param
	 * @return
	 * @exception
	*/
	@RequestMapping(value="/graphDetail.do", method=RequestMethod.GET)
	public String graphDetail() {

		return "/admin/graphDetail";
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
	public ModelAndView durSearch(@RequestParam Map<String, Object> paramMap, HttpSession session, Model model) throws Exception {
		System.out.println("durSearch!!!!");
		System.out.println("map : " + paramMap);

		ModelAndView mav = new ModelAndView("jsonView");

		String apiUrl= "http://apis.data.go.kr/1470000/MdcinGrnIdntfcInfoService/getMdcinGrnIdntfcInfoList";

		List<Map<String,Object>> itemList = connectAPI(apiUrl, serviceKey, paramMap);

		for (Map<String, Object> item : itemList) {
			 item.put("memId", session.getAttribute("memId"));
			 durSearchService.mergeData(item);
		}

        List<Map<String,Object>> dataList = durSearchService.selectData(paramMap);
        System.out.println("dataList : " + dataList);
        mav.addObject("data",dataList);

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

	      String apiUrl= "http://apis.data.go.kr/1470000/DURIrdntInfoService/getUsjntTabooInfoList";

	      List<Map<String,Object>> dataList = connectAPI(apiUrl, serviceKey, map);

	      ModelAndView mav  = new ModelAndView("jsonView");
	      mav.addObject("data", dataList);
	      System.out.println(mav);
	      return mav;

	   }


	   /**
		 * 복약정보 검색
		 * @author 이미라
		 * @param map
		 * @throws Exception
		*/
	   @ResponseBody
	   @RequestMapping(value="/drugInfo.do")
	   public  ModelAndView drugInfo(@RequestParam Map<String, Object> map) throws Exception {
		   System.out.println("drugInfo");

		   String apiUrl = "http://apis.data.go.kr/1471000/DrbEasyDrugInfoService/getDrbEasyDrugList";

		   List<Map<String,Object>> dataList = connectAPI(apiUrl, serviceKey, map);

	       ModelAndView mav  = new ModelAndView("jsonView");
	       mav.addObject("data", dataList);
	       System.out.println(mav);
	       return mav;
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
	   public ModelAndView pharmacySearch(@RequestParam Map<String, Object> map)  throws Exception {

		   System.out.println("pharmacySearch");
		   System.out.println("map : " + map);
		   System.out.println(map.get("pharmacyName"));


		   String apiUrl= "http://apis.data.go.kr/B551182/pharmacyInfoService/getParmacyBasisList";


	        List<Map<String, Object>> dataList = connectAPI(apiUrl, serviceKey, map);

	        ModelAndView mav  = new ModelAndView("jsonView");
	        mav.addObject("data", dataList);
	        System.out.println(mav);
	        return mav;

	   }



		/**
		 * API 연결 메서드
		 * @author 길정우
		 * @param
		 * @return
		 * @exception
		*/
		public List<Map<String, Object>> connectAPI(String apiUrl, String serviceKey, Map<String, Object> map) throws Exception {
			System.out.println("connectAPI");
			System.out.println(map);

			String itemName = "";
			if(map.get("itemName") == null || map.get("itemName") == "") {
				itemName = "";
			}else {
				itemName = map.get("itemName").toString();
			}

			System.out.println(itemName);

			String entpName = "";
			if(map.get("entpName") == null || map.get("entpName") == "") {
				entpName = "";
			}else {
				entpName = map.get("entpName").toString();
			}


			String ingreName = "";
			if(map.get("ingreName") == null || map.get("ingreName") == "") {
				ingreName = "";
			}else {
				ingreName = map.get("ingreName").toString();
			}

		   String pharmacyName = "";
		   if(map.get("pharmacyName") == null || map.get("pharmacyName") == "") {
			   pharmacyName = "";
		   }else {
			   pharmacyName = map.get("pharmacyName").toString();
		   }

		   System.out.println("ingreName :" + ingreName);
			StringBuilder urlBuilder = new StringBuilder(apiUrl); /*URL*/
			urlBuilder.append("?" + URLEncoder.encode("ServiceKey","UTF-8")+ "=" + URLEncoder.encode(serviceKey,"UTF-8"));
			urlBuilder.append("&" + URLEncoder.encode("pageNo","UTF-8") + "=1");
			urlBuilder.append("&" + URLEncoder.encode("numOfRows","UTF-8") + "=100");

			if(itemName != null || itemName!= "") {
				urlBuilder.append("&" + URLEncoder.encode("item_name","UTF-8") + "=" + URLEncoder.encode(itemName, "UTF-8")); /*품목명*/
			}

			if(entpName != null || entpName != "") {
				urlBuilder.append("&" + URLEncoder.encode("entp_name","UTF-8") + "=" + URLEncoder.encode(entpName, "UTF-8")); /*회사명*/
			}

			if(ingreName != null || ingreName != "") {
				urlBuilder.append("&" + URLEncoder.encode("ingrKorName","UTF-8") + "=" + URLEncoder.encode(ingreName, "UTF-8")); /*회사명*/
			}

			if(pharmacyName != null || pharmacyName != "") {
				urlBuilder.append("&" + URLEncoder.encode("yadmNm","UTF-8") + "=" + URLEncoder.encode(pharmacyName, "UTF-8")); /*병원명*/
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
	        System.out.println(sb.toString());


	        //xml을 json으로
	        org.json.JSONObject xmlJsonObj = XML.toJSONObject(sb.toString());
	        String xmlJsonObjStr = xmlJsonObj.toString();
	        System.out.println("xmlJsonObjStr : " + xmlJsonObjStr);


	        ObjectMapper objectMapper = new ObjectMapper();
	        Map<String, Object> resMap = new HashMap<>();
	        resMap = objectMapper.readValue(xmlJsonObjStr, new TypeReference<Map<String, Object>>(){});
	        Map<String, Object> dataResponse = (Map<String, Object>) resMap.get("response");
	        Map<String, Object> body = (Map<String, Object>) dataResponse.get("body");
	        Map<String, Object> items = null;
	        List<Map<String, Object>> itemList = null;

	        items = (Map<String, Object>) body.get("items");

	        itemList = (List<Map<String, Object>>) items.get("item");
	        System.out.println("itemList : " + itemList);
	        return itemList;

		}







}

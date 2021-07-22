package kr.or.knowDrug.academicInfo.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import kr.or.knowDrug.academicInfo.service.AcademicInfoPage;
import kr.or.knowDrug.academicInfo.service.AcademicInfoService;
import kr.or.knowDrug.academicInfo.vo.AcademicInfoVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class AcademicInfoController {

	@Resource(name = "academicInfoService")
	private AcademicInfoService academicInfoService;

	private int size = 9;

	/**
	 * 학술정보 리스트
	 * @author 길정우
	 * @param
	 * @return
	 * @exception
	*/
	@RequestMapping(value="/academic_info.do")
	public String academic_info(@RequestParam Map<String,Object> map, Model model) throws Exception {
		System.out.println("학술관리 리스트 " + map);

		int total = academicInfoService.selectCount();

		String strPageNum = map.get("pageNum")==null?"1":map.get("pageNum").toString();

		int pageNum = Integer.parseInt(strPageNum);
		map.put("pageNum", pageNum);

		List<AcademicInfoVO> academicList = academicInfoService.selectInfoList(map);

		System.out.println("학술정보 : "+ academicList);
		model.addAttribute("academicList", new AcademicInfoPage(total, pageNum, size, academicList));
		return "/member/academic_info";
	}

	/**
	 * 학술정보 상세페이지
	 * @author 길정우
	 * @param
	 * @return
	 * @throws Exception
	*/
	@RequestMapping(value="/academic_info_detail.do")
	public String academic_info_detail(@RequestParam Map<String, Object> map, Model model) throws Exception {
		System.out.println("학술관리 상세다~~~");
		List<?> info =  academicInfoService.selectInfo(map);
		int hit = academicInfoService.addHit(map);
		System.out.println("조회수 증가 :" + hit);
		System.out.println("학술관리 상세 : " + info);
		model.addAttribute("info", info);
		return "/admin/academic_info_detail";
	}



	/**
	 * 학술정보 등록 창 열기
	 * @author 길정우
	 * @param
	 * @return
	 * @exception
	*/
	@RequestMapping(value="/academic_info_write.do", method=RequestMethod.GET)
	public String academic_info_write() {
		return "/admin/academic_info_write";
	}


	/**
	 * 학술정보 등록
	 * @author 길정우
	 * @param
	 * @return
	 * @exception
	*/
	@RequestMapping(value="/academic_info_write.do", method=RequestMethod.POST)
	public String academic_info_write_post(@RequestParam Map<String, Object> map,MultipartFile[] attachFile) throws Exception {
		System.out.println("학술정보 등록");
		System.out.println("map : " + map);
		System.out.println("attachFile : " + attachFile);

		academicInfoService.writeInfo(map);

		String uploadFolder = "C:\\eGovFrame-3.9.0\\workspace.edu\\kNOwDrug\\src\\main\\webapp\\resources\\assets\\img\\upload\\academicInfo\\";

		Map<String, Object> fileMap = new HashMap<>();
		File saveFile = null;
		for(MultipartFile multipartFile : attachFile) {
			log.info("-------------------");
			log.info("Upload File Name : " + multipartFile.getOriginalFilename());
			log.info("Upload File Size : " + multipartFile.getSize());

			saveFile = new File(uploadFolder, multipartFile.getOriginalFilename());
			if(saveFile != null) {
				fileMap.put("attachFile", multipartFile.getOriginalFilename());
				fileMap.put("attachPath", uploadFolder);
			 }

			String academicSeq = academicInfoService.selectSeq();
			fileMap.put("academicSeq", academicSeq);
			academicInfoService.writeFile(fileMap);
			try {
				multipartFile.transferTo(saveFile);
			}catch(Exception e) {
				log.error(e.getMessage());
			}//end catch
		}//end for

		return  "redirect:/academic_info.do";
	}


	/**
	 * 학술정보 수정 창 열기
	 * @author 길정우
	 * @param
	 * @return
	 * @throws Exception
	*/
	@RequestMapping(value="/academic_info_modi.do", method=RequestMethod.GET)
	public String academic_info_modi(@RequestParam Map<String, Object> map , Model model) throws Exception {
		List<?> info =  academicInfoService.selectInfo(map);
		model.addAttribute("info", info);

		return "/admin/academic_info_modi";
	}


	/**
	 * 학술정보 수정
	 * @author 길정우
	 * @param
	 * @return
	 * @exception
	*/
	@RequestMapping(value="/academic_info_modi.do", method=RequestMethod.POST)
	public String academic_info_modiPost(@RequestParam Map<String, Object> map , MultipartFile[] attachFile) throws Exception {
		System.out.println("학술정보수정");
		System.out.println("map : " + map);
		System.out.println("attachFile : " + attachFile);

		String academicSeq = map.get("academicSeq").toString();

		academicInfoService.modiInfo(map);

		String uploadFolder = "C:\\eGovFrame-3.9.0\\workspace.edu\\kNOwDrug\\src\\main\\webapp\\resources\\assets\\img\\upload\\academicInfo\\";

		Map<String, Object> fileMap = new HashMap<>();
		File saveFile = null;
		for(MultipartFile multipartFile : attachFile) {
			log.info("-------------------");
			log.info("Upload File Name : " + multipartFile.getOriginalFilename());
			log.info("Upload File Size : " + multipartFile.getSize());

			saveFile = new File(uploadFolder, multipartFile.getOriginalFilename());
			if(saveFile != null) {
				fileMap.put("attachFile", multipartFile.getOriginalFilename());
				fileMap.put("attachPath", uploadFolder);
			 }

			fileMap.put("academicSeq", academicSeq);

			academicInfoService.writeFile(fileMap);
			try {
				multipartFile.transferTo(saveFile);
			}catch(Exception e) {
				log.error(e.getMessage());
			}//end catch
		}//end for

		return "redirect:/academic_info_detail.do?academicSeq="+map.get("academicSeq");
	}


	/**
	 * 학술정보 파일 삭제
	 * @author 길정우
	 * @param
	 * @return
	 * @exception
	*/
	@ResponseBody
	@RequestMapping(value="/academic_file_del.do")
	public ModelAndView academic_file_del(@RequestParam Map<String, Object> map) throws Exception {
		System.out.println("파일삭제 map : " + map);

		academicInfoService.deleteFile(map);

		String msg = "";
		msg = "fileDelete";

		String deleteInfo = map.get("deleteInfo").toString();
		System.out.println("deleteInfo : " + deleteInfo);

		if(deleteInfo.equals("Y") || deleteInfo == "Y") {
			//학술관리 삭제
			int res = academicInfoService.deleteInfo(map);
			System.out.println("학술관리 삭제 : " + res);
			msg = "infoDelete";
		}

		ModelAndView mav = new ModelAndView("jsonView");
	    mav.addObject("data", msg);

		return mav;
	}


	/**
	 * 학술정보 삭제
	 * @author 길정우
	 * @param
	 * @return
	 * @throws Exception
	*/
	@ResponseBody
	@RequestMapping(value="/academic_info_del.do")
	public ModelAndView academic_info_del(@RequestParam Map<String, Object> map) throws Exception {
		System.out.println("학술관리 삭제");
		System.out.println(map);
		int res = academicInfoService.deleteInfo(map);
		System.out.println(res);


		ModelAndView mav = new ModelAndView("jsonView");
	    mav.addObject("data", res);

		return mav;
	}





}

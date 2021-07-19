package kr.or.knowDrug.notice.controller;

import java.io.File;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import kr.or.knowDrug.board.vo.BoardVO;
import kr.or.knowDrug.notice.service.NoticePage;
import kr.or.knowDrug.notice.service.NoticeService;
import kr.or.knowDrug.notice.vo.NoticeVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class NoticeController {
	@Resource(name = "noticeService")
	private NoticeService noticeService;

	private int size = 10;

	   /**
	    * 공지사항 목록 조회
	    * @author
	    * @param
	    * @return "notice"
	    * @exception Exception
	    */
	@RequestMapping(value="/notice.do")
	public String notice(@RequestParam Map<String,Object> map, Model model) throws Exception{
		int total = noticeService.selectCount();

		String strPageNum = map.get("pageNum") == null? "1" : map.get("pageNum").toString();
		int pageNum = Integer.parseInt(strPageNum);
		map.put("pageNum", pageNum);

		List<NoticeVO> list = noticeService.selectNoticeList(map);
		model.addAttribute("list",new NoticePage(total, pageNum, size, list));
		model.addAttribute("selOpt", map.get("selOpt"));
	    model.addAttribute("keyword", map.get("keyword"));

		return "/member/notice";
	}



	/**
	 * 공지사항 등록 페이지 조회
	 * @author 길정우
	 * @param
	 * @return
	 * @exception
	*/
	@RequestMapping(value="/notice_write.do",method=RequestMethod.GET)
	public String notice_write(Model model) throws Exception {
		System.out.println("notice_write");

		return "/admin/notice_write";
	}



	/**
     * 공지사항 글 등록 및 파일 첨부
     * @author	하윤주
     * @param map, model, attachFile, session
     * @exception Exception
    */
    @RequestMapping(value="/notice_write.do", method=RequestMethod.POST)
    public String board_writeForm(@RequestParam Map<String, Object> map, Model model,MultipartFile[] attachFile ,HttpSession session) throws Exception {
    	String uploadFolder = "C:\\eGovFrame-3.9.0\\workspace.edu\\kNOwDrug\\src\\main\\webapp\\resources\\assets\\img\\upload\\notice\\";

    	File saveFile = null;
    	for(MultipartFile multipartFile : attachFile) {
    		log.info("-------------------");
    		log.info("Upload File Name : " + multipartFile.getOriginalFilename());
            log.info("Upload File Size : " + multipartFile.getSize());

	            saveFile = new File(uploadFolder, multipartFile.getOriginalFilename());
            if(saveFile != null) {
               map.put("attachFile", multipartFile.getOriginalFilename());
               map.put("attachPath", uploadFolder);
               System.out.println("saveFile이다"+saveFile);
            }
            System.out.println("map파일"+map);


            try {
               multipartFile.transferTo(saveFile);
            }catch(Exception e) {
               log.error(e.getMessage());
            }//end catch
         }//end for
	      String memId = (String) session.getAttribute("memId");
	      map.put("memId", memId);
	      noticeService.writeNotice(map);
	      return  "redirect:/notice.do";
	   }

    /**
     * 공지사항 상세조회
     * @author 하윤주
     * @param map, model, session
     * @exception Exception
    */
    @RequestMapping(value="/notice_detail.do")
    public String board_detail(@RequestParam Map<String, Object> map, Model model,HttpSession session) throws Exception {
       NoticeVO vo = noticeService.noticeDetail(map);

       int hit = noticeService.hit(map);

       model.addAttribute("detail", vo);

       return "/member/notice_detail";
    }


    /**
     * 공지사항 수정 폼 조회
     * @author 하윤주
     * @throws Exception
    */
   @RequestMapping(value="/notice_mod.do")
   public String boardMod(@RequestParam Map<String, Object> map, Model model,HttpSession session) throws Exception {

	   NoticeVO vo = noticeService.noticeDetail(map);

       model.addAttribute("detail", vo);

       return "/admin/notice_mod";
   }



   /**
    * 공지사항  글 수정
    * @author 하윤주
    * @param
    * @exception Exception
  */
  @RequestMapping(value="/notice_mod.do", method=RequestMethod.POST)
  public String boardModify(@RequestParam Map<String, Object> map, MultipartFile[] attachFile ,HttpSession session) throws Exception {
     String uploadFolder = "C:\\eGovFrame-3.9.0\\workspace.edu\\kNOwDrug\\src\\main\\webapp\\resources\\assets\\img\\upload\\notice\\";

     File saveFile = null;
     for(MultipartFile multipartFile : attachFile) {
        log.info("-------------------");
        log.info("Upload File Name : " + multipartFile.getOriginalFilename());
        log.info("Upload File Size : " + multipartFile.getSize());

        saveFile = new File(uploadFolder, multipartFile.getOriginalFilename());
        if(saveFile != null) {
           map.put("attachFile", multipartFile.getOriginalFilename());
           map.put("attachPath", uploadFolder);

        }

        try {
           multipartFile.transferTo(saveFile);
        }catch(Exception e) {
           log.error(e.getMessage());
        }//end catch
     }//end for

     String notiSeq = (String) map.get("notiSeq");

     int noticeModi = noticeService.noticeModify(map);

     return "redirect:/notice_detail.do?notiSeq="+notiSeq ;
  }


   /**
    * 파일 삭제 ajax
    * @author 하윤주
    * @param map , model
    * @exception Exception
   */
   @ResponseBody
   @RequestMapping(value="/deleteFile.do", method=RequestMethod.POST)
   public ModelAndView fileDel(@RequestParam Map<String, Object> map, Model model) throws Exception {
      int cnt = noticeService.fileDel(map);
      System.out.println("파일삭제결과"+ cnt);

      ModelAndView mav = new ModelAndView("jsonView");
       mav.addObject("data", cnt);

      return mav;
   }


   /**
    * 공지사항 글 삭제
    * @author 하윤주
    * @param map, model
    * @exception Exception
   */
   @RequestMapping(value="/deleteNoti.do", method=RequestMethod.POST)
   public String notice_delete(@RequestParam Map<String, Object> map, Model model) throws Exception {
      noticeService.noticeDelete(map);

      return  "redirect:/notice.do";
   }




}

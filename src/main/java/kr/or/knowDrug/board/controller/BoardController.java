package kr.or.knowDrug.board.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.jms.Session;
import javax.mail.Multipart;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import kr.or.knowDrug.board.service.BoardService;
import kr.or.knowDrug.board.service.boardPage;
import kr.or.knowDrug.board.vo.BoardVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class BoardController {
   @Resource(name="boardService")
   private BoardService service;

   private int size = 10;

   /**
    * 공지사항 리스트 조회
    * @author 하윤주
    * @param map
    * @param model
    * @return board
    * @throws Exception
    */
   @RequestMapping(value="/board.do")
   public String board(@RequestParam Map<String, Object> map, Model model)throws Exception {

      int total = service.selectCount();

      String strPageNum = map.get("pageNum") == null?"1":map.get("pageNum").toString();
      int pageNum =  Integer.parseInt(strPageNum);
      map.put("pageNum", pageNum);

      List<BoardVO> boardList= this.service.getBoardList(map);

      model.addAttribute("boardlist", new boardPage(total, pageNum, size, boardList));
      model.addAttribute("selOpt", map.get("selOpt"));
      model.addAttribute("keyword", map.get("keyword"));

      return "/member/board";
   }


   /**
    * 자유게시판 글 등록 폼 조회
    * @author 하윤주
   */
   @RequestMapping(value="/board_write.do")
   public String board_write() {

      return "/member/board_write";
   }

   /**
    * 자유게시판 글 등록 및 파일 첨부
    * @author 하윤주
    * @param map, model, attachFile, session
    * @exception Exception
   */
   @RequestMapping(value="/board.do", method=RequestMethod.POST)
   public String board_writeForm(@RequestParam Map<String, Object> map, Model model,MultipartFile[] attachFile ,HttpSession session) throws Exception {
         String uploadFolder = "C:\\eGovFrame-3.9.0\\workspace.edu\\kNOwDrug\\src\\main\\webapp\\resources\\assets\\img\\upload\\board\\";

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

      String memId = (String) session.getAttribute("memId");
      map.put("memId", memId);

      this.service.getBoardWrite(map);

      return  "redirect:/board.do";
   }

   /**
    * 자유게시판 상세조회
    * @author 하윤주
    * @param map, model, session
    * @exception Exception
   */
   @RequestMapping(value="/board_detail.do")
   public String board_detail(@RequestParam Map<String, Object> map, Model model,HttpSession session) throws Exception {
      String memId= (String) session.getAttribute("memId");
      map.put("memId", memId);


      BoardVO vo = this.service.boardDetail(map);

      service.hit(map);

      model.addAttribute("detail", vo);

      return "/member/board_detail";
   }

   /**
     * 자유게시판 수정 폼 조회
     * @author 하윤주
     * @throws Exception
    */
   @RequestMapping(value="/board_mod.do")
   public String boardMod(@RequestParam Map<String, Object> map, Model model,HttpSession session) throws Exception {
      String memName = (String) session.getAttribute("memName");
      map.put("memName", memName);

      BoardVO vo =service.boardDetail(map);
      model.addAttribute("boardMod", vo);

      return "/member/board_mod";
   }

   /**
     * 자유게시판  글 수정
     * @author 하윤주
     * @param
     * @exception Exception
   */
   @RequestMapping(value="/board_modify.do", method=RequestMethod.POST)
   public String boardModify(@RequestParam Map<String, Object> map, MultipartFile[] attachFile ,HttpSession session) throws Exception {
      String uploadFolder = "C:\\eGovFrame-3.9.0\\workspace.edu\\kNOwDrug\\src\\main\\webapp\\resources\\assets\\img\\upload\\board\\";

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

      String boardSeq = (String) map.get("boardSeq");
      service.boardModify(map);

      return "redirect:/board_detail.do?boardSeq="+boardSeq ;
   }

   /**
    * 자유게시판 글 삭제
    * @author 하윤주
    * @param map, model
    * @exception Exception
   */
   @RequestMapping(value="/delete.do", method=RequestMethod.POST)
   public String board_delete(@RequestParam Map<String, Object> map, Model model) throws Exception {
      this.service.boardDelete(map);

      return  "redirect:/board.do";
   }


   /**
    * 댓글 작성 ajax
    * @author 하윤주
    * @param map
    * @exception Exception
   */
   @ResponseBody
   @RequestMapping(value="/reply_add.do" , method=RequestMethod.POST)
   public ModelAndView replyAdd(@RequestParam Map<String, Object> map) throws Exception {
      String boardSeq = (String) map.get("boardSeq");

      this.service.getReplyAdd(map);

       ModelAndView mav = new ModelAndView("jsonView");
       mav.addObject("data", map);

       return mav;
   }

   /**
    * 댓글 리스트 조회 ajax
    * @author 하윤주
    * @param map
    * @exception Exception
   */
   @ResponseBody
   @RequestMapping(value="/reply_list.do" , method=RequestMethod.POST)
   public ModelAndView replyList(@RequestParam Map<String, Object> map) throws Exception {
      String boardSeq = (String) map.get("boardSeq");

      List<?>list =  this.service.getReplyList(map);

      ModelAndView mav = new ModelAndView("jsonView");
      mav.addObject("data", list);

      return mav;
   }

   /**
    * 댓글 삭제 ajax
    * @author 하윤주
    * @param map , model
    * @exception Exception
   */
   @ResponseBody
   @RequestMapping(value="/reply_del.do", method=RequestMethod.POST)
   public ModelAndView replyDel(@RequestParam Map<String, Object> map, Model model) throws Exception {
      int cnt = this.service.replyDel(map);

      ModelAndView mav = new ModelAndView("jsonView");
      mav.addObject("data", cnt);

      return mav;
   }



      /**
       * 파일 삭제 ajax
       * @author 하윤주
       * @param map , model
       * @exception Exception
      */
      @ResponseBody
      @RequestMapping(value="/file_del.do", method=RequestMethod.POST)
      public ModelAndView fileDel(@RequestParam Map<String, Object> map, Model model) throws Exception {
         int cnt = this.service.fileDel(map);

         ModelAndView mav = new ModelAndView("jsonView");
         mav.addObject("data", cnt);

         return mav;
      }

}
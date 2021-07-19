package kr.or.knowDrug.board.service;

import java.io.File;
import java.util.List;
import java.util.Map;

import kr.or.knowDrug.board.vo.BoardVO;


public interface BoardService {
	//자유게시판 리스트
	public List<BoardVO> getBoardList(Map<String, Object> map) throws Exception;
	//자유게시판 글쓰기
	public int getBoardWrite(Map<String, Object> map) throws Exception;
	//자유게시판 상세
	BoardVO boardDetail(Map<String, Object> map) throws Exception;
	//자유게시판 삭제
	int boardDelete(Map<String, Object> map) throws Exception;
	//댓글 등록
	int getReplyAdd(Map<String, Object> map) throws Exception;
	//댓글 리스트
	List<?> getReplyList(Map<String, Object> map) throws Exception;
	// 댓글삭제
	int replyDel(Map<String, Object> map) throws Exception;
	//자유게시판 수정
	int boardModify(Map<String, Object> map) throws Exception;
	//파일삭제
	public int fileDel(Map<String, Object> map) throws Exception;
	//카운트세기
	int selectCount() throws Exception;
	//조회수 증가
	int hit(Map<String, Object> map) throws Exception;

}

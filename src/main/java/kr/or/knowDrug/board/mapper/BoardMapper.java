package kr.or.knowDrug.board.mapper;

import java.io.File;
import java.util.List;
import java.util.Map;

import egovframework.rte.psl.dataaccess.mapper.Mapper;
import kr.or.knowDrug.board.vo.BoardVO;

@Mapper("boardMapper")
public interface BoardMapper {
	List<BoardVO> selectBoardList(Map<String, Object> map) throws Exception;

	int write(Map<String, Object> map) throws Exception;

	BoardVO read(Map<String, Object> map) throws Exception;

	int delete(Map<String, Object> map) throws Exception;

	int replyWrite(Map<String, Object> map) throws Exception;

	List<?> replyList(Map<String, Object> map) throws Exception;

	int replyDel(Map<String, Object> map) throws Exception;

	int boardModify(Map<String, Object> map) throws Exception;

	int fileDel(Map<String, Object> map) throws Exception;

	int selectCount() throws Exception;

	int hit(Map<String, Object> map) throws Exception;
}

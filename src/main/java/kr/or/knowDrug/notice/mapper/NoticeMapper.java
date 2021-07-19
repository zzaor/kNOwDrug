package kr.or.knowDrug.notice.mapper;

import java.util.List;
import java.util.Map;

import egovframework.rte.psl.dataaccess.mapper.Mapper;
import kr.or.knowDrug.notice.vo.NoticeVO;

@Mapper("noticeMapper")
public interface NoticeMapper {

	public List<NoticeVO> selectNoticeList(Map<String,Object> map) throws Exception;

	int selectCount() throws Exception;

	int writeNotice(Map<String,Object> map) throws Exception;

	NoticeVO noticeDetail(Map<String,Object> map) throws Exception;

	int hit(Map<String, Object> map) throws Exception;

	int fileDel(Map<String, Object> map) throws Exception;

	int noticeModify(Map<String, Object> map) throws Exception;

	int noticeDelete(Map<String, Object> map) throws Exception;

}

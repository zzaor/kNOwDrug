package kr.or.knowDrug.academicInfo.mapper;
import java.util.List;
import java.util.Map;

import egovframework.rte.psl.dataaccess.mapper.Mapper;
import kr.or.knowDrug.academicInfo.vo.AcademicInfoVO;

@Mapper("academicInfoMapper")
public interface AcademicInfoMapper {
	List<AcademicInfoVO> selectInfoList(Map<String,Object> map) throws Exception;

	int writeInfo(Map<String,Object> map) throws Exception;

	int writeFile(Map<String,Object> map) throws Exception;

	String selectSeq() throws Exception;

	List<?> selectInfo(Map<String,Object> map) throws Exception;

	int addHit(Map<String, Object> map) throws Exception;

	int deleteInfo(Map<String,Object> map) throws Exception;

	int selectCount() throws Exception;

	int modiInfo(Map<String,Object> map) throws Exception;

	int deleteFile(Map<String,Object> map) throws Exception;

	int selectFile(Map<String, Object> map) throws Exception;
}

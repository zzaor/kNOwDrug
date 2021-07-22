package kr.or.knowDrug.durSearch.mapper;

import java.util.List;
import java.util.Map;

import egovframework.rte.psl.dataaccess.mapper.Mapper;

@Mapper("durSearchMapper")
public interface DurSearchMapper {

	int insertData(Map<String,Object> map) throws Exception;

	int mergeData(Map<String, Object> map) throws Exception;

	List<Map<String, Object>> selectData(Map<String, Object> map) throws Exception;

	List<Map<String,Object>> selectGraph(Map<String, Object> map) throws Exception;

	int selectCount() throws Exception;
}

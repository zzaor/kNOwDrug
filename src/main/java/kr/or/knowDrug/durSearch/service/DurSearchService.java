package kr.or.knowDrug.durSearch.service;

import java.util.List;
import java.util.Map;

public interface DurSearchService {
	int insertData(Map<String, Object> map) throws Exception;

	int mergeData(Map<String, Object> map) throws Exception;

	List<Map<String, Object>> selectData(Map<String, Object> map) throws Exception;

	List<Map<String,Object>> selectGraph(Map<String, Object> map) throws Exception;

	int selectCount() throws Exception;
}

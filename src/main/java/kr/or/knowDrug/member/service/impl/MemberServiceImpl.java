package kr.or.knowDrug.member.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;
import kr.or.knowDrug.member.mapper.MemberMapper;
import kr.or.knowDrug.member.service.MemberService;
import kr.or.knowDrug.member.vo.MemberVO;

@Service("memberService")
public class MemberServiceImpl implements MemberService{

	@Resource(name="memberMapper")
	private MemberMapper mapper;

	@Override
	public List<MemberVO> selectMemberList(Map<String, Object> map) throws Exception{
		return mapper.selectMemberList(map);
	}

	@Override
	public MemberVO selectMember(Map<String,Object> map) throws Exception{
		return mapper.selectMember(map);
	}

	@Override
	public MemberVO mypage(Map<String,Object> map) throws Exception{
		return mapper.mypage(map);
	}

	@Override
	public int join(Map<String, Object> map) throws Exception {
		return mapper.join(map);
	}

	@Override
	public int modiMypage(Map<String, Object> map) throws Exception {
		return mapper.modiMypage(map);
	}

	@Override
	public int idDuplCheck(Map<String, Object> map) throws Exception {
		return mapper.idDuplCheck(map);
	}

	@Override
	public int changeActive(Map<String, Object> map) throws Exception {
		return mapper.changeActive(map);
	}

	@Override
	public int changeActY(Map<String, Object> map) throws Exception {
		return mapper.changeActiveY(map);
	}

	@Override
	public int selectCount() throws Exception {
		return mapper.selectCount();
	}

	@Override
	public MemberVO dupl_id(Map<String, Object> map) throws Exception {
		return mapper.duplId(map);
	}

	@Override
	public int setPwd(Map<String, Object> pwdMap) throws Exception {
		return mapper.setPwd(pwdMap);
	}

	@Override
	public int changePwd(Map<String, Object> map) throws Exception {
		return mapper.changePwd(map);
	}

	@Override
	public int changeActiveD(Map<String, Object> map) throws Exception {
		return mapper.changeActiveD(map);
	}






}

package org.gidal.waiting.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.gidal.enterprise.domain.EnterpriseVO;
import org.gidal.user.domain.UserVO;
import org.gidal.waiting.domain.WaitingVO;
import org.springframework.stereotype.Repository;


@Repository
public class WaitingDAOImpl implements WaitingDAO {

	@Inject
	private SqlSession sqlsession;
	private static String namespace = "org.gidal.mapper.WaitingMapper";



	@Override
	public int waiting_insert(WaitingVO vo) {
		return sqlsession.insert(namespace + ".waiting", vo);
	}

	@Override
	public List<WaitingVO> waiting_view(Integer code) {
		return sqlsession.selectList(namespace + ".selectList", code);
	}


	@Override
	public EnterpriseVO selectOne(Integer code) {
		return sqlsession.selectOne(namespace + ".selectView", code);
	}

	@Override
	public UserVO selectUser(String str) {
		return sqlsession.selectOne(namespace + ".selectOne", str);
	}

	@Override
	public int waiting_count(Integer code) {
		return sqlsession.selectOne(namespace + ".selectList_count", code);
	}

}

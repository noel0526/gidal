package org.gidal.reserve.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.gidal.enterprise.domain.EnterpriseVO;
import org.gidal.reserve.domain.ReserveVO;
import org.gidal.user.domain.UserVO;
import org.springframework.stereotype.Repository;

@Repository
public class ReserveDAOImpl implements ReserveDAO{

	@Inject
	private SqlSession sqlsession;
	private static String namespace = "org.gidal.mapper.ReserveMapper";



	@Override
	public int reserve_insert(ReserveVO vo) {
		return sqlsession.insert(namespace + ".reserve", vo);
	}

	@Override
	public List<ReserveVO> reserve_view() {
		return null;
	}

	@Override
	public int reserve_update() {
		return 0;
	}

	@Override
	public void reserve_cancel(String reserve_code) {
		sqlsession.delete(namespace + ".reserve_cancel", reserve_code);

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
	public List<ReserveVO> reserve_alert(String user) {
		return sqlsession.selectList(namespace + ".reserve_alert", user);
	}

	@Override
	public List<ReserveVO> reserve_alert_now(String user) {
		return sqlsession.selectList(namespace + ".reserve_alert_now", user);
	}



}

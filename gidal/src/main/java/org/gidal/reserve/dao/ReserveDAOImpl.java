package org.gidal.reserve.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.gidal.authentication.dto.LoginDTO;
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
	public int reserve_insert() {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<ReserveVO> reserve_view() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int reserve_update() {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public void reserve_cancel() {
		// TODO Auto-generated method stub

	}

	@Override
	public EnterpriseVO selectOne(Integer code) {
		return sqlsession.selectOne(namespace + ".selectView", code);
	}

	@Override
	public UserVO selectUser(String str) {
		return sqlsession.selectOne(namespace + ".selectOne", str);
	}

}

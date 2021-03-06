package org.gidal.user.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.gidal.event.domain.PageInfo;
import org.gidal.user.domain.SessionPageVO;
import org.gidal.user.domain.UserPageVO;
import org.gidal.user.domain.UserPageWaitingVO;
import org.gidal.user.domain.UserVO;
import org.springframework.stereotype.Repository;


@Repository
public class UserDAOImpl implements UserDAO {

	@Inject
	private SqlSession sqlsession;

	private static String namespace = "org.gidal.mapper.UserMapper";

	@Override
	public int user_join(UserVO vo) {
		
		
		return sqlsession.insert(namespace + ".userjoin", vo);
	}

	@Override
	public int user_revise(UserVO vo) {
		return sqlsession.update(namespace + ".userRevise", vo) ;
	}

	@Override
	public List<UserVO> userBoard_view() {
		return null;
	}

	@Override
	public int user_check(UserVO vo) {
		return sqlsession.selectOne(namespace + ".emailCheck", vo);
	}

	@Override
	public List<UserPageVO> UserPageReserve(SessionPageVO vo) throws Exception {
		
		return sqlsession.selectList(namespace + ".UserPageReserve",vo);
		
	}

	@Override
	public int UserPageReserveCount() {
		return sqlsession.selectOne(namespace + ".UserPageReserveCount");
	}

	@Override
	public PageInfo pageInfo() {
		return sqlsession.selectOne(namespace + ".pageInfo");
	}

	@Override
	public List<UserPageWaitingVO> UserPageWaiting(SessionPageVO vo) throws Exception {
		return sqlsession.selectList(namespace + ".UserPageWaiting", vo);
	}

	@Override
	public int UserPageWaitingCount() {
		return sqlsession.selectOne(namespace + ".UserPageWaitingCount");
	}

	@Override
	public int userDelete(UserVO vo) {
		
		return sqlsession.delete(namespace + ".userDelete", vo) ;
	}

	@Override
	public String getUser_password(UserVO vo) {
		return sqlsession.selectOne(namespace + ".getUser_password", vo);
	}

}

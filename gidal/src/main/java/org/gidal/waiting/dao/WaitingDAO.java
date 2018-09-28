package org.gidal.waiting.dao;

import java.util.List;

import org.gidal.enterprise.domain.EnterpriseVO;
import org.gidal.user.domain.UserVO;
import org.gidal.waiting.domain.WaitingVO;

public interface WaitingDAO {


	public List<WaitingVO> waiting_view(Integer code);
	public EnterpriseVO selectOne(Integer code);
	public UserVO selectUser(String str);
	public int waiting_insert(WaitingVO vo);
	public int waiting_count(Integer code);


}

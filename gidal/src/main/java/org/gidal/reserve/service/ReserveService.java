package org.gidal.reserve.service;

import javax.servlet.http.HttpSession;


import org.gidal.enterprise.domain.EnterpriseVO;
import org.gidal.user.domain.UserVO;

public interface ReserveService {

	public EnterpriseVO selectOne(Integer code);
	public UserVO  selectOne(String str);


}

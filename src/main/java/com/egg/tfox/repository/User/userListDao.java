package com.egg.tfox.repository.User;

import java.util.List;
import java.util.Map;

import com.egg.tfox.entity.User;
//import com.egg.tfox.entity.User;
import com.egg.tfox.vo.user.PaginInfo;
import com.egg.tfox.vo.user.UserVo;

public interface userListDao {

	//List<User> userlist();
	//유저관리 유저리스트
	List<UserVo> userlist(Map<String, Object> maplist, PaginInfo pi);
	//유저리스트 페이징
	int countUser(Map<String, Object> maplist);
	
	//카트 기본배송지
	List<User> getinfo();

}

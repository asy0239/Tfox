package com.egg.tfox.service.user;

import java.util.List;
import java.util.Map;

//import com.egg.tfox.entity.User;
import com.egg.tfox.vo.user.PaginInfo;
import com.egg.tfox.vo.user.UserVo;

public interface UserService {

	int countUser(Map<String, Object> maplist);

	List<UserVo> userlist(Map<String, Object> maplist, PaginInfo pi);

	//List<User> userlist();

}

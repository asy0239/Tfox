package com.egg.tfox.repository.cart;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.egg.tfox.vo.cart.proVo;

@Repository
public class cartDaoImpl implements cartDao{
@Autowired
private SqlSession sqlSession;

	@Override
	public List<proVo> proinfo() {
		
		return sqlSession.selectList("cart.proinfo");
	}

}

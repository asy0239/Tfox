package com.egg.tfox.repository.cart;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.egg.tfox.controller.cart.Cart;
import com.egg.tfox.entity.User;
import com.egg.tfox.vo.cart.CartVo;
import com.egg.tfox.vo.cart.orderdetailVo;
import com.egg.tfox.vo.cart.proVo;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Repository
public class cartDaoImpl implements cartDao{
@Autowired
private SqlSession sqlSession;

//@Override
//public List<CartVo> cartInfo() {
//	List<CartVo> test = sqlSession.selectList("cart.CartInfo");
//	System.out.println("뜨냐 : " + test);
//	return sqlSession.selectList("cart.CartInfo");
//}




 @Override 
 public List<CartVo> cartInfo(String userId) {
 
	 List<CartVo> cartInfo = sqlSession.selectList("cart.cartInfo", userId);
	 return cartInfo; 
}
  
 @Override public List<User> getInfo(String userId) {
  
 return sqlSession.selectList("cart.getInfo" , userId); 
 }
  


@Override
public int sumMoney(String userId) {
	return sqlSession.selectOne("cart.sumMoney", userId); 
}

@Override
public int countCart(String userId, int pro_id) {
	
	return 0;
}


 

}

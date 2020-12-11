package com.egg.tfox.repository.cart;

import java.util.List;

import com.egg.tfox.entity.User;
import com.egg.tfox.vo.cart.CartVo;
import com.egg.tfox.vo.cart.orderdetailVo;
import com.egg.tfox.vo.cart.proVo;

public interface cartDao {
	//장바구니 정보
	//List<CartVo> cartInfo();
	//상품정보
	List<proVo> proInfo(String userId);
	//장바구니 회원정보
	List<User> getInfo(String userId);
	//상품 주문 정보
	List<orderdetailVo> orderInfo(String userId);
}

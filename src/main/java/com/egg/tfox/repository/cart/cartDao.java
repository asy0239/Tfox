package com.egg.tfox.repository.cart;

import java.util.List;

import com.egg.tfox.vo.cart.proVo;

public interface cartDao {
	//상품정보
	List<proVo> proinfo();
}

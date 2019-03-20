package com.estore.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.estore.dao.CartDao;
import com.estore.model.Cart;
import com.estore.service.CartService;

@Service
@Transactional
public class CartServiceImpl implements CartService {

	@Autowired
	private CartDao cartDao;

	public Cart getCartById(int cartId) {
		return cartDao.getCartById(cartId);
	}

	public void update(Cart cart) {
		cartDao.update(cart);
	}
}

package com.estore.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.estore.dao.ConfirmedOrderDao;
import com.estore.model.ConfirmedOrder;
import com.estore.service.ConfirmedOrderService;

@Service
@Transactional
public class ConfirmedOrderServiceImpl implements ConfirmedOrderService {

	@Autowired
	private ConfirmedOrderDao confirmedOrderDao;

	public List<ConfirmedOrder> getAllPendingOrders() {
		return confirmedOrderDao.getAllPendingOrders();
	}

	public void setFulfilled(int confirmedOrderId) {
		confirmedOrderDao.setFulfilled(confirmedOrderId);
	}

	public List<ConfirmedOrder> getAllOrders() {
		return confirmedOrderDao.getAllOrders();
	}

}

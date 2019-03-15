package com.cocovill.order.orderHistory.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.cocovill.order.common.AbstractDAO;
import com.cocovill.order.dto.OrderHistoryDto;


@Repository("orderHistoryDAO")
public class OrderHistoryDAO extends AbstractDAO{

	@SuppressWarnings("unchecked")
	public List<OrderHistoryDto> orderHistoryList(OrderHistoryDto orderHistoryDto){
		return (List<OrderHistoryDto>) selectList("orderHistory.orderHistoryList", orderHistoryDto);
	}
	
	@SuppressWarnings("unchecked")
	public List<OrderHistoryDto> orderHistoryGourp(){
		return (List<OrderHistoryDto>) selectList("orderHistory.orderHistoryGourp");
	}

	public void orderHistoryInsert(OrderHistoryDto orderHistoryDto){
		insert("orderHistory.orderHistoryInsert", orderHistoryDto);
	}

}

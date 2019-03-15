package com.cocovill.order.orderHistory.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.cocovill.order.dto.OrderHistoryDto;

import net.sf.json.JSONObject;



public interface OrderHistoryService {
	
	public List<OrderHistoryDto> orderHistoryList(OrderHistoryDto orderHistoryDto);
	public List<OrderHistoryDto> orderHistoryGourp();
	public JSONObject orderHistoryInsert(List<OrderHistoryDto> orderHistoryDtoList, HttpServletRequest request);
	
}

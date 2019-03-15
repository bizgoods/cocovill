package com.cocovill.order.orderHistory.service;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.cocovill.order.dto.OrderHistoryDto;
import com.cocovill.order.orderHistory.dao.OrderHistoryDAO;
import com.cocovill.order.utils.CommonUtil;

import net.sf.json.JSONObject;


@Service("orderHistoryService")
public class OrderHistoryServiceImpl implements OrderHistoryService{

	private static final Logger logger = LoggerFactory.getLogger(OrderHistoryServiceImpl.class);
	
	@Resource(name="orderHistoryDAO")
	private OrderHistoryDAO orderHistoryDAO;

	@Override
	public List<OrderHistoryDto> orderHistoryList(OrderHistoryDto orderHistoryDto){
		return orderHistoryDAO.orderHistoryList(orderHistoryDto);
	}
	
	@Override
	public List<OrderHistoryDto> orderHistoryGourp() {
		return orderHistoryDAO.orderHistoryGourp();
	}
	
	@Override
	public JSONObject orderHistoryInsert(List<OrderHistoryDto> orderHistoryDtoList, HttpServletRequest request){

		JSONObject json = new JSONObject();
		
		for(OrderHistoryDto orderHistoryDto : orderHistoryDtoList) {
			CommonUtil.setInUserInfo(request, orderHistoryDto);
			orderHistoryDAO.orderHistoryInsert(orderHistoryDto);
		}
		
		return json;
	}

}

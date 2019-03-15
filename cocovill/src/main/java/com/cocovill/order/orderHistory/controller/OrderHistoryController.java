package com.cocovill.order.orderHistory.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.cocovill.order.common.BaseController;
import com.cocovill.order.dto.OrderHistoryDto;
import com.cocovill.order.orderHistory.service.OrderHistoryService;

@Controller
@RequestMapping(value="/orderHistory")
public class OrderHistoryController extends BaseController {

	private static final Logger logger = LoggerFactory.getLogger(OrderHistoryController.class);
	
	@Resource(name="orderHistoryService")
	private OrderHistoryService orderHistoryService;
	
	@RequestMapping(value="/orderHistoryList")
	public ModelAndView orderHistoryList(@ModelAttribute OrderHistoryDto orderHistoryDto, HttpServletRequest request, HttpServletResponse response, HttpSession session){
		ModelAndView mav = new ModelAndView();

		// order group
		List<OrderHistoryDto> orderHistoryGourpList = orderHistoryService.orderHistoryGourp();
		
		List<OrderHistoryDto> resultList = null;
		
		if(orderHistoryDto.getUploadsheet_group() == null || orderHistoryDto.getUploadsheet_group() == "") {
			orderHistoryDto.setUploadsheet_group(orderHistoryGourpList.get(0).getUploadsheet_group());
		}
		
		resultList = orderHistoryService.orderHistoryList(orderHistoryDto);
		
		
		mav.addObject("paramDto", orderHistoryDto);
		mav.addObject("resultList", resultList);
		mav.addObject("orderHistoryGourpList", orderHistoryGourpList);
		
		mav.setViewName("/orderHistory/orderHistoryList");
		
		return mav;
	}
	
}
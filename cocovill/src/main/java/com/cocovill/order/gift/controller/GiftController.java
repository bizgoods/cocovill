package com.cocovill.order.gift.controller;

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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.cocovill.order.dto.GiftDto;
import com.cocovill.order.gift.service.GiftService;
import com.cocovill.order.common.BaseController;
import com.cocovill.order.utils.CommonUtil;
import com.cocovill.order.utils.PagingView;

import net.sf.json.JSONObject;

@Controller
@RequestMapping(value="/gift")
public class GiftController extends BaseController {

	private static final Logger logger = LoggerFactory.getLogger(GiftController.class);
	
	@Resource(name="giftService")
	private GiftService giftService;
	
	@RequestMapping(value="/giftList")
	public ModelAndView giftList(@ModelAttribute GiftDto giftDto, HttpServletRequest request, HttpServletResponse response, HttpSession session){
		ModelAndView mav = new ModelAndView();
		
		List<GiftDto> resultList = null;
		resultList = giftService.giftList(giftDto);
		
		if(resultList.size() > 0){
			//paging		
			GiftDto pg = resultList.get(0);
			PagingView pv = new PagingView(pg.getPageNum(), giftDto.getPageSize(), giftDto.getBlockSize(), pg.getTotCnt());
			mav.addObject("paging", pv.print());
			//paging		
		}
		
		logger.debug("giftDto:"+giftDto.toString());
		
		mav.addObject("paramDto", giftDto);
		mav.addObject("resultList", resultList);
		
		mav.setViewName("/gift/giftList");
		
		return mav;
	}
	
	@RequestMapping(value="/giftDetail")
	public ModelAndView giftDetail(@ModelAttribute GiftDto giftDto, HttpServletRequest request, HttpServletResponse response, HttpSession session){
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/gift/giftDetail");
		GiftDto result = null;
		
		try {
			//게시글정보
			result = giftService.giftDetail(giftDto);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		mav.addObject("paramDto", giftDto);
		mav.addObject("result", result);
		
		return mav;
	}
	
	@RequestMapping(value="/giftDetailLayer")
	@ResponseBody
	public ModelAndView giftDetailLayer(@ModelAttribute GiftDto giftDto, HttpServletRequest request, HttpServletResponse response, HttpSession session){
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/gift/giftDetailLayer");
		GiftDto result = null;
		
		try {
			//게시글정보
			result = giftService.giftDetail(giftDto);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		mav.addObject("result", result);
		return mav;
	}
	
	@RequestMapping(value="/giftForm")
	public ModelAndView giftForm(@ModelAttribute GiftDto giftDto, HttpServletRequest request, HttpServletResponse response, HttpSession session){
		ModelAndView mav = new ModelAndView();
		
		mav.setViewName("/gift/giftForm");
		
		GiftDto result = giftService.giftDetail(giftDto);
		
		mav.addObject("paramDto", giftDto);
		mav.addObject("result", result);
		return mav;
	}	
	
	@RequestMapping(value="/giftInsert")
	public ModelAndView giftInsert(@ModelAttribute GiftDto giftDto, HttpServletRequest request, HttpServletResponse response, HttpSession session){
		ModelAndView mav = new ModelAndView();
		JSONObject json = new JSONObject();
		mav.setViewName("jsonView");
		CommonUtil.getReturnCodeFail(json);
		
		try {
			//사용자정보
			CommonUtil.setInUserInfo(request, giftDto);		
			CommonUtil.setUpUserInfo(request, giftDto);
			json = giftService.giftInsert(giftDto, request);
			//저장 성공시 코드값 세팅
			CommonUtil.getReturnCodeSuc(json);
			//저장후 페이지 이동
			json.put("goUrl", "/gift/giftList.do");
		} catch (Exception e) {
			//저장 실패시 코드값 세팅
			logger.info("EXCEPTION insert E:" + e.toString());
			CommonUtil.getReturnCodeFail(json);
		}
		//결과값 전송
		logger.info(json.toString());
		mav.addObject("resultJson", json);
		return mav;
		
	}
	
	@RequestMapping(value="/giftUpdate")
	public ModelAndView giftUpdate(@ModelAttribute GiftDto giftDto, HttpServletRequest request, HttpServletResponse response, HttpSession session){
		ModelAndView mav = new ModelAndView();
		JSONObject json = new JSONObject();
		mav.setViewName("jsonView");
		CommonUtil.getReturnCodeFail(json);
		
		try {
			
			//사용자정보
			CommonUtil.setUpUserInfo(request, giftDto);
			json = giftService.giftUpdate(giftDto, request);
			//저장 성공시 코드값 세팅
			CommonUtil.getReturnCodeSuc(json);
			//저장후 페이지 이동
//			json.put("goUrl", "/gift/detail.do?board_id="+giftDto.getBoard_id() + "&board_gbn=" + giftDto.getBoard_gbn());
			json.put("goUrl", "/gift/giftList.do");
		} catch (Exception e) {
			//저장 실패시 코드값 세팅
			logger.info("EXCEPTION insert E:" + e.toString());
			CommonUtil.getReturnCodeFail(json);
		}
		//결과값 전송
		logger.info(json.toString());
		mav.addObject("resultJson", json);
		return mav;
		
	}
	
	@RequestMapping(value="/giftDelete")
	@ResponseBody
	public ModelAndView giftDelete(@ModelAttribute GiftDto giftDto, HttpServletRequest request, HttpServletResponse response, HttpSession session){
		JSONObject json = new JSONObject();
		ModelAndView mav = new ModelAndView();
		mav.setViewName("jsonView");
		try {
			//사용자정보
			CommonUtil.setUpUserInfo(request, giftDto);			
			json = giftService.giftDelete(giftDto, request);
			CommonUtil.getReturnCodeSuc(json);
			json.put("goUrl", "/gift/giftList.do");
		} catch (Exception e) {
			// TODO: handle exception
			logger.info("PROGRAM_Exception:"+e);
			CommonUtil.getReturnCodeFail(json);
		}
		
		//결과값 전송
		logger.info(json.toString());
		mav.addObject("resultJson", json);
		return mav;
		
	}
	
}
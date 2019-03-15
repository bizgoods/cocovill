package com.cocovill.order.ordersheet.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.cocovill.order.common.BaseController;
import com.cocovill.order.dto.GiftDto;
import com.cocovill.order.dto.OrderHistoryDto;
import com.cocovill.order.dto.UploadSheetDto;
import com.cocovill.order.gift.service.GiftService;
import com.cocovill.order.ordersheet.service.OrdersheetService;
import com.cocovill.order.orderHistory.service.OrderHistoryService;
import com.cocovill.order.utils.CommonUtil;

import net.sf.json.JSONObject;

@Controller
@RequestMapping(value="/ordersheet")
public class OrdersheetController extends BaseController {

	private static final Logger logger = LoggerFactory.getLogger(OrdersheetController.class);
	
	@Resource(name="ordersheetService")
	private OrdersheetService ordersheetService;
	@Resource(name="giftService")
	private GiftService giftService;
	@Resource(name="orderHistoryService")
	private OrderHistoryService orderHistoryService;
	
	/**
	 * 주소별 발주 리스트
	 * @param uploadSheetDto
	 * @param request
	 * @param response
	 * @param session
	 * @return
	 */
	@RequestMapping(value="/ordersheetList")
	public ModelAndView ordersheetList(@ModelAttribute UploadSheetDto uploadSheetDto, HttpServletRequest request, HttpServletResponse response, HttpSession session){
		ModelAndView mav = new ModelAndView();
		
		List<UploadSheetDto> resultList = null;
		resultList = ordersheetService.ordersheetList(uploadSheetDto);
		
		mav.addObject("paramDto", uploadSheetDto);
		mav.addObject("resultList", resultList);
		
		mav.setViewName("/ordersheet/ordersheetList");
		
		return mav;
	}
	
	@RequestMapping(value="/ordersheetListHwakjeong")
	public ModelAndView ordersheetListHwakjeong(@RequestBody List<OrderHistoryDto> orderHistoryDtoList, HttpServletRequest request, HttpServletResponse response, HttpSession session){
		ModelAndView mav = new ModelAndView();
		JSONObject json = new JSONObject();
		mav.setViewName("jsonView");
		CommonUtil.getReturnCodeFail(json);
		
		try {
			logger.info("uploadSheetDtoList.size:"+orderHistoryDtoList.size());
			
			if(orderHistoryDtoList.size() > 0) {
				
				// 해당 그룹 확정으로 업데이트
				UploadSheetDto paramDto = new UploadSheetDto();
				paramDto.setUploadsheet_group(orderHistoryDtoList.get(0).getUploadsheet_group());
				ordersheetService.ordersheetListHwakjeong(paramDto);
				
				// 확정시 주문내역 테이블에 저장
				try {
					json = orderHistoryService.orderHistoryInsert(orderHistoryDtoList, request);
					//저장 성공시 코드값 세팅
					CommonUtil.getReturnCodeSuc(json);
					//저장후 페이지 이동
					json.put("goUrl", "/orderHistory/orderHistoryList.do");
				} catch (Exception e) {
					//저장 실패시 코드값 세팅
					logger.info("EXCEPTION orderHistoryInsert E:" + e.toString());
					CommonUtil.getReturnCodeFail(json);
				}
				
				
				
				//저장 성공시 코드값 세팅
				CommonUtil.getReturnCodeSuc(json);
				//저장후 페이지 이동
				json.put("goUrl", "/orderHistory/orderHistoryList.do");
			}else {
				CommonUtil.getReturnCodeFail(json, "저장할 데이타가 없습니다.");
			}
		} catch(RuntimeException re) {
			logger.info("RuntimeException insert E:" + re.toString());
			CommonUtil.getReturnCodeFail(json, re.toString());
		} catch (Exception e) {
			//저장 실패시 코드값 세팅
			logger.info("EXCEPTION insert E:" + e.toString());
			CommonUtil.getReturnCodeFail(json, e.toString());
		}
		//결과값 전송
		logger.info(json.toString());
		mav.addObject("resultJson", json);
		return mav;
		
	}
	
	/**
	 * 발주준비중인 내용삭제
	 * @param uploadSheetDto
	 * @param request
	 * @param response
	 * @param session
	 * @return
	 */
	@RequestMapping(value="/ordersheetListDelete")
	@ResponseBody
	public ModelAndView ordersheetListDelete(@ModelAttribute UploadSheetDto uploadSheetDto, HttpServletRequest request, HttpServletResponse response, HttpSession session){
		JSONObject json = new JSONObject();
		ModelAndView mav = new ModelAndView();
		mav.setViewName("jsonView");
		try {
			//사용자정보
			CommonUtil.setUpUserInfo(request, uploadSheetDto);			
			json = ordersheetService.ordersheetListDelete(uploadSheetDto);
			CommonUtil.getReturnCodeSuc(json);
			json.put("goUrl", "/ordersheet/ordersheetList.do");
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
	
	
	/**
	 * 주소별 상품구매내역
	 * @param uploadSheetDto
	 * @param request
	 * @param response
	 * @param session
	 * @return
	 */
	@RequestMapping(value="/ordersheetDetailList")
	public ModelAndView ordersheetDetailList(@ModelAttribute UploadSheetDto uploadSheetDto, HttpServletRequest request, HttpServletResponse response, HttpSession session){
		ModelAndView mav = new ModelAndView();
		
		List<UploadSheetDto> resultList = null;
		UploadSheetDto resultHead = new UploadSheetDto();
		resultList = ordersheetService.ordersheetDetailList(uploadSheetDto);
		
		if(!resultList.isEmpty()) {
			// 0번째 항목에 공통값을 사용하기 위해
			resultHead = resultList.get(0);
		}
		
		mav.addObject("paramDto", uploadSheetDto);
		mav.addObject("resultList", resultList);
		mav.addObject("resultHead", resultHead);
		
		mav.setViewName("/ordersheet/ordersheetDetailList");
		
		return mav;
	}
	
	
	/**
	 * 사은품 등록 팝업 호출
	 * @param uploadSheetDto
	 * @param request
	 * @param response
	 * @param session
	 * @return
	 */
	@RequestMapping(value="/ordersheetFormGift")
	@ResponseBody
	public ModelAndView ordersheetFormGift(@ModelAttribute UploadSheetDto uploadSheetDto, HttpServletRequest request, HttpServletResponse response, HttpSession session){
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/ordersheet/ordersheetFormGift");
		
		List<GiftDto> giftList = null;
		giftList = giftService.giftAllList();
		
		mav.addObject("giftList", giftList);
		mav.addObject("paramDto", uploadSheetDto);
		return mav;
	}
	
	/**
	 * 사은품 상품 저장
	 * @param uploadSheetDto
	 * @param request
	 * @param response
	 * @param session
	 * @return
	 */
	@RequestMapping(value="/ordersheetInsertGift")
	public ModelAndView ordersheetInsertGift(@ModelAttribute UploadSheetDto uploadSheetDto, HttpServletRequest request, HttpServletResponse response, HttpSession session){
		ModelAndView mav = new ModelAndView();
		JSONObject json = new JSONObject();
		mav.setViewName("jsonView");
		CommonUtil.getReturnCodeFail(json);
		
		try {
			//사용자정보
			CommonUtil.setInUserInfo(request, uploadSheetDto);		
			CommonUtil.setUpUserInfo(request, uploadSheetDto);
			json = ordersheetService.ordersheetInsertGift(uploadSheetDto, request);
			//저장 성공시 코드값 세팅
			CommonUtil.getReturnCodeSuc(json);
			//저장후 페이지 이동
			json.put("goUrl", "/ordersheet/ordersheetList.do");
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
	
	/**
	 * 사은품 상품 수정
	 * @param uploadSheetDto
	 * @param request
	 * @param response
	 * @param session
	 * @return
	 */
	@RequestMapping(value="/ordersheetUpdateGift")
	public ModelAndView ordersheetUpdateGift(@ModelAttribute UploadSheetDto uploadSheetDto, HttpServletRequest request, HttpServletResponse response, HttpSession session){
		ModelAndView mav = new ModelAndView();
		JSONObject json = new JSONObject();
		mav.setViewName("jsonView");
		CommonUtil.getReturnCodeFail(json);
		
		try {
			//사용자정보
			CommonUtil.setUpUserInfo(request, uploadSheetDto);
			json = ordersheetService.ordersheetUpdateGift(uploadSheetDto, request);
			//저장 성공시 코드값 세팅
			CommonUtil.getReturnCodeSuc(json);
			//저장후 페이지 이동
			json.put("goUrl", "/ordersheet/ordersheetList.do");
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
	
	
	@RequestMapping(value="/ordersheetDeleteGift")
	public ModelAndView ordersheetDeleteGift(@ModelAttribute UploadSheetDto uploadSheetDto, HttpServletRequest request, HttpServletResponse response, HttpSession session){
		ModelAndView mav = new ModelAndView();
		JSONObject json = new JSONObject();
		mav.setViewName("jsonView");
		CommonUtil.getReturnCodeFail(json);
		
		try {
			//사용자정보
			CommonUtil.setUpUserInfo(request, uploadSheetDto);
			json = ordersheetService.ordersheetDeleteGift(uploadSheetDto, request);
			//저장 성공시 코드값 세팅
			CommonUtil.getReturnCodeSuc(json);
			//저장후 페이지 이동
			json.put("goUrl", "/ordersheet/ordersheetList.do");
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
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	@RequestMapping(value="/ordersheetDetail")
	public ModelAndView ordersheetDetail(@ModelAttribute UploadSheetDto uploadSheetDto, HttpServletRequest request, HttpServletResponse response, HttpSession session){
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/ordersheet/ordersheetDetail");
		UploadSheetDto result = null;
		
		try {
			//게시글정보
			result = ordersheetService.ordersheetDetail(uploadSheetDto);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		mav.addObject("paramDto", uploadSheetDto);
		mav.addObject("result", result);
		
		return mav;
	}
	
	@RequestMapping(value="/ordersheetDetailLayer")
	@ResponseBody
	public ModelAndView ordersheetDetailLayer(@ModelAttribute UploadSheetDto uploadSheetDto, HttpServletRequest request, HttpServletResponse response, HttpSession session){
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/ordersheet/ordersheetDetailLayer");
		UploadSheetDto result = null;
		
		try {
			//게시글정보
			result = ordersheetService.ordersheetDetail(uploadSheetDto);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		mav.addObject("result", result);
		return mav;
	}
	
	@RequestMapping(value="/ordersheetForm")
	public ModelAndView ordersheetForm(@ModelAttribute UploadSheetDto uploadSheetDto, HttpServletRequest request, HttpServletResponse response, HttpSession session){
		ModelAndView mav = new ModelAndView();
		
		mav.setViewName("/ordersheet/ordersheetForm");
		
		UploadSheetDto result = ordersheetService.ordersheetDetail(uploadSheetDto);
		
		mav.addObject("paramDto", uploadSheetDto);
		mav.addObject("result", result);
		return mav;
	}	
	
	@RequestMapping(value="/ordersheetInsert")
	public ModelAndView ordersheetInsert(@ModelAttribute UploadSheetDto uploadSheetDto, HttpServletRequest request, HttpServletResponse response, HttpSession session){
		ModelAndView mav = new ModelAndView();
		JSONObject json = new JSONObject();
		mav.setViewName("jsonView");
		CommonUtil.getReturnCodeFail(json);
		
		try {
			//사용자정보
			CommonUtil.setInUserInfo(request, uploadSheetDto);		
			CommonUtil.setUpUserInfo(request, uploadSheetDto);
			json = ordersheetService.ordersheetInsert(uploadSheetDto, request);
			//저장 성공시 코드값 세팅
			CommonUtil.getReturnCodeSuc(json);
			//저장후 페이지 이동
			json.put("goUrl", "/ordersheet/ordersheetList.do");
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
	
	@RequestMapping(value="/ordersheetUpdate")
	public ModelAndView ordersheetUpdate(@ModelAttribute UploadSheetDto uploadSheetDto, HttpServletRequest request, HttpServletResponse response, HttpSession session){
		ModelAndView mav = new ModelAndView();
		JSONObject json = new JSONObject();
		mav.setViewName("jsonView");
		CommonUtil.getReturnCodeFail(json);
		
		try {
			
			//사용자정보
			CommonUtil.setUpUserInfo(request, uploadSheetDto);
			json = ordersheetService.ordersheetUpdate(uploadSheetDto, request);
			//저장 성공시 코드값 세팅
			CommonUtil.getReturnCodeSuc(json);
			//저장후 페이지 이동
//			json.put("goUrl", "/ordersheet/detail.do?board_id="+uploadSheetDto.getBoard_id() + "&board_gbn=" + uploadSheetDto.getBoard_gbn());
			json.put("goUrl", "/ordersheet/ordersheetList.do");
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
	
	@RequestMapping(value="/ordersheetDelete")
	@ResponseBody
	public ModelAndView ordersheetDelete(@ModelAttribute UploadSheetDto uploadSheetDto, HttpServletRequest request, HttpServletResponse response, HttpSession session){
		JSONObject json = new JSONObject();
		ModelAndView mav = new ModelAndView();
		mav.setViewName("jsonView");
		try {
			//사용자정보
			CommonUtil.setUpUserInfo(request, uploadSheetDto);			
			json = ordersheetService.ordersheetDelete(uploadSheetDto, request);
			CommonUtil.getReturnCodeSuc(json);
			json.put("goUrl", "/ordersheet/ordersheetList.do");
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
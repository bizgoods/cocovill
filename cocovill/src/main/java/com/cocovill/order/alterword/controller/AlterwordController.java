package com.cocovill.order.alterword.controller;

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

import com.cocovill.order.alterword.service.AlterwordService;
import com.cocovill.order.common.BaseController;
import com.cocovill.order.dto.AlterwordDto;
import com.cocovill.order.utils.CommonUtil;
import com.cocovill.order.utils.PagingView;

import net.sf.json.JSONObject;


@Controller
@RequestMapping(value="/alterword")
public class AlterwordController extends BaseController {

	private static final Logger logger = LoggerFactory.getLogger(AlterwordController.class);
	
	@Resource(name="alterwordService")
	private AlterwordService alterwordService;
	
	@RequestMapping(value="/alterwordList")
	public ModelAndView alterwordList(@ModelAttribute AlterwordDto alterwordDto, HttpServletRequest request, HttpServletResponse response, HttpSession session){
		ModelAndView mav = new ModelAndView();
		
		List<AlterwordDto> resultList = null;
		resultList = alterwordService.alterwordList(alterwordDto);
		
		if(resultList.size() > 0){
			//paging		
			AlterwordDto pg = resultList.get(0);
			PagingView pv = new PagingView(pg.getPageNum(), alterwordDto.getPageSize(), alterwordDto.getBlockSize(), pg.getTotCnt());
			mav.addObject("paging", pv.print());
			//paging		
		}
		
		logger.debug("alterwordDto:"+alterwordDto.toString());
		
		mav.addObject("paramDto", alterwordDto);
		mav.addObject("resultList", resultList);
		
		mav.setViewName("/alterword/alterwordList");
		
		return mav;
	}
	
	@RequestMapping(value="/alterwordDetail")
	public ModelAndView alterwordDetail(@ModelAttribute AlterwordDto alterwordDto, HttpServletRequest request, HttpServletResponse response, HttpSession session){
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/alterword/alterwordDetail");
		AlterwordDto result = null;
		
		try {
			//게시글정보
			result = alterwordService.alterwordDetail(alterwordDto);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		mav.addObject("paramDto", alterwordDto);
		mav.addObject("result", result);
		
		return mav;
	}
	
	@RequestMapping(value="/alterwordDetailLayer")
	@ResponseBody
	public ModelAndView alterwordDetailLayer(@ModelAttribute AlterwordDto alterwordDto, HttpServletRequest request, HttpServletResponse response, HttpSession session){
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/alterword/alterwordDetailLayer");
		AlterwordDto result = null;
		
		try {
			//게시글정보
			result = alterwordService.alterwordDetail(alterwordDto);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		mav.addObject("result", result);
		return mav;
	}
	
	@RequestMapping(value="/alterwordForm")
	public ModelAndView alterwordForm(@ModelAttribute AlterwordDto alterwordDto, HttpServletRequest request, HttpServletResponse response, HttpSession session){
		ModelAndView mav = new ModelAndView();
		
		mav.setViewName("/alterword/alterwordForm");
		
		AlterwordDto result = alterwordService.alterwordDetail(alterwordDto);
		
		mav.addObject("paramDto", alterwordDto);
		mav.addObject("result", result);
		return mav;
	}	
	
	@RequestMapping(value="/alterwordInsert")
	public ModelAndView alterwordInsert(@ModelAttribute AlterwordDto alterwordDto, HttpServletRequest request, HttpServletResponse response, HttpSession session){
		ModelAndView mav = new ModelAndView();
		JSONObject json = new JSONObject();
		mav.setViewName("jsonView");
		CommonUtil.getReturnCodeFail(json);
		
		try {
			//사용자정보
			CommonUtil.setInUserInfo(request, alterwordDto);		
			CommonUtil.setUpUserInfo(request, alterwordDto);
			json = alterwordService.alterwordInsert(alterwordDto, request);
			//저장 성공시 코드값 세팅
			CommonUtil.getReturnCodeSuc(json);
			//저장후 페이지 이동
			json.put("goUrl", "/alterword/alterwordList.do");
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
	
	@RequestMapping(value="/alterwordUpdate")
	public ModelAndView alterwordUpdate(@ModelAttribute AlterwordDto alterwordDto, HttpServletRequest request, HttpServletResponse response, HttpSession session){
		ModelAndView mav = new ModelAndView();
		JSONObject json = new JSONObject();
		mav.setViewName("jsonView");
		CommonUtil.getReturnCodeFail(json);
		
		try {
			
			//사용자정보
			CommonUtil.setUpUserInfo(request, alterwordDto);
			json = alterwordService.alterwordUpdate(alterwordDto, request);
			//저장 성공시 코드값 세팅
			CommonUtil.getReturnCodeSuc(json);
			//저장후 페이지 이동
//			json.put("goUrl", "/alterword/detail.do?board_id="+alterwordDto.getBoard_id() + "&board_gbn=" + alterwordDto.getBoard_gbn());
			json.put("goUrl", "/alterword/alterwordList.do");
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
	
	@RequestMapping(value="/alterwordDelete")
	@ResponseBody
	public ModelAndView alterwordDelete(@ModelAttribute AlterwordDto alterwordDto, HttpServletRequest request, HttpServletResponse response, HttpSession session){
		JSONObject json = new JSONObject();
		ModelAndView mav = new ModelAndView();
		mav.setViewName("jsonView");
		try {
			//사용자정보
			CommonUtil.setUpUserInfo(request, alterwordDto);			
			json = alterwordService.alterwordDelete(alterwordDto, request);
			CommonUtil.getReturnCodeSuc(json);
			json.put("goUrl", "/alterword/alterwordList.do");
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
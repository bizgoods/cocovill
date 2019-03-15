package com.cocovill.order.ordersheet.service;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import com.cocovill.order.dto.UploadSheetDto;
import com.cocovill.order.ordersheet.dao.OrdersheetDAO;

import net.sf.json.JSONObject;


@Service("ordersheetService")
public class OrdersheetServiceImpl implements OrdersheetService{

	private static final Logger logger = LoggerFactory.getLogger(OrdersheetServiceImpl.class);
	
	@Resource(name="ordersheetDAO")
	private OrdersheetDAO ordersheetDAO;

	@Value("#{config['TABLESC']}") String TABLESC;
	@Value("#{config['TABLE_T_BOOTSTRAP']}") String TABLE_T_BOOTSTRAP;
	
	@Override
	public List<UploadSheetDto> ordersheetList(UploadSheetDto uploadSheetDto){
		return ordersheetDAO.ordersheetList(uploadSheetDto);
	}
	
	@Override
	public JSONObject ordersheetListHwakjeong(UploadSheetDto uploadSheetDto){
		JSONObject json = new JSONObject();
		ordersheetDAO.ordersheetListHwakjeong(uploadSheetDto);
		return json;
	}
	
	@Override
	public JSONObject ordersheetListDelete(UploadSheetDto uploadSheetDto){
		JSONObject json = new JSONObject();
		ordersheetDAO.ordersheetListDelete(uploadSheetDto);
		return json;
	}
	
	@Override
	public List<UploadSheetDto> ordersheetDetailList(UploadSheetDto uploadSheetDto){
		return ordersheetDAO.ordersheetDetailList(uploadSheetDto);
	}
	
	@Override
	public JSONObject ordersheetInsertGift(UploadSheetDto uploadSheetDto, HttpServletRequest request){
		JSONObject json = new JSONObject();
		ordersheetDAO.ordersheetInsertGift(uploadSheetDto);
		return json;
	}
	
	@Override
	public JSONObject ordersheetUpdateGift(UploadSheetDto uploadSheetDto, HttpServletRequest request){
		JSONObject json = new JSONObject();
		ordersheetDAO.ordersheetUpdateGift(uploadSheetDto);
		return json;
	}
	
	@Override
	public JSONObject ordersheetDeleteGift(UploadSheetDto uploadSheetDto, HttpServletRequest request){
		JSONObject json = new JSONObject();
		ordersheetDAO.ordersheetDeleteGift(uploadSheetDto);
		return json;
	}
	
	
	
	
	
	
	
	
	@Override
	public UploadSheetDto ordersheetDetail(UploadSheetDto uploadSheetDto){
		return (UploadSheetDto) ordersheetDAO.ordersheetDetail(uploadSheetDto);
	}

	@Override
	public JSONObject ordersheetInsert(UploadSheetDto uploadSheetDto, HttpServletRequest request){

		JSONObject json = new JSONObject();
		
		String autoSeq = "";
		//BOARD autoincre 값 가져옴
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("tableSC", TABLESC);
		map.put("tableNM", TABLE_T_BOOTSTRAP);
		
		autoSeq = ordersheetDAO.getSeq(map);		
		ordersheetDAO.ordersheetInsert(uploadSheetDto);
		
		//화면단에 넘겨줌
		json.put("autoSeq", autoSeq);
		
		return json;
	}

	@Override
	public JSONObject ordersheetUpdate(UploadSheetDto uploadSheetDto, HttpServletRequest request){
		
		JSONObject json = new JSONObject();
		
		ordersheetDAO.ordersheetUpdate(uploadSheetDto);
		
		return json;
	}

	@Override
	public JSONObject ordersheetDelete(UploadSheetDto uploadSheetDto, HttpServletRequest request){
		JSONObject json = new JSONObject();
		
		ordersheetDAO.ordersheetDelete(uploadSheetDto);
		
		return json;
	}

	@Override
	public String getSeq(HashMap<String, String> map){
		return ordersheetDAO.getSeq(map);
	}

}

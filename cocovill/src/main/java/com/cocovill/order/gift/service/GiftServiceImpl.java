package com.cocovill.order.gift.service;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import com.cocovill.order.gift.dao.GiftDAO;
import com.cocovill.order.dto.GiftDto;

import net.sf.json.JSONObject;


@Service("giftService")
public class GiftServiceImpl implements GiftService{

	private static final Logger logger = LoggerFactory.getLogger(GiftServiceImpl.class);
	
	@Resource(name="giftDAO")
	private GiftDAO giftDAO;

	@Value("#{config['TABLESC']}") String TABLESC;
	@Value("#{config['TABLE_T_BOOTSTRAP']}") String TABLE_T_BOOTSTRAP;
	
	@Override
	public List<GiftDto> giftList(GiftDto giftDto){
		return giftDAO.giftList(giftDto);
	}
	
	@Override
	public GiftDto giftDetail(GiftDto giftDto){
		return (GiftDto) giftDAO.giftDetail(giftDto);
	}

	@Override
	public JSONObject giftInsert(GiftDto giftDto, HttpServletRequest request){

		JSONObject json = new JSONObject();
		
		String autoSeq = "";
		//BOARD autoincre 값 가져옴
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("tableSC", TABLESC);
		map.put("tableNM", TABLE_T_BOOTSTRAP);
		
		autoSeq = giftDAO.getSeq(map);		
		giftDAO.giftInsert(giftDto);
		
		//화면단에 넘겨줌
		json.put("autoSeq", autoSeq);
		
		return json;
	}

	@Override
	public JSONObject giftUpdate(GiftDto giftDto, HttpServletRequest request){
		
		JSONObject json = new JSONObject();
		
		giftDAO.giftUpdate(giftDto);
		
		return json;
	}

	@Override
	public JSONObject giftDelete(GiftDto giftDto, HttpServletRequest request){
		JSONObject json = new JSONObject();
		
		giftDAO.giftDelete(giftDto);
		
		return json;
	}

	@Override
	public String getSeq(HashMap<String, String> map){
		return giftDAO.getSeq(map);
	}

	@Override
	public List<GiftDto> giftAllList() {
		return giftDAO.giftAllList();
	}

}

package com.cocovill.order.alterword.service;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import com.cocovill.order.alterword.dao.AlterwordDAO;
import com.cocovill.order.dto.AlterwordDto;

import net.sf.json.JSONObject;


@Service("alterwordService")
public class AlterwordServiceImpl implements AlterwordService{

	private static final Logger logger = LoggerFactory.getLogger(AlterwordServiceImpl.class);
	
	@Resource(name="alterwordDAO")
	private AlterwordDAO alterwordDAO;

	@Value("#{config['TABLESC']}") String TABLESC;
	@Value("#{config['TABLE_T_BOOTSTRAP']}") String TABLE_T_BOOTSTRAP;
	
	@Override
	public List<AlterwordDto> alterwordList(AlterwordDto alterwordDto){
		return alterwordDAO.alterwordList(alterwordDto);
	}
	
	@Override
	public AlterwordDto alterwordDetail(AlterwordDto alterwordDto){
		return (AlterwordDto) alterwordDAO.alterwordDetail(alterwordDto);
	}

	@Override
	public JSONObject alterwordInsert(AlterwordDto alterwordDto, HttpServletRequest request){

		JSONObject json = new JSONObject();
		
		String autoSeq = "";
		//BOARD autoincre 값 가져옴
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("tableSC", TABLESC);
		map.put("tableNM", TABLE_T_BOOTSTRAP);
		
		autoSeq = alterwordDAO.getSeq(map);		
		alterwordDAO.alterwordInsert(alterwordDto);
		
		//화면단에 넘겨줌
		json.put("autoSeq", autoSeq);
		
		return json;
	}

	@Override
	public JSONObject alterwordUpdate(AlterwordDto alterwordDto, HttpServletRequest request){
		
		JSONObject json = new JSONObject();
		
		alterwordDAO.alterwordUpdate(alterwordDto);
		
		return json;
	}

	@Override
	public JSONObject alterwordDelete(AlterwordDto alterwordDto, HttpServletRequest request){
		JSONObject json = new JSONObject();
		
		alterwordDAO.alterwordDelete(alterwordDto);
		
		return json;
	}

	@Override
	public String getSeq(HashMap<String, String> map){
		return alterwordDAO.getSeq(map);
	}

}

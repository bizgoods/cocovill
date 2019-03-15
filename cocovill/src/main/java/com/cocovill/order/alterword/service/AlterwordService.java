package com.cocovill.order.alterword.service;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.cocovill.order.dto.AlterwordDto;

import net.sf.json.JSONObject;



public interface AlterwordService {
	
	public List<AlterwordDto> alterwordList(AlterwordDto alterwordDto);
	public AlterwordDto alterwordDetail(AlterwordDto alterwordDto);
	public JSONObject alterwordInsert(AlterwordDto alterwordDto, HttpServletRequest request);
	public JSONObject alterwordUpdate(AlterwordDto alterwordDto, HttpServletRequest request);
	public JSONObject alterwordDelete(AlterwordDto alterwordDto, HttpServletRequest request);
	public String getSeq(HashMap<String, String> map);
	
}

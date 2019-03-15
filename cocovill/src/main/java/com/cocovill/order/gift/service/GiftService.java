package com.cocovill.order.gift.service;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.cocovill.order.dto.GiftDto;

import net.sf.json.JSONObject;



public interface GiftService {
	
	public List<GiftDto> giftList(GiftDto giftDto);
	public GiftDto giftDetail(GiftDto giftDto);
	public JSONObject giftInsert(GiftDto giftDto, HttpServletRequest request);
	public JSONObject giftUpdate(GiftDto giftDto, HttpServletRequest request);
	public JSONObject giftDelete(GiftDto giftDto, HttpServletRequest request);
	public String getSeq(HashMap<String, String> map);
	public List<GiftDto> giftAllList();
	
}

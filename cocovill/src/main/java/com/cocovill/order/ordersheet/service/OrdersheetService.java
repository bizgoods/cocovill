package com.cocovill.order.ordersheet.service;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.cocovill.order.dto.UploadSheetDto;

import net.sf.json.JSONObject;



public interface OrdersheetService {
	
	public List<UploadSheetDto> ordersheetList(UploadSheetDto uploadSheetDto);
	public JSONObject ordersheetListHwakjeong(UploadSheetDto uploadSheetDto);
	public JSONObject ordersheetListDelete(UploadSheetDto uploadSheetDto);
	public List<UploadSheetDto> ordersheetDetailList(UploadSheetDto uploadSheetDto);
	public JSONObject ordersheetInsertGift(UploadSheetDto uploadSheetDto, HttpServletRequest request);
	public JSONObject ordersheetUpdateGift(UploadSheetDto uploadSheetDto, HttpServletRequest request);
	public JSONObject ordersheetDeleteGift(UploadSheetDto uploadSheetDto, HttpServletRequest request);
	
	
	public UploadSheetDto ordersheetDetail(UploadSheetDto uploadSheetDto);
	public JSONObject ordersheetInsert(UploadSheetDto uploadSheetDto, HttpServletRequest request);
	public JSONObject ordersheetUpdate(UploadSheetDto uploadSheetDto, HttpServletRequest request);
	public JSONObject ordersheetDelete(UploadSheetDto uploadSheetDto, HttpServletRequest request);
	public String getSeq(HashMap<String, String> map);
	
}

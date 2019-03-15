package com.cocovill.order.ordersheet.dao;

import java.util.HashMap;
import java.util.List;

import org.springframework.stereotype.Repository;

import com.cocovill.order.common.AbstractDAO;
import com.cocovill.order.dto.UploadSheetDto;


@Repository("ordersheetDAO")
public class OrdersheetDAO extends AbstractDAO{

	@SuppressWarnings("unchecked")
	public List<UploadSheetDto> ordersheetList(UploadSheetDto uploadSheetDto){
		return (List<UploadSheetDto>)selectList("ordersheet.ordersheetList", uploadSheetDto);
	}
	
	public void ordersheetListHwakjeong(UploadSheetDto uploadSheetDto){
		update("ordersheet.ordersheetListHwakjeong", uploadSheetDto);
	}
	
	public void ordersheetListDelete(UploadSheetDto uploadSheetDto){
		delete("ordersheet.ordersheetListDelete", uploadSheetDto);
	}
	
	@SuppressWarnings("unchecked")
	public List<UploadSheetDto> ordersheetDetailList(UploadSheetDto uploadSheetDto){
		return (List<UploadSheetDto>)selectList("ordersheet.ordersheetDetailList", uploadSheetDto);
	}
	
	public void ordersheetInsertGift(UploadSheetDto uploadSheetDto){
		insert("ordersheet.ordersheetInsertGift", uploadSheetDto);
	}
	
	public void ordersheetUpdateGift(UploadSheetDto uploadSheetDto){
		insert("ordersheet.ordersheetUpdateGift", uploadSheetDto);
	}
	
	public void ordersheetDeleteGift(UploadSheetDto uploadSheetDto){
		insert("ordersheet.ordersheetDeleteGift", uploadSheetDto);
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	public UploadSheetDto ordersheetDetail(UploadSheetDto uploadSheetDto){
		return (UploadSheetDto) selectOne("ordersheet.ordersheetDetail", uploadSheetDto);
	}

	public void ordersheetInsert(UploadSheetDto uploadSheetDto){
		insert("ordersheet.ordersheetInsert", uploadSheetDto);
	}

	public void ordersheetUpdate(UploadSheetDto uploadSheetDto){
		update("ordersheet.ordersheetUpdate", uploadSheetDto);
	}

	public void ordersheetDelete(UploadSheetDto uploadSheetDto){
		update("ordersheet.ordersheetDelete", uploadSheetDto);
	}
	
	public String getSeq(HashMap<String, String> map){
		return (String) selectOne("ordersheet.autoSeq", map);
	}
	
}

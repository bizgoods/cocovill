package com.cocovill.order.uploadSheet.service;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.cocovill.order.dto.UploadSheetDto;
import com.cocovill.order.uploadSheet.dao.UploadSheetDAO;
import com.cocovill.order.utils.CommonUtil;

import net.sf.json.JSONObject;


@Service("uploadSheetService")
@Transactional
public class UploadSheetServiceImpl implements UploadSheetService{

	private static final Logger logger = LoggerFactory.getLogger(UploadSheetServiceImpl.class);
	
	@Resource(name="uploadSheetDAO")
	private UploadSheetDAO uploadSheetDAO;

	@Override
	public String uploadSheetSelectOrderGroup(){
		return (String) uploadSheetDAO.uploadSheetSelectOrderGroup();
	}
	
	@Override
	public List<UploadSheetDto> uploadSheetList(UploadSheetDto uploadSheetDto){
		return uploadSheetDAO.uploadSheetList(uploadSheetDto);
	}
	
	@Override
	public UploadSheetDto uploadSheetDetail(UploadSheetDto uploadSheetDto){
		return (UploadSheetDto) uploadSheetDAO.uploadSheetDetail(uploadSheetDto);
	}

	@Override
	public JSONObject uploadSheetInsert(UploadSheetDto uploadSheetDto, HttpServletRequest request){
		JSONObject json = new JSONObject();
		uploadSheetDAO.uploadSheetInsert(uploadSheetDto);
		return json;
	}

	@Override
	public JSONObject uploadSheetUpdate(UploadSheetDto uploadSheetDto, HttpServletRequest request){
		
		JSONObject json = new JSONObject();
		
		uploadSheetDAO.uploadSheetUpdate(uploadSheetDto);
		
		return json;
	}

	@Override
	public JSONObject uploadSheetDelete(UploadSheetDto uploadSheetDto, HttpServletRequest request){
		JSONObject json = new JSONObject();
		
		uploadSheetDAO.uploadSheetDelete(uploadSheetDto);
		
		return json;
	}

	@Override
	public String getSeq(HashMap<String, String> map){
		return uploadSheetDAO.getSeq(map);
	}

	@Override
	public JSONObject uploadSheetInserts(List<UploadSheetDto> uploadSheetDtoList, HttpServletRequest request) {
		JSONObject json = new JSONObject();
		
		String uploadsheet_group = uploadSheetDAO.uploadSheetSelectOrderGroup();
		for(UploadSheetDto uploadSheetDto : uploadSheetDtoList) {
			logger.info(uploadSheetDto.getSunseo());
			//사용자정보
			CommonUtil.setInUserInfo(request, uploadSheetDto);
			uploadSheetDto.setUploadsheet_group(uploadsheet_group);
			uploadSheetDAO.uploadSheetInsert(uploadSheetDto);
		}
		
		return json;
	}

}

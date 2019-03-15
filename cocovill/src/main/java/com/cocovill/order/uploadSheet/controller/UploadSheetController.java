package com.cocovill.order.uploadSheet.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.cocovill.order.common.BaseController;
import com.cocovill.order.dto.UploadSheetDto;
import com.cocovill.order.uploadSheet.service.UploadSheetService;
import com.cocovill.order.utils.CommonUtil;
import com.cocovill.order.utils.excel.ExcelRead;
import com.cocovill.order.utils.excel.ExcelReadOption;

import net.sf.json.JSONObject;

@Controller
@RequestMapping(value="/uploadSheet")
public class UploadSheetController extends BaseController{

	private static final Logger logger = LoggerFactory.getLogger(UploadSheetController.class);
	
	@Value("#{config['SITE_SABANG']}") String SITE_SABANG;
	@Value("#{config['SITE_DAIET']}") String SITE_DAIET;
	@Value("#{config['SITE_FOOD']}") String SITE_FOOD;
	@Value("#{config['SITE_DOSIRAK']}") String SITE_DOSIRAK;
	@Value("#{config['SITE_POST']}") String SITE_POST;
	@Value("#{config['SITE_EJE']}") String SITE_EJE;
	@Value("#{config['SITE_PINK']}") String SITE_PINK;
	@Value("#{config['SITE_SPO']}") String SITE_SPO;
	@Value("#{config['SITE_FUN']}") String SITE_FUN;
	@Value("#{config['SITE_FRESH']}") String SITE_FRESH;
	@Value("#{config['SITE_FITN']}") String SITE_FITN;
	@Value("#{config['SITE_THENE']}") String SITE_THENE;
	@Value("#{config['SITE_MONSTER']}") String SITE_MONSTER;
	@Value("#{config['SITE_THIS']}") String SITE_THIS;
	@Value("#{config['SITE_RNR']}") String SITE_RNR;
	@Value("#{config['SITE_NAMSEON']}") String SITE_NAMSEON;
	@Value("#{config['SITE_KAKAO']}") String SITE_KAKAO;
	@Value("#{config['SITE_SELF']}") String SITE_SELF;
	
	
	
	@Resource(name="uploadSheetService")
	private UploadSheetService uploadSheetService;
	
	@RequestMapping(value = "/uploadSheetList")
	public ModelAndView excelUpload(HttpServletRequest request, HttpServletResponse response, HttpSession session) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/uploadSheet/uploadSheetList");
		return mav;
	}
	
	@ResponseBody
	@RequestMapping(value = "/excelUploadAjax", method = RequestMethod.POST)
	public ModelAndView excelUploadAjax(MultipartHttpServletRequest request) throws Exception {
		MultipartFile excelFile = request.getFile("excelFile");
		String uploadsheet_site = request.getParameter("uploadsheet_site");
		int startRow = 1;
		System.out.println("엑셀 파일 업로드 컨트롤러");
		
		String viewName = "";
		if(uploadsheet_site.equalsIgnoreCase(SITE_SABANG)) {
			startRow = 2;
			viewName = "/uploadSheet/dataView/sabangView";
		}else if(uploadsheet_site.equalsIgnoreCase(SITE_DAIET)) {
			startRow = 5;
			viewName = "/uploadSheet/dataView/daietView";
		}else if(uploadsheet_site.equalsIgnoreCase(SITE_FOOD)) {
			startRow = 3;
			viewName = "/uploadSheet/dataView/foodView";
		}else if(uploadsheet_site.equalsIgnoreCase(SITE_DOSIRAK)) {
			startRow = 2;
			viewName = "/uploadSheet/dataView/dosirakView";
		}else if(uploadsheet_site.equalsIgnoreCase(SITE_POST)) {
			startRow = 3;
			viewName = "/uploadSheet/dataView/postView";
		}else if(uploadsheet_site.equalsIgnoreCase(SITE_EJE)) {
			startRow = 2;
			viewName = "/uploadSheet/dataView/ejeView";
		}else if(uploadsheet_site.equalsIgnoreCase(SITE_PINK)) {
			startRow = 2;
			viewName = "/uploadSheet/dataView/pinkView";
		}else if(uploadsheet_site.equalsIgnoreCase(SITE_SPO)) {
			startRow = 2;
			viewName = "/uploadSheet/dataView/spoView";
		}else if(uploadsheet_site.equalsIgnoreCase(SITE_FUN)) {
			startRow = 2;
			viewName = "/uploadSheet/dataView/funView";
		}else if(uploadsheet_site.equalsIgnoreCase(SITE_FRESH)) {
			startRow = 2;
			viewName = "/uploadSheet/dataView/freshView";
		}else if(uploadsheet_site.equalsIgnoreCase(SITE_FITN)) {
			startRow = 4;
			viewName = "/uploadSheet/dataView/fitnView";
		}else if(uploadsheet_site.equalsIgnoreCase(SITE_THENE)) {
			startRow = 3;
			viewName = "/uploadSheet/dataView/theneView";
		}else if(uploadsheet_site.equalsIgnoreCase(SITE_MONSTER)) {
			startRow = 2;
			viewName = "/uploadSheet/dataView/monsterView";
		}else if(uploadsheet_site.equalsIgnoreCase(SITE_THIS)) {
			startRow = 6;
			viewName = "/uploadSheet/dataView/thisView";
		}else if(uploadsheet_site.equalsIgnoreCase(SITE_RNR)) {
			startRow = 4;
			viewName = "/uploadSheet/dataView/rnrView";
		}else if(uploadsheet_site.equalsIgnoreCase(SITE_NAMSEON)) {
			startRow = 2;
			viewName = "/uploadSheet/dataView/namseonView";
		}else if(uploadsheet_site.equalsIgnoreCase(SITE_KAKAO)) {
			startRow = 2;
			viewName = "/uploadSheet/dataView/kakaoView";
		}else if(uploadsheet_site.equalsIgnoreCase(SITE_SELF)) {
			startRow = 2;
			viewName = "/uploadSheet/dataView/selfView";
		}else {
			viewName = "/uploadSheet/dataView/sabangView";
		}
		
		
		
		if (excelFile == null || excelFile.isEmpty()) {
			throw new RuntimeException("엑셀파일을 선택 해 주세요.");
		}

		File destFile = new File("D:\\" + excelFile.getOriginalFilename());
		try {
			excelFile.transferTo(destFile);
		} catch (IllegalStateException | IOException e) {
			throw new RuntimeException(e.getMessage(), e);
		}

		// Service 단에서 가져온 코드
		ExcelReadOption excelReadOption = new ExcelReadOption();
		excelReadOption.setFilePath(destFile.getAbsolutePath());
		excelReadOption.setOutputColumns("A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z", "AA", "AB", "AC", "AD", "AE", "AF", "AG", "AH", "AI");
		excelReadOption.setStartRow(startRow);

		List<Map<String, String>> excelContent = ExcelRead.read(excelReadOption);

		for (Map<String, String> article : excelContent) {
			System.out.println(article.get("A") + "\t" + article.get("B") + "\t" + article.get("C") + "\t" + article.get("D") + "\t" + article.get("E") + "\t" + article.get("F")+ "\t" + article.get("G")+ "\t" + article.get("H")+ "\t" + article.get("I")+ "\t" + article.get("J")+ "\t" + article.get("K")+ "\t" + article.get("L")+ "\t" + article.get("M")+ "\t" + article.get("N")+ "\t" + article.get("O")+ "\t" + article.get("P")+ "\t" + article.get("Q")+ "\t" + article.get("R")+ "\t" + article.get("S")+ "\t" + article.get("T")+ "\t" + article.get("U")+ "\t" + article.get("V")+ "\t" + article.get("W")+ "\t" + article.get("X")+ "\t" + article.get("Y")+ "\t" + article.get("Z")+ "\t" + article.get("AA")+ "\t" + article.get("AB")+ "\t" + article.get("AC")+ "\t" + article.get("AD")+ "\t" + article.get("AE")+ "\t" + article.get("AF")+ "\t" + article.get("AG")+ "\t" + article.get("AH")+ "\t" + article.get("AI"));
		}

		// userService.excelUpload(destFile); //서비스 부분을 삭제한다.

		// FileUtils.forceDelete(destFile.getAbsolutePath());

		ModelAndView mav = new ModelAndView();
		mav.addObject("uploadsheet_site", uploadsheet_site);
		
		mav.setViewName(viewName);
		mav.addObject("resultList", excelContent);
		return mav;
	}
	
	
	@RequestMapping(value="/uploadSheetInsert")
	public ModelAndView uploadSheetInsert(@RequestBody List<UploadSheetDto> uploadSheetDtoList, HttpServletRequest request, HttpServletResponse response, HttpSession session){
		ModelAndView mav = new ModelAndView();
		JSONObject json = new JSONObject();
		mav.setViewName("jsonView");
		CommonUtil.getReturnCodeFail(json);
		
		try {
			logger.info("uploadSheetDtoList.size:"+uploadSheetDtoList.size());
			
			if(uploadSheetDtoList.size() > 0) {
				String getOrderGroup = uploadSheetService.uploadSheetSelectOrderGroup();
				logger.info("NNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNN");
				logger.info(getOrderGroup);
				logger.info("NNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNN");
				
//				for(UploadSheetDto uploadSheetDto : uploadSheetDtoList) {
//					logger.info(uploadSheetDto.getSunseo());
//					//사용자정보
//					CommonUtil.setInUserInfo(request, uploadSheetDto);
//					uploadSheetDto.setOrder_group(getOrderGroup);
//					uploadSheetService.uploadSheetInsert(uploadSheetDto, request);
//				}
				
				uploadSheetService.uploadSheetInserts(uploadSheetDtoList, request);
				
				//저장 성공시 코드값 세팅
				CommonUtil.getReturnCodeSuc(json);
				//저장후 페이지 이동
				json.put("goUrl", "/ordersheet/ordersheetList.do");
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
	
}
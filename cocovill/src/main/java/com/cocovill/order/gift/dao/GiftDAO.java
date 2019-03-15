package com.cocovill.order.gift.dao;

import java.util.HashMap;
import java.util.List;

import org.springframework.stereotype.Repository;

import com.cocovill.order.common.AbstractDAO;
import com.cocovill.order.dto.GiftDto;


@Repository("giftDAO")
public class GiftDAO extends AbstractDAO{

	@SuppressWarnings("unchecked")
	public List<GiftDto> giftList(GiftDto giftDto){
		return (List<GiftDto>)selectList("gift.giftList", giftDto);
	}
	
	public GiftDto giftDetail(GiftDto giftDto){
		return (GiftDto) selectOne("gift.giftDetail", giftDto);
	}

	public void giftInsert(GiftDto giftDto){
		insert("gift.giftInsert", giftDto);
	}

	public void giftUpdate(GiftDto giftDto){
		update("gift.giftUpdate", giftDto);
	}

	public void giftDelete(GiftDto giftDto){
		update("gift.giftDelete", giftDto);
	}
	
	public String getSeq(HashMap<String, String> map){
		return (String) selectOne("gift.autoSeq", map);
	}
	
	@SuppressWarnings("unchecked")
	public List<GiftDto> giftAllList(){
		return (List<GiftDto>)selectList("gift.giftAllList");
	}
	
}

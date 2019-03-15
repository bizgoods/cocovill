package com.cocovill.order.alterword.dao;

import java.util.HashMap;
import java.util.List;

import org.springframework.stereotype.Repository;

import com.cocovill.order.common.AbstractDAO;
import com.cocovill.order.dto.AlterwordDto;


@Repository("alterwordDAO")
public class AlterwordDAO extends AbstractDAO{

	@SuppressWarnings("unchecked")
	public List<AlterwordDto> alterwordList(AlterwordDto alterwordDto){
		return (List<AlterwordDto>)selectList("alterword.alterwordList", alterwordDto);
	}
	
	public AlterwordDto alterwordDetail(AlterwordDto alterwordDto){
		return (AlterwordDto) selectOne("alterword.alterwordDetail", alterwordDto);
	}

	public void alterwordInsert(AlterwordDto alterwordDto){
		insert("alterword.alterwordInsert", alterwordDto);
	}

	public void alterwordUpdate(AlterwordDto alterwordDto){
		update("alterword.alterwordUpdate", alterwordDto);
	}

	public void alterwordDelete(AlterwordDto alterwordDto){
		update("alterword.alterwordDelete", alterwordDto);
	}
	
	public String getSeq(HashMap<String, String> map){
		return (String) selectOne("alterword.autoSeq", map);
	}
	
}

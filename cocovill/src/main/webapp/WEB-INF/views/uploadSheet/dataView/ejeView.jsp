<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@include file="/WEB-INF/views/include/taglibs.jsp"%>

<c:forEach items="${resultList }" var="result" varStatus="status">
	<tr>
		<td><input type="hidden" name="uploadsheet_site" value="${uploadsheet_site }" />${uploadsheet_site }</td>
		<td><input type="hidden" name="sunseo" value="${result.A }" />${result.A }</td>
		<td><input type="hidden" name="mall_name" value="" /></td>
		<td><input type="hidden" name="jumun_date" value="" /></td>
		<td><input type="hidden" name="sujip_date" value="" /></td>
		<td><input type="hidden" name="sabang_sang_code" value="" /></td>
		<td><input type="hidden" name="sabang_jumun_num" value="${result.E }" />${result.E }</td>
		<td><input type="hidden" name="sujip_sang_name" value="${result.K }" />${result.K }</td>
		<td><input type="hidden" name="sujip_option" value="${result.L }" />${result.L }</td>
		<td><input type="hidden" name="hwak_sang_name" value="" /></td>
		<td><input type="hidden" name="hwak_option" value="" /></td>
		<td><input type="hidden" name="sang_yak" value="" /></td>
		<td><input type="hidden" name="option_nick" value="" /></td>
		<td><input type="hidden" name="suryang" value="${result.R }" />${result.R }</td>
		<td><input type="hidden" name="hwak_suryang" value="" /></td>
		<td><input type="hidden" name="jumun_name" value="${result.O }" />${result.O }</td>
		<td><input type="hidden" name="jumun_tel1" value="" /></td>
		<td><input type="hidden" name="jumun_tel2" value="${result.Q }" />${result.Q }</td>
		<td><input type="hidden" name="suchwi_name" value="${result.AC }" />${result.AC }</td>
		<td><input type="hidden" name="suchwi_tel1" value="${result.AD }" />${result.AD }</td>
		<td><input type="hidden" name="suchwi_tel2" value="${result.AE }" />${result.AE }</td>
		<td><input type="hidden" name="suchwi_zip" value="${result.AF }" />${result.AF }</td>
		<td><input type="hidden" name="suchwi_address" value="${result.AG }" />${result.AG }</td>
		<td><input type="hidden" name="beasong_message" value="${result.AH }" />${result.AH }</td>
		<td><input type="hidden" name="beasong_gubun" value="" /></td>
		<td><input type="hidden" name="beasong_pay" value="" /></td>
		<td><input type="hidden" name="panmae_price" value="${result.W }" />${result.W }</td>
		<td><input type="hidden" name="gongeup_price" value="${result.S }" />${result.S }</td>
		<td><input type="hidden" name="gyeolje_price" value="" /></td>
		<td><input type="hidden" name="taekbaesa" value="${result.AA }" />${result.AA }</td>
		<td><input type="hidden" name="songjang_num" value="${result.AB }" />${result.AB }</td>
	</tr>
</c:forEach>
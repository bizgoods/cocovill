<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@include file="/WEB-INF/views/include/taglibs.jsp"%>

<c:forEach items="${resultList }" var="result" varStatus="status">
	<tr>
		<td><input type="hidden" name="uploadsheet_site" value="${uploadsheet_site }" />${uploadsheet_site }</td>
		<td><input type="hidden" name="sunseo" value="${status.index + 1}" />${status.index + 1}</td>
		<td><input type="hidden" name="mall_name" value="${result. }" />${result. }</td>
		<td><input type="hidden" name="jumun_date" value="${result. }" />${result. }</td>
		<td><input type="hidden" name="sujip_date" value="${result. }" />${result. }</td>
		<td><input type="hidden" name="sabang_sang_code" value="${result. }" />${result. }</td>
		<td><input type="hidden" name="sabang_jumun_num" value="${result. }" />${result. }</td>
		<td><input type="hidden" name="sujip_sang_name" value="${result. }" />${result. }</td>
		<td><input type="hidden" name="sujip_option" value="${result. }" />${result. }</td>
		<td><input type="hidden" name="hwak_sang_name" value="${result. }" />${result. }</td>
		<td><input type="hidden" name="hwak_option" value="${result. }" />${result. }</td>
		<td><input type="hidden" name="sang_yak" value="${result. }" />${result. }</td>
		<td><input type="hidden" name="option_nick" value="${result. }" />${result. }</td>
		<td><input type="hidden" name="suryang" value="${result. }" />${result. }</td>
		<td><input type="hidden" name="hwak_suryang" value="${result. }" />${result. }</td>
		<td><input type="hidden" name="jumun_name" value="${result. }" />${result. }</td>
		<td><input type="hidden" name="jumun_tel1" value="${result. }" />${result. }</td>
		<td><input type="hidden" name="jumun_tel2" value="${result. }" />${result. }</td>
		<td><input type="hidden" name="suchwi_name" value="${result. }" />${result. }</td>
		<td><input type="hidden" name="suchwi_tel1" value="${result. }" />${result. }</td>
		<td><input type="hidden" name="suchwi_tel2" value="${result. }" />${result. }</td>
		<td><input type="hidden" name="suchwi_zip" value="${result. }" />${result. }</td>
		<td><input type="hidden" name="suchwi_address" value="${result. }" />${result. }</td>
		<td><input type="hidden" name="beasong_message" value="${result. }" />${result. }</td>
		<td><input type="hidden" name="beasong_gubun" value="${result. }" />${result. }</td>
		<td><input type="hidden" name="beasong_pay" value="${result. }" />${result. }</td>
		<td><input type="hidden" name="panmae_price" value="${result. }" />${result. }</td>
		<td><input type="hidden" name="gongeup_price" value="${result. }" />${result. }</td>
		<td><input type="hidden" name="gyeolje_price" value="${result. }" />${result. }</td>
		<td><input type="hidden" name="taekbaesa" value="${result. }" />${result. }</td>
		<td><input type="hidden" name="songjang_num" value="${result. }" />${result. }</td>
	</tr>
</c:forEach>
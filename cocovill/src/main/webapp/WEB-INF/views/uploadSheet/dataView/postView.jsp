<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@include file="/WEB-INF/views/include/taglibs.jsp"%>

<c:forEach items="${resultList }" var="result" varStatus="status">
	<tr>
		<td><input type="hidden" name="uploadsheet_site" value="${uploadsheet_site }" />${uploadsheet_site }</td>
		<td><input type="hidden" name="sunseo" value="${status.index + 1}" />${status.index + 1}</td>
		<td><input type="hidden" name="mall_name" value="" /></td>
		<td><input type="hidden" name="jumun_date" value="${result.C }" />${result.C }</td>
		<td><input type="hidden" name="sujip_date" value="" /></td>
		<td><input type="hidden" name="sabang_sang_code" value="" /></td>
		<td><input type="hidden" name="sabang_jumun_num" value="${result.A }" />${result.A }</td>
		<td><input type="hidden" name="sujip_sang_name" value="${result.F }" />${result.F }</td>
		<td><input type="hidden" name="sujip_option" value="" /></td>
		<td><input type="hidden" name="hwak_sang_name" value="" /></td>
		<td><input type="hidden" name="hwak_option" value="" /></td>
		<td><input type="hidden" name="sang_yak" value="" /></td>
		<td><input type="hidden" name="option_nick" value="" /></td>
		<td><input type="hidden" name="suryang" value="${result.G }" />${result.G }</td>
		<td><input type="hidden" name="hwak_suryang" value="" /></td>
		<td><input type="hidden" name="jumun_name" value="${result.N }" />${result.N }</td>
		<td><input type="hidden" name="jumun_tel1" value="${result.Q }" />${result.Q }</td>
		<td><input type="hidden" name="jumun_tel2" value="${result.R }" />${result.R }</td>
		<td><input type="hidden" name="suchwi_name" value="${result.S }" />${result.S }</td>
		<td><input type="hidden" name="suchwi_tel1" value="${result.V }" />${result.V }</td>
		<td><input type="hidden" name="suchwi_tel2" value="${result.W }" />${result.W }</td>
		<td><input type="hidden" name="suchwi_zip" value="${result.T }" />${result.T }</td>
		<td><input type="hidden" name="suchwi_address" value="${result.U }" />${result.U }</td>
		<td><input type="hidden" name="beasong_message" value="${result.X }" />${result.X }</td>
		<td><input type="hidden" name="beasong_gubun" value="" /></td>
		<td><input type="hidden" name="beasong_pay" value="${result.AB }" />${result.AB }</td>
		<td><input type="hidden" name="panmae_price" value="${result.L }" />${result.L }</td>
		<td><input type="hidden" name="gongeup_price" value="${result.Z }" />${result.Z }</td>
		<td><input type="hidden" name="gyeolje_price" value="${result.AC }" />${result.AC }</td>
		<td><input type="hidden" name="taekbaesa" value="" /></td>
		<td><input type="hidden" name="songjang_num" value="${result.AE }" />${result.AE }</td>
	</tr>
</c:forEach>
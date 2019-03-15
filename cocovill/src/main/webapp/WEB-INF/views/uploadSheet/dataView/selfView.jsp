<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@include file="/WEB-INF/views/include/taglibs.jsp"%>



<c:forEach items="${resultList }" var="result">
	<tr>
		<td><input type="hidden" name="uploadsheet_site" value="${uploadsheet_site }" />${uploadsheet_site }</td>
		<td><input type="hidden" name="sunseo" value="${result.A }" />${result.A }</td>
		<td><input type="hidden" name="mall_name" value="${result.B }" />${result.B }</td>
		<td><input type="hidden" name="jumun_date" value="${result.C }" />${result.C }</td>
		<td><input type="hidden" name="sujip_date" value="${result.D }" />${result.D }</td>
		<td><input type="hidden" name="sabang_sang_code" value="${result.E }" />${result.E }</td>
		<td><input type="hidden" name="sabang_jumun_num" value="${result.F }" />${result.F }</td>
		<td><input type="hidden" name="sujip_sang_name" value="${result.G }" />${result.G }</td>
		<td><input type="hidden" name="sujip_option" value="${result.H }" />${result.H }</td>
		<td><input type="hidden" name="hwak_sang_name" value="${result.I }" />${result.I }</td>
		<td><input type="hidden" name="hwak_option" value="${result.J }" />${result.J }</td>
		<td><input type="hidden" name="sang_yak" value="${result.K }" />${result.K }</td>
		<td><input type="hidden" name="option_nick" value="${result.L }" />${result.L }</td>
		<td><input type="hidden" name="suryang" value="${result.M }" />${result.M }</td>
		<td><input type="hidden" name="hwak_suryang" value="${result.N }" />${result.N }</td>
		<td><input type="hidden" name="jumun_name" value="${result.O }" />${result.O }</td>
		<td><input type="hidden" name="jumun_tel1" value="${result.P }" />${result.P }</td>
		<td><input type="hidden" name="jumun_tel2" value="${result.Q }" />${result.Q }</td>
		<td><input type="hidden" name="suchwi_name" value="${result.R }" />${result.R }</td>
		<td><input type="hidden" name="suchwi_tel1" value="${result.S }" />${result.S }</td>
		<td><input type="hidden" name="suchwi_tel2" value="${result.T }" />${result.T }</td>
		<td><input type="hidden" name="suchwi_zip" value="${result.U }" />${result.U }</td>
		<td><input type="hidden" name="suchwi_address" value="${result.V }" />${result.V }</td>
		<td><input type="hidden" name="beasong_message" value="${result.W }" />${result.W }</td>
		<td><input type="hidden" name="beasong_gubun" value="${result.X }" />${result.X }</td>
		<td><input type="hidden" name="beasong_pay" value="${result.Y }" />${result.Y }</td>
		<td><input type="hidden" name="panmae_price" value="${result.Z }" />${result.Z }</td>
		<td><input type="hidden" name="gongeup_price" value="${result.AA }" />${result.AA }</td>
		<td><input type="hidden" name="gyeolje_price" value="${result.AB }" />${result.AB }</td>
		<td><input type="hidden" name="taekbaesa" value="${result.AC }" />${result.AC }</td>
		<td><input type="hidden" name="songjang_num" value="${result.AD }" />${result.AD }</td>
	</tr>
</c:forEach>


<script type="text/javascript">
$(function() {
	// 소트 플러그인
// 	$("#dataTable").tablesorter(); tablesorter

	var tbl = $("#dataTable");

	// 테이블 헤더에 있는 checkbox 클릭시
	$(":checkbox:first", tbl).click(function() {
		// 클릭한 체크박스가 체크상태인지 체크해제상태인지 판단
		if ($(this).is(":checked")) {
			$(":checkbox", tbl).attr("checked", "checked");
		} else {
			$(":checkbox", tbl).removeAttr("checked");
		}

		// 모든 체크박스에 change 이벤트 발생시키기               
		$(":checkbox", tbl).trigger("change");
	});

	// 헤더에 있는 체크박스외 다른 체크박스 클릭시
	$(":checkbox:not(:first)", tbl).click(
			function() {
				var allCnt = $(":checkbox:not(:first)", tbl).length;
				var checkedCnt = $(":checkbox:not(:first)", tbl).filter(
						":checked").length;

				// 전체 체크박스 갯수와 현재 체크된 체크박스 갯수를 비교해서 헤더에 있는 체크박스 체크할지 말지 판단
				if (allCnt == checkedCnt) {
					$(":checkbox:first", tbl).attr("checked", "checked");
				} else {
					$(":checkbox:first", tbl).removeAttr("checked");
				}
			}).change(function() {
		if ($(this).is(":checked")) {
			// 체크박스의 부모 > 부모 니까 tr 이 되고 tr 에 selected 라는 class 를 추가한다.
			$(this).parent().parent().addClass("selected");
		} else {
			$(this).parent().parent().removeClass("selected");
		}
	});

});
</script>

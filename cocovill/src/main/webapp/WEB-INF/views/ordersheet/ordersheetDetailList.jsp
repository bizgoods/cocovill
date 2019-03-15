<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@include file="/WEB-INF/views/include/taglibs.jsp"%>

<%@include file="/WEB-INF/views/include/doctype.jsp"%>
<%@include file="/WEB-INF/views/include/style.jsp"%>
<%@include file="/WEB-INF/views/include/script.jsp"%>


</head>
<body>

	<div id="wrapper">
	
		<!-- S:FILE:header.jsp -->
		<%@include file="/WEB-INF/views/include/header.jsp"%>
		<!-- E:FILE:header.jsp -->
		
		<div id="page-wrapper">
			<div id="page-inner">
				<div class="row">
					<div class="col-lg-12">
						<h2>발주</h2>
					</div>
				</div>
				<!-- /. ROW  -->
				<hr />
				
				<div class="row text-center pad-top">
					<div class="col-lg-12">
						<div class="table-responsive">
							<table class="table table-bordered table-hover table-striped">
								<tbody>
									<tr>
										<th class="col-lg-2">업로드그룹</th>
										<td>${resultHead.uploadsheet_group }</td>
									</tr>
									<tr>
										<th class="col-lg-2">주문일시</th>
										<td>${resultHead.jumun_date }</td>
									</tr>
									<tr>
										<th class="col-lg-2">수령인이름</th>
										<td>${resultHead.suchwi_name }</td>
									</tr>
									<tr>
										<th class="col-lg-2">수령인전화번호</th>
										<td>${resultHead.suchwi_tel1 }</td>
									</tr>
									<tr>
										<th class="col-lg-2">수령인휴대폰번호</th>
										<td>${resultHead.suchwi_tel2 }</td>
									</tr>
									<tr>
										<th class="col-lg-2">우편번호</th>
										<td>${resultHead.suchwi_zip }</td>
									</tr>
									<tr>
										<th class="col-lg-2">주소</th>
										<td>${resultHead.suchwi_address }</td>
									</tr>
									<tr>
										<th class="col-lg-2">배송메세지</th>
										<td>${resultHead.beasong_message }</td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
				</div>
				<!-- /. ROW  -->
				
				<div class="row text-center pad-top">
					<div class="col-lg-12">
					
						<table id="dataTable" class="table table-striped table-bordered table-hover">
							<thead>
								<tr>
									<th>업로드사이트</th>
									<th>수집 상품명</th>
									<th>수집 옵션명</th>
									<th>옵션별칭</th>
									<th>수량</th>
									<th>배송비(수집)</th>
									<th>판매가(수집)</th>
									<th>사은품여부</th>
								</tr>
							</thead>
							<tbody>
								<c:choose>
									<c:when test="${empty resultList }">
										<tr>
											<td colspan="7">등록된 내용이 없습니다.</td>
										</tr>
									</c:when>
									<c:otherwise>
										<c:forEach items="${resultList }" var="result">
											<tr id="${result.uploadsheet_id }">
												<td>${result.uploadsheet_site }</td>
												<td><input type="hidden" name="sujip_sang_name" value="${result.sujip_sang_name }" />${result.sujip_sang_name }</td>
												<td>${result.sujip_option }</td>
												<td><input type="hidden" name="option_nick" value="${result.option_nick }" />${result.option_nick }</td>
												<td><input type="hidden" name="suryang" value="${result.suryang }" />${result.suryang }</td>
												<td>${result.beasong_pay }</td>
												<td>${result.panmae_price }</td>
												<td><input type="hidden" name="saeun_yn" value="${result.saeun_yn }" />${result.saeun_yn }</td>
										</c:forEach>
									</c:otherwise>
								</c:choose>
							</tbody>
						</table>
						
					</div>
				</div>
				<!-- /. ROW  -->
				
				<!--	S:버튼 -->
				<div class="row">
					<div class="col-lg-12">
						<div class="panel pull-right">
							<button type="button" id="btnReg" class="btn btn-primary"><i class="fa fa-file"></i>&nbsp;사은품 등록</button>
							<button type="button" id="btnList" class="btn btn-primary"><i class="fa fa-file "></i>&nbsp;목록</button>
						</div>
					</div>
				</div>
				<!--	E:버튼 -->
				
			</div>
			<!-- /. PAGE INNER  -->
		</div>
		<!-- /. PAGE WRAPPER  -->
	</div>

	<form id="frm" name="frm" method="post">
		<input type="hidden" name="uploadsheet_id" id="uploadsheet_id" value="" />
		<input type="hidden" name="sujip_sang_name" id="sujip_sang_name" value="" />
		<input type="hidden" name="option_nick" id="option_nick" value="" />
		<input type="hidden" name="suryang" id="suryang" value="" />
		<input type="hidden" name="uploadsheet_group" value="${resultHead.uploadsheet_group }" />
		<input type="hidden" name="suchwi_name" value="${resultHead.suchwi_name }" />
		<input type="hidden" name="suchwi_tel1" value="${resultHead.suchwi_tel1 }" />
		<input type="hidden" name="suchwi_tel2" value="${resultHead.suchwi_tel2 }" />
		<input type="hidden" name="suchwi_zip" value="${resultHead.suchwi_zip }" />
		<input type="hidden" name="suchwi_address" value="${resultHead.suchwi_address }" />
	</form>	 

	<!-- S:FILE:footer.jsp -->
	<%@include file="/WEB-INF/views/include/footer.jsp"%>
	<!-- E:FILE:footer.jsp -->


<script>

var listUrl = "/ordersheet/ordersheetList.do";
var detailListUrl = "/ordersheet/ordersheetDetailList.do";
var formlUrl = "/ordersheet/ordersheetForm.do";

$(function(){
	
	//목록 이벤트
	$("#btnList").bind("click", function(){
		$("form[name=frm]").attr("action", listUrl);
		$("form[name=frm]").submit();
	});
	
	//목록 클릭 이벤트
	$("#dataTable > tbody > tr").bind("click", function() {
		if($(this).find("td>input[name='saeun_yn']").val() == "Y"){
			// 사은품일 경우만 이벤트 발생
			$("#uploadsheet_id").val($(this).attr("id"));
			$("#sujip_sang_name").val($(this).find("td>input[name='sujip_sang_name']").val());
			$("#option_nick").val($(this).find("td>input[name='option_nick']").val());
			$("#suryang").val($(this).find("td>input[name='suryang']").val());
			saeunPop();
		}
	});
	
	//사은품 등록 팝업 이벤트
	$("#btnReg").bind("click", function(){
		$("#uploadsheet_id").val("");
		$("#sujip_sang_name").val("");
		$("#sujip_sang_name").val("");
		saeunPop();
	});
	
	var saeunPop = function(){
		var goUrl = "/ordersheet/ordersheetFormGift.do";
 		$.ajax({
			type:"post",
			async:true,
			url:goUrl,
			data:$("form[name=frm]").serialize(),
			dataType:"html",
			success:function(responseData){
				$("#dialog").html(responseData).dialog("open");
				$(".ui-dialog-titlebar").hide();
			},
			error: function (jqXHR, exception){
				alert("["+jqXHR.status+"]오류입니다.\n"+exception);
				return;
			}
		});
	}
	
});

</script>

</body>
</html>


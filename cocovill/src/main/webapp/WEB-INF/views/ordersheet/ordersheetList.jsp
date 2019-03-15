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

				<!--	S:검색조건 -->
				<form id="frm" name="frm" method="post">
					<input type="hidden" name="uploadsheet_group" id="uploadsheet_group"/>
					<input type="hidden" name="suchwi_address" id="suchwi_address"/>
				</form>	 
				<!--	S:검색조건 -->
				<hr />
				<div class="row text-center pad-top table_size_scroll_01">
					<div class="col-lg-12">
					
						<table id="dataTable" class="table table-striped table-bordered table-hover">
							<thead>
								<tr>
									<th>업로드그룹</th>
									<th>순번</th>
									<th>업로드사이트</th>
									<th>수령인명</th>
									<th>상품명</th>
									<th>수량</th>
									<th>수령인주소</th>
									<th>수령인전화번호1</th>
									<th>수령인전화번호2</th>
									<th>수령인우편번호</th>
									<th>배송메세지</th>
								</tr>
							</thead>
							<tbody>
								<c:choose>
									<c:when test="${empty resultList }">
										<tr><td colspan="11">등록된 내용이 없습니다.</td></tr>
									</c:when>
									<c:otherwise>
										<c:forEach items="${resultList }" var="result" varStatus="status">
											<tr>
												<td>
													<input type="hidden" name="uploadsheet_id" value="${result.g_uploadsheet_id }" />
													<input type="hidden" name="uploadsheet_group" value="${result.uploadsheet_group }" />
													${result.uploadsheet_group }</td>
												<td><input type="hidden" name="sunseo" value="${status.index + 1}" />${status.index + 1}</td>
												<td><input type="hidden" name="uploadsheet_site" value="${result.g_uploadsheet_site }" />${result.g_uploadsheet_site }</td>
												<td><input type="hidden" name="suchwi_name" value="${result.suchwi_name }" />${result.suchwi_name }</td>
												<td><input type="hidden" name="jumun_sang_name" value="${result.g_jumun_sang_name }" />${result.g_jumun_sang_name }</td>
												<td><input type="hidden" name="suryang" value="${result.g_suryang }" />${result.g_suryang }</td>
												<td><input type="hidden" name="suchwi_address" value="${result.suchwi_address }" />${result.suchwi_address }</td>
												<td><input type="hidden" name="suchwi_tel1" value="${result.suchwi_tel1 }" />${result.suchwi_tel1 }</td>
												<td><input type="hidden" name="suchwi_tel2" value="${result.suchwi_tel2 }" />${result.suchwi_tel2 }</td>
												<td><input type="hidden" name="suchwi_zip" value="${result.suchwi_zip }" />${result.suchwi_zip }</td>
												<td><input type="hidden" name="beasong_message" value="${result.beasong_message }" />${result.beasong_message }</td>
											</tr>
										</c:forEach>
									</c:otherwise>
								</c:choose>
							</tbody>
						</table>
						
					</div>
				</div>
				<!-- /. ROW  -->
				
				<!--	S:버튼 -->
				<c:if test="${!empty resultList }">
					<div class="row">
						<div class="col-lg-12">
							<div class="panel pull-right">
								<button type="button" id="btnReg" class="btn btn-primary"><i class="fa fa-file"></i>&nbsp;확정</button>
								<button type="button" id="btnDel" class="btn btn-primary"><i class="fa fa-trash-o"></i>&nbsp;전체삭제</button>
							</div>
						</div>
					</div>
				</c:if>
				<!--	E:버튼 -->
				
			</div>
			<!-- /. PAGE INNER  -->
		</div>
		<!-- /. PAGE WRAPPER  -->
	</div>

	<!-- S:FILE:footer.jsp -->
	<%@include file="/WEB-INF/views/include/footer.jsp"%>
	<!-- E:FILE:footer.jsp -->


<script>

var listUrl = "/ordersheet/ordersheetList.do";
var detailListUrl = "/ordersheet/ordersheetDetailList.do";
var formlUrl = "/ordersheet/ordersheetForm.do";

$(function(){
	
	//상세 이벤트
	$("#dataTable > tbody > tr").bind("click", function() {
		// 그룹값인 0번째 td 가져오기
		$("#uploadsheet_group").val($(this).find("td>input[name='uploadsheet_group']").val());
		// 주소기준으로 그룹이 되므로 주소값인 6번째 td 가져오기
		$("#suchwi_address").val($(this).find("td>input[name='suchwi_address']").val());
		$("form[name=frm]").attr("action", detailListUrl);
		$("form[name=frm]").submit();
	});
	
	//확정 이벤트
	$("#btnReg").on("click", function(event) {
		event.preventDefault();
		
		if(confirm("발주내용을 확정하시겠습니까?\n확정 후에는 내용을 수정 할 수 없습니다.")) {
			var data = $("tbody tr").map(function() {
				var obj = {};
				$(this).find('input').each(function() {
					obj[this.name] = $(this).val();
				});
				return obj;
			}).get();
			
			console.log(JSON.stringify(data));
			
			$.ajax({
				type : 'post',
				url : '/ordersheet/ordersheetListHwakjeong.do',
				data : JSON.stringify(data),
				dataType:"json",
				contentType:"application/json; charset=UTF-8",
				success:function(responseData){
					var data = responseData.resultJson;
					if(data.rCode == "${STATUS_S_CODE}"){
						alert("저장 되었습니다.");
						$("form[name=frm]").attr("action", data.goUrl);
						$("form[name=frm]").submit();
					}else{
						alert(data.rMsg);
						return;
					}	
				},
				error: function (jqXHR, exception) {
					alert("["+jqXHR.status+"]오류입니다.\n"+exception);
					var msg = '';
					if (jqXHR.status === 0) {
						msg = 'Not connect.\n Verify Network.';
					} else if (jqXHR.status == 404) {
						msg = 'Requested page not found. [404]';
					} else if (jqXHR.status == 500) {
						msg = 'Internal Server Error [500].';
					} else if (exception === 'parsererror') {
						msg = 'Requested JSON parse failed.';
					} else if (exception === 'timeout') {
						msg = 'Time out error.';
					} else if (exception === 'abort') {
						msg = 'Ajax request aborted.';
					} else {
						msg = 'Uncaught Error.\n' + jqXHR.responseText;
					}
					console.log(msg)
					return;
				}
			});
		}
	});
	
	// 삭제이벤트
	$("#btnDel").bind("click", function(){
		
		$("#uploadsheet_group").val($("#dataTable > tbody > tr > td > input[name='uploadsheet_group']").eq(0).val());
		
		if(confirm("발주내용을 삭제하시겠습니까?\n삭제 후에는 내용을 복구 할 수 없습니다.")) {
	 		$.ajax({
				type:"post",
				async:true,
				url : '/ordersheet/ordersheetListDelete.do',
				data:$("form[name=frm]").serialize(),
				dataType:"json",
				success:function(responseData){
					var data = responseData.resultJson;
					if(data.rCode == "${STATUS_S_CODE}"){
						alert("삭제 되었습니다.");
						$("form[name=frm]").attr("action", data.goUrl);
						$("form[name=frm]").submit();
					}else{
						alert(data.rMsg);
						return;
					}	
				},
				error: function (jqXHR, exception){
					alert("["+jqXHR.status+"]오류입니다.\n"+exception);
					return;
				}
			});
		}
	});	
	
});

</script>

</body>
</html>


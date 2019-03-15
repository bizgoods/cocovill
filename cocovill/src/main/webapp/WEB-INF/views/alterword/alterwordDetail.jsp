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
						<h2>대체어 관리</h2>
					</div>
				</div>
				<!-- /. ROW  -->
				<hr />
				
				<form id="frm" name="frm" method="post">
					<input type="hidden" name="pageNum" id="pageNum" value="${paramDto.pageNum}"/>
					<input type="hidden" name="searchValue" value="${paramDto.searchValue}"/>
					<input type="hidden" name="searchFromDt" value="${paramDto.searchFromDt }"/>					
					<input type="hidden" name="searchToDt" value="${paramDto.searchToDt }"/>					
					<input type="hidden" name="alterword_id" id="alterword_id" value="${result.alterword_id }"/>					
				</form>	 
				
				<div class="row text-center pad-top">
					<div class="col-lg-12">
					
						<div class="table-responsive">
							<table class="table table-bordered table-hover table-striped">
								<tbody>
									<tr>
										<th class="col-lg-2">상품명</th>
										<td>${result.real_sang_name }</td>
									</tr>
									<tr>
										<th class="col-lg-2">대체상품명</th>
										<td>${result.alater_sang_name }</td>
									</tr>
									<tr>
										<th class="col-lg-2">사용여부</th>
										<td>${result.use_yn }</td>
									</tr>
									<tr>
										<th class="col-lg-2">등록일시</th>
										<td>${result.in_date }</td>
									</tr>
									<tr>
										<th class="col-lg-2">등록자</th>
										<td>${result.in_user }</td>
									</tr>
									<tr>
										<th class="col-lg-2">등록자 IP</th>
										<td>${result.in_ip }</td>
									</tr>
									<tr>
										<th class="col-lg-2">수정일시</th>
										<td>${result.up_date }</td>
									</tr>
									<tr>
										<th class="col-lg-2">수정자</th>
										<td>${result.up_user }</td>
									</tr>
									<tr>
										<th class="col-lg-2">수정자 IP</th>
										<td>${result.up_ip }</td>
									</tr>
								</tbody>
							</table>
						</div>
						
					</div>
				</div>
				<!-- /. ROW  -->
				
				<!--	S:버튼 -->
				<div class="row">
					<div class="col-lg-12">
						<div class="panel pull-right">
							<button type="button" id="btnList" class="btn btn-primary"><i class="fa fa-file "></i>&nbsp;목록</button>
							<button type="button" id="btnUpd" class="btn btn-primary"><i class="fa fa-wrench "></i>&nbsp;수정</button>
							<button type="button" id="btnDel" class="btn btn-primary"><i class="fa fa-trash "></i>&nbsp;삭제</button>
						</div>
					</div>
				</div>
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
var listUrl = "/alterword/alterwordList.do";
var detailUrl = "/alterword/alterwordDetail.do";
var formlUrl = "/alterword/alterwordForm.do";
var deletelUrl = "/alterword/alterwordDelete.do";

$(function(){
	
	//목록 이벤트
	$("#btnList").bind("click", function(){
		$("form[name=frm]").attr("action", listUrl);
		$("form[name=frm]").submit();
	});
	//수정 이벤트
	$("#btnUpd").bind("click", function(){
		$("form[name=frm]").attr("action", formlUrl);
		$("form[name=frm]").submit();
	});
	
	//이전 다음  / 상세 이벤트
	$("#dataTable > tbody > tr").bind("click", function() {
		$("#board_id").val($(this).attr("id"));
		$("form[name=frm]").attr("action", detailUrl);
		$("form[name=frm]").submit();
	});	
	
	//삭제 이벤트
	$("#btnDel").bind("click", function(){
		var goUrl = deletelUrl;
		
 		$.ajax({
			type:"post",
			async:true,
			url:goUrl,
			data:$("form[name=frm]").serialize(),
			dataType:"json",
			beforeSend:beforSubmit,
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
	});	
	
	// 폼 데이터 점검
	beforSubmit = function(){
		if(!confirm("삭제하시겠습니까?")){
			return false;
		}
	};		

});
</script>

</body>
</html>


<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/include/taglibs.jsp"%>

	<spring:eval expression="@config['STATUS_S_CODE']" var="STATUS_S_CODE" />
		
	<div class="row">
		<div class="col-lg-12">
			<h2>사은품등록</h2>
		</div>
	</div>
	<!-- /. ROW  -->
	<hr />
	
	<div class="row">
		<div class="col-lg-12">
			<form name="frm_dialog" method="post">
				<input type="hidden" name="uploadsheet_id" id="uploadsheet_id" value="${paramDto.uploadsheet_id }" />
				<input type="hidden" name="uploadsheet_group" value="${paramDto.uploadsheet_group }" />
				<input type="hidden" name="suchwi_name" value="${paramDto.suchwi_name }" />
				<input type="hidden" name="suchwi_tel1" value="${paramDto.suchwi_tel1 }" />
				<input type="hidden" name="suchwi_tel2" value="${paramDto.suchwi_tel2 }" />
				<input type="hidden" name="suchwi_zip" value="${paramDto.suchwi_zip }" />
				<input type="hidden" name="suchwi_address" value="${paramDto.suchwi_address }" />
				
				<input type="hidden" name="sujip_sang_name" id="sujip_sang_name"/>
				<input type="hidden" name="option_nick" id="option_nick"/>
				
				<div class="form-group">
					<label for="board_cat">상품명</label>
					<select name="isang_name" id="isang_name" class="form-control">
						<c:forEach items="${giftList }" var="result">
							<option value="${result.sang_option }">${result.sang_name }</option>
						</c:forEach>
					</select>
				</div>
				
				<div class="form-group">
					<label for="sample2">수량</label>
					<input type="text" name="suryang" class="form-control" value="${paramDto.suryang }" />
				</div>
			</form>
		</div>
	</div>
	<!-- /.row -->

	<!--	S:버튼 -->
	<div class="row">
		<div class="col-lg-12">
			<div class="pull-right">							
				<button type="button" id="btnCancel" class="btn btn-primary"><i class="fa fa-close"></i>&nbsp;취소</button>
				<button type="button" id="btnSave" class="btn btn-primary"><i class="fa fa-save"></i>&nbsp;저장</button>
				<button type="button" id="btnDelete" class="btn btn-primary"><i class="fa fa-trash-o"></i>&nbsp;삭제</button>
			</div>
		</div>
	</div>
				

<script>
var listUrl = "/ordersheet/ordersheetList.do";
var updateUrl = "/ordersheet/ordersheetUpdateGift.do";
var insertUrl = "/ordersheet/ordersheetInsertGift.do";
var deleteUrl = "/ordersheet/ordersheetDeleteGift.do";


$(function(){
	
	$("#btnCancel").bind("click", function(){
		$("#dialog").dialog("close");
	});
	
	//초기값
	if("${paramDto.uploadsheet_id }" != ""){
		$("#isang_name").val("${paramDto.option_nick}");
	}else{
		$("select option:eq(0)").attr("selected", "selected");
	}
	
	//등록 이벤트
	$("#btnSave").bind("click", function(){
		
		if(!confirm("등록하시겠습니까?")){
			return false;
		}
		
		var goUrl = "";
		if("${paramDto.uploadsheet_id }" != ""){
			goUrl = updateUrl;
		}else{
			goUrl = insertUrl;
		}
		$("form[name=frm_dialog] input[name=sujip_sang_name]").val($("#isang_name option:selected").text());
		$("form[name=frm_dialog] input[name=option_nick]").val($("#isang_name option:selected").val());

		$.ajax({
			type:"post",
			async:true,
			url:goUrl,
			data:$("form[name=frm_dialog]").serialize(),
			dataType:"json",
			beforeSend:beforSubmit,
			success:function(responseData){
				var data = responseData.resultJson;
				if(data.rCode == "${STATUS_S_CODE}"){
					alert("저장 되었습니다.");
					$("#dialog").dialog("close");
					document.location.reload();
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

	});	
	
	//삭제 이벤트
	$("#btnDelete").bind("click", function(){
		
		if(!confirm("삭제하시겠습니까?")){
			return false;
		}
		
		$.ajax({
			type:"post",
			async:true,
			url:deleteUrl,
			data:$("form[name=frm_dialog]").serialize(),
			dataType:"json",
			beforeSend:beforSubmit,
			success:function(responseData){
				var data = responseData.resultJson;
				if(data.rCode == "${STATUS_S_CODE}"){
					alert("삭제 되었습니다.");
					$("#dialog").dialog("close");
					document.location.reload();
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

	});	
	
	// 폼 데이터 점검
	beforSubmit = function(){
	};

});

</script>

</body>
</html>


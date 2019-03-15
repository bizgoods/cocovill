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
						<h2>사은품 관리</h2>
					</div>
				</div>
				<!-- /. ROW  -->
				<hr />
				
				<div class="row">
					<div class="col-lg-12">
						<form name="frm" id="frm" method="post">
							<input type="hidden" name="pageNum" id="pageNum" value="${paramDto.pageNum}"/>
							<input type="hidden" name="searchValue" value="${paramDto.searchValue}"/>
							<input type="hidden" name="gift_id" id="gift_id" value="${result.gift_id }"/>		
						
							<div class="form-group">
								<label for="real_sang_name">상품명</label>
								<input type="text" name="sang_name" id="sang_name" class="form-control" placeholder="상품명" value="${result.sang_name }" />
							</div>
							<div class="form-group">
								<label for="alater_sang_name">옵션명</label>
								<input type="text" name="sang_option" id="sang_option" class="form-control" placeholder="옵션명" value="${result.sang_option }" />
							</div>
							<div>
								<label for="use_yn">사용</label>
								<input type="radio" name="use_yn" value="Y">
							</div>
							<div>
								<label for="use_yn">사용안함</label>
								<input type="radio" name="use_yn" value="N">
							</div>
						</form>
					</div>
				</div>
				<!-- /.row -->

				<!--	S:버튼 -->
				<div class="row">
					<div class="col-lg-12">
						<div class="pull-right">							
							<button type="button" id="btnList" class="btn btn-primary"><i class="fa fa-list "></i>&nbsp;목록</button> 
							<button type="button" id="btnSave" class="btn btn-primary"><i class="fa fa-save "></i>&nbsp;저장</button>
						</div>
					</div>
				</div>
				
			</div>
			<!-- /. PAGE INNER  -->
		</div>
		<!-- /. PAGE WRAPPER  -->
	</div>

	<!-- S:FILE:footer.jsp -->
	<%@include file="/WEB-INF/views/include/footer.jsp"%>
	<!-- E:FILE:footer.jsp -->

	<!-- Smart Editor -->
	<script src="/resources/smarteditor2-master/dist/js/service/HuskyEZCreator.js" charset="utf-8"></script>


<script>
var listUrl = "/gift/giftList.do";
var updateUrl = "/gift/giftUpdate.do";
var insertUrl = "/gift/giftInsert.do";


$(function(){
	
	//초기값
	if(!${empty result.gift_id}){
		$("input:radio[name=use_yn][value=${result.use_yn }]").prop("checked", true);
	}else{
		$("input:radio[name=use_yn]").eq(0).prop("checked", true);
	}
	
	//목록 이벤트
	$("#btnList").bind("click", function(){
		$("form[name=frm]").attr("action", listUrl);
		$("form[name=frm]").submit();
	});
	
	//등록 이벤트
	$("#btnSave").bind("click", function(){
		
		if(!confirm("등록하시겠습니까?")){
			return false;
		}
		
		var goUrl = "";
		if($("#gift_id").val().length > 0){
			goUrl = updateUrl;
		}else{
			goUrl = insertUrl;
		}

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

	});	
	
	// 폼 데이터 점검
	beforSubmit = function(){
	};

});

</script>

</body>
</html>


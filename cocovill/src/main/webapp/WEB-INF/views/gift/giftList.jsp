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
				
				<!--	S:검색조건 -->
				<form id="frm" name="frm" method="post">
					<input type="hidden" name="pageNum" id="pageNum" value="${paramDto.pageNum}"/>
					<input type="hidden" name="gift_id" id="gift_id"/>					
				
					<div class="row">
						<div class="col-lg-12 ">
							<div class="col-lg-6 col-md-6">
								<input type="text" class="form-control input-lg" name="searchValue" value="${paramDto.searchValue }">
							</div>								
							<div class="col-lg-6 col-md-6">
								<button type="button" id="btnSearch" class="btn btn-primary btn-lg btn-block"><i class="fa fa-search"></i>&nbsp;검색</button>
							</div>								
						</div>
					</div>
					<!-- /. ROW  -->
				</form>	 
				<!--	S:검색조건 -->
				<hr />
				<div class="row text-center pad-top">
					<div class="col-lg-12">
					
						<table id="dataTable" class="table table-striped table-bordered table-hover">
							<thead>
								<tr>
									<th>사은품순번</th>
									<th>상품명</th>
									<th>옵션명</th>
									<th>사용여부</th>
									<th>등록일</th>
									<th>등록자</th>
								</tr>
							</thead>
							<tbody>
								<c:choose>
									<c:when test="${empty resultList }">
										<tr><td colspan="13">등록된 내용이 없습니다.</td></tr>
									</c:when>
									<c:otherwise>
										<c:forEach items="${resultList }" var="result">
											<tr id="${result.gift_id }">
												<td>${result.rowNum }</td>
												<td>${result.sang_name }</td>
												<td>${result.sang_option }</td>
												<td>${result.use_yn }</td>
												<td>
													<fmt:parseDate var="in_date" value="${result.in_date }" pattern="yyyy-MM-dd HH:mm:ss"/>
													<fmt:formatDate value="${in_date }" pattern="yyyy-MM-dd"/>														
												</td>
												<td>${result.in_user }</td>
											</tr>
										</c:forEach>
									</c:otherwise>
								</c:choose>
							</tbody>
						</table>
						
					</div>
				</div>
				<!-- /. ROW  -->
				
				<!-- S:FILE:paging.jsp -->
				<%@include file="/WEB-INF/views/include/paging.jsp"%>
				<!-- E:FILE:paging.jsp -->
				
				<!--	S:버튼 -->
				<div class="row">
					<div class="col-lg-12">
						<div class="panel pull-right">
							<button type="button" id="btnReg" class="btn btn-primary"><i class="fa fa-file"></i>&nbsp;등록</button>
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
var listUrl = "/gift/giftList.do";
var detailUrl = "/gift/giftDetail.do";
var formlUrl = "/gift/giftForm.do";

$(function(){
	
	//검색어 키업 이벤트발생시 검색버튼 활성화 및 엔터키 이벤트 발생
	$("input[name=searchValue]").bind("keyup", function(e){
		//엔터키 클릭시 검색
		if (e.keyCode == 13){
			$("#pageNum").val("1");
			$("#frm").attr("action", listUrl);
			$("#frm").submit();
		}
	});
	
	//검색어 입력후 엔터키 이벤트
	$("#btnSearch").bind("click", function(e) {
		$("#pageNum").val("1");
		$("#frm").attr("action", listUrl);
		$("#frm").submit();
	});		
	
	//상세 이벤트
	$("#dataTable > tbody > tr").bind("click", function() {
		$("#gift_id").val($(this).attr("id"));
		$("form[name=frm]").attr("action", detailUrl);
		$("form[name=frm]").submit();
	});
	
	//등록 이벤트
	$("#btnReg").bind("click", function(){
		$("form[name=frm]").attr("action", formlUrl);
		$("form[name=frm]").submit();
	});
});

// 페이징
function goPage(pageNo){
	$("#pageNum").val(pageNo);
	$("#searchValue").val("${paramDto.searchValue}");
	$("#frm").attr("action", listUrl);
	$("#frm").submit();
};
</script>

</body>
</html>


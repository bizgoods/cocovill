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
						<h2>발주이력</h2>
					</div>
				</div>
				<!-- /. ROW  -->
				<hr />
				
				<!--	S:검색조건 -->
				<form id="frm" name="frm" method="post">
					<div class="row">
						<div class="col-lg-4 ">
							<div class="col-lg-4 col-md-4">업로드그룹</div>								
							<div class="col-lg-8 col-md-8">
								<select name="uploadsheet_group" id="uploadsheet_group" class="form-control">
									<c:forEach items="${orderHistoryGourpList }" var="result">
										<option value="${result.uploadsheet_group }">${result.uploadsheet_group }</option>
									</c:forEach>
								</select>
							</div>								
						</div>
						<div class="col-lg-4 ">
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
				<div class="row text-center pad-top table_size_scroll_01">
					<div class="col-lg-12">
					
						<table id="dataTable" class="table table-striped table-bordered table-hover">
							<thead>
								<tr>
									<th>업로드그룹</th>
									<th>등록일</th>
									<th>업로드사이트</th>
									<th>수취인명</th>
									<th>주문제품명</th>
									<th>수량</th>
									<th>수취인주소</th>
									<th>수취인전화번호1</th>
									<th>수취인전화번호2</th>
									<th>수취인우편번호</th>
									<th>배송매세지</th>
									<th>등록자</th>
								</tr>
							</thead>
							<tbody>
								<c:choose>
									<c:when test="${empty resultList }">
										<tr><td colspan="11">등록된 내용이 없습니다.</td></tr>
									</c:when>
									<c:otherwise>
										<c:forEach items="${resultList }" var="result">
											<tr>
												<td>${result.uploadsheet_group }</td>
												<td>
													<fmt:parseDate var="in_date" value="${result.in_date }" pattern="yyyy-MM-dd HH:mm:ss"/>
													<fmt:formatDate value="${in_date }" pattern="yyyy-MM-dd"/>														
												</td>
												<td>${result.uploadsheet_site }</td>
												<td>${result.suchwi_name }</td>
												<td>${result.jumun_sang_name }</td>
												<td>${result.suryang }</td>
												<td>${result.suchwi_address }</td>
												<td>${result.suchwi_tel1 }</td>
												<td>${result.suchwi_tel2 }</td>
												<td>${result.suchwi_zip }</td>
												<td>${result.beasong_message }</td>
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
				
			</div>
			<!-- /. PAGE INNER  -->
		</div>
		<!-- /. PAGE WRAPPER  -->
	</div>

	<!-- S:FILE:footer.jsp -->
	<%@include file="/WEB-INF/views/include/footer.jsp"%>
	<!-- E:FILE:footer.jsp -->


<script>
var listUrl = "/orderHistory/orderHistoryList.do";

$(function(){
	
	$("#uploadsheet_group").val("${paramDto.uploadsheet_group}");
	
	//검색어 키업 이벤트발생시 검색버튼 활성화 및 엔터키 이벤트 발생
	$("input[name=searchValue]").bind("keyup", function(e){
		//엔터키 클릭시 검색
		if (e.keyCode == 13){
			$("#frm").attr("action", listUrl);
			$("#frm").submit();
		}
	});
	
	//검색어 입력후 엔터키 이벤트
	$("#btnSearch").bind("click", function(e) {
		$("#frm").attr("action", listUrl);
		$("#frm").submit();
	});

	$("#uploadsheet_group").bind("change", function(){
		$("#frm").attr("action", listUrl);
		$("#frm").submit();
	});

});
</script>

</body>
</html>


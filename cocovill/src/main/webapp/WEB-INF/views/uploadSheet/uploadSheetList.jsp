<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@include file="/WEB-INF/views/include/taglibs.jsp"%>

<%@include file="/WEB-INF/views/include/doctype.jsp"%>
<%@include file="/WEB-INF/views/include/style.jsp"%>
<%@include file="/WEB-INF/views/include/script.jsp"%>

<style>
	table>thead>tr>th {vertical-align: middle;}
	#dataTable {border-collapse: collapse;}
	#dataTable td, dataTable th {padding: 20px;}
	#dataTable th {background-color: #ccc;}
	#dataTable tr.selected {background-color: navy; color: #fff; font-weight: bold;}
	
</style>

<spring:eval expression="@config['SITE_SABANG']" var="SITE_SABANG" />
<spring:eval expression="@config['SITE_DAIET']" var="SITE_DAIET" />
<spring:eval expression="@config['SITE_FOOD']" var="SITE_FOOD" />
<spring:eval expression="@config['SITE_DOSIRAK']" var="SITE_DOSIRAK" />
<spring:eval expression="@config['SITE_POST']" var="SITE_POST" />
<spring:eval expression="@config['SITE_EJE']" var="SITE_EJE" />
<spring:eval expression="@config['SITE_PINK']" var="SITE_PINK" />
<spring:eval expression="@config['SITE_SPO']" var="SITE_SPO" />
<spring:eval expression="@config['SITE_FUN']" var="SITE_FUN" />
<spring:eval expression="@config['SITE_FRESH']" var="SITE_FRESH" />
<spring:eval expression="@config['SITE_FITN']" var="SITE_FITN" />
<spring:eval expression="@config['SITE_THENE']" var="SITE_THENE" />
<spring:eval expression="@config['SITE_MONSTER']" var="SITE_MONSTER" />
<spring:eval expression="@config['SITE_THIS']" var="SITE_THIS" />
<spring:eval expression="@config['SITE_RNR']" var="SITE_RNR" />
<spring:eval expression="@config['SITE_NAMSEON']" var="SITE_NAMSEON" />
<spring:eval expression="@config['SITE_KAKAO']" var="SITE_KAKAO" />
<spring:eval expression="@config['SITE_SELF']" var="SITE_SELF" />

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
						<h2>Excel 업로드</h2>
					</div>
				</div>
				<!-- /. ROW  -->
				<hr />

				<div class="row text-center pad-top">
					<!-- 사방넷 -->
					<div class="col-lg-4">
						<form name="excelUploadForm_SITE_SABANG" enctype="multipart/form-data">
							<input type="hidden" name="uploadsheet_site" value="${SITE_SABANG }"/>
							<div class="row">
								<div class="col-lg-12 ">
									<div class="col-lg-6 col-md-6">
										<input type="file" name="excelFile" id="excelFile_SITE_SABANG"/>
									</div>								
									<div class="col-lg-6 col-md-6">
										<button type="button" class="btn btn-primary btn-lg btn-block" onclick="check('SITE_SABANG')">
											<i class="glyphicon glyphicon-upload"></i>&nbsp;${SITE_SABANG }
										</button>
									</div>								
								</div>
							</div>
						</form>
					</div>
					<!-- 다이어트신 -->
					<div class="col-lg-4">
						<form name="excelUploadForm_SITE_DAIET" enctype="multipart/form-data">
							<input type="hidden" name="uploadsheet_site" value="${SITE_DAIET }"/>
							<div class="row">
								<div class="col-lg-12 ">
									<div class="col-lg-6 col-md-6">
										<input type="file" name="excelFile" id="excelFile_SITE_DAIET"/>
									</div>								
									<div class="col-lg-6 col-md-6">
										<button type="button" class="btn btn-primary btn-lg btn-block" onclick="check('SITE_DAIET')">
											<i class="glyphicon glyphicon-upload"></i>&nbsp;${SITE_DAIET }
										</button>
									</div>								
								</div>
							</div>
						</form>
					</div>
					<!-- 푸드나무(랭킹닭컴) -->
					<div class="col-lg-4">
						<form name="excelUploadForm_SITE_FOOD" enctype="multipart/form-data">
							<input type="hidden" name="uploadsheet_site" value="${SITE_FOOD }"/>
							<div class="row">
								<div class="col-lg-12 ">
									<div class="col-lg-6 col-md-6">
										<input type="file" name="excelFile" id="excelFile_SITE_FOOD"/>
									</div>								
									<div class="col-lg-6 col-md-6">
										<button type="button" class="btn btn-primary btn-lg btn-block" onclick="check('SITE_FOOD')">
											<i class="glyphicon glyphicon-upload"></i>&nbsp;${SITE_FOOD }
										</button>
									</div>								
								</div>
							</div>
						</form>
					</div>
				</div>
				<!-- /. ROW  -->
				<hr />
				
				
				<div class="row text-center pad-top">
					<!-- 도시락몰 -->
					<div class="col-lg-4">
						<form name="excelUploadForm_SITE_DOSIRAK" enctype="multipart/form-data">
							<input type="hidden" name="uploadsheet_site" value="${SITE_DOSIRAK }"/>
							<div class="row">
								<div class="col-lg-12 ">
									<div class="col-lg-6 col-md-6">
										<input type="file" name="excelFile" id="excelFile_SITE_DOSIRAK"/>
									</div>								
									<div class="col-lg-6 col-md-6">
										<button type="button" class="btn btn-primary btn-lg btn-block" onclick="check('SITE_DOSIRAK')">
											<i class="glyphicon glyphicon-upload"></i>&nbsp;${SITE_DOSIRAK }
										</button>
									</div>								
								</div>
							</div>
						</form>
					</div>
					<!-- 우체국몰 -->
					<div class="col-lg-4">
						<form name="excelUploadForm_SITE_POST" enctype="multipart/form-data">
							<input type="hidden" name="uploadsheet_site" value="${SITE_POST }"/>
							<div class="row">
								<div class="col-lg-12 ">
									<div class="col-lg-6 col-md-6">
										<input type="file" name="excelFile" id="excelFile_SITE_POST"/>
									</div>								
									<div class="col-lg-6 col-md-6">
										<button type="button" class="btn btn-primary btn-lg btn-block" onclick="check('SITE_POST')">
											<i class="glyphicon glyphicon-upload"></i>&nbsp;${SITE_POST }
										</button>
									</div>								
								</div>
							</div>
						</form>
					</div>
					<!-- 이제너두 -->
					<div class="col-lg-4">
						<form name="excelUploadForm_SITE_EJE" enctype="multipart/form-data">
							<input type="hidden" name="uploadsheet_site" value="${SITE_EJE }"/>
							<div class="row">
								<div class="col-lg-12 ">
									<div class="col-lg-6 col-md-6">
										<input type="file" name="excelFile" id="excelFile_SITE_EJE"/>
									</div>								
									<div class="col-lg-6 col-md-6">
										<button type="button" class="btn btn-primary btn-lg btn-block" onclick="check('SITE_EJE')">
											<i class="glyphicon glyphicon-upload"></i>&nbsp;${SITE_EJE }
										</button>
									</div>								
								</div>
							</div>
						</form>
					</div>
				</div>
				<!-- /. ROW  -->
				<hr />
				
				
				<div class="row text-center pad-top">
					<!-- 핑크다이어리 -->
					<div class="col-lg-4">
						<form name="excelUploadForm_SITE_PINK" enctype="multipart/form-data">
							<input type="hidden" name="uploadsheet_site" value="${SITE_PINK }"/>
							<div class="row">
								<div class="col-lg-12 ">
									<div class="col-lg-6 col-md-6">
										<input type="file" name="excelFile" id="excelFile_SITE_PINK"/>
									</div>								
									<div class="col-lg-6 col-md-6">
										<button type="button" class="btn btn-primary btn-lg btn-block" onclick="check('SITE_PINK')">
											<i class="glyphicon glyphicon-upload"></i>&nbsp;${SITE_PINK }
										</button>
									</div>								
								</div>
							</div>
						</form>
					</div>
					<!-- 스포맥스 -->
					<div class="col-lg-4">
						<form name="excelUploadForm_SITE_SPO" enctype="multipart/form-data">
							<input type="hidden" name="uploadsheet_site" value="${SITE_SPO }"/>
							<div class="row">
								<div class="col-lg-12 ">
									<div class="col-lg-6 col-md-6">
										<input type="file" name="excelFile" id="excelFile_SITE_SPO"/>
									</div>								
									<div class="col-lg-6 col-md-6">
										<button type="button" class="btn btn-primary btn-lg btn-block" onclick="check('SITE_SPO')">
											<i class="glyphicon glyphicon-upload"></i>&nbsp;${SITE_SPO }
										</button>
									</div>								
								</div>
							</div>
						</form>
					</div>
					<!-- 펀샵 -->
					<div class="col-lg-4">
						<form name="excelUploadForm_SITE_FUN" enctype="multipart/form-data">
							<input type="hidden" name="uploadsheet_site" value="${SITE_FUN }"/>
							<div class="row">
								<div class="col-lg-12 ">
									<div class="col-lg-6 col-md-6">
										<input type="file" name="excelFile" id="excelFile_SITE_FUN"/>
									</div>								
									<div class="col-lg-6 col-md-6">
										<button type="button" class="btn btn-primary btn-lg btn-block" onclick="check('SITE_FUN')">
											<i class="glyphicon glyphicon-upload"></i>&nbsp;${SITE_FUN }
										</button>
									</div>								
								</div>
							</div>
						</form>
					</div>
				</div>
				<!-- /. ROW  -->
				<hr />
				
				
				<div class="row text-center pad-top">
					<!-- 프레시로드 -->
					<div class="col-lg-4">
						<form name="excelUploadForm_SITE_FRESH" enctype="multipart/form-data">
							<input type="hidden" name="uploadsheet_site" value="${SITE_FRESH }"/>
							<div class="row">
								<div class="col-lg-12 ">
									<div class="col-lg-6 col-md-6">
										<input type="file" name="excelFile" id="excelFile_SITE_FRESH"/>
									</div>								
									<div class="col-lg-6 col-md-6">
										<button type="button" class="btn btn-primary btn-lg btn-block" onclick="check('SITE_FRESH')">
											<i class="glyphicon glyphicon-upload"></i>&nbsp;${SITE_FRESH }
										</button>
									</div>								
								</div>
							</div>
						</form>
					</div>
					<!-- 피트니스스토어 -->
					<div class="col-lg-4">
						<form name="excelUploadForm_SITE_FITN" enctype="multipart/form-data">
							<input type="hidden" name="uploadsheet_site" value="${SITE_FITN }"/>
							<div class="row">
								<div class="col-lg-12 ">
									<div class="col-lg-6 col-md-6">
										<input type="file" name="excelFile" id="excelFile_SITE_FITN"/>
									</div>								
									<div class="col-lg-6 col-md-6">
										<button type="button" class="btn btn-primary btn-lg btn-block" onclick="check('SITE_FITN')">
											<i class="glyphicon glyphicon-upload"></i>&nbsp;${SITE_FITN }
										</button>
									</div>								
								</div>
							</div>
						</form>
					</div>
					<!-- 더네베푸드 -->
					<div class="col-lg-4">
						<form name="excelUploadForm_SITE_THENE" enctype="multipart/form-data">
							<input type="hidden" name="uploadsheet_site" value="${SITE_THENE }"/>
							<div class="row">
								<div class="col-lg-12 ">
									<div class="col-lg-6 col-md-6">
										<input type="file" name="excelFile" id="excelFile_SITE_THENE"/>
									</div>								
									<div class="col-lg-6 col-md-6">
										<button type="button" class="btn btn-primary btn-lg btn-block" onclick="check('SITE_THENE')">
											<i class="glyphicon glyphicon-upload"></i>&nbsp;${SITE_THENE }
										</button>
									</div>								
								</div>
							</div>
						</form>
					</div>
				</div>
				<!-- /. ROW  -->
				<hr />
				
				
				
				<div class="row text-center pad-top">
					<!-- 몬스터짐 -->
					<div class="col-lg-4">
						<form name="excelUploadForm_SITE_MONSTER" enctype="multipart/form-data">
							<input type="hidden" name="uploadsheet_site" value="${SITE_MONSTER }"/>
							<div class="row">
								<div class="col-lg-12 ">
									<div class="col-lg-6 col-md-6">
										<input type="file" name="excelFile" id="excelFile_SITE_MONSTER"/>
									</div>								
									<div class="col-lg-6 col-md-6">
										<button type="button" class="btn btn-primary btn-lg btn-block" onclick="check('SITE_MONSTER')">
											<i class="glyphicon glyphicon-upload"></i>&nbsp;${SITE_MONSTER }
										</button>
									</div>								
								</div>
							</div>
						</form>
					</div>
					<!-- 디스피스(케어니스) -->
					<div class="col-lg-4">
						<form name="excelUploadForm_SITE_THIS" enctype="multipart/form-data">
							<input type="hidden" name="uploadsheet_site" value="${SITE_THIS }"/>
							<div class="row">
								<div class="col-lg-12 ">
									<div class="col-lg-6 col-md-6">
										<input type="file" name="excelFile" id="excelFile_SITE_THIS"/>
									</div>								
									<div class="col-lg-6 col-md-6">
										<button type="button" class="btn btn-primary btn-lg btn-block" onclick="check('SITE_THIS')">
											<i class="glyphicon glyphicon-upload"></i>&nbsp;${SITE_THIS }
										</button>
									</div>								
								</div>
							</div>
						</form>
					</div>
					<!-- 알앤알(이홈데코) -->
					<div class="col-lg-4">
						<form name="excelUploadForm_SITE_RNR" enctype="multipart/form-data">
							<input type="hidden" name="uploadsheet_site" value="${SITE_RNR }"/>
							<div class="row">
								<div class="col-lg-12 ">
									<div class="col-lg-6 col-md-6">
										<input type="file" name="excelFile" id="excelFile_SITE_RNR"/>
									</div>								
									<div class="col-lg-6 col-md-6">
										<button type="button" class="btn btn-primary btn-lg btn-block" onclick="check('SITE_RNR')">
											<i class="glyphicon glyphicon-upload"></i>&nbsp;${SITE_RNR }
										</button>
									</div>								
								</div>
							</div>
						</form>
					</div>
				</div>
				<!-- /. ROW  -->
				<hr />
				
				
				<div class="row text-center pad-top">
					<!-- 남선지티엘 -->
					<div class="col-lg-4">
						<form name="excelUploadForm_SITE_NAMSEON" enctype="multipart/form-data">
							<input type="hidden" name="uploadsheet_site" value="${SITE_NAMSEON }"/>
							<div class="row">
								<div class="col-lg-12 ">
									<div class="col-lg-6 col-md-6">
										<input type="file" name="excelFile" id="excelFile_SITE_NAMSEON"/>
									</div>								
									<div class="col-lg-6 col-md-6">
										<button type="button" class="btn btn-primary btn-lg btn-block" onclick="check('SITE_NAMSEON')">
											<i class="glyphicon glyphicon-upload"></i>&nbsp;${SITE_NAMSEON }
										</button>
									</div>								
								</div>
							</div>
						</form>
					</div>
					<!-- 카카오 -->
					<div class="col-lg-4">
						<form name="excelUploadForm_SITE_KAKAO" enctype="multipart/form-data">
							<input type="hidden" name="uploadsheet_site" value="${SITE_KAKAO }"/>
							<div class="row">
								<div class="col-lg-12 ">
									<div class="col-lg-6 col-md-6">
										<input type="file" name="excelFile" id="excelFile_SITE_KAKAO"/>
									</div>								
									<div class="col-lg-6 col-md-6">
										<button type="button" class="btn btn-primary btn-lg btn-block" onclick="check('SITE_KAKAO')">
											<i class="glyphicon glyphicon-upload"></i>&nbsp;${SITE_KAKAO }
										</button>
									</div>								
								</div>
							</div>
						</form>
					</div>
					<!-- 자사몰 -->
					<div class="col-lg-4">
						<form name="excelUploadForm_SITE_SELF" enctype="multipart/form-data">
							<input type="hidden" name="uploadsheet_site" value="${SITE_SELF }"/>
							<div class="row">
								<div class="col-lg-12 ">
									<div class="col-lg-6 col-md-6">
										<input type="file" name="excelFile" id="excelFile_SITE_SELF"/>
									</div>								
									<div class="col-lg-6 col-md-6">
										<button type="button" class="btn btn-primary btn-lg btn-block" onclick="check('SITE_SELF')">
											<i class="glyphicon glyphicon-upload"></i>&nbsp;${SITE_SELF }
										</button>
									</div>								
								</div>
							</div>
						</form>
					</div>
				</div>
				<!-- /. ROW  -->
				<hr />
				
				
				
				
				
				<!-- 업로드 내용 -->
				<div class="row text-center pad-top table_size_scroll_01" id="pop_excel_upload_form">
				
				
					<div class="col-lg-12">
					
						<table id="dataTable" class="table table-striped table-bordered table-hover">
							<thead>
								<tr>
									<th>업로드사이트</th>
									<th>순서</th>
									<th>쇼핑몰</th>
									<th>주문일시</th>
									<th>수집일시</th>
									<th>사방넷 상품코드</th>
									<th>사방넷주문번호</th>
									<th>수집 상품명</th>
									<th>수집 옵션명</th>
									<th>확정 상품명</th>
									<th>확정 옵션명</th>
									<th>상품약어</th>
									<th>옵션별칭</th>
									<th>수량</th>
									<th>확정수량</th>
									<th>주문자명</th>
									<th>주문자전화번호 1</th>
									<th>주문자전화번호 2</th>
									<th>수취인명</th>
									<th>수취인전화번호1</th>
									<th>수취인전화번호2</th>
									<th>수취인우편번호</th>
									<th>수취인주소</th>
									<th>배송메세지</th>
									<th>배송구분(수집)</th>
									<th>배송비(수집)</th>
									<th>판매가(수집)</th>
									<th>공급단가</th>
									<th>결제금액</th>
									<th>택배사</th>
									<th>송장번호</th>
								</tr>
							</thead>
							<tbody>
							</tbody>
						</table>
					
					</div>
				
				</div>
				<!-- /. ROW  -->
				
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

	function checkFileType(filePath) {
		var fileFormat = filePath.split(".");
		if (fileFormat.indexOf("xlsx") > -1 || fileFormat.indexOf("xls") > -1) {
			return true;
		} else {
			return false;
		}
	}
	
	function check(uploadsheet_site) {
		var file = $("#excelFile_"+uploadsheet_site).val();
		if (file == "" || file == null) {
			alert("파일을 선택해주세요.");
			return false;
		} else if (!checkFileType(file)) {
			alert("엑셀 파일만 업로드 가능합니다.");
			return false;
		}
	
		if (confirm("업로드 하시겠습니까?")) {
// 			$('#pop_excel_upload_form').empty();
			var formData = new FormData($("form[name=excelUploadForm_"+uploadsheet_site+"]")[0]);
			$.ajax({
				type : 'post',
				url : '/uploadSheet/excelUploadAjax.do',
				data : formData,
				processData : false,
				contentType : false,
				success : function(data) {
					console.log(data);
// 					$('#pop_excel_upload_form').html(data);
					$('#dataTable > tbody:last').append(data);
				},
				error : function(error) {
					alert("파일 업로드에 실패하였습니다.");
					console.log(error);
					console.log(error.status);
				}
			});
		}
	}
	
	
	$("#btnReg").on("click", function(event) {
		event.preventDefault();
		
		if(confirm("등록 하시겠습니까?")) {
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
				url : '/uploadSheet/uploadSheetInsert.do',
				data : JSON.stringify(data),
				dataType:"json",
				contentType:"application/json; charset=UTF-8",
				success:function(responseData){
					var data = responseData.resultJson;
					if(data.rCode == "${STATUS_S_CODE}"){
						alert("저장 되었습니다.");
						$('#pop_excel_upload_form').empty();
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
	
</script>

</body>
</html>


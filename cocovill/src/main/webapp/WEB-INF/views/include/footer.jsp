<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!-- S:FILE:footer.jsp -->
	<div class="footer">
		<div class="row">
			<div class="col-lg-12">
				&copy; 2018 cocovill.com | Design by: <a
					href="http://binarytheme.com" style="color: #fff;" target="_blank">www.binarytheme.com</a>
			</div>
		</div>
	</div>
	
	<!-- popup -->
	<div id="dialog" title="상세">
		<p>이것은 기본 대화상자 입니다. 이동하거나 닫을 수 있습니다.</p>
	</div>
	
	<!-- loading -->
	<div id="wait" style="display:none;width:69px;height:89px;position:absolute;padding:2px;"><img src='/resources/img/demo_wait.gif' width="64" height="64" /><br>Loading..</div>
<!-- E:FILE:footer.jsp -->

<script>

	jQuery.fn.center = function () {
		this.css("position","absolute");
		this.css("top", Math.max(0, (($(window).height() - $(this).outerHeight()) / 2) + $(window).scrollTop()) + "px");
		this.css("left", Math.max(0, (($(window).width() - $(this).outerWidth()) / 2) + $(window).scrollLeft()) + "px");
		return this;
	}
	$(document).ajaxStart(function(){
		$("#wait").css("display", "block");
		$("#wait").center();
	});
	$(document).ajaxComplete(function(){
		$("#wait").css("display", "none");
	});
	
	// dialog 설정
	$('#dialog').dialog({
		autoOpen: false,
		resizable: false,
		width:'auto'
	});
	
</script>	
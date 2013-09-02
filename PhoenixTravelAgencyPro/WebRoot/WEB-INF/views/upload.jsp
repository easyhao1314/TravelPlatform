<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
<title>test</title>
<link rel="stylesheet" type="text/css" href="js/plupload/jquery.plupload.queue/css/jquery.plupload.queue.css" type="text/css" media="screen" />
<script type="text/javascript" src="js/jquery.min.js" ></script>
<script type="text/javascript" src="js/plupload/plupload.full.js"></script>
<script type="text/javascript" src="js/plupload/jquery.plupload.queue/jquery.plupload.queue.js"></script>
<script type="text/javascript" src="js/plupload/i18n/cn.js"></script>
<script type="text/javascript">
/* Convert divs to queue widgets when the DOM is ready */
$(function(){
	function plupload(){
		$("#uploader").pluploadQueue({
			// General settings
			runtimes : 'html5,gears,browserplus,silverlight,flash,html4',
			url : 'fenghuang/uploadFile.do',
			max_file_size : '10mb',
			unique_names : true,
			chunk_size: '2mb',
			// Specify what files to browse for
			filters : [
				{title: "Image files", extensions: "jpg,gif,png"},
				{title: "Zip files", extensions: "zip"}
			],
			resize: {width: 320, height: 240, quality: 90},
	
			// Flash settings
			flash_swf_url : 'js/plupload/plupload.flash.swf',
			// Silverlight settings
			silverlight_xap_url : 'js/plupload/plupload.silverlight.xap',
			multipart_params: {'user': 'dujunzhi', 'time': '2012-06-12'}
		});
	}
	plupload();
	$('#clear').click(function(){
		plupload();
	});
});
</script>

</head>

<body>
	<div>
		<div style="width: 450px; margin: 0px auto">
			<form id="formId" action="Submit.action" method="post">
				<div id="uploader">
					<p>您的浏览器未安装 Flash, Silverlight, Gears, BrowserPlus 或者支持 HTML5 .</p>
				</div>
				<input type="button" value="重新上传" id="clear"/>
			</form>
		</div>
	</div>
</body>

</html>
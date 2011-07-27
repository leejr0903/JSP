<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>iframe</title>
<script type="text/javascript">
function doclick(theForm){
 
 document.getElementById("iframe").src="iframe.jsp?name=" + theForm.name;
 
}
</script>
</head>
<body>

<input type="button" value="호출" name="name_val" onclick="doclick(this)" />

<iframe name="iframe" id="iframe" src='#'></iframe>


</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script>
// iframe 호출
function doclick(theForm){
	document.getElementById("iframe").src="iframe.jsp?name=" + theForm.name;
}
// iframe에서 호출
function get_val(key){
	eval("document.forms.lblcall_iframe." + key + ".checked = false");
}
</script>
</head>

<body>

<form name="call_iframe" id="lblcall_iframe" action="">
	<input type="radio" value="call_iframe" name="call_iframe" id="call_iframe" onclick="doclick(this)" />
	Go iframe
</form>

<iframe name="iframe" id="iframe" src='#' style="width:0;height:0;"></iframe>

</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>request 내장 객체 - 파라미터 정보 가져오기</title>
</head>
<body>
데이터를 입력, 선택한 다음 확인 버튼을 클릭하세요.<br>
<form name="request2" method="post" action="request2_result.jsp">
웹 사이트 주소 : <input type="text" name="url" size="20"><br>
서버 운영체제 : 
<select name="os">
<option selected>CentOS Linux</option>
<option>Solaris</option>
<option>Windows 2000</option>
</select>
<br>
웹 프로그래밍 : 
<input type="checkbox" name="wp" value="PHP">PHP
<input type="checkbox" name="wp" value="JSP">JSP
<input type="checkbox" name="wp" value="PYTHON">PYTHON
<br><br>
<input type="submit" value="확인"> <input type="reset" value="취소">
</form>
</body>
</html>
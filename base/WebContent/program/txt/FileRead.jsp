<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>

<%@ page import="java.io.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>txt 입력</title>
</head>
<body>

	<%
		//File file = new File(request.getSession().getServletContext().getRealPath("/program/unccd/lodging/txt/"), "temp" + ".txt");
		File file = new File(
				"D:/JSP/Git/JSP/base/WebContent/program/txt/data", "temp"
						+ ".txt");

		BufferedReader reader = null;

		if (file.exists()) {
			try {
				reader = new BufferedReader(new InputStreamReader(
						new FileInputStream(file), "utf-8"));
				String content = null;
	%>

	<form action="FileWrite.jsp" method="get">
		<table>
			<tr>
				<th>내용</th>
				<td>
				<textarea name="content" cols="50" rows="20" ><% while ((content = reader.readLine()) != null) { %>
<%=content%><% } %></textarea>
				</td>
			</tr>
			<tr>
				<td><input type="submit" value="저장" />
				</td>
			</tr>
		</table>
	</form>

	<%
		} catch (UnsupportedEncodingException ue) {
				out.println("Not supported : ");
			} catch (IOException e) {
				out.println(e.getMessage());
			} finally {
				if (reader != null)
					reader.close();
			}
		} else {
	%>
	<form action="FileWrite.jsp" method="get">
		<table>
			<tr>
				<td><input type="text" name="txt1" />
				</td>
			</tr>
			<tr>
				<td><input type="submit" value="고" />
				</td>
			</tr>
		</table>
	</form>
	<%
		}
	%>
</body>
</html>
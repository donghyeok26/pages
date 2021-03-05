<%@page import="product.productDTO"%>
<%@page import="product.productDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
String param = request.getParameter("proID");
if (param == null) {
	param = "";
}
productDAO pd = new productDAO();
productDTO pt = pd.getdetail(param);

pageContext.setAttribute("p", pt);//contentDTO 가 들어가있는 배열 list


%>
	<table border=1>
		<tr>
			<td rowspan=3><img alt="" src="${p.path }"></td>
			<td>${p.proName }</td>
		</tr>
		<tr>
			<td>b</td>
		</tr>

	</table>
</body>
</html>
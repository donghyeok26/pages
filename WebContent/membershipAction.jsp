<%@page import="java.io.PrintWriter"%>
<%@page import="user.userDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="ut" class="user.userDTO"></jsp:useBean>
<jsp:setProperty property="userID" name="ut"/>
<jsp:setProperty property="userPASS" name="ut"/>
<jsp:setProperty property="userName" name="ut"/>
<jsp:setProperty property="userNum" name="ut"/>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
	System.out.println(ut.getUserID());
	System.out.println(ut.getUserPASS());
	System.out.println(ut.getUserNum());
	
	String userID = null;
	if(session.getAttribute("uesrID")!=null){
		userID = (String)session.getAttribute("userID");
	}
	
	if(userID !=null){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('이미 가입된 아이디입니다.')");
		script.println("history.back()");
		script.println("</script>");
	}
	
	userDAO ud = new userDAO();
	int count = ud.join(ut);
	if(count == -1){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('이미 가입된 아이디입니다.')");
		script.println("history.back()");
		script.println("</script>");
	}else{
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('가입이 완료되었습니다.')");
		script.println("location.href='login.jsp'");
		script.println("</script>");
	}
	%>
</body>
</html>
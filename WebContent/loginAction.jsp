<%@page import="java.io.PrintWriter"%>
<%@page import="user.userDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="user" class="user.userDTO"></jsp:useBean>
<jsp:setProperty property="userID" name="user"/>
<jsp:setProperty property="userPASS" name="user"/>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
	String userID = null;
	if(session.getAttribute("userID")!=null){
		userID = (String)session.getAttribute("userID");
	}
	
	if(userID !=null){
		System.out.println(userID);
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('이미 로그인되어 있습니다.')");
		script.println("history.back()");
		script.println("</script>");
	}
	
	userDAO ud = new userDAO();
	String uid = user.getUserID();
	String upass = user.getUserPASS();
	
	
	int result = ud.login(uid, upass);
	
	if(result ==1){ //로그인 성공
		PrintWriter script = response.getWriter();
		session.setAttribute("userID", user.getUserID());
		script.println("<script>");
		script.println("location.href='LIM.jsp'");
		script.println("</script>");
	}else if(result ==0){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('패스워드를 확인하세요')");
		script.println("history.back()");
		script.println("</script>");
	}
	else if(result ==-1){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('가입되지 않은 회원입니다.')");
		script.println("history.back()");
		script.println("</script>");
	}
	else if(result ==-2){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('DB오류입니다. 조금만 기다려주세요')");
		script.println("history.back()");
		script.println("</script>");
	}
	
	
	%>
</body>
</html>
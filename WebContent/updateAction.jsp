<%@page import="CONTENT.contentDAO"%>
<%@page import="CONTENT.CONTENTDTO"%>
<%@page import="java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
 <%request.setCharacterEncoding("UTF-8"); %>
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

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
	
	if(userID ==null){
		System.out.println(userID);
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('로그인을 먼저 해주세요.')");
		script.println("location.href='login.jsp'");
		script.println("</script>");
	}
	
	int contentID = 0;
	//컨텐츠 값 호출 후 변환
	if(request.getParameter("contentID")!=null){
		contentID = Integer.parseInt(request.getParameter("contentID"));
	}
	
	//컨텐츠 값이 없으면 없는 글
	if(contentID ==0){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('유효하지 않은 글입니다.')");
		script.println("location.href='login.jsp'");
		script.println("</script>");
	}
			
		CONTENTDTO cd = new contentDAO().getContent(contentID);
		if(!userID.equals(cd.getUserID())){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('수정할 권한이 없습니다.')");
			script.println("location.href='board.jsp'");
			script.println("</script>");
		}else{
			contentDAO ct = new contentDAO();
			String paramT=request.getParameter("title");
			String paramC=request.getParameter("content");
			
			int result = ct.updateContent(contentID, paramT, paramC);
			
			if(result ==-1){
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('수정에 실패하였습니다.')");
				script.println("history.back()");
				script.println("</script>");
			}else{
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('수정 되었습니다.')");
				script.println("location.href='board.jsp'");
				script.println("</script>");
			}
		}
	
%>
</body>
</html>
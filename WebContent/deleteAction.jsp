<%@page import="CONTENT.CONTENTDTO"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="CONTENT.contentDAO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<%
	
	//세션체크
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
			script.println("alert('삭제할 권한이 없습니다.')");
			script.println("location.href='board.jsp'");
			script.println("</script>");
		}else{	
			contentDAO ct = new contentDAO();
			int result = ct.delContent(contentID); //삭제
			
			
			if(result ==-1){
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('삭제에 실패하였습니다.')");
				script.println("history.back()");
				script.println("</script>");
			}else{
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('삭제 되었습니다.')");
				script.println("location.href='board.jsp'");
				script.println("</script>");
			}
		
		}
	%>
</body>
</html>
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
	
	//����üũ
	String userID = null;
	if(session.getAttribute("userID")!=null){
		userID = (String)session.getAttribute("userID");
	}
	
	if(userID ==null){
		System.out.println(userID);
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('�α����� ���� ���ּ���.')");
		script.println("location.href='login.jsp'");
		script.println("</script>");
	}
	
	int contentID = 0;
	//������ �� ȣ�� �� ��ȯ
	if(request.getParameter("contentID")!=null){
		contentID = Integer.parseInt(request.getParameter("contentID"));
	}
	
	//������ ���� ������ ���� ��
	if(contentID ==0){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('��ȿ���� ���� ���Դϴ�.')");
		script.println("location.href='login.jsp'");
		script.println("</script>");
	}
		
		CONTENTDTO cd = new contentDAO().getContent(contentID);
		if(!userID.equals(cd.getUserID())){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('������ ������ �����ϴ�.')");
			script.println("location.href='board.jsp'");
			script.println("</script>");
		}else{	
			contentDAO ct = new contentDAO();
			int result = ct.delContent(contentID); //����
			
			
			if(result ==-1){
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('������ �����Ͽ����ϴ�.')");
				script.println("history.back()");
				script.println("</script>");
			}else{
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('���� �Ǿ����ϴ�.')");
				script.println("location.href='board.jsp'");
				script.println("</script>");
			}
		
		}
	%>
</body>
</html>
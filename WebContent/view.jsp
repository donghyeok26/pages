<%@page import="CONTENT.contentDAO"%>
<%@page import="CONTENT.CONTENTDTO"%>
<%@page import="java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<script>
	function delContent(ID){
		let coment = confirm("삭제 하시겠습니까?");
		if(coment == true){
			location.href="deleteAction.jsp?contentID="+ID;
		}
		else if(coment == false){
			
		}
	}
</script>
	<%
		int contentID= 0;
		String param = request.getParameter("contentID");
		if(param != null)
				contentID = Integer.parseInt(param);
		
		if(contentID ==0){
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('유효하지 않은 글입니다.')");
				script.println("location.href='board.jsp");
				script.println("</script>");
			}
		
		contentDAO cd = new contentDAO();
	//둘어올떄마다 hit 수 증가
	CONTENTDTO ct = new contentDAO().getContent(contentID);
	//쿠키를 이용한 새로고침 hit 수 증가 막음
	Cookie[] cookies = request.getCookies();
	Cookie viewCookie = null;
	if(cookies !=null && cookies.length>0){
		for (int i = 0; i<cookies.length; i++){
			if(cookies[i].getName().equals("cookie"+contentID)){
				System.out.println("처음 쿠키 생성 후 백");
				viewCookie=cookies[i] ;
			}
		}
	}
	
		if(viewCookie==null){
			Cookie newCookie = new Cookie("cookie"+contentID,"|" + contentID + "|");
			response.addCookie(newCookie);
			cd.addHit(ct.getHit(), contentID);
		}
		
	%>
	
	
	<table border=1>
		<tr>
			<th>제목</th>
			<td><%= ct.getTitle() %></td>
		</tr>
		<tr>
			<th>작성자</th>
			<td><%= ct.getContentID() %></td>
		</tr>
		<tr>
			<th>작성일자</th>
			<td><%= ct.getRegdate() %></td>
		</tr>
		<tr>
			<th>HIT</th>
			<td><%= ct.getHit() %></td>
		</tr>
		<tr>
			<th>글 내용</th>
			<td><%= ct.getContent() %></td>
		</tr>
	</table>
	<a href="board.jsp?p=${param.p}&f=${param.f}&${param.q}">목록으로</a>
	<a href="update.jsp?contentID=<%= contentID %>">수정</a>
	<input type="button" onclick="delContent(${param.contentID})" value="삭제"/>
</body>
</html>
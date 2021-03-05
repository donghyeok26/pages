<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<link rel="stylesheet" href="style.css">
<body>
  <div id="wrap">
        <div class="inner">
            <header>
                <h1>
                    <img src="./image/LIM_LOGO.png" alt="">
                </h1>
            </header>
            <form action="membershipAction.jsp" method="post">
            <section class="input_box">
              <input class="id" name="userID" type="email" placeholder="아이디">
              <input class="password" name="userPASS" type="password" placeholder="패스워드">
            </section>
            <section id="private">
                <input class="name" name="userName" type="text" placeholder="이름">
                <input class="number" name="userNum" type="tel" placeholder="전화번호">
            </section>
            <section id="submit">
                <input type="submit" name="cmd" value="submit">
            </section>
            </form>
        </div>
    </div>

</body>
</html>
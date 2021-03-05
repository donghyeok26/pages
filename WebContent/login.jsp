<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>LIM_login</title>
    <link rel="stylesheet" href="./css/style.css">
</head>

<body>
    <div id="wrap">
    <form action="loginAction.jsp" method="post">
        <div class="inner">
            <h1>
                <img src="./image/LIM_LOGO.png" alt="logo">
            </h1>
            <div class="input_box">
                <input class="id" type="text" name="userID" placeholder="E-mail">
                <input class="password" type="password" name="userPASS" placeholder="password">
                <div>
                    <p>
                    <input type="submit" value="login">
                    </p>
                </div>
            </div>
            <div class="login_nav">
                <ul>
                    <a href="#">
                        <li>
                            아이디 찾기
                        </li>
                    </a>
                    <li>|</li>
                    <a href="#">
                        <li>
                            비밀번호 찾기
                        </li>
                    </a>
                    <li>|</li>
                    <a href="membership.jsp">
                        <li>
                            회원가입
                        </li>
                    </a>
                </ul>
            </div>
        </div>
        </form>
    </div>
</body>

</html>
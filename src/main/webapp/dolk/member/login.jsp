<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>로그인</title>
    <link rel="stylesheet" href="css/login.css">
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400;500;700&display=swap" rel="stylesheet">

</head>
<body>
    <%@ include file="../common/header.jsp" %>
    <div class="login-container">
        <div class="login-panel">
            <h1></h1>
            
            <form id="loginForm" class="login-form" action="loginProcess.jsp" method="post">
                <div class="input-group">
                    <label for="userId">아이디</label>
                    <input type="text" id="userId" name="userId" required>
                </div>
                
                <div class="input-group">
                    <label for="password">비밀번호</label>
                    <input type="password" id="password" name="password" required>
                </div>
                
                <div class="login-options">
                    <a href="findId.jsp" class="find-account">아이디/비밀번호 찾기</a>
                    <label class="keep-login">
                        <input type="checkbox" id="keepLogin" name="keepLogin">
                        <span class="checkmark"></span>
                        로그인 유지
                    </label>
                </div>
                
                <button type="submit" class="signin-btn">sign in</button>
                
                <div id="errorMessage" class="error-message" style="display: none;"></div>
            </form>
            
            <div class="signup-section">
                <a href="signup.jsp" class="signup-link">회원가입</a>
            </div>
            
            <div class="social-login">
                <button class="social-btn google-btn" onclick="socialLogin('google')">
                    <img src="../assets/img/icons/social/google-plus.png" alt="Google" class="social-icon">
                </button>
                <button class="social-btn naver-btn" onclick="socialLogin('naver')">
                    <img src="../assets/img/icons/social/facebook.png" alt="Naver" class="social-icon">
                </button>
            </div>
        </div>
    </div>
    
    <!-- Assets 스크립트 참조 -->
    <script src="../assets/js/jquery-1.10.2.min.js"></script>
    <script src="../assets/js/scripts.js"></script>
</body>
</html>

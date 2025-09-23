<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Dolk 로그인</title>
    
    <!-- Assets 스타일 참조 -->
    <link rel="stylesheet" href="../assets/fonts/fonts.css">
    <link rel="stylesheet" href="../assets/css/style.css">
    <link rel="stylesheet" href="../assets/css/buttons.css">
    <link rel="stylesheet" href="../assets/css/gray.css">
    
    <!-- 로그인 전용 스타일 -->
    <link rel="stylesheet" href="../assets/css/login.css">
</head>
<body>
    <div class="login-container">
        <div class="login-panel">
            <h1 class="login-title">Dolk 로그인</h1>
            
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
                    <a href="findAccount.jsp" class="find-account">아이디/비밀번호 찾기</a>
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

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>로그인 - Dolk</title>
    
    <!-- Assets 스타일 참조 -->
    <link rel="stylesheet" href="../assets/fonts/fonts.css">
    <link rel="stylesheet" href="../assets/css/style.css">
    <link rel="stylesheet" href="../assets/css/buttons.css">
    <link rel="stylesheet" href="../assets/css/gray.css">
    <link rel="stylesheet" href="../assets/css/header.css">
    <link rel="stylesheet" href="../assets/bootstrap/css/bootstrap.min.css">

</head>
<body>
    <%@ include file="../common/header.jsp" %>
    
    <style>
        /* 로그인 페이지 전용 스타일 */
        .login-page {
            margin-top: 155px;
            min-height: calc(100vh - 155px);
            display: flex;
            align-items: center;
            justify-content: center;
            background: #f8f9fa;
            padding: 40px 20px;
        }
        
        .login-container {
            max-width: 400px;
            width: 100%;
            background: #fff;
            border-radius: 8px;
            box-shadow: 0 4px 20px rgba(0,0,0,0.1);
            padding: 40px;
        }
        
        .login-header {
            text-align: center;
            margin-bottom: 30px;
        }
        
        .login-header h1 {
            font-family: 'signikabold', sans-serif;
            font-size: 32px;
            color: #464c5c;
            margin: 0 0 10px 0;
            text-transform: uppercase;
        }
        
        .login-header p {
            font-family: 'signikaregular', sans-serif;
            font-size: 14px;
            color: #9ea0a6;
            margin: 0;
        }
        
        .login-form {
            margin-bottom: 30px;
        }
        
        .form-group {
            margin-bottom: 20px;
        }
        
        .form-group label {
            display: block;
            font-family: 'signikasemibold', sans-serif;
            font-size: 14px;
            color: #464c5c;
            margin-bottom: 8px;
            text-transform: uppercase;
        }
        
        .form-group input {
            width: 100%;
            height: 50px;
            padding: 0 15px;
            border: 2px solid #e7e7e7;
            border-radius: 4px;
            font-family: 'signikaregular', sans-serif;
            font-size: 16px;
            color: #464c5c;
            background: #fff;
            transition: all 0.3s ease;
            box-sizing: border-box;
        }
        
        .form-group input:focus {
            outline: none;
            border-color: #9ccbc0;
            box-shadow: 0 0 0 3px rgba(156, 203, 192, 0.1);
        }
        
        .login-options {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 25px;
        }
        
        .find-account {
            font-family: 'signikaregular', sans-serif;
            font-size: 14px;
            color: #9ccbc0;
            text-decoration: none;
            transition: all 0.3s ease;
        }
        
        .find-account:hover {
            color: #464c5c;
        }
        
        .keep-login {
            display: flex;
            align-items: center;
            font-family: 'signikaregular', sans-serif;
            font-size: 14px;
            color: #464c5c;
            cursor: pointer;
        }
        
        .keep-login input[type="checkbox"] {
            width: auto;
            height: auto;
            margin-right: 8px;
        }
        
        .login-btn {
            width: 100%;
            height: 53px;
            background: #9ccbc0;
            color: #464c5c;
            border: none;
            border-radius: 4px;
            font-family: 'signikabold', sans-serif;
            font-size: 18px;
            text-transform: uppercase;
            cursor: pointer;
            transition: all 0.3s ease;
            margin-bottom: 20px;
        }
        
        .login-btn:hover {
            background: #464c5c;
            color: #9ccbc0;
        }
        
        .error-message {
            background: #f8d7da;
            color: #721c24;
            padding: 12px;
            border-radius: 4px;
            font-family: 'signikaregular', sans-serif;
            font-size: 14px;
            text-align: center;
            margin-bottom: 20px;
        }
        
        .signup-section {
            text-align: center;
            margin-bottom: 30px;
        }
        
        .signup-link {
            font-family: 'signikaregular', sans-serif;
            font-size: 16px;
            color: #464c5c;
            text-decoration: none;
            transition: all 0.3s ease;
        }
        
        .signup-link:hover {
            color: #9ccbc0;
        }
        
        .social-login {
            display: flex;
            justify-content: center;
            gap: 15px;
        }
        
        .social-btn {
            width: 50px;
            height: 50px;
            border: 2px solid #e7e7e7;
            border-radius: 50%;
            background: #fff;
            cursor: pointer;
            transition: all 0.3s ease;
            display: flex;
            align-items: center;
            justify-content: center;
        }
        
        .social-btn:hover {
            border-color: #9ccbc0;
            background: #9ccbc0;
        }
        
        .social-icon {
            width: 24px;
            height: 24px;
        }
        
        /* 반응형 디자인 */
        @media (max-width: 768px) {
            .login-page {
                margin-top: 0;
                min-height: 100vh;
                padding: 20px;
            }
            
            .login-container {
                padding: 30px 20px;
            }
            
            .login-header h1 {
                font-size: 28px;
            }
        }
    </style>
    
    <div class="login-page">
        <div class="login-container">
            <div class="login-header">
                <h1>로그인</h1>
                <p>Dolk에 오신 것을 환영합니다</p>
            </div>
            
            <form id="loginForm" class="login-form" action="loginProcess.jsp" method="post">
                <div class="form-group">
                    <label for="userId">아이디</label>
                    <input type="text" id="userId" name="userId" required>
                </div>
                
                <div class="form-group">
                    <label for="password">비밀번호</label>
                    <input type="password" id="password" name="password" required>
                </div>
                
                <div class="login-options">
                    <a href="findId.jsp" class="find-account">아이디/비밀번호 찾기</a>
                    <label class="keep-login">
                        <input type="checkbox" id="keepLogin" name="keepLogin">
                        로그인 유지
                    </label>
                </div>
                
                <button type="submit" class="login-btn">로그인</button>
                
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

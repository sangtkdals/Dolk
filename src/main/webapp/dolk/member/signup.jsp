<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>회원가입 - Dolk</title>
    <link rel="stylesheet" href="css/signup.css">
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400;500;700&display=swap" rel="stylesheet">
</head>
<body>
    <div class="signup-container">
        <div class="signup-panel">
            <h1 class="signup-title">회원가입</h1>
            
            <form id="signupForm" class="signup-form">
                <!-- 아이디 -->
                <div class="form-group">
                    <label for="userId" class="form-label">아이디</label>
                    <div class="input-with-button">
                        <input type="text" id="userId" name="userId" placeholder="아이디 입력 (8~20자)" maxlength="20" required>
                        <button type="button" id="checkUserIdBtn" class="check-btn">아이디 중복확인</button>
                    </div>
                    <div id="userIdCheck" class="input-feedback"></div>
                </div>
                
                <!-- 비밀번호 -->
                <div class="form-group">
                    <label for="password" class="form-label">비밀번호</label>
                    <input type="password" id="password" name="password" placeholder="비밀번호 입력 (문자, 숫자 포함 8-20자)" maxlength="20" required>
                    <div id="passwordStrength" class="password-strength"></div>
                </div>
                
                <!-- 비밀번호 확인 -->
                <div class="form-group">
                    <label for="confirmPassword" class="form-label">비밀번호 확인</label>
                    <input type="password" id="confirmPassword" name="confirmPassword" placeholder="비밀번호 재입력" maxlength="20" required>
                    <div id="passwordMatch" class="input-feedback"></div>
                </div>
                
                <!-- 이메일 -->
                <div class="form-group">
                    <label for="email" class="form-label">이메일</label>
                    <div class="email-input">
                        <input type="text" id="emailId" name="emailId" placeholder="이메일 주소" required>
                        <span class="email-at">@</span>
                        <select id="emailDomain" name="emailDomain" class="email-domain">
                            <option value="naver.com">naver.com</option>
                            <option value="gmail.com">gmail.com</option>
                            <option value="daum.net">daum.net</option>
                            <option value="yahoo.com">yahoo.com</option>
                            <option value="custom">직접입력</option>
                        </select>
                        <input type="text" id="customDomain" name="customDomain" placeholder="도메인 입력" style="display: none;">
                    </div>
                    <div id="emailCheck" class="input-feedback"></div>
                </div>
                
                <!-- 이름 -->
                <div class="form-group">
                    <label for="name" class="form-label">이름</label>
                    <input type="text" id="name" name="name" placeholder="이름을 입력해주세요" maxlength="20" required>
                </div>
                
                <!-- 생년월일 -->
                <div class="form-group">
                    <label for="birthYear" class="form-label">생년월일</label>
                    <div class="birth-input">
                        <select id="birthYear" name="birthYear" class="birth-select" required>
                            <option value="">년도</option>
                        </select>
                        <select id="birthMonth" name="birthMonth" class="birth-select" required>
                            <option value="">월</option>
                        </select>
                        <select id="birthDay" name="birthDay" class="birth-select" required>
                            <option value="">일</option>
                        </select>
                    </div>
                </div>
                
                <!-- 주민등록번호 -->
                <div class="form-group">
                    <label for="ssn1" class="form-label">주민등록번호</label>
                    <div class="ssn-input">
                        <input type="text" id="ssn1" name="ssn1" placeholder="주민등록번호 앞자리" maxlength="6" pattern="[0-9]{6}">
                        <span class="ssn-dash">-</span>
                        <input type="password" id="ssn2" name="ssn2" placeholder="주민등록번호 뒷자리" maxlength="7" pattern="[0-9]{7}">
                    </div>
                </div>
                
                <!-- 버튼 -->
                <div class="button-group">
                    <button type="submit" class="signup-btn">가입하기</button>
                    <button type="button" class="cancel-btn" onclick="location.href='login.jsp'">취소하기</button>
                </div>
                
                <div id="errorMessage" class="error-message" style="display: none;"></div>
            </form>
        </div>
    </div>
    
    <script src="js/signup.js"></script>
</body>
</html>

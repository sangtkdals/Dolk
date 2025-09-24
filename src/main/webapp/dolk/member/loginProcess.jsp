<%@ page language="java" contentType="application/json; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.security.MessageDigest" %>
<%@ page import="java.nio.charset.StandardCharsets" %>
<%
    response.setContentType("application/json");
    response.setCharacterEncoding("UTF-8");
    
    String userId = request.getParameter("userId");
    String password = request.getParameter("password");
    String keepLogin = request.getParameter("keepLogin");
    
    // JSON 응답을 위한 StringBuilder
    StringBuilder jsonResponse = new StringBuilder();
    
    try {
        // 입력값 검증
        if (userId == null || userId.trim().isEmpty() || 
            password == null || password.trim().isEmpty()) {
            jsonResponse.append("{\"success\": false, \"message\": \"아이디와 비밀번호를 입력해주세요.\"}");
        } else {
            // 데이터베이스 연결 (실제 구현에서는 connection pool 사용 권장)
            String url = "jdbc:mysql://localhost:3306/dolk_db?useSSL=false&serverTimezone=UTC";
            String dbUser = "root";
            String dbPassword = "password";
            
            try (Connection conn = DriverManager.getConnection(url, dbUser, dbPassword)) {
                // 사용자 조회
                String sql = "SELECT user_id, password, name, email FROM users WHERE user_id = ? AND status = 'ACTIVE'";
                try (PreparedStatement pstmt = conn.prepareStatement(sql)) {
                    pstmt.setString(1, userId);
                    
                    try (ResultSet rs = pstmt.executeQuery()) {
                        if (rs.next()) {
                            String storedPassword = rs.getString("password");
                            String userName = rs.getString("name");
                            String userEmail = rs.getString("email");
                            
                            // 비밀번호 검증 (실제 구현에서는 BCrypt 등 사용 권장)
                            if (verifyPassword(password, storedPassword)) {
                                // 로그인 성공
                                session.setAttribute("userId", userId);
                                session.setAttribute("userName", userName);
                                session.setAttribute("userEmail", userEmail);
                                session.setAttribute("loginTime", System.currentTimeMillis());
                                
                                // 로그인 유지 설정
                                if ("true".equals(keepLogin)) {
                                    session.setMaxInactiveInterval(30 * 24 * 60 * 60); // 30일
                                } else {
                                    session.setMaxInactiveInterval(30 * 60); // 30분
                                }
                                
                                // 로그인 로그 기록
                                logLoginAttempt(conn, userId, true, request.getRemoteAddr());
                                
                                jsonResponse.append("{\"success\": true, \"message\": \"로그인 성공\", \"redirectUrl\": \"main.jsp\"}");
                            } else {
                                // 비밀번호 불일치
                                logLoginAttempt(conn, userId, false, request.getRemoteAddr());
                                jsonResponse.append("{\"success\": false, \"message\": \"아이디 또는 비밀번호가 올바르지 않습니다.\"}");
                            }
                        } else {
                            // 사용자 없음
                            logLoginAttempt(conn, userId, false, request.getRemoteAddr());
                            jsonResponse.append("{\"success\": false, \"message\": \"아이디 또는 비밀번호가 올바르지 않습니다.\"}");
                        }
                    }
                }
            } catch (SQLException e) {
                // 데이터베이스 오류
                jsonResponse.append("{\"success\": false, \"message\": \"서버 오류가 발생했습니다. 잠시 후 다시 시도해주세요.\"}");
                e.printStackTrace();
            }
        }
    } catch (Exception e) {
        // 일반 오류
        jsonResponse.append("{\"success\": false, \"message\": \"로그인 처리 중 오류가 발생했습니다.\"}");
        e.printStackTrace();
    }
    
    out.print(jsonResponse.toString());
%>

<%!
    // 비밀번호 검증 메서드 (실제 구현에서는 BCrypt 사용 권장)
    private boolean verifyPassword(String inputPassword, String storedPassword) {
        try {
            // 간단한 해시 비교 (실제로는 BCrypt 사용)
            String hashedInput = hashPassword(inputPassword);
            return hashedInput.equals(storedPassword);
        } catch (Exception e) {
            return false;
        }
    }
    
    // 비밀번호 해시 메서드 (실제 구현에서는 BCrypt 사용 권장)
    private String hashPassword(String password) throws Exception {
        MessageDigest digest = MessageDigest.getInstance("SHA-256");
        byte[] hash = digest.digest(password.getBytes(StandardCharsets.UTF_8));
        StringBuilder hexString = new StringBuilder();
        for (byte b : hash) {
            String hex = Integer.toHexString(0xff & b);
            if (hex.length() == 1) {
                hexString.append('0');
            }
            hexString.append(hex);
        }
        return hexString.toString();
    }
    
    // 로그인 시도 로그 기록
    private void logLoginAttempt(Connection conn, String userId, boolean success, String ipAddress) {
        try {
            String sql = "INSERT INTO login_logs (user_id, success, ip_address, attempt_time) VALUES (?, ?, ?, NOW())";
            try (PreparedStatement pstmt = conn.prepareStatement(sql)) {
                pstmt.setString(1, userId);
                pstmt.setBoolean(2, success);
                pstmt.setString(3, ipAddress);
                pstmt.executeUpdate();
            }
        } catch (SQLException e) {
            // 로그 기록 실패는 무시
            e.printStackTrace();
        }
    }
%>


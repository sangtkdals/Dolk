<%@ page language="java" contentType="application/json; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.security.MessageDigest" %>
<%@ page import="java.nio.charset.StandardCharsets" %>
<%
    response.setContentType("application/json");
    response.setCharacterEncoding("UTF-8");
    
    String type = request.getParameter("type");
    StringBuilder jsonResponse = new StringBuilder();
    
    try {
        if ("checkUserId".equals(type)) {
            // 아이디 중복 확인
            String userId = request.getParameter("userId");
            boolean available = checkUserIdAvailability(userId);
            jsonResponse.append("{\"available\": ").append(available).append("}");
            
        } else if ("checkEmail".equals(type)) {
            // 이메일 중복 확인
            String email = request.getParameter("email");
            boolean available = checkEmailAvailability(email);
            jsonResponse.append("{\"available\": ").append(available).append("}");
            
        } else if ("signup".equals(type)) {
            // 회원가입 처리
            String userId = request.getParameter("userId");
            String password = request.getParameter("password");
            String confirmPassword = request.getParameter("confirmPassword");
            String name = request.getParameter("name");
            String email = request.getParameter("email");
            String birthYear = request.getParameter("birthYear");
            String birthMonth = request.getParameter("birthMonth");
            String birthDay = request.getParameter("birthDay");
            String ssn1 = request.getParameter("ssn1");
            String ssn2 = request.getParameter("ssn2");
            
            // 입력값 검증
            if (userId == null || userId.trim().isEmpty() || 
                password == null || password.trim().isEmpty() ||
                name == null || name.trim().isEmpty() ||
                email == null || email.trim().isEmpty()) {
                jsonResponse.append("{\"success\": false, \"message\": \"필수 필드를 모두 입력해주세요.\"}");
            } else if (userId.length() < 8 || userId.length() > 20) {
                jsonResponse.append("{\"success\": false, \"message\": \"아이디는 8~20자 사이여야 합니다.\"}");
            } else if (!userId.matches("^[a-zA-Z0-9]+$")) {
                jsonResponse.append("{\"success\": false, \"message\": \"아이디는 영문과 숫자만 사용 가능합니다.\"}");
            } else if (password.length() < 8 || password.length() > 20) {
                jsonResponse.append("{\"success\": false, \"message\": \"비밀번호는 8~20자 사이여야 합니다.\"}");
            } else if (!password.matches("^(?=.*[a-zA-Z])(?=.*[0-9]).+$")) {
                jsonResponse.append("{\"success\": false, \"message\": \"비밀번호는 영문과 숫자를 포함해야 합니다.\"}");
            } else if (!password.equals(confirmPassword)) {
                jsonResponse.append("{\"success\": false, \"message\": \"비밀번호가 일치하지 않습니다.\"}");
            } else if (!isValidEmail(email)) {
                jsonResponse.append("{\"success\": false, \"message\": \"올바른 이메일을 입력해주세요.\"}");
            } else if (name.length() < 2 || name.length() > 20) {
                jsonResponse.append("{\"success\": false, \"message\": \"이름은 2~20자 사이여야 합니다.\"}");
            } else {
                // 중복 확인
                if (!checkUserIdAvailability(userId)) {
                    jsonResponse.append("{\"success\": false, \"message\": \"이미 사용 중인 아이디입니다.\"}");
                } else if (!checkEmailAvailability(email)) {
                    jsonResponse.append("{\"success\": false, \"message\": \"이미 사용 중인 이메일입니다.\"}");
                } else {
                    // 회원가입 처리
                    boolean success = createUser(userId, password, name, email, birthYear, birthMonth, birthDay, ssn1, ssn2);
                    if (success) {
                        jsonResponse.append("{\"success\": true, \"message\": \"회원가입이 완료되었습니다.\"}");
                    } else {
                        jsonResponse.append("{\"success\": false, \"message\": \"회원가입 처리 중 오류가 발생했습니다.\"}");
                    }
                }
            }
        } else {
            jsonResponse.append("{\"success\": false, \"message\": \"잘못된 요청입니다.\"}");
        }
    } catch (Exception e) {
        jsonResponse.append("{\"success\": false, \"message\": \"처리 중 오류가 발생했습니다.\"}");
        e.printStackTrace();
    }
    
    out.print(jsonResponse.toString());
%>

<%!
    // 아이디 중복 확인
    private boolean checkUserIdAvailability(String userId) {
        if (userId == null || userId.trim().isEmpty()) {
            System.out.println("DEBUG: userId is null or empty");
            return false;
        }
        
        String url = "jdbc:mysql://localhost:8080/dolk_db?useSSL=false&serverTimezone=UTC";
        String dbUser = "root";
        String dbPassword = "password";
        
        System.out.println("DEBUG: Checking userId availability for: " + userId);
        
        try (Connection conn = DriverManager.getConnection(url, dbUser, dbPassword)) {
            System.out.println("DEBUG: Database connection successful");
            
            String sql = "SELECT user_id FROM users WHERE user_id = ?";
            try (PreparedStatement pstmt = conn.prepareStatement(sql)) {
                pstmt.setString(1, userId);
                System.out.println("DEBUG: Executing query: " + sql + " with userId: " + userId);
                
                try (ResultSet rs = pstmt.executeQuery()) {
                    boolean hasResult = rs.next();
                    System.out.println("DEBUG: Query result - hasResult: " + hasResult);
                    
                    if (hasResult) {
                        String foundUserId = rs.getString("user_id");
                        System.out.println("DEBUG: Found existing userId: " + foundUserId);
                    }
                    
                    return !hasResult; // 결과가 없으면 사용 가능
                }
            }
        } catch (SQLException e) {
            System.out.println("DEBUG: SQLException occurred: " + e.getMessage());
            e.printStackTrace();
            return false;
        } catch (Exception e) {
            System.out.println("DEBUG: General exception occurred: " + e.getMessage());
            e.printStackTrace();
            return false;
        }
    }
    
    // 이메일 중복 확인
    private boolean checkEmailAvailability(String email) {
        if (email == null || email.trim().isEmpty()) {
            return false;
        }
        
        String url = "jdbc:mysql://localhost:3306/dolk_db?useSSL=false&serverTimezone=UTC";
        String dbUser = "root";
        String dbPassword = "password";
        
        try (Connection conn = DriverManager.getConnection(url, dbUser, dbPassword)) {
            String sql = "SELECT user_id FROM users WHERE email = ?";
            try (PreparedStatement pstmt = conn.prepareStatement(sql)) {
                pstmt.setString(1, email);
                
                try (ResultSet rs = pstmt.executeQuery()) {
                    return !rs.next(); // 결과가 없으면 사용 가능
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
    
    // 이메일 형식 검증
    private boolean isValidEmail(String email) {
        if (email == null || email.trim().isEmpty()) {
            return false;
        }
        
        String emailRegex = "^[^\\s@]+@[^\\s@]+\\.[^\\s@]+$";
        return email.matches(emailRegex);
    }
    
    // 사용자 생성
    private boolean createUser(String userId, String password, String name, String email, 
                              String birthYear, String birthMonth, String birthDay, 
                              String ssn1, String ssn2) {
        String url = "jdbc:mysql://localhost:3306/dolk_db?useSSL=false&serverTimezone=UTC";
        String dbUser = "root";
        String dbPassword = "password";
        
        try (Connection conn = DriverManager.getConnection(url, dbUser, dbPassword)) {
            // 비밀번호 해시화
            String hashedPassword;
            try {
                hashedPassword = hashPassword(password);
            } catch (Exception e) {
                e.printStackTrace();
                return false;
            }
            
            // 생년월일 조합
            String birthDate = null;
            if (birthYear != null && birthMonth != null && birthDay != null && 
                !birthYear.isEmpty() && !birthMonth.isEmpty() && !birthDay.isEmpty()) {
                try {
                    birthDate = String.format("%s-%02d-%02d", birthYear, 
                        Integer.parseInt(birthMonth), Integer.parseInt(birthDay));
                } catch (NumberFormatException e) {
                    e.printStackTrace();
                    return false;
                }
            }
            
            // 주민등록번호 조합 (선택사항)
            String ssn = null;
            if (ssn1 != null && ssn2 != null && !ssn1.isEmpty() && !ssn2.isEmpty()) {
                ssn = ssn1 + "-" + ssn2;
            }
            
            String sql = "INSERT INTO users (user_id, password, name, email, birth_date, ssn, status, created_at) VALUES (?, ?, ?, ?, ?, ?, 'ACTIVE', NOW())";
            try (PreparedStatement pstmt = conn.prepareStatement(sql)) {
                pstmt.setString(1, userId);
                pstmt.setString(2, hashedPassword);
                pstmt.setString(3, name);
                pstmt.setString(4, email);
                pstmt.setString(5, birthDate);
                pstmt.setString(6, ssn);
                
                int result = pstmt.executeUpdate();
                return result > 0;
            }
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
    
    // 비밀번호 해시화 (실제 구현에서는 BCrypt 사용 권장)
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
%>
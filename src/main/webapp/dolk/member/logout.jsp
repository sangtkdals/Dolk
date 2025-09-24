<%@ page language="java" contentType="application/json; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    response.setContentType("application/json");
    response.setCharacterEncoding("UTF-8");
    
    StringBuilder jsonResponse = new StringBuilder();
    
    try {
        // 세션 무효화
        session.invalidate();
        
        jsonResponse.append("{\"success\": true, \"message\": \"로그아웃되었습니다.\"}");
    } catch (Exception e) {
        jsonResponse.append("{\"success\": false, \"message\": \"로그아웃 처리 중 오류가 발생했습니다.\"}");
        e.printStackTrace();
    }
    
    out.print(jsonResponse.toString());
%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
	// Invalidate all session data and redirect to main page
	session.invalidate();
	String contextPath = request.getContextPath();
	response.sendRedirect(contextPath + "/Home.jsp");
%>


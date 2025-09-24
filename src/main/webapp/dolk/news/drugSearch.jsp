<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>약품 검색</title>
</head>
<body>
    <h2>약품 검색</h2>
    <p>검색 유형을 선택하고 키워드를 입력하세요.</p>
    
    <form action="${pageContext.request.contextPath}/drugSearch" method="get">
        <select name="searchType" style="height: 25px;">
            <option value="efficacy">효능</option>
            <option value="name">약 이름</option>
        </select>
        <input type="text" name="keyword" size="30" required placeholder="검색어 입력" style="height: 20px;">
        <button type="submit">검색</button>
    </form>
</body>
</html>
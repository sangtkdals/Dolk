<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>검색 결과</title>
<style>
    .drug-item { border: 1px solid #ccc; margin-bottom: 15px; padding: 10px; overflow: hidden; }
    .drug-item img { max-width: 120px; float: left; margin-right: 15px; }
    .drug-item h3 { margin-top: 0; }
</style>
</head>
<body>
    <h2>"<span>${keyword}</span>" 검색 결과</h2>
    <a href="${pageContext.request.contextPath}/dolk/news/drugSearch.jsp">새로 검색하기</a>
    <hr>
    
    <c:choose>
        <c:when test="${not empty drugList}">
            <c:forEach var="drug" items="${drugList}">
                <div class="drug-item">
                    <c:if test="${not empty drug.itemImage}">
                        <img src="${drug.itemImage}" alt="약품 이미지">
                    </c:if>
                    <h3>${drug.itemName}</h3>
                    <p><strong>제조사:</strong> ${drug.entpName}</p>
                    <p><strong>효능:</strong> ${drug.efcyQesitm}</p>
                </div>
            </c:forEach>
        </c:when>
        <c:otherwise>
            <p>검색된 의약품 정보가 없습니다.</p>
        </c:otherwise>
    </c:choose>
</body>
</html>
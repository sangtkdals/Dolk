<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <c:choose>
        <c:when test="${not empty keyword}">
            <title>"${keyword}" 검색 결과</title>
        </c:when>
        <c:otherwise>
            <title>의약품 검색</title>
        </c:otherwise>
    </c:choose>

    <link rel="stylesheet" href="${pageContext.request.contextPath}/dolk/assets/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/dolk/assets/css/style.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/dolk/assets/css/form-elements.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/dolk/assets/css/select2.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/dolk/assets/css/search.css">
</head>
<body>
    <%@ include file="../common/header.jsp" %>

    <div class="search-container">
        <c:choose>
            <c:when test="${not empty keyword}">
                <h2>의약품 검색</h2>
            </c:when>
            <c:otherwise>
                <h2>의약품 통합 검색</h2>
                <p>검색 유형을 선택하고 키워드를 입력하세요. (예: 두통, 타이레놀)</p>
            </c:otherwise>
        </c:choose>

        <form class="search-form" action="${pageContext.request.contextPath}/drugSearch" method="get">
            <select name="searchType">
                <option value="efficacy" ${param.searchType == 'efficacy' ? 'selected' : ''}>효능</option>
                <option value="name" ${param.searchType == 'name' ? 'selected' : ''}>약 이름</option>
            </select>
            <input type="text" name="keyword" required value="${keyword}" placeholder="검색어를 입력하세요">
            <button type="submit">검색</button>
            <a href="${pageContext.request.contextPath}/dolk/news/drugSearch.jsp" class="reset-btn">초기화</a>
        </form>
        
        <c:if test="${not empty keyword}">
            <hr>
            <h4>"<span>${keyword}</span>" 검색 결과</h4>
        </c:if>

        <div class="result-list">
            <c:choose>
                <c:when test="${not empty drugList}">
                    <c:forEach var="drug" items="${drugList}">
                        <div class="result-item">
                            <c:if test="${not empty drug.itemImage}">
                                <img src="${drug.itemImage}" alt="약품 이미지">
                            </c:if>
                            <div class="result-item-text">
                                <h3>${drug.itemName}</h3>
                                <p><strong>제조사:</strong> ${drug.entpName}</p>
                                <p><strong>효능:</strong> ${drug.efcyQesitm}</p>
                            </div>
                        </div>
                    </c:forEach>
                </c:when>
                <c:otherwise>
                    <c:if test="${not empty keyword}">
                        <p>검색된 의약품 정보가 없습니다.</p>
                    </c:if>
                </c:otherwise>
            </c:choose>
        </div>
    </div>
    
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/dolk/assets/js/select2.min.js"></script>
    <script>
	    $(document).ready(function() {
	        $('select').select2({
	            minimumResultsForSearch: -1 // 검색창 숨기기
	        });
	    });
    </script>
</body>
</html>
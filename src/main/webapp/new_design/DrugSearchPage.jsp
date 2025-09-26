<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>의약품 검색 - MediConnect</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <script>
      tailwind.config = {
        theme: {
          extend: {
            colors: {
              'brand-blue': '#0054A6',
              'brand-lightblue': '#4E8ED6',
              'brand-gray': '#F0F2F5',
            },
          }
        }
      }
    </script>
</head>
<body class="bg-brand-gray">

    <jsp:include page="layout/Header.jsp" />

    <main class="flex-grow">
        <div class="container mx-auto px-4 py-8">
            <div class="bg-white p-8 rounded-lg shadow-md">
                <h1 class="text-3xl font-bold text-gray-800 mb-2">의약품 검색</h1>
                <p class="text-gray-600 mb-6">검색 유형을 선택하고 의약품 이름 또는 효능을 입력하세요.</p>
                <form action="${pageContext.request.contextPath}/drugSearch" method="get" class="flex items-center space-x-2">
                    <select name="searchType" class="p-3 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-brand-lightblue">
                        <option value="efficacy" ${param.searchType == 'efficacy' ? 'selected' : ''}>효능</option>
                        <option value="name" ${param.searchType == 'name' ? 'selected' : ''}>약 이름</option>
                    </select>
                    <input type="text" name="keyword" required value="${keyword}" class="flex-grow p-3 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-brand-lightblue" placeholder="검색어 입력...">
                    <button type="submit" class="px-6 py-3 bg-brand-blue text-white font-semibold rounded-lg hover:bg-brand-lightblue transition-colors duration-300">
                        검색
                    </button>
                </form>
            </div>

            <div class="mt-8">
                <c:if test="${not empty keyword}">
                    <h2 class="text-2xl font-bold text-gray-700 mb-4">
                        "<span class="text-brand-blue">${keyword}</span>" 검색 결과
                    </h2>
                </c:if>

                <div class="space-y-4">
                    <c:choose>
                        <c:when test="${not empty drugList}">
                            <c:forEach var="drug" items="${drugList}">
                                <div class="bg-white p-4 rounded-lg shadow flex items-start space-x-4">
                                    <c:if test="${not empty drug.itemImage}">
                                        <img src="${drug.itemImage}" alt="${drug.itemName} 이미지" class="w-24 h-24 object-cover rounded">
                                    </c:if>
                                    <div class="flex-1">
                                        <h3 class="text-lg font-bold text-gray-800">${drug.itemName}</h3>
                                        <p class="text-sm text-gray-600 mt-1"><strong>제조사:</strong> ${drug.entpName}</p>
                                        <p class="text-sm text-gray-600 mt-1 line-clamp-2"><strong>효능:</strong> ${drug.efcyQesitm}</p>
                                    </div>
                                </div>
                            </c:forEach>
                        </c:when>
                        <c:otherwise>
                            <c:if test="${not empty keyword}">
                                <div class="bg-white p-8 text-center rounded-lg shadow">
                                    <p class="text-gray-600">검색된 의약품 정보가 없습니다.</p>
                                </div>
                            </c:if>
                        </c:otherwise>
                    </c:choose>
                </div>
            </div>
        </div>
    </main>

    <jsp:include page="layout/Footer.jsp" />

</body>
</html>

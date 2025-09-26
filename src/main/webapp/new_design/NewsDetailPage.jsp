<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="dolk.bean.PostBean" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String postId = request.getParameter("postId");
    // 실제로는 postId를 이용해 DB에서 뉴스 정보를 가져와야 합니다.

    // 임시 데이터 생성
    PostBean news = new PostBean();
    news.setPid(Integer.parseInt(postId));
    news.setTitle("새로운 암 치료법 개발 소식");
    news.setAid("MediConnect 편집팀");
    news.setVcount(345);
    
    request.setAttribute("news", news);
%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>${news.title} - MediConnect</title>
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
        <div class="container mx-auto px-4 py-8 max-w-4xl">
            <!-- 뉴스 본문 -->
            <div class="bg-white p-6 md:p-8 rounded-lg shadow">
                <div class="mb-4">
                    <span class="text-sm font-semibold text-brand-blue">의료 뉴스</span>
                    <h1 class="text-3xl font-bold text-gray-900 mt-1">${news.title}</h1>
                    <div class="flex items-center space-x-4 text-sm text-gray-500 mt-3">
                        <div class="flex items-center">
                            <span>${news.aid}</span>
                        </div>
                        <span>2025-09-26 11:30:15</span>
                        <span>${news.vcount} views</span>
                    </div>
                </div>
                <div class="prose max-w-none mt-8 text-gray-800">
                    <p>최근 연구에 따르면, 새로운 면역항암제가 특정 유형의 폐암 환자에게서 획기적인 치료 효과를 보인 것으로 나타났습니다. 이번 연구 결과는 암 치료의 새로운 패러다임을 제시할 것으로 기대됩니다.</p>
                    <img src="https://picsum.photos/seed/news_content/800/400" alt="뉴스 이미지" class="rounded-lg my-6" />
                    <p>자세한 내용은 학계의 추가 검증을 거쳐 공개될 예정입니다.</p>
                </div>
            </div>
        </div>
    </main>

    <jsp:include page="layout/Footer.jsp" />

</body>
</html>

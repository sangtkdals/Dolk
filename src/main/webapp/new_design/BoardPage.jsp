<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList, java.util.List, dolk.bean.PostBean" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String boardName = request.getParameter("boardName");
    if (boardName == null || boardName.isEmpty()) {
        boardName = "게시판";
    }
    pageContext.setAttribute("boardName", boardName);

    // 임시 데이터 생성
    List<PostBean> postList = new ArrayList<>();

    if ("Medical News".equals(boardName)) {
        PostBean news1 = new PostBean();
        news1.setPid(3);
        news1.setTitle("새로운 암 치료법 개발 소식");
        news1.setAid("메디컬투데이");
        news1.setVcount(1024);
        news1.setLcount(50);
        news1.setCcount(12);
        postList.add(news1);
    } else if ("Free Board".equals(boardName)) {
        PostBean free1 = new PostBean();
        free1.setPid(4);
        free1.setTitle("건강 관리 팁 공유해요");
        free1.setAid("헬스마스터");
        free1.setVcount(512);
        free1.setLcount(25);
        free1.setCcount(8);
        postList.add(free1);
    } else { // Default to Q&A
        PostBean post1 = new PostBean();
        post1.setPid(1);
        post1.setTitle("이런 증상이 있는데 어떤 병원 가야하나요?");
        post1.setAid("닥터김");
        post1.setVcount(128);
        post1.setLcount(15);
        post1.setCcount(3);
        postList.add(post1);

        PostBean post2 = new PostBean();
        post2.setPid(2);
        post2.setTitle("코로나 후유증 관련 질문입니다.");
        post2.setAid("건강지킴이");
        post2.setVcount(88);
        post2.setLcount(5);
        post2.setCcount(1);
        postList.add(post2);
    }
    
    request.setAttribute("postList", postList);
%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title><%= boardName %> - MediConnect</title>
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
            <div class="flex justify-between items-center mb-6">
                <h1 class="text-3xl font-bold text-gray-800"><%= boardName %></h1>
                <%-- 로그인 상태일 때만 보이도록 처리 --%>
                <a href="NewPostPage.jsp?boardName=<%= boardName %>" class="px-4 py-2 bg-brand-blue text-white font-semibold rounded-lg hover:bg-brand-lightblue transition-colors duration-300">
                    새 글 작성
                </a>
            </div>
            
            <div class="space-y-4">
                <c:choose>
                    <c:when test="${not empty postList}">
                        <c:forEach var="post" items="${postList}">
                            <div class="bg-white p-4 rounded-lg shadow hover:shadow-lg hover:-translate-y-1 transform transition-all duration-300">
                                <div class="flex items-center text-sm text-gray-500 mb-2">
                                    <span class="font-semibold text-brand-blue">${boardName}</span>
                                    <span class="mx-2">|</span>
                                    <div class="flex items-center">
                                      <span>${post.aid}</span>
                                      <c:if test="${post.aid == '닥터김'}">
                                        <svg class="ml-1 w-4 h-4 text-green-500" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg"><path fill-rule="evenodd" d="M10 18a8 8 0 100-16 8 8 0 000 16zm3.707-9.293a1 1 0 00-1.414-1.414L9 10.586 7.707 9.293a1 1 0 00-1.414 1.414l2 2a1 1 0 001.414 0l4-4z" clip-rule="evenodd"></path></svg>
                                      </c:if>
                                    </div>
                                </div>
                                <c:set var="detailUrl">
                                    <c:choose>
                                        <c:when test="${boardName == 'Medical News'}">NewsDetailPage.jsp</c:when>
                                        <c:otherwise>PostDetailPage.jsp</c:otherwise>
                                    </c:choose>
                                </c:set>
                                <a href="${detailUrl}?postId=${post.pid}">
                                    <h3 class="text-lg font-bold text-gray-800 truncate mb-2">${post.title}</h3>
                                </a>
                                <p class="text-gray-600 text-sm mb-4 line-clamp-2">...</p>
                                <div class="text-xs text-gray-400 flex justify-between items-center">
                                    <span>2025-09-26 10:30:15</span>
                                    <div class="flex space-x-4">
                                        <span>추천: ${post.lcount}</span>
                                        <span>조회: ${post.vcount}</span>
                                        <span>댓글: ${post.ccount}</span>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                    </c:when>
                    <c:otherwise>
                        <div class="text-center py-12 bg-white rounded-lg shadow">
                            <h2 class="text-xl text-gray-600">아직 게시글이 없습니다.</h2>
                            <p class="text-gray-500 mt-2">첫 번째 게시글을 작성해보세요!</p>
                        </div>
                    </c:otherwise>
                </c:choose>
            </div>
        </div>
    </main>

    <jsp:include page="layout/Footer.jsp" />

</body>
</html>

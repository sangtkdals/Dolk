<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList, java.util.List, dolk.bean.PostBean" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    // 임시 데이터 생성
    List<PostBean> qnaList = new ArrayList<>();
    PostBean qna1 = new PostBean();
    qna1.setPid(1);
    qna1.setTitle("이런 증상이 있는데 어떤 병원 가야하나요?");
    qnaList.add(qna1);

    PostBean qna2 = new PostBean();
    qna2.setPid(2);
    qna2.setTitle("코로나 후유증 관련 질문입니다.");
    qnaList.add(qna2);
    
    request.setAttribute("qnaList", qnaList);

    List<PostBean> newsList = new ArrayList<>();
    PostBean news1 = new PostBean();
    news1.setPid(3);
    news1.setTitle("새로운 암 치료법 개발 소식");
    newsList.add(news1);

    request.setAttribute("newsList", newsList);
%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>MediConnect: 전문가 의료 커뮤니티</title>
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
        <div class="container mx-auto px-4 py-8 space-y-8">
            
            <!-- HeroBanner -->
            <div class="bg-brand-blue text-white p-8 md:p-12 rounded-lg shadow-lg flex items-center justify-between">
                <div class="z-10 bg-brand-blue bg-opacity-70 p-6 rounded">
                    <h1 class="text-4xl font-extrabold">건강 질문에 대한 전문가 답변</h1>
                    <p class="mt-4 text-lg">검증된 의료 전문가 및 지원 커뮤니티와 소통하세요.</p>
                    <a href="./BoardPage.jsp?boardName=Q&A" class="mt-6 inline-block bg-white text-brand-blue font-bold py-2 px-6 rounded-full hover:bg-gray-200 transition-all duration-300 transform hover:scale-105">질문하기</a>
                </div>
                <div class="hidden md:block z-10">
                    <img src="https://picsum.photos/seed/med/200/200" class="rounded-full border-4 border-white"/>
                </div>
            </div>

            <!-- QuickLinks -->
            <div class="bg-white p-6 rounded-lg shadow">
                <div class="grid grid-cols-2 md:grid-cols-4 gap-4 text-center">
                    <a href="./BoardPage.jsp?boardName=Q&A" class="p-4 rounded-lg hover:bg-blue-50 group transform hover:-translate-y-1 transition-all duration-300">
                        <svg class="w-12 h-12 mx-auto text-brand-blue group-hover:scale-110 transition-transform duration-300" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg" stroke-width="1.5"><path stroke-linecap="round" stroke-linejoin="round" d="M9.879 7.519c1.171-1.025 3.071-1.025 4.242 0 1.172 1.025 1.172 2.687 0 3.712-.203.179-.43.326-.67.442-.745.361-1.45.999-1.45 1.827v.75M21 12a9 9 0 11-18 0 9 9 0 0118 0zm-9 5.25h.008v.008H12v-.008z" /></svg>
                        <div class="mt-2 font-semibold text-gray-800">의사와의 Q&A</div>
                    </a>
                    <a href="./VerificationPage.jsp" class="p-4 rounded-lg hover:bg-blue-50 group transform hover:-translate-y-1 transition-all duration-300">
                        <svg class="w-12 h-12 mx-auto text-brand-blue group-hover:scale-110 transition-transform duration-300" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 12l2 2 4-4m5.618-4.016A11.955 11.955 0 0112 2.944a11.955 11.955 0 01-8.618 3.04A12.02 12.02 0 003 9c0 5.591 3.824 10.29 9 11.622 5.176-1.332 9-6.03 9-11.622 0-1.042-.133-2.052-.382-3.016z"></path></svg>
                        <div class="mt-2 font-semibold text-gray-800">의사 인증</div>
                    </a>
                     <a href="./BoardPage.jsp?boardName=Medical News" class="p-4 rounded-lg hover:bg-blue-50 group transform hover:-translate-y-1 transition-all duration-300">
                        <svg class="w-12 h-12 mx-auto text-brand-blue group-hover:scale-110 transition-transform duration-300" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg" stroke-width="1.5"><path stroke-linecap="round" stroke-linejoin="round" d="M19.5 14.25v-2.625a3.375 3.375 0 00-3.375-3.375h-1.5A1.125 1.125 0 0113.5 7.125v-1.5a3.375 3.375 0 00-3.375-3.375H8.25m0 12.75h7.5m-7.5 3H12M10.5 2.25H5.625c-.621 0-1.125.504-1.125 1.125v17.25c0 .621.504 1.125 1.125 1.125h12.75c.621 0 1.125-.504 1.125-1.125V11.25a9 9 0 00-9-9z" /></svg>
                        <div class="mt-2 font-semibold text-gray-800">최신 의료 뉴스</div>
                    </a>
                    <a href="./BoardPage.jsp?boardName=Free Board" class="p-4 rounded-lg hover:bg-blue-50 group transform hover:-translate-y-1 transition-all duration-300">
                        <svg class="w-12 h-12 mx-auto text-brand-blue group-hover:scale-110 transition-transform duration-300" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg" stroke-width="1.5"><path stroke-linecap="round" stroke-linejoin="round" d="M15 19.128a9.38 9.38 0 002.625.372 9.337 9.337 0 004.121-.952 4.125 4.125 0 00-7.533-2.493M15 19.128v-.003c0-1.113-.285-2.16-.786-3.07M15 19.128v.106A12.318 12.318 0 018.624 21c-2.331 0-4.512-.645-6.374-1.766l-.001-.109a6.375 6.375 0 0111.964-4.663M15 12a3 3 0 11-6 0 3 3 0 016 0z" /></svg>
                        <div class="mt-2 font-semibold text-gray-800">커뮤니티 포럼</div>
                    </a>
                </div>
            </div>

            <!-- HealthDashboard -->
            <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-6">
                <div class="bg-gray-50 p-4 rounded-lg flex items-start space-x-4">
                    <div class="text-brand-blue flex-shrink-0"><svg class="w-8 h-8" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg" stroke-width="1.5"><path stroke-linecap="round" stroke-linejoin="round" d="M12 3v2.25m6.364.386l-1.591 1.591M21 12h-2.25m-.386 6.364l-1.591-1.591M12 18.75V21m-4.773-4.227l-1.591 1.591M5.25 12H3m4.227-4.773L5.636 5.636M15.75 12a3.75 3.75 0 11-7.5 0 3.75 3.75 0 017.5 0z" /></svg></div>
                    <div>
                        <h3 class="font-bold text-gray-700">오늘의 날씨</h3>
                        <div class="text-sm text-gray-600 mt-1">
                            <p class="text-lg font-semibold">22°C</p>
                            <p>맑음, 서울</p>
                        </div>
                    </div>
                </div>
                <div class="bg-gray-50 p-4 rounded-lg flex items-start space-x-4">
                    <div class="text-brand-blue flex-shrink-0"><svg class="w-8 h-8" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg" stroke-width="1.5"><path stroke-linecap="round" stroke-linejoin="round" d="M9.75 12.75c0 .414-.336.75-.75.75H3.75c-.414 0-.75-.336-.75-.75s.336-.75.75-.75h5.25c.414 0 .75.336.75.75z" /><path stroke-linecap="round" stroke-linejoin="round" d="M14.25 8.25c0 .414-.336.75-.75.75H3.75c-.414 0-.75-.336-.75-.75s.336-.75.75-.75h9.75c.414 0 .75.336.75.75z" /><path stroke-linecap="round" stroke-linejoin="round" d="M19.5 17.25c0 .414-.336.75-.75.75H3.75c-.414 0-.75-.336-.75-.75s.336-.75.75-.75h15c.414 0 .75.336.75.75z" /></svg></div>
                    <div>
                        <h3 class="font-bold text-gray-700">미세먼지 수준</h3>
                        <div class="text-sm text-gray-600 mt-1">
                            <p class="text-lg font-semibold">15 µg/m³</p>
                            <p><span class="px-2 py-1 text-xs font-semibold text-blue-800 bg-blue-200 rounded-full">좋음</span></p>
                        </div>
                    </div>
                </div>
                <div class="bg-gray-50 p-4 rounded-lg flex items-start space-x-4">
                    <div class="text-brand-blue flex-shrink-0"><svg class="w-8 h-8" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg" stroke-width="1.5"><path stroke-linecap="round" stroke-linejoin="round" d="M10.5 14.25h3m-6.75 6h10.5c.621 0 1.125-.504 1.125-1.125v-2.25c0-.621-.504-1.125-1.125-1.125H6.75c-.621 0-1.125.504-1.125 1.125v2.25c0 .621.504 1.125 1.125 1.125z" /><path stroke-linecap="round" stroke-linejoin="round" d="M8.25 16.5V9a4.5 4.5 0 019 0v7.5" /></svg></div>
                    <div>
                        <h3 class="font-bold text-gray-700">오늘의 건강 팁</h3>
                        <div class="text-sm text-gray-600 mt-1">
                            <p>하루에 최소 8잔의 물을 마셔 수분을 유지하세요.</p>
                        </div>
                    </div>
                </div>
                <div class="bg-gray-50 p-4 rounded-lg flex items-start space-x-4">
                    <div class="text-brand-blue flex-shrink-0"><svg class="w-8 h-8" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg" stroke-width="1.5"><path stroke-linecap="round" stroke-linejoin="round" d="M12 9v3.75m-9.303 3.376c-.866 1.5.217 3.374 1.948 3.374h14.71c1.73 0 2.813-1.874 1.948-3.374L13.949 3.378c-.866-1.5-3.032-1.5-3.898 0L2.697 16.126zM12 15.75h.007v.008H12v-.008z" /></svg></div>
                    <div>
                        <h3 class="font-bold text-gray-700">감염병 소식</h3>
                        <div class="text-sm text-gray-600 mt-1">
                            <p>독감 시즌이 다가오고 있습니다. 연간 예방 접종을 고려하세요.</p>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Content Sections -->
            <div class="grid md:grid-cols-2 gap-8">
                <!-- Recent Q&A -->
                <div class="bg-white rounded-lg shadow">
                    <div class="p-4 border-b flex justify-between items-center">
                        <h2 class="text-lg font-bold text-gray-800">최근 Q&A</h2>
                        <a href="./BoardPage.jsp?boardName=Q&A" class="text-sm text-brand-blue hover:underline">더보기</a>
                    </div>
                    <div>
                        <c:forEach var="qna" items="${qnaList}">
                            <a href="./PostDetailPage.jsp?postId=${qna.pid}" class="block p-3 hover:bg-gray-50 transition-colors duration-200">
                                <div class="flex justify-between items-center text-sm">
                                    <p class="truncate text-gray-800">${qna.title}</p>
                                    <span class="text-gray-500 whitespace-nowrap">2025. 9. 26.</span>
                                </div>
                            </a>
                        </c:forEach>
                    </div>
                </div>
                <!-- Medical News -->
                <div class="bg-white rounded-lg shadow">
                    <div class="p-4 border-b flex justify-between items-center">
                        <h2 class="text-lg font-bold text-gray-800">의료 뉴스</h2>
                        <a href="./BoardPage.jsp?boardName=Medical News" class="text-sm text-brand-blue hover:underline">더보기</a>
                    </div>
                    <div>
                        <c:forEach var="news" items="${newsList}">
                            <a href="./NewsDetailPage.jsp?postId=${news.pid}" class="block p-3 hover:bg-gray-50 transition-colors duration-200">
                                <div class="flex justify-between items-center text-sm">
                                    <p class="truncate text-gray-800">${news.title}</p>
                                    <span class="text-gray-500 whitespace-nowrap">2025. 9. 26.</span>
                                </div>
                            </a>
                        </c:forEach>
                    </div>
                </div>
            </div>

            <!-- NewsKiosk -->
            <div class="bg-white rounded-lg shadow">
                <div class="p-4 border-b">
                    <h2 class="text-lg font-bold text-gray-800">오늘의 의료 뉴스</h2>
                </div>
                <div class="p-4 grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-4 gap-6">
                    <a href="./NewsDetailPage.jsp?postId=4" class="group block overflow-hidden rounded-lg shadow-sm hover:shadow-lg transition-shadow">
                        <img src="https://picsum.photos/seed/news1/400/300" alt="뉴스 썸네일" class="w-full h-40 object-cover group-hover:scale-105 transition-transform duration-300" />
                        <div class="p-4">
                            <h3 class="font-bold text-md text-gray-800 line-clamp-2">AI 기술, 신약 개발 기간 단축에 기여</h3>
                            <p class="text-xs text-gray-500 mt-2">2025. 9. 26.</p>
                        </div>
                    </a>
                    <a href="./NewsDetailPage.jsp?postId=5" class="group block overflow-hidden rounded-lg shadow-sm hover:shadow-lg transition-shadow">
                        <img src="https://picsum.photos/seed/news2/400/300" alt="뉴스 썸네일" class="w-full h-40 object-cover group-hover:scale-105 transition-transform duration-300" />
                        <div class="p-4">
                            <h3 class="font-bold text-md text-gray-800 line-clamp-2">정신 건강의 중요성, 사회적 인식 개선 필요</h3>
                            <p class="text-xs text-gray-500 mt-2">2025. 9. 26.</p>
                        </div>
                    </a>
                </div>
            </div>

        </div>
    </main>

    <jsp:include page="layout/Footer.jsp" />

</body>
</html>

<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%-- 로그인 상태를 가정하기 위한 임시 변수. 실제로는 세션 등에서 가져와야 합니다. --%>
<%
    boolean loggedIn = false;
    String currentBoard = request.getParameter("boardName");
    String currentPage = request.getRequestURI();
%>

<header class="bg-white shadow-md sticky top-0 z-50">
    <div class="container mx-auto px-4">
        <!-- Top Bar -->
        <div class="flex justify-between items-center py-2 border-b">
            <div class="flex items-center space-x-4">
                <a href="HomePage.jsp" class="flex items-center space-x-2">
                    <img src="https://picsum.photos/id/23/32/32" alt="Logo" class="h-8 w-8 rounded-full" />
                    <h1 class="text-xl font-bold text-brand-blue">Dolk</h1>
                </a>
            </div>
            <div class="flex items-center space-x-4">
                <% if (loggedIn) { %>
                    <div class="flex items-center space-x-4">
                        <!-- 알림 드롭다운 (JavaScript 필요) -->
                        <div class="relative" id="notifications-dropdown">
                            <button onclick="toggleDropdown('notifications-menu')" class="relative text-gray-600 hover:text-brand-blue transition-colors duration-300">
                                <svg class="w-6 h-6" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M15 17h5l-1.405-1.405A2.032 2.032 0 0118 14.158V11a6.002 6.002 0 00-4-5.659V5a2 2 0 10-4 0v.341C7.67 6.165 6 8.388 6 11v3.159c0 .538-.214 1.055-.595 1.436L4 17h5m6 0v1a3 3 0 11-6 0v-1m6 0H9"></path></svg>
                                <span class="absolute top-0 right-0 block h-2 w-2 rounded-full bg-red-500 ring-2 ring-white"></span>
                            </button>
                            <div id="notifications-menu" class="hidden absolute right-0 mt-2 w-80 bg-white rounded-md shadow-lg py-1 ring-1 ring-black ring-opacity-5">
                                <div class="font-bold px-4 py-2 border-b">알림</div>
                                <a href="#" class="block px-4 py-2 text-sm text-gray-700 hover:bg-gray-100 transition-colors duration-200 bg-blue-50">
                                    새로운 답변이 등록되었습니다.
                                    <div class="text-xs text-gray-400">2025-09-26 12:40</div>
                                </a>
                                <div class="px-4 py-3 text-sm text-gray-500">새 알림이 없습니다.</div>
                            </div>
                        </div>
                        <!-- 프로필 드롭다운 (JavaScript 필요) -->
                        <div class="relative" id="profile-dropdown">
                            <button onclick="toggleDropdown('profile-menu')" class="flex items-center space-x-2">
                                <img src="https://picsum.photos/seed/user/32/32" alt="profile" class="w-8 h-8 rounded-full" />
                                <span class="text-sm font-medium text-gray-700">사용자닉네임</span>
                                <svg class="w-5 h-5 text-green-500" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg"><path fill-rule="evenodd" d="M10 18a8 8 0 100-16 8 8 0 000 16zm3.707-9.293a1 1 0 00-1.414-1.414L9 10.586 7.707 9.293a1 1 0 00-1.414 1.414l2 2a1 1 0 001.414 0l4-4z" clip-rule="evenodd"></path></svg>
                                <svg class="w-4 h-4" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M19 9l-7 7-7-7"></path></svg>
                            </button>
                            <div id="profile-menu" class="hidden absolute right-0 mt-2 w-48 bg-white rounded-md shadow-lg py-1 ring-1 ring-black ring-opacity-5">
                                <a href="ProfilePage.jsp" class="block px-4 py-2 text-sm text-gray-700 hover:bg-gray-100 transition-colors duration-200">마이페이지</a>
                                <a href="VerificationPage.jsp" class="block px-4 py-2 text-sm text-gray-700 hover:bg-gray-100 transition-colors duration-200">의사 인증</a>
                                <a href="#" class="block w-full text-left px-4 py-2 text-sm text-gray-700 hover:bg-gray-100 transition-colors duration-200">로그아웃</a>
                            </div>
                        </div>
                    </div>
                <% } else { %>
                    <div class="flex items-center space-x-2">
                        <a href="LoginPage.jsp" class="px-4 py-2 text-sm font-medium text-gray-700 hover:text-brand-blue transition-colors duration-300">로그인</a>
                        <a href="RegisterPage.jsp" class="px-4 py-2 text-sm font-medium text-white bg-brand-blue rounded-md hover:bg-brand-lightblue transition-colors duration-300">회원가입</a>
                    </div>
                <% } %>
            </div>
        </div>
        
        <!-- Bottom Bar -->
        <div class="flex justify-between items-center py-3">
             <nav class="flex space-x-2">
                <a href="HomePage.jsp" class="px-4 py-2 text-sm font-medium transition-colors duration-300 border-b-2 <%= currentPage.endsWith("HomePage.jsp") ? "text-brand-blue border-brand-blue" : "text-gray-700 border-transparent hover:text-brand-blue" %>">홈</a>
                <a href="BoardPage.jsp?boardName=Q&A" class="px-4 py-2 text-sm font-medium transition-colors duration-300 border-b-2 <%= "Q&A".equals(currentBoard) ? "text-brand-blue border-brand-blue" : "text-gray-700 border-transparent hover:text-brand-blue" %>">Q&A</a>
                <a href="BoardPage.jsp?boardName=Free Board" class="px-4 py-2 text-sm font-medium transition-colors duration-300 border-b-2 <%= "Free Board".equals(currentBoard) ? "text-brand-blue border-brand-blue" : "text-gray-700 border-transparent hover:text-brand-blue" %>">자유게시판</a>
                <div class="relative group">
                    <button class="px-4 py-2 text-sm font-medium text-gray-700 hover:text-brand-blue flex items-center transition-colors duration-300 border-b-2 border-transparent">
                        질환별 게시판 <svg class="w-4 h-4 ml-1" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M19 9l-7 7-7-7"></path></svg>
                    </button>
                    <div class="absolute hidden group-hover:block mt-1 w-48 bg-white rounded-md shadow-lg py-1 ring-1 ring-black ring-opacity-5 z-10">
                        <a href="BoardPage.jsp?boardName=Diabetes" class="block px-4 py-2 text-sm text-gray-700 hover:bg-gray-100 transition-colors duration-200">당뇨병</a>
                        <a href="BoardPage.jsp?boardName=Hypertension" class="block px-4 py-2 text-sm text-gray-700 hover:bg-gray-100 transition-colors duration-200">고혈압</a>
                <a href="BoardPage.jsp?boardName=Cancer" class="block px-4 py-2 text-sm text-gray-700 hover:bg-gray-100 transition-colors duration-200">암</a>
                    </div>
                </div>
                <a href="BoardPage.jsp?boardName=Medical News" class="px-4 py-2 text-sm font-medium transition-colors duration-300 border-b-2 <%= "Medical News".equals(currentBoard) ? "text-brand-blue border-brand-blue" : "text-gray-700 border-transparent hover:text-brand-blue" %>">의료 뉴스</a>
                <a href="DrugSearchPage.jsp" class="px-4 py-2 text-sm font-medium transition-colors duration-300 border-b-2 <%= currentPage.endsWith("DrugSearchPage.jsp") ? "text-brand-blue border-brand-blue" : "text-gray-700 border-transparent hover:text-brand-blue" %>">의약품 검색</a>
                <a href="DrugRecognitionPage.jsp" class="px-4 py-2 text-sm font-medium transition-colors duration-300 border-b-2 <%= currentPage.endsWith("DrugRecognitionPage.jsp") ? "text-brand-blue border-brand-blue" : "text-gray-700 border-transparent hover:text-brand-blue" %>">사진으로 검색</a>
            </nav>
            <div class="w-1/3">
                <div class="relative">
                    <input type="text" placeholder="MediConnect 검색..." class="w-full pl-10 pr-4 py-2 border rounded-full focus:outline-none focus:ring-2 focus:ring-brand-lightblue" />
                    <div class="absolute left-3 top-1/2 -translate-y-1/2 text-gray-400">
                        <svg class="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M21 21l-6-6m2-5a7 7 0 11-14 0 7 7 0 0114 0z"></path></svg>
                    </div>
                </div>
            </div>
        </div>
    </div>
</header>

<script>
function toggleDropdown(menuId) {
    var menu = document.getElementById(menuId);
    menu.classList.toggle('hidden');
}

// Close dropdown when clicking outside
document.addEventListener("click", function(event) {
    if (!event.target.closest('#notifications-dropdown')) {
        document.getElementById('notifications-menu').classList.add('hidden');
    }
    if (!event.target.closest('#profile-dropdown')) {
        document.getElementById('profile-menu').classList.add('hidden');
    }
});
</script>

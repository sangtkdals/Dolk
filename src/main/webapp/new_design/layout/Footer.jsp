<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.Calendar" %>

<footer class="bg-gray-800 text-white mt-12">
    <div class="container mx-auto px-4 py-8">
        <div class="grid grid-cols-1 md:grid-cols-4 gap-8">
            <div>
                <h2 class="text-lg font-bold">MediConnect</h2>
                <p class="text-gray-400 mt-2 text-sm">신뢰할 수 있는 의료 커뮤니티.</p>
            </div>
            <div>
                <h3 class="font-semibold">바로가기</h3>
                <ul class="mt-2 space-y-2 text-sm">
                    <li><a href="../BoardPage.jsp?boardName=Q&A" class="text-gray-400 hover:text-white transition-colors duration-200">Q&A</a></li>
                    <li><a href="../BoardPage.jsp?boardName=Free Board" class="text-gray-400 hover:text-white transition-colors duration-200">자유게시판</a></li>
                    <li><a href="../BoardPage.jsp?boardName=Medical News" class="text-gray-400 hover:text-white transition-colors duration-200">의료 뉴스</a></li>
                </ul>
            </div>
            <div>
                <h3 class="font-semibold">법적 고지</h3>
                <ul class="mt-2 space-y-2 text-sm">
                    <li><a href="#" class="text-gray-400 hover:text-white transition-colors duration-200">서비스 이용약관</a></li>
                    <li><a href="#" class="text-gray-400 hover:text-white transition-colors duration-200">개인정보 처리방침</a></li>
                </ul>
            </div>
             <div>
                <h3 class="font-semibold">소셜 미디어</h3>
                <div class="flex space-x-4 mt-2">
                   <a href="#" class="text-gray-400 hover:text-white transition-colors duration-200">X</a>
                   <a href="#" class="text-gray-400 hover:text-white transition-colors duration-200">Facebook</a>
                   <a href="#" class="text-gray-400 hover:text-white transition-colors duration-200">Instagram</a>
                </div>
            </div>
        </div>
        <div class="mt-8 pt-8 border-t border-gray-700 text-center text-gray-500 text-sm">
            &copy; <%= Calendar.getInstance().get(Calendar.YEAR) %> MediConnect. All Rights Reserved.
        </div>
    </div>
</footer>

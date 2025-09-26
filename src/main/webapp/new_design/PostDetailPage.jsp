<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="dolk.bean.PostBean, java.util.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String postIdStr = request.getParameter("postId");
    int postId = 0;
    if (postIdStr != null && !postIdStr.isEmpty()) {
        postId = Integer.parseInt(postIdStr);
    }

    // 임시 데이터 목록 생성
    Map<Integer, PostBean> postData = new HashMap<>();
    
    PostBean post1 = new PostBean();
    post1.setPid(1);
    post1.setTitle("이런 증상이 있는데 어떤 병원 가야하나요?");
    post1.setAid("닥터김");
    post1.setVcount(128);
    post1.setContent("안녕하세요. 얼마 전부터 계속 소화가 잘 안되고 속이 더부룩한 느낌이 있습니다. 특별히 아픈 곳은 없는데, 식사만 하면 속이 불편해서 걱정입니다. 내과를 가야 할지, 가정의학과를 가야 할지 고민인데 어떤 병원을 방문하는 것이 좋을까요? 비슷한 경험 있으신 분들의 조언 부탁드립니다.");
    postData.put(1, post1);

    PostBean post2 = new PostBean();
    post2.setPid(2);
    post2.setTitle("코로나 후유증 관련 질문입니다.");
    post2.setAid("건강지킴이");
    post2.setVcount(88);
    post2.setContent("코로나 완치 후에도 계속 기침이 나고 가슴이 답답합니다. 이런 증상 겪어보신 분 계신가요? 어떻게 대처해야 할지 막막하네요.");
    postData.put(2, post2);

    PostBean post4 = new PostBean();
    post4.setPid(4);
    post4.setTitle("건강 관리 팁 공유해요");
    post4.setAid("헬스마스터");
    post4.setVcount(512);
    post4.setContent("제가 평소에 실천하는 건강 관리 팁 몇 가지 공유합니다. 여러분의 팁도 알려주세요!");
    postData.put(4, post4);

    // postId에 해당하는 게시글 찾기
    PostBean post = postData.get(postId);
    if (post == null) {
        // 게시글이 없을 경우 기본값 설정 또는 에러 처리
        post = new PostBean();
        post.setTitle("게시글을 찾을 수 없습니다.");
        post.setContent("");
    }
    
    request.setAttribute("post", post);

    // 임시 댓글 데이터 생성
    List<Map<String, String>> commentList = new ArrayList<>();

    Map<String, String> comment1 = new HashMap<>();
    comment1.put("author", "닥터김");
    comment1.put("isDoctor", "true");
    comment1.put("date", "2025-09-26 11:05:20");
    comment1.put("content", "안녕하세요. 소화기내과 전문의 김민준입니다. 말씀하신 증상은 기능성 소화불량이나 위염 초기 증상일 수 있습니다. 정확한 진단을 위해 가까운 소화기내과 방문을 권장합니다.");
    commentList.add(comment1);

    Map<String, String> comment2 = new HashMap<>();
    comment2.put("author", "일반사용자");
    comment2.put("isDoctor", "false");
    comment2.put("date", "2025-09-26 11:15:30");
    comment2.put("content", "저도 비슷한 증상이 있었는데, 스트레스 때문이더라고요. 충분한 휴식이 도움이 될 수 있습니다.");
    commentList.add(comment2);

    request.setAttribute("commentList", commentList);
%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>${post.title} - MediConnect</title>
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
            <!-- 게시글 본문 -->
            <div class="bg-white p-6 md:p-8 rounded-lg shadow">
                <div class="mb-4">
                    <span class="text-sm font-semibold text-brand-blue">Q&A</span>
                    <h1 class="text-3xl font-bold text-gray-900 mt-1">${post.title}</h1>
                    <div class="flex items-center space-x-4 text-sm text-gray-500 mt-3">
                        <div class="flex items-center">
                            <span>${post.aid}</span>
                        </div>
                        <span>2025-09-26 10:30:15</span>
                        <span>${post.vcount} views</span>
                    </div>
                </div>
                <div class="prose max-w-none mt-8 text-gray-800">
                    <p>${post.content}</p>
                </div>
            </div>

            <!-- 댓글/답변 -->
            <div class="bg-white p-6 md:p-8 rounded-lg shadow mt-8">
                <h2 class="text-xl font-bold mb-4">${commentList.size()} Comments/Answers</h2>
                
                <c:forEach var="comment" items="${commentList}">
                    <div class="flex space-x-3 py-4 border-t">
                        <svg class="w-8 h-8 text-gray-400" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg"><path fill-rule="evenodd" d="M18 10a8 8 0 11-16 0 8 8 0 0116 0zm-6-3a2 2 0 11-4 0 2 2 0 014 0zm-2 4a5 5 0 00-4.546 2.916A5.986 5.986 0 0010 16a5.986 5.986 0 004.546-2.084A5 5 0 0010 11z" clip-rule="evenodd"></path></svg>
                        <div class="flex-1">
                            <div class="flex items-center space-x-2 text-sm">
                                <span class="font-semibold">${comment.author}</span>
                                <c:if test="${comment.isDoctor == 'true'}">
                                    <div class="flex items-center text-green-600 bg-green-100 px-2 py-0.5 rounded-full">
                                        <svg class="w-4 h-4 mr-1" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg"><path fill-rule="evenodd" d="M10 18a8 8 0 100-16 8 8 0 000 16zm3.707-9.293a1 1 0 00-1.414-1.414L9 10.586 7.707 9.293a1 1 0 00-1.414 1.414l2 2a1 1 0 001.414 0l4-4z" clip-rule="evenodd"></path></svg>
                                        Verified Doctor
                                    </div>
                                </c:if>
                                <span class="text-gray-400">${comment.date}</span>
                            </div>
                            <p class="text-gray-800 mt-1">${comment.content}</p>
                        </div>
                    </div>
                </c:forEach>

                <!-- 댓글 폼 (로그인 및 권한에 따라 표시) -->
                <form class="mt-6">
                    <textarea class="w-full p-3 border rounded-lg focus:outline-none focus:ring-2 focus:ring-brand-lightblue" rows="4" placeholder="답변을 작성해주세요..." required></textarea>
                    <div class="text-right mt-2">
                        <button type="submit" class="px-6 py-2 bg-brand-blue text-white font-semibold rounded-lg hover:bg-brand-lightblue disabled:bg-gray-400 transition-colors duration-300">
                            등록
                        </button>
                    </div>
                </form>
                
            </div>
        </div>
    </main>

    <jsp:include page="layout/Footer.jsp" />

</body>
</html>

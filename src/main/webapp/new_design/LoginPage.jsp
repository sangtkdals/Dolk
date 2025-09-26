<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>로그인 - MediConnect</title>
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

    <main class="flex-grow flex items-center justify-center py-12 px-4 sm:px-6 lg:px-8">
        <div class="max-w-md w-full space-y-8 bg-white p-10 rounded-xl shadow-md">
            <div>
                <h2 class="mt-6 text-center text-3xl font-extrabold text-gray-900">
                    MediConnect 로그인
                </h2>
            </div>
            <form class="mt-8 space-y-6" action="../dolk/member/loginProcess.jsp" method="POST">
                <input type="hidden" name="remember" value="true">
                <div class="rounded-md shadow-sm -space-y-px">
                    <div>
                        <label for="id" class="sr-only">아이디</label>
                        <input id="id" name="id" type="text" required class="appearance-none rounded-none relative block w-full px-3 py-2 border border-gray-300 placeholder-gray-500 text-gray-900 rounded-t-md focus:outline-none focus:ring-brand-lightblue focus:border-brand-lightblue focus:z-10 sm:text-sm" placeholder="아이디">
                    </div>
                    <div>
                        <label for="password" class="sr-only">비밀번호</label>
                        <input id="password" name="pw" type="password" autocomplete="current-password" required class="appearance-none rounded-none relative block w-full px-3 py-2 border border-gray-300 placeholder-gray-500 text-gray-900 rounded-b-md focus:outline-none focus:ring-brand-lightblue focus:border-brand-lightblue focus:z-10 sm:text-sm" placeholder="비밀번호">
                    </div>
                </div>

                <div class="flex items-center justify-between">
                    <div class="text-sm">
                        <a href="findId.jsp" class="font-medium text-brand-blue hover:text-brand-lightblue">
                            아이디/비밀번호 찾기
                        </a>
                    </div>
                    <div class="text-sm">
                        <a href="signup.jsp" class="font-medium text-brand-blue hover:text-brand-lightblue">
                            회원가입
                        </a>
                    </div>
                </div>

                <div>
                    <button type="submit" class="group relative w-full flex justify-center py-2 px-4 border border-transparent text-sm font-medium rounded-md text-white bg-brand-blue hover:bg-brand-lightblue focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-brand-lightblue">
                        로그인
                    </button>
                </div>
            </form>
        </div>
    </main>

    <jsp:include page="layout/Footer.jsp" />

</body>
</html>

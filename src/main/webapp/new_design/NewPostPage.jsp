<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>새 글 작성 - MediConnect</title>
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
            <div class="bg-white p-8 rounded-lg shadow-md">
                <h1 class="text-3xl font-bold text-gray-800 mb-6">새 글 작성</h1>
                <form action="postProcess.jsp" method="post">
                    <div class="mb-4">
                        <label for="title" class="block text-gray-700 text-sm font-bold mb-2">제목</label>
                        <input type="text" id="title" name="title" class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:ring-2 focus:ring-brand-lightblue" required>
                    </div>
                    <div class="mb-6">
                        <label for="content" class="block text-gray-700 text-sm font-bold mb-2">내용</label>
                        <textarea id="content" name="content" rows="10" class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 mb-3 leading-tight focus:outline-none focus:ring-2 focus:ring-brand-lightblue" required></textarea>
                    </div>
                    <div class="flex items-center justify-end">
                        <button type="submit" class="px-6 py-2 bg-brand-blue text-white font-semibold rounded-lg hover:bg-brand-lightblue transition-colors duration-300">
                            등록하기
                        </button>
                    </div>
                </form>
            </div>
        </div>
    </main>

    <jsp:include page="layout/Footer.jsp" />

</body>
</html>

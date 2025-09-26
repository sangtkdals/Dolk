<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>의료 시설 검색 - MediConnect</title>
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
                <h1 class="text-3xl font-bold text-gray-800 mb-6">의료 시설 검색</h1>
                <form action="MedicalSearchPage.jsp" method="get" class="flex space-x-2">
                    <input type="text" name="query" class="flex-grow p-3 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-brand-lightblue" placeholder="지역 또는 병원 이름 입력...">
                    <button type="submit" class="px-6 py-3 bg-brand-blue text-white font-semibold rounded-lg hover:bg-brand-lightblue transition-colors duration-300">
                        검색
                    </button>
                </form>
            </div>

            <%-- 검색 결과 표시 영역 --%>
            <div class="mt-8">
                <%-- 검색 결과가 있을 경우 여기에 동적으로 내용 추가 --%>
                <%-- 예시: --%>
                <!--
                <div class="bg-white p-4 rounded-lg shadow">
                    <h3 class="font-bold">서울대학교병원</h3>
                    <p class="text-sm text-gray-600">서울특별시 종로구 대학로 101</p>
                </div>
                -->
            </div>
        </div>
    </main>

    <jsp:include page="layout/Footer.jsp" />

</body>
</html>

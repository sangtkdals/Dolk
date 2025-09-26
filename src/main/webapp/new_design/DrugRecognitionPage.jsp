<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>사진으로 의약품 분석 - MediConnect</title>
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
            <div class="bg-white p-8 rounded-lg shadow-md max-w-2xl mx-auto">
                <h1 class="text-3xl font-bold text-gray-800 mb-2 text-center">사진으로 의약품 분석</h1>
                <p class="text-gray-600 mb-6 text-center">의약품 사진을 업로드하면 AI가 분석해 드립니다.</p>
                
                <div class="border-2 border-dashed border-gray-300 rounded-lg p-8 text-center cursor-pointer hover:border-brand-blue">
                    <svg class="w-16 h-16 mx-auto text-gray-400" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="1.5" d="M7 16a4 4 0 01-.88-7.903A5 5 0 1115.9 6L16 6a5 5 0 011 9.9M15 13l-3-3m0 0l-3 3m3-3v12"></path></svg>
                    <p class="mt-4 text-gray-500">파일을 드래그 앤 드롭하거나 클릭하여 업로드하세요.</p>
                    <input type="file" class="hidden" />
                </div>

                <div class="mt-6 text-center">
                    <button type="button" class="px-8 py-3 bg-brand-blue text-white font-semibold rounded-lg hover:bg-brand-lightblue transition-colors duration-300">
                        분석하기
                    </button>
                </div>
            </div>

            <!-- 분석 결과 표시 영역 -->
            <div class="mt-8 max-w-2xl mx-auto">
                <!-- 분석 결과가 있을 경우 여기에 동적으로 내용 추가 -->
            </div>
        </div>
    </main>

    <jsp:include page="layout/Footer.jsp" />

</body>
</html>

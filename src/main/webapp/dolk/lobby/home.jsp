<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Dolk - 홈</title>
    
    <!-- 기존 assets 스타일 참조 -->
    <link rel="stylesheet" href="../assets/fonts/fonts.css">
    <link rel="stylesheet" href="../assets/css/style.css">
    <link rel="stylesheet" href="../assets/css/buttons.css">
    <link rel="stylesheet" href="../assets/css/gray.css">
    <link rel="stylesheet" href="../assets/css/header.css">
    <link rel="stylesheet" href="../assets/bootstrap/css/bootstrap.min.css">
    
    <!-- 홈페이지 전용 스타일 -->
    <link rel="stylesheet" href="../assets/css/home.css">
</head>
<body>
    <!-- 공통 헤더 포함 -->
    <%@ include file="../common/header.jsp" %>
    
    <!-- 메인 컨텐츠 -->
    <main class="main-content">
        <!-- 상단 영역: 슬라이더와 우측 패널 -->
        <div class="top-section">
            <!-- 슬라이더 (좌측 3분의 1) -->
            <div class="slider-container">
                <div class="slider">
                    <div class="slide">
                        <div class="slide-overlay">
                            <span>이미지 1</span>
                        </div>
                    </div>
                    <div class="slide">
                        <div class="slide-overlay">
                            <span>이미지 2</span>
                        </div>
                    </div>
                    <div class="slide">
                        <div class="slide-overlay">
                            <span>이미지 3</span>
                        </div>
                    </div>
                    <div class="slide">
                        <div class="slide-overlay">
                            <span>이미지 4</span>
                        </div>
                    </div>
                    <div class="slide">
                        <div class="slide-overlay">
                            <span>이미지 5</span>
                        </div>
                    </div>
                </div>
                
                <!-- 슬라이드 표시자 -->
                <div class="slide-indicators">
                    <span class="indicator active" tabindex="0" role="button" aria-label="첫 번째 슬라이드로 이동"><span></span></span>
                    <span class="indicator" tabindex="0" role="button" aria-label="두 번째 슬라이드로 이동"><span></span></span>
                    <span class="indicator" tabindex="0" role="button" aria-label="세 번째 슬라이드로 이동"><span></span></span>
                    <span class="indicator" tabindex="0" role="button" aria-label="네 번째 슬라이드로 이동"><span></span></span>
                    <span class="indicator" tabindex="0" role="button" aria-label="다섯 번째 슬라이드로 이동"><span></span></span>
                </div>
            </div>
            
            <!-- 우측 패널 (우측 3분의 2) -->
            <div class="right-panel">
                <div class="panel-header">
                    <h2 class="panel-title">Daily Tips</h2>
                    <a href="../news/dailyTips.jsp" class="more-link">더보기</a>
                </div>
                <div class="panel-content">
                    <div class="tips-list">
                        <div class="tip-item">
                            <div class="tip-icon">💡</div>
                            <div class="tip-text">
                                <h4>건강한 아침 식사</h4>
                                <p>하루를 시작하는 아침 식사는 건강의 기본입니다.</p>
                            </div>
                        </div>
                        <div class="tip-item">
                            <div class="tip-icon">🏃‍♂️</div>
                            <div class="tip-text">
                                <h4>규칙적인 운동</h4>
                                <p>주 3회 이상의 규칙적인 운동을 권장합니다.</p>
                            </div>
                        </div>
                        <div class="tip-item">
                            <div class="tip-icon">💧</div>
                            <div class="tip-text">
                                <h4>충분한 수분 섭취</h4>
                                <p>하루 8잔 이상의 물 섭취를 잊지 마세요.</p>
                            </div>
                        </div>
                        <div class="tip-item">
                            <div class="tip-icon">😴</div>
                            <div class="tip-text">
                                <h4>충분한 수면</h4>
                                <p>하루 7-8시간의 충분한 수면이 필요합니다.</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        
        <!-- 하단 영역: 소식 섹션 -->
        <div class="news-section">
            <div class="news-header">
                <h2 class="news-title">최신 소식</h2>
                <div class="news-tabs">
                    <button class="news-tab active" data-tab="health">건강 뉴스</button>
                    <button class="news-tab" data-tab="medical">의료 정보</button>
                    <button class="news-tab" data-tab="community">커뮤니티</button>
                </div>
            </div>
            <div class="news-content">
                <div class="news-list" id="health-news">
                    <div class="news-item">
                        <div class="news-date">2024.01.15</div>
                        <div class="news-text">
                            <h4>겨울철 건강 관리 방법</h4>
                            <p>추운 겨울철 건강을 지키는 효과적인 방법들을 알아보세요.</p>
                        </div>
                    </div>
                    <div class="news-item">
                        <div class="news-date">2024.01.12</div>
                        <div class="news-text">
                            <h4>비타민 D 부족 증상과 해결책</h4>
                            <p>겨울철 비타민 D 부족을 예방하는 방법을 소개합니다.</p>
                        </div>
                    </div>
                    <div class="news-item">
                        <div class="news-date">2024.01.10</div>
                        <div class="news-text">
                            <h4>스트레스 관리의 중요성</h4>
                            <p>일상생활에서 스트레스를 효과적으로 관리하는 방법을 알아보세요.</p>
                        </div>
                    </div>
                </div>
                <div class="news-list" id="medical-news" style="display: none;">
                    <div class="news-item">
                        <div class="news-date">2024.01.14</div>
                        <div class="news-text">
                            <h4>새로운 의료 기술 동향</h4>
                            <p>최신 의료 기술과 치료법에 대한 정보를 제공합니다.</p>
                        </div>
                    </div>
                    <div class="news-item">
                        <div class="news-date">2024.01.11</div>
                        <div class="news-text">
                            <h4>예방 접종 가이드</h4>
                            <p>연령별 권장 예방 접종 정보와 일정을 확인하세요.</p>
                        </div>
                    </div>
                </div>
                <div class="news-list" id="community-news" style="display: none;">
                    <div class="news-item">
                        <div class="news-date">2024.01.13</div>
                        <div class="news-text">
                            <h4>건강 커뮤니티 이벤트</h4>
                            <p>건강 관련 이벤트와 모임 정보를 확인해보세요.</p>
                        </div>
                    </div>
                    <div class="news-item">
                        <div class="news-date">2024.01.09</div>
                        <div class="news-text">
                            <h4>사용자 후기 모음</h4>
                            <p>실제 사용자들의 생생한 후기를 읽어보세요.</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </main>
    
    <!-- jQuery 및 기존 스크립트 참조 -->
    <script src="../assets/js/jquery-1.10.2.min.js"></script>
    <script src="../assets/js/scripts.js"></script>
    
    <script>
        // 슬라이드 관련 변수
        let currentSlideIndex = 0;
        let isAutoPlay = true;
        let autoPlayInterval;
        let isTransitioning = false;
        const totalSlides = 5;
        
        // 슬라이드 표시자 업데이트
        function updateIndicators(slideIndex) {
            const indicators = document.querySelectorAll('.indicator');
            indicators.forEach((indicator, index) => {
                indicator.classList.toggle('active', index === slideIndex);
            });
        }
        
        // 슬라이드 이동 함수 (애니메이션 포함)
        function goToSlide(slideIndex, isManual = false) {
            if (isTransitioning) return; // 전환 중이면 무시
            
            const slider = document.querySelector('.slider');
            
            // 인덱스 범위 체크
            if (slideIndex < 0) slideIndex = totalSlides - 1;
            if (slideIndex >= totalSlides) slideIndex = 0;
            
            // 수동 클릭인 경우 자동 재생 일시 정지
            if (isManual) {
                stopAutoPlay();
                // 수동 클릭 후 5초 후에 자동 재생 재개
                setTimeout(() => {
                    startAutoPlay();
                }, 5000);
            }
            
            // 전환 시작
            isTransitioning = true;
            
            // 슬라이드 이동 (CSS transition으로 부드러운 전환)
            slider.style.transform = `translateX(-${slideIndex * 20}%)`;
            
            // 표시자 업데이트
            updateIndicators(slideIndex);
            currentSlideIndex = slideIndex;
            
            // 전환 완료 후 플래그 해제
            setTimeout(() => {
                isTransitioning = false;
            }, 500); // CSS transition 시간과 동일
        }
        
        // 다음 슬라이드로 이동
        function nextSlide() {
            if (isTransitioning) return;
            
            let nextIndex = currentSlideIndex + 1;
            if (nextIndex >= totalSlides) {
                nextIndex = 0; // 첫 번째 슬라이드로 순환
            }
            goToSlide(nextIndex);
        }
        
        // 자동 재생 시작
        function startAutoPlay() {
            if (autoPlayInterval) clearInterval(autoPlayInterval);
            
            autoPlayInterval = setInterval(() => {
                if (isAutoPlay && !isTransitioning) {
                    nextSlide();
                }
            }, 5000); // 5초마다 슬라이드 변경
        }
        
        // 자동 재생 정지
        function stopAutoPlay() {
            isAutoPlay = false;
            if (autoPlayInterval) {
                clearInterval(autoPlayInterval);
            }
        }
        
        // 자동 재생 재개
        function resumeAutoPlay() {
            isAutoPlay = true;
            startAutoPlay();
        }
        
        // 페이지 로드 시 초기화
        document.addEventListener('DOMContentLoaded', function() {
            // 슬라이드 초기화
            const slider = document.querySelector('.slider');
            const indicators = document.querySelectorAll('.indicator');
            const sliderContainer = document.querySelector('.slider-container');
            
            // 초기 슬라이드 위치 설정
            slider.style.transform = 'translateX(0%)';
            updateIndicators(0); // 첫 번째 표시자 활성화
            
            // 슬라이드 표시자 클릭 이벤트
            indicators.forEach((indicator, index) => {
                // 클릭 이벤트
                indicator.addEventListener('click', function(e) {
                    e.preventDefault();
                    e.stopPropagation();
                    
                    if (isTransitioning) return; // 전환 중이면 무시
                    
                    goToSlide(index, true);
                });
                
                // 키보드 접근성
                indicator.addEventListener('keydown', function(e) {
                    if (e.key === 'Enter' || e.key === ' ') {
                        e.preventDefault();
                        e.stopPropagation();
                        
                        if (isTransitioning) return; // 전환 중이면 무시
                        
                        goToSlide(index, true);
                    }
                });
            });
            
            // 자동 재생 시작
            startAutoPlay();
            
            // 슬라이드 컨테이너에 마우스 오버 시 자동 재생 정지
            sliderContainer.addEventListener('mouseenter', stopAutoPlay);
            sliderContainer.addEventListener('mouseleave', resumeAutoPlay);
            
            // 뉴스 탭 기능
            const newsTabs = document.querySelectorAll('.news-tab');
            const newsLists = document.querySelectorAll('.news-list');
            
            newsTabs.forEach(tab => {
                tab.addEventListener('click', function() {
                    // 모든 탭에서 active 클래스 제거
                    newsTabs.forEach(t => t.classList.remove('active'));
                    // 클릭한 탭에 active 클래스 추가
                    this.classList.add('active');
                    
                    // 모든 뉴스 리스트 숨기기
                    newsLists.forEach(list => {
                        list.style.display = 'none';
                    });
                    
                    // 해당하는 뉴스 리스트 보이기
                    const targetTab = this.getAttribute('data-tab');
                    const targetList = document.getElementById(targetTab + '-news');
                    if (targetList) {
                        targetList.style.display = 'block';
                    }
                });
            });
        });
    </script>
</body>
</html>

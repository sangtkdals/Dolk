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
                            <span>건강한 생활</span>
                        </div>
                    </div>
                    <div class="slide">
                        <div class="slide-overlay">
                            <span>의료 서비스</span>
                        </div>
                    </div>
                    <div class="slide">
                        <div class="slide-overlay">
                            <span>전문 진료</span>
                        </div>
                    </div>
                    <div class="slide">
                        <div class="slide-overlay">
                            <span>건강 관리</span>
                        </div>
                    </div>
                    <div class="slide">
                        <div class="slide-overlay">
                            <span>의료 혁신</span>
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
                    <a href="dailyTips.jsp" class="more-link">더보기</a>
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
            
            <!-- 게시판 접근 섹션 -->
            <div class="board-access-section">
                <div class="board-container">
                    <div class="board-box">
                        <div class="board-icon">💬</div>
                        <h3 class="board-title">자유게시판</h3>
                        <p class="board-description">자유롭게 의견을 나누고 정보를 공유하는 공간입니다.</p>
                        <a href="../board/common/commonList.jsp" class="board-link">게시판 보기</a>
                    </div>
                    <div class="board-box">
                        <div class="board-icon">❓</div>
                        <h3 class="board-title">Q&A 게시판</h3>
                        <p class="board-description">건강과 의료에 대한 질문과 답변을 주고받는 공간입니다.</p>
                        <a href="../board/qna/qnaList.jsp" class="board-link">Q&A 보기</a>
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
        let isTransitioning = false;
        let autoPlayInterval;
        const totalSlides = 5;
        const slideDuration = 5000; // 5초
        const transitionDuration = 200; // 0.2초 (부드러운 전환)
        
        // 슬라이드 표시자 업데이트
        function updateIndicators(slideIndex) {
            const indicators = document.querySelectorAll('.indicator');
            indicators.forEach((indicator, index) => {
                indicator.classList.toggle('active', index === slideIndex);
            });
        }
        
        // 슬라이드 활성화/비활성화
        function setActiveSlide(slideIndex) {
            const slides = document.querySelectorAll('.slide');
            slides.forEach((slide, index) => {
                slide.classList.toggle('active', index === slideIndex);
            });
        }
        
        // 슬라이드 이동 함수 (순차적 전환)
        function goToSlide(targetIndex, isManual = false) {
            if (isTransitioning) return;
            
            // 인덱스 범위 체크
            if (targetIndex < 0) targetIndex = totalSlides - 1;
            if (targetIndex >= totalSlides) targetIndex = 0;
            
            // 현재 인덱스와 목표 인덱스가 같으면 무시
            if (currentSlideIndex === targetIndex) return;
            
            isTransitioning = true;
            
            // 순차적 전환 로직
            if (isManual) {
                // 수동 클릭 시 순차적으로 전환
                const direction = getDirection(currentSlideIndex, targetIndex);
                animateSequentialTransition(targetIndex, direction);
            } else {
                // 자동 재생 시 다음 슬라이드로
                const nextIndex = (currentSlideIndex + 1) % totalSlides;
                animateSequentialTransition(nextIndex, 1);
            }
        }
        
        // 전환 방향 계산
        function getDirection(from, to) {
            const forward = (to - from + totalSlides) % totalSlides;
            const backward = (from - to + totalSlides) % totalSlides;
            return forward <= backward ? 1 : -1;
        }
        
        // 순차적 전환 애니메이션
        function animateSequentialTransition(targetIndex, direction) {
            // 전환할 단계 수 계산
            let steps;
            if (direction === 1) {
                // 순방향
                steps = (targetIndex - currentSlideIndex + totalSlides) % totalSlides;
            } else {
                // 역방향
                steps = (currentSlideIndex - targetIndex + totalSlides) % totalSlides;
            }
            
            if (steps === 0) {
                isTransitioning = false;
                return;
            }
            
            const stepDuration = transitionDuration / steps;
            let stepCount = 0;
            let currentIndex = currentSlideIndex;
            
            // 단계별 전환
            function nextStep() {
                if (stepCount >= steps) {
                    // 전환 완료
                    isTransitioning = false;
                    currentSlideIndex = targetIndex;
                    updateIndicators(currentSlideIndex);
                    return;
                }
                
                // 현재 슬라이드 비활성화
                setActiveSlide(currentIndex);
                
                // 다음 인덱스 계산
                if (direction === 1) {
                    currentIndex = (currentIndex + 1) % totalSlides;
                } else {
                    currentIndex = (currentIndex - 1 + totalSlides) % totalSlides;
                }
                
                // 다음 슬라이드 활성화
                setTimeout(() => {
                    setActiveSlide(currentIndex);
                    stepCount++;
                    
                    // 다음 단계로
                    setTimeout(nextStep, stepDuration);
                }, 50); // 약간의 지연으로 부드러운 전환
            }
            
            nextStep();
        }
        
        // 자동 재생 시작
        function startAutoPlay() {
            if (autoPlayInterval) clearInterval(autoPlayInterval);
            
            autoPlayInterval = setInterval(() => {
                if (!isTransitioning) {
                    goToSlide((currentSlideIndex + 1) % totalSlides);
                }
            }, slideDuration);
        }
        
        // 자동 재생 정지
        function stopAutoPlay() {
            if (autoPlayInterval) {
                clearInterval(autoPlayInterval);
                autoPlayInterval = null;
            }
        }
        
        // 페이지 로드 시 초기화
        document.addEventListener('DOMContentLoaded', function() {
            const indicators = document.querySelectorAll('.indicator');
            const sliderContainer = document.querySelector('.slider-container');
            
            // 초기 슬라이드 위치 설정 (첫 번째 이미지)
            setActiveSlide(0);
            updateIndicators(0);
            
            // 슬라이드 표시자 클릭 이벤트
            indicators.forEach((indicator, index) => {
                indicator.addEventListener('click', function(e) {
                    e.preventDefault();
                    e.stopPropagation();
                    
                    if (isTransitioning) return;
                    
                    goToSlide(index, true);
                });
                
                // 키보드 접근성
                indicator.addEventListener('keydown', function(e) {
                    if (e.key === 'Enter' || e.key === ' ') {
                        e.preventDefault();
                        e.stopPropagation();
                        
                        if (isTransitioning) return;
                        
                        goToSlide(index, true);
                    }
                });
            });
            
            // 자동 재생 시작
            startAutoPlay();
            
            // 슬라이드 컨테이너에 마우스 오버 시 자동 재생 정지 (선택사항)
            sliderContainer.addEventListener('mouseenter', stopAutoPlay);
            sliderContainer.addEventListener('mouseleave', startAutoPlay);
            
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
            
            // 게시판 박스 호버 효과
            const boardBoxes = document.querySelectorAll('.board-box');
            boardBoxes.forEach(box => {
                box.addEventListener('mouseenter', function() {
                    this.style.transform = 'translateY(-5px)';
                    this.style.boxShadow = '0 8px 25px rgba(0,0,0,0.15)';
                });
                
                box.addEventListener('mouseleave', function() {
                    this.style.transform = 'translateY(0)';
                    this.style.boxShadow = '0 4px 15px rgba(0,0,0,0.1)';
                });
            });
        });
    </script>
</body>
</html>
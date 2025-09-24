<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>의료기관 찾기</title>
	<style>
		#map {
			width: 100%;
			height: 500px;
		}
		.map_wrap { 
			position: relative; 
			width: 100%; 
			height: 500px; 
		}
		.search_box { 
			position: absolute; 
			top: 10px; 
			left: 10px; 
			z-index: 2;
			background: #fff; 
			padding: 8px; 
			border-radius: 5px; 
			border: 1px solid #999;
			box-shadow: 0 2px 4px rgba(0,0,0,0.2);
		}
	</style>
</head>
<body>

	<h2>의료기관 찾기</h2>
	<p>찾고 싶은 지역이나 기관(병원, 약국 등)을 입력하세요.</p>
	
	<div class="map_wrap">
		<div id="map"></div> 
	
		<div class="search_box">
			<form onsubmit="searchPlaces(); return false;">
				<input type="text" id="keyword" size="25" placeholder="예: 부산시청 근처 내과">
				<button type="submit">검색</button>
			</form>
		</div>
	</div>

	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=459969a18fdfd87f90f3b9ddb1c8fdfe&libraries=services"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=YOUR_APP_KEY&libraries=services"></script>
	<script>
		var mapContainer = document.getElementById('map'); 
		var mapOption = { 
		    center: new kakao.maps.LatLng(35.1795543, 129.0756416), // 지도의 중심좌표 (부산시청)
		    level: 5 
		};
		var map = new kakao.maps.Map(mapContainer, mapOption); 
		var ps = new kakao.maps.services.Places();  

		var markers = [];

		function searchPlaces() {
		    var keyword = document.getElementById('keyword').value;
		    if (!keyword.trim()) {
		        alert('키워드를 입력해주세요!');
		        return false;
		    }
		    ps.keywordSearch(keyword, placesSearchCB); 
		}

		function placesSearchCB(data, status, pagination) {
		    if (status === kakao.maps.services.Status.OK) {
		        
		        clearMarkers();
		        
		        var bounds = new kakao.maps.LatLngBounds();

		        for (var i=0; i<data.length; i++) {
		            displayMarker(data[i]);    
		            bounds.extend(new kakao.maps.LatLng(data[i].y, data[i].x));
		        }       
		        map.setBounds(bounds);
		        
		    } else if (status === kakao.maps.services.Status.ZERO_RESULT) {
		        alert('검색 결과가 존재하지 않습니다.');
		        return;
		    } else if (status === kakao.maps.services.Status.ERROR) {
		        alert('검색 결과 중 오류가 발생했습니다.');
		        return;
		    }
		}

		function displayMarker(place) {
		    var marker = new kakao.maps.Marker({
		        map: map,
		        position: new kakao.maps.LatLng(place.y, place.x) 
		    });

		    markers.push(marker);

		    kakao.maps.event.addListener(marker, 'click', function() {
		        var infowindow = new kakao.maps.InfoWindow({
		            content: '<div style="padding:5px;font-size:12px;min-width:150px;">' + place.place_name + '</div>'
		        });
		        infowindow.open(map, marker);
		    });
		}
		
		function clearMarkers() {
		    for (var i = 0; i < markers.length; i++) {
		        markers[i].setMap(null);
		    }   
		    markers = [];
		}
	</script>
</body>
</html>
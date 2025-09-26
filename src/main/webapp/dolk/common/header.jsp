<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
	String contextPath = request.getContextPath();
	String userName = (String) session.getAttribute("userName");
%>

<!-- Assets 스타일 참조 -->
<link rel="stylesheet" href="../assets/fonts/fonts.css">
<link rel="stylesheet" href="../assets/css/style.css">
<link rel="stylesheet" href="../assets/css/buttons.css">
<link rel="stylesheet" href="../assets/css/gray.css">
<link rel="stylesheet" href="../assets/css/header.css">
<link rel="stylesheet" href="../assets/bootstrap/css/bootstrap.min.css">

<style>
	/* 헤더 스타일 - 기존 nav 스타일 활용 */
	.header {
		position: fixed;
		top: 0;
		left: 0;
		width: 100%;
		padding: 28px 0;
		background: #9ccbc0;
		z-index: 99999;
		box-shadow: 0 2px 10px rgba(0,0,0,0.1);
	}

	.header-content {
		max-width: 1200px;
		margin: 0 auto;
		display: flex;
		justify-content: space-between;
		align-items: center;
		padding: 0 2rem;
	}

	.nav-logo {
		text-align: left;
	}

	.nav-links {
		text-align: right;
		display: flex;
		align-items: center;
		gap: 20px;
	}

	.logo {
		font-family: 'signikabold', sans-serif;
		font-size: 36px;
		color: #464c5c;
		text-decoration: none;
		text-shadow: 0 2px 0 rgba(8, 8, 8, 0.1);
	}

	.logo:hover {
		color: #464c5c;
	}

	/* 로그인 버튼 - 기존 button-1 스타일 활용 */
	.login-btn {
		display: inline-block;
		height: 53px;
		margin: 0;
		padding: 19px 18px 0 18px;
		font-family: 'signikaregular', sans-serif;
		font-size: 18px;
		color: #464c5c;
		line-height: 18px;
		text-shadow: 0 1px 0 rgba(8, 8, 8, 0.2);
		background: transparent;
		border: none;
		text-decoration: none;
		cursor: pointer;
	}

	.login-btn:hover, .login-btn:focus, .login-btn.active {
		outline: none;
		background: #fff;
		color: #9ccbc0;
		text-shadow: none;
		-moz-border-radius: 4px;
		-webkit-border-radius: 4px;
		border-radius: 4px;
		-moz-box-shadow: 0 2px 0 0 rgba(8, 8, 8, 0.08);
		-webkit-box-shadow: 0 2px 0 0 rgba(8, 8, 8, 0.08);
		box-shadow: 0 2px 0 0 rgba(8, 8, 8, 0.08);
	}

	/* 사용자 패널 */
	.user-info {
		position: relative;
		cursor: pointer;
		color: #464c5c;
		font-family: 'signikaregular', sans-serif;
		font-size: 16px;
		font-weight: 600;
	}

	.user-panel {
		position: absolute;
		right: 0;
		top: 100%;
		width: 200px;
		background: #fff;
		border-radius: 8px;
		box-shadow: 0 4px 20px rgba(0,0,0,0.15);
		padding: 20px;
		display: none;
		z-index: 1000;
		margin-top: 10px;
	}

	.user-panel.show {
		display: block;
	}

	.user-panel .user-name {
		font-family: 'signikabold', sans-serif;
		font-size: 16px;
		color: #464c5c;
		margin-bottom: 15px;
		text-align: center;
	}

	.user-panel .btn {
		display: block;
		width: 100%;
		padding: 10px 15px;
		margin: 5px 0;
		background: #9ccbc0;
		color: #464c5c;
		text-decoration: none;
		font-family: 'signikaregular', sans-serif;
		font-size: 14px;
		text-align: center;
		border-radius: 4px;
		transition: all 0.3s ease;
	}

	.user-panel .btn:hover {
		background: #464c5c;
		color: #9ccbc0;
	}

</style>

<header class="header">
	<div class="header-content">
		<div class="nav-logo">
			<a href="<%=contextPath%>/dolk/lobby/home.jsp" class="logo">Dolk</a>
		</div>
		<div class="nav-links">
			<% if (userName == null || userName.trim().isEmpty()) { %>
				<a href="<%=contextPath%>/dolk/member/login.jsp" class="login-btn">로그인</a>
			<% } else { %>
				<div class="user-info" id="headerUserTrigger">
					<%= userName %>님 ▼
				</div>
				<div class="user-panel" id="userPanel">
					<div class="user-name"><%= userName %></div>
					<a class="btn" href="<%=contextPath%>/dolk/member/myPage.jsp">내정보 관리</a>
					<a class="btn" href="<%=contextPath%>/dolk/member/logout.jsp">로그아웃</a>
				</div>
			<% } %>
		</div>
	</div>
</header>

<script>
	(function(){
		var trigger = document.getElementById('headerUserTrigger');
		var panel = document.getElementById('userPanel');
		if (!trigger || !panel) return;
		
		var visible = false;
		function toggle() {
			visible = !visible;
			panel.classList.toggle('show', visible);
		}
		
		trigger.addEventListener('click', function(e) {
			e.stopPropagation();
			toggle();
		});
		
		document.addEventListener('click', function(e) {
			if (!panel.contains(e.target) && e.target !== trigger) {
				visible = false;
				panel.classList.remove('show');
			}
		});
	})();
</script>
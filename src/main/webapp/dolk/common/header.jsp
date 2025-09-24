<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
	String contextPath = request.getContextPath();
	String userName = (String) session.getAttribute("userName");
%>

<style>
	.header-bar{position:fixed;top:0;left:0;right:0;height:72px;background:#aba6bf;color:#ffffff;display:flex;align-items:center;justify-content:space-between;padding:0 24px;z-index:1000;box-sizing:border-box}
	.header-logo{font-weight:800;font-style:italic;letter-spacing:.5px;cursor:pointer;user-select:none}
	.header-right{display:flex;align-items:center;gap:16px}
	.header-action{cursor:pointer;color:#ffffff;text-decoration:none;font-weight:600}
	.header-action:hover{opacity:.9}
	.user-panel{position:absolute;right:24px;top:72px;width:300px;background:#b5b0c7;border-radius:8px;box-shadow:0 8px 20px rgba(0,0,0,.2);padding:20px 20px 16px 20px;display:none;z-index:1200}
	.user-panel.show{display:block}
	.user-panel .profile{width:84px;height:84px;border-radius:50%;background:#ffffff;margin-bottom:12px}
	.user-panel .user-name{font-size:16px;font-weight:700;margin-bottom:16px;color:#ffffff}
	.user-panel .btn{display:block;width:100%;text-align:right;color:#ffffff;font-weight:700;text-decoration:none;margin:6px 0}
	/* Spacer below header so content is not hidden */
	.header-spacer{height:72px}
</style>

<div class="header-bar">
	<div class="header-logo" onclick="location.href='<%=contextPath%>/Home.jsp'">Dolk</div>
	<div class="header-right">
		<% if (userName == null || userName.trim().isEmpty()) { %>
			<a class="header-action" href="<%=contextPath%>/dolk/member/login.jsp">로그인</a>
		<% } else { %>
			<div class="header-action" id="headerUserTrigger"><%= userName %>님</div>
		<% } %>
	</div>

	<% if (userName != null && !userName.trim().isEmpty()) { %>
		<div class="user-panel" id="userPanel">
			<div style="display:flex;align-items:center;gap:16px;">
				<div class="profile"></div>
				<div class="user-name"><%= userName %></div>
			</div>
			<hr style="border:none;border-top:1px solid rgba(255,255,255,.35);margin:12px 0">
			<a class="btn" href="<%=contextPath%>/dolk/member/myPage.jsp">내정보 관리</a>
			<a class="btn" href="<%=contextPath%>/dolk/member/logout.jsp">로그아웃</a>
		</div>
	<% } %>
</div>
<div class="header-spacer"></div>

<script>
	(function(){
		var trigger=document.getElementById('headerUserTrigger');
		var panel=document.getElementById('userPanel');
		if(!trigger||!panel) return;
		var visible=false;
		function toggle(){visible=!visible;panel.classList.toggle('show',visible);} 
		trigger.addEventListener('click',function(e){e.stopPropagation();toggle();});
		document.addEventListener('click',function(e){
			if(!panel.contains(e.target) && e.target!==trigger){
				visible=false;panel.classList.remove('show');
			}
		});
	})();
</script>
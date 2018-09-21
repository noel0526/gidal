<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<div style = "background-color : #EB6864;">
	<nav class="navbar navbar-expand-lg navbar-dark bg-primary" style = "max-width : 1050px; margin-right : auto; margin-left : auto;">
		<a class="navbar-brand" href="/">
			<img src="/resources/img/logo/GiDal.png" style="margin : auto; height : 30px; width : auto;">
		</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarColor01" aria-controls="navbarColor01" aria-expanded="true" aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>

		<div class="navbar-collapse collapse show" id="navbarColor01" style="">
			<ul class="navbar-nav mr-auto">
				<li class="nav-item dropdown">
					<a class="nav-link dropdown-toggle" data-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">
						소개
					</a>
					<div class="dropdown-menu" x-placement="bottom-start" style="position: absolute; will-change: transform; top: 0px; left: 0px; transform: translate3d(0px, 42px, 0px);">
						<a class="dropdown-item" href="/info/info">팀소개</a>
						<a class="dropdown-item" href="/info/whatIs">기달이란</a>
						<a class="dropdown-item" href="/info/wayToCome">오시는길</a>
				</div>
				</li>
				<li class="nav-item dropdown">
					<a class="nav-link dropdown-toggle" data-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">
						이벤트
					</a>
					<div class="dropdown-menu" x-placement="bottom-start" style="position: absolute; will-change: transform; top: 0px; left: 0px; transform: translate3d(0px, 42px, 0px);">
						<a class="dropdown-item" href="/event/currentEvent">진행 중인 이벤트</a>
						<a class="dropdown-item" href="/event/closedEvent">종료된 이벤트</a>
						<a class="dropdown-item" href="/event/upcomingEvent">진행 예정 이벤트</a>
					</div>
				</li>
					<li class="nav-item active">
       				 <a class="nav-link" href="/enterprise/view">지역별 검색<span class="sr-only">(current)</span></a>
     			 </li>
			</ul>
			<div>
			<form class="form-inline my-2 my-lg-0" action = "/WEB-INF/views/search/search" method = "post">

				<input class="form-control mr-sm-2" type="text" placeholder="업체검색">
				<button class="btn btn-secondary my-2 my-sm-0" type="submit">검색</button>&nbsp;&nbsp;
			</form>
			</div>

			<div>
				<span class="navbar-text">
					<c:choose>
						<c:when test = "${ LEVEL eq 'user' }">
							<a href="/user/userpage" class="navbar-link" style = "color : #F5B4B2; text-decoration : none">user</a>
							 or
							<a href="/authentication/logout" class="navbar-link" style = "color : #F5B4B2; text-decoration : none">로그아웃</a>
						</c:when>
						<c:when test = "${ LEVEL eq 'enterpirse' }">
							<a href="/authentication/signIn" class="navbar-link" style = "color : #F5B4B2; text-decoration : none">enterpirse</a>
							 or
							<a href="/authentication/logout" class="navbar-link" style = "color : #F5B4B2; text-decoration : none">로그아웃</a>
						</c:when>
						<c:when test = "${ LEVEL eq 'admin' }">
							<a href="/admin/adminPage" class="navbar-link" style = "color : #F5B4B2; text-decoration : none">admin</a>
							 or
							<a href="/authentication/logout" class="navbar-link" style = "color : #F5B4B2; text-decoration : none">로그아웃</a>
						</c:when>
						<c:otherwise>
							<a href="/authentication/signIn" class="navbar-link" style = "color : #F5B4B2; text-decoration : none">로그인</a>
							 or
							<a href="/authentication/signUp" class="navbar-link" style = "color : #F5B4B2; text-decoration : none">회원가입</a>
						</c:otherwise>
					</c:choose>
				</span>
			</div>


		</div>
	</nav>
</div>

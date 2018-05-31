<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page isELIgnored="false"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ request.getContextPath() + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base href="<%=basePath%>" />
<title>Insert title here</title>
</head>
<script type="text/javascript" src="js/jquery-1.7.2.min.js"></script>
<script type="text/javascript" src="js/bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript"
	src="js/bootstrap-datetimepicker-master/js/bootstrap-datetimepicker.min.js"></script>
<link href="js/bootstrap/css/bootstrap.min.css" rel="stylesheet">

<link
	href="js/bootstrap-datetimepicker-master/css/bootstrap-datetimepicker.min.css"
	rel="stylesheet">
<script type="text/javascript"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<body>

	<div class="container-fluid">
		<div class="row-fluid">
			<div class="span12">
				<div class="navbar">
					<div class="navbar-inner">
						<div class="container-fluid">
							<a data-target=".navbar-responsive-collapse"
								data-toggle="collapse" class="btn btn-navbar"><span
								class="icon-bar"></span><span class="icon-bar"></span><span
								class="icon-bar"></span></a> <a href="#" class="brand">网站名</a>
							<div class="nav-collapse collapse navbar-responsive-collapse">
								<ul class="nav">
									<li class="active"><a href="gotoIndex.do">主页</a></li>
									<li class=""><a href="#">选择用户</a></li>
								</ul>

							</div>

						</div>
					</div>

				</div>
				<div class="row-fluid">
					<div class="span6">
						<div style="float: left; width: 400px; height: 350px;">
							<a href="#" class="thumbnail"> <img
								src="image/upload_hover.jpg" class="img-rounded"
								style="width: 300px; height: 300px" />

							</a>
						</div>
					</div>
					<div class="span6">
						<dl>
							<dt>影片ID</dt>
							<dd>${movie_used.movieId}</dd>
							<dt>影片名称</dt>
							<dd>${movie_used.title}</dd>
							<dt>影片类型</dt>
							<dd>${movie_used.genres}</dd>
						</dl>
					</div>
				</div>
				<div class="row-fluid">
					
					<div class="span12">
						<legend class="">
							<h3>您还可能喜欢.</h3>
						</legend>
						<c:forEach items="${movies}" var="movie">
							<div style="float: left; width: 200px; height: 220px;">

								<img src="image/upload_hover.jpg" class="img-rounded"
									style="width: 100px; height: 120px" /> <br> ${movie.title}<br>
								<font style="color: red; font-size: 16px;">评&nbsp&nbsp分:${movie.preferance}</font>

							</div>
						</c:forEach>
					</div>
					
				</div>
			</div>
		</div>
	</div>

</body>
</html>
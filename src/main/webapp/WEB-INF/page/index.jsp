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
<title>电影主页</title>
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
								class="icon-bar"></span></a> <a href="#" class="brand">电影推荐系统</a>
							<div class="nav-collapse collapse navbar-responsive-collapse">
								<ul class="nav">
									<li class="active"><a href="gotoIndex.do">主页</a></li>
									<li><a href="#">选择用户</a></li>
									<li><a href="userbased.do">基于用户推荐</a></li>

								</ul>

							</div>

						</div>
					</div>

				</div>
				<div class="row-fluid">
					<div class="span2"></div>
					<div class="span8">

						<legend class="">
							<h3>电影列表</h3>
						</legend>
						<c:forEach items="${pageInfo.list}" var="movie">
							<div style="float: left; width: 150px; height: 200px;">
								<a href="to_movie_recommand/${movie.movieId}/${userId}.do"> <img
									src="image/upload_hover.jpg" class="img-rounded"
									style="width: 100px; height: 120px" /> <br>
									${movie.title}
								</a><br>
							</div>
						</c:forEach>
						<!-- 分页条 -->
						<div class="row-fluid">
							<div class="span12">
								<!--分页文字信息  -->
								<div>当前 ${pageInfo.pageNum }页,总${pageInfo.pages } 页,总
									${pageInfo.total } 条记录</div>
								<!-- 分页条信息 -->
								<div class="pagination" style="float: right;">
									<nav aria-label="Page navigation">
									<ul class="pagination">
										<li><a href="gotoIndex.do?pn=1">首页</a></li>

										<!-- 前一页 -->
										<c:if test="${pageInfo.hasPreviousPage }">
											<li><a href="gotoIndex.do?pn=${pageInfo.pageNum-1}"
												aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
											</a></li>
										</c:if>

										<!-- 当前页显示高亮 -->
										<c:forEach items="${pageInfo.navigatepageNums }"
											var="page_Num">
											<c:if test="${page_Num == pageInfo.pageNum }">
												<li class="active disable"><a
													href="gotoIndex.do?pn=${page_Num }">${page_Num }</a></li>
											</c:if>
											<c:if test="${page_Num != pageInfo.pageNum }">
												<li><a href="gotoIndex.do?pn=${page_Num }">${page_Num }</a></li>
											</c:if>

										</c:forEach>

										<!-- 下一页 -->
										<c:if test="${pageInfo.hasNextPage }">
											<li><a href="gotoIndex.do?pn=${pageInfo.pageNum+1 }"
												aria-label="Next"> <span aria-hidden="true">&raquo;</span>
											</a></li>
										</c:if>
										<li><a href="gotoIndex.do?pn=${pageInfo.pages}">末页</a></li>
									</ul>
									</nav>
								</div>
							</div>

						</div>
					</div>
					<div class="span2"></div>
				</div>

			</div>
		</div>
	</div>
</body>
</html>
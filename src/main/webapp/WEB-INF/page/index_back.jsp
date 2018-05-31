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
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>电影推荐系统</title>
</head>


<script type="text/javascript" src="js/jquery-1.7.2.min.js"></script>
<script type="text/javascript" src="js/bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript"
	src="js/bootstrap-datetimepicker-master/js/bootstrap-datetimepicker.min.js"></script>
<link href="js/bootstrap/css/bootstrap.min.css" rel="stylesheet">

<link
	href="js/bootstrap-datetimepicker-master/css/bootstrap-datetimepicker.min.css"
	rel="stylesheet">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript">
	function getMovies() {

		var id = $("#userid").val();
		var num = $("#num").val();
		var check = $("input[name='group']:checked").val();

		var parm="userID="+id+"&num="+num+"&check="+check;
		$.ajax({
			url : "getMovie.do",
			type : "post",
			data : parm,
			success : function(data) {

				$("#movies_inner").html(data);

			}
		});
	}
</script>
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
									<li class="active"><a href="#">主页</a></li>


								</ul>
								
							</div>

						</div>
					</div>

				</div>
				<div class="row-fluid">
					<div class="span4">

						<div id="legend" class="">
							<legend class="">
								<h3>请填写推荐条件</h3>
							</legend>
						</div>

						<div class="control-group">

							<!-- Select Basic -->
							<label class="control-label">请选择用户ID</label>
							<div class="controls">
								<select class="input-xlarge" id="userid">
									<option>请选择</option>

									<c:forEach var="i" begin="1" end="671" varStatus="status">

										<option>${status.index}</option>

									</c:forEach>

								</select>
							</div><br>
							<label class="control-label">请选择推荐数量</label>
							<div class="controls">
								<select class="input-xlarge" id="num">
									<option>请选择</option>

									<c:forEach var="i" begin="5" end="15" varStatus="status">

										<option>${status.index}</option>

									</c:forEach>

								</select>
							</div>

						</div>
						<div class="control-group">
									<label class="control-label">推荐方式</label>
									<div class="controls">

										<!-- Inline Radios -->
										<label class="radio inline"> 
										<input type="radio" value="1" checked="checked" name="group"> User based
										</label> 
										<label class="radio inline"> 
										<input type="radio" value="2" name="group"> Item based
										</label> 
									</div>
								</div><br>


						<div class="control-group">
							<label class="control-label"></label>

							<!-- Button -->
							<div class="controls">
								<button class="btn btn-success" onclick="getMovies()">推荐电影</button>
							</div>
						</div>

					</div>
					<div class="span8">
						<legend class=""><h3>推荐列表.</h3></legend>
						<div id="movies_inner">
							<jsp:include page="movies.jsp"></jsp:include>
						</div>
					</div>

				</div>
			</div>
		</div>
	</div>
</body>

</html>
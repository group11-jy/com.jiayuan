<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page isELIgnored="false"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ request.getContextPath() + "/";
%>
<%-- <jsp:forward page="gotoIndex.do"></jsp:forward> --%>
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

<body>
	<div class="container-fluid">
		<div class="row-fluid">
			<div class="span12">
				<h3></h3>
				<div class="row-fluid">
					<div class="span3"></div>
					<div class="span6">

						<form class="form-horizontal" action="gotoIndex.do" method="post">
							<fieldset>
								<div id="legend" class="">
									<legend class="">请填写用户信息</legend>
								</div>
								<div class="control-group">

									<!-- Select Basic -->
									<label class="control-label">请选择用户ID</label>
									<div class="controls">
										<select class="input-xlarge" id="userid" name="userId">
											<option>请选择</option>

											<c:forEach var="i" begin="1" end="671" varStatus="status">

												<option>${status.index}</option>

											</c:forEach>

										</select>
									</div>

								</div>

								<div class="control-group">
									<label class="control-label"></label>

									<!-- Button -->
									<div class="controls">
										<button id="tj" class="btn btn-success">进入系统</button>
									</div>
								</div>

							</fieldset>
						</form>
					</div>
					<div class="span3"></div>
				</div>
			</div>
		</div>
	</div>
</body>

</html>
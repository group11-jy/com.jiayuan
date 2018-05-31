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
<script type="text/javascript"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<body>
	
		<c:forEach items="${movies}" var="movie">
			<div style="float: left; width: 100px; height: 200px;">

				<img src="image/upload_hover.jpg" class="img-rounded"
					style="width: 80px; height: 100px" /> <br>
				${movie.title}<br>
				<font style="color:red;font-size:16px;">评&nbsp&nbsp分:${movie.preferance}</font>

			</div>
		</c:forEach>
	
</body>
</html>
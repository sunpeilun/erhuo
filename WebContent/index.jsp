<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>二货-校园二手网</title>
</head>
<body>
<script src="${pageContext.request.contextPath}/js/jquery/2.1.4/jquery.min.js"></script>
<script type="text/javascript">
	location.href = '${pageContext.request.contextPath}/Classify/showThreeList.apx';
	//location.href = '${pageContext.request.contextPath}/home.jsp'
</script>
	<%-- <%response.sendRedirect(request.getContextPath() + "/Classify/showThreeList.apx"); %> --%>
	<%-- <jsp:forward page="${pageContext.request.contextPath}/Classify/showThreeList.apx"></jsp:forward> --%>
</body>
</html>
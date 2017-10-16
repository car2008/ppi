<%@ page language="java"  contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title></title>
</head>
<body>
<shiro:guest>
	游客，你好
</shiro:guest>
<shiro:hasAnyRoles name="USER">
	你是个普通用户
</shiro:hasAnyRoles>
<shiro:hasAnyRoles name="ADMIN">
	你是个管理员
</shiro:hasAnyRoles>
<shiro:hasPermission name="/home">  
    拥有普通用户权限
</shiro:hasPermission>
<shiro:hasPermission name="/admin">  
    拥有管理员权限
</shiro:hasPermission>
<shiro:authenticated> 
${msg } Welcome!  <shiro:principal/>
</shiro:authenticated>
	<br><br>
	<%-- 
	<shiro:hasAnyRoles name="USER">
		<a href="/jsp/user.jsp">User Page</a>
	</shiro:hasAnyRoles>
	
	<br><br>
	
	<shiro:hasAnyRoles name="admin">
		<a href="/jsp/admin.jsp">Admin Page</a>
	</shiro:hasAnyRoles> --%>
	
	<br><br>
	<a href="logout.do">Logout</a>
</body>
</html>
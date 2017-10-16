<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags"%>
<%@ page isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<jsp:directive.page import="java.util.Hashtable" />
<jsp:directive.page import="com.ppi.search.pojo.News" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title></title>
<%@include file="frontend.jsp"%>
</head>

<body class="page-body" style="background-color: #ccc;">
	<div class="wrap">
		<div class="container"
			style="background-color: #efefef; padding: 25px 15px; border-bottom: 1px solid #ccc; font-size: 25px;">
			<i class="fa fa-fw fa-home"></i> Home
		</div>
		<div class="container"
			style="background-color: #fff; padding: 25px 35px;">
			<div class="row">

				<div class="col-sm-6">
					<h3>
						<a href="newses/${ categories[0]}">${ categories[0]}</a>
					</h3>
					<c:forEach items="${newses[categories[0]]}" var="value"
						varStatus="status">
						<p>
							<a href="news/${value.id}"><fmt:formatDate
									value='${value.dateCreated}' pattern='yyyy-MM-dd' />
								${value.title}</a>
						</p>
					</c:forEach>
				</div>

				<div class="col-sm-6">
					<h3>
						<a href="newses/${ categories[1]}">${ categories[1]}</a>
					</h3>
					<c:forEach items="${newses[categories[1]]}" var="value"
						varStatus="status">
						<p>
							<a href="news/${value.id}"><fmt:formatDate
									value='${value.dateCreated}' pattern='yyyy-MM-dd' />
								${value.title}</a>
						</p>
					</c:forEach>
				</div>
			</div>
			<div style="margin-top: 40px; margin-bottom: 40px;">
				<hr />
			</div>

			<div class="row">

				<c:forEach items="${links}" var="link" varStatus="status">
					<c:if test="${status.index % 4 == 0}">
						<div class="row">
					</c:if>
					<div class="col-sm-3">
						<i class="entypo-link"></i> <a href="${link.url}" target="_blank">${link.title}</a>
					</div>
					<c:if test="${status.index % 4 == 3}">
			</div>
			</c:if>
			</c:forEach>
		</div>
	</div>
</body>
</html>
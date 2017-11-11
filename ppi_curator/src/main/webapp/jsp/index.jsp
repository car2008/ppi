<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="public.jsp"%>
<!-- Main Container -->
<main id="main-container">
	<div class="wrap">
		<div class="container"
			style="background-color: #efefef; padding: 25px 15px; border-bottom: 1px solid #ccc; font-size: 25px;">
			<i class="fa fa-fw fa-home"></i> Home ${error }
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
				<!-- <a href="search/we/0/*/*/*/*/0/10" target="_blank">测试</a> -->
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
</main>
<%@ include file="foot.jsp"%>
</div>
</body>
</html>
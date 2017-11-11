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
						搜索结果:${list.size()}
					</h3>
					<c:forEach items="${list}" var="value"
						varStatus="status">
						<p>
							<a href="#">	${value.title}</a>
						</p>
					</c:forEach>
				</div>

			</div>
			<div style="margin-top: 40px; margin-bottom: 40px;">
				<hr />
			</div>
		</div>
	</div>
</main>
<%@ include file="foot.jsp"%>
</div>
</body>
</html>
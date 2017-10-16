<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="public.jsp"%>
<main id="main-container">
	<div class="container" style="background-color: #efefef; padding: 25px 15px; border-bottom: 1px solid #ccc; font-size: 25px;">
		<i class="fa fa-fw fa-bullhorn"></i>
		${category}
	</div>
	<div class="container" style="background-color: #fff; padding: 25px 15px;">
		<div class="row">

			<div class="col-sm-12">
				<c:forEach items="${newses}" var="news">
					<p>
						<a ref="#">
							${news.title}
						</a>
					</p>
				</c:forEach>
			</div>

		</div>
	</div>
</main>
<%@ include file="foot.jsp"%>
</div><!-- END Page Container -->
</body>
</html>
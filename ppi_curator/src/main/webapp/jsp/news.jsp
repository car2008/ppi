<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="public.jsp"%>
<main id="main-container">
	<div class="container" style="background-color: #efefef; padding: 25px 15px; border-bottom: 1px solid #ccc; font-size: 25px;">
		<i class="fa fa-fw fa-bullhorn"></i>
		${news.title}
	</div>
	<div class="container" style="background-color: #fff; padding: 25px 15px;">
		<div class="row">
			<div class="col-sm-12">
				${news.content}
			</div>
		</div>
	</div>
</main>
<%@ include file="foot.jsp"%>
</div>
</body>
</html>
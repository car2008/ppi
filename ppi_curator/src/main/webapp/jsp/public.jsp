<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags"%>
<%@ page isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<jsp:directive.page import="java.util.Hashtable" />
<jsp:directive.page import="com.ppi.search.pojo.News" />
<jsp:directive.page import="com.ppi.search.pojo.User" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<meta name="renderer" content="webkit" />
<meta name="author" content="Wang Lei" />
<title></title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/frontend/css/font-icons/entypo/css/entypo.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/frontend/css/font-icons/font-awesome/css/font-awesome.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/frontend/css/bootstrap.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/frontend/css/neon.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/frontend/css/neon-core.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/frontend/css/neon-theme.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/frontend/css/neon-forms.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/frontend/js/icheck/skins/cloud/grey.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/frontend/js/select2/select2-bootstrap.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/frontend/js/select2/select2-modified.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/frontend/css/ppi_curator.css" />

<script src="${pageContext.request.contextPath}/js/jquery-1.11.0.min.js"></script>
<script
	src="${pageContext.request.contextPath}/frontend/js/gsap/main-gsap.js"></script>
<script
	src="${pageContext.request.contextPath}/frontend/js/bootstrap.js"></script>
<script src="${pageContext.request.contextPath}/frontend/js/joinable.js"></script>
<script
	src="${pageContext.request.contextPath}/frontend/js/resizeable.js"></script>
<script
	src="${pageContext.request.contextPath}/frontend/js/neon-slider.js"></script>
<script
	src="${pageContext.request.contextPath}/frontend/js/neon-custom.js"></script>
<script
	src="${pageContext.request.contextPath}/frontend/js/raphael-min.js"></script>
<script
	src="${pageContext.request.contextPath}/frontend/js/morris.min.js"></script>
<script
	src="${pageContext.request.contextPath}/frontend/js/icheck/icheck.min.js"></script>
<script
	src="${pageContext.request.contextPath}/frontend/js/select2/select2.min.js"></script>
<script
	src="${pageContext.request.contextPath}/frontend/js/js.cookie.js"></script>
<script src="${pageContext.request.contextPath}/frontend/js/Hydrate.js"></script>
<script src="${pageContext.request.contextPath}/frontend/js/retina.js"></script>
<script
	src="${pageContext.request.contextPath}/frontend/js/bootstrap-datepicker.js"></script>

<link
	href="${pageContext.request.contextPath}/frontend/js/datatables/css/dataTables.bootstrap.css"
	rel="stylesheet" type="text/css" />
<link
	href="${pageContext.request.contextPath}/frontend/js/datatables/extensions/ColVis/css/dataTables.colVis.min.css"
	rel="stylesheet" type="text/css" />
<link
	href="${pageContext.request.contextPath}/frontend/js/datatables/extensions/TableTools/css/dataTables.tableTools.min.css"
	rel="stylesheet" type="text/css" />
<link
	href="${pageContext.request.contextPath}/frontend/js/datatables/extensions/ColReorder/css/dataTables.colReorder.min.css"
	rel="stylesheet" type="text/css" />
<script
	src="${pageContext.request.contextPath}/frontend/js/datatables/js/jquery.dataTables.min.js"></script>
<script
	src="${pageContext.request.contextPath}/frontend/js/datatables/extensions/ColVis/js/dataTables.colVis.js"></script>
<script
	src="${pageContext.request.contextPath}/frontend/js/datatables/extensions/TableTools/js/dataTables.tableTools.js"></script>
<script
	src="${pageContext.request.contextPath}/frontend/js/datatables/extensions/FixedColumns/js/dataTables.fixedColumns.js"></script>
<script
	src="${pageContext.request.contextPath}/frontend/js/datatables/extensions/ColReorder/js/dataTables.colReorder.js"></script>
<script
	src="${pageContext.request.contextPath}/frontend/js/datatables/js/dataTables.bootstrap.js"></script>

<!--[if lt IE 9]>
	    <script src="frontend/js/ie8-responsive-file-warning.js"></script><![endif]-->
<!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!--[if lt IE 9]>
	    <script src="frontend/js/html5shiv.js"></script>
	    <script src="frontend/js/respond.min.js"></script>
	    <![endif]-->

<style>
.label {
	display: inline;
	padding: 5px 10px;
	font-size: 75%;
	font-weight: 400;
	line-height: 1;
	background-color: #ebebeb;
	color: #ffffff;
	text-align: center;
	white-space: nowrap;
	vertical-align: baseline;
	border-radius: 3px;
}

.label.medium {
	font-size: 12px;
}

.label.large {
	font-size: 15px;
}

.label[href]:hover, .label[href]:focus {
	color: #6e7b93;
	text-decoration: none;
	cursor: pointer;
}

.label:empty {
	display: none;
}

div.label {
	padding-left: 20px;
	padding-right: 20px;
}

.label-default {
	background-color: #ebebeb;
	color: #303641;
}

.label-default[href]:hover, .label-default[href]:focus {
	background-color: #d2d2d2;
}

.label-primary {
	background-color: #303641;
	color: #ffffff;
}

.label-primary[href]:hover, .label-primary[href]:focus {
	background-color: #1a1e24;
}

.label-secondary {
	background-color: #ec5956;
}

.label-secondary[href]:hover, .label-secondary[href]:focus {
	background-color: #e72c28;
}

.label-success {
	background-color: #00a651;
}

.label-success[href]:hover, .label-success[href]:focus {
	background-color: #007338;
}

.label-info {
	background-color: #21a9e1;
}

.label-info[href]:hover, .label-info[href]:focus {
	background-color: #1988b6;
}

.label-warning {
	background-color: #fad839;
}

.label-warning[href]:hover, .label-warning[href]:focus {
	background-color: #f9ce07;
}

.label-danger {
	background-color: #cc2424;
}

.label-danger[href]:hover, .label-danger[href]:focus {
	background-color: #a11c1c;
}
</style>
</head>
<body class="page-body" style="background-color: #ccc;">
		<div id="page-container">
		<!-- Logo and Navigation -->
		<div class="site-header-container container">
			<div class="row"
				style="background-color: #369; padding: 5px 0; color: #fff;">
				<div class="col-md-12">
					<a href="${pageContext.request.contextPath}" style="margin: 0 7px; color: #fff;"> <span>
							<i class="fa fa-fw fa-home"></i> Home
					</span>
					</a> | <a href="#" style="margin: 0 7px; color: #fff;"> <span>
							<i class="fa fa-fw fa-question-circle"></i> Help
					</span>
					</a>
				     <div style="float: right">
						<shiro:guest>
							<a href="${pageContext.request.contextPath}/login" style="margin: 0 7px; color: #fff;"> Login
							</a>
						</shiro:guest>
						<div style="float: right;">
							<shiro:user>
								<a href="#" style="margin: 0 7px; color: #fff;"> <span>
										<i class="entypo-user"></i> <span class="loggedInUserName"><shiro:principal /></span>
								</span>
								</a>
			                    <shiro:hasRole name="ROLE_ADMIN">      |
			                          <a href="#" style="margin: 0 7px; color: #fff;"> <i class="fa fa-fw fa-wrench"></i> Management </a>
								</shiro:hasRole> 
			                          |
			                          <a href="${pageContext.request.contextPath}/logout"
									style="margin: 0 7px; color: #fff;"> <i
									class="fa fa-fw fa-sign-out"></i> <span>LoginOut</span>
								</a>
							</shiro:user>
						</div>
					</div>
				</div>
			</div>
			<div class="row" style="background-color: #e5e5e5;">
				<div class="col-md-12">
					<header class="site-header"> 
						<section class="site-logo">
							<form action="${pageContext.request.contextPath}/search" method="post" controller="search">
								<table style="width: 100%;">
									<tr>
										<td style="width: 200px;" rowspan="2"><a href="${pageContext.request.contextPath}"> <img
												src="${pageContext.request.contextPath}/frontend/images/logo-header-text.png" height="30"
												data-has2x="true" />
										</a></td>
										<!--
		                                        <td style="width: 80px; padding: 0 2px;">
		                                            <select name="t">
		                                                <option value="keywords" ${params.t == 'keywords' ? 'selected' : ''}>Keywords</option>
		                                                <option value="pmids" ${params.t == 'pmids' ? 'selected' : ''}>PMIDs</option>
		                                                <option value="uniprotids" ${params.t == 'uniprotids' ? 'selected' : ''}>UniProt IDs</option>
		                                                <option value="proteinnames" ${params.t == 'proteinnames' ? 'selected' : ''}>Protein symbols</option>
		                                            </select>
		                                        </td>
		                                         -->
										<td style="text-align: center; padding: 0 2px;">
											<input type="hidden" name="t" value="${params.t}" /> 
											<input name="q"	style="border: 1px solid #aaaaaa; width: 100%; margin-right: 3px;" placeholder="Enter keywords to search" />
											<input type="hidden" name="taxonomy" value="*" />
											<input type="hidden" name="start" value="*" /> 
											<input type="hidden" name="end" value="*" /> 
											<input type="hidden" name="offset" value="0" /> 
											<input type="hidden" name="max" value="10" />
											<input type="hidden" name="ab" value="true" />  
											<input type="hidden" name="hl" value="true" />  
										</td>
										<td style="width: 80px; padding: 0 2px;">
											<button type="submit" class="btn btn-xs btn-primary" onclick="initSearch(); return true;">Search</button>
										</td>
									</tr>
									<tr>
										<td colspan="2"
											style="text-align: left; padding: 3px 2px 2px 2px;"><a
											href="#"> Batch search </a> | <a href="#"> Help </a></td>
									</tr>
								</table>
							</form>
						</section> 
					</header>
				</div>
			</div>
		</div>
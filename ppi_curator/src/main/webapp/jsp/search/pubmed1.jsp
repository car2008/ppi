<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="../public.jsp"%>
<!-- Main Container -->
<main id="main-container">
	<div class="wrap">
		<div class="container" style="background-color: #efefef; padding: 25px 15px; border-bottom: 1px solid #ccc; font-size: 25px;">
			<i class="fa fa-fw fa-search"></i>
			<c:choose>
			<c:when test="${batch=='true'}">
				<%-- Batch search: <em>${params.qtop} ...</em>
				<g:link controller="search" action="download" params="${[uuid: uuid]}">
					Download whole query list file
				</g:link> --%>
				<a href="search/download/${uuid}">Download whole query list file</a>
			</c:when>
			<c:otherwise>
				Keywords search: <em>${q}</em>
			</c:otherwise>
			</c:choose>
		</div>
		<div class="container" style="background-color: #fff; padding: 25px 15px;">
		<c:choose>
			<c:when test="${success}">
				<div class="row">
					<div class="col-sm-2">
						<form method="get">
							<input type="hidden" name="offset" value="0" />
							
							<div class="sidebar">
								<h4>
									Popular species
								</h4>
								<c:choose>
								<c:when test="${taxonomy == '*'}">
									<i class="fa fa-fw fa-check"></i>
									All (${numFound})
								</c:when>
								<c:otherwise>
									<%-- <a href="${createLink(action: 'pubmed', params: params + ['taxonomy': '*', 'offset': 0])}">
										<i class="fa fa-fw"></i>
										All (${numFound})
									</a> --%>
									<a href="pubmed/${params}/*/0">
										<i class="fa fa-fw"></i>
										All (${numFound})
									</a>
								</c:otherwise>
								</c:choose>
								<br />
								<c:forEach items="${popularTaxonomies}" var="popularTaxonomy">
									<c:choose>
										<c:when test="${taxonomy == popularTaxonomy.id}">
											<i class="fa fa-fw fa-check"></i>
											${popularTaxonomy.scientificName}
										</c:when>
										<c:otherwise>
											<%-- <a href="${createLink(action: 'pubmed', params: params + ['taxonomy': popularTaxonomy.id, 'offset': 0])}">
												<i class="fa fa-fw"></i>
												${popularTaxonomy.scientificName} (${taxonomyStat[popularTaxonomy.id] ? taxonomyStat[popularTaxonomy.id]['count'] : 0})
											</a>
											<a href="pubmed/${params}/${popularTaxonomy.id }/0">
												<i class="fa fa-fw"></i>
												${popularTaxonomy.scientificName} 
											</a> --%>
										</c:otherwise>
									</c:choose>
									<br />
								</c:forEach>
								
								<div style="margin-left: 20px; margin-top: 3px;">
									<select id="taxonomy" name="taxonomy" style="width: 100%; margin-bottom: 20px;" onchange="taxonomyChange()">
										<option value="">Other species</option>
										<%-- <c:forEach items="${taxonomyStat}" var="taxonomyStatRecord">
											<option value="${taxonomyStatRecord.key}" ${params.taxonomy == taxonomyStatRecord.key ? 'selected' : ''}>${taxonomyStatRecord.value['taxonomy']?.scientificName} (${taxonomyStatRecord.value['count']})</option>
										</c:forEach> --%>
									</select>
								</div>
								
								<h4>
									Publication dates
								</h4>
								<c:choose>
								<c:when test="${start == '*' && end == '*'}">
									<i class="fa fa-fw fa-check"></i>
									All (${numFound})
								</c:when>
								<c:otherwise>
									<%-- <a href="${createLink(action: 'pubmed', params: params + ['start': '*', 'end': '*', 'offset': 0])}">
										<i class="fa fa-fw"></i>
										All (${numFound})
									</a> --%>
									<a href="pubmed/${params}/*/*/0">
										<i class="fa fa-fw"></i>
										All (${numFound})
									</a>
								</c:otherwise>
								</c:choose>
								<br />
								<%-- <c:forEach items="${(thisYear .. thisYear - 4)}" var="year">
									<c:when test="${params.start == '${year}-01-01' && params.end == '${year}-12-31'}">
										<i class="fa fa-fw fa-check"></i>
										${year} (${yearStat["${year}"] ? yearStat["${year}"]['count'] : 0})
									</c:when>
									<c:otherwise>
										<a href="${createLink(action: 'pubmed', params: params + ['start': "${year}-01-01", 'end': "${year}-12-31", 'offset': 0])}">
											<i class="fa fa-fw"></i>
											${year} (${yearStat["${year}"] ? yearStat["${year}"]['count'] : 0})
										</a>
									</c:otherwise>
									<br />
								</c:forEach> --%>
								
								<div style="margin-left: 20px; margin-top: 3px;">
									<h5>
										Custom date range
									</h5>
									<div style="margin-bottom: 10px;">
										<div class="input-group" style="margin-bottom: 3px;">
											<input id="start" name="start" type="text" class="form-control datepicker" data-start-view="2" autocomplete="off" value="${params.start == '*' ? '' : params.start }" placeholder="From" >
											<div class="input-group-addon">
												<a href="javascript:;" style="color: #bbb;" onclick="javascript:$('#start').val('')"><i class="fa fa-fw fa-times"></i></a>
											</div>
										</div>
										<div class="input-group">
											<input id="end" name="end" type="text" class="form-control datepicker" data-start-view="2" autocomplete="off" value="${params.end == '*' ? '' : params.end}" placeholder="To">
											<div class="input-group-addon">
												<a href="javascript:;" style="color: #bbb;" onclick="javascript:$('#end').val('')"><i class="fa fa-fw fa-times"></i></a>
											</div>
										</div>
									</div>
								
									<button type="submit" class="btn btn-primary btn-block" onclick="clearAllSelection(); return true;">Apply filter</button>
								</div>
							</div>
						</form>
					</div>
					<div class="col-sm-8">
						<c:if test="${success}">
							<div style="margin-bottom: 15px;">
								<div class="btn-group">
									<a href="javascript:;"  data-toggle="dropdown">
									<c:choose>
										<c:when test="${ab}">
											Abstract
										</c:when>
										<c:otherwise>
											Summary
										</c:otherwise>
									</c:choose>
										<span class="caret"></span>
									</a>
									<ul class="dropdown-menu dropdown-default" role="menu">
									<c:choose>
										<c:when test="${ab}">
											<li>
												<%-- <a href="${createLink(action: 'pubmed', params: params + ['ab': false])}">
													<i class="fa fa-fw"></i>
													Summary
												</a> --%>
												<a href="pubmed/${params}/false">
													<i class="fa fa-fw"></i>
													Summary
												</a>
											</li>
											<li>
												<a href="javascript:;">
													<i class="fa fa-fw fa-check"></i>
													Abstract
												</a>
											</li>
										</c:when>
										<c:otherwise>
											<li>
												<a href="javascript:;">
													<i class="fa fa-fw fa-check"></i>
													Summary
												</a>
											</li>
											<li>
												<%-- <a href="${createLink(action: 'pubmed', params: params + ['ab': true])}">
													<i class="fa fa-fw"></i>
													Abstract
												</a> --%>
												<a href="pubmed/${params}/true">
													<i class="fa fa-fw"></i>
													Summary
												</a>
											</li>
										</c:otherwise>
									</c:choose>
									</ul>
								</div>
								&nbsp;&nbsp;&nbsp;
								<div class="btn-group">
									<a href="javascript:;"  data-toggle="dropdown">
									<c:choose>
										<c:when test="${hl}">
											Highlight keyword
										</c:when>
										<c:otherwise>
											No keyword highlight
										</c:otherwise>
									</c:choose>
										<span class="caret"></span>
									</a>
									<ul class="dropdown-menu dropdown-default" role="menu">
									<c:choose>
										<c:when test="${hl}">
											<li>
												<a href="javascript:;">
													<i class="fa fa-fw fa-check"></i>
													Highlight keyword
												</a>
											</li>
											<li>
												<%-- <a href="${createLink(action: 'pubmed', params: params + ['hl': false])}">
													<i class="fa fa-fw"></i>
													No keyword highlight
												</a> --%>
												<a href="pubmed/${params}/false">
													<i class="fa fa-fw"></i>
													No keyword highlight
												</a>
											</li>
										</c:when>
										<c:otherwise>
											<li>
												<%-- <a href="${createLink(action: 'pubmed', params: params + ['hl': true])}">
													<i class="fa fa-fw"></i>
													Highlight keyword
												</a> --%>
												<a href="pubmed/${q}/true">
													<i class="fa fa-fw"></i>
													Highlight keyword
												</a>
											</li>
											<li>
												<a href="javascript:;">
													<i class="fa fa-fw fa-check"></i>
													No keyword highlight
												</a>
											</li>
										</c:otherwise>
									</c:choose>
									</ul>
								</div>
								&nbsp;&nbsp;&nbsp;
								<div class="btn-group">
									<a href="javascript:;"  data-toggle="dropdown">
										${max} per page <span class="caret"></span>
									</a>
									<ul class="dropdown-menu dropdown-default" role="menu">
										<c:forEach items="${array}" var="pageSize">
											<li>
												<a href="#">
													<c:choose>
														<c:when test="${max == pageSize}">
															<i class="fa fa-fw fa-check"></i>
														</c:when>
														<c:otherwise>
															<i class="fa fa-fw"></i>
														</c:otherwise>
													</c:choose>
													${pageSize} per page
												</a>
												<a href="javascript:;">
													<i class="fa fa-fw fa-check"></i>
													No keyword highlight
												</a>
											</li>
										</c:forEach>
									</ul>
								</div>
								&nbsp;&nbsp;&nbsp;
								<div class="btn-group">
									<a href="javascript:;" data-toggle="dropdown">
										<c:if test="${sort == 'score'}">
											Sort by relevance
										</c:if>
										<c:if test="${sort == 'date'}">
											Sort by publication date
										</c:if>
										<c:if test="${order == 'desc'}">
											(desc)
										</c:if>
										<c:if test="${order == 'asc'}">
											(asc)
										</c:if>
										<span class="caret"></span>
									</a>
									<ul class="dropdown-menu dropdown-default" role="menu">
										<li>
										<c:choose>
											<c:when test="${sort == 'score'}">
												<%-- <a href="${createLink(action: 'pubmed', params: params + ['sort': 'score', 'order': params.order == 'asc' ? 'desc' : 'asc'])}">
													<i class="fa fa-fw fa-check"></i>
													Sort by relevance
												</a> --%>
												<a href="javascript:;">
													<i class="fa fa-fw fa-check"></i>
													No keyword highlight
												</a>
											</c:when>
											<c:otherwise>
												<%-- <a href="${createLink(action: 'pubmed', params: params + ['sort': 'score', 'order': 'asc'])}">
													<i class="fa fa-fw"></i>
													Sort by relevance
												</a> --%>
												<a href="javascript:;">
													<i class="fa fa-fw fa-check"></i>
													No keyword highlight
												</a>
											</c:otherwise>
										</c:choose>
										</li>
										<li>
										<c:choose>
											<c:when test="${sort == 'date'}">
												<%-- <a href="${createLink(action: 'pubmed', params: params + ['sort': 'date', 'order': params.order == 'asc' ? 'desc' : 'asc'])}">
													<i class="fa fa-fw fa-check"></i>
													Sort by publication date
												</a> --%>
												<a href="javascript:;">
													<i class="fa fa-fw fa-check"></i>
													No keyword highlight
												</a>
											</c:when>
											<c:otherwise>
												<%-- <a href="${createLink(action: 'pubmed', params: params + ['sort': 'date', 'order': 'asc'])}">
													<i class="fa fa-fw"></i>
													Sort by publication date
												</a> --%>
												<a href="javascript:;">
													<i class="fa fa-fw fa-check"></i>
													No keyword highlight
												</a>
											</c:otherwise>
										</c:choose>
										</li>
									</ul>
								</div>
							</div>
							<c:forEach items="${records}" var="record" varStatus="i">
									<%-- <c:if test="${i > 0}">
										<br />
									</c:if> --%>
									<div class="pull-left">
										<input type="checkbox" class="pmid-checkbox" name="pmid" id="pmid-${record.value['pmid']}" value="${record.value['pmid']}" />
										<br/>
										<%-- ${i + 1 + offset}. --%>
									</div>
									<div style="margin-left: 30px;">
										<div style="text-align: justify;">
											<a href="http://www.ncbi.nlm.nih.gov/pubmed/${record.value['pmid']}" target="_blank">
												${record.value['title']}
											</a>
										</div>
										<%-- <div>
											<strong>${record.value['journal']}</strong>
											|
											${record.value['date'] ? formatDate(date: record.value['date'], format: 'yyyy-MM-dd') : 'N/A'}
											|
											${record.value['taxonomy'] ? record.value['taxonomy'].scientificName : 'N/A'}
										</div> --%>
										<div>
											PMID: ${record.value['pmid']}
										</div>
										<div class="article-abstract ${ab ? '' : 'hidden'}" style="text-align: justify;">
											${record.value['abstract']}
										</div>
									</div>
							</c:forEach>
							<%-- <div class="text-center">
								<ppi_curator:paginate maxsteps="5" params="${['taxonomy': params.taxonomy, 'hl': params.hl, 'ab': params.ab, 'start': params.start, 'end': params.end]}" total="${recordsTotal}" />
							</div> --%>
						</c:if>
					</div>
					<div class="col-sm-2">
						<div class="sidebar">
							<h4>
								Operations
							</h4>
							<div class="btn-group" style="width: 100%; margin-bottom: 10px;">
								<button type="button" class="btn btn-primary btn-block dropdown-toggle" data-toggle="dropdown">
									<%-- <span id="selection-count">${pubmedSelection?.size()}</span> Selected <span class="caret"></span> --%>
								</button>
								<ul class="dropdown-menu" role="menu" style="width: 100%;">
									<li>
										<a href="javascript:;" onclick="selectPage();">Select Page</a>
									</li>
									<li>
										<a href="javascript:;" onclick="clearPage();">Clear Page</a>
									</li>
									<li>
										<a href="javascript:;" onclick="clearSelection();">Clear Selection</a>
									</li>
								</ul>
							</div>
							
							<%-- <a id="btn-curate" class="btn btn-primary btn-block" style="margin-bottom: 10px;" href="${createLink(action: 'curate', params: params + ['ps': 'selected', 'offset': 0])}">
								Curate Selected
							</a>
							
							<a id="btn-export" class="btn btn-primary btn-block" style="margin-bottom: 10px;" href="${createLink(action: 'curate', params: params + ['export': true, 'ps': 'selected', 'offset': 0])}">
								Export Selected
							</a> --%>
							
							<div class="btn-group hidden" style="width: 100%; margin-bottom: 10px;">
								<button type="button" class="btn btn-primary btn-block dropdown-toggle" data-toggle="dropdown">
									Curate <span class="caret"></span>
								</button>
								<ul class="dropdown-menu" role="menu" style="width: 100%;">
									<li>
										<%-- <g:link action="curate" params="${params + ['ps': 'selected', 'offset': 0]}">
											Curate Selected
										</g:link> --%>
										<a href="javascript:;">
											<i class="fa fa-fw fa-check"></i>
											No keyword highlight
										</a>
									</li>
									<li>
										<%-- <g:link action="curate" params="${params + ['ps': 'top', 'offset': 0]}">
											Curate Top ${queryTop}
										</g:link> --%>
										<a href="javascript:;">
											<i class="fa fa-fw fa-check"></i>
											No keyword highlight
										</a>
									</li>
									<li>
										<%-- <g:link action="curate" params="${params + ['ps': 'all', 'offset': 0]}">
											Curate All
										</g:link> --%>
										<a href="javascript:;">
											<i class="fa fa-fw fa-check"></i>
											No keyword highlight
										</a>
									</li>
								</ul>
							</div>
							<div class="btn-group hidden" style="width: 100%; margin-bottom: 10px;">
								<button type="button" class="btn btn-primary btn-block dropdown-toggle" data-toggle="dropdown">
									Export <span class="caret"></span>
								</button>
								<ul class="dropdown-menu" role="menu" style="width: 100%;">
									<li>
										<%-- <g:link action="curate" params="${params + ['export': true, 'ps': 'selected', 'offset': 0]}">
											Export Selected
										</g:link> --%>
										<a href="javascript:;">
											<i class="fa fa-fw fa-check"></i>
											No keyword highlight
										</a>
									</li>
									<li>
										<%-- <g:link action="curate" params="${params + ['export': true, 'ps': 'top', 'offset': 0]}">
											Export Top ${queryTop}
										</g:link> --%>
										<a href="javascript:;">
											<i class="fa fa-fw fa-check"></i>
											No keyword highlight
										</a>
									</li>
									<li>
										<%-- <g:link action="curate" params="${params + ['export': true, 'ps': 'all', 'offset': 0]}">
											Export All
										</g:link> --%>
										<a href="javascript:;">
											<i class="fa fa-fw fa-check"></i>
											No keyword highlight
										</a>
									</li>
								</ul>
							</div>
						</div>
					</div>
				</div>
			</c:when>
			<c:otherwise>
				<p style="text-align: center; margin-top: 100px; margin-bottom: 100px;">
					<i class="fa fa-fw fa-warning"></i>
					Error occured, resubmit the query please.
				</p>
			</c:otherwise>
		</c:choose>
		</div>
		
		<script type="text/javascript">
			var path = "<a href='#'></a>";
			
			function taxonomyChange() {
				var taxonomyId = $('#taxonomy').val();
				if (taxonomyId !== '') {
					var taxonomyChangeUrl = "<a href='#'></a>";
					taxonomyChangeUrl = taxonomyChangeUrl.replace(/taxonomy=/, "taxonomy=" + taxonomyId)
					window.location = taxonomyChangeUrl;
				}
			}
			
			function setSelectionCookie() {
				var cookie = Object.keys(selection).join(';');
				Cookies.set('pubmed-selection', cookie, {path: path});
				console.log(cookie);
			}
			
			function updateSelectionCount() {
				var selectionCount = Object.keys(selection).length;
				$('#selection-count').text(selectionCount);
				
				if (selectionCount > 0) {
					$("#btn-curate").removeClass("disabled");
					$("#btn-export").removeClass("disabled");
				}
				else {
					$("#btn-curate").addClass("disabled");
					$("#btn-export").addClass("disabled");
				}
			}
			
			function printSelection() {
				for (var pmid in selection) {
				    if (selection.hasOwnProperty(pmid)) {
				        console.log(pmid + ": " + selection[pmid]);
				    }
				}
			}
			
			function checkSelection() {
				$('.pmid-checkbox').each(function() {
					$(this).prop('disabled', false);
					var pmid = $(this).val();
					if (selection.hasOwnProperty(pmid)) {
						$(this).prop('checked', true);
					}
				});
			}
			
			function clearSelection() {
				selection = {}
				$('.pmid-checkbox').each(function() {
					this.checked = false;
				});
				setSelectionCookie();
				updateSelectionCount();
			}
			
			function selectPage() {
				$('.pmid-checkbox').each(function() {
					var pmid = $(this).val();
					selection[pmid] = 1;
					this.checked = true;
				});
				setSelectionCookie();
				updateSelectionCount();
			}
			
			function clearPage() {
				$('.pmid-checkbox').each(function() {
					var pmid = $(this).val();
					delete selection[pmid];
					this.checked = false;
				});
				setSelectionCookie();
				updateSelectionCount();
			}
			
			//initialization
			var selection = {};
			
			jQuery(document).ready(function($){
				$("#ab, #hl, #sort, #order").select2({minimumResultsForSearch: -1});
				$("#taxonomy").select2();
				
				var cookie = Cookies.get('pubmed-selection');
				if (cookie != undefined && cookie != '') {
					jQuery.each(cookie.split(';'), function() {
						selection[this] = 1;
					});
				}
				updateSelectionCount();
				
				$('.pmid-checkbox').each(function() {
					var pmid = $(this).val();
					$(this).click(function() {
						if ($(this).prop('checked')) {
							selection[pmid] = 1;
						}
						else {
							delete selection[pmid];
						}
						setSelectionCookie();
						updateSelectionCount();
					});
				});
	
				// Datepicker
				if($.isFunction($.fn.datepicker))
				{
					$(".datepicker").each(function(i, el) {
						$(el).datepicker({
							format: 'yyyy-mm-dd',
							startDate: '',
							endDate: '',
							startView: 2,
						});
					});
				}
			});
		</script>
	</div>
</main>
<%@ include file="../foot.jsp"%>
</div>
</body>
</html>
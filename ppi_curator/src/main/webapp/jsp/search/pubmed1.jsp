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
						<form action="${pageContext.request.contextPath}/search" method="post" controller="search">
							<input type="hidden" name="offset" value="0" />
							<input type="hidden" name="q" value="${q }" />
							<input type="hidden" name="max" value="${max }" />
							<input type="hidden" name="ab" value="${ab }" />  
							<input type="hidden" name="hl" value="${hl }" /> 
							<input type="hidden" name="sort" value="${sort }" />  
							<input type="hidden" name="order" value="${order }" />
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
									<a href="${pageContext.request.contextPath}/pubmed/${q}/*/*/*/0/${max}/${ab}/${hl}/${sort}/${order}">
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
											${popularTaxonomy.scientificName}(${taxonomyStat[popularTaxonomy.id]})
										</c:when>
										<c:otherwise>
											<a href="${pageContext.request.contextPath}/pubmed/${q}/${popularTaxonomy.id}/*/*/0/${max}/${ab}/${hl}/${sort}/${order}">
												<i class="fa fa-fw"></i>
												<c:if test="${taxonomyStat[popularTaxonomy.id]>0}">
													${popularTaxonomy.scientificName} (${taxonomyStat[popularTaxonomy.id]})
												</c:if>
												<c:if test="${taxonomyStat[popularTaxonomy.id]==null}">
													${popularTaxonomy.scientificName} (0)
												</c:if>
											</a>
										</c:otherwise>
									</c:choose>
									<br />
								</c:forEach>
								
								<div style="margin-left: 20px; margin-top: 3px;">
									<select id="taxonomy" name="taxonomy" style="width: 100%; margin-bottom: 20px;" onchange="taxonomyChange()">
										<option value="">Other species</option>
										<c:forEach items="${otherTaxonomies}" var="taxonomyStatRecord">
											<option value="${taxonomyStatRecord.key}" ${taxonomy == taxonomyStatRecord.key ? 'selected' : ''}> ${taxonomyStatRecord.value['taxonomy']}(${taxonomyStatRecord.value['count']})</option>
										</c:forEach>
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
									<a href="${pageContext.request.contextPath}/pubmed/${q}/*/*/*/0/${max}/${ab}/${hl}/${sort}/${order}">
										<i class="fa fa-fw"></i>
										All (${numFound})
									</a>
								</c:otherwise>
								</c:choose>
								<br />
							    <c:forEach items="${yearArray}" var="year">
									<c:choose>
										<c:when test="${start == '${year}-01-01' && end == '${year}-12-31'}">
											<i class="fa fa-fw fa-check"></i>
											${year} (${yearStat["${year}"]})
										</c:when>
										<c:otherwise>
											<a href="${pageContext.request.contextPath}/pubmed/${q}/*/${year}-01-01/${year}-12-31/0/${max}/${ab}/${hl}/${sort}/${order}">
												<i class="fa fa-fw"></i>
												<c:if test="${yearStat[year]>0}">
													${year} (${yearStat[year]})
												</c:if>
												<c:if test="${yearStat[year]==null}">
													${year} (0)
												</c:if>
											</a>
										</c:otherwise>
									</c:choose>
									<br />
								</c:forEach>
								
								<div style="margin-left: 20px; margin-top: 3px;">
									<h5>
										Custom date range
									</h5>
									<div style="margin-bottom: 10px;">
										<div class="input-group" style="margin-bottom: 3px;">
											<input id="start" name="start" type="text" class="form-control datepicker" data-start-view="2" autocomplete="off" value="${start == '*' ? '' : start }" placeholder="From" >
											<div class="input-group-addon">
												<a href="javascript:;" style="color: #bbb;" onclick="javascript:$('#start').val('')"><i class="fa fa-fw fa-times"></i></a>
											</div>
										</div>
										<div class="input-group">
											<input id="end" name="end" type="text" class="form-control datepicker" data-start-view="2" autocomplete="off" value="${end == '*' ? '' : end}" placeholder="To">
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
												<a href="${pageContext.request.contextPath}/pubmed/${q}/${taxonomy}/${start}/${end}/${offset}/${max}/false/${hl}/${sort}/${order}">
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
												<a href="${pageContext.request.contextPath}/pubmed/${q}/${taxonomy}/${start}/${end}/${offset}/${max}/true/${hl}/${sort}/${order}">
													<i class="fa fa-fw"></i>
													Abstract
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
												<a href="${pageContext.request.contextPath}/pubmed/${q}/${taxonomy}/${start}/${end}/${offset}/${max}/${ab}/false/${sort}/${order}">
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
												<a href="${pageContext.request.contextPath}/pubmed/${q}/${taxonomy}/${start}/${end}/${offset}/${max}/${ab}/true/${sort}/${order}">
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
												<a href="${pageContext.request.contextPath}/pubmed/${q}/${taxonomy}/${start}/${end}/${offset}/${pageSize}/${ab}/${hl}/${sort}/${order}">
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
											<c:when test="${sort == 'score'&& order == 'asc'}">
												<a href="${pageContext.request.contextPath}/pubmed/${q}/${taxonomy}/${start}/${end}/${offset}/${max}/${ab}/${hl}/score/desc">
													<i class="fa fa-fw fa-check"></i>
													Sort by relevance
												</a>
											</c:when>
											<c:otherwise>
												<a href="${pageContext.request.contextPath}/pubmed/${q}/${taxonomy}/${start}/${end}/${offset}/${max}/${ab}/${hl}/score/asc">
													<i class="fa fa-fw"></i>
													Sort by relevance
												</a>
											</c:otherwise>
										</c:choose>
										</li>
										<li>
										<c:choose>
											<c:when test="${sort == 'date'&& order == 'asc'}">
												<a href="${pageContext.request.contextPath}/pubmed/${q}/${taxonomy}/${start}/${end}/${offset}/${max}/${ab}/${hl}/date/desc">
													<i class="fa fa-fw fa-check"></i>
													Sort by publication date
												</a>
											</c:when>
											<c:otherwise>
												<a href="${pageContext.request.contextPath}/pubmed/${q}/${taxonomy}/${start}/${end}/${offset}/${max}/${ab}/${hl}/date/asc">
													<i class="fa fa-fw"></i>
													Sort by publication date
												</a>
											</c:otherwise>
										</c:choose>
										</li>
									</ul>
								</div>
							</div>
							<c:forEach items="${records}" var="record" varStatus="i">
									<c:if test="${i.index > 0}">
										<br />
									</c:if>
									<div class="pull-left">
										<input type="checkbox" class="pmid-checkbox" name="pmid" id="pmid-${record.value['pmid']}" value="${record.value['pmid']}" />
										<br/>
										${i.index + 1 + offset}.
									</div>
									<div style="margin-left: 30px;">
										<div style="text-align: justify;">
											<a href="http://www.ncbi.nlm.nih.gov/pubmed/${record.value['pmid']}" target="_blank">
												${record.value['title']}
											</a>
										</div>
										<div>
											<strong>${record.value['journal']}</strong>  <b>|</b>
											${record.value['date']==null?'N/A':''} <fmt:formatDate value="${record.value['date']}" type="date" dateStyle="default"/>  <b>|</b>
											${record.value['taxonomy']==null?'N/A':record.value['taxonomyName']}  <b>|</b>
										</div> 
										<div>
											PMID: ${record.value['pmid']}
										</div>
										<div class="article-abstract ${ab==true ? '' : 'hidden'}" style="text-align: justify;">
											${record.value['abstract']}
										</div>
									</div>
							</c:forEach>
							<%-- <div class="text-center">
								<ppi_curator:paginate maxsteps="5" params="${['taxonomy': params.taxonomy, 'hl': params.hl, 'ab': params.ab, 'start': params.start, 'end': params.end]}" total="${recordsTotal}" />
							</div> --%>
							<c:if test="${totalNum>max }">
								<div class="text-center">
							        <nav>
							            <ul class="pagination">
							                <li><a href="${pageContext.request.contextPath}/getpage/${q}/${taxonomy}/${start}/${end}/${offset}/${max}/${ab}/${hl}/${sort}/${order}/1/${totalNum}">首页</a></li>
							                <li><a href="${pageContext.request.contextPath}/getpage/${q}/${taxonomy}/${start}/${end}/${offset}/${max}/${ab}/${hl}/${sort}/${order}/${page-1>1?page-1:1}/${totalNum}">&laquo;</a></li>
							
							                <c:choose>
												<c:when test="${totalPages<10}">
													<c:forEach begin="1" end="${totalPages}" varStatus="loop">
											            <c:set var="active" value="${loop.index==page?'active':''}"/>
											            <li class="${active}"><a
											                    href="${pageContext.request.contextPath}/getpage/${q}/${taxonomy}/${start}/${end}/${offset}/${max}/${ab}/${hl}/${sort}/${order}/${loop.index}/${totalNum}">${loop.index}</a>
											            </li>
											        </c:forEach>
											    </c:when>
											    <c:otherwise>
											    	<c:if test="${page<5 }">
											    		<c:forEach begin="1" end="5" varStatus="loop">
												            <c:set var="active" value="${loop.index==page?'active':''}"/>
												            <li class="${active}"><a
												                    href="${pageContext.request.contextPath}/getpage/${q}/${taxonomy}/${start}/${end}/${offset}/${max}/${ab}/${hl}/${sort}/${order}/${loop.index}/${totalNum}">${loop.index}</a>
												            </li>
												        </c:forEach>
												        <li class=""><a>...</a></li>
											    	</c:if>
											    	<c:if test="${page>=5 && page<=totalPages-4 }">
											    		<li class=""><a>...</a></li>
											    		<li class="">
											    			<a href="${pageContext.request.contextPath}/getpage/${q}/${taxonomy}/${start}/${end}/${offset}/${max}/${ab}/${hl}/${sort}/${order}/${page-2}/${totalNum}">${page-2}</a>
											            </li>
											    		<li class="">
											    			<a href="${pageContext.request.contextPath}/getpage/${q}/${taxonomy}/${start}/${end}/${offset}/${max}/${ab}/${hl}/${sort}/${order}/${page-1}/${totalNum}">${page-1}</a>
											            </li>
											            <li class="active">
											            	<a href="${pageContext.request.contextPath}/getpage/${q}/${taxonomy}/${start}/${end}/${offset}/${max}/${ab}/${hl}/${sort}/${order}/${page}/${totalNum}">${page}</a>
											            </li>
											            <li class="">
											            	<a href="${pageContext.request.contextPath}/getpage/${q}/${taxonomy}/${start}/${end}/${offset}/${max}/${ab}/${hl}/${sort}/${order}/${page+1}/${totalNum}">${page+1}</a>
											            </li>
											            <li class="">
											    			<a href="${pageContext.request.contextPath}/getpage/${q}/${taxonomy}/${start}/${end}/${offset}/${max}/${ab}/${hl}/${sort}/${order}/${page+2}/${totalNum}">${page+2}</a>
											            </li>
											    	    <li class=""><a>...</a></li>
											    	</c:if>
											    	<c:if test="${page>totalPages-4 }">
											    		<li class=""><a>...</a></li>
											    		<c:forEach begin="${totalPages-4 }" end="${totalPages }" varStatus="loop">
												            <c:set var="active" value="${loop.index==page?'active':''}"/>
												            <li class="${active}"><a
												                    href="${pageContext.request.contextPath}/getpage/${q}/${taxonomy}/${start}/${end}/${offset}/${max}/${ab}/${hl}/${sort}/${order}/${loop.index}/${totalNum}">${loop.index}</a>
												            </li>
												        </c:forEach>
											    	</c:if>
											    </c:otherwise>
											</c:choose>
											
							                <li>
							                    <a href="${pageContext.request.contextPath}/getpage/${q}/${taxonomy}/${start}/${end}/${offset}/${max}/${ab}/${hl}/${sort}/${order}/${page+1<totalPages?page+1:totalPages}/${totalNum}">&raquo;</a>
							                </li>
							                <li><a href="${pageContext.request.contextPath}/getpage/${q}/${taxonomy}/${start}/${end}/${offset}/${max}/${ab}/${hl}/${sort}/${order}/${totalPages}/${totalNum}">尾页</a></li>
							            </ul>
							        </nav>
							    </div>
							</c:if>
						</c:if>
					</div>
					<div class="col-sm-2">
						<div class="sidebar">
							<h4>
								Operations
							</h4>
							<div class="btn-group" style="width: 100%; margin-bottom: 10px;">
								<button type="button" class="btn btn-primary btn-block dropdown-toggle" data-toggle="dropdown">
									<span id="selection-count">0</span> Selected <span class="caret"></span>
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
							
							<a id="btn-curate" class="btn btn-primary btn-block" style="margin-bottom: 10px;" href="#">
								Curate Selected
							</a>
							
							<a id="btn-export" class="btn btn-primary btn-block" style="margin-bottom: 10px;" href="#">
								Export Selected
							</a>
							
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
					var taxonomyChangeUrl = "${pageContext.request.contextPath}/pubmed/${q}/"+taxonomyId+"/*/*/0/${max}/${ab}/${hl}/${sort}/${order}";
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
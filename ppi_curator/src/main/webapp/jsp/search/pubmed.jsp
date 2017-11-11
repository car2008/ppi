<head>
<meta name='layout' content='frontend' />
<title><g:message code="default.search.label" /></title>
</head>

<body>
	<div class="container" style="background-color: #efefef; padding: 25px 15px; border-bottom: 1px solid #ccc; font-size: 25px;">
		<i class="fa fa-fw fa-search"></i>
		<g:if test="${batch}">
			Batch search: <em>${params.qtop} ...</em>
			<g:link controller="search" action="download" params="${[uuid: uuid]}">
				Download whole query list file
			</g:link>
		</g:if>
		<g:else>
			Keywords search: <em>${params.q}</em>
		</g:else>
	</div>
	<div class="container" style="background-color: #fff; padding: 25px 15px;">
		<g:if test="${success}">
			<div class="row">
				<div class="col-sm-2">
					<form method="get">
						<input type="hidden" name="offset" value="0" />
						
						<div class="sidebar">
							<h4>
								Popular species
							</h4>
							<g:if test="${params.taxonomy == '*'}">
								<i class="fa fa-fw fa-check"></i>
								All (${numFound})
							</g:if>
							<g:else>
								<a href="${createLink(action: 'pubmed', params: params + ['taxonomy': '*', 'offset': 0])}">
									<i class="fa fa-fw"></i>
									All (${numFound})
								</a>
							</g:else>
							
							<br />
							<g:each in="${popularTaxonomies}" var="popularTaxonomy">
								<g:if test="${params.taxonomy == popularTaxonomy.id}">
									<i class="fa fa-fw fa-check"></i>
									${popularTaxonomy.scientificName} (${taxonomyStat[popularTaxonomy.id] ? taxonomyStat[popularTaxonomy.id]['count'] : 0})
								</g:if>
								<g:else>
									<a href="${createLink(action: 'pubmed', params: params + ['taxonomy': popularTaxonomy.id, 'offset': 0])}">
										<i class="fa fa-fw"></i>
										${popularTaxonomy.scientificName} (${taxonomyStat[popularTaxonomy.id] ? taxonomyStat[popularTaxonomy.id]['count'] : 0})
									</a>
								</g:else>
								<br />
							</g:each>
							
							<div style="margin-left: 20px; margin-top: 3px;">
								<select id="taxonomy" name="taxonomy" style="width: 100%; margin-bottom: 20px;" onchange="taxonomyChange()">
									<option value="">Other species</option>
									<g:each in="${taxonomyStat}" var="taxonomyStatRecord">
										<option value="${taxonomyStatRecord.key}" ${params.taxonomy == taxonomyStatRecord.key ? 'selected' : ''}>${taxonomyStatRecord.value['taxonomy']?.scientificName} (${taxonomyStatRecord.value['count']})</option>
									</g:each>
								</select>
							</div>
							
							<h4>
								Publication dates
							</h4>
							<g:if test="${params.start == '*' && params.end == '*'}">
								<i class="fa fa-fw fa-check"></i>
								All (${numFound})
							</g:if>
							<g:else>
								<a href="${createLink(action: 'pubmed', params: params + ['start': '*', 'end': '*', 'offset': 0])}">
									<i class="fa fa-fw"></i>
									All (${numFound})
								</a>
							</g:else>
							
							<br />
							<g:each in="${(thisYear .. thisYear - 4)}" var="year">
								<g:if test="${params.start == "${year}-01-01" && params.end == "${year}-12-31"}">
									<i class="fa fa-fw fa-check"></i>
									${year} (${yearStat["${year}"] ? yearStat["${year}"]['count'] : 0})
								</g:if>
								<g:else>
									<a href="${createLink(action: 'pubmed', params: params + ['start': "${year}-01-01", 'end': "${year}-12-31", 'offset': 0])}">
										<i class="fa fa-fw"></i>
										${year} (${yearStat["${year}"] ? yearStat["${year}"]['count'] : 0})
									</a>
								</g:else>
								<br />
							</g:each>
							
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
					<g:if test="${records}">
						<div style="margin-bottom: 15px;">
							<div class="btn-group">
								<a href="javascript:;"  data-toggle="dropdown">
									<g:if test="${params.ab}">
										Abstract
									</g:if>
									<g:else>
										Summary
									</g:else>
									<span class="caret"></span>
								</a>
								<ul class="dropdown-menu dropdown-default" role="menu">
									<g:if test="${params.ab}">
										<li>
											<a href="${createLink(action: 'pubmed', params: params + ['ab': false])}">
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
									</g:if>
									<g:else>
										<li>
											<a href="javascript:;">
												<i class="fa fa-fw fa-check"></i>
												Summary
											</a>
										</li>
										<li>
											<a href="${createLink(action: 'pubmed', params: params + ['ab': true])}">
												<i class="fa fa-fw"></i>
												Abstract
											</a>
										</li>
									</g:else>
								</ul>
							</div>
							&nbsp;&nbsp;&nbsp;
							<div class="btn-group">
								<a href="javascript:;"  data-toggle="dropdown">
									<g:if test="${params.hl}">
										Highlight keyword
									</g:if>
									<g:else>
										No keyword highlight
									</g:else>
									<span class="caret"></span>
								</a>
								<ul class="dropdown-menu dropdown-default" role="menu">
									<g:if test="${params.hl}">
										<li>
											<a href="javascript:;">
												<i class="fa fa-fw fa-check"></i>
												Highlight keyword
											</a>
										</li>
										<li>
											<a href="${createLink(action: 'pubmed', params: params + ['hl': false])}">
												<i class="fa fa-fw"></i>
												No keyword highlight
											</a>
										</li>
									</g:if>
									<g:else>
										<li>
											<a href="${createLink(action: 'pubmed', params: params + ['hl': true])}">
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
									</g:else>
								</ul>
							</div>
							&nbsp;&nbsp;&nbsp;
							<div class="btn-group">
								<a href="javascript:;"  data-toggle="dropdown">
									${params.max} per page <span class="caret"></span>
								</a>
								<ul class="dropdown-menu dropdown-default" role="menu">
									<g:each in="${[10, 20, 50, 100]}" var="pageSize">
										<li>
											<a href="${createLink(action: 'pubmed', params: params + ['offset': 0, 'max': pageSize])}">
												<g:if test="${params.max == pageSize}">
													<i class="fa fa-fw fa-check"></i>
												</g:if>
												<g:else>
													<i class="fa fa-fw"></i>
												</g:else>
												${pageSize} per page
											</a>
										</li>
									</g:each>
								</ul>
							</div>
							&nbsp;&nbsp;&nbsp;
							<div class="btn-group">
								<a href="javascript:;" data-toggle="dropdown">
									<g:if test="${params.sort == 'score'}">
										Sort by relevance
									</g:if>
									<g:if test="${params.sort == 'date'}">
										Sort by publication date
									</g:if>
									<g:if test="${params.order == 'desc'}">
										(desc)
									</g:if>
									<g:if test="${params.order == 'asc'}">
										(asc)
									</g:if>
									<span class="caret"></span>
								</a>
								<ul class="dropdown-menu dropdown-default" role="menu">
									<li>
										<g:if test="${params.sort == 'score'}">
											<a href="${createLink(action: 'pubmed', params: params + ['sort': 'score', 'order': params.order == 'asc' ? 'desc' : 'asc'])}">
												<i class="fa fa-fw fa-check"></i>
												Sort by relevance
											</a>
										</g:if>
										<g:else>
											<a href="${createLink(action: 'pubmed', params: params + ['sort': 'score', 'order': 'asc'])}">
												<i class="fa fa-fw"></i>
												Sort by relevance
											</a>
										</g:else>
									</li>
									<li>
										<g:if test="${params.sort == 'date'}">
											<a href="${createLink(action: 'pubmed', params: params + ['sort': 'date', 'order': params.order == 'asc' ? 'desc' : 'asc'])}">
												<i class="fa fa-fw fa-check"></i>
												Sort by publication date
											</a>
										</g:if>
										<g:else>
											<a href="${createLink(action: 'pubmed', params: params + ['sort': 'date', 'order': 'asc'])}">
												<i class="fa fa-fw"></i>
												Sort by publication date
											</a>
										</g:else>
									</li>
								</ul>
							</div>
						</div>
						<g:each in="${records}" var="record" status="i">
							<g:if test="${i > 0}">
								<br />
							</g:if>
							<div class="pull-left">
								<input type="checkbox" class="pmid-checkbox" name="pmid" id="pmid-${record.value['pmid']}" value="${record.value['pmid']}" ${pubmedSelection?.contains(record.value['pmid']) ? 'checked' : ''} />
								<br/>
								${i + 1 + params.int('offset')}.
							</div>
							<div style="margin-left: 30px;">
								<div style="text-align: justify;">
									<a href="http://www.ncbi.nlm.nih.gov/pubmed/${record.value['pmid']}" target="_blank">
										${record.value['title']}
									</a>
								</div>
								<div>
									<strong>${record.value['journal']}</strong>
									|
									${record.value['date'] ? formatDate(date: record.value['date'], format: 'yyyy-MM-dd') : 'N/A'}
									|
									${record.value['taxonomy'] ? record.value['taxonomy'].scientificName : 'N/A'}
								</div>
								<div>
									PMID: ${record.value['pmid']}
								</div>
								<div class="article-abstract ${params.ab ? '' : 'hidden'}" style="text-align: justify;">
									${record.value['abstract']}
								</div>
							</div>
						</g:each>
						<div class="text-center">
							<ppi_curator:paginate maxsteps="5" params="${['taxonomy': params.taxonomy, 'hl': params.hl, 'ab': params.ab, 'start': params.start, 'end': params.end]}" total="${recordsTotal}" />
						</div>
					</g:if>
				</div>
				<div class="col-sm-2">
					<div class="sidebar">
						<h4>
							Operations
						</h4>
						<div class="btn-group" style="width: 100%; margin-bottom: 10px;">
							<button type="button" class="btn btn-primary btn-block dropdown-toggle" data-toggle="dropdown">
								<span id="selection-count">${pubmedSelection?.size()}</span> Selected <span class="caret"></span>
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
						
						<a id="btn-curate" class="btn btn-primary btn-block" style="margin-bottom: 10px;" href="${createLink(action: 'curate', params: params + ['ps': 'selected', 'offset': 0])}">
							Curate Selected
						</a>
						
						<a id="btn-export" class="btn btn-primary btn-block" style="margin-bottom: 10px;" href="${createLink(action: 'curate', params: params + ['export': true, 'ps': 'selected', 'offset': 0])}">
							Export Selected
						</a>
						
						<div class="btn-group hidden" style="width: 100%; margin-bottom: 10px;">
							<button type="button" class="btn btn-primary btn-block dropdown-toggle" data-toggle="dropdown">
								Curate <span class="caret"></span>
							</button>
							<ul class="dropdown-menu" role="menu" style="width: 100%;">
								<li>
									<g:link action="curate" params="${params + ['ps': 'selected', 'offset': 0]}">
										Curate Selected
									</g:link>
								</li>
								<li>
									<g:link action="curate" params="${params + ['ps': 'top', 'offset': 0]}">
										Curate Top ${queryTop}
									</g:link>
								</li>
								<li>
									<g:link action="curate" params="${params + ['ps': 'all', 'offset': 0]}">
										Curate All
									</g:link>
								</li>
							</ul>
						</div>
						<div class="btn-group hidden" style="width: 100%; margin-bottom: 10px;">
							<button type="button" class="btn btn-primary btn-block dropdown-toggle" data-toggle="dropdown">
								Export <span class="caret"></span>
							</button>
							<ul class="dropdown-menu" role="menu" style="width: 100%;">
								<li>
									<g:link action="curate" params="${params + ['export': true, 'ps': 'selected', 'offset': 0]}">
										Export Selected
									</g:link>
								</li>
								<li>
									<g:link action="curate" params="${params + ['export': true, 'ps': 'top', 'offset': 0]}">
										Export Top ${queryTop}
									</g:link>
								</li>
								<li>
									<g:link action="curate" params="${params + ['export': true, 'ps': 'all', 'offset': 0]}">
										Export All
									</g:link>
								</li>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</g:if>
		<g:else>
			<p style="text-align: center; margin-top: 100px; margin-bottom: 100px;">
				<i class="fa fa-fw fa-warning"></i>
				Error occured, resubmit the query please.
			</p>
		</g:else>
	</div>
	
	<script type="text/javascript">
		var path = '${createLink(uri: '')}';
		
		function taxonomyChange() {
			var taxonomyId = $('#taxonomy').val();
			if (taxonomyId !== '') {
				var taxonomyChangeUrl = "${createLink(action: 'pubmed', params: params + ['taxonomy': '', 'offset': 0])}"
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
</body>

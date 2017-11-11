<%@ page import="ppi_curator.Interaction" %>

<head>
<meta name='layout' content='frontend' />
<title><g:message code="default.curate.label" /></title>

<style>
	.interaction-table td {
		padding: 0 10px 0 0;
	}
</style>
</head>

<body>
	<div class="container" style="background-color: #efefef; padding: 25px 15px; border-bottom: 1px solid #ccc; font-size: 25px;">
		<i class="fa fa-fw fa-check"></i>
		<g:message code="default.curate.label" />
	</div>
	<div class="container" style="background-color: #fff; padding: 25px 15px;">
		<div class="row">
			<div class="col-sm-2">
				<form method="get">
					<input type="hidden" name="q" value="${params.q}" />
					<input type="hidden" name="sort" value="${params.sort}" />
					<input type="hidden" name="order" value="${params.order}" />
					<input type="hidden" name="taxonomy" value="${params.taxonomy}" />
					<input type="hidden" name="start" value="${params.start}" />
					<input type="hidden" name="end" value="${params.end}" />
					<input type="hidden" name="ps" value="${params.ps}" />
					<input type="hidden" name="offset" value="0" />
					
					<div class="sidebar">
						<h4>
							GO
						</h4>
						
						<g:if test="${params.go}">
							<a href="${createLink(action: 'curate', params: params + ['go': null, 'offset': 0])}">
								<i class="fa fa-fw"></i>
								All
							</a>
						</g:if>
						<g:else>
							<a href="javascript:;">
								<i class="fa fa-fw fa-check"></i>
								All
							</a>
						</g:else>
						
						<br/>
						<i class="fa fa-fw"></i>
						- Biological Process -
						
						<g:each in="${goMap['biological_process']}" var="record">
							<g:set var="go" value="${record[0]}" />
							<div>
								<g:if test="${params.go?.contains(go.id)}">
									<a href="javascript:;">
										<i class="fa fa-fw fa-check"></i>
										${go.name} (${record[1]})
									</a>
								</g:if>
								<g:else>
									<a href="${createLink(action: 'curate', params: params + ['go': go.id, 'offset': 0])}">
										<i class="fa fa-fw"></i>
										${go.name} (${record[1]})
									</a>
								</g:else>
							</div>
						</g:each>
						
						<i class="fa fa-fw"></i>
						- Cellular Component -

						<g:each in="${goMap['cellular_component']}" var="record">
							<g:set var="go" value="${record[0]}" />
							<div>
								<g:if test="${params.go?.contains(go.id)}">
									<a href="javascript:;">
										<i class="fa fa-fw fa-check"></i>
										${go.name} (${record[1]})
									</a>
								</g:if>
								<g:else>
									<a href="${createLink(action: 'curate', params: params + ['go': go.id, 'offset': 0])}">
										<i class="fa fa-fw"></i>
										${go.name} (${record[1]})
									</a>
								</g:else>
							</div>
						</g:each>
						
						<i class="fa fa-fw"></i>
						- Molecular Function -
						
						<g:each in="${goMap['molecular_function']}" var="record">
							<g:set var="go" value="${record[0]}" />
							<div>
								<g:if test="${params.go?.contains(go.id)}">
									<a href="javascript:;">
										<i class="fa fa-fw fa-check"></i>
										${go.name} (${record[1]})
									</a>
								</g:if>
								<g:else>
									<a href="${createLink(action: 'curate', params: params + ['go': go.id, 'offset': 0])}">
										<i class="fa fa-fw"></i>
										${go.name} (${record[1]})
									</a>
								</g:else>
							</div>
						</g:each>
						
						<h4>
							Score &gt;=
						</h4>
						<input id="score" name="score" type="text" class="form-control" value="${formatNumber(number: params.score, type: 'number', minFractionDigits: 3, maxFractionDigits: 3, format: '#', groupingUsed: false)}" data-min="0.000" data-max="2.000" />
						<div class="sidebar-tip" style="margin-top: 5px; margin-bottom: 10px;">
							<table style="width: 100%;">
								<tr>
									<td>
										Highest confidence
									</td>
									<td style="text-align: right;">
										<a href="javascript:;" onclick="updateScore('0.900')">
											0.900
										</a>
									</td>
								</tr>
								<tr>
									<td>
										High confidence
									</td>
									<td style="text-align: right;">
										<a href="javascript:;" onclick="updateScore('0.700')">
											0.700
										</a>
									</td>
								</tr>
								<tr>
									<td>
										Medium confidence
									</td>
									<td style="text-align: right;">
										<a href="javascript:;" onclick="updateScore('0.400')">
											0.400
										</a>
									</td>
								</tr>
								<tr>
									<td>
										Low confidence
									</td>
									<td style="text-align: right;">
										<a href="javascript:;" onclick="updateScore('0.150')">
											0.150
										</a>
									</td>
								</tr>
								<tr>
									<td>
										No Filter
									</td>
									<td style="text-align: right;">
										<a href="javascript:;" onclick="updateScore('0.000')">
											0.000
										</a>
									</td>
								</tr>
							</table>
						</div>
						<button type="submit" class="btn btn-primary btn-block" onclick="clearAllSelection(); return true;">Apply filter</button>
						
					</div>
				</form>
			</div>
			<div class="col-sm-8">
				<g:if test="${pubmedList}">
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
										<a href="${createLink(action: 'curate', params: params + ['ab': false])}">
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
										<a href="${createLink(action: 'curate', params: params + ['ab': true])}">
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
								${params.max} per page <span class="caret"></span>
							</a>
							<ul class="dropdown-menu dropdown-default" role="menu">
								<g:each in="${[10, 20, 50, 100]}" var="pageSize">
									<li>
										<a href="${createLink(action: 'curate', params: params + ['offset': 0, 'max': pageSize])}">
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
					</div>
					<g:each in="${pubmedList}" var="pubmed" status="i">
						<g:if test="${i > 0}">
							<br />
						</g:if>
						<div style="text-align: justify;">
							<a href="http://www.ncbi.nlm.nih.gov/pubmed/${pubmed.id}" target="_blank">
								${i + 1 + params.int('offset')}.
								[PMID ${pubmed.id}]
								${pubmed.title}
							</a>
						</div>
						<div class="article-abstract ${params.ab ? '' : 'hidden'}" style="text-align: justify;">
							${pubmed.abstract_}
						</div>
						<div style="padding-left: 30px;">
							<g:each in="${pubmed.sentences}" var="sentence" status="j">
								<g:if test="${sentence.score >= params.score && (params.go ? sentence.containsGos(params.go) : true)}">
									[${sentence.id}] ${sentence.content}
									<div style="margin-bottom: 10px;">
										<g:each in="${sentence.gos}" var="go">
											${go.id} ${go.name}
										</g:each>
										<table class="interaction-table">
											<tbody>
												<g:each in="${sentence.interactions}" var="interaction" status="k">
													<g:if test="${interaction.score >= params.score}">
														<tr>
															<td>
																<input type="checkbox" class="interaction-checkbox" name="interactionId" id="interaction-${interaction.id}" value="${interaction.id}" ${interactionSelection?.contains(interaction.id) ? 'checked' : ''} />
															</td>
															<td class="text-right">
																${interaction.protein1}
															</td>
															<td class="text-center">
																<span class="effect-${interaction.effect}">
																	<g:if test="${interaction.direction == Interaction.DIRECTION_FORWARD}">
																		<i class="fa fa-fw fa-caret-right"></i>
																	</g:if>
																	<g:else>
																		<i class="fa fa-fw fa-caret-left"></i>
																	</g:else>
																	
																	${interaction.normalizedVerb}
																	
																	<g:if test="${interaction.direction == Interaction.DIRECTION_REVERSE}">
																		<i class="fa fa-fw fa-caret-left"></i>
																	</g:if>
																	<g:else>
																		<i class="fa fa-fw fa-caret-right"></i>
																	</g:else>
																</span>
															</td>
															<td>
																${interaction.protein2}
															</td>
															<td>
																<span class="ppiscore">
																	<g:formatNumber number="${interaction.score}" type="number" minFractionDigits="3" maxFractionDigits="3" format="#" groupingUsed="false" />
																</span>
															</td>
														</tr>
													</g:if>
												</g:each>
											</tbody>
										</table>
									</div>
								</g:if>
							</g:each>
						</div>
					</g:each>
					<div class="text-center">
						<ppi_curator:paginate maxsteps="5" params="${params}" total="${pubmedTotal}" />
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
							<span id="selection-count">${interactionSelection?.size()}</span> Selected <span class="caret"></span>
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
					
					<a id="btn-visualize" class="btn btn-primary btn-block" style="margin-bottom: 10px;" href="${createLink(action: 'visualize', params: params + ['is': 'selected'])}">
						Visualize Selected
					</a>
					
					<a id="btn-export" class="btn btn-primary btn-block" style="margin-bottom: 10px;" href="${createLink(action: 'visualize', params: params + ['is': 'selected', 'export': true])}">
						Export Selected
					</a>
					
					<div class="btn-group hidden" style="width: 100%; margin-bottom: 10px;">
						<button type="button" class="btn btn-primary btn-block dropdown-toggle" data-toggle="dropdown">
							Visualize <span class="caret"></span>
						</button>
						<ul class="dropdown-menu" role="menu" style="width: 100%;">
							<li>
								<g:link action="visualize" params="${params + ['is': 'selected']}">
									Visualize Selected
								</g:link>
							</li>
							<li>
								<g:link action="visualize" params="${params + ['is': 'top']}">
									Visualize Top ${queryTop}
								</g:link>
							</li>
							<li>
								<g:link action="visualize" params="${params + [ 'is': 'all']}">
									Visualize All
								</g:link>
							</li>
						</ul>
					</div>
					<div class="btn-group hidden" style="width: 100%;">
						<button type="button" class="btn btn-primary btn-block dropdown-toggle" data-toggle="dropdown">
							Export <span class="caret"></span>
						</button>
						<ul class="dropdown-menu" role="menu" style="width: 100%;">
							<li>
								<g:link action="visualize" params="${params + ['is': 'selected', 'export': true]}">
									Export Selected
								</g:link>
							</li>
							<li>
								<g:link action="visualize" params="${params + ['is': 'top', 'export': true]}">
									Export Top ${queryTop}
								</g:link>
							</li>
							<li>
								<g:link action="visualize" params="${params + ['is': 'all', 'export': true]}">
									Export All
								</g:link>
							</li>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<script type="text/javascript">
		var path = '${createLink(uri: '')}';
		function setSelectionCookie() {
			var cookie = Object.keys(selection).join(';');
			Cookies.set('interaction-selection', cookie, {path: path});
		}
		
		function updateSelectionCount() {
			var selectionCount = Object.keys(selection).length;
			$('#selection-count').text(selectionCount);
			
			if (selectionCount > 0) {
				$("#btn-visualize").removeClass("disabled");
				$("#btn-export").removeClass("disabled");
			}
			else {
				$("#btn-visualize").addClass("disabled");
				$("#btn-export").addClass("disabled");
			}
		}
		
		function printSelection() {
			for (var interactionId in selection) {
			    if (selection.hasOwnProperty(interactionId)) {
			        console.log(interactionId + ": " + selection[interactionId]);
			    }
			}
		}
		
		function checkSelection() {
			$('.interaction-checkbox').each(function() {
				$(this).prop('disabled', false);
				var interactionId = $(this).val();
				if (selection.hasOwnProperty(interactionId)) {
					$(this).prop('checked', true);
				}
			});
		}
		
		function clearSelection() {
			selection = {}
			$('.interaction-checkbox').each(function() {
				this.checked = false;
			});
			setSelectionCookie();
			updateSelectionCount();
		}
		
		function selectPage() {
			$('.interaction-checkbox').each(function() {
				var interactionId = $(this).val();
				selection[interactionId] = 1;
				this.checked = true;
			});
			setSelectionCookie();
			updateSelectionCount();
		}
		
		function clearPage() {
			$('.interaction-checkbox').each(function() {
				var interactionId = $(this).val();
				delete selection[interactionId];
				this.checked = false;
			});
			setSelectionCookie();
			updateSelectionCount();
		}

		function attrDefault($el, data_var, default_val) {
			if(typeof $el.data(data_var) != 'undefined') {
				return $el.data(data_var);
			}

			return default_val;
		}

		function updateScore(score) {
			$('#score').val(score);
		}
		
		//initialization
		var selection = {};
		
		jQuery(document).ready(function($){
			$("#ab").select2({minimumResultsForSearch: -1});
			$("#go-bp,#go-mf,#go-cc").select2({minimumResultsForSearch: 1});
			
			var cookie = Cookies.get('interaction-selection');
			if (cookie != undefined && cookie != '') {
				jQuery.each(cookie.split(';'), function() {
					selection[this] = 1;
				});
			}
			updateSelectionCount();
			
			$('.interaction-checkbox').each(function() {
				var interactionId = $(this).val();
				$(this).click(function() {
					if ($(this).prop('checked')) {
						selection[interactionId] = 1;
					}
					else {
						delete selection[interactionId];
					}
					setSelectionCookie();
					updateSelectionCount();
				});
			});

			$(".input-spinner").each(function(i, el) {
				var $this = $(el),
					$minus = $this.find('button:first'),
					$plus = $this.find('button:last'),
					$input = $this.find('input'),

					minus_step = parseFloat(attrDefault($minus, 'step', -1)),
					plus_step = parseFloat(attrDefault($plus, 'step', 1)),

					min = parseFloat(attrDefault($input, 'min', null)),
					max = parseFloat(attrDefault($input, 'max', null));

				$this.find('button').on('click', function(ev) {
					ev.preventDefault();

					var $this = $(this),
						val = $input.val(),
						step = parseFloat(attrDefault($this, 'step', $this[0] == $minus[0] ? minus_step : plus_step));

					if( ! step.toString().match(/^[0-9-\.]+$/)) {
						step = $this[0] == $minus[0] ? -1 : 1;
					}

					if( ! val.toString().match(/^[0-9-\.]+$/)) {
						val = 0;
					}

					$input.val( (parseFloat(val) + step).toFixed(3) ).trigger('keyup');
				});

				$input.keyup(function() {
					if(min != null && parseFloat($input.val()) < min) {
						$input.val(min.toFixed(3));
					}
					else if(max != null && parseFloat($input.val()) > max) {
						$input.val(max.toFixed(3));
					}
				});

			});
		});
	</script>
</body>

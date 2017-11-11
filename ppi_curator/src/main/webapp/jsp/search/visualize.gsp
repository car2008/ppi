<head>
<meta name='layout' content='frontend' />
<title><g:message code="default.visualize.label" /></title>

<link href="${resource(dir:'frontend/js/cytoscape/', file:'jquery.qtip.min.css')}" rel="stylesheet" type="text/css" />
<script src="${resource(dir:'frontend/js/cytoscape/', file:'fastclick.min.js')}"></script>
<script src="${resource(dir:'frontend/js/cytoscape/', file:'lodash.min.js')}"></script>
<script src="${resource(dir:'frontend/js/cytoscape/', file:'cytoscape.min.js')}"></script>
<script src="${resource(dir:'frontend/js/cytoscape/', file:'jquery.qtip.min.js')}"></script>
<script src="${resource(dir:'frontend/js/cytoscape/', file:'cytoscape-qtip.js')}"></script>
<script src="${resource(dir:'frontend/js/cytoscape/', file:'cola.v3.min.js')}"></script>
<script src="${resource(dir:'frontend/js/cytoscape/', file:'cytoscape-cola.js')}"></script>
<script src="${resource(dir:'frontend/js/cytoscape/', file:'cytoscape-cose-bilkent.js')}"></script>
<link href="${resource(dir:'frontend/js/cytoscape.js-panzoom-2.1.3', file:'cytoscape.js-panzoom.css')}" rel="stylesheet" type="text/css" />
<script src="${resource(dir:'frontend/js/cytoscape.js-panzoom-2.1.3', file:'cytoscape-panzoom.js')}"></script>

<style>
	.table td {
		background-color: #ffffff;
	}
	
	#cy {
		width: 100%;
		height: 500px;
		border-top: 1px solid #ebebeb;
		border-left: 1px solid #ebebeb;
		border-right: 1px solid #ebebeb;
		border-top-left-radius: 3px;
		border-top-right-radius: 3px;
	    background-color: #ffffff;
	}
	
	.cy-panzoom {
		top: 138px;
	}
	
	.cy-panzoom-zoom-button {
		width: 18px;
		height: 18px;
		margin-left: -2px;
	}
	
	.cy-panzoom-slider-handle {
		width: 18px;
		height: 9px;
		margin-left: -3px;
	}

	.interaction-table td {
		padding: 0 10px 0 0;
	}

	.tooltip.top {
		padding: 5px 0;
		margin-top: -3px;
	}
	
	.tooltip {
		position: absolute;
		z-index: 1070;
		display: block;
		font-family: "Helvetica Neue", Helvetica, Arial, sans-serif;
		font-size: 12px;
		font-style: normal;
		font-weight: 400;
		line-height: 1.42857143;
		text-align: left;
		text-align: start;
		text-decoration: none;
		text-shadow: none;
		text-transform: none;
		letter-spacing: normal;
		word-break: normal;
		word-spacing: normal;
		word-wrap: normal;
		white-space: normal;
		filter: alpha(opacity = 0);
		opacity: 0;
		line-break: auto;
	}
	
	.tooltip.in {
		filter: alpha(opacity = 90);
		opacity: .9
	}
	
	.tooltip.top {
		padding: 5px 0;
		margin-top: -3px
	}
	
	.tooltip.right {
		padding: 0 5px;
		margin-left: 3px
	}
	
	.tooltip.bottom {
		padding: 5px 0;
		margin-top: 3px
	}
	
	.tooltip.left {
		padding: 0 5px;
		margin-left: -3px
	}
	
	.tooltip-inner {
		max-width: 200px;
		padding: 3px 8px;
		color: #fff;
		text-align: center;
		background-color: #000;
		border-radius: 4px
	}
	
	.tooltip-arrow {
		position: absolute;
		width: 0;
		height: 0;
		border-color: transparent;
		border-style: solid
	}
	
	.tooltip.top .tooltip-arrow {
		bottom: 0;
		left: 50%;
		margin-left: -5px;
		border-width: 5px 5px 0;
		border-top-color: #000
	}
	
	.tooltip.top-left .tooltip-arrow {
		right: 5px;
		bottom: 0;
		margin-bottom: -5px;
		border-width: 5px 5px 0;
		border-top-color: #000
	}
	
	.tooltip.top-right .tooltip-arrow {
		bottom: 0;
		left: 5px;
		margin-bottom: -5px;
		border-width: 5px 5px 0;
		border-top-color: #000
	}
	
	.tooltip.right .tooltip-arrow {
		top: 50%;
		left: 0;
		margin-top: -5px;
		border-width: 5px 5px 5px 0;
		border-right-color: #000
	}
	
	.tooltip.left .tooltip-arrow {
		top: 50%;
		right: 0;
		margin-top: -5px;
		border-width: 5px 0 5px 5px;
		border-left-color: #000
	}
	
	.tooltip.bottom .tooltip-arrow {
		top: 0;
		left: 50%;
		margin-left: -5px;
		border-width: 0 5px 5px;
		border-bottom-color: #000
	}
	
	.tooltip.bottom-left .tooltip-arrow {
		top: 0;
		right: 5px;
		margin-top: -5px;
		border-width: 0 5px 5px;
		border-bottom-color: #000
	}
	
	.tooltip.bottom-right .tooltip-arrow {
		top: 0;
		left: 5px;
		margin-top: -5px;
		border-width: 0 5px 5px;
		border-bottom-color: #000
	}
</style>

</head>

<body>
	<div class="container" style="background-color: #efefef; padding: 25px 15px; border-bottom: 1px solid #ccc; font-size: 25px;">
		<i class="fa fa-fw fa-circle-o"></i>
		<g:message code="default.visualize.label" />
	</div>
	<div class="container" style="background-color: #fff; padding: 25px 15px;">
		<div class="ppi-sidebar">
			<div class="sidebar">
				<div class="sidebar-title">
					Layout
				</div>
				<div class="sidebar-content">
					<table style="width: 100%;">
						<tr>
							<td>
								<input type="radio" name="radio-layout" class="radio-layout" value="cose" checked="checked" /> Cose
							</td>
							<td style="padding-left: 5px;">
								<input type="radio" name="radio-layout" class="radio-layout" value="cose-bilkent" /> Cose-bilkent
							</td>
						</tr>
						<tr>
							<td>
								<input type="radio" name="radio-layout" class="radio-layout" value="cola" /> Cola
							</td>
							<td style="padding-left: 5px;">
								<input type="radio" name="radio-layout" class="radio-layout" value="circle" /> Circle
							</td>
						</tr>
						<tr>
							<td>
								<input type="radio" name="radio-layout" class="radio-layout" value="concentric" /> Concentric
							</td>
							<td style="padding-left: 5px;">
								
							</td>
						</tr>
					</table>
					
					<!-- 
					<hr/>
					
					<input type="radio" name="radio-directional" class="radio-directional" value="directional" onclick="changeDirectional()" /> Directional
					<br/>
					<input type="radio" name="radio-directional" class="radio-directional" value="undirectional" onclick="changeDirectional()" /> Undirectional
					 -->
				</div>
			</div>
			
			<div class="sidebar">
				<div class="sidebar-title">
					Label
				</div>
				<div class="sidebar-content">
					<input type="checkbox" name="checkbox-label" class="checkbox-label" value="proteinsymbol" checked="checked" /> Protein symbol
					<br/>
					<input type="checkbox" name="checkbox-label" class="checkbox-label" value="interactionverb" checked="checked" /> Interaction verb
					<br/>
					<input type="checkbox" name="checkbox-label" class="checkbox-label" value="interactionscore" /> Interaction score
				</div>
			</div>
			
			<div class="sidebar">
				<div class="sidebar-title">
					Control
				</div>
				<div class="sidebar-content">
					<div class="btn-group" style="width: 100%; margin-bottom: 10px;">
						<button id="btn-random" class="btn-layout btn btn-white" style="width: 25%;" title="Random" disabled>
							<i class="fa fa-fw fa-random"></i>
						</button>
						<button id="btn-zoom-fit" class="btn-layout btn btn-white" style="width: 25%;" title="Zoom Fit" disabled>
							<i class="fa fa-fw fa-arrows-alt"></i>
						</button>
						<button id="btn-zoom-out" class="btn-layout btn btn-white" style="width: 25%;" title="Zoom Out" disabled>
							<i class="fa fa-fw fa-search-minus"></i>
						</button>
						<button id="btn-zoom-in" class="btn-layout btn btn-white" style="width: 25%;" title="Zoom In" disabled>
							<i class="fa fa-fw fa-search-plus"></i>
						</button>
					</div>
					<div class="btn-group" style="width: 100%; margin-bottom: 10px;">
						<button id="btn-zoom-out-text" class="btn-layout btn btn-white" style="width: 25%;" title="Zoom Out Text" disabled>
							<i class="fa fa-fw fa-font"></i>
						</button>
						<button id="btn-zoom-in-text" class="btn-layout btn btn-white" style="width: 25%;" title="Zoom In Text" disabled>
							<i class="fa fa-fw fa-font fa-lg"></i>
						</button>
						<button id="btn-zoom-out-node" class="btn-layout btn btn-white" style="width: 25%;" title="Zoom Out Node" disabled>
							<i class="fa fa-fw fa-circle"></i>
						</button>
						<button id="btn-zoom-in-node" class="btn-layout btn btn-white" style="width: 25%;" title="Zoom In Node" disabled>
							<i class="fa fa-fw fa-circle fa-lg"></i>
						</button>
					</div>
					<div class="btn-group" style="width: 100%; margin-bottom: 10px;">
						<button id="btn-download-png" class="btn-layout btn btn-white" style="width: 65%;" title="Download PNG" disabled>
							<i class="fa fa-fw fa-save"></i>
							Download PNG
						</button>
						<button id="btn-download-jpg" class="btn-layout btn btn-white" style="width: 35%;" title="Download JPEG" disabled>
							JPEG
						</button>
					</div>
					<img id="png64" src="" class="hidden" style="max-width: 100%; background-color: #ffffff; margin-top: 10px; padding: 10px; -webkit-border-radius:3px; -moz-border-radius:3px; border-radius: 3px;" />
				</div>
			</div>
		</div>
		<div class="ppi-content">
			<div id="cy">
			
			</div>
			<div style="margin-top: 0; background-color: #f5f5f6; padding-bottom: 5px; border-bottom-left-radius: 3px; border-bottom-right-radius: 3px; border: 1px solid #ebebeb;">
				<table style="width: 100%;">
					<tr>
						<td style="text-align: left; padding: 5px 5px 5px 6px; vertial-align: middle;">
							PPI score &gt;=
						</td>
						<!-- <td style="text-align: left; padding: 5px 5px 5px 6px; vertial-align: middle;">
							Path length &gt;=
						</td> -->
						<td style="text-align: left; padding: 5px 5px 5px 6px; vertial-align: middle;">
							Degree &gt;=
						</td>
					</tr>
					<tr>
						<td style="text-align: left; padding: 0 5px 0 5px;">
							<div id="score-input-spinner" class="input-spinner">
								<button type="button" class="btn btn-white" data-step="-0.100"><i class="fa fa-fw fa-minus"></i></button>
								<input type="text" class="form-control" style="width: 60px;" value="${formatNumber(number: params.score, type: 'number', minFractionDigits: 3, maxFractionDigits: 3, format: '#', groupingUsed: false)}" data-min="0.000" data-max="2.000" />
								<button type="button" class="btn btn-white" data-step="0.100"><i class="fa fa-fw fa-plus"></i></button>
							</div>
						</td>
						<!-- <td style="text-align: left; padding: 0 5px 0 5px;">
							<div id="pathlength-input-spinner" class="input-spinner">
								<button type="button" class="btn btn-white" data-step="-1"><i class="fa fa-fw fa-minus"></i></button>
								<input type="text" class="form-control" style="width: 60px;" value="${formatNumber(number: params.pathlength, type: 'number', minFractionDigits: 0, maxFractionDigits: 0, format: '#', groupingUsed: false)}" data-min="0" />
								<button type="button" class="btn btn-white" data-step="1"><i class="fa fa-fw fa-plus"></i></button>
							</div>
						</td> -->
						<td style="text-align: left; padding: 0 5px 0 5px;">
							<div id="degree-input-spinner" class="input-spinner">
								<button type="button" class="btn btn-white" data-step="-1"><i class="fa fa-fw fa-minus"></i></button>
								<input type="text" class="form-control" style="width: 60px;" value="${formatNumber(number: params.degree, type: 'number', minFractionDigits: 0, maxFractionDigits: 0, format: '#', groupingUsed: false)}" data-min="0" />
								<button type="button" class="btn btn-white" data-step="1"><i class="fa fa-fw fa-plus"></i></button>
							</div>
						</td>
					</tr>
				</table>
			</div>
			<div style="margin-top: 10px;">
				<table id="table-interaction" class="table table-bordered table-condensed">
					<thead>
						<tr>
							<th></th>
							<th>Protein A</th>
							<th>Protein B</th>
							<th>Score</th>
							<th>Verb</th>
							<th>Effect</th>
							<th>Direction</th>
							<th>Reference</th>
						</tr>
					</thead>
					<tbody>
						<g:each in="${interactionList}" var="interaction">
							<tr>
								<td style="text-align: center;">
									<input class="checkbox-interaction" value="${interaction.id}" type="checkbox" checked onclick="javascript:toggleInteractionSelection(this);" />
								</td>
								<td>${interaction.protein1}</td>
								<td>${interaction.protein2}</td>
								<td><g:formatNumber number="${interaction.score}" type="number" minFractionDigits="3" maxFractionDigits="3" format="#" groupingUsed="false" /></td>
								<td>${interaction.normalizedVerb}</td>
								<td>${interaction.effect}</td>
								<td>${interaction.direction}</td>
								<td>
									<a href="javascript:;" onclick="showInteractionReference('${interaction.id}')">
										${interaction.sentence.id}
									</a>
								</td>
							</tr>
						</g:each>
					</tbody>
				</table>
			</div>
			<div style="margin-top: 10px; padding: 5px; background-color: #f5f5f6; border: 1px solid #ebebeb; border-radius: 3px;">
				<div id="interaction-none">
					Reference information will be shown here. 
				</div>
				<g:each in="${interactionList}" var="interaction">
					<div class="hidden" id="interaction-${interaction.id}">
						${interaction.sentence.id}: ${interaction.sentence.content}
					</div>
				</g:each>
			</div>
		</div>
	</div>
	
	<script type="text/javascript">
		var interactionCurrent = "interaction-none";
		function showInteractionReference(interactionId) {
			var interactionElementId = "interaction-" + interactionId;
			if (interactionElementId !== interactionCurrent) {
				$("#" + interactionCurrent).addClass("hidden");
				$("#" + interactionElementId).removeClass("hidden");
				interactionCurrent = interactionElementId;
			}
		}
	</script>
	
	<script type="text/javascript">
		var excludeInteractions = {};
		var layoutName = "cose";
		var minTextSize = 10;
		var textSize = minTextSize;
		var minNodeSize = 5;
		var nodeSize = minNodeSize;
		var cy;
		var layout;
		var filterCy;
		
		var showProteinsymbol = true;
		var showInteractionverb = true;
		var showInteractionscore = false;
		
		var path = '${createLink(uri: '')}';

		function toggleInteractionSelection(target) {
			var interaction = $(target).val();
			if (excludeInteractions[interaction] == undefined) {
				excludeInteractions[interaction] = 1;
			}
			else {
				delete excludeInteractions[interaction]
			}
			filterCy();
		}

		function clearAllSelection() {
		    Cookies.set('pubmed-selection', '', {
		        path: path
		    });
		    Cookies.set('interaction-selection', '', {
		        path: path
		    });
		}
		
		function attrDefault($el, data_var, default_val) {
			if(typeof $el.data(data_var) != 'undefined') {
				return $el.data(data_var);
			}

			return default_val;
		}
		
		jQuery(document).ready(function($) {
			var elements = ${elements};

			//$('#cy').height($(window).width());
			//$(window).resize(function() {
			//	$('#cy').height($(window).width());
			//});
			
			var layoutParams = {
				'cola': {
					name: 'cola',
					animate: false,
				},
				'cose-bilkent': {
					name: 'cose-bilkent',
					animate: false,
				},
				'cose': {
					name: 'cose',
					// Called on `layoutready`
					ready               : function() {},
					// Called on `layoutstop`
					stop                : function() {},
					// Whether to animate while running the layout
					animate             : false,
					// The layout animates only after this many milliseconds
					// (prevents flashing on fast runs)
					animationThreshold  : 0,
					// Number of iterations between consecutive screen positions update
					// (0 -> only updated on the end)
					refresh             : 20,
					// Whether to fit the network view after when done
					fit                 : true,
					// Padding on fit
					padding             : 30,
					// Constrain layout bounds; { x1, y1, x2, y2 } or { x1, y1, w, h }
					boundingBox         : undefined,
					// Extra spacing between components in non-compound graphs
					componentSpacing    : 100,
					// Node repulsion (non overlapping) multiplier
					nodeRepulsion       : function( node ){ return 400000; },
					// Node repulsion (overlapping) multiplier
					nodeOverlap         : 10,
					// Ideal edge (non nested) length
					idealEdgeLength     : function( edge ){ return 10; },
					// Divisor to compute edge forces
					edgeElasticity      : function( edge ){ return 100; },
					// Nesting factor (multiplier) to compute ideal edge length for nested edges
					nestingFactor       : 5,
					// Gravity force (constant)
					gravity             : 80,
					// Maximum number of iterations to perform
					numIter             : 1000,
					// Initial temperature (maximum node displacement)
					initialTemp         : 200,
					// Cooling factor (how the temperature is reduced between consecutive iterations
					coolingFactor       : 0.95,
					// Lower temperature threshold (below this point the layout will end)
					minTemp             : 1.0,
					// Whether to use threading to speed up the layout
					useMultitasking     : true
		        },
		        'circle': {
	        	  name: 'circle',
	        	  fit: true, // whether to fit the viewport to the graph
	        	  padding: 30, // the padding on fit
	        	  boundingBox: undefined, // constrain layout bounds; { x1, y1, x2, y2 } or { x1, y1, w, h }
	        	  avoidOverlap: true, // prevents node overlap, may overflow boundingBox and radius if not enough space
	        	  radius: undefined, // the radius of the circle
	        	  startAngle: 3/2 * Math.PI, // where nodes start in radians
	        	  sweep: undefined, // how many radians should be between the first and last node (defaults to full circle)
	        	  clockwise: true, // whether the layout should go clockwise (true) or counterclockwise/anticlockwise (false)
	        	  sort: undefined, // a sorting function to order the nodes; e.g. function(a, b){ return a.data('weight') - b.data('weight') }
	        	  animate: false, // whether to transition the node positions
	        	  animationDuration: 500, // duration of animation in ms if enabled
	        	  animationEasing: undefined, // easing of animation if enabled
	        	  ready: undefined, // callback on layoutready
	        	  stop: undefined // callback on layoutstop
	        	},
		        'concentric': {
	        	  name: 'concentric',

	        	  fit: true, // whether to fit the viewport to the graph
	        	  padding: 30, // the padding on fit
	        	  startAngle: 3/2 * Math.PI, // where nodes start in radians
	        	  sweep: undefined, // how many radians should be between the first and last node (defaults to full circle)
	        	  clockwise: true, // whether the layout should go clockwise (true) or counterclockwise/anticlockwise (false)
	        	  equidistant: false, // whether levels have an equal radial distance betwen them, may cause bounding box overflow
	        	  minNodeSpacing: 10, // min spacing between outside of nodes (used for radius adjustment)
	        	  boundingBox: undefined, // constrain layout bounds; { x1, y1, x2, y2 } or { x1, y1, w, h }
	        	  avoidOverlap: true, // prevents node overlap, may overflow boundingBox if not enough space
	        	  height: undefined, // height of layout area (overrides container height)
	        	  width: undefined, // width of layout area (overrides container width)
	        	  concentric: function(node){ // returns numeric value for each node, placing higher nodes in levels towards the centre
	        	  return node.degree();
	        	  },
	        	  levelWidth: function(nodes){ // the variation of concentric values in each level
	        	  return nodes.maxDegree() / 4;
	        	  },
	        	  animate: false, // whether to transition the node positions
	        	  animationDuration: 500, // duration of animation in ms if enabled
	        	  animationEasing: undefined, // easing of animation if enabled
	        	  ready: undefined, // callback on layoutready
	        	  stop: undefined // callback on layoutstop
	        	},
			};
			
			function reLayout() {
				if (layout != undefined) {
					layout.stop();
				}
                layout = cy.makeLayout(layoutParams[layoutName]);
                layout.run();
			}
			
			filterCy = function() {
				cy.nodes().each(function(i, ele) {
					ele.style('display', 'element');
				});
				
				cy.edges().each(function(i, ele) {
					ele.style('display', 'element');
					if (excludeInteractions[ele.data("id")] != undefined) {
						ele.style('display', 'none');
					}
				});
				
				cy.edges().filter('[score < ' + $('#score-input-spinner').find('input').val() + ']').each(function(i, ele) {
					ele.style('display', 'none');
				});
				
				cy.nodes().each(function(i, ele) {
					var smaller = ele.degree() < $('#degree-input-spinner').find('input').val();
					//console.log(ele.degree() + " " + smaller + " " + $('#degree-input-spinner').find('input').val());
					if (smaller) {
						ele.style('display', 'none');
					}
				});
				
				cy.nodes().each(function(i, ele) {
					if (ele.connectedEdges(':visible').size() > 0) {
						ele.style('display', 'element');
					}
					else {
						ele.style('display', 'none');
					}
				});
			}
			
			$('.radio-layout').on('click', function(e) {
				if (layoutName != e.target.value) {
					layoutName = e.target.value;
					reLayout();
				}
			});
			
			$('.checkbox-label').on('click', function(e) {
				if (e.target.value == 'proteinsymbol') {
					showProteinsymbol = $(e.target).prop('checked');
					if (showProteinsymbol) {
						cy.nodes().each(function(i, ele) {
							ele.style('content', ele.data('name'));
							ele.style('text-opacity', 1);
						});
					}
					else {
						cy.nodes().each(function(i, ele) {
							ele.style('text-opacity', 0);
						});
					}
				}
				
				if (e.target.value == 'interactionverb' || e.target.value == 'interactionscore') {
					if (e.target.value == 'interactionverb') {
						showInteractionverb = $(e.target).prop('checked');
					}
					if (e.target.value == 'interactionscore') {
						showInteractionscore = $(e.target).prop('checked');
					}
					
					console.log('showInteractionverb: ' + showInteractionverb)
					console.log('showInteractionscore: ' + showInteractionscore)
					
					if (showInteractionverb && showInteractionscore) {
						cy.edges().each(function(i, ele) {
							ele.style('content', ele.data('normalizedVerb_score'));
							ele.style('text-opacity', 1);
						});
					}
					if (showInteractionverb && !showInteractionscore) {
						cy.edges().each(function(i, ele) {
							ele.style('content', ele.data('normalizedVerb'));
							ele.style('text-opacity', 1);
						});
					}
					if (showInteractionscore && !showInteractionverb) {
						cy.edges().each(function(i, ele) {
							ele.style('content', ele.data('score'));
							ele.style('text-opacity', 1);
						});
					}
					if (!showInteractionscore && !showInteractionverb) {
						cy.edges().each(function(i, ele) {
							ele.style('text-opacity', 0);
						});
					}
				}
			});
			
	        $('#btn-random').on('click', function() {
	        	reLayout();
            });
            
	        $('#btn-zoom-fit').on('click', function() {
                cy.fit();
            });

	        $('#btn-zoom-in').on('click', function() {
                cy.zoom({'level': cy.zoom() * 1.5, 'renderedPosition': { 'x': cy.width() / 2, 'y': cy.height() / 2 }});
            });

	        $('#btn-zoom-out').on('click', function() {
	        	cy.zoom({'level': cy.zoom() / 1.5, 'renderedPosition': { 'x': cy.width() / 2, 'y': cy.height() / 2 }});
            });
            
            $('#btn-zoom-in-text').on('click', function() {
            	textSize = textSize + 4;
	        	cy.style().selector('node').style('font-size', textSize + 'px').update();
	        	cy.style().selector('edge').style('font-size', textSize + 'px').update();
            });
            
            $('#btn-zoom-out-text').on('click', function() {
            	textSize = textSize - 4;
            	if (textSize < minTextSize) {
            		textSize = minTextSize;
            	}
	        	cy.style().selector('node').style('font-size', textSize + 'px').update();
	        	cy.style().selector('edge').style('font-size', textSize + 'px').update();
            });
            
            $('#btn-zoom-in-node').on('click', function() {
            	nodeSize = nodeSize + 2;
            	cy.style().selector('node').style('width', function(ele) {return (5 + ele.degree()) * nodeSize;}).update();
            	cy.style().selector('node').style('height', function(ele) {return (5 + ele.degree()) * nodeSize;}).update();
            });
            
            $('#btn-zoom-out-node').on('click', function() {
            	nodeSize = nodeSize - 2;
            	if (nodeSize < minNodeSize) {
            		nodeSize = minNodeSize;
            	}
	        	cy.style().selector('node').style('width', function(ele) {return (5 + ele.degree()) * nodeSize;}).update();
            	cy.style().selector('node').style('height', function(ele) {return (5 + ele.degree()) * nodeSize;}).update();
            });
            
            $('#btn-download-png').on('click', function() {
                var png64 = cy.png({
                	//'scale': 2,
                	'full': true,
                });
                //$('#png64').addClass('hidden');
				//$('#png64').attr('src', png64);
				//$('#png64').removeClass('hidden');
                //console.log(png64);
                window.open(png64, '_blank');
                //download(png64, "network.png", "image/png");
            });
            
            $('#btn-download-jpg').on('click', function() {
                var jpg64 = cy.jpg({
                	//'scale': 2,
                	'full': true,
                });
                window.open(jpg64, '_blank');
            });
            
            function reDraw() {
            	//nodes and edges
    			var style = [
    			{
    			    "selector": "core",
    			    "style":
    			    {
    			        "selection-box-color": "#DDDDDD",
    			        "selection-box-border-color": "#DDDDDD",
    			        "selection-box-opacity": "0.5"
    			    }
    			},
    			{
    			    "selector": "node",
    			    "style":
    			    {
    			    	"width": function(ele) {
    			    		return (5 + ele.degree()) * 5;
    			    	},
    			    	"height": function(ele) {
    			    		return (5 + ele.degree()) * 5;
    			    	},
    			        "content": "data(name)",
    			        "font-size": "10px",
    			        "text-valign": "center",
    			        "text-halign": "center",
    			        "background-color": "#000000",
    			        "background-opacity": function(ele) {
    			        	return 0.25 + Math.log(ele.degree()) / (Math.log(10) * 2);
    			        },
    			        "text-outline-color": "#FFFFFF",
    			        "text-outline-width": "1px",
    			        "color": "#000000",
    			        "overlay-padding": "2px",
    			        "z-index": "10"
    			    }
    			},
    			{
    			    "selector": "node:selected",
    			    "style":
    			    {
    			        "background-color": "#666666",
    			    }
    			},
    			{
    			    "selector": "edge",
    			    "style":
    			    {
    			    	"content": "data(normalizedVerb)",
    			    	"font-size": "10px",
    			        "curve-style": "bezier",
    			        "opacity": "0.9",
    			        "line-color": "#6B6B6B",
    			        "width": "mapData(score, 0, 2, 2, 8)",
    			        "overlay-padding": "3px",
    			        "text-outline-color": "#FFFFFF",
    			        "text-outline-width": "1px",
    			        'source-arrow-color': '#6B6B6B',
    			        'target-arrow-color': '#6B6B6B',
    			        'source-arrow-shape': 'triangle',
    			    	'target-arrow-shape': 'triangle',
    			    }
    			},
    			{
    			    "selector": "edge[effect=\"activation\"]",
    			    "style":
    			    {
    			        "line-color": "#03A260",
    			        "color": "#03A260",
    			        'source-arrow-color': '#03A260',
    			        'target-arrow-color': '#03A260',
    			    }
    			},
    			{
    			    "selector": "edge[effect=\"inhibation\"]",
    			    "style":
    			    {
    			        "line-color": "#e25b3c",
    			        "color": "#e25b3c",
    			        'source-arrow-color': '#e25b3c',
    			        'target-arrow-color': '#e25b3c',
    			    }
    			},
    			{
    			    "selector": "edge[direction=\"forward\"]",
    			    "style":
    			    {
    			    	'source-arrow-shape': 'none',
    			        'target-arrow-shape': 'triangle',
    			    }
    			},
    			{
    			    "selector": "edge[direction=\"reverse\"]",
    			    "style":
    			    {
    			    	'source-arrow-shape': 'triangle',
    			        'target-arrow-shape': 'none',
    			    }
    			}];
            	
		        cy = cytoscape({
		            container: $('#cy'),
		            layout: layoutParams[layoutName],
		            style: style,
		            elements: elements,
		            ready: function(evt){
		            	cy.fit();
			        },
		        });
		        
		        cy.panzoom({
					// options here...
				});
	
		        cy.on('layoutstart', function() {
		            $('.btn-layout').prop('disabled', true);
		        }).on('layoutstop', function() {
		            $('.btn-layout').prop('disabled', false);
		        });
				
		        cy.nodes().forEach(function(n) {
		            n.qtip({
		                content: [{
		                    name: 'PubMed',
		                    url: 'http://www.ncbi.nlm.nih.gov/pubmed/' + n.data('pmid'),
		                }, {
		                    name: 'UniProt search',
		                    url: 'http://www.uniprot.org/uniprot/?query=' + n.data('name'),
		                }].map(function(link) {
		                    return '<a target="_blank" href="' + link.url + '">' + link.name + '</a>';
		                }).join('<br />\n'),
		                position: {
		                    my: 'top center',
		                    at: 'bottom center'
		                },
		                style: {
		                    classes: 'qtip-bootstrap',
		                    tip: {
		                        width: 16,
		                        height: 8
		                    }
		                }
		            });
		        });
            }
	        
            reDraw();
	        FastClick.attach(document.body);
	        
	        $("#score-input-spinner").each(function(i, el) {
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
					
					filterCy();
				});

			});
			
			$("#degree-input-spinner").each(function(i, el) {
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

					$input.val( (parseFloat(val) + step).toFixed(0) ).trigger('keyup');
				});

				$input.keyup(function() {
					if(min != null && parseFloat($input.val()) < min) {
						$input.val(min.toFixed(0));
					}
					else if(max != null && parseFloat($input.val()) > max) {
						$input.val(max.toFixed(0));
					}
					
					filterCy();
				});

			});
			
			$("#pathlength-input-spinner").each(function(i, el) {
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

					$input.val( (parseFloat(val) + step).toFixed(0) ).trigger('keyup');
				});

				$input.keyup(function() {
					if(min != null && parseFloat($input.val()) < min) {
						$input.val(min.toFixed(0));
					}
					else if(max != null && parseFloat($input.val()) > max) {
						$input.val(max.toFixed(0));
					}
					
					filterCy()
				});

			});
			
			var datatable = $('#table-interaction').DataTable({
		    	"scrollX": true,
		    	//"scrollY": true,
		    	//"dom": 'R<"#$table-operations"><"#${id}-table-options"CT><"#table-data"t><"#table-length"l><"#table-info"i><"#table-paging"p>',
		        "paging": true,
		    	"tableTools": {
		            "sSwfPath": "${resource(dir:'frontend/js/datatables/extensions/TableTools/swf/', file:'copy_csv_xls_pdf.swf')}",
		            "aButtons": [
		                {
		                    "sExtends": "copy",
		                    "sButtonText": "<i class='fa fa-clipboard fa-fw'></i> COPY",
		                    "oSelectorOpts": {
				                filter: 'applied'
				            }
		                },
		                {
		                    "sExtends": "xls",
		                    "sButtonText": "<i class='fa fa-save fa-fw'></i> SAVE",
		                    "oSelectorOpts": {
				                filter: 'applied'
				            }
		                },
		            ],
		        },
		        "initComplete": function( settings, json ) {
					
				}
		    });
		});
	</script>
</body>

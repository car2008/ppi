<head>
<meta name='layout' content='frontend' />
<title>Batch Search</title>
<style>
	.inputfile-eg {
		border: 1px solid #ddd;
		background-color: #efefef;
		padding: 5px;
		width: 200px;
		margin: 10px;
	}
</style>
</head>

<body>
	<div class="container" style="background-color: #efefef; padding: 25px 15px; border-bottom: 1px solid #ccc; font-size: 25px;">
		<i class="fa fa-fw fa-search"></i>
		Batch Search
	</div>
	<div class="container" style="background-color: #fff; padding: 25px 15px;">
		<div class="row">
			<div class="col-sm-3">
				<g:uploadForm controller="search" action="pubmed">
					<input type="hidden" name="batch" value="true" />
					<h4>Step 1: Input list</h4>
					<select name="it" id="it" onchange="itChange()" class="hidden">
						<option value="list">Paste a list</option>
						<option value="file">Upload a file</option>
					</select>
					
					<p>-- Paste a list --</p>
					<div id="input-list" style="margin-top: 10px;">
						<textArea name="list" id="list" class="form-control" rows="5"></textArea>
						<p style="text-align: right;">
							<a class="btn btn-xs btn-default" style="margin-top: 5px;" onclick="$('#list').val('');">Clear list</a>
						</p>
					</div>
					
					<p>-- Or upload a file --</p>
					
					<div id="input-file" style="margin-top: 10px; border: 1px solid #ebebeb; border-radius: 3px; padding: 6px 12px; ">
						<input type="file" name="file" />
					</div>
					<br/>
					<p>
						Pay attention: the uploaded file will be used, if you pasted a list and uploaded a file at the same time.
					</p>
					<hr />
					
					<h4>Step 2: List type</h4>
					<div style="margin-top: 10px;">
						<select name="t" id="t">
							<option value="pmids" ${params.t == 'pmids' ? 'selected' : ''}>PubMed IDs</option>
							<option value="uniprotids" ${params.t == 'uniprotids' ? 'selected' : ''}>UniProt IDs</option>
							<option value="proteinnames" ${params.t == 'proteinnames' ? 'selected' : ''}>Protein symbols</option>
						</select>
					</div>
					
					<hr />
					
					<h4>Step 3: Species selection</h4>
					<div style="margin-top: 10px; margin-bottom: 10px;">
						<select name="taxonomy" id="taxonomy">
							<option value="*">All</option>
							<g:each in="${popularTaxonomies}" var="taxonomy">
								<option value="${taxonomy.id}">${taxonomy.scientificName}</option>
							</g:each>
						</select>
					</div>
					
					<button type="submit" class="btn btn-primary btn-block" onclick="initBatchSearch(); return true;">Submit list</button>
				</g:uploadForm>
			</div>
			<div class="col-sm-9">
				<h2>Batch search wizard</h2>
				<p>
					In batch search, you can use a list of keywords, PubMed IDs, and protein symbols as query.
				</p>
				<p>
					This list can be uploaded or assembled on the fly.
				</p>
				<p>
					<strong>Input format examples:</strong>
				</p>
				<table>
					<tr>
						<th style="text-align: center;">List of PubMed IDs</th>
						<th style="text-align: center;">List of UniProt IDs</th>
						<th style="text-align: center;">List of protein symbols</th>
					</tr>
					<tr>
						<td>
							<div class="inputfile-eg">
								24224170
								<br/>
								24224169
								<br/>
								24224162
							</div>
						</td>
						<td>
							<div class="inputfile-eg">
								P01730
								<br/>
								P04637
								<br/>
								P00533
							</div>
						</td>
						<td>
							<div class="inputfile-eg">
								cd4
								<br/>
								cd8
								<br/>
								p53
							</div>
						</td>
					</tr>
				</table>
			</div>
		</div>
	</div>
	
	<script type="text/javascript">
		var path = '${createLink(uri: '')}';
		
		function initBatchSearch() {
			clearAllSelection();
			
			Cookies.set('uuid', '', {path: path});
			Cookies.set('batch', 'true', {path: path});
		}
		
		function itChange() {
			if ($('#it').val() == 'file') {
				$('#input-file').removeClass('hidden');
				$('#input-list').addClass('hidden');
			}
			else {
				$('#input-list').removeClass('hidden');
				$('#input-file').addClass('hidden');
			} 
		}
		jQuery(document).ready(function($){
			$("#it, #t, #taxonomy").select2({minimumResultsForSearch: -1});
			
		});
	</script>
</body>

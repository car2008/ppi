//highcharts max point width
/*(function(H) {
    var each = H.each;
    H.wrap(H.seriesTypes.column.prototype, 'drawPoints', function(proceed) {
        var series = this;
        if(series.data.length > 0 ){
        	var maxPointWidth = series.options.maxPointWidth == undefined ? 5 : series.options.maxPointWidth;
        	var width = series.barW > maxPointWidth ? maxPointWidth : series.barW;
            each(this.data, function(point) {
                point.shapeArgs.x += (point.shapeArgs.width - width) / 2;
                point.shapeArgs.width = width;
            });
        }
        proceed.call(this);
    })    
})(Highcharts);*/

var spinOpts = {
	lines: 11, // The number of lines to draw
	length: 6, // The length of each line
	width: 3, // The line thickness
	radius: 8, // The radius of the inner circle
	corners: 1, // Corner roundness (0..1)
	rotate: 0, // The rotation offset
	direction: 1, // 1: clockwise, -1: counterclockwise
	color: '#555555', // #rgb or #rrggbb or array of colors
	speed: 1, // Rounds per second
	trail: 100, // Afterglow percentage
	shadow: false, // Whether to render a shadow
	hwaccel: false, // Whether to use hardware acceleration
	className: 'spinner', // The CSS class to assign to the spinner
	zIndex: 2e9, // The z-index (defaults to 2000000000)
	top: '50%', // Top position relative to parent
	left: '50%' // Left position relative to parent
};

var spinBlock = new Spinner(spinOpts).spin().el;
var loaderBlock = '<div class="loader-content"><div class="cloud-loader"><div class="cloud-loader-bar"></div><div class="cloud-loader-bar"></div><div class="cloud-loader-bar"></div></div></div>';

function spinIt(id) {
	var target = jQuery('#' + id);
	//target.html(spinBlock);
	target.html(loaderBlock);
}

function showAjaxUltraLargeModal(title, url) {
	var modalTitle = jQuery('#modal-ultra-large .modal-title');
	modalTitle.html(title);
	
	var modalBody = jQuery('#modal-ultra-large .modal-body');
	modalBody.html(loaderBlock);
	jQuery('#modal-ultra-large').modal('show');
	$.ajax({
		url: url,
		success: function(response) {
			modalBody.html(response);
		}
	});
}

function showLocalUltraLargeModal(title, target) {
	var modalTitle = jQuery('#modal-ultra-large .modal-title');
	modalTitle.html(title);
	
	var modalBody = jQuery('#modal-ultra-large .modal-body');
	modalBody.html($('#' + target).html());
	jQuery('#modal-ultra-large').modal('show');
}

function showAjaxLargeModal(title, url) {
	var modalTitle = jQuery('#modal-large .modal-title');
	modalTitle.html(title);
	
	var modalBody = jQuery('#modal-large .modal-body');
	modalBody.html(loaderBlock);
	jQuery('#modal-large').modal('show');
	$.ajax({
		url: url,
		success: function(response) {
			modalBody.html(response);
		}
	});
}

function showLocalLargeModal(title, target) {
	var modalTitle = jQuery('#modal-large .modal-title');
	modalTitle.html(title);
	
	var modalBody = jQuery('#modal-large .modal-body');
	modalBody.html($('#' + target).html());
	jQuery('#modal-large').modal('show');
}

function showAjaxSmallModal(title, url) {
	var modalTitle = jQuery('#modal-small .modal-title');
	modalTitle.html(title);
	
	var modalBody = jQuery('#modal-small .modal-body');
	modalBody.html(loaderBlock);
	jQuery('#modal-small').modal('show');
	$.ajax({
		url: url,
		success: function(response) {
			modalBody.html(response);
		}
	});
}

function showLocalSmallModal(title, target) {
	var modalTitle = jQuery('#modal-small .modal-title');
	modalTitle.html(title);
	
	var modalBody = jQuery('#modal-small .modal-body');
	modalBody.html($('#' + target).html());
	jQuery('#modal-small').modal('show');
}
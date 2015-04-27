// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require notify
//= require bootstrap-sprockets
//= require jquery_ujs
//= require_tree .

$(function(){
	$(".sidebar-toggle, .sidebar-nav a").click(function(e) {
		var $this = $(this);
		e.preventDefault();
		$("#wrapper").toggleClass("toggled");
		setTimeout(function(){
			if($this.attr('href') && $this.attr('href') != '#'){
				window.location = $this.attr('href');
			}
		}, 200);
	});

	$('select').selectpicker();
});

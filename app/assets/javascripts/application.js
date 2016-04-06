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
//= require jquery_ujs
//= require bootstrap
//= require semantic-ui
//= require cocoon
//= require select2
//= require select2-full
//= require jquery-ui
//= require app
//= require mustache

$(document).ready(function(){
  $('select').select2();
});

$(document).ready(function() {
  $('.datepick').datepicker({ dateFormat: "MM d, yy" });
});

$(document).ready(function(){
  $('select').select2();
});

// $(function() { $("[data-widget='collapse']").click(); })

// $('body').bind('expanded.pushMenu', function() {
//   // ... sidebar expanded, do something...
// });

// $('body').bind('collapsed.pushMenu', function() {
//   // ... sidebar collapsed, do something...
// });
// // $(function () {
//   var slideToTop = $("<div />");
//   slideToTop.html('<i class="fa fa-chevron-up"></i>');
//   slideToTop.css({
//     position: 'fixed',
//     bottom: '20px',
//     right: '25px',
//     width: '40px',
//     height: '40px',
//     color: '#eee',
//     'font-size': '',
//     'line-height': '40px',
//     'text-align': 'center',
//     'background-color': '#222d32',
//     cursor: 'pointer',
//     'border-radius': '5px',
//     'z-index': '99999',
//     opacity: '.7',
//     'display': 'none'
//   });
//   slideToTop.on('mouseenter', function () {
//     $(this).css('opacity', '1');
//   });
//   slideToTop.on('mouseout', function () {
//     $(this).css('opacity', '.7');
//   });
//   $('.wrapper').append(slideToTop);
//   $(window).scroll(function () {
//     if ($(window).scrollTop() >= 150) {
//       if (!$(slideToTop).is(':visible')) {
//         $(slideToTop).fadeIn(500);
//       }
//     } else {
//       $(slideToTop).fadeOut(500);
//     }
//   });
//   $(slideToTop).click(function () {
//     $("body").animate({
//       scrollTop: 0
//     }, 500);
//   });
//   $(".sidebar-menu li:not(.treeview) a").click(function () {
//     var $this = $(this);
//     var target = $this.attr("href");
//     if (typeof target === 'string') {
//       $("body").animate({
//         scrollTop: ($(target).offset().top) + "px"
//       }, 500);
//     }
//   });
//   //Skin switcher
//   var current_skin = "skin-blue";
//   $('#layout-skins-list [data-skin]').click(function(e) {
//     e.preventDefault();
//     var skinName = $(this).data('skin');
//     $('body').removeClass(current_skin);
//     $('body').addClass(skinName);
//     current_skin = skinName;
//   });
// });


// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .
//= require data-confirm-modal

$(document).on('turbolinks:load', function () {


  $('#paper-plane').mouseover(function(){
    $(this).stop().effect('shake', {distance:3}, 200);
  });

  $('#paper-plane').hover(function(){
    if(!$(this).hasClass('animated')){
        $(this).addClass('animated');
        $(this).stop().effect('shake', {distance:3}, 200);
    }
  }, function(){
    $(this).removeClass('animated');
  });

  $("div[id^='appointment-info']").attr('id', function(i) {
    return "appointment-info" + ++i;
  });
   $("a[href^='#appointment-info']").attr('href', function(i) {
    return "#appointment-info" + ++i;
  });

  $("div[id^='claim-info']").attr('id', function(i) {
    return "claim-info" + ++i;
  });
  $("a[href^='#claim-info']").attr('href', function(i) {
    return "#claim-info" + ++i;
  });

  $("div[id^='contact-info']").attr('id', function(i) {
    return "contact-info" + ++i;
  });
  $("a[href^='#contact-info']").attr('href', function(i) {
    return "#contact-info" + ++i;
  });

  $("div[id^='prerecon-info']").attr('id', function(i) {
    return "prerecon-info" + ++i;
  });
  $("a[href^='#prerecon-info']").attr('href', function(i) {
    return "#prerecon-info" + ++i;
  });

});

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
//= require bootstrap-select

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

  $("div[id^='loss-details']").attr('id', function(i) {
    return "loss-details" + ++i;
  });
  $("a[href^='#loss-details']").attr('href', function(i) {
    return "#loss-details" + ++i;
  });

  $("div[id^='mitigation-status']").attr('id', function(i) {
    return "mitigation-status" + ++i;
  });
  $("a[href^='#mitigation-status']").attr('href', function(i) {
    return "#mitigation-status" + ++i;
  });

  $("div[id^='abatement-status']").attr('id', function(i) {
    return "abatement-status" + ++i;
  });
  $("a[href^='#abatement-status']").attr('href', function(i) {
    return "#abatement-status" + ++i;
  });

  $("div[id^='allNotes']").attr('id', function(i) {
    return "allNotes" + ++i;
  });
  $("a[href^='#allNotes']").attr('href', function(i) {
    return "#allNotes" + ++i;
  });

  dataConfirmModal.setDefaults({
  title: 'DockIt',
  commit: 'Confirm',
  cancel: 'Cancel'
  });

});


$(document).on('turbolinks:load', function() {
  //grabs the hash tag from the url
  var hash = window.location.hash;
  //checks whether or not the hash tag is set
  if (hash != "") {
    //removes all active classes from tabs
    $('#tabs li').each(function() {
      $(this).removeClass('active');
    });
    $('#myTabContent div').each(function() {
      $(this).removeClass('in active');
    });
    //this will add the active class on the hashtagged value
    var link = "";
    $('#tabs li').each(function() {
      link = $(this).find('a').attr('href');
      if (link == hash) {
        $(this).addClass('active');
      }
    });

    $('#myTabContent div').each(function() {

      link = $(this).attr('id');
      if ('#'+link == hash) {

        $(this).addClass('in active');
      }
    });
  }
});

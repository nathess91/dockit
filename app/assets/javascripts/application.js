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

  $("div[id^='original-inspection-date']").attr('id', function(i) {
    return "original-inspection-date" + ++i;
  });
  $("a[href^='#original-inspection-date']").attr('href', function(i) {
    return "#original-inspection-date" + ++i;
  });

  $("div[id^='return-inspection-date']").attr('id', function(i) {
    return "return-inspection-date" + ++i;
  });
  $("a[href^='#return-inspection-date']").attr('href', function(i) {
    return "#return-inspection-date" + ++i;
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

  $("div[id^='allNotes']").attr('id', function(i) {
    return "allNotes" + ++i;
  });
  $("a[href^='#allNotes']").attr('href', function(i) {
    return "#allNotes" + ++i;
  });

  $("div[id^='workflow-status']").attr('id', function(i) {
    return "workflow-status" + ++i;
  });
  $("a[href^='#workflow-status']").attr('href', function(i) {
    return "#workflow-status" + ++i;
  });

  $("div[id^='not-sold']").attr('id', function(i) {
    return "not-sold" + ++i;
  });
  $("a[href^='#not-sold']").attr('href', function(i) {
    return "#not-sold" + ++i;
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

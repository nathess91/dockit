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

var collapseContent = {
  'original-inspection-date' : '#original-inspection-date',
  'return-inspection-date' : 'return-inspection-date',
  'claim-info' : '#claim-info',
  'contact-info' : '#contact-info',
  'prerecon-info' : '#prerecon-info',
  'loss-details' : '#loss-details',
  'allNotes' : '#allNotes',
  'workflow-status' : '#workflow-status',
  'not-sold' : '#not-sold'
}

function incrementCollapse() {
  for (key in collapseContent) {
    $("div[id^='" + key + "']").attr('id', function(i) {
      return key + ++i;
    });
    $("a[href^='" + collapseContent[key] + "']").attr('href', function(i) {
      return collapseContent[key] + ++i;
    });
  }
}

function navigateToTab() {
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
}

$(document).on('turbolinks:load', function () {
  incrementCollapse();
  navigateToTab();
  dataConfirmModal.setDefaults({
  title: 'DockIt',
  commit: 'Confirm',
  cancel: 'Cancel'
  });
});

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
//= require_tree ./channels
//= require_self

function randomInt(min, max) {
  return Math.floor(Math.random() * (max - min + 1) + min);
};

function detectConfirmations(){
  var tables = $('table.table');
  if (tables.length > 0) {
    tables.each(function() {
      var that = $(this);
      var delay_val = randomInt(1000, 3000);

      that.find('.x-fetching').removeClass("hide");
      that.find('.x-confirmed').addClass("hide");

      that.delay(delay_val).queue(function() {
        $(this).find('.x-fetching').addClass("hide");
        $(this).find('.x-confirmed').removeClass("hide");

        $(this).addClass("table-confirmed");
      });
    });
  }
};

$(document).ready(function(){
  $('body').delegate('.x-transaction-toggle-all', 'click', function(e){
    e.preventDefault();
    $(".x-transaction-link").removeClass('hide')
  });

  $('body').delegate('.x-transaction-select', 'change', function(){
    url = $(this).find('option:selected').data('url');

    $.ajax({
      url: url,
      type: 'POST',
      dataType: 'script',
    });
  });

  detectConfirmations();
});

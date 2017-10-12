// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require jquery/dist/jquery.js
//= require bootstrap/dist/js/bootstrap.js
//= require turbolinks
//= require_tree .

//
navigator.geolocation.getCurrentPosition(function(position) {
  console.log(position.coords.latitude, position.coords.longitude);
  window.lat = position.coords.latitude;
  window.long = position.coords.longitude;
});
//
$(document).on('turbolinks:load', function() {
  $('#check-in-form').submit(function(e) {
    e.preventDefault();
    var form = e.target;
    console.dir(form);
    form[2].value = window.long;
    form[3].value = window.lat;
    form.submit();
  });
});
// let position = navigator.geolocation.getCurrentPosition(function(position) {
// return {latitude: position.coords.latitude, longitude: position.coords.longitude}
// });
// //
// // // position()
// //
// console.log(position;
//
//
// $('check_in').on('click', () => {
//   // $.post( '/check_in',
//   //         data: position());
// });

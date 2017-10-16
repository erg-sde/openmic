// let position = navigator.geolocation.getCurrentPosition(function(position) {
// return {latitude: position.coords.latitude, longitude: position.coords.longitude}
// });
//
// // position()
//
// console.dir(position);
//
//
// $('check_in').on('click', () => {
//   // $.post( '/check_in',
//   //         data: position());
// });
var ready, set_positions;

set_positions = function(){
    // loop through and give each task a data-pos
    // attribute that holds its position in the DOM
    $('.panel.panel-default').each(function(i){
        $(this).attr("data-pos",i+1);
    });
}

ready = function(){

  // call set_positions function
set_positions();
    // call sortable on our div with the sortable class

    sortable('.sortable');
}

$(document).ready(ready);
/**
 * if using turbolinks
 */
$(document).on('page:load', ready);

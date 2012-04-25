/**
 * Global Variables
 **/
var errorsTabsSelector = '#errors_tabs';

/**
 * errorsTabsHandler
 **/
function errorsTabsHandler( $, options ) {
  $( errorsTabsSelector ).tabs( options );
}

/**
 * showErrorButtonsHandler
 **/
function showErrorButtonsHandler( $ ) {
  $( 'button[id^="show_error"]' ).button( {
    text : false,
    icons : {
      primary : 'ui-icon-info'
    }
  } ).bind( 'mousedown', {
    isADialog : true,
    options : {
      modal : true
    }
  }, buttonMouseDownHandler );
}

/**
 * deleteErrorButtonsHandler
 **/
function deleteErrorButtonsHandler( $ ) {
  $( 'button[id^="delete_error"]' ).button( {
    text : false,
    icons : {
      primary : 'ui-icon-trash'
    }
  } ).bind( 'mousedown', {
    
  }, buttonMouseDownHandler );
}

/**
 * destroyErrorButtonsHandler
 **/
function destroyErrorButtonsHandler( $ ) {
  $( 'button[id^="destroy_error"]' ).button( {
    icons : {
      primary : 'ui-icon-trash'
    }
  } ).bind( 'mousedown', {
    data : {
      _method : 'delete'
    }
  }, buttonMouseDownHandler );
}

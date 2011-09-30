// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults

// Function to handle the mousedown event on the buttons.
function buttonMouseDownHandler( eventObject ) {
  if ( typeof( eventObject.data.callback ) === 'function' ) {
    eventObject.data.callback( eventObject );
  } else if ( typeof( eventObject.data.url ) === 'string' ) {
    if ( eventObject.data.isAJAX ) {
      jQuery.get( eventObject.data.url, eventObject.data.data, function( data, textStatus, jqXHR ) {
        jQuery( '#content' ).html( data );
      } );
    } else if ( eventObject.data.isADialog ) {
      var dialog = jQuery( '#dialog' );
      
      if ( dialog.length < 1 ) {
        dialog = jQuery( '<div id="dialog" style="display:none;"></div>' );
      }
      
      dialog.load( eventObject.data.url, eventObject.data.data, function( responseText, textStatus, XMLHttpRequest ) {
        dialog.dialog();
      } );
    } else { // eventObject.data.actAsLink
      window.location.href = eventObject.data.url;
    }
  }
}

// Function to handle the mousedown event on the menu buttons.
function menuButtonMouseDownHandler( eventObject ) {
  if ( eventObject.data.hasMenuItems ) {
    var menuItems = jQuery( '#menu_items_for_menu' + eventObject.data.id );
    
    if ( menuItems.length > 0 ) {
      
    } else {
      
    }
  } else {
    buttonMouseDownHandler( eventObject );
  }
}
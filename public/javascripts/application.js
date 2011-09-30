// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults

// Function to handle the mousedown event on the buttons.
function buttonMouseDownHandler( eventObject ) {
  if ( eventObject.data.actAsLink ) {
    window.location.href = eventObject.data.url;
  } else if ( eventObject.data.isADialog ) {
    
  } else {
    
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
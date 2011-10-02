// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults

// Function to handle the mousedown event on the buttons.
function buttonMouseDownHandler( eventObject ) {
  if ( typeof( eventObject.data.callback ) === 'function' ) {
    eventObject.data.callback( eventObject );
  } else if ( typeof( eventObject.data.url ) === 'string' ) {
    var data = jQuery.extend( { isAJAX : eventObject.data.isAJAX, isADialog : eventObject.data.isADialog }, eventObject.data.data );
    
    for ( key in eventObject.data.attributes ) {
      data[ key ] = this.getAttribute( eventObject.data.attributes[ key ] );
    }
    
    if ( eventObject.data.isAJAX || eventObject.data.isADialog ) {
      jQuery.ajax( {
        url : eventObject.data.url,
        data : data,
        type : eventObject.data.type,
        success : function( data, textStatus, jqXHR ) {
          if ( typeof( eventObject.data.success ) === 'function' ) {
            eventObject.data.success( data, textStatus, jqXHR );
          } else {
            if ( textStatus === 'success' ) {
              if ( eventObject.data.isAJAX ) {
                var selector = ( typeof( eventObject.data.selector ) === 'string' ) ? eventObject.data.selector : '#content';
                
                jQuery( selector ).html( data );
              } else { // eventObject.data.isADialog
                var dialog = jQuery( '#dialog' );
                
                if ( dialog.length < 1 ) {
                  dialog = jQuery( '<div id="dialog" style="display:none;"></div>' );
                }
                
                dialog.html( data ).dialog( eventObject.data.options );
              }
            }
          }
        },
        error : function( jqXHR, textStatus, errorThrown ) {
          if ( typeof( eventObject.data.error ) === 'function' ) {
            eventObject.data.error( jqXHR, textStatus, errorThrown );
          } else {
            var dialog = jQuery( '#dialog' );
            
            if ( dialog.length < 1 ) {
              dialog = jQuery( '<div id="dialog" style="display:none;"></div>' );
            }
            
            dialog.html( errorThrown ).dialog( {
              title : 'Error',
              resizable : false
            } );
          }
        }
      } );
    } else { // eventObject.data.actAsLink
      var rquery = /\?/;
      var params = ( rquery.test( eventObject.data.url ) ? '&' : '?' ) + jQuery.param( data, jQuery.ajaxSettings.traditional );
      
      window.location.href = eventObject.data.url + params;
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
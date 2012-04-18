/**
 * menusTabsHandler
 **/
function menusTabsHandler( $, options ) {
  $( '#menus_tabs' ).tabs( options );
}

/**
 * showMenuButtonsHandler
 **/
function showMenuButtonsHandler( $ ) {
  $( 'button[id^="show_menu"]' ).button( {
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
 * editMenuButtonsHandler
 **/
function editMenuButtonsHandler( $ ) {
  $( 'button[id^="edit_menu"]' ).button( {
    text : false,
    icons : {
      primary : 'ui-icon-pencil'
    }
  } ).bind( 'mousedown', {
    
  }, buttonMouseDownHandler );
}

/**
 * deleteMenuButtonsHandler
 **/
function deleteMenuButtonsHandler( $ ) {
  $( 'button[id^="delete_menu"]' ).button( {
    text : false,
    icons : {
      primary : 'ui-icon-trash'
    }
  } ).bind( 'mousedown', {
    data : {
      _method : 'delete'
    }
  }, buttonMouseDownHandler );
}

/**
 * destroyMenuButtonsHandler
 **/
function destroyMenuButtonsHandler( $ ) {
  $( 'button[id^="destroy_menu"]' ).button( {
    icons : {
      primary : 'ui-icon-trash'
    }
  } ).bind( 'mousedown', {
    data : {
      _method : 'delete'
    }
  }, buttonMouseDownHandler );
}

/**
 * menusFormValidations
 **/
function menusFormValidations( $, as_a ) {
  if ( $().validate ) {
    var formSelector = ( as_a === 'new' ) ? '#new_menu' : '.edit_menu';
    
    $( formSelector ).validate( {
      rules : {
        'menu[name]' : {
          required : true
        }
      }
    } );
  } else {
    $.getScript( jQueryValidationUrl, function( data, textStatus ) {
      menusFormValidations( $, as_a );
    } );
  }
}

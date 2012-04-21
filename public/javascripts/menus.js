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
    
  }, buttonMouseDownHandler );
}

/**
 * updateMenuButtonsHandler
 **/
function updateMenuButtonsHandler( $ ) {
  $( 'button[id^="update_menu"]' ).button( {
    icons : {
      primary : 'ui-icon-check'
    }
  } ).bind( 'mousedown', {
    
  }, buttonMouseDownHandler );
}

/**
 * createMenuButtonsHandler
 **/
function createMenuButtonsHandler( $ ) {
  $( '#create_menu' ).button( {
    icons : {
      primary : 'ui-icon-check'
    }
  } ).bind( 'mousedown', {
    
  }, buttonMouseDownHandler );
}

/**
 * createAndAddAnotherMenuButtonsHandler
 **/
function createAndAddAnotherMenuButtonsHandler( $ ) {
  $( '#create_and_add_another_menu' ).button( {
    
  } ).bind( 'mousedown', {
    
  }, buttonMouseDownHandler );
}

/**
 * createAndEditMenuButtonsHandler
 **/
function createAndEditMenuButtonsHandler( $ ) {
  $( '#create_and_edit_menu' ).button( {
    
  } ).bind( 'mousedown', {
    
  }, buttonMouseDownHandler );
}

/**
 * cancelMenuButtonsHandler
 **/
function cancelMenuButtonsHandler( $ ) {
  $( '#cancel_menu' ).button( {
    icons : {
      primary : 'ui-icon-closethick'
    }
  } ).bind( 'mousedown', {
    
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

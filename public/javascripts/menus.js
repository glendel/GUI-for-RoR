/**
 * Global Variables
 **/
var menusTabsSelector = '#menus_tabs';

/**
 * menusTabsHandler
 **/
function menusTabsHandler( $, options ) {
  $( menusTabsSelector ).tabs( options );
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
 * saveMenuButtonsHandler
 **/
function saveMenuButtonsHandler( $ ) {
  $( '#save_menu' ).button( {
    icons : {
      primary : 'ui-icon-check'
    }
  } ).bind( 'mousedown', {
    
  }, buttonMouseDownHandler );
}

/**
 * saveAndAddAnotherMenuButtonsHandler
 **/
function saveAndAddAnotherMenuButtonsHandler( $ ) {
  $( '#save_and_add_another_menu' ).button( {
    
  } ).bind( 'mousedown', {
    
  }, buttonMouseDownHandler );
}

/**
 * saveAndEditMenuButtonsHandler
 **/
function saveAndEditMenuButtonsHandler( $ ) {
  $( '#save_and_edit_menu' ).button( {
    
  } ).bind( 'mousedown', {
    
  }, buttonMouseDownHandler );
}

/**
 * cancelMenuButtonsHandler
 **/
function cancelMenuButtonsHandler( $, as_a ) {
  $( '#cancel_menu' ).button( {
    icons : {
      primary : 'ui-icon-closethick'
    }
  } ).bind( 'mousedown', {
    callback : function( eventObject ) {
      if ( as_a === 'new' ) {
        $( menusTabsSelector ).tabs( 'select', 0 );
      } else if ( as_a === 'edit' ) {
        $( menusTabsSelector ).tabs( 'select', 1 );
      }
    }
  }, buttonMouseDownHandler ).bind( 'click', {
    
  }, function( eventObject ) {
    return( false );
  } );
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

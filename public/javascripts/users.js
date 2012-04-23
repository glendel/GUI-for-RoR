/**
 * Global Variables
 **/
var usersTabsSelector = '#users_tabs';

/**
 * usersTabsHandler
 **/
function usersTabsHandler( $, options ) {
  $( usersTabsSelector ).tabs( options );
}

/**
 * showUserButtonsHandler
 **/
function showUserButtonsHandler( $ ) {
  $( 'button[id^="show_user"]' ).button( {
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
 * editUserButtonsHandler
 **/
function editUserButtonsHandler( $ ) {
  $( 'button[id^="edit_user"]' ).button( {
    text : false,
    icons : {
      primary : 'ui-icon-pencil'
    }
  } ).bind( 'mousedown', {
    
  }, buttonMouseDownHandler );
}

/**
 * deleteUserButtonsHandler
 **/
function deleteUserButtonsHandler( $ ) {
  $( 'button[id^="delete_user"]' ).button( {
    text : false,
    icons : {
      primary : 'ui-icon-trash'
    }
  } ).bind( 'mousedown', {
    
  }, buttonMouseDownHandler );
}

/**
 * saveUserButtonsHandler
 **/
function saveUserButtonsHandler( $ ) {
  $( '#save_user' ).button( {
    icons : {
      primary : 'ui-icon-check'
    }
  } ).bind( 'mousedown', {
    
  }, buttonMouseDownHandler );
}

/**
 * saveAndAddAnotherUserButtonsHandler
 **/
function saveAndAddAnotherUserButtonsHandler( $ ) {
  $( '#save_and_add_another_user' ).button( {
    
  } ).bind( 'mousedown', {
    
  }, buttonMouseDownHandler );
}

/**
 * saveAndEditUserButtonsHandler
 **/
function saveAndEditUserButtonsHandler( $ ) {
  $( '#save_and_edit_user' ).button( {
    
  } ).bind( 'mousedown', {
    
  }, buttonMouseDownHandler );
}

/**
 * cancelUserButtonsHandler
 **/
function cancelUserButtonsHandler( $, as_a ) {
  $( '#cancel_user' ).button( {
    icons : {
      primary : 'ui-icon-closethick'
    }
  } ).bind( 'mousedown', {
    callback : function( eventObject ) {
      if ( as_a === 'new' ) {
        $( usersTabsSelector ).tabs( 'select', 0 );
      } else if ( as_a === 'edit' ) {
        $( usersTabsSelector ).tabs( 'select', 1 );
      }
    }
  }, buttonMouseDownHandler ).bind( 'click', {
    
  }, function( eventObject ) {
    return( false );
  } );
}

/**
 * destroyUserButtonsHandler
 **/
function destroyUserButtonsHandler( $ ) {
  $( 'button[id^="destroy_user"]' ).button( {
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
 * usersFormValidations
 **/
function usersFormValidations( $, as_a ) {
  if ( $().validate ) {
    var formSelector = ( as_a === 'new' ) ? '#new_user' : '.edit_user';
    
    $( formSelector ).validate( {
      rules : {
        'user[username]' : {
          required : true
        },
        'user[email]' : {
          required : true
        }
      }
    } );
  } else {
    $.getScript( jQueryValidationUrl, function( data, textStatus ) {
      usersFormValidations( $, as_a );
    } );
  }
}

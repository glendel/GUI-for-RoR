/**
 * usersTabsHandler
 **/
function usersTabsHandler( $, options ) {
  $( '#users_tabs' ).tabs( options );
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
 * updateUserButtonsHandler
 **/
function updateUserButtonsHandler( $ ) {
  $( 'button[id^="update_user"]' ).button( {
    icons : {
      primary : 'ui-icon-check'
    }
  } ).bind( 'mousedown', {
    
  }, buttonMouseDownHandler );
}

/**
 * createUserButtonsHandler
 **/
function createUserButtonsHandler( $ ) {
  $( '#create_user' ).button( {
    icons : {
      primary : 'ui-icon-check'
    }
  } ).bind( 'mousedown', {
    
  }, buttonMouseDownHandler );
}

/**
 * createAndAddAnotherUserButtonsHandler
 **/
function createAndAddAnotherUserButtonsHandler( $ ) {
  $( '#create_and_add_another_user' ).button( {
    
  } ).bind( 'mousedown', {
    
  }, buttonMouseDownHandler );
}

/**
 * createAndEditUserButtonsHandler
 **/
function createAndEditUserButtonsHandler( $ ) {
  $( '#create_and_edit_user' ).button( {
    
  } ).bind( 'mousedown', {
    
  }, buttonMouseDownHandler );
}

/**
 * cancelUserButtonsHandler
 **/
function cancelUserButtonsHandler( $ ) {
  $( '#cancel_user' ).button( {
    icons : {
      primary : 'ui-icon-closethick'
    }
  } ).bind( 'mousedown', {
    
  }, buttonMouseDownHandler );
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

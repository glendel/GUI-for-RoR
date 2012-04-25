class ErrorsController < ApplicationController
  load_and_authorize_resource
  
  # GET /errors
  # GET /errors.xml
  def index
    list
  end
  
  # GET /errors
  # GET /errors.xml
  def list
    @errors = Error.all
    
    respond_to do |format|
      format.html {
        if ( request.xhr? )
          render( { :partial => 'list', :locals => { :errors => @errors } } ) # _list.html.erb
        else
          render( { :action => 'list' } ) # list.html.erb
        end
      }
      format.xml  { render( { :xml => @errors } ) }
    end
  end
  
  # GET /errors/1
  # GET /errors/1.xml
  def show
    @error = Error.find( params[:id] )
    
    respond_to do |format|
      format.html {
        if ( request.xhr? )
          render( { :partial => 'show', :locals => { :error => @error } } ) # _show.html.erb
        else
          render( { :action => 'show' } ) # show.html.erb
        end
      }
      format.xml  { render( { :xml => @error } ) }
    end
  end
  
  # GET /errors/1/delete
  def delete
    @error = Error.find( params[:id] )
    
    respond_to do |format|
      format.html {
        if ( request.xhr? )
          render( { :partial => 'delete', :locals => { :error => @error } } ) # _delete.html.erb
        else
          render( { :action => 'delete' } ) # delete.html.erb
        end
      }
    end
  end
  
  # DELETE /errors/1
  # DELETE /errors/1.xml
  def destroy
    @error = Error.find( params[:id] )
    @error.destroy
    
    respond_to do |format|
      format.html { redirect_to( errors_url ) }
      format.xml  { head( :ok ) }
    end
  end
end

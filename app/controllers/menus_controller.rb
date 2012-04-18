class MenusController < ApplicationController
  load_and_authorize_resource
  
  # GET /menus
  # GET /menus.xml
  def index
    list
  end
  
  # GET /menus
  # GET /menus.xml
  def list
    @menus = Menu.all
    
    respond_to do |format|
      format.html {
        if ( request.xhr? )
          render( { :partial => 'list', :locals => { :menus => @menus } } ) # _list.html.erb
        else
          render( { :action => 'list' } ) # list.html.erb
        end
      }
      format.xml  { render( { :xml => @menus } ) }
    end
  end
  
  # GET /menus/1
  # GET /menus/1.xml
  def show
    @menu = Menu.find( params[:id] )
    
    respond_to do |format|
      format.html {
        if ( request.xhr? )
          render( { :partial => 'show', :locals => { :menu => @menu } } ) # _show.html.erb
        else
          render( { :action => 'show' } ) # show.html.erb
        end
      }
      format.xml  { render( { :xml => @menu } ) }
    end
  end
  
  # GET /menus/new
  # GET /menus/new.xml
  def new
    @menu = Menu.new
    
    respond_to do |format|
      format.html {
        if ( request.xhr? )
          render( { :partial => 'new', :locals => { :menu => @menu } } ) # _new.html.erb
        else
          render( { :action => 'new' } ) # new.html.erb
        end
      }
      format.xml  { render( { :xml => @menu } ) }
    end
  end
  
  # GET /menus/1/edit
  def edit
    @menu = Menu.find( params[:id] )
    
    respond_to do |format|
      format.html {
        if ( request.xhr? )
          render( { :partial => 'edit', :locals => { :menu => @menu } } ) # _edit.html.erb
        else
          render( { :action => 'edit' } ) # edit.html.erb
        end
      }
    end
  end
  
  # GET /menus/1/delete
  def delete
    @menu = Menu.find( params[:id] )
    
    respond_to do |format|
      format.html {
        if ( request.xhr? )
          render( { :partial => 'delete', :locals => { :menu => @menu } } ) # _delete.html.erb
        else
          render( { :action => 'delete' } ) # delete.html.erb
        end
      }
    end
  end
  
  # POST /menus
  # POST /menus.xml
  def create
    @menu = Menu.new( params[:menu] )
    
    respond_to do |format|
      if ( @menu.save )
        format.html { redirect_to( @menu, { :notice => 'Menu was successfully created.' } ) }
        format.xml  { render( { :xml => @menu, :status => :created, :location => @menu } ) }
      else
        format.html { render( { :action => 'new' } ) }
        format.xml  { render( { :xml => @menu.errors, :status => :unprocessable_entity } ) }
      end
    end
  end
  
  # PUT /menus/1
  # PUT /menus/1.xml
  def update
    @menu = Menu.find( params[:id] )
    
    respond_to do |format|
      if ( @menu.update_attributes( params[:menu] ) )
        format.html { redirect_to( @menu, { :notice => 'Menu was successfully updated.' } ) }
        format.xml  { head( :ok ) }
      else
        format.html { render( { :action => 'edit' } ) }
        format.xml  { render( { :xml => @menu.errors, :status => :unprocessable_entity } ) }
      end
    end
  end
  
  # DELETE /menus/1
  # DELETE /menus/1.xml
  def destroy
    @menu = Menu.find( params[:id] )
    @menu.destroy
    
    respond_to do |format|
      format.html { redirect_to( menus_url ) }
      format.xml  { head( :ok ) }
    end
  end
end

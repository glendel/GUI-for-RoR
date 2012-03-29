class UsersController < ApplicationController
  load_and_authorize_resource
  
  # GET /users
  # GET /users.xml
  def index
    list
  end
  
  # GET /users
  # GET /users.xml
  def list
    @users = User.all

    respond_to do |format|
      format.html {
        if ( request.xhr? )
          render( { :partial => 'list', :locals => { :users => @users } } ) # _list.html.erb
        else
          render( { :action => 'list' } ) # list.html.erb
        end
      }
      format.xml  { render :xml => @users }
    end
  end

  # GET /users/1
  # GET /users/1.xml
  def show
    @user = User.find( params[:id] )

    respond_to do |format|
      format.html {
        if ( request.xhr? )
          render( { :partial => 'show', :locals => { :user => @user } } ) # _show.html.erb
        else
          render( { :action => 'show' } ) # show.html.erb
        end
      }
      format.xml  { render :xml => @user }
    end
  end

  # GET /users/new
  # GET /users/new.xml
  def new
    @user = User.new

    respond_to do |format|
      format.html {
        if ( request.xhr? )
          render( { :partial => 'new', :locals => { :user => @user } } ) # _new.html.erb
        else
          render( { :action => 'new' } ) # new.html.erb
        end
      }
      format.xml  { render :xml => @user }
    end
  end

  # GET /users/1/edit
  def edit
    @user = User.find( params[:id] )
    
    respond_to do |format|
      format.html {
        if ( request.xhr? )
          render( { :partial => 'edit', :locals => { :user => @user } } ) # _edit.html.erb
        else
          render( { :action => 'edit' } ) # edit.html.erb
        end
      }
    end
  end
  
  # GET /users/1/delete
  def delete
    @user = User.find( params[:id] )
    
    respond_to do |format|
      format.html {
        if ( request.xhr? )
          render( { :partial => 'delete', :locals => { :user => @user } } ) # _delete.html.erb
        else
          render( { :action => 'delete' } ) # delete.html.erb
        end
      }
    end
  end
  
  # POST /users
  # POST /users.xml
  def create
    @user = User.new(params[:user])

    respond_to do |format|
      if @user.save
        format.html { redirect_to(@user, :notice => 'User was successfully created.') }
        format.xml  { render :xml => @user, :status => :created, :location => @user }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @user.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /users/1
  # PUT /users/1.xml
  def update
    @user = User.find(params[:id])

    respond_to do |format|
      if @user.update_attributes(params[:user])
        format.html { redirect_to(@user, :notice => 'User was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @user.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.xml
  def destroy
    @user = User.find(params[:id])
    @user.destroy

    respond_to do |format|
      format.html { redirect_to(users_url) }
      format.xml  { head :ok }
    end
  end
end

class MenuItemsController < ApplicationController
  load_and_authorize_resource
  
  # GET /menu_items
  # GET /menu_items.xml
  def index
    list
  end
  
  # GET /menu_items
  # GET /menu_items.xml
  def list
    if ( params.has_key?( :menu_id ) )
      @menu_items = Menu.find( params[:menu_id] ).menu_items
    elsif ( params.has_key?( :menu_item_id ) )
      @menu_items = MenuItem.find( params[:menu_item_id] ).menu_items
    else
      @menu_items = MenuItem.all
    end

    respond_to do |format|
      format.html { render( :list ) }# list.html.erb
      format.js { render( :list ) }# list.js.erb
      format.xml  { render :xml => @menu_items }
    end
  end

  # GET /menu_items/1
  # GET /menu_items/1.xml
  def show
    @menu_item = MenuItem.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @menu_item }
    end
  end

  # GET /menu_items/new
  # GET /menu_items/new.xml
  def new
    @menu_item = MenuItem.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @menu_item }
    end
  end

  # GET /menu_items/1/edit
  def edit
    @menu_item = MenuItem.find(params[:id])
  end

  # POST /menu_items
  # POST /menu_items.xml
  def create
    @menu_item = MenuItem.new(params[:menu_item])

    respond_to do |format|
      if @menu_item.save
        format.html { redirect_to(@menu_item, :notice => 'MenuItem was successfully created.') }
        format.xml  { render :xml => @menu_item, :status => :created, :location => @menu_item }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @menu_item.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /menu_items/1
  # PUT /menu_items/1.xml
  def update
    @menu_item = MenuItem.find(params[:id])

    respond_to do |format|
      if @menu_item.update_attributes(params[:menu_item])
        format.html { redirect_to(@menu_item, :notice => 'MenuItem was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @menu_item.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /menu_items/1
  # DELETE /menu_items/1.xml
  def destroy
    @menu_item = MenuItem.find(params[:id])
    @menu_item.destroy

    respond_to do |format|
      format.html { redirect_to(menu_items_url) }
      format.xml  { head :ok }
    end
  end
end

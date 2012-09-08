class Manual::LaboratoriesController < ApplicationController
  # GET /manual/laboratories
  # GET /manual/laboratories.json
  
  before_filter :get_subject
  before_filter :get_laboratory, :except => [:index, :new, :create]
  before_filter :get_laboratories, :only => [:index, :new, :create]
  authorize_resource :class => "Manual::Laboratory"
  
  def index

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @manual_laboratories }
    end
  end

  # GET /manual/laboratories/1
  # GET /manual/laboratories/1.json
  def show

    redirect_to manual_subject_laboratory_variants_path(@manual_subject, @manual_laboratory)
  end

  # GET /manual/laboratories/new
  # GET /manual/laboratories/new.json
  def new
    @manual_laboratory = Manual::Laboratory.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @manual_laboratory }
    end
  end

  # GET /manual/laboratories/1/edit
  def edit

  end

  # POST /manual/laboratories
  # POST /manual/laboratories.json
  def create
    @manual_laboratory = Manual::Laboratory.new(params[:manual_laboratory])
    
    @manual_laboratory.subject = @manual_subject
    
    respond_to do |format|
      if @manual_laboratory.save
        format.html { redirect_to manual_subject_laboratories_path, notice: 'Laboratory was successfully created.' }
        format.json { render json: @manual_laboratory, status: :created, location: @manual_laboratory }
      else
        format.html { render action: "new" }
        format.json { render json: @manual_laboratory.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /manual/laboratories/1
  # PUT /manual/laboratories/1.json
  def update

    respond_to do |format|
      if @manual_laboratory.update_attributes(params[:manual_laboratory])
        format.html { redirect_to manual_subject_laboratories_path, notice: 'Laboratory was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @manual_laboratory.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /manual/laboratories/1
  # DELETE /manual/laboratories/1.json
  def destroy
    @manual_laboratory.destroy

    respond_to do |format|
      format.html { redirect_to manual_subject_laboratories_path }
      format.json { head :no_content }
    end
  end
  
  private

  def get_subject
    @manual_subject = Manual::Subject.find params[:subject_id]
  end
  
  def get_laboratory
    @manual_laboratory = @manual_subject.laboratories[params[:id].to_i]
  end
  
  def get_laboratories
    @manual_laboratories = @manual_subject.laboratories
  end
end

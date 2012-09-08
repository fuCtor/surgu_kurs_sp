class Manual::VariantsController < ApplicationController
  # GET /manual/variants
  # GET /manual/variants.json
  
  before_filter :get_laboratory
  before_filter :get_variant, :except => [:index, :new, :create]
  before_filter :get_variants, :only => [:index, :new, :create]
  authorize_resource :class => "Manual::Variant"
  
  def index
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @manual_variants }
    end
  end

  # GET /manual/variants/1
  # GET /manual/variants/1.json
  def show
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @manual_variant }
    end
  end

  # GET /manual/variants/new
  # GET /manual/variants/new.json
  def new
    @manual_variant = Manual::Variant.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @manual_variant }
    end
  end

  # GET /manual/variants/1/edit
  def edit
    
  end

  # POST /manual/variants
  # POST /manual/variants.json
  def create
    @manual_variant = Manual::Variant.new(params[:manual_variant])
    @manual_variant.laboratory = @manual_laboratory
  
    respond_to do |format|
      if @manual_variant.save
        format.html { redirect_to manual_subject_laboratory_variants_path, notice: 'Variant was successfully created.' }
        format.json { render json: @manual_variant, status: :created, location: @manual_variant }
      else
        format.html { render action: "new" }
        format.json { render json: @manual_variant.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /manual/variants/1
  # PUT /manual/variants/1.json
  def update

    respond_to do |format|
      if @manual_variant.update_attributes(params[:manual_variant])
        format.html { redirect_to manual_subject_laboratory_variants_path, notice: 'Variant was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @manual_variant.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /manual/variants/1
  # DELETE /manual/variants/1.json
  def destroy
    @manual_variant.destroy

    respond_to do |format|
      format.html { redirect_to manual_subject_laboratory_variants_path }
      format.json { head :no_content }
    end
  end
  
    
  private

  def get_laboratory
    @manual_subject = Manual::Subject.find params[:subject_id]
    @manual_laboratory = @manual_subject.laboratories[params[:laboratory_id].to_i]
  end
  
  def get_variant
    @manual_variant= Manual::Variant.find(params[:id])
  end
  
  def get_variants
    @manual_variants = @manual_laboratory.variants
  end
end

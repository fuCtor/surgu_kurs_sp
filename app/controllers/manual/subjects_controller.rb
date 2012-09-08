class Manual::SubjectsController < ApplicationController
  
  load_and_authorize_resource :class => "Manual::Subject"
  
  # GET /manual/subjects
  # GET /manual/subjects.json
  def index
    @manual_subjects = Manual::Subject.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @manual_subjects }
    end
  end

  # GET /manual/subjects/1
  # GET /manual/subjects/1.json
  def show
    @manual_subject = Manual::Subject.find(params[:id])

    redirect_to manual_subject_laboratories_path(@manual_subject)
  end

  # GET /manual/subjects/new
  # GET /manual/subjects/new.json
  def new
    @manual_subject = Manual::Subject.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @manual_subject }
    end
  end

  # GET /manual/subjects/1/edit
  def edit
    @manual_subject = Manual::Subject.find(params[:id])
  end

  # POST /manual/subjects
  # POST /manual/subjects.json
  def create
    @manual_subject = Manual::Subject.new(params[:manual_subject])

    respond_to do |format|
      if @manual_subject.save
        format.html { redirect_to @manual_subject, notice: 'Subject was successfully created.' }
        format.json { render json: @manual_subject, status: :created, location: @manual_subject }
      else
        format.html { render action: "new" }
        format.json { render json: @manual_subject.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /manual/subjects/1
  # PUT /manual/subjects/1.json
  def update
    @manual_subject = Manual::Subject.find(params[:id])

    respond_to do |format|
      if @manual_subject.update_attributes(params[:manual_subject])
        format.html { redirect_to @manual_subject, notice: 'Subject was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @manual_subject.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /manual/subjects/1
  # DELETE /manual/subjects/1.json
  def destroy
    @manual_subject = Manual::Subject.find(params[:id])
    @manual_subject.destroy

    respond_to do |format|
      format.html { redirect_to manual_subjects_url }
      format.json { head :no_content }
    end
  end
end

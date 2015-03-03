class AttendencesController < ApplicationController
  include Authentication 

  before_action :set_attendence, only: [:show, :edit, :update, :destroy]
  before_filter :user_logged_in? , except: [:new , :create , :show]
  # GET /attendences
  # GET /attendences.json
  def index
    if current_user.role_id.eql?(3)
      @attendences_grid = initialize_grid(Attendence.where(user_id: current_user.id))
      #@attendences = Attendence.where(user_id: current_user.id)
    else
      @attendences_grid = initialize_grid(Attendence.all)
    end    
  end

  # GET /attendences/1
  # GET /attendences/1.json
  def show
    #present_today(current_user)
  end

  # GET /attendences/new
  def new
    @attendence = Attendence.new
  end

  # GET /attendences/1/edit
  def edit
  end

  # POST /attendences
  # POST /attendences.json
  # def create
  #   if Attendence.where (user_id: ((attendence_params.fetch('user_id') {|user_id| puts user_id}).to_i) , time_in: Date.today) 
  #     @attendence = Attendence.new(attendence_params)
  #       respond_to do |format|
  #         if @attendence.save
  #           format.html { redirect_to @attendence, notice: 'Attendence was successfully created.' }
  #           format.json { render :show, status: :created, location: @attendence }
  #         else
  #           format.html { render :new }
  #           format.json { render json: @attendence.errors, status: :unprocessable_entity }
  #         end
  #       end
  #   end    
  # end

  def create
    if !present_today(attendence_params).eql?(true)
      a=(attendence_params.fetch('user_id') {|user_id| puts user_id}).to_i
      #raise a.inspect
      render attendence_path((attendence_params.fetch('user_id') {|user_id| puts user_id}).to_i)
    else
      #raise attendence_params.inspect
      @attendence = Attendence.new(attendence_params)
      respond_to do |format|
        @attendence.save
        format.html { redirect_to @attendence, notice: 'Attendence was successfully created.' }
        format.json { render :show, status: :created, location: @attendence }
      end
    end    
  end

  # PATCH/PUT /attendences/1
  # PATCH/PUT /attendences/1.json
  def update
    respond_to do |format|
      if @attendence.update(attendence_params)
        format.html { redirect_to @attendence, notice: 'Attendence was successfully updated.' }
        format.json { render :show, status: :ok, location: @attendence }
      else
        format.html { render :edit }
        format.json { render json: @attendence.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /attendences/1
  # DELETE /attendences/1.json
  def destroy
    @attendence.destroy
    respond_to do |format|
      format.html { redirect_to attendences_url, notice: 'Attendence was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_attendence
      @attendence = Attendence.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def attendence_params
      params.require(:attendence).permit(:user_id, :time_in, :time_out)
    end

    def present_today(user)
      user_id = (user.fetch('user_id') {|user_id| puts user_id}).to_i
      if Attendence.where(user_id: user_id , time_in: Date.today)
        return true
      else
        false
      end  
    end



end

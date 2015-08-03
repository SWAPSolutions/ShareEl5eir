class ClothsController < ApplicationController
  before_action :set_cloth, only: [:show, :edit, :update, :destroy]
  before_action :get_user
  before_action :check_auth , only:[:edit , :update , :destroy]  


  # Check if the current user is logged in and is the owner of the game
  def check_auth
    if current_user == nil || @member.id != current_user.id
      redirect_to root_path , alert: "Can't Access A Game That Does not belong to you."
    end
  end

  def get_user
    @member = Member.find(params[:user_id ])
  end
  # GET /cloths
  # GET /cloths.json
  def index
    @cloths = @member.cloths
  end

  # GET /cloths/1
  # GET /cloths/1.json
  def show
  end

  # GET /cloths/new
  def new
    @cloth = @member.cloths.new
  end

  # GET /cloths/1/edit
  def edit
  end

  # POST /cloths
  # POST /cloths.json
  def create
    @cloth = @member.cloths.new(cloth_params)
    @cloth.user_id = @member.id
    @cloth.donated = false
    respond_to do |format|
      if @cloth.save
        format.html { redirect_to [@member ,@cloth] , notice: 'Cloth was successfully created.' }
        format.json { render :show, status: :created, location: @cloth }
      else
        format.html { render :new }
        format.json { render json: @cloth.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /cloths/1
  # PATCH/PUT /cloths/1.json
  def update
    respond_to do |format|
      if @cloth.update(cloth_params)
        format.html { redirect_to [@member ,@cloth], notice: 'Cloth was successfully updated.' }
        format.json { render :show, status: :ok, location: @cloth }
      else
        format.html { render :edit }
        format.json { render json: @cloth.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cloths/1
  # DELETE /cloths/1.json
  def destroy
    @cloth.destroy
    respond_to do |format|
      format.html { redirect_to cloths_url, notice: 'Cloth was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cloth
      @member = Member.find(params[:user_id])
      @cloth = @member.cloths.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def cloth_params
      params.require(:cloth).permit(:size, :color, :quantity, :description)
    end
end

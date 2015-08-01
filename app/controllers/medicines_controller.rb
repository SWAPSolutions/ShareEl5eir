class MedicinesController < ApplicationController
  before_action :set_medicine, only: [:show, :edit, :update, :destroy]
  before_action :get_user
  before_action :check_auth , only:[:edit , :update , :destroy]

    # Check if the current user is logged in and is the owner of the game
  def check_auth
    if current_user == nil || @user.id != current_user.id
      redirect_to root_path , alert: "Can't Access A Game That Does not belong to you."
    end
  end

  def get_user
    @user = User.find(params[:user_id])
  end
  # GET /medicines
  # GET /medicines.json
  def index
    @medicines = @user.medicines
  end

  # GET /medicines/1
  # GET /medicines/1.json
  def show
    @medicine = @user.medicines.find(params[:id])
  end

  # GET /medicines/new
  def new
    @medicine = @user.medicines.new
  end

  # GET /medicines/1/edit
  def edit
  end

  # POST /medicines
  # POST /medicines.json
  def create
    @medicine = @user.medicines.new(medicine_params)
    @medicine.user_id = @user.id
    @medicine.donated = false
    respond_to do |format|
      if @medicine.save
        format.html { redirect_to @medicine, notice: 'Medicine was successfully created.' }
        format.json { render :show, status: :created, location: @medicine }
      else
        format.html { render :new }
        format.json { render json: @medicine.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /medicines/1
  # PATCH/PUT /medicines/1.json
  def update
    respond_to do |format|
      if @medicine.update(medicine_params)
        format.html { redirect_to @medicine, notice: 'Medicine was successfully updated.' }
        format.json { render :show, status: :ok, location: @medicine }
      else
        format.html { render :edit }
        format.json { render json: @medicine.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /medicines/1
  # DELETE /medicines/1.json
  def destroy
    @medicine.destroy
    respond_to do |format|
      format.html { redirect_to medicines_url, notice: 'Medicine was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_medicine
      @user = User.find(params[:user_id])
      @medicine = @user.medicines.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def medicine_params
      params.require(:medicine).permit(:name, :exp_date, :concentration, :quantity, :description)
    end
end

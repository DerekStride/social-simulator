class SimulationsController < ApplicationController
  before_action :set_simulation, only: [:show, :destroy]

  def index
    @simulations = Simulation.all
  end

  def show
  end

  def new
    @simulation = Simulation.new
    @simulation.users.build
  end

  def create
    @simulation = Simulation.simulate(simulation_params)

    respond_to do |format|
      if @simulation.save
        format.html { redirect_to @simulation, notice: 'The simulation has started.' }
        format.json { render :show, status: :created, location: @simulation }
      else
        format.html { render :new }
        format.json { render json: @simulation.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @simulation.destroy
    respond_to do |format|
      format.html { redirect_to simulations_url, notice: 'The simulation was destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def set_simulation
    @simulation = Simulation.find(params[:id])
  end

  def simulation_params
    params.require(:simulation).permit(
      users_attributes: [:role, :search_strategy, :social_strategy, :quantity],
      tags_attributes: [:quantity, :avg, :stddev])
  end
end

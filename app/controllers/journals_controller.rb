class JournalsController < ApplicationController
  before_action :redirect_if_not_loggedin 

  def new
    @journal = Journal.new
  end

  def create
    @journal = Journal.new(journal_params)
    @journal.user_id = session[:user_id]

    if @journal.save
      redirect_to dashboard_path, notice: "Successfully added #{@journal.name} journal"
    else 
      render :new
    end
  end

  def edit
    @journal = Journal.find(params[:id])
  end

  def update
    @journal = Journal.find(params[:id])
    if @journal.update(journal_params)
      redirect_to dashboard_path, notice: "Successfully updated #{@journal.name} journal"
    else
      render :edit
    end
  end

  def delete
    @journal = Journal.find(params[:id])
    @journal.destroy

    redirect_to dashboard_path, notice: "Successfully deleted #{@journal.name} journal"
  end
  
  private
  
  def journal_params
    params.require(:journal).permit(:name, :description)
  end

end

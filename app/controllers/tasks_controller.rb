class TasksController < ApplicationController
  before_action :redirect_if_not_loggedin
  before_action :get_journal

  def index
    @tasks = @journal.tasks.order("created_at ASC")
  end
  
  def show
    @task = Task.find(params[:task_id])
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.create(task_params)
    @task.journal_id = params[:id]
    @task.user_id = Current.user.id
    puts params[:id]
    if @task.save
      redirect_to journals_tasks_path, notice: "Successfully add #{@task.name} task to #{@journal.name} journal"
    else 
      render :new
    end
  end

  def mark_complete
    @task = Task.find(params[:task_id])
    complete = params[:complete] == '1' ? false : true
    @task.update_attribute(:completed, complete)
    redirect_to journals_tasks_path
  end

  def edit
    @task = Task.find(params[:task_id])
    puts params[:task_id]
  end

  def update
    @task = Task.find(params[:task_id])
    if @task.update(task_params)
      redirect_to journals_tasks_path
    else
      render :edit
    end
  end

  def delete
    @task = Task.find(params[:task_id])
    @task.destroy

    redirect_to journals_tasks_path, notice: "Successfully deleted #{@task.name} from #{@journal.name} journal"
  end

  private

  def get_journal
    @journal = Journal.find(params[:id])
  end

  def task_params
    params.require(:task).permit(:name, :description, :deadline)
  end

end

class HomeController < ApplicationController
  before_action :redirect_if_not_loggedin, except: [:index]

  def index
  end

  def dashboard
    @journals = Journal.where(user_id: Current.user.id).order("created_at ASC")
    @tasks = Task.where(user_id: Current.user.id).order("created_at ASC")
    @count_completed = statistics(@journals)
  end

  def mark_complete
    @task = Task.find(params[:task_id])
    complete = params[:complete] == '1' ? false : true
    @task.update_attribute(:completed, complete)
    redirect_to dashboard_path
  end

  def new_task
    @task = Task.new
    if Current.user.journals.length == 0
      flash[:error] = "Please create a journal first"
      redirect_to journals_new_path
    end
  end

  def create_task
    @task = Task.create(create_params_task)
    @task.user_id = Current.user.id
    if @task.save
      redirect_to journals_tasks_path(@task.journal_id), notice: "Successfully add #{@task.name} task"
    else 
      # byebug
      puts 'error'
      render :new_task
    end
  end

  private

  def create_params_task
    params.require(:task).permit(:name, :description, :journal_id, :deadline, :user_id)
  end

  def statistics(journal_array)
    count = { completed: 0, not_completed: 0 }
    journals = Hash.new

    journal_array.each do |journal|
      journal_statistics = { journal_id: journal.id, completed: 0, not_completed: 0 }

      journal.tasks.each do |task|
        if task.completed
          count[:completed] += 1
          journal_statistics[:completed] += 1
        end

      #   unless task.completed
      #     count[:not_completed] += 1
      #     journal_statistics[:not_completed] += 1
      #   end
      end

      journals[journal.id] = journal_statistics
    end

    { count: count, journals: journals }
  end

end

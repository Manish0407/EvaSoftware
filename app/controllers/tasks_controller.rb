class TasksController < ApplicationController
  before_action :set_task, only: %i[edit update destroy]

  def index
    if params[:search]
      @tasks = Task.where('task_title LIKE ?', "%#{params[:search]}%").order(created_at: :desc)
    else
      @tasks = Task.all.order(created_at: :desc)
    end

    @upcoming_tasks = @tasks.where("status = ? OR status = ?", 'open', 'Re scheduled')
    @completed_tasks = @tasks.where(status: 'close')
  end

  def new
    @task = Task.new
  end

  def edit
  end

  def create
    @task = Task.new(task_params)
    if @task.save
      redirect_to tasks_path, notice: 'Task was successfully created.'
    else
      render :new
    end
  end

  def update
    if @task.update(task_params)
      redirect_to tasks_path, notice: 'Task was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @task.destroy
    redirect_to tasks_url, notice: 'Task was successfully destroyed.'
  end

  private

  def set_task
    @task = Task.find(params[:id])
  end

  def task_params
    params.require(:task).permit(:task_title, :employee_id, :task_medium, :schedule, :status, :task_description, :opportunity_id, :opportunity_stage, :contact_id)
  end
end

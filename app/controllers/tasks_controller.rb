class TasksController < ApplicationController
  before_action :set_task, only: %i[ show edit update destroy toggle_completion ]
  before_action :set_task_list, only: %i[ new edit create update ]

  # GET /tasks or /tasks.json
  def index
    @tasks = Task.all
  end

  # GET /tasks/1 or /tasks/1.json
  def show
  end

  # GET /tasks/new
  def new
    @task = Task.new
  end

  # GET /tasks/1/edit
  def edit
  end

  # POST /tasks or /tasks.json
  def create
    @task = @task_list.tasks.build(task_params)

    if @task.save
      redirect_to task_list_path(@task_list), notice: "Task was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /tasks/1 or /tasks/1.json
  def update
    if @task.update(task_params)
      redirect_to task_list_path(@task_list), notice: "Task was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /tasks/1 or /tasks/1.json
  def destroy
    @task.destroy!

    redirect_to task_list_path(@task.task_list), status: :see_other, notice: "Task was successfully destroyed."
  end

  def toggle_completion
    if @task.toggle_completion
      redirect_to task_list_path(@task.task_list), notice: "Task was successfully #{@task.completed? ? 'completed' : 'uncompleted'}."
    else
      redirect_to task_list_path(@task.task_list), alert: "Task was not #{@task.completed? ? 'completed' : 'uncompleted'}."
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_task
      @task = Task.find(params[:id])
    end

    def set_task_list
      @task_list = TaskList.find(params[:task_list_id])
    end

    # Only allow a list of trusted parameters through.
    def task_params
      params.require(:task).permit(:title, :description, :completed, :priority, :task_list_id)
    end
end

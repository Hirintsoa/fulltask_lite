class TaskListsController < ApplicationController
  before_action :set_task_list, only: %i[ show edit update destroy ]

  # GET /task_lists or /task_lists.json
  def index
    @task_lists = TaskList.all
  end

  # GET /task_lists/1 or /task_lists/1.json
  def show
    @completed = filter_params[:completed]
    @priority = filter_params[:priority]

    @tasks = @task_list.tasks
    @tasks = @tasks.where(completed: @completed) if @completed.present?
    @tasks = @tasks.where(priority: @priority) if @priority.present?
  end

  # GET /task_lists/new
  def new
    @task_list = TaskList.new
    @task_list.tasks.build
  end

  # GET /task_lists/1/edit
  def edit
  end

  # POST /task_lists or /task_lists.json
  def create
    @task_list = TaskList.new(task_list_params)

    if @task_list.save
      redirect_to @task_list, notice: "Task list was successfully created."
    else
      @task_list.tasks.build
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /task_lists/1 or /task_lists/1.json
  def update
    if @task_list.update(task_list_params)
      redirect_to @task_list, notice: "Task list was successfully updated."
    else
      @task_list.tasks.build
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /task_lists/1 or /task_lists/1.json
  def destroy
    if @task_list.tasks.incomplete.exists?
      redirect_to task_list_path(@task_list), alert: "Task list cannot be deleted because it has incomplete tasks."
      return
    end

    if @task_list.destroy
      redirect_to root_path, status: :see_other, notice: "Task list was successfully deleted."
    else
      redirect_to task_list_path(@task_list), status: :server_error, alert: "Task list deletion failed."
    end
  end

  private
    def set_task_list
      @task_list = TaskList.includes(:tasks).find(params[:id])
    end

    def task_list_params
      params.require(:task_list).permit(:title, :description, tasks_attributes: [:title, :description, :priority, :completed])
    end

    def filter_params
      params.permit(:completed, :priority)
    end
end

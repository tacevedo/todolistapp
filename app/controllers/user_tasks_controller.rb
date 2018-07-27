class UserTasksController < ApplicationController
  def create
    @task = Task.find(params[:task_id])
    @usertask = UserTask.create(task: @task, user: current_user)
    if @usertask.save
      redirect_to tasks_path, notice: 'Se ha completado la tarea'
    else
      redirect_to tasks_path, notice: 'NO Se ha podido marcar como completada la tarea'
    end
  end

  def update
    @usertask = UserTask.find(params[:id])
    puts "paraaaams -------------"
    puts params
    @usertask.update(usertask_params)
    redirect_to tasks_path
  end

  private
  def usertask_params
    params.require(:user_tasks).permit(:user_id, :task_id, :completed)
  end
end

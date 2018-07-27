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
end

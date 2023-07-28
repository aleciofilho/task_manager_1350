class TasksController
  def initialize(task_repository)
    @repo = task_repository
    @view = View.new
  end


  def add
    # aks for task description
    description = @view.ask_for_description
    
    # instantiate task
    task = Task.new(description)

    # add to repo
    @repo.create(task)

    # feedback 
    # @view.success
  end

  def display
    # get tasks from repo
    tasks = @repo.all

    # display all tasks (ask view)
    @view.display_tasks(tasks)
  end

  def mark_as_done
    # display tasks again
    display

    # aks user to choose a task to mark
    index = @view.ask_for_index

    # mark task as done 
    task = @repo.find(index)

    # task needs a way to be marked as done
    # task.mark_as_done!
    @repo.mark_as_done(task)

    # feedback 
    # @view.success
  end

end
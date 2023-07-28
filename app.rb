require "csv"
require_relative 'task'
require_relative 'task_repository'
require_relative 'view'
require_relative 'tasks_controller'
require_relative 'router'

csv_path = "tasks.csv"
task_repo = TaskRepository.new(csv_path)
tasks_controller = TasksController.new(task_repo)
router = Router.new(tasks_controller)

router.run
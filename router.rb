
class Router
  def initialize(tasks_controller)
    @tasks_controller = tasks_controller
  end

  def run
    puts "Welcome to Task Manager"

    loop do
      puts "\nChoose an option:"
      puts "1. List all tasks"
      puts "2. Create a task"
      puts "3. Mark a task as done"
      puts "4. Exit"
      print "> "

      user_choice = gets.chomp.to_i

      case user_choice
      when 1
        @tasks_controller.display
      when 2
        @tasks_controller.add
      when 3
        @tasks_controller.mark_as_done
      when 4
        puts "Goodbye!"
        break
      else
        puts "Not a valid option"
      end
    end
  end
end
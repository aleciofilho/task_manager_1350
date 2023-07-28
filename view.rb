class View
  def initialize
  end

  def ask_for_description
    puts "What is the task description?"
    gets.chomp
  end

  def display_tasks(tasks)
    tasks.each_with_index do |task, i|
      x = task.done? ? "x" : " " 
      puts "#{i + 1}. [#{x}] - #{task.description}"
    end 
  end

  def ask_for_index
    puts "Please select the task you want to mark as done (enter index):"
    gets.chomp.to_i - 1 
  end

end
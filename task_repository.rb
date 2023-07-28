class TaskRepository
  def initialize(csv_path)
    @csv_path = csv_path
    @tasks = []
    load_csv
  end

  def create(task)
    @tasks << task
    save_csv
  end

  def all
    @tasks
  end

  def find(index)
    @tasks[index]
  end

  def mark_as_done(task)
    task.mark_as_done!
    save_csv
  end

  private

  def load_csv    
    CSV.foreach(@csv_path) do |row|
      # Here, row is an array of columns
      # puts "#{row[0]} | #{row[1]} | #{row[2]}"
      description = row[0]
      done = row[1] == "true"
      task = Task.new(description)
      task.mark_as_done! if done
      @tasks << task
    end
  end

  def save_csv
    CSV.open(@csv_path, "wb") do |csv|
      @tasks.each do |task|
        csv << [task.description, task.done?]
      end 
    end
  end

end
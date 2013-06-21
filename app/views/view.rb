module View 
  def self.print_list(task, task_id, description)
      puts "#{task_id}. [ ] #{description}" if task.completed_at.nil?
      puts "#{task_id}. [X] #{description}" if task.completed_at
  end

  def self.feedback(cmd_name)
    puts "Task #{cmd_name}!"
  end
end

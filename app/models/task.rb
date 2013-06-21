# require_relative '../../todo'


module View 
  def self.print_list(task, task_id, description)
      puts "#{task_id}. [ ] #{description}" if task.completed_at.nil?
      puts "#{task_id}. [X] #{description}" if task.completed_at
  end

  def self.feedback(cmd_name)
    puts "Task #{cmd_name}!"
  end
end


class Task < ActiveRecord::Base

  def self.list(_args)
    self.all.each do |task|
      View.print_list(task, task.id, task.description)
    end
  end

  def self.add(description_arr)
    self.create(description: description_arr.join(' '))
    View.feedback('added')
  end

  def self.delete(id_arr)
    super
    View.feedback('deleted')
  end

  def self.complete(id_arr)
    self.find_by_id(id_arr.first).update_attributes(completed_at: Time.now)
    View.feedback('completed')
  end

end


  # case ARGV[0]
  # when 'list' then Task.list
  # when 'add'  then View.feedback(Task.create(description: ARGV[1..-1].join(' ')), 'Added')
  # when 'delete' then View.feedback(Task.delete(ARGV[1..-1]),'Deleted')
  # when 'complete' then View.feedback(Task.find_by_id(ARGV[1..-1]).update_attributes(completed_at: Time.now), 'Completed')
  # end

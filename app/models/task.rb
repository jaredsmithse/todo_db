require_relative '../views/view'

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

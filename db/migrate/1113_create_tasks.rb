require_relative '../../config/application'

class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |task|
      task.text :description
      task.date :completed_at
      task.timestamps
    end
  end

end

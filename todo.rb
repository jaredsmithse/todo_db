require_relative 'config/application'
require 'date'

  case ARGV[0]
  when 'list' then Task.all.print_list
  when 'add'  then Task.create!(description: ARGV[1..-1])
  when 'delete' then Task.delete(ARGV[1..-1])
  when 'complete' then Task.update_attributes(completed_at: Time.now)
  end


module View
  def print_list
    
  end

  def feedback
    
  end

end

class Task < ActiveRecord::Base
  belongs_to :task_list
  validates_presence_of :name, {message: "Your task could not be created"}

  def parse_due_date(due_date)
    if due_date
      string_date = due_date.to_s
      string_date.to_date
    end
  end

    def empty?
      attributes.values.compact.empty?
    end
  end



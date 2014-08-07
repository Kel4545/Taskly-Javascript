class Task < ActiveRecord::Base
  belongs_to :task_list
  validates_presence_of :name, {message: "Your task could not be created"}
  end

class TodoItem < ActiveRecord::Base
  belongs_to :todo_list

  validates :content, :presence => true
  validates :content, :length => { minimum: 3 }


  def completed?
    !completed_at.blank?
  end
end

class FigureTitle < ActiveRecord::Base
  belongs_to :figure, :class_name => 'Figure', :foreign_key => 'figure_id'
  belongs_to :title, :class_name => 'Title', :foreign_key => 'title_id'
end

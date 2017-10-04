class Figure < ActiveRecord::Base
   has_many :landmarks
   has_many :figure_titles
   has_many :titles, through: :figure_titles

   def slug
       self.name.downcase.strip.gsub(' ', '-').gsub(/[^\w-]/, '')
     end

     def self.find_by_slug(slug)
       self.all.each do |instance|
         if instance.slug == slug
           return instance
         end
       end
     end


end

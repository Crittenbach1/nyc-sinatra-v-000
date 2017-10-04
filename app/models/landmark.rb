class Landmark < ActiveRecord::Base
   belongs_to :figure

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

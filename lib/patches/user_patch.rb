module Todos
	module UserPatch
		def self.included(base) # :nodoc:
			base.class_eval do
				unloadable # Send unloadable so it will not be unloaded in development
				has_many :todos, :as => :todoable, :dependent => :destroy

				#A user can 
				has_many :authored_todos, :class_name => 'Todo', :foreign_key => 'author_id', :order => 'position'
				has_many :assigned_todos, :class_name => 'Todo', :foreign_key => 'assigned_to_id', :order => 'position'

				#define a method to get the todos belonging to this user by UNIONing the above two collections
				def my_todos
					self.authored_todos | self.assigned_todos
				end
			end
		end
	end
end

unless User.included_modules.include?(Todos::UserPatch)
  User.send(:include, Todos::UserPatch)
end

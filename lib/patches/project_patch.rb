module Todos
	module ProjectPatch
		def self.included(base) # :nodoc:
			base.class_eval do
				unloadable
				has_many :todos, :as => :todoable, :dependent => :destroy
			end
		end
	end
end

unless Project.included_modules.include?(Todos::ProjectPatch)
  Project.send(:include, Todos::ProjectPatch)
end

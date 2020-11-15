module Slugifiable
    module InstanceMethods
        def slug 
            self.name.parameterize
        end
    end

    module ClassMethods
        def find_by_slug(slug)
            self.find do |thingy|
                thingy.name.parameterize == slug
            end
        end
    end
end

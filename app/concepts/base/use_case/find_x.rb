module UseCase
    module Base 
        class FindX < ::UseCase::Base::Base
        
            def call(id)
                repository.find_by(id)
            end
            
        end
    end
  end
  
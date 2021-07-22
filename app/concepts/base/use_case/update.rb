module UseCase
    module Base 
        class Update < ::UseCase::Base::Base
        
            def call(params)
                repository.update(params)
            end
            
        end
    end
end
  
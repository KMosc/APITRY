module UseCase
    module Base 
        class Create < ::UseCase::Base::Base
        
            def call(params)
                repository.create(params)
            end
            
        end
    end
  end
  
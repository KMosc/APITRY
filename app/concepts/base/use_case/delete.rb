module UseCase
    module Base 
        class Delete < ::UseCase::Base::Base
        
            def call(param)
                repository.delete(param)
            end
            
        end
    end
  end
  
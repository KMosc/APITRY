module UseCase
    module Base 
        class Delete < ::UseCase::Base::Base
        
            def call(obj)
                repository.delete(obj)
            end
            
        end
    end
  end
  
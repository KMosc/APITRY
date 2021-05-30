module UseCase
    module Base 
        class Delete < UseCase::Base
        
            def call(obj)
                repository.delete(obj)
            end
            
        end
    end
  end
  
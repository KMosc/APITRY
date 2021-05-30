module UseCase
    module Base 
        class Update < UseCase::Base
        
            def call(:id, :params)
                repository.update(id, params)
            end
            
        end
    end
  end
  
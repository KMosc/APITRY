module UseCase
    module Base 
        class Create < UseCase::Base
        
            def call(:params)
                repository.create(params)
            end
            
        end
    end
  end
  
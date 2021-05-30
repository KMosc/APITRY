module UseCase
    module CinemaHall 
        class Update < UseCase::Base::Update
        
            def call(:id, :params)
                repository.update(id, params)
            end
            
        end
    end
  end
  
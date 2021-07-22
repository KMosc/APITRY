module Mutations
    class UpdateCinemaHallMutation < BaseMutation
      argument :id, ID, required: true
      argument :volume, Integer, required: true
      
      def resolve(**args)
        repository = Repository::CinemaHallRepository.new
        UseCase::CinemaHalls::Update.new(repository).call(args)
        {status: 200}
      end
    end
end
  
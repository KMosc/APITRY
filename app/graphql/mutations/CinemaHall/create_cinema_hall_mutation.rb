module Mutations
    class CreateCinemaHallMutation < BaseMutation
      argument :volume, Integer, required: true
      
      def resolve(**args)
        repository = Repository::CinemaHallRepository.new
        UseCase::CinemaHalls::Create.new(repository).call(args)
        {status: 200}
      end
    end
end
  
module Mutations
    class CinemaHallMutation < BaseMutation
      argument :volume, Integer, required: false
      
      def resolve(**args)
        repository = Repository::CinemaHallRepository.new
        UseCase::CinemaHalls::Create.new(repository).call(args)
        {status: 200}
      end
    end
end
  
module Mutations
    class DeleteCinemaHallMutation < BaseMutation
      argument :id, ID, required: true
      
      def resolve(**args)
        repository = Repository::CinemaHallRepository.new
        UseCase::CinemaHalls::Delete.new(repository).call(args)
        {status: 200}
      end
    end
end
  
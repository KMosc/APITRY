module Mutations
    class MovieMutation < BaseMutation
      argument :title, String, required: false
      argument :description, String, required: false
      argument :age_restriction, Integer, required: false
      argument :genre_id, ID, required: false
      argument :cinema_hall_id, ID, required: false
      def resolve(**args)
        repository = Repository::MovieRepository.new
        UseCase::Movies::Create.new(repository).call(args)
        {status: 200}
      end
    end
end
  
module Mutations
    class CreateMovieMutation < BaseMutation
      argument :title, String, required: true
      argument :description, String, required: false
      argument :age_restriction, Integer, required: true
      argument :genre_id, ID, required: true
      argument :cinema_hall_id, ID, required: true
      def resolve(**args)
        repository = Repository::MovieRepository.new
        UseCase::Movies::Create.new(repository).call(args)
        {status: 200}
      end
    end
end
  
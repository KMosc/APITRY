module Mutations
    class GenreMutation < BaseMutation
      argument :title, String, required: false
      argument :description, String, required: false

      def resolve(**args)
        repository = Repository::GenreRepository.new
        UseCase::Genres::Create.new(repository).call(args)
        {status: 200}
      end
    end
end
  
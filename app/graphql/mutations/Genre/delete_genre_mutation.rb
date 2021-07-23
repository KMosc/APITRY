module Mutations
  class DeleteGenreMutation < BaseMutation
    argument :id, ID, required: true

    def resolve(**args)
      repository = Repository::GenreRepository.new
      UseCase::Genres::Delete.new(repository).call(args)
      {status: 200}
    end
  end
end

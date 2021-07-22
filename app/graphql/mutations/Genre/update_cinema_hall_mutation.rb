module Mutations
  class UpdateGenreMutation < BaseMutation
    argument :id, ID, required: true
    argument :title, String, required: true
    argument :description, String, required: false

    def resolve(**args)
      repository = Repository::GenreRepository.new
      UseCase::Genres::Update.new(repository).call(args)
      {status: 200}
    end
  end
end

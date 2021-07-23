module Mutations
  class DeleteMovieMutation < BaseMutation
    argument :id, ID, required: true
    def resolve(**args)
      repository = Repository::MovieRepository.new
      UseCase::Movies::Delete.new(repository).call(args)
      {status: 200}
    end
  end
end

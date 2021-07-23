module Mutations
    class DeleteTicketDeskMutation < BaseMutation
      argument :id, ID, required: true
      
      def resolve(**args)
        repository = Repository::TicketDeskRepository.new
        UseCase::TicketDesk::Delete.new(repository).call(args)
        {status: 200}
      end
    end
end
  
module Mutations
    class UpdateTicketDeskMutation < BaseMutation
      argument :id, ID, required: true
      argument :name, String, required: true
      argument :automated, Boolean, required: true
      
      def resolve(**args)
        repository = Repository::TicketDeskRepository.new
        UseCase::TicketDesk::Update.new(repository).call(args)
        {status: 200}
      end
    end
end
  
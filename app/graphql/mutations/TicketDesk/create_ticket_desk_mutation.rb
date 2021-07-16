module Mutations
    class CreateTicketDeskMutation < BaseMutation
      argument :name, String, required: true
      argument :automated, Boolean, required: true
      
      def resolve(**args)
        repository = Repository::TicketDeskRepository.new
        UseCase::TicketDesk::Create.new(repository).call(args)
        {status: 200}
      end
    end
end
  
module Mutations
    class TicketDeskMutation < BaseMutation
      argument :name, String, required: false
      argument :automated, Boolean, required: false
      
      def resolve(**args)
        repository = Repository::TicketDeskRepository.new
        UseCase::TicketDesk::Create.new(repository).call(args)
        {status: 200}
      end
    end
end
  
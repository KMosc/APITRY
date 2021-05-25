
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
2.times do
    ticket_desks = TicketDesk.new(
        :name=>'cinema',
        :automated=>true
        )
    ticket_desks.save!
end
4.times do
    ticket_desks = TicketDesk.create([{
        :name=>'cinema',
        :automated=>false
        }])
end
volumes = [100, 100, 100, 100, 200, 50, 50, 50, 50, 20]
i = 0
while (i<volumes.size)
    cinema_hall = CinemaHall.create([{
        :volume=>volumes[i]
        }])
    i=i+1
end




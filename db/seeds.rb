
2.times do
    ticket_desks = TicketDesk.new(
        :name=> 'cinema',
        :automated=> true
        )
    ticket_desks.save!
end
4.times do
    ticket_desks = TicketDesk.create([{
        :name=>'cinema',
        :automated => false
        }])
end
volumes = [100, 100, 100, 100, 200, 50, 50, 50, 50, 20]
age = [6, 10, 12, 18, 65]
genres = ['comedy', 'criminal', 'western']
descriptions = ['lots of fun', 'scary, deaths', 'guns, western, cool movies']
i = 0
while (i<genres.size)
    Genre.create(
        title: genres[i],
        description: descriptions[i]
    )
    i=i+1

end
i = 0

while (i<volumes.size)
    @cinema=CinemaHall.create(
        volume: volumes[i]
        )
    @cinema.save!
    i=i+1
end
@movie=Movie.create(
    title: "Godfather",
    description: "...",
    age_restriction: 16,
    starts_at: DateTime.parse('18:00'),
    ends_at: DateTime.parse('20:55'),
    cinema_hall_id: 1,
    genre_id: 1
    )







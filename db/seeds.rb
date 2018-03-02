
10.times do
  artist = Artist.create(
  name: Faker::Kpop.i_groups
  )
  5.times do
    artist.songs.create(
      title: Faker::Hipster.word
      
    )
  end
end
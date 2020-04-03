# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
trail1 = Trail.create(length:43, name:"Western Trail", address: "trail1 address")
trail2 = Trail.create(length:21, name:"Easter Trail", address: "trail2 address")
trail3 = Trail.create(length:103, name:"Northern Trail", address: "trail3 address")
trail4 = Trail.create(length:41, name:"Southern Trail", address: "trail4 address")
trail5 = Trail.create(length:12, name:"Christmas Trail", address: "trail5 address")

trip1 = Trip.create(name:"Best")
trip2 = Trip.create(name:"Worst")
trip3 = Trip.create(name:"OK")

TripTrail.create(trip:trip1, trail:trail1)
TripTrail.create(trip:trip1, trail:trail2)
TripTrail.create(trip:trip1, trail:trail3)
TripTrail.create(trip:trip2, trail:trail2)
TripTrail.create(trip:trip2, trail:trail3)
TripTrail.create(trip:trip2, trail:trail4)
TripTrail.create(trip:trip3, trail:trail3)
TripTrail.create(trip:trip3, trail:trail4)
TripTrail.create(trip:trip3, trail:trail5)

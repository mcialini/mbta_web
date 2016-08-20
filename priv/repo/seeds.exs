# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     MbtaWeb.Repo.insert!(%MbtaWeb.SomeModel{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

MbtaWeb.Repo.insert!(%MbtaWeb.Departure{timestamp: 1471729962, origin: "North Station", trip: "1207", destination: "Haverhill", scheduled_time: 1471729800, lateness: 0, track: "3", status: "Departed"})
MbtaWeb.Repo.insert!(%MbtaWeb.Departure{timestamp: 1471729962, origin: "North Station", trip: "1409", destination: "Fitchburg", scheduled_time: 1471730400, lateness: 0, track: "9", status: "Now Boarding"})
MbtaWeb.Repo.insert!(%MbtaWeb.Departure{timestamp: 1471729962, origin: "North Station", trip: "1311", destination: "Lowell", scheduled_time: 1471730400, lateness: 0, track: nil, status: "On Time"})
MbtaWeb.Repo.insert!(%MbtaWeb.Departure{timestamp: 1471729962, origin: "North Station", trip: "1159", destination: "Newburyport", scheduled_time: 1471734900, lateness: 0, track: nil, status: "On Time"})
MbtaWeb.Repo.insert!(%MbtaWeb.Departure{timestamp: 1471729962, origin: "North Station", trip: "1313", destination: "Lowell", scheduled_time: 1471737600, lateness: 0, track: nil, status: "On Time"})
MbtaWeb.Repo.insert!(%MbtaWeb.Departure{timestamp: 1471729962, origin: "North Station", trip: "1411", destination: "Fitchburg", scheduled_time: 1471737600, lateness: 0, track: nil, status: "On Time"})
MbtaWeb.Repo.insert!(%MbtaWeb.Departure{timestamp: 1471729962, origin: "North Station", trip: "1111", destination: "Rockport", scheduled_time: 1471739400, lateness: 0, track: nil, status: "On Time"})
MbtaWeb.Repo.insert!(%MbtaWeb.Departure{timestamp: 1471729962, origin: "North Station", trip: "1209", destination: "Haverhill", scheduled_time: 1471740000, lateness: 0, track: nil, status: "On Time"})
MbtaWeb.Repo.insert!(%MbtaWeb.Departure{timestamp: 1471729962, origin: "North Station", trip: "1161", destination: "Newburyport", scheduled_time: 1471746000, lateness: 0, track: nil, status: "On Time"})
MbtaWeb.Repo.insert!(%MbtaWeb.Departure{timestamp: 1471729962, origin: "North Station", trip: "1211", destination: "Haverhill", scheduled_time: 1471750200, lateness: 0, track: nil, status: "On Time"})
MbtaWeb.Repo.insert!(%MbtaWeb.Departure{timestamp: 1471729962, origin: "North Station", trip: "1413", destination: "Fitchburg", scheduled_time: 1471750200, lateness: 0, track: nil, status: "On Time"})
MbtaWeb.Repo.insert!(%MbtaWeb.Departure{timestamp: 1471729962, origin: "North Station", trip: "1113", destination: "Rockport", scheduled_time: 1471750200, lateness: 0, track: nil, status: "On Time"})
MbtaWeb.Repo.insert!(%MbtaWeb.Departure{timestamp: 1471729962, origin: "North Station", trip: "1315", destination: "Lowell", scheduled_time: 1471750200, lateness: 0, track: nil, status: "On Time"})
MbtaWeb.Repo.insert!(%MbtaWeb.Departure{timestamp: 1471729962, origin: "South Station", trip: "1773", destination: "Readville", scheduled_time: 1471729800, lateness: 0, track: "9", status: "Departed"})
MbtaWeb.Repo.insert!(%MbtaWeb.Departure{timestamp: 1471729962, origin: "South Station", trip: "1513", destination: "Worcester / Union Station", scheduled_time: 1471731600, lateness: 0, track: nil, status: "On Time"})
MbtaWeb.Repo.insert!(%MbtaWeb.Departure{timestamp: 1471729962, origin: "South Station", trip: "1813", destination: "Providence", scheduled_time: 1471733100, lateness: 0, track: nil, status: "On Time"})
MbtaWeb.Repo.insert!(%MbtaWeb.Departure{timestamp: 1471729962, origin: "South Station", trip: "1775", destination: "Readville", scheduled_time: 1471733400, lateness: 0, track: nil, status: "On Time"})
MbtaWeb.Repo.insert!(%MbtaWeb.Departure{timestamp: 1471729962, origin: "South Station", trip: "1613", destination: "Needham Heights", scheduled_time: 1471734600, lateness: 0, track: nil, status: "On Time"})
MbtaWeb.Repo.insert!(%MbtaWeb.Departure{timestamp: 1471729962, origin: "South Station", trip: "1715", destination: "Forge Park / 495", scheduled_time: 1471735200, lateness: 0, track: nil, status: "On Time"})
MbtaWeb.Repo.insert!(%MbtaWeb.Departure{timestamp: 1471729962, origin: "South Station", trip: "1777", destination: "Readville", scheduled_time: 1471737000, lateness: 0, track: nil, status: "On Time"})
MbtaWeb.Repo.insert!(%MbtaWeb.Departure{timestamp: 1471729962, origin: "South Station", trip: "1083", destination: "Greenbush", scheduled_time: 1471737600, lateness: 0, track: nil, status: "On Time"})
MbtaWeb.Repo.insert!(%MbtaWeb.Departure{timestamp: 1471729962, origin: "South Station", trip: "1013", destination: "Middleboro/ Lakeville", scheduled_time: 1471738200, lateness: 0, track: nil, status: "On Time"})
MbtaWeb.Repo.insert!(%MbtaWeb.Departure{timestamp: 1471729962, origin: "South Station", trip: "1515", destination: "Worcester / Union Station", scheduled_time: 1471738800, lateness: 0, track: nil, status: "On Time"})
MbtaWeb.Repo.insert!(%MbtaWeb.Departure{timestamp: 1471729962, origin: "South Station", trip: "1039", destination: "Kingston", scheduled_time: 1471738800, lateness: 0, track: nil, status: "On Time"})
MbtaWeb.Repo.insert!(%MbtaWeb.Departure{timestamp: 1471729962, origin: "South Station", trip: "1815", destination: "Providence", scheduled_time: 1471740300, lateness: 0, track: nil, status: "On Time"})
MbtaWeb.Repo.insert!(%MbtaWeb.Departure{timestamp: 1471729962, origin: "South Station", trip: "1779", destination: "Readville", scheduled_time: 1471740600, lateness: 0, track: nil, status: "On Time"})
MbtaWeb.Repo.insert!(%MbtaWeb.Departure{timestamp: 1471729962, origin: "South Station", trip: "1615", destination: "Needham Heights", scheduled_time: 1471741800, lateness: 0, track: nil, status: "On Time"})
MbtaWeb.Repo.insert!(%MbtaWeb.Departure{timestamp: 1471729962, origin: "South Station", trip: "1717", destination: "Forge Park / 495", scheduled_time: 1471742400, lateness: 0, track: nil, status: "On Time"})
MbtaWeb.Repo.insert!(%MbtaWeb.Departure{timestamp: 1471729962, origin: "South Station", trip: "1781", destination: "Readville", scheduled_time: 1471744200, lateness: 0, track: nil, status: "On Time"})
MbtaWeb.Repo.insert!(%MbtaWeb.Departure{timestamp: 1471729962, origin: "South Station", trip: "1015", destination: "Middleboro/ Lakeville", scheduled_time: 1471746900, lateness: 0, track: nil, status: "On Time"})
MbtaWeb.Repo.insert!(%MbtaWeb.Departure{timestamp: 1471729962, origin: "South Station", trip: "1517", destination: "Worcester / Union Station", scheduled_time: 1471747200, lateness: 0, track: nil, status: "On Time"})

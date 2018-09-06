# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
if Team.all.length < 32
  Team.create!(location:'Arizona', team_name:'Cardinals')
  Team.create!(location:'Atlanta', team_name:'Falcons')
  Team.create!(location:'Baltimore', team_name:'Ravens')
  Team.create!(location:'Buffalo', team_name:'Bills')
  Team.create!(location:'Carolina', team_name:'Panthers')
  Team.create!(location:'Chicago', team_name:'Bears')
  Team.create!(location:'Cincinnati', team_name:'Bengals')
  Team.create!(location:'Cleveland', team_name:'Browns')
  Team.create!(location:'Dallas', team_name:'Cowboys')
  Team.create!(location:'Denver', team_name:'Broncos')
  Team.create!(location:'Detroit', team_name:'Lions')
  Team.create!(location:'Green Bay', team_name:'Packers')
  Team.create!(location:'Houston', team_name:'Texans')
  Team.create!(location:'Indianapolis', team_name:'Colts')
  Team.create!(location:'Jacksonville', team_name:'Jaguars')
  Team.create!(location:'Kansas City', team_name:'Chiefs')
  Team.create!(location:'Miami', team_name:'Dolphins')
  Team.create!(location:'Minnesota', team_name:'Vikings')
  Team.create!(location:'New England', team_name:'Patriots')
  Team.create!(location:'New Orleans', team_name:'Saints')
  Team.create!(location:'New York', team_name:'Giants')
  Team.create!(location:'New York', team_name:'Jets')
  Team.create!(location:'Oakland', team_name:'Raiders')
  Team.create!(location:'Philadelphia', team_name:'Eagles')
  Team.create!(location:'Pittsburgh', team_name:'Steelers')
  Team.create!(location:'Los Angeles', team_name:'Chargers')
  Team.create!(location:'San Francisco', team_name:'49ers')
  Team.create!(location:'Seattle', team_name:'Seahawks')
  Team.create!(location:'Los Angeles', team_name:'Rams')
  Team.create!(location:'Tampa Bay', team_name:'Buccaneers')
  Team.create!(location:'Tennessee', team_name:'Titans')
  Team.create!(location:'Washington', team_name:'Redskins')
end

if Week.all.length < 17
  Week.create!(week_number:1, year:2018, start_date:Date.new(2018,8,1), end_date:Date.new(2018,9,12),Rational(-4,24)))
  Week.create!(week_number:2, year:2018, start_date:Date.new(2018,9,13), end_date:Date.new(2018,9,19),Rational(-4,24)))
  Week.create!(week_number:3, year:2018, start_date:Date.new(2018,9,20), end_date:Date.new(2018,9,26),Rational(-4,24)))
  Week.create!(week_number:4, year:2018, start_date:Date.new(2018,9,27), end_date:Date.new(2018,10,3),Rational(-4,24)))
  Week.create!(week_number:5, year:2018, start_date:Date.new(2018,10,4), end_date:Date.new(2018,10,10),Rational(-4,24)))
  Week.create!(week_number:6, year:2018, start_date:Date.new(2018,10,11), end_date:Date.new(2018,10,17),Rational(-4,24)))
  Week.create!(week_number:7, year:2018, start_date:Date.new(2018,10,18), end_date:Date.new(2018,10,24),Rational(-4,24)))
  Week.create!(week_number:8, year:2018, start_date:Date.new(2018,10,25), end_date:Date.new(2018,10,31),Rational(-4,24)))
  Week.create!(week_number:9, year:2018, start_date:Date.new(2018,11,1), end_date:Date.new(2018,11,7),Rational(-4,24)))
  Week.create!(week_number:10, year:2018, start_date:Date.new(2018,11,8), end_date:Date.new(2018,11,14),Rational(-4,24)))
  Week.create!(week_number:11, year:2018, start_date:Date.new(2018,11,15), end_date:Date.new(2018,11,21),Rational(-4,24)))
  Week.create!(week_number:12, year:2018, start_date:Date.new(2018,11,22), end_date:Date.new(2018,11,28),Rational(-4,24)))
  Week.create!(week_number:13, year:2018, start_date:Date.new(2018,11,29), end_date:Date.new(2018,12,5),Rational(-4,24)))
  Week.create!(week_number:14, year:2018, start_date:Date.new(2018,12,6), end_date:Date.new(2018,12,12),Rational(-4,24)))
  Week.create!(week_number:15, year:2018, start_date:Date.new(2018,12,13), end_date:Date.new(2018,12,19),Rational(-4,24)))
  Week.create!(week_number:16, year:2018, start_date:Date.new(2018,12,20), end_date:Date.new(2018,12,26),Rational(-4,24)))
  Week.create!(week_number:17, year:2018, start_date:Date.new(2018,12,27), end_date:Date.new(2018,1,1),Rational(-4,24)))
end

Game.create!(week_id:20, away_team_id:25, home_team_id:8,gametime: DateTime.new(2018,9,9,13,00,0),Rational(-4,24)))
Game.create!(week_id:20, away_team_id:7, home_team_id:14,gametime: DateTime.new(2018,9,9,13,00,0),Rational(-4,24)))
Game.create!(week_id:20, away_team_id:31, home_team_id:17,gametime: DateTime.new(2018,9,9,13,00,0),Rational(-4,24)))
Game.create!(week_id:20, away_team_id:27, home_team_id:18,gametime: DateTime.new(2018,9,9,13,00,0),Rational(-4,24)))
Game.create!(week_id:20, away_team_id:30, home_team_id:20,gametime: DateTime.new(2018,9,9,13,00,0),Rational(-4,24)))
Game.create!(week_id:20, away_team_id:13, home_team_id:19,gametime: DateTime.new(2018,9,9,13,00,0),Rational(-4,24)))
Game.create!(week_id:20, away_team_id:15, home_team_id:21,gametime: DateTime.new(2018,9,9,13,00,0),Rational(-4,24)))
Game.create!(week_id:20, away_team_id:4, home_team_id:3,gametime: DateTime.new(2018,9,9,13,00,0),Rational(-4,24)))
Game.create!(week_id:20, away_team_id:29, home_team_id:23,gametime: DateTime.new(2018,9,10,22,20,0),Rational(-4,24)))
Game.create!(week_id:20, away_team_id:16, home_team_id:26,gametime: DateTime.new(2018,9,9,16,05,0),Rational(-4,24)))
Game.create!(week_id:20, away_team_id:9, home_team_id:5,gametime: DateTime.new(2018,9,9,16,25,0),Rational(-4,24)))
Game.create!(week_id:20, away_team_id:32, home_team_id:1,gametime: DateTime.new(2018,9,9,16,25,0),Rational(-4,24)))
Game.create!(week_id:20, away_team_id:28, home_team_id:10,gametime: DateTime.new(2018,9,9,16,25,0),Rational(-4,24)))
Game.create!(week_id:20, away_team_id:22, home_team_id:11,gametime: DateTime.new(2018,9,10,19,10,0),Rational(-4,24)))
Game.create!(week_id:20, away_team_id:2, home_team_id:24,gametime: DateTime.new(2018,9,6,20,20,0),Rational(-4,24)))
Game.create!(week_id:20, away_team_id:6, home_team_id:12,gametime: DateTime.new(2018,9,9,20,20,0),Rational(-4,24)))
Game.create!(week_id:21, away_team_id:5, home_team_id:2,gametime: DateTime.new(2018,9,16,13,00,0),Rational(-4,24)))
Game.create!(week_id:21, away_team_id:26, home_team_id:4,gametime: DateTime.new(2018,9,16,13,00,0),Rational(-4,24)))
Game.create!(week_id:21, away_team_id:18, home_team_id:12,gametime: DateTime.new(2018,9,16,13,00,0),Rational(-4,24)))
Game.create!(week_id:21, away_team_id:8, home_team_id:20,gametime: DateTime.new(2018,9,16,13,00,0),Rational(-4,24)))
Game.create!(week_id:21, away_team_id:17, home_team_id:22,gametime: DateTime.new(2018,9,16,13,00,0),Rational(-4,24)))
Game.create!(week_id:21, away_team_id:13, home_team_id:31,gametime: DateTime.new(2018,9,16,13,00,0),Rational(-4,24)))
Game.create!(week_id:21, away_team_id:16, home_team_id:25,gametime: DateTime.new(2018,9,16,13,00,0),Rational(-4,24)))
Game.create!(week_id:21, away_team_id:24, home_team_id:30,gametime: DateTime.new(2018,9,16,13,00,0),Rational(-4,24)))
Game.create!(week_id:21, away_team_id:14, home_team_id:32,gametime: DateTime.new(2018,9,16,13,00,0),Rational(-4,24)))
Game.create!(week_id:21, away_team_id:1, home_team_id:29,gametime: DateTime.new(2018,9,16,16,05,0),Rational(-4,24)))
Game.create!(week_id:21, away_team_id:11, home_team_id:27,gametime: DateTime.new(2018,9,16,16,05,0),Rational(-4,24)))
Game.create!(week_id:21, away_team_id:23, home_team_id:10,gametime: DateTime.new(2018,9,16,16,25,0),Rational(-4,24)))
Game.create!(week_id:21, away_team_id:19, home_team_id:15,gametime: DateTime.new(2018,9,16,16,25,0),Rational(-4,24)))
Game.create!(week_id:21, away_team_id:3, home_team_id:7,gametime: DateTime.new(2018,9,13,20,20,0),Rational(-4,24)))
Game.create!(week_id:21, away_team_id:21, home_team_id:9,gametime: DateTime.new(2018,9,16,20,20,0),Rational(-4,24)))
Game.create!(week_id:21, away_team_id:28, home_team_id:6,gametime: DateTime.new(2018,9,17,20,15,0),Rational(-4,24)))
Game.create!(week_id:22, away_team_id:20, home_team_id:2,gametime: DateTime.new(2018,9,23,13,00,0),Rational(-4,24)))
Game.create!(week_id:22, away_team_id:7, home_team_id:5,gametime: DateTime.new(2018,9,23,13,00,0),Rational(-4,24)))
Game.create!(week_id:22, away_team_id:21, home_team_id:13,gametime: DateTime.new(2018,9,23,13,00,0),Rational(-4,24)))
Game.create!(week_id:22, away_team_id:31, home_team_id:15,gametime: DateTime.new(2018,9,23,13,00,0),Rational(-4,24)))
Game.create!(week_id:22, away_team_id:27, home_team_id:16,gametime: DateTime.new(2018,9,23,13,00,0),Rational(-4,24)))
Game.create!(week_id:22, away_team_id:23, home_team_id:17,gametime: DateTime.new(2018,9,23,13,00,0),Rational(-4,24)))
Game.create!(week_id:22, away_team_id:4, home_team_id:18,gametime: DateTime.new(2018,9,23,13,00,0),Rational(-4,24)))
Game.create!(week_id:22, away_team_id:14, home_team_id:24,gametime: DateTime.new(2018,9,23,13,00,0),Rational(-4,24)))
Game.create!(week_id:22, away_team_id:10, home_team_id:3,gametime: DateTime.new(2018,9,23,13,00,0),Rational(-4,24)))
Game.create!(week_id:22, away_team_id:12, home_team_id:32,gametime: DateTime.new(2018,9,23,13,00,0),Rational(-4,24)))
Game.create!(week_id:22, away_team_id:26, home_team_id:29,gametime: DateTime.new(2018,9,23,16,05,0),Rational(-4,24)))
Game.create!(week_id:22, away_team_id:6, home_team_id:1,gametime: DateTime.new(2018,9,23,16,25,0),Rational(-4,24)))
Game.create!(week_id:22, away_team_id:9, home_team_id:28,gametime: DateTime.new(2018,9,23,16,25,0),Rational(-4,24)))
Game.create!(week_id:22, away_team_id:22, home_team_id:8,gametime: DateTime.new(2018,9,20,20,20,0),Rational(-4,24)))
Game.create!(week_id:22, away_team_id:19, home_team_id:11,gametime: DateTime.new(2018,9,23,20,20,0),Rational(-4,24)))
Game.create!(week_id:22, away_team_id:25, home_team_id:30,gametime: DateTime.new(2018,9,24,20,15,0),Rational(-4,24)))
Game.create!(week_id:23, away_team_id:7, home_team_id:2,gametime: DateTime.new(2018,9,30,13,00,0),Rational(-4,24)))
Game.create!(week_id:23, away_team_id:30, home_team_id:6,gametime: DateTime.new(2018,9,30,13,00,0),Rational(-4,24)))
Game.create!(week_id:23, away_team_id:13, home_team_id:14,gametime: DateTime.new(2018,9,30,13,00,0),Rational(-4,24)))
Game.create!(week_id:23, away_team_id:11, home_team_id:9,gametime: DateTime.new(2018,9,30,13,00,0),Rational(-4,24)))
Game.create!(week_id:23, away_team_id:4, home_team_id:12,gametime: DateTime.new(2018,9,30,13,00,0),Rational(-4,24)))
Game.create!(week_id:23, away_team_id:22, home_team_id:15,gametime: DateTime.new(2018,9,30,13,00,0),Rational(-4,24)))
Game.create!(week_id:23, away_team_id:17, home_team_id:19,gametime: DateTime.new(2018,9,30,13,00,0),Rational(-4,24)))
Game.create!(week_id:23, away_team_id:24, home_team_id:31,gametime: DateTime.new(2018,9,30,13,00,0),Rational(-4,24)))
Game.create!(week_id:23, away_team_id:28, home_team_id:1,gametime: DateTime.new(2018,9,30,16,05,0),Rational(-4,24)))
Game.create!(week_id:23, away_team_id:8, home_team_id:23,gametime: DateTime.new(2018,9,30,16,05,0),Rational(-4,24)))
Game.create!(week_id:23, away_team_id:20, home_team_id:21,gametime: DateTime.new(2018,9,30,16,25,0),Rational(-4,24)))
Game.create!(week_id:23, away_team_id:27, home_team_id:26,gametime: DateTime.new(2018,9,30,16,25,0),Rational(-4,24)))
Game.create!(week_id:23, away_team_id:18, home_team_id:29,gametime: DateTime.new(2018,9,27,20,20,0),Rational(-4,24)))
Game.create!(week_id:23, away_team_id:3, home_team_id:25,gametime: DateTime.new(2018,9,30,20,20,0),Rational(-4,24)))
Game.create!(week_id:23, away_team_id:16, home_team_id:10,gametime: DateTime.new(2018,10,1,20,15,0),Rational(-4,24)))
Game.create!(week_id:24, away_team_id:31, home_team_id:4,gametime: DateTime.new(2018,10,7,13,00,0),Rational(-4,24)))
Game.create!(week_id:24, away_team_id:21, home_team_id:5,gametime: DateTime.new(2018,10,7,13,00,0),Rational(-4,24)))
Game.create!(week_id:24, away_team_id:17, home_team_id:7,gametime: DateTime.new(2018,10,7,13,00,0),Rational(-4,24)))
Game.create!(week_id:24, away_team_id:3, home_team_id:8,gametime: DateTime.new(2018,10,7,13,00,0),Rational(-4,24)))
Game.create!(week_id:24, away_team_id:12, home_team_id:11,gametime: DateTime.new(2018,10,7,13,00,0),Rational(-4,24)))
Game.create!(week_id:24, away_team_id:15, home_team_id:16,gametime: DateTime.new(2018,10,7,13,00,0),Rational(-4,24)))
Game.create!(week_id:24, away_team_id:10, home_team_id:22,gametime: DateTime.new(2018,10,7,13,00,0),Rational(-4,24)))
Game.create!(week_id:24, away_team_id:2, home_team_id:25,gametime: DateTime.new(2018,10,7,13,00,0),Rational(-4,24)))
Game.create!(week_id:24, away_team_id:23, home_team_id:26,gametime: DateTime.new(2018,10,7,16,05,0),Rational(-4,24)))
Game.create!(week_id:24, away_team_id:18, home_team_id:24,gametime: DateTime.new(2018,10,7,16,25,0),Rational(-4,24)))
Game.create!(week_id:24, away_team_id:29, home_team_id:28,gametime: DateTime.new(2018,10,7,16,25,0),Rational(-4,24)))
Game.create!(week_id:24, away_team_id:1, home_team_id:27,gametime: DateTime.new(2018,10,7,16,25,0),Rational(-4,24)))
Game.create!(week_id:24, away_team_id:14, home_team_id:19,gametime: DateTime.new(2018,10,4,20,20,0),Rational(-4,24)))
Game.create!(week_id:24, away_team_id:9, home_team_id:13,gametime: DateTime.new(2018,10,7,20,20,0),Rational(-4,24)))
Game.create!(week_id:24, away_team_id:32, home_team_id:20,gametime: DateTime.new(2018,10,8,20,15,0),Rational(-4,24)))
Game.create!(week_id:25, away_team_id:30, home_team_id:2,gametime: DateTime.new(2018,10,14,13,00,0),Rational(-4,24)))
Game.create!(week_id:25, away_team_id:25, home_team_id:7,gametime: DateTime.new(2018,10,14,13,00,0),Rational(-4,24)))
Game.create!(week_id:25, away_team_id:26, home_team_id:8,gametime: DateTime.new(2018,10,14,13,00,0),Rational(-4,24)))
Game.create!(week_id:25, away_team_id:4, home_team_id:13,gametime: DateTime.new(2018,10,14,13,00,0),Rational(-4,24)))
Game.create!(week_id:25, away_team_id:6, home_team_id:17,gametime: DateTime.new(2018,10,14,13,00,0),Rational(-4,24)))
Game.create!(week_id:25, away_team_id:1, home_team_id:18,gametime: DateTime.new(2018,10,14,13,00,0),Rational(-4,24)))
Game.create!(week_id:25, away_team_id:14, home_team_id:22,gametime: DateTime.new(2018,10,14,13,00,0),Rational(-4,24)))
Game.create!(week_id:25, away_team_id:28, home_team_id:23,gametime: DateTime.new(2018,10,14,13,00,0),Rational(-4,24)))
Game.create!(week_id:25, away_team_id:5, home_team_id:32,gametime: DateTime.new(2018,10,14,13,00,0),Rational(-4,24)))
Game.create!(week_id:25, away_team_id:29, home_team_id:10,gametime: DateTime.new(2018,10,14,16,05,0),Rational(-4,24)))
Game.create!(week_id:25, away_team_id:15, home_team_id:9,gametime: DateTime.new(2018,10,14,16,25,0),Rational(-4,24)))
Game.create!(week_id:25, away_team_id:3, home_team_id:31,gametime: DateTime.new(2018,10,14,16,25,0),Rational(-4,24)))
Game.create!(week_id:25, away_team_id:24, home_team_id:21,gametime: DateTime.new(2018,10,11,20,20,0),Rational(-4,24)))
Game.create!(week_id:25, away_team_id:16, home_team_id:19,gametime: DateTime.new(2018,10,14,20,20,0),Rational(-4,24)))
Game.create!(week_id:25, away_team_id:27, home_team_id:12,gametime: DateTime.new(2018,10,15,20,15,0),Rational(-4,24)))
Game.create!(week_id:26, away_team_id:31, home_team_id:26,gametime: DateTime.new(2018,10,21,9,30,0),Rational(-4,24)))
Game.create!(week_id:26, away_team_id:19, home_team_id:6,gametime: DateTime.new(2018,10,21,13,00,0),Rational(-4,24)))
Game.create!(week_id:26, away_team_id:4, home_team_id:14,gametime: DateTime.new(2018,10,21,13,00,0),Rational(-4,24)))
Game.create!(week_id:26, away_team_id:13, home_team_id:15,gametime: DateTime.new(2018,10,21,13,00,0),Rational(-4,24)))
Game.create!(week_id:26, away_team_id:7, home_team_id:16,gametime: DateTime.new(2018,10,21,13,00,0),Rational(-4,24)))
Game.create!(week_id:26, away_team_id:11, home_team_id:17,gametime: DateTime.new(2018,10,21,13,00,0),Rational(-4,24)))
Game.create!(week_id:26, away_team_id:18, home_team_id:22,gametime: DateTime.new(2018,10,21,13,00,0),Rational(-4,24)))
Game.create!(week_id:26, away_team_id:5, home_team_id:24,gametime: DateTime.new(2018,10,21,13,00,0),Rational(-4,24)))
Game.create!(week_id:26, away_team_id:8, home_team_id:30,gametime: DateTime.new(2018,10,21,13,00,0),Rational(-4,24)))
Game.create!(week_id:26, away_team_id:20, home_team_id:3,gametime: DateTime.new(2018,10,21,16,05,0),Rational(-4,24)))
Game.create!(week_id:26, away_team_id:9, home_team_id:32,gametime: DateTime.new(2018,10,21,16,25,0),Rational(-4,24)))
Game.create!(week_id:26, away_team_id:10, home_team_id:1,gametime: DateTime.new(2018,10,18,20,20,0),Rational(-4,24)))
Game.create!(week_id:26, away_team_id:29, home_team_id:27,gametime: DateTime.new(2018,10,21,20,20,0),Rational(-4,24)))
Game.create!(week_id:26, away_team_id:21, home_team_id:2,gametime: DateTime.new(2018,10,22,20,15,0),Rational(-4,24)))
Game.create!(week_id:27, away_team_id:24, home_team_id:15,gametime: DateTime.new(2018,10,28,9,30,0),Rational(-4,24)))
Game.create!(week_id:27, away_team_id:3, home_team_id:5,gametime: DateTime.new(2018,10,28,13,00,0),Rational(-4,24)))
Game.create!(week_id:27, away_team_id:22, home_team_id:6,gametime: DateTime.new(2018,10,28,13,00,0),Rational(-4,24)))
Game.create!(week_id:27, away_team_id:30, home_team_id:7,gametime: DateTime.new(2018,10,28,13,00,0),Rational(-4,24)))
Game.create!(week_id:27, away_team_id:28, home_team_id:11,gametime: DateTime.new(2018,10,28,13,00,0),Rational(-4,24)))
Game.create!(week_id:27, away_team_id:10, home_team_id:16,gametime: DateTime.new(2018,10,28,13,00,0),Rational(-4,24)))
Game.create!(week_id:27, away_team_id:32, home_team_id:21,gametime: DateTime.new(2018,10,28,13,00,0),Rational(-4,24)))
Game.create!(week_id:27, away_team_id:8, home_team_id:25,gametime: DateTime.new(2018,10,28,13,00,0),Rational(-4,24)))
Game.create!(week_id:27, away_team_id:14, home_team_id:23,gametime: DateTime.new(2018,10,28,16,05,0),Rational(-4,24)))
Game.create!(week_id:27, away_team_id:27, home_team_id:1,gametime: DateTime.new(2018,10,28,16,25,0),Rational(-4,24)))
Game.create!(week_id:27, away_team_id:12, home_team_id:29,gametime: DateTime.new(2018,10,28,16,25,0),Rational(-4,24)))
Game.create!(week_id:27, away_team_id:17, home_team_id:13,gametime: DateTime.new(2018,10,25,20,20,0),Rational(-4,24)))
Game.create!(week_id:27, away_team_id:20, home_team_id:18,gametime: DateTime.new(2018,10,28,20,20,0),Rational(-4,24)))
Game.create!(week_id:27, away_team_id:19, home_team_id:4,gametime: DateTime.new(2018,10,29,20,15,0),Rational(-4,24)))
Game.create!(week_id:28, away_team_id:6, home_team_id:4,gametime: DateTime.new(2018,11,4,13,00,0),Rational(-4,24)))
Game.create!(week_id:28, away_team_id:30, home_team_id:5,gametime: DateTime.new(2018,11,4,13,00,0),Rational(-4,24)))
Game.create!(week_id:28, away_team_id:16, home_team_id:8,gametime: DateTime.new(2018,11,4,13,00,0),Rational(-4,24)))
Game.create!(week_id:28, away_team_id:22, home_team_id:17,gametime: DateTime.new(2018,11,4,13,00,0),Rational(-4,24)))
Game.create!(week_id:28, away_team_id:11, home_team_id:18,gametime: DateTime.new(2018,11,4,13,00,0),Rational(-4,24)))
Game.create!(week_id:28, away_team_id:25, home_team_id:3,gametime: DateTime.new(2018,11,4,13,00,0),Rational(-4,24)))
Game.create!(week_id:28, away_team_id:2, home_team_id:32,gametime: DateTime.new(2018,11,4,13,00,0),Rational(-4,24)))
Game.create!(week_id:28, away_team_id:13, home_team_id:10,gametime: DateTime.new(2018,11,4,16,05,0),Rational(-4,24)))
Game.create!(week_id:28, away_team_id:26, home_team_id:28,gametime: DateTime.new(2018,11,4,16,05,0),Rational(-4,24)))
Game.create!(week_id:28, away_team_id:29, home_team_id:20,gametime: DateTime.new(2018,11,4,16,25,0),Rational(-4,24)))
Game.create!(week_id:28, away_team_id:23, home_team_id:27,gametime: DateTime.new(2018,11,1,20,20,0),Rational(-4,24)))
Game.create!(week_id:28, away_team_id:12, home_team_id:19,gametime: DateTime.new(2018,11,4,20,20,0),Rational(-4,24)))
Game.create!(week_id:28, away_team_id:31, home_team_id:9,gametime: DateTime.new(2018,11,5,20,15,0),Rational(-4,24)))
Game.create!(week_id:29, away_team_id:11, home_team_id:6,gametime: DateTime.new(2018,11,11,13,00,0),Rational(-4,24)))
Game.create!(week_id:29, away_team_id:20, home_team_id:7,gametime: DateTime.new(2018,11,11,13,00,0),Rational(-4,24)))
Game.create!(week_id:29, away_team_id:2, home_team_id:8,gametime: DateTime.new(2018,11,11,13,00,0),Rational(-4,24)))
Game.create!(week_id:29, away_team_id:15, home_team_id:14,gametime: DateTime.new(2018,11,11,13,00,0),Rational(-4,24)))
Game.create!(week_id:29, away_team_id:17, home_team_id:12,gametime: DateTime.new(2018,11,11,13,00,0),Rational(-4,24)))
Game.create!(week_id:29, away_team_id:1, home_team_id:16,gametime: DateTime.new(2018,11,11,13,00,0),Rational(-4,24)))
Game.create!(week_id:29, away_team_id:4, home_team_id:22,gametime: DateTime.new(2018,11,11,13,00,0),Rational(-4,24)))
Game.create!(week_id:29, away_team_id:19, home_team_id:31,gametime: DateTime.new(2018,11,11,13,00,0),Rational(-4,24)))
Game.create!(week_id:29, away_team_id:32, home_team_id:30,gametime: DateTime.new(2018,11,11,13,00,0),Rational(-4,24)))
Game.create!(week_id:29, away_team_id:26, home_team_id:23,gametime: DateTime.new(2018,11,11,16,05,0),Rational(-4,24)))
Game.create!(week_id:29, away_team_id:28, home_team_id:29,gametime: DateTime.new(2018,11,11,16,25,0),Rational(-4,24)))
Game.create!(week_id:29, away_team_id:5, home_team_id:25,gametime: DateTime.new(2018,11,8,20,20,0),Rational(-4,24)))
Game.create!(week_id:29, away_team_id:9, home_team_id:24,gametime: DateTime.new(2018,11,11,20,20,0),Rational(-4,24)))
Game.create!(week_id:29, away_team_id:21, home_team_id:27,gametime: DateTime.new(2018,11,12,20,15,0),Rational(-4,24)))
Game.create!(week_id:30, away_team_id:9, home_team_id:2,gametime: DateTime.new(2018,11,18,13,00,0),Rational(-4,24)))
Game.create!(week_id:30, away_team_id:18, home_team_id:6,gametime: DateTime.new(2018,11,18,13,00,0),Rational(-4,24)))
Game.create!(week_id:30, away_team_id:31, home_team_id:14,gametime: DateTime.new(2018,11,18,13,00,0),Rational(-4,24)))
Game.create!(week_id:30, away_team_id:5, home_team_id:11,gametime: DateTime.new(2018,11,18,13,00,0),Rational(-4,24)))
Game.create!(week_id:30, away_team_id:24, home_team_id:20,gametime: DateTime.new(2018,11,18,13,00,0),Rational(-4,24)))
Game.create!(week_id:30, away_team_id:30, home_team_id:21,gametime: DateTime.new(2018,11,18,13,00,0),Rational(-4,24)))
Game.create!(week_id:30, away_team_id:7, home_team_id:3,gametime: DateTime.new(2018,11,18,13,00,0),Rational(-4,24)))
Game.create!(week_id:30, away_team_id:13, home_team_id:32,gametime: DateTime.new(2018,11,18,13,00,0),Rational(-4,24)))
Game.create!(week_id:30, away_team_id:23, home_team_id:1,gametime: DateTime.new(2018,11,18,16,05,0),Rational(-4,24)))
Game.create!(week_id:30, away_team_id:10, home_team_id:26,gametime: DateTime.new(2018,11,18,16,05,0),Rational(-4,24)))
Game.create!(week_id:30, away_team_id:12, home_team_id:28,gametime: DateTime.new(2018,11,15,20,20,0),Rational(-4,24)))
Game.create!(week_id:30, away_team_id:25, home_team_id:15,gametime: DateTime.new(2018,11,18,20,20,0),Rational(-4,24)))
Game.create!(week_id:30, away_team_id:16, home_team_id:29,gametime: DateTime.new(2018,11,19,20,15,0),Rational(-4,24)))
Game.create!(week_id:31, away_team_id:15, home_team_id:4,gametime: DateTime.new(2018,11,25,13,00,0),Rational(-4,24)))
Game.create!(week_id:31, away_team_id:28, home_team_id:5,gametime: DateTime.new(2018,11,25,13,00,0),Rational(-4,24)))
Game.create!(week_id:31, away_team_id:8, home_team_id:7,gametime: DateTime.new(2018,11,25,13,00,0),Rational(-4,24)))
Game.create!(week_id:31, away_team_id:17, home_team_id:14,gametime: DateTime.new(2018,11,25,13,00,0),Rational(-4,24)))
Game.create!(week_id:31, away_team_id:19, home_team_id:22,gametime: DateTime.new(2018,11,25,13,00,0),Rational(-4,24)))
Game.create!(week_id:31, away_team_id:21, home_team_id:24,gametime: DateTime.new(2018,11,25,13,00,0),Rational(-4,24)))
Game.create!(week_id:31, away_team_id:23, home_team_id:3,gametime: DateTime.new(2018,11,25,13,00,0),Rational(-4,24)))
Game.create!(week_id:31, away_team_id:27, home_team_id:30,gametime: DateTime.new(2018,11,25,13,00,0),Rational(-4,24)))
Game.create!(week_id:31, away_team_id:6, home_team_id:11,gametime: DateTime.new(2018,11,22,12,30,0),Rational(-4,24)))
Game.create!(week_id:31, away_team_id:32, home_team_id:9,gametime: DateTime.new(2018,11,22,16,30,0),Rational(-4,24)))
Game.create!(week_id:31, away_team_id:1, home_team_id:26,gametime: DateTime.new(2018,11,25,16,05,0),Rational(-4,24)))
Game.create!(week_id:31, away_team_id:25, home_team_id:10,gametime: DateTime.new(2018,11,25,16,25,0),Rational(-4,24)))
Game.create!(week_id:31, away_team_id:2, home_team_id:20,gametime: DateTime.new(2018,11,22,20,20,0),Rational(-4,24)))
Game.create!(week_id:31, away_team_id:12, home_team_id:18,gametime: DateTime.new(2018,11,25,20,20,0),Rational(-4,24)))
Game.create!(week_id:31, away_team_id:31, home_team_id:13,gametime: DateTime.new(2018,11,26,20,15,0),Rational(-4,24)))
Game.create!(week_id:32, away_team_id:3, home_team_id:2,gametime: DateTime.new(2018,12,2,13,00,0),Rational(-4,24)))
Game.create!(week_id:32, away_team_id:10, home_team_id:7,gametime: DateTime.new(2018,12,2,13,00,0),Rational(-4,24)))
Game.create!(week_id:32, away_team_id:29, home_team_id:11,gametime: DateTime.new(2018,12,2,13,00,0),Rational(-4,24)))
Game.create!(week_id:32, away_team_id:1, home_team_id:12,gametime: DateTime.new(2018,12,2,13,00,0),Rational(-4,24)))
Game.create!(week_id:32, away_team_id:8, home_team_id:13,gametime: DateTime.new(2018,12,2,13,00,0),Rational(-4,24)))
Game.create!(week_id:32, away_team_id:14, home_team_id:15,gametime: DateTime.new(2018,12,2,13,00,0),Rational(-4,24)))
Game.create!(week_id:32, away_team_id:4, home_team_id:17,gametime: DateTime.new(2018,12,2,13,00,0),Rational(-4,24)))
Game.create!(week_id:32, away_team_id:6, home_team_id:21,gametime: DateTime.new(2018,12,2,13,00,0),Rational(-4,24)))
Game.create!(week_id:32, away_team_id:26, home_team_id:25,gametime: DateTime.new(2018,12,2,13,00,0),Rational(-4,24)))
Game.create!(week_id:32, away_team_id:5, home_team_id:30,gametime: DateTime.new(2018,12,2,13,00,0),Rational(-4,24)))
Game.create!(week_id:32, away_team_id:22, home_team_id:31,gametime: DateTime.new(2018,12,2,16,05,0),Rational(-4,24)))
Game.create!(week_id:32, away_team_id:16, home_team_id:23,gametime: DateTime.new(2018,12,2,16,05,0),Rational(-4,24)))
Game.create!(week_id:32, away_team_id:18, home_team_id:19,gametime: DateTime.new(2018,12,2,16,25,0),Rational(-4,24)))
Game.create!(week_id:32, away_team_id:20, home_team_id:9,gametime: DateTime.new(2018,11,29,20,20,0),Rational(-4,24)))
Game.create!(week_id:32, away_team_id:27, home_team_id:28,gametime: DateTime.new(2018,12,2,20,20,0),Rational(-4,24)))
Game.create!(week_id:32, away_team_id:32, home_team_id:24,gametime: DateTime.new(2018,12,3,20,15,0),Rational(-4,24)))
Game.create!(week_id:33, away_team_id:22, home_team_id:4,gametime: DateTime.new(2018,12,9,13,00,0),Rational(-4,24)))
Game.create!(week_id:33, away_team_id:29, home_team_id:6,gametime: DateTime.new(2018,12,9,13,00,0),Rational(-4,24)))
Game.create!(week_id:33, away_team_id:5, home_team_id:8,gametime: DateTime.new(2018,12,9,13,00,0),Rational(-4,24)))
Game.create!(week_id:33, away_team_id:2, home_team_id:12,gametime: DateTime.new(2018,12,9,13,00,0),Rational(-4,24)))
Game.create!(week_id:33, away_team_id:14, home_team_id:13,gametime: DateTime.new(2018,12,9,13,00,0),Rational(-4,24)))
Game.create!(week_id:33, away_team_id:3, home_team_id:16,gametime: DateTime.new(2018,12,9,13,00,0),Rational(-4,24)))
Game.create!(week_id:33, away_team_id:19, home_team_id:17,gametime: DateTime.new(2018,12,9,13,00,0),Rational(-4,24)))
Game.create!(week_id:33, away_team_id:20, home_team_id:30,gametime: DateTime.new(2018,12,9,13,00,0),Rational(-4,24)))
Game.create!(week_id:33, away_team_id:21, home_team_id:32,gametime: DateTime.new(2018,12,9,13,00,0),Rational(-4,24)))
Game.create!(week_id:33, away_team_id:7, home_team_id:26,gametime: DateTime.new(2018,12,9,16,05,0),Rational(-4,24)))
Game.create!(week_id:33, away_team_id:10, home_team_id:27,gametime: DateTime.new(2018,12,9,16,05,0),Rational(-4,24)))
Game.create!(week_id:33, away_team_id:11, home_team_id:1,gametime: DateTime.new(2018,12,9,16,25,0),Rational(-4,24)))
Game.create!(week_id:33, away_team_id:24, home_team_id:9,gametime: DateTime.new(2018,12,9,16,25,0),Rational(-4,24)))
Game.create!(week_id:33, away_team_id:15, home_team_id:31,gametime: DateTime.new(2018,12,6,20,20,0),Rational(-4,24)))
Game.create!(week_id:33, away_team_id:25, home_team_id:23,gametime: DateTime.new(2018,12,9,20,20,0),Rational(-4,24)))
Game.create!(week_id:33, away_team_id:18, home_team_id:28,gametime: DateTime.new(2018,12,10,20,15,0),Rational(-4,24)))
Game.create!(week_id:34, away_team_id:1, home_team_id:2,gametime: DateTime.new(2018,12,16,13,00,0),Rational(-4,24)))
Game.create!(week_id:34, away_team_id:11, home_team_id:4,gametime: DateTime.new(2018,12,16,13,00,0),Rational(-4,24)))
Game.create!(week_id:34, away_team_id:12, home_team_id:6,gametime: DateTime.new(2018,12,16,13,00,0),Rational(-4,24)))
Game.create!(week_id:34, away_team_id:23, home_team_id:7,gametime: DateTime.new(2018,12,16,13,00,0),Rational(-4,24)))
Game.create!(week_id:34, away_team_id:9, home_team_id:14,gametime: DateTime.new(2018,12,16,13,00,0),Rational(-4,24)))
Game.create!(week_id:34, away_team_id:32, home_team_id:15,gametime: DateTime.new(2018,12,16,13,00,0),Rational(-4,24)))
Game.create!(week_id:34, away_team_id:17, home_team_id:18,gametime: DateTime.new(2018,12,16,13,00,0),Rational(-4,24)))
Game.create!(week_id:34, away_team_id:31, home_team_id:21,gametime: DateTime.new(2018,12,16,13,00,0),Rational(-4,24)))
Game.create!(week_id:34, away_team_id:30, home_team_id:3,gametime: DateTime.new(2018,12,16,13,00,0),Rational(-4,24)))
Game.create!(week_id:34, away_team_id:8, home_team_id:10,gametime: DateTime.new(2018,12,15,16,30,0),Rational(-4,24)))
Game.create!(week_id:34, away_team_id:13, home_team_id:22,gametime: DateTime.new(2018,12,15,16,30,0),Rational(-4,24)))
Game.create!(week_id:34, away_team_id:28, home_team_id:27,gametime: DateTime.new(2018,12,16,16,05,0),Rational(-4,24)))
Game.create!(week_id:34, away_team_id:19, home_team_id:25,gametime: DateTime.new(2018,12,16,16,25,0),Rational(-4,24)))
Game.create!(week_id:34, away_team_id:26, home_team_id:16,gametime: DateTime.new(2018,12,13,20,20,0),Rational(-4,24)))
Game.create!(week_id:34, away_team_id:24, home_team_id:29,gametime: DateTime.new(2018,12,16,20,20,0),Rational(-4,24)))
Game.create!(week_id:34, away_team_id:20, home_team_id:5,gametime: DateTime.new(2018,12,17,20,15,0),Rational(-4,24)))
Game.create!(week_id:35, away_team_id:2, home_team_id:5,gametime: DateTime.new(2018,12,23,13,00,0),Rational(-4,24)))
Game.create!(week_id:35, away_team_id:7, home_team_id:8,gametime: DateTime.new(2018,12,23,13,00,0),Rational(-4,24)))
Game.create!(week_id:35, away_team_id:21, home_team_id:14,gametime: DateTime.new(2018,12,23,13,00,0),Rational(-4,24)))
Game.create!(week_id:35, away_team_id:30, home_team_id:9,gametime: DateTime.new(2018,12,23,13,00,0),Rational(-4,24)))
Game.create!(week_id:35, away_team_id:18, home_team_id:11,gametime: DateTime.new(2018,12,23,13,00,0),Rational(-4,24)))
Game.create!(week_id:35, away_team_id:15, home_team_id:17,gametime: DateTime.new(2018,12,23,13,00,0),Rational(-4,24)))
Game.create!(week_id:35, away_team_id:4, home_team_id:19,gametime: DateTime.new(2018,12,23,13,00,0),Rational(-4,24)))
Game.create!(week_id:35, away_team_id:12, home_team_id:22,gametime: DateTime.new(2018,12,23,13,00,0),Rational(-4,24)))
Game.create!(week_id:35, away_team_id:32, home_team_id:31,gametime: DateTime.new(2018,12,23,13,00,0),Rational(-4,24)))
Game.create!(week_id:35, away_team_id:13, home_team_id:24,gametime: DateTime.new(2018,12,23,13,00,0),Rational(-4,24)))
Game.create!(week_id:35, away_team_id:29, home_team_id:1,gametime: DateTime.new(2018,12,23,16,05,0),Rational(-4,24)))
Game.create!(week_id:35, away_team_id:3, home_team_id:26,gametime: DateTime.new(2018,12,23,16,05,0),Rational(-4,24)))
Game.create!(week_id:35, away_team_id:6, home_team_id:27,gametime: DateTime.new(2018,12,23,16,05,0),Rational(-4,24)))
Game.create!(week_id:35, away_team_id:25, home_team_id:20,gametime: DateTime.new(2018,12,23,16,25,0),Rational(-4,24)))
Game.create!(week_id:35, away_team_id:16, home_team_id:28,gametime: DateTime.new(2018,12,23,20,20,0),Rational(-4,24)))
Game.create!(week_id:35, away_team_id:10, home_team_id:23,gametime: DateTime.new(2018,12,24,20,15,0),Rational(-4,24)))
Game.create!(week_id:36, away_team_id:17, home_team_id:4,gametime: DateTime.new(2018,12,30,13,00,0),Rational(-4,24)))
Game.create!(week_id:36, away_team_id:11, home_team_id:12,gametime: DateTime.new(2018,12,30,13,00,0),Rational(-4,24)))
Game.create!(week_id:36, away_team_id:15, home_team_id:13,gametime: DateTime.new(2018,12,30,13,00,0),Rational(-4,24)))
Game.create!(week_id:36, away_team_id:23, home_team_id:16,gametime: DateTime.new(2018,12,30,13,00,0),Rational(-4,24)))
Game.create!(week_id:36, away_team_id:6, home_team_id:18,gametime: DateTime.new(2018,12,30,13,00,0),Rational(-4,24)))
Game.create!(week_id:36, away_team_id:5, home_team_id:20,gametime: DateTime.new(2018,12,30,13,00,0),Rational(-4,24)))
Game.create!(week_id:36, away_team_id:22, home_team_id:19,gametime: DateTime.new(2018,12,30,13,00,0),Rational(-4,24)))
Game.create!(week_id:36, away_team_id:9, home_team_id:21,gametime: DateTime.new(2018,12,30,13,00,0),Rational(-4,24)))
Game.create!(week_id:36, away_team_id:14, home_team_id:31,gametime: DateTime.new(2018,12,30,13,00,0),Rational(-4,24)))
Game.create!(week_id:36, away_team_id:7, home_team_id:25,gametime: DateTime.new(2018,12,30,13,00,0),Rational(-4,24)))
Game.create!(week_id:36, away_team_id:8, home_team_id:3,gametime: DateTime.new(2018,12,30,13,00,0),Rational(-4,24)))
Game.create!(week_id:36, away_team_id:2, home_team_id:30,gametime: DateTime.new(2018,12,30,13,00,0),Rational(-4,24)))
Game.create!(week_id:36, away_team_id:24, home_team_id:32,gametime: DateTime.new(2018,12,30,13,00,0),Rational(-4,24)))
Game.create!(week_id:36, away_team_id:26, home_team_id:10,gametime: DateTime.new(2018,12,30,16,25,0),Rational(-4,24)))
Game.create!(week_id:36, away_team_id:27, home_team_id:29,gametime: DateTime.new(2018,12,30,16,25,0),Rational(-4,24)))
Game.create!(week_id:36, away_team_id:1, home_team_id:28,gametime: DateTime.new(2018,12,30,16,25,0),Rational(-4,24)))

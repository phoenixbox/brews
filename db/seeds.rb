# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Team.create([{
  title: 'Cupcake Crew'
  }])

Game.create([{
  title: 'Game of Drones', question_time: 120, pin: '0000'}
  ])

Question.create([
  {text: 'When the Ottoman Turks besieged this European city in 1529, one item 
    they brought along was coffee. Ever since then, this city has been famous 
    for its cafés and the type of coffee served there. Which city is it?', 
      correct_answer: 'Vienna', order: '1', game_id: '1' }
      ])
Question.create([
  {text: 'Which European tennis star, in 1988, became only the 3rd woman ever to 
    win the Grand Slam of tennis?', correct_answer: 'Steffi Graf', order: '2',
    game_id: '1'}
  ])
Question.create([
  {text: 'How many Riel (Cambodian Currency) equals 1 US Dollar?', 
    correct_answer: 'four thousand one hundred and seventy-one', order: '3', 
    game_id: '1'}
  ])
Question.create([
  {text: 'The Caribbean coast of Central America, as well as the native people 
    inhabiting the region, have the same name as an insect. 
    What are they called?', correct_answer: 'mosquito', order: '4', 
    game_id: '1'}
  ])
Question.create([
  {text: 'Scientists say the "Greenhouse Effect" is caused by the increase, 
    in the atmosphere, of what gas?', correct_answer: 'carbon dioxide', 
    order: '5', game_id: '1'}
  ])
Question.create([
  {text: 'This game evolved in the Spanish-Basque region in the 17th century. 
    The ball used in this game sometimes reaches speeds of 150 miles per hour, 
    and people bet on the outcomes of the games. It is sometimes called pelota, 
    but more commonly known as what?', correct_answer: 'Jai Alai', order: '6', 
    game_id: '1'}
  ])
Question.create([
  {text: 'The year 1963, marked the end of an era: what form of communication 
    came to an end in Alaska?', correct_answer: 'mail delivery by dog sled', 
    order: '7', game_id: '1'}
  ])
Question.create([
{text: 'The oldest street in San Francisco was originally called Dupont Street, 
  but was later re-named after a President. Which street is this?', 
  correct_answer: 'Grant Street', order: '8', game_id: '1'}
  ])
Question.create([
  {text: 'You can travel from California to Nebraska by passing through only 
    two states. What are they?', correct_answer: 'Arizona and Colorado', order: 
    '9', game_id: '1'}
  ])
Question.create([
  {text: 'Who was the first British prime minister in the 20th century to serve 
    three consecutive terms?', correct_answer: 'Margaret Thatcher', order: '10', 
    game_id: '1'}
  ])

# Description:
#   Example scripts for you to examine and try out.
#
# Notes:
#   They are commented out by default, because most of them are pretty silly and
#   wouldn't be useful and amusing enough for day to day huboting.
#   Uncomment the ones you want to try and experiment with.
#
#   These are from the scripting documentation: https://github.com/github/hubot/blob/master/docs/scripting.md

JTQuotes = [
  'I\'m watching you.'
  'I love pork belly.'
  'Do you want a banana?'
  'People in Asia call people from Honk Kong honkys.'
  'Oriental is a deragatory word.'
  'I should not have eaten that big hot burrito. I mean it was really big.'
  'I love balls.'
  'You are a Trump Lover.'
  'Not the stupid squirrel again.'
  'Donald Trump is a fubar.'
  'Yep, I will just bring myself to the potluck.'
  'You are being a woose.'
  ':middle_finger:'
  'You must have wandered off into unknown territories like \'weird, illegit\' websites.'
  'Kung pao chicken is a chicken dish, there should be no vegetables, especially water chestnuts. It isn\'t called Kung Pao water chestnuts.'
  'Where is your onkel today?'
  'I can\'t eat hot stuff anymore, I am too old and a sissy.'
  'I want to eat all the bang bang shrimps.',
  'My beef smells funny, taste weird'
  'Grant, are you growing?'
  'Oh No! I\'m a terrorist.'
  'You seem to have a lot of excess body fat'
  'I want pork belly, I love pork belly, I WANT it. I want it so bad.'
  'Don\'t always believe everything'
  'Those people down there are going to want us to buy some kind of corn'
  'Oops, I cannot see... why?'
  'You know what, my butt is gone!'
  'This is so freaking... ... ... ... ...'
  'Hashimoto yo! HAHAHAHAHAHAHA'
  'Josh you are an a dollar dollar'
  'Don\'t swallow the fairies'
  'His spouse is not married'
  'I am hiding all my balls'
  'You know, Obama was at one time Indonesian'
  'It was way back in Asian times'
  'It\'s ok, I don\'t see in a straight line either'
  'No I am not the man, I am *A* man'
  'I loved balls, cones, cylinders, cubes etc, you name it'
  'that\'s Poland flag dood'
  'Did you see the gass prices today?'
  'My butt hurts'
]

JTPotluck = [
  'I will try to bring \'I Dare You Double-Spicy Sichuan Wonton\' tomorrow morning if I\'m still kicking'
  'IT... IS... GOOD.'
]

module.exports = (robot) ->

  speak = (res, word) ->
    setTimeout () ->
      res.send word
    , 1000 * Math.floor(Math.random() * 3 + 1)

  silence = false

  robot.hear /potluck/i, (res) ->
    if Math.random() > 0.75
      speak res, res.random JTPotluck

  robot.respond /shut up/i, (res) -> 
    res.send '👋'
    silence = true

  robot.respond /unshut/i, (res) ->
    silence = false

  robot.hear /.*/, (res) ->
    if !silence
      message = res.match[0]

      if (message.match /potluck/i) is null

        canISpeak = Math.random() > 0.98
    
        if canISpeak
          randIndx = Math.floor(Math.random() * JTQuotes.length)
          speak res, JTQuotes[randIndx]

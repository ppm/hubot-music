# Description:
#
# Dependencies:
#
# Configuration
#
# Commands:
#
# Author:
#
iTunesControl = require("itunescontrol")
Playback = require("playback")

class Player
  searchAndPlay: (q) -> 
    console.log q
    iTunesControl.search q, (results) ->
      iTunesControl.play(results[0].id);
  play: ->
    Playback.play () ->
      console.log "play"
  stop: ->
    Playback.stop () ->
      console.log "stop"
player = new Player

module.exports = (robot) ->
  robot.hear /^play (.*)$/i, (msg) ->
    player.searchAndPlay msg.match[1]

  robot.hear /^play$/, (msg) ->
    player.play()
    
  robot.hear /^stop$/, (msg) ->
    player.stop()

  Playback.on "playing", (data) ->
    robot.send room: 'random', "#{data.name} を再生中よ"
    

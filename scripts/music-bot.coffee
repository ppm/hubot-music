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

module.exports = (robot) ->
  robot.hear /^play (.*)$/i, (msg) ->
    console.log msg.match[1]
    iTunesControl.search msg.match[1], (results) ->
      iTunesControl.play(results[0].id);

  robot.hear /^play$/, (msg) ->
    Playback.play () ->
      console.log "play"

  robot.hear /^stop$/, (msg) ->
    Playback.stop () ->
      console.log "stop"

  Playback.on "playing", (data) ->
    robot.send room: 'musicbox_bot', "#{data.name} を再生中よ"

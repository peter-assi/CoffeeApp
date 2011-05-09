# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
$ ->
  if $('#username').length == 0
    return

  friends = $('#friends')
  followers = $('#followers')


  showUser = (twitterId, outputDiv) ->
    showUrl = "http://api.twitter.com/1/users/show.json?id=#{twitterId}&callback=?"
    $.getJSON showUrl, (data) ->
      console.log("Fetch info data from #{showUrl}")
      outputDiv.append("<p>#{data.screen_name}</p><div><img alt='#{data.screen_name}' src='#{data.profile_image_url}'></div>")

  fetchData = (url, outputDiv) ->
    $.getJSON url, (data) ->
      console.log("Fetch list data from #{url}")
      outputDiv.show()
      showUser twId, outputDiv for twId in data
      return true


  $('#myForm').submit (e) ->
    username =  $('#username').val()
    friendsUrl = "http://api.twitter.com/1/friends/ids/#{username}.json?callback=?"
    followersUrl = "http://api.twitter.com/1/followers/ids/#{username}.json?callback=?"

    fetchData friendsUrl, friends
    fetchData followersUrl, followers

    
    return false





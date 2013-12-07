# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

_
$ ->

  populateWithLists = () ->
    event.preventDefault()
    $.get('/lists').done (success_data) ->
      $("#all-of-my-lists").removeClass("hidden")
      updateListList(success_data)

  populateWithLists()
  $("#all-of-my-lists").addClass("hidden")
  alert("should see lists now")

  updateListList = (success_data) ->
    # returnedTitle = JSON.stringify(success_data)
    # first empty the div
    $("#all-of-my-lists").empty()
    # for each list populate a template
    for this_item in success_data
      alert(this_item)
      $("#all-of-my-lists").append(listInfo({this_item: this_item}))


  $("#view-own-list").click ->
    $(".my-list-details").toggle(500)

  # listInfo = _.template('<tr><td><%= this_item.title %></td><td><%= this_item.description %></td><td><%= this_item.id %></td></tr>')
  #listInfo = _.template("<hr><tr><td><button class='list-index' type='button' id='list-details-'><%= this_item.title %></button></td><td><%= this_item.description %></td></tr>")
  #listInfo = _.template('<hr><tr><td><button type="button"><a href="/lists/#{this_item.id}.json"><%= this_item.title %></button></td><td><%= this_item.description %></td></tr>')
  # listInfo = _.template('<hr><tr><td><button type="button"><%= link_to "test", "/lists/#{this_item.id}.json" %></button></td><td><%= this_item.description %></td></tr>')

  # listInfo = _.template('<hr><tr><td><input data-id="<%= this_item.id %>" type="submit" class="listButton"><%= this_item.title %></button></tr></td>')
  listInfo = _.template('<hr><tr><td><a class="btn btn-primary" href="/lists/<%= this_item.id %>/items"><%= this_item.title %></a></td></tr>')


  $("hr").click ->
    # event.preventDefault()
    alert("something")
    # console.log $this
    # console.log $(this).data('id')
    # $itemId = $(this).data('id')
    # alert("you clicked on #{$itemId}")


    # $("#all-of-my-lists").addClass("hidden")
    # alert("lists should be gone!")

  updateListList = (success_data) ->
    # returnedTitle = JSON.stringify(success_data)
    # first empty the div
    $("#all-of-my-lists").empty()
    # for each list populate a template
    for this_item in success_data
      $("#all-of-my-lists").append(listInfo({this_item: this_item}))

  # $("#delete-all-lists").click ->


  $("#newListDetails").click ->
    event.preventDefault()
    $listName = $("#listName").val()
    $listDescr = $("#listDescr").val()
    $listOwner = $("#listOwner").val()
    makeThisList = {list: {title: $listName, description: $listDescr, user_id: $listOwner}}
    console.log makeThisList

    $.post '/lists',
      makeThisList,
      (success_data) ->
        $("#enter-new-list-details").addClass("hidden")
        updateListList(success_data)



  $("#view-my-lists").click ->
    event.preventDefault()
    $.get('/lists').done (success_data) ->
      $("#all-of-my-lists").removeClass("hidden")
      updateListList(success_data)

  $("#create-a-list").click ->
    event.preventDefault()
    $("#enter-new-list-details").removeClass("hidden")
    # alert(JSON.stringify(success_data_of_some_sort))

# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

_
$ ->
  $("#view-own-list").click ->
    $(".my-list-details").toggle(500)

  # listInfo = _.template('<tr><td><%= this_item.title %></td><td><%= this_item.description %></td><td><%= this_item.id %></td></tr>')
  listInfo = _.template("<hr><tr><td><a href='' id='take-me-to-this-list'><%= this_item.title %></a></td><td><%= this_item.description %></td><td><%= this_item.id %></td></tr>")

  $("#take-me-to-this-list").click ->
    event.preventDefault
    $("#all-of-my-lists").addClass("hidden")
    alert("lists should be gone!")

  updateListList = (success_data) ->
    # returnedTitle = JSON.stringify(success_data)
    # first empty the div
    $("#all-of-my-lists").empty()
    # for each list populate a template
    for this_item in success_data
      $("#all-of-my-lists").append(listInfo({this_item: this_item}))

  # $("#delete-all-lists").click ->


  $("#newListDetails").click ->
    event.preventDefault
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
    $.get('/lists').done (success_data) ->
      $("#all-of-my-lists").removeClass("hidden")
      updateListList(success_data)

  $("#create-a-list").click ->
    $("#enter-new-list-details").removeClass("hidden")
    # alert(JSON.stringify(success_data_of_some_sort))

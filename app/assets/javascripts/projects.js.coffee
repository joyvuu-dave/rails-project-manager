# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
  # From 8pm to 8am we make the navbar dark
  hours = new Date().getHours()
  $('.navbar').addClass('navbar-inverse') if hours > 19 or hours < 9

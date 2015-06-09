$(document).ready(function() {
  $('#new_question').on('submit', function (event) {
    event.preventDefault();

    //For HandleBars
    var source = $('#question_block').html();
    var template = Handlebars.compile(source);
    var url = $(this).attr('action');
    var data = $(this).serialize();
    var request = $.ajax({
      type: 'post',
      url: 'http://127.0.0.1:3001' +url,
      data: data,
      dataType: 'json'
    });

    request.done(function(data) {

      //$('ul').append('<li>' +data+ '</li>'); //non-handlebars way
      var context = {};
      context.data = data;
      $('ul').append(template(context)); //handlebars way
    });

    request.fail(function(data) {
      $('#new_question').prepend('<span id="error">You fucked up</span>');
    });
  });

  $('.q_up').on('submit', function(event){
    event.preventDefault();

    var upvotes = $(this).next();
    var data = $(this).serialize();
    var url = $(this).attr('action');
    var request = $.ajax({
      url: 'http://127.0.0.1:3001' +url,
      type: 'post',
      data: data
    });

    request.done(function(response){
      upvotes.text(response.votes);
    });

    request.fail(function(data) {
      $(this).prepend('<span id="error">You fucked up</span>');
    });

  });

  $('.q_down').on('submit', function(event){
    event.preventDefault();
    var downvotes = $(this).prev();
    var data = $(this).serialize();
    var url = $(this).attr('action');
    console.log(downvotes);
    var request = $.ajax({
      url: 'http://127.0.0.1:3001' +url,
      type: 'post',
      data: data
    });

    request.done(function(response){
      downvotes.text(response.votes);
    });

    request.fail(function(data) {
      $(this).prepend('<span id="error">You fucked up</span>');
    });

  });

});

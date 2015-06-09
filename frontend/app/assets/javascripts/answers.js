$(document).ready(function() {

  $('#new_answer').on('submit', function(event) {
    event.preventDefault();

    var source = $('#answer_block').html();
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
      var context = {};
      context.data = data;
      $('.answer_div').append(template(context));
    });
    request.fail(function(data) {
      $('#new_answer').prepend('<span id="error">You fucked up</span>');
    });
  });

  $('.a_up').on('submit', function(event){
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

  $('.a_down').on('submit', function(event){
    event.preventDefault();
    var downvotes = $(this).prev();
    var data = $(this).serialize();
    var url = $(this).attr('action');
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

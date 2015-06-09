$(document).ready(function() {

  $('#question_title').on('keyup', function() {
    var title = this.value;
    $('.md_q_title').text(title);
  })

  $('#question_content').on('keyup', function() {
    var content = this.value;
    var h6 = /######/;
    var h5 = /#####/;
    var h4 = /####/;
    var h3 = /###/;
    var h2 = /##/;
    var h1 = /#/;

    if (content.match(h6)) {
      body ='<h6>' +content.slice(6)+ '</h6>';
    }
    else if (content.match(h5)) {
      body ='<h5>' +content.slice(5)+ '</h5>';
    }
    else if (content.match(h4)) {
      body ='<h4>' +content.slice(4)+ '</h4>';
    }
    else if (content.match(h3)) {
      body ='<h3>' +content.slice(3)+ '</h3>';
    }
    else if (content.match(h2)) {
      body ='<h2>' +content.slice(2)+ '</h2>';
    }
    else if (content.match(h1)) {
      body ='<h1>' +content.slice(1)+ '</h1>';
    }
    else {
      body ='<p>' +content+ '</p>';
    }
    $('.md_q_content').html(body);
  })





});

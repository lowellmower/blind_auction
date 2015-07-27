$(document).ready(function(){
  $('#login').on('click', function(e){
    $('#auth-modal').empty();
    e.preventDefault();
    $.ajax("/login")
    .done(function(loginForm){
      $('#auth-modal').append(loginForm);
      $('#auth-modal').fadeIn();
    })
    .fail(function(error){
      console.log(error, "You're family is missing")
    });
  })
  $('#sign').on('click', function(e){
    $('#auth-modal').empty();
    e.preventDefault();
    $.ajax("/users/new")
    .done(function(signUp){
      $('#auth-modal').append(signUp);
      $('#auth-modal').fadeIn();
    })
    .fail(function(error){
      console.log(error, "You're family is dead. I'm sorry.")
    })
  })
});
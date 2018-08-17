// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery3
//= require rails-ujs
//= require activestorage
//= require turbolinks
//= require_tree .




$(document).ready(function() {
    $("#articles-table").find('.destroy-article-btn').on('click', function (event) {
        let parentTr = $(event.currentTarget).closest('tr');
        let articleId = parentTr.data('articleId');
        if(confirm('Are you sure?')){
            $.ajax({
                method: "DELETE",
                url: '/articles/' + articleId,
                dataType: 'JSON'
            }).done(function(responce) {
                console.log(responce);
                parentTr.remove();
            }).fail(function(responce) {
                console.log(responce);
                alert( responce.statusText );
            })
        }
    });


    let timeout;
    $('form.new_user').find("input#user_nickname").on('input paste', function(event) {
        clearTimeout(timeout);
        timeout = setTimeout(function() {
            if ($(event.currentTarget).val().length !== 0){
                checkNickname($(event.currentTarget).val())
            }else {
                $('#error-nickname').addClass('hidden');
                $('#success-nickname').addClass('hidden');
                $(event.currentTarget).addClass('border-error');
            }
        }, 1500);
    });
});

  // function checkPasswordColumns(password, password_confirmation){
  //     $('form.checkPasswordColumns').find("input#user_password").on('input paste', function () {
  //         clearTimeout(timeout);
  //         timeout = setTimeout(function(){
  //         if ($(event.user_password).val().length !== 6){
  //           checkPasswordColumns($(event.currentTarget).val())
  //         }else {
  //             $('')
  //         }
  //         }
  //     })



function checkNickname(nickname) {
    $.ajax({
        method: "POST",
        url: '/check_nickname',
        dataType: 'JSON',
        data: {nickname: nickname }
    }).done(function(responce){
        console.log(responce)
        if (responce.is_exist){
            $('#error-nickname').removeClass('hidden');
            $('#success-nickname').addClass('hidden');

        }  else {
           $('#error-nickname').addClass('hidden');
           $('#success-nickname').removeClass('hidden');
            $('input#user_nickname').removeClass('border-error');
        }

    })
}

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
//= require bootstrap-sprockets

//= require ./core/core
//= require_tree ./classes

Turbolinks.start();
Application.app = new Application.Core;
Application.app.start();

$(document).ready(() => {
    $('#articles-table').find('.destroy-article-btn').on('click', (event) => {
        let parentTr = $(event.currentTarget).closest('tr');
        let articleId = parentTr.data('articleId');
        if(confirm('Are you sure?')){
            $.ajax({
                method: 'DELETE',
                // url: '/articles/' + articleId,
                url: `/articles/${articleId}`,
                dataType: 'JSON'
            }).then((responce) => {
                console.log(responce);
                parentTr.remove();
            }).catch((responce) => {
                alert( responce.statusText );
            })
        }
    });

    let timeout;
    $('form.new_user').find('input#user_nickname').on('input paste', (event) => {
        clearTimeout(timeout);
        timeout = setTimeout(() => {
            if ($(event.currentTarget).val().length !== 0){
                checkNickname($(event.currentTarget).val())
            } else {
                $('#error-nickname').addClass('hidden');
                $('#success-nickname').addClass('hidden');
                $(event.currentTarget).addClass('border-error');
            }
        }, 1500);
    });
});

function checkNickname(nickname) {
    $.ajax({
        method: 'POST',
        url: '/check_nickname',
        dataType: 'JSON',
        data: {nickname: nickname}
    }).then((responce) => {
        console.log(responce);
        if (responce.is_exist) {
            $('#error-nickname').removeClass('hidden');
            $('#success-nickname').addClass('hidden');

        } else {
            $('#error-nickname').addClass('hidden');
            $('#success-nickname').removeClass('hidden');
            $('input#user_nickname').removeClass('border-error');
        }
    })
}


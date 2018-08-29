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
//= require cocoon

//= require bootstrap-dialog/src/js/bootstrap-dialog

//= require ./core/core
//= require_tree ./classes

Turbolinks.start();
Application.app = new Application.Core;
Application.app.start();


$(document).ready(() => {

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




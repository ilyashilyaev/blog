Application.Classes.Games = class Games {

    constructor($el) {

        this._gameWeb();

    }


    _gameWeb() {
        let player = 1;
        const table = $('table');
        const messages = $('.messages');
        const turn = $('.turn');

        this._displayNextPlayer(turn, player);

        $('td').click((event)=> {
            let td = $(event.currentTarget);
            const state = this._getState(td);
            if (!state) {
                const pattern =this._definePatternForCurrentPlayer(player);
                this._changeState(td, pattern);
                if (this._checkIfPlayerWon(table, pattern)) {
                    messages.html(`Player ${player} has won.`);
                    turn.html('');
                } else {
                    player = this._setNextPlayer(player);
                    this._displayNextPlayer(turn, player)
                }
            } else {
                messages.html('This box is already checked.')
            }



        $('.reset').click(() => {
            player = 1;
            messages.html('');
            this._reset(table);
            this._displayNextPlayer(turn, player);
        });
    })
}


 _getState(td) {
    if (td.hasClass('cross') || td.hasClass('circle')) {
        return 1;
    } else {
        return 0;
    }
}

 _changeState(td, pattern) {
    return td.addClass(pattern);
}

 _definePatternForCurrentPlayer(player) {
    if (player == 1) {
        return 'cross';
    } else {
        return 'circle';
    }
}

 _setNextPlayer(player) {
    if (player == 1) {
        return player = 2;
    } else {
        return player = 1;
    }
}

 _displayNextPlayer(turn, player) {
    turn.html(`Player turn : ${player}`);
}

 _checkIfPlayerWon(table, pattern) {
    let won = 0;
    if (table.find('.item1').hasClass(pattern) && table.find('.item2').hasClass(pattern) && table.find('.item3').hasClass(pattern)) {
        won = 1;
    } else if (table.find('.item1').hasClass(pattern) && table.find('.item4').hasClass(pattern) && table.find('.item7').hasClass(pattern)) {
        won = 1;
    } else if (table.find('.item1').hasClass(pattern) && table.find('.item5').hasClass(pattern) && table.find('.item9').hasClass(pattern)) {
        won = 1;
    } else if (table.find('.item4').hasClass(pattern) && table.find('.item5').hasClass(pattern) && table.find('.item6').hasClass(pattern)) {
        won = 1;
    } else if (table.find('.item7').hasClass(pattern) && table.find('.item8').hasClass(pattern) && table.find('.item9').hasClass(pattern)) {
        won = 1;
    } else if (table.find('.item2').hasClass(pattern) && table.find('.item5').hasClass(pattern) && table.find('.item8').hasClass(pattern)) {
        won = 1;
    } else if (table.find('.item3').hasClass(pattern) && table.find('.item6').hasClass(pattern) && table.find('.item9').hasClass(pattern)) {
        won = 1;
    } else if (table.find('.item3').hasClass(pattern) && table.find('.item5').hasClass(pattern) && table.find('.item7').hasClass(pattern)) {
        won = 1;
    }
    return won;
}

 _reset(table) {
    table.find('td').each(function () {
        $(this).removeClass('circle').removeClass('cross');
    });
}

}
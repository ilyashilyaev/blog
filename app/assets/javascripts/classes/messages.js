Application.Classes.Messages = class Messages {

    constructor($el) {
        this.$sendMessage = $el.find('.msg_send_btn');
        this.$inputMessage = $el.find('.write_msg');
        this.conversationId = $el.data('conversationId');
        this.message = $el.find('.data-msg-id');
        this.userId = $el.data('userId');
        this.messageBlog = $el.find('#messages');
        this.$deleteMessage = $el.find('.destroy-msg-btn');
        // this.$editMessage = $el.find('.edit-msg-btn');
        // this.$responceMessage = $el.find()


        this._button_send_message();
        this._button_delete_message();
        // this._button_edit_message();


    }

    _button_send_message() {
        this.$sendMessage.on('click', (event) => {
            $.ajax({
                method: 'POST',
                url: `/conversations/${this.conversationId}/messages`,
                dataType: 'JSON',
                data: {message: {text: this.$inputMessage.val()}}
            }).then((responce) => {
                console.log(responce);
                let messageClass = responce.user_id == this.userId ? 'text-right' : 'text-left';
                this.messageBlog.append(`<div class="row ${messageClass}"` +
                    `<p>${responce.text}</p><hr><button type="button" class="btn btn-danger btn-xs
                                                        destroy-msg-btn">delete</button></div>`);
                this.$inputMessage.val('')
            });
        });


    }

    _button_delete_message() {
        this.$deleteMessage.on('click', (event) => {
            let parentDiv = $(event.currentTarget).closest('.message');
            if (confirm('Are you sure?')) {
                $.ajax({
                    method: 'DELETE',
                    // url: '/articles/' + articleId,
                    url: `/conversations/${this.conversationId}/messages/${parentDiv.data('msgId')}`,
                    dataType: 'JSON'
                }).then((responce) => {
                    console.log(responce);
                    parentDiv.remove();
                }).catch((responce) => {
                    alert(responce.statusText);
                });
            }
        });

    }

    // _button_edit_message(){
    //     this.$editMessage.on('click',(event)=>{
    //         let parentDiv =$(event.currentTarget).closest('.message');
    //         $.ajax({
    //             method: 'PUT',
    //             // url: '/articles/' + articleId,
    //             url: `/conversations/${this.conversationId}/messages/${parentDiv.data('msgId')}`,
    //             dataType: 'JSON'
    //         }).then((responce) => {
    //             console.log(responce);
    //
    //             $(`[data-msg-${responce.message.id}]`).find('p').html(responce.message.text)
    //                 // messageClass = responce.user_id == this.userId ? 'text-right' : 'text-left';
    //             // this.messageBlog.before(`<div class="row ${messageClass}"` +
    //             //     `<p>${responce.text}</p><hr><button type="button" class="btn btn-danger btn-xs
    //             //                                     destroy-msg-btn">delete</button></div>`);
    //             // this.$inputMessage.val('')
    //         });
    //     });
    //
    // }
}
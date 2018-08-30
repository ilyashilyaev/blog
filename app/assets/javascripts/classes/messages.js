Application.Classes.Messages = class Messages {

    constructor($el) {
        this.$sendMessage   = $el.find('.msg_send_btn');
        this.$inputMessage  = $el.find('.write_msg');
        this.conversationId = $el.data('conversationId');
        this.userId         = $el.data('userId');
        this.messageBlog    = $el.find('#messages');
        // this.$removeArticleBtn = $el.find('.destroy-article-btn');


        this._button_send_message();


    }

    _button_send_message(){
        this.$sendMessage.on('click', (event) => {
            $.ajax({
                method: 'POST',
                url: `/conversations/${this.conversationId}/messages`,
                dataType: 'JSON',
                data: {message: {text: this.$inputMessage.val()}}
            }).then((responce) => {
                console.log(responce);
                let messageClass = responce.user_id == this.userId ? 'text-right' : 'text-left';
                this.messageBlog.append(`<div class="row ${messageClass}"`+
                    `<p>${responce.text}</p><hr></div>`);
                this.$inputMessage.val('')
            });
        });


    }


}

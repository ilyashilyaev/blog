Application.Classes.Conversations = class Conversations {

    constructor($el) {
        this.$deleteConversation = $el.find('.destroy-conversation-btn');


        this._delete_conversation();


    }


    _delete_conversation() {
        this.$deleteConversation.on('click', (event) => {
            let parentTr = $(event.currentTarget).closest('tr');
            let conversationId = parentTr.data('conversationId');
            if (confirm('Are you sure?')) {
                $.ajax({
                    method: 'DELETE',
                    // url: '/articles/' + articleId,
                    url: `/conversations/${conversationId}`,
                    dataType: 'JSON'
                }).then((responce) => {
                    console.log(responce);
                    parentTr.remove();
                }).catch((responce) => {
                    alert(responce.statusText);
                })
            }
        });


    }
}
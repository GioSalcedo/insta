import consumer from "./consumer"

consumer.subscriptions.create("CommentsChannel", {
  received(data) {
    return $('#comments').append(this.renderComment(data));
  }
});

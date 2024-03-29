$(function() {
    $('[data-channel-subscribe="room"]').each(function(index, element) {
        var $element = $(element),
            room_id = $element.data('room-id')
        messageTemplate = $('[data-role="message-template"]');

        $element.animate({ scrollTop: $element.prop("scrollHeight")}, 0.001)

        App.cable.subscriptions.create(
            {
                channel: "RoomChannel",
                room: room_id
            },
            {
                received: function(data) {
                    var content = messageTemplate.children().clone(true, true);
                    content.find('[data-role="message-text"]').text(data.message);
                    content.find('[data-role="message-date"]').text(data.updated_at);
                    $element.append(content);
                    //byebug
                    $element.animate({ scrollTop: $element.prop("scrollHeight")}, 0.001);
                }
            }
        );
    });
});
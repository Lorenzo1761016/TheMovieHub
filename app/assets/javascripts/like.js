$('.preached-btn').on('ajax:succes', function(){
    $(this).parent().parent().find('.like_count')
        .html('<%= @comment.get_likes.size %> &#128591');
        $(this).closest('.preached-btn').html('Preach');
});

$('.preach-btn').on('ajax:success', function(){
    $(this).parent().parent().find('.like_count')
    .html('<%= @comment.get_likes.size %> &#128591');
    $(this).closest('.preach-btn').html('Preached');
});
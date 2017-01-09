// $('.votee#<%= prayer.id %>').html('<%= j render "vote", locals: { prayer: @prayer } %>');
//
// $('.likecount-<%= @prayer.id %>').html('<%= j pluralize(@prayer.get_upvotes.size, 'like', 'like\'s' ) %>');


$('.vpos').bind('ajax:success', function() {
 $('.vcount-<%= @prayer.id %>').html('<%=escape_javascript @prayer.get_upvotes.size.to_s %>');
});

// $('.votee#<%= prayer.id %>').html('<%= j render "vote", locals: { prayer: @prayer } %>');
//
// $('.likecount-<%= @prayer.id %>').html('<%= j pluralize(@prayer.get_upvotes.size, 'like', 'like\'s' ) %>');

//
// $('#counter-like').load('/pains/' + pain_id +'/prayers/' + prayer_id +'/upvote #counter-like')





$("<%=j @prayer.id %>").html("<%=j render partial: 'pains/upvote', locals: { prayer: @prayer } %>");

do ->
  #------ Methods-------
  afterLikePost = (e, data, status, xhr) ->
    link = $(this)
    count = link.closest('p').find('.count') # find the label for number of likes for the post
    
    if data.result is 'created'
      link.text('Unlike')
    else
      link.text('Like')
      
    # update number of likes  
    count.text(data.count)
        

  #------ Capture successful ajax request and update the sections of the page
  $(document).on 'ajax:success', '.like-post', afterLikePost

$(function(){
    $('.pjax').pjax('#content', {timeout: 8000});
    $('#content').bind(
      'pjax:start',
      function(){
        $('#content').hide();
      }
    ).bind(
      'pjax:end',
      function(){
        $('#content').fadeIn("fast");
      }
    );
})

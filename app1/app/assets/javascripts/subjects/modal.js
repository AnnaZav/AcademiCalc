jQuery(document).ready(function($){
    $(document).on('turbolinks:load', function() {
    $("body").on( "click", ".post-content", function() {
        var subject_heading = $(this).find(' .grey').html();
        var back = $(this).attr('href');
        var progress = $(this).find(' .hidden ').html();
        $('.loaded-data h4').text(subject_heading);
        $('.loaded-data .progress').html(progress);
        $('.loaded-data .back1 a').attr('href', back);
        $('.myModal').modal('show');
    });
  }); 
}); 

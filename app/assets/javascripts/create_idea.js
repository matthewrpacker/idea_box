$(function(){
  $("form").submit(function(event){
    event.preventDefault();

    var title = $("#idea-title").val();
    var body = $("#idea-body").val();
    var quality = $("#idea-quality").val();

    function rating(quality){
      if(quality == 0) {
        return "Swill"
      } else if(quality == 1){
        return "Plausible"
      } else {
        return "Genuis"
      }
    }

    function clearForm(id){
      $(id)[0].reset();
    }

    function newIdea(idea){
      var html = "<tr><td>"+ idea.title +"</td><td>"+ idea.body +"</td><td>"+ rating(idea.quality) +"</td></tr>";

      $('.idea-body').prepend(html);
      clearForm('.idea-form');
    }

    $.ajax({
      method: "POST",
      url: "api/v1/ideas",
      dataType: "JSON",
      data: { title: title, body: body, quality: quality },
      success: newIdea
    });
  });
});

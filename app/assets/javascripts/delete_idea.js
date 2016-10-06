$(function(){
  deleteSelectedIdea();
});

function deleteSelectedIdea(){
  $("button").on("click", function(event){
    event.preventDefault();

    var idea = $(this).closest('tr');

    var id = $(idea).attr('data-target');

    function deleteIdea(){
      $(idea).remove()
    }

    $.ajax({
      method: "DELETE",
      url: "api/v1/ideas/" + id,
      dataType: "JSON",
      success: deleteIdea(idea)
    });
  });
}

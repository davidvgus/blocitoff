
$(document).ready(function(){
  $(":checkbox").change(function() {
    var id = this.id;
    var todo_path = $(location).attr('href');
    todo_path = todo_path + "/" + this.id;
    window.last_deleted = {};
    window.last_deleted.upper_sybling = $(".row-" + id).prev();
    window.last_deleted.item = $(".row-" + id).detach();
    window.last_deleted.id = id;

    $.ajax({
      type: "DELETE",
      url: todo_path
    });
  });
});

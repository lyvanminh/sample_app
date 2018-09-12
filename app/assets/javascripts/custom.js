$(document).ready(function(){
  $("#micropost_picture").bind("change", function() {
    var size_in_megabytes = this.files[0].size/1024/1024;
    var over_max_size_error = $("#message_error").val();
    var max_size = $("#maxsizeimage").val() ;
    if (size_in_megabytes > max_size) {
      alert(over_max_size_error);
    }
  });
})

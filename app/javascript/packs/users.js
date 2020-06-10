// import Rails from 'rails-ujs'
// Rails.start()

 function destroythis() {
    var id = $(this).val();
    $.ajax({
        type:'DELETE',
        url: '/user/'+id,
        dataType : 'json',
        success:function(result){
             alert("Usuario borrado correctamente");
             $(this).closest('li').fadeOut();
            }
    });
}

$(function () {

  function integ_limit() {

    setTimeout(function () {
      if($(".sub_integrantes:visible").length > 4){
          $(".add_fields").addClass('disabled');
      }else{
        $(".add_fields.disabled").removeClass('disabled');
      }

      if($(".remove_fields:visible").length === 1){
        $(".remove_fields:visible").addClass('disabled');
      }else{
        $(".remove_fields.disabled:visible").removeClass('disabled');
      }
    }, 100);
  }

  $(".new_team, .edit_team").on("click",".remove_fields,.add_fields", function () {
    integ_limit();
  })

  $(".cpf-mask").mask("999.999.999-99");

  integ_limit();
});

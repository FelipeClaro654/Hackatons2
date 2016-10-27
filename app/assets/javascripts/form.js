$(function () {

  function integ_limit() {

    setTimeout(function () {
      if($(".sub_integrantes:visible").length > 4){
          $(".add_fields").addClass('disabled');
          return false;
      }
        $(".add_fields").removeClass('disabled');
    }, 100);
  }

  $(".new_team, .edit_team").on("click",".remove_fields,.add_fields", function () {
    integ_limit();
  })

  $(".cpf-mask").mask("999.999.999-99");

  integ_limit();
});

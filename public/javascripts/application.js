// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults
$(document).ready(function(){

    //Indicando que as requisicoes ajax serao enviadas ao controlador como .js
    jQuery.ajaxSetup({
        'beforeSend': function(xhr) {xhr.setRequestHeader("Accept", "text/javascript")}
    });
    //fim da configuracao do ajax

    //--------------------------------------------------------------------------------//--------------------------------

    //Escondendo as informacoes de registro apenas se o javascript estiver habilitado
    $("#registration").hide();
    //fim da configuracao para esconder informacoes do registro
    $(".s_tabs").tabs({ fx: { opacity: 'toggle', duration: 300 } });

     $("#product_images a[rel^='prettyPhoto'], #product_gallery a[rel^='prettyPhoto']").prettyPhoto({
       theme: 'light_square',
       opacity: 0.5
     });


    //--------------------------------------------//--------------------------------------------------------------------

    //Ao clicar no botao de adicionar endereco os campos de registro aparecem e os de endereco somem
    $("#add_endereco_btn").click(function(){
        $("#registration").show();
        $(".complement_address").hide();
    });
    //------------------------------------------------------------------------

    //ao soltar a tecla dentro do campo de cep ele verifica se possui 8 digitos e chama um posto para preenchimento do cep
    $("#zipcode_field").keyup(function(e){
        if ($("#zipcode_field").val().length == 8){
            $(this).attr("disabled", true);
            $("#zipcode_info").html("Carregando...");
            $.post("/customers", {zipcode: $(this).val()});
            e.preventDefault();
        }
    });

    $("#customer_telephone").mask("(99)9999-9999");
    $("#customer_celphone").mask("(99)9999-9999");
    $("#customer_birthdate").mask("99/99/9999");

    //ao soltar a tecla dentro do campo de cep ele verifica se possui 8 digitos e chama um posto para preenchimento do cep
    $("#cep_load").keyup(function(e){
        if ($("#cep_load").val().length == 8){
            $(this).attr("disabled", true);
            $("#cep_load_info").html("Carregando...");
            $.post("/customers", {zipcode: $(this).val()});
            $("#registration").show();
            $(".complement_address").show();
            e.preventDefault();
        }
    });
    //-----------------------------------------------------------------

    //adicionando mais de 1 endereço pra uma empresa.

});

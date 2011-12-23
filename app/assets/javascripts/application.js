//= require jquery  
//= require jquery_ujs  
//= require jquery-ui-1.8.14.custom.min
//= require jquery.prettyPhoto
//= require shoppica
//= require jquery.maskedinput-1.3.min
//= require_self  



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

    //----------------Notification Messages-----------------------//
    var myMessages = ['info','warning','error','success'];
    function hideAllMessages()
    {
        var messagesHeights = new Array(); // this array will store height for each
        for (i=0; i<myMessages.length; i++)
        {
            messagesHeights[i] = $('.' + myMessages[i]).outerHeight(); // fill array
            $('.' + myMessages[i]).css('top', -messagesHeights[i]); //move element outside viewport
        }
    }

    function showMessage(type)
    {
        hideAllMessages();
        $('.'+type).animate({top:"0"}, 500);
        setTimeout(
            function(){
                $('.'+type).animate({top: -$('.'+type).outerHeight()}, 500);
            },
            4000
        );              
    }

    // Initially, hide them all
    hideAllMessages();
    // Show message
    var sizeErrors = $('.error').length;
    if (sizeErrors > 0){
        showMessage('error');
    }

    var sizeSuccess = $('.success').length;
    if (sizeSuccess > 0){
        showMessage('success');
    }
        
       // When message is clicked, hide it
    $('.message').click(function(){
        $(this).animate({top: -$(this).outerHeight()}, 500);
    });  

});

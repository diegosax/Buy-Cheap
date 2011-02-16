// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults
$(document).ready(function(){
    $("#registration").hide();
    $("#add_endereco_btn").click(function(){
        $("#registration").show();
    });
});

$(document).ready(function(){
    $("#form_companies").validate({
        rules:{
            name:{
             required: true
            },
            razao_social:{
                required: true
            },
            CNPJ:{
                required: true
            }
        },
        messages:{
            name:{
                required: "Preencha o nome"
            },
            CNPJ:{
                required: "Preencha o CNPJ"
            },
            razao_social:{
                required: "Preencha a razao-social"
            }
        }
    });

});

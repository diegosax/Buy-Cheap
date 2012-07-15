#encoding: utf-8

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)
Company.destroy_all
Product.destroy_all

Company.create(:name => "Submarino", :razao_social => "Submarino", :document => "123456",
               :area => "Geral", :telephone => "1133333333", :celphone => "1181818181",
               :email => "submarino@submarino.com", :password => "123456", :password_confirmation => "123456",
               :remote_image_url => "http://img.submarino.com.br/img/logo.png")
Company.create(:name => "Saraiva", :razao_social => "Saraiva", :document => "123456",
               :area => "Geral", :telephone => "8133333333", :celphone => "8181818181",
               :email => "saraiva@saraiva.com", :password => "123456", :password_confirmation => "123456",
               :remote_image_url => "http://www.linkatual.com/wp-content/uploads/2011/02/livraria_saraiva.gif")
Company.create(:name => "Lojas Americanas", :razao_social => "Lojas Americanas", :document => "123456",
               :area => "Geral", :telephone => "8133333333", :celphone => "8181818181",
               :email => "americanas@americanas.com", :password => "123456", :password_confirmation => "123456")
Company.create(:name => "InfoBox", :razao_social => "InfoBox", :document => "123456",
               :area => "Geral", :telephone => "8133333333", :celphone => "8181818181",
               :email => "infobox@infobox.com", :password => "123456", :password_confirmation => "123456")
Company.create(:name => "Motorola", :razao_social => "Motorola", :document => "123456",
               :area => "Geral", :telephone => "8133333333", :celphone => "8181818181",
               :email => "motorola@motorola.com", :password => "123456", :password_confirmation => "123456")
Company.create(:name => "Lilah Beauty Hair", :razao_social => "Lilah Beauty Hair", :document => "123456",
               :area => "Geral", :telephone => "8133333333", :celphone => "8181818181",
               :email => "lilah@lilah.com", :password => "123456", :password_confirmation => "123456")
Company.create(:name => "F5Filmes", :razao_social => "F5Filmes", :document => "123456",
               :area => "Geral", :telephone => "8133333333", :celphone => "8181818181",
               :email => "f5filmes@f5filmes.com", :password => "123456", :password_confirmation => "123456")
Company.create(:name => "RHF Talentos", :razao_social => "RHF Talentos", :document => "123456",
               :area => "Geral", :telephone => "8133333333", :celphone => "8181818181",
               :email => "rhf@rhf.com", :password => "123456", :password_confirmation => "123456")

submarino = Company.find_by_email("submarino@submarino.com")
puts submarino.inspect
saraiva = Company.find_by_email("saraiva@saraiva.com")
americanas = Company.find_by_email("americanas@americanas.com")
infobox = Company.find_by_email("infobox@infobox.com")
motorola = Company.find_by_email("motorola@motorola.com")
lilah = Company.find_by_email("lilah@lilah.com")
f5filmes = Company.find_by_email("f5filmes@f5filmes.com")
rhf = Company.find_by_email("rhf@rhf.com")
puts rhf.inspect

submarino.products.create(
  :name=> "HD Externo 1TB Hitachi",
  :short_description => "Capacidade aproximada para: 230 mil arquivos em MP3, ou 400 mil imagens de 5 megapixels ou 2.600 horas de vídeo.",
  :description => "Sólido. Sempre pronto nos momentos que você precisa. Com a confiável velocidade USB 2.0.
                   Quando você precisa de grande capacidade de armazenamento, escolha uma unidade que armazena a sua vida com mais simplicidade. Porque nada deve se colocar entre você e suas recordações, seus filmes, músicas e entretenimento. Apoiado pela qualidade e confiabilidade além da renomada tradição mundial de Pesquisa e Desenvolvimento de avançados Discos Rígidos usados para armazenar, preservar e gerenciar as mais importantes informações do mundo.",
  :stock => 20,
  :original_price =>249,
  :price => 100,
  :shippable => true,
  :remote_image_url => "http://i.s8.com.br/images/software/cover/img5/21831185.jpg",
  :available_on => DateTime.now,
  :deleted_at => DateTime.now + 1.month,
  :category => Category.find_by_name("Eletrônicos")
)
submarino.products.create(
  :name=> "Cartucho Preto para Epson TX560WD e TX620FWD",
  :short_description => "Imprima os seus documentos, textos e imagens com um cartucho com a garantia de qualidade da Epson. ",
  :description => "Imprima os seus documentos, textos e imagens com um cartucho com a garantia de qualidade da Epson. Os cartuchos são especialmente desenvolvidos para que a impressora renda seu máximo potencial, para manter um funcionamento estável e, sobre tudo, para garantir os mais altos níveis de qualidade de impressão.

-Tinta pigmentada - DuraBrite Ultra.
-Preto.
-Compatível com TX560WD e TX620FWD.
-Volume de 25ml.
.",
  :stock => 15,
  :original_price =>89,
  :price => 38,
  :shippable => true,
  :remote_image_url => "http://i.s8.com.br/images/software/cover/img4/23775674.jpg",
  :available_on => DateTime.now,
  :deleted_at => DateTime.now + 1.month,
  :category => Category.find_by_name("Eletrônicos")

)
submarino.products.create(
  :name=> "Relogio masculino Technos 6P29AM/1C",
  :short_description => "6P29AM/1C ",
  :description => "A linha de relógios Technos reúne o que há de melhor em qualidade e sofisticação. Invista no seu visual!

- Mecanismo: analógico
- Estilo: casual
- Genero:masculino
- Tipo de Alimentação: bateria Quartz
- Duração da bateria: 12 meses
- Resistência à água: 100 metros
- Material da Caixa: aço inox
- Material da Pulseira: aço inox
- Cor da pulseira: prata
",
  :stock => 65,
  :original_price =>359,
  :price => 200,
  :shippable => true,
  :remote_image_url => "http://i.s8.com.br/images/finegifts/cover/img6/21320226.jpg",
  :available_on => DateTime.now,
  :deleted_at => DateTime.now + 1.month

)

submarino.products.create(
  :name=> "Bateria Rhythm Traveler RT-705HC Branca - PEARL",
  :short_description => "Bateria Rhythm Traveler",
  :description => "O kit perfeito para o baterista profissional ou iniciante, que necessita de um kit portátil e de alta qualidade. As novas Rhythm Traveler atendem os bateristas que estão cansados de condicionar seus shows ou estudos à conveniência de outras pessoas. Qualquer baterista sabe que encontrar um lugar para tocar sem perturbar outras pessoas com o barulho é algo muito difícil. Imagine poder praticar a qualquer hora do dia ou da noite, sem incomodar as pessoas do cômodo ao lado, e ainda poder transportar esse kit, com todas as peças devidamente acomodadas no banco de trás de seu carro, para apresentar-se ao vivo. Essa é a Rhythm Traveler; o único kit que reúne as necessidades de um baterista, a um preço acessível.
",
  :stock => 10,
  :original_price =>2819,
  :price => 1500,
  :shippable => true,
  :remote_image_url => "http://i.s8.com.br/images/musical/cover/img5/1946045.jpg",
  :available_on => DateTime.now,
  :deleted_at => DateTime.now + 1.month

)

submarino.products.create(
  :name=> "DVD Automotivo 7 Retrátil com Entradas USB SD e AUX BVX-D977 - Bravox",
  :short_description => "Com o DVD Player da Bravox, você pode assistir aos vídeos de sua preferência e ainda ouvir as músicas salvas em seu aparelho portátil, por meio da entrada USB
.",
  :description=> "Assim fica fácil e até prazeroso passar horas parado no trânsito!
Com o DVD Player da Bravox, você pode assistir aos vídeos de sua preferência e ainda ouvir as músicas salvas em seu aparelho portátil, por meio da entrada USB
. O leitor de cartões tmabém facilita o acesso aos seus arquivos de áudio e vídeo permitindo a reprodução de suas
coletâneas ou videoclipes. Para manter-se informado enquanto conduz o veículo, você também pode desfrutar da programação
das rádios AM e FM.",
  :stock => 50,
  :original_price =>800,
  :price => 399,
  :shippable => true,
  :remote_image_url => "http://i.s8.com.br/images/electronic/cover/img6/21822016.jpg",
  :available_on => DateTime.now,
  :deleted_at => DateTime.now + 1.month,
  :category => Category.find_by_name("Eletrônicos")

)

submarino.products.create(
  :name=> "PNEU 225/40 ZR 19 (93Y) PILOT SPORT ",
  :short_description => "Herdou a experiência da Fórmula 1.",
  :description => "Herdou a experiência da Fórmula 1. É o pneu de referência na Porsche.
É o mais rápido e mais preciso do mercado!
Experiência na F1, comprovada pelo desenho semelhante da banda de rodagem.",
  :stock => 200,
  :original_price =>1999,
  :price => 700,
  :shippable => true,
  :remote_image_url => "http://i.s8.com.br/images/electronic/cover/img5/21415215.jpg",
  :available_on => DateTime.now,
  :deleted_at => DateTime.now + 1.month

)

submarino.products.create(
  :name=> "Aparelho Playstation Portatil PSP Core Black ",
  :short_description => "O PSP Core, tem tudo o que o mais velho PSP tinha, mas agora inclui um microfone embutido, que lhe permite tirar partido das
características vocais em alguns jogos, bem como a funcionalidade PSP built-in Skype sem ter que utilizar um auricular.",
  :description => "O novo PSP Core inclui também uma melhoria da tela anti-reflexiva que oferece maior visibilidade em lugares mais bem iluminados e pode até mesmo ser utilizado no exterior.
O PSP foi concebido para lidar com todas as variedades de aplicações e de entretenimento - música, vídeo, comunicação de rede sem fio, e, claro, jogos. Os usuários desfrutarão de top-notch,
jogos 3D de alta qualidade, vídeo full motion, e áudio de alta fidelidade.",
  :stock => 200,
  :original_price =>599,
  :price => 349,
  :shippable => true,
  :remote_image_url => "http://i.s8.com.br/images/games/cover/img2/21498232.jpg",
  :available_on => DateTime.now,
  :deleted_at => DateTime.now + 1.month,
  :category => Category.find_by_name("Eletrônicos")

)

submarino.products.create(
  :name=> "Kinect - Xbox 360 ",
  :short_description => "Compativel com XBOX 360",
  :description => "Kinect representa a revolução na maneira de jogar e se divertirem família, onde você é o controle. Com o Kinect você pode utilizar os braços,
 pernas, pé e mãos para jogar diversos tipos de games, sem nenhum tipo de controle. Faça parte do jogo com Kinect!",
  :stock => 200,
  :original_price =>599,
  :price => 370,
  :shippable => true,
  :remote_image_url => "http://i.s8.com.br/images/games/cover/img7/22950507.jpg",
  :available_on => DateTime.now,
  :deleted_at => DateTime.now + 1.month,
  :category => Category.find_by_name("Eletrônicos")

)

infobox.products.create(
  :name=> "Guitar Hero: Warriors of Rock (Guitar Bundle) - PS3 Bundle",
  :short_description => "Embarque em uma jornada épica para salvar o rock n´roll na experiência mais imersiva de videogame até hoje.",
  :description => "Seguindo a tradição e as características de jogabilidade premiada que fez de Guitar Hero uma das franquias mais populares de todos os tempos, esta
 edição oferece uma experiência interativa completa que coloca amigos e inimigos no palco da maior experiência do rock.",
  :stock => 200,
  :original_price =>349,
  :price => 180,
  :shippable => true,
  :remote_image_url => "http://i.s8.com.br/images/games/cover/img1/23014701.jpg",
  :available_on => DateTime.now,
  :deleted_at => DateTime.now + 1.month,
  :category => Category.find_by_name("Eletrônicos")

)

motorola.products.create(
  :name=> "Smartphone Motorola Spice Desbl. TIM Android 2.1 3G WiFi Câm 3.2MP 2GB",
  :short_description => "Sofisticação e ecologicamente correto. Esse é o Motorola Spice XT-300! ",
  :description => "Sofisticação e ecologicamente correto. Esse é o Motorola Spice XT-300! Tem a exclusiva interface Flashback, que
organiza em uma linha de tempo futurista as últimas ações executadas no smartphone como fotos, chamadas, mensagens,
emails, vídeos e novidades das redes sociais organizadas na ordem dos acontecimentos.",
  :stock => 220,
  :original_price =>499,
  :price => 234,
  :shippable => true,
  :remote_image_url => "http://i.s8.com.br/images/telecoms/cover/img5/23850105.jpg",
  :available_on => DateTime.now,
  :deleted_at => DateTime.now + 1.month,
  :category => Category.find_by_name("Eletrônicos")

)

motorola.products.create(
  :name=> "Smartphone Motorola ATRIX 3G Android 2.2 Dual Core 1GHz 5MP 16GB +Dock",
  :short_description => "Smartphone ou computador? Que tal os dois? Esse é o Motorola Atrix que é praticamente um computador. Com a Dock Multimídia,
você conecta teclado, mouse, pen drive, sua TV HDMI e o MOTOROLA ATRIX roda programas e aplicativos por meio do WEBTOP. ",
  :description => "Munido com uma tela sensível ao toque de , processador dual core Tegra 2 de 1Ghz e 1GB de memória RAM,
  tem sistema operacional Android 2.2, Wi-Fi, GPS, Bluetooth, câmera de 5MP com Flash Dual-LED, que grava vídeos em alta definição
  e tem 16GB de armazenamento interno! Na parte traseira, tem leitor biométrico capaz de cadastrar as digitais dos dedos
  indicadores das mãos esquerda e direita para desbloquear o aparelho, apenas deslizando o dedo",
  :stock => 220,
  :original_price =>1999,
  :price => 1100,
  :shippable => true,
  :remote_image_url => "http://i.s8.com.br/images/telecoms/cover/img4/23816374.jpg",
  :available_on => DateTime.now,
  :deleted_at => DateTime.now + 1.month,
  :category => Category.find_by_name("Eletrônicos")

)

motorola.products.create(
  :name=> "Motorola Screen EX128 Dual Chip Desbl. Claro Touch Câm 3MP FM MP3 2GB ",
  :short_description => "Liberdade de escolha! Com o Motorola Screen Dual Chip EX128 você pode ter 2 chips de diferentes operadoras
em um único celular e acesso direto ao Orkut, Twitter, Facebook e MySpace por meio de menu específico.",
  :description => "Além disso, o Motorola Screen Dual Chip EX128 tem design elegante e tela de 3.2
de alta resolução, câmera de 3MP para fotos e vídeos e editor de imagens. Suporta cartão de memória
 até 32Gb microSD e USB 2.0, funcionando como Pen Drive. Você pode deixar o celular do jeito que quiser
e customizar os widgets, ouvir suas músicas prediletas com o Music Player ou com o rádio FM estéreo.",
  :stock =>100,
  :original_price =>449,
  :price => 229,
  :shippable => true,
  :remote_image_url => "http://i.s8.com.br/images/telecoms/cover/img6/23772196.jpg",
  :available_on => DateTime.now,
  :deleted_at => DateTime.now + 1.month,
  :category => Category.find_by_name("Eletrônicos")

)
americanas.products.create(
  :name=> " TV 40 LED 3D Full HD Smart TV, 240Hz, All Share - D6000 - Samsung",
  :short_description => "A experiência 3D cria um novo mundo de imagens e, além disso,
a série 6000 reproduz imagens perfeitas por meio da tecnologia Clear Motion Rate 240Hz
para você curtir filmes, games e os seus programas favoritos em outra dimensão. ",
  :description=> "A Samsung D6000 vai transformar a sua experiência ao assistir TV com muito estilo e inteligência! O mundo Premium Smart TV abre uma nova dimensão de entretenimento na sua casa, com o Smart Hub que lhe permite interagir com a sua TV. Desde curtir
suas fotos até se encantar com os seus vídeos, o que se torna tudo muito mais fácil do que antes e muito mais divertido.",
  :stock => 30,
  :original_price =>2800,
  :price => 1500,
  :shippable => true,
  :remote_image_url => "http://i.s8.com.br/images/electronic/cover/img6/23814296.jpg",
  :available_on => DateTime.now,
  :deleted_at => DateTime.now + 1.month,
  :category => Category.find_by_name("Eletrônicos")

)

infobox.products.create(
    :name => "Navegador GPS",
    :short_description => "Navegador GPS Guia Quatro Rodas 3.5' Br350 C/ 1600 Cidades, Alerta de Limite de Velocidade, Central",
    :description => "Gps navegador guia 4 rodas tela 3.5', mais de 1600 cidades mapeadas e mais de 600 cidades auditadas,
                      alerta de limite de velocidade, guia de faixas, text to speech e central multimídia.

                      Tela touchscreen de 3.5', fino compacto e leve o GPS Navegador Guia 4 Rodas tem o melhor conteúdo do mercado,
                      com pontos de interesse do conhecido Guia 4 Rodas e iLocal. Possui alerta de limite de velocidades atualizado
                      gratuitamente, Text to Speech -menciona os nomes das ruas durante seu trajeto,
                      Guia de faixas - indicação das faixas corretas de navegação e Central Multimidia fotos (jpg,pmp,gif,png),
                      videos (WMV) ; musicas (WMA) e Livro - txt. Mapas do Brasil e Argentina.

                      CARACTERÍSTICAS:
                      Marca: Movix
                      Garantia: 12 meses",
    :stock => 25,
    :original_price => 229,
    :price => 130,
    :shippable => true,
    :remote_image_url => "http://images.livrariasaraiva.com.br/imagem/imagem.dll?pro_id=3440730&L=500&A=-1&PIM_Id=&ID=BB7001F47DB08111513101116&PAC_ID=33963",
    :available_on => DateTime.now,
    :deleted_at => DateTime.now + 1.month,
    :category => Category.find_by_name("Eletrônicos")
)
saraiva.products.create(
    :name => "As Crônicas de Gelo e Fogo - Vol. 3",
    :short_description => "Autor: George R. R. Martin
                          Editora: Leya Brasil
                          Categoria: Literatura Estrangeira / Romance
                          A tormenta de espadas, o terceiro livro da série de George R. R. Martin, onde os Sete Reinos já sentem o rigoroso
                          inverno que chega, mas as batalhas parecem estar mais cruéis e impiedosas.",
    :description => "A tormenta de espadas, o terceiro livro da série de George R. R. Martin, onde os Sete Reinos já sentem o rigoroso inverno
                    que chega, mas as batalhas parecem estar mais cruéis e impiedosas. Enquanto os Sete Reinos estremecem com a chegada dos temíveis selvagens pela
                    Muralha, numa maré interminável de homens, gigantes e terríveis bestas, Jon Snow, o Bastardo de Winterfell, que se encontra entre eles, divide-se
                    entre sua consciência e o papel que é forçado a desempenhar. Robb Stark, o Jovem Lobo, vence todas as suas batalhas, mas será que ele conseguirá
                    vencer os desafios que não se resolvem apenas com a espada? Arya continua a caminho de Correrrio, mas mesmo alguém tão desembaraçado como ela
                    terá grande dificuldade em ultrapassar os obstáculos que se aproximam. Na corte de Joffrey, em Porto Real, Tyrion luta pela vida, depois de ter
                    sido gravemente ferido na Batalha da Água Negra; e Sansa, livre do compromisso com o homem que agora ocupa o Trono de Ferro, precisa lidar
                    com as consequências de ser a segunda na linha de sucessão de Winterfell, uma vez que Bran e Rickon estariam mortos. No Leste, Daenerys Targaryen
                    navega em direção às terras da sua infância, mas antes ela precisará aportar às desprezíveis cidades dos esclavagistas.
                    Mas a menina indefesa agora é uma mulher poderosa. Quem sabe quanto tempo falta para se transformar em uma conquistadora impiedosa?",
    :stock => 25,
    :original_price => 43.9,
    :price => 30,
    :shippable => true,
    :remote_image_url => "http://www.livrariasaraiva.com.br/imagem/imagem.dll?L=500&qld=100&A=-1&pro_id=3647893&PIM_Id=1000372893",
    :available_on => DateTime.now,
    :deleted_at => DateTime.now + 1.month
)

saraiva.products.create(
    :name => "Playstation 3 Slim Hd 160gb Sony",
    :short_description => "Console Oficial Sony Brasil - Ps3
                            Fornecedor: Playstation - Sony Brasil
                            Categoria: Playstation 3 / Consoles",
    :description => "A versão Slim de 160 GB é a melhor opção para jogos, reune uma
                    combinação de funcionalidades multimídias, bem como uma série de novos
                    avanços e aperfeiçoamentos mesmo sendo 33% menor e 36% mais leve que as
                    primeiras versões. Com muito espaço de armazenamento para jogos,
                    músicas, vídeos e fotos, o sistema built-in Blu-ray player oferece a
                    melhor experiência em imagens em alta-definição disponível, seja para
                    jogos, filmes em Blu-Ray, músicas ou serviços online.



                    Assistência Técnica Sony: 0800-880-SONY ou (11) 4003-7669.

                    Novo sistema PS3, mais fino e mais leve

                    • Unidade de disco rígido de 160GB para armazenar jogos, músicas, vídeos e fotos
                    • Reprodutor Blu-ray interno
                    • Adesão gratuita à PlayStation® Network
                    • Reproduz DVDs e CDs
                    • Wi-Fi interno
                    • Saída HDMI para resolução 1080p",
    :stock => 25,
    :original_price => 1399,
    :price => 500,
    :shippable => true,
    :remote_image_url => "http://www.livrariasaraiva.com.br/imagem/imagem.dll?L=500&qld=100&A=-1&pro_id=3371314&PIM_Id=1000286567",
    :available_on => DateTime.now,
    :deleted_at => DateTime.now + 1.month,
    :category => Category.find_by_name("Eletrônicos")
)

puts "Playstation"
americanas.products.create(
    :name => "Tablet Motorola Xoom c/ Sistema Operacional Android 3.0 (Honeycomb)",
    :short_description => "Processador Dual Core 1GHz, 1GB RAM, 32GB HD, Wi-Fi, Câmera 5MP c/
                          Flash LED e Frontal 2MP, Filmadora HD, Saída HDMI e Micro USB, Tela HD 10' - Motorola",
    :description => "Preços válidos somente para compras na internet e por telefone. Em caso de divergência,
                    o preço válido é o da Sacola de Compras.

                    Imagem meramente ilustrativa",
    :stock => 5,
    :original_price => 1599,
    :price => 799,
    :shippable => true,
    :remote_image_url => "http://www.interessante.com.br/images/thumbs/0001021.jpeg",
    :available_on => DateTime.now,
    :deleted_at => DateTime.now + 1.month,
    :category => Category.find_by_name("Eletrônicos")
)

puts "Motorola xoom"

lilah.products.create(
    :name => "Hidratação Profunda Trivitt com Multi Vitaminas+Silicone",
    :short_description => "Hidratação Profunda Trivitt com Multivitaminas+Extrato Vegetais de Queratina com
                          Pantenol+Algas Marinhas+Aloe Vera+Proteina da Seda+Colageno+Proteina do Trigo e Silicone. ",
    :description => "1 - Hidratação Intensiva
Multi vitaminas, extratos vegetais e queratina.
Associa o poder nutritivo e revitalizante das vitaminas A, E e F, com o poder tonificante e hidratante dos extratos vegetais de algas marinhas, aloe vera e jaborandi.
A Queratina auxilia na reestruturação do fio danificado, fortalecendo-o e protegendo-o. Silicones nobres formam um filme emoliente sobre os fios deixando os sedosos, macios e maleáveis.",
    :stock => 75,
    :original_price => 75,
    :price => 7.5,
    :shippable => true,
    :remote_image_url => "http://www.pescariaweb.com.br/V2/static/team/2011/0812/13131803096989.jpg",
    :available_on => DateTime.now,
    :deleted_at => DateTime.now + 1.month,
    :category => Category.find_by_name("Beleza e Saúde")
)

f5filmes.products.create(
    :name => "Ensaio Fotográfico",
    :short_description => "Além de ser uma ótima maneira para relembrar aqueles momentos que não voltam mais, a fotografia
também pode ser uma excelente maneira para você cuidar da sua autoestima e bem-estar. Quer saber como?",
    :description => "Além de ser uma ótima maneira para relembrar aqueles momentos que não voltam mais, a fotografia também pode ser uma excelente maneira para você cuidar da sua autoestima e bem-estar. Quer saber como?

Hoje, o Groupon traz a você um ótimo desconto de 79% em 1 ensaio fotográfico + DVD com 40 fotos + fotoclip musical + cabelo + maquiagem, de R$ 700 por R$ 149, na F5filmes.com

E então, quer maneira mais agradável que esta para sentir-se bem? Aproveite esta oferta para eternizar momentos dedicados a você.",
    :stock => 10,
    :original_price => 700,
    :price => 149,
    :shippable => true,
    :remote_image_url => "http://static.br.groupon-content.net/65/58/1313762875865.jpg",
    :available_on => DateTime.now,
    :deleted_at => DateTime.now + 1.month,
    :category => Category.find_by_name("Serviço")
)

rhf.products.create(
    :name => "Elaboração de Currículos + Carta de Apresentação",
    :short_description => "•	A porta de entrada para as grandes empresas;
•	Trabalho feito por profissionais especializados;
•	Destaque-se dos demais candidatos;
•	Currículo objetivo e profissional, contendo toda sua experiência e formação;
•	Carta de apresentação sucinta, destacando suas qualidades;
•	Mostre eficiência e profissionalismo;
•	Entrega em 5 dias úteis;",
    :description => "•	Cupom válido por 90 (noventa dias) de 23/08/2011 á 30/08/2011;

•	Sem limite de compras por pessoa e para presente;

•	O cupom estará disponível em sua conta do Galera Clube em até 24h após a confirmação do pagamento;

•	Para fazer o pedido, envie um e-mail para psicologia@rhf.com.br solicitando o serviço e informando o
código de seu cupom, você preenche um formulário com as informações sobre sua formação e experiências e,
em até 5 dias úteis, recebe seu currículo e sua carta de apresentação prontos para serem distribuídos;",
    :stock => 50,
    :original_price => 220,
    :price => 88,
    :shippable => true,
    :remote_image_url => "http://www.galeraclube.com/static/team/2011/0822/13140112492623.jpg",
    :available_on => DateTime.now,
    :deleted_at => DateTime.now + 1.month,
    :category => Category.find_by_name("Serviço")
)
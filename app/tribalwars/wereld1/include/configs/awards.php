<?php
$cl_awards = new awards();

$cl_awards->desc_stage = array();
$cl_awards->desc_stage[0] = "Kazanılmadı";
$cl_awards->desc_stage[1] = "Ahşap - Seviye 1";
$cl_awards->desc_stage[2] = "Bronz - Seviye 2";
$cl_awards->desc_stage[3] = "Gümüş - Seviye 3";
$cl_awards->desc_stage[4] = "Altın - Seviye 4";

//medalhas Fixas
$cl_awards->add_awards("Puan Ustası","points");
$cl_awards->set_need(array("1" => "100", "2" => "5000", "3" => "100000", "4" => "10000000"));
$cl_awards->set_maxstage("4");
$cl_awards->set_nextStage("%*% puana ulaş.");
$cl_awards->set_thisStage("%*% puana ulaştın.");
$cl_awards->set_type("fix");
$cl_awards->set_description("É necessário atingir uma certa pontuação para poder ganhar esta medalha.");

$cl_awards->add_awards("Puan Lideri","rank");
$cl_awards->set_need(array("1" => "1000", "2" => "100", "3" => "20", "4" => "1"));
$cl_awards->set_maxstage("4");
$cl_awards->set_nextStage("Dünya sıralamasında ilk %*% içine gir.");
$cl_awards->set_thisStage("Dünya sıralamasında ilk %*% içine girdin.");
$cl_awards->set_type("fix_rank");
$cl_awards->set_description("É necessário estar em uma determinada classificação na classificação geral.");

$cl_awards->add_awards("Yağmacı","lad");
$cl_awards->set_need(array("1" => "500", "2" => "10000", "3" => "100000", "4" => "1000000"));
$cl_awards->set_maxstage("4");
$cl_awards->set_nextStage("%*% kaynak yağmala.");
$cl_awards->set_thisStage("%*% kaynak yağmaladın.");
$cl_awards->set_type("fix");
$cl_awards->set_description("É necessário saquear um certo número de kaynaklar.");

$cl_awards->add_awards("Akıncı","saque");
$cl_awards->set_need(array("1" => "10", "2" => "100", "3" => "1000", "4" => "10000"));
$cl_awards->set_maxstage("4");
$cl_awards->set_nextStage("%*% köy yağmala.");
$cl_awards->set_thisStage("%*% köy yağmaladın.");
$cl_awards->set_type("fix");
$cl_awards->set_description("É necessário saquear um certo número de aldeias.");

$cl_awards->add_awards("Fatih","conquer");
$cl_awards->set_need(array("1" => "5", "2" => "50", "3" => "500", "4" => "1000"));
$cl_awards->set_maxstage("4");
$cl_awards->set_nextStage("%*% köy fethet.");
$cl_awards->set_thisStage("%*% köy fethettin.");
$cl_awards->set_type("fix");
$cl_awards->set_description("Medalha ganha quando conquista uma certa quantidade de aldeias.");

$cl_awards->add_awards("Komutan","lider");
$cl_awards->set_need(array("1" => "10000", "2" => "100000", "3" => "1000000", "4" => "20000000"));
$cl_awards->set_maxstage("4");
$cl_awards->set_nextStage("%*% düşman birliği yok et.");
$cl_awards->set_thisStage("%*% düşman birliği yok ettin.");
$cl_awards->set_type("fix");
$cl_awards->set_description("É necessário abater um certo número de birliks inimigas.");

$cl_awards->add_awards("Kahramanın Ölümü","hero");
$cl_awards->set_need(array("1" => "100", "2" => "1000", "3" => "10000", "4" => "100000"));
$cl_awards->set_maxstage("4");
$cl_awards->set_nextStage("Müttefiklerini desteklerken %*% birlik kaybet.");
$cl_awards->set_thisStage("Müttefiklerini desteklerken %*% birlik kaybettin.");
$cl_awards->set_type("fix");
$cl_awards->set_description("Esta medalha é ganha quando perde um certo número de birliks que foram enviadas por você em apoio.");

$cl_awards->add_awards("Rezerve Fatihi","reserved");
$cl_awards->set_need(array("1" => "10", "2" => "50", "3" => "100", "4" => "1000"));
$cl_awards->set_maxstage("4");
$cl_awards->set_nextStage("Conquiste %*% aldeias reservadas.");
$cl_awards->set_thisStage("Siz ja conquistou %*% aldeias reservadas!");
$cl_awards->set_type("fix");
$cl_awards->set_description("Ganha esta medalha ao conquistar aldeias reservadas.");

$cl_awards->add_awards("Tüccar","merkat");
$cl_awards->set_need(array("1" => "10", "2" => "100", "3" => "500", "4" => "1000"));
$cl_awards->set_maxstage("4");
$cl_awards->set_nextStage("Pazarda %*% kez ticaret yap.");
$cl_awards->set_thisStage("Pazarda %*% kez ticaret yaptın.");
$cl_awards->set_type("fix");
$cl_awards->set_description("É necessário negociar kaynaklar através do mercado.");

$cl_awards->add_awards("Sadık Dost","friends");
$cl_awards->set_need(array("1" => "10", "2" => "25", "3" => "50", "4" => "100"));
$cl_awards->set_maxstage("4");
$cl_awards->set_nextStage("%*% arkadaş edin.");
$cl_awards->set_thisStage("%*% arkadaş edindin.");
$cl_awards->set_type("fix");
$cl_awards->set_description("Faça amizades para obter esta medalha.");

$cl_awards->add_awards("Savaş Komutanı","wars");
$cl_awards->set_need(array("1" => "10", "2" => "25", "3" => "100", "4" => "200"));
$cl_awards->set_maxstage("4");
$cl_awards->set_nextStage("%*% oyuncuya saldır.");
$cl_awards->set_thisStage("%*% oyuncuya saldırdın.");
$cl_awards->set_type("fix");
$cl_awards->set_description("É necessário atacar oyuncues.");

$cl_awards->add_awards("Yıkım Ustası","demolisher");
$cl_awards->set_need(array("1" => "25", "2" => "250", "3" => "2500", "4" => "10000"));
$cl_awards->set_maxstage("4");
$cl_awards->set_nextStage("Destrua %*% niveis de edifícios!");
$cl_awards->set_thisStage("Siz já destruiu %*% níveis de edifícios!");
$cl_awards->set_type("fix");
$cl_awards->set_description("É necessário destruir uma quantidade de níveis de edifícios.");

$cl_awards->add_awards("Silah Arkadaşı","tribo");
$cl_awards->set_need(array("1" => "30", "2" => "60", "3" => "180", "4" => "360"));
$cl_awards->set_maxstage("4");
$cl_awards->set_nextStage("Permaneça %*% dias em uma tribo!");
$cl_awards->set_thisStage("Siz é membro de sua tribo a %*% dias!");
$cl_awards->set_type("fix");
$cl_awards->set_description("É necessário passar um determinado período de dias na mesma tribo.");

$cl_awards->add_awards("Misyoner Avcısı","nobles_faith");
$cl_awards->set_need(array("1" => "15", "2" => "100", "3" => "350", "4" => "700"));
$cl_awards->set_maxstage("4");
$cl_awards->set_nextStage("%*% misyoner yen.");
$cl_awards->set_thisStage("%*% misyoner yendin.");
$cl_awards->set_type("fix");
$cl_awards->set_description("Número de nobres mortos em batalhas.");

$cl_awards->add_awards("Savaş Alanı Ustası","master_camp");
$cl_awards->set_need(array("1" => "25", "2" => "250", "3" => "1500", "4" => "2500"));
$cl_awards->set_maxstage("4");
$cl_awards->set_nextStage("Destruir completamente %*% exércitos inimigos!");
$cl_awards->set_thisStage("Siz já destruiu completamente %*% exércitos inimigos!");
$cl_awards->set_type("fix");
$cl_awards->set_description("Número de batalhas vencidas, pequenas batalhas não serão contadas!");

$cl_awards->add_awards("Destekçi","refors");
$cl_awards->set_need(array("1" => "50", "2" => "100", "3" => "500", "4" => "3000"));
$cl_awards->set_maxstage("4");
$cl_awards->set_nextStage("Apoie outro oyuncu em %*% batalhas!");
$cl_awards->set_thisStage("Apoiou outro oyuncu em %*% batalhas!");
$cl_awards->set_type("fix");
$cl_awards->set_description("Número de batalhas que estiveram envolvidos seus apoios.");

$cl_awards->add_awards("Casus Avcısı","scout");
$cl_awards->set_need(array("1" => "25", "2" => "50", "3" => "250", "4" => "500"));
$cl_awards->set_maxstage("4");
$cl_awards->set_nextStage("Defender-se de %*% ataques de exploradores!");
$cl_awards->set_thisStage("Siz já defendeu-se de %*% ataques de exploradores!");
$cl_awards->set_type("fix");
$cl_awards->set_description("Defenda-se com sucesso de ataques de exploradores.");

$cl_awards->add_awards("Kendi Kendine Saldırı","aatack");
$cl_awards->set_need(array("1" => "10", "2" => "100", "3" => "1000", "4" => "10000"));
$cl_awards->set_maxstage("4");
$cl_awards->set_nextStage("Atacou a si mesmo e perdeu mais de %*% birliks em uma batalha.");
$cl_awards->set_thisStage("Atacou a si mesmo e perdeu mais de %*% birliks em uma batalha.");
$cl_awards->set_type("fix");
$cl_awards->set_description("Ganha esta medalha o oyuncu que perder um certo número de birliks devido aos seus ataques (auto-ataques)!");

$cl_awards->add_awards("Altın Zenginliği","gold");
$cl_awards->set_need(array("1" => "50", "2" => "500", "3" => "5000", "4" => "50000"));
$cl_awards->set_maxstage("4");
$cl_awards->set_nextStage("%*% altın para bas.");
$cl_awards->set_thisStage("%*% altın para bastın.");
$cl_awards->set_type("fix");
$cl_awards->set_description("Número de moedas cunhadas.");

// medalhas fixas mais com apenas um nivel
$cl_awards->add_awards("Şanslı","gluck");
$cl_awards->set_need(array("1" => "1"));
$cl_awards->set_maxstage("1");
$cl_awards->set_nextStage("A lealdade de uma aldeia deve ser 0 após você conquistá-la!");
$cl_awards->set_thisStage("A lealdade de uma aldeia caiu para 0 devido a uma de suas conquistas!");
$cl_awards->set_type("fix_one");
$cl_awards->set_description("Quando se tem sorte a fazer ataques.");

$cl_awards->add_awards("Şanssız","bluck");
$cl_awards->set_need(array("1" => "1"));
$cl_awards->set_maxstage("1");
$cl_awards->set_nextStage("A lealdade de uma aldeia deve cair para 1 devido ao seu ataque!");
$cl_awards->set_thisStage("A lealdade de uma aldeia caiu para 1 devido a um dos seus ataques!");
$cl_awards->set_type("fix_one");
$cl_awards->set_description("A Lealdade de uma aldeia caiu para 1 devido a um ataque seu!");

$cl_awards->add_awards("Kendini Fetheden","aconquer");
$cl_awards->set_need(array("1" => "1"));
$cl_awards->set_maxstage("1");
$cl_awards->set_nextStage("Conquistar a si mesmo!");
$cl_awards->set_thisStage("Conquistou-se a si mesmo!");
$cl_awards->set_type("fix_one");
$cl_awards->set_description("Ganha esta medalha o oyuncu que se conquistar a ele mesmo.");

$cl_awards->add_awards("Yeniden Doğuş","resurrection");
$cl_awards->set_need(array("1" => "5"));
$cl_awards->set_maxstage("1");
$cl_awards->set_nextStage("5 kez yeniden başla.");
$cl_awards->set_thisStage("5 kez yeniden başladın.");
$cl_awards->set_type("fix_one");
$cl_awards->set_description("Recomeçou 5 vezes no mesmo mundo.");

//Medalhas Diarias 
?>
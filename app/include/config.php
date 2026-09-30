<?php
/*******************************************/
/********* ARQUIVO DE CONFIGURAÇÃO *********/
/********** Versão: Zapping Wars ***********/
/*********** Por Caique Portela ************/
/******* (No jogo: Felipe Medeiros) ********/
/*******************************************/

// Timezone
date_default_timezone_set("Europe/Istanbul");

// Configurações do banco de dados
$config['db_host'] = 'mysql'; // Docker Compose service name
$config['db_user'] = 'root'; // Database Username
$config['db_pw'] = 'my-secret-pw'; // Database Password
$config['db_name'] = 'pkmhunters_imp'; // Database Name

// Acesso master ao painel administrativo
$config['master_user'] = 'root';
$config['master_pw'] = 'my-secret-pw';

// Configurações especiais...
$config['name'] = 'Tribe Rush';
$config['ano'] = '2014';
$config['cdn'] = 'global_cdn';
$config['forum'] = '#';
$config['support'] = 'zapping_support/';
$config['version'] = 'Yerel Bot Sürümü';
$config['prefix'] = '';

?>

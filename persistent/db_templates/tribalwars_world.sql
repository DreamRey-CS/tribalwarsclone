-- phpMyAdmin SQL Dump
-- version 3.5.8.2
-- http://www.phpmyadmin.net
--
-- Machine: localhost
-- Genereertijd: 26 nov 2014 om 09:00
-- Serverversie: 5.5.31
-- PHP-versie: 5.3.28

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Databank: `pkmhunters_world`
--

-- --------------------------------------------------------

--
-- Table structure for  `ally`
--

CREATE DATABASE IF NOT EXISTS pkmhunters_world;
USE pkmhunters_world;

CREATE TABLE IF NOT EXISTS `ally` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `short` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `points` int(20) unsigned NOT NULL,
  `rank` int(11) unsigned NOT NULL,
  `best_points` int(20) unsigned NOT NULL,
  `members` int(11) unsigned NOT NULL,
  `villages` int(11) unsigned NOT NULL,
  `intern_text` text COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci NOT NULL,
  `homepage` varchar(640) COLLATE utf8_unicode_ci NOT NULL,
  `irc` varchar(640) COLLATE utf8_unicode_ci NOT NULL,
  `image` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `intro_igm` text COLLATE utf8_unicode_ci NOT NULL,
  `killed_units_att` int(25) NOT NULL,
  `killed_units_att_rank` int(11) NOT NULL,
  `killed_units_def` int(25) NOT NULL,
  `killed_units_def_rank` int(25) NOT NULL,
  `killed_units_altogether` int(25) NOT NULL,
  `killed_units_altogether_rank` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `rank` (`rank`),
  KEY `name` (`name`),
  KEY `short` (`short`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=2 ;

--
-- Populate data for table `ally`
--

INSERT INTO `ally` (`id`, `name`, `short`, `points`, `rank`, `best_points`, `members`, `villages`, `intern_text`, `description`, `homepage`, `irc`, `image`, `intro_igm`, `killed_units_att`, `killed_units_att_rank`, `killed_units_def`, `killed_units_def_rank`, `killed_units_altogether`, `killed_units_altogether_rank`) VALUES
(1, 'Test', 'test', 43192, 1, 43192, 2, 6, 'Tribo+fundada+por++%5Bplayer%5DMugaru%5B%2Fplayer%5D%0D%0A%0D%0AEste+texto+pode+ser+alterado+pelos+administradores+da+tribo.%0D%0A%5Bplayer%5Dolla%5B%2Fplayer%5D', '%5Bally%5Dtest%5B%2Fally%5D+foi+fundada+por+%5Bplayer%5DMugaru%5B%2Fplayer%5D.%0AEm+caso+de+d%C3%BAvidas+dirija-se+%C3%A0+%5Bplayer%5DMugaru%5B%2Fplayer%5D%0A%0AEste+texto+pode+ser+alterado+pelos+diplomatas+da+tribo.', '', '', '', '', 2800, 0, 440, 0, 3240, 0);

-- --------------------------------------------------------

--
-- Table structure for  `ally_contracts`
--

CREATE TABLE IF NOT EXISTS `ally_contracts` (
  `from_ally` int(11) NOT NULL,
  `type` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `to_ally` int(11) NOT NULL,
  `short` varchar(6) COLLATE utf8_unicode_ci NOT NULL,
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for  `ally_events`
--

CREATE TABLE IF NOT EXISTS `ally_events` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `ally` int(11) unsigned NOT NULL,
  `time` int(11) unsigned NOT NULL,
  `message` text COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ally` (`ally`),
  KEY `time` (`time`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=17 ;

--
-- Populate data for table `ally_events`
--

INSERT INTO `ally_events` (`id`, `ally`, `time`, `message`) VALUES
(2, 1, 1416479364, 'Tribo+fundada+por+%3Ca+href%3D%22game.php%3Fvillage%3D%3B%26screen%3Dinfo_player%26id%3D1%22%3EMugaru%3C%2Fa%3E.'),
(3, 1, 1416567371, '%3Ca+href%3D%22game.php%3Fvillage%3D%3B%26screen%3Dinfo_player%26id%3D2%22%3EUkiraki%3C%2Fa%3E+foi+convidado+por+%3Ca+href%3D%22game.php%3Fvillage%3D%3B%26screen%3Dinfo_player%26id%3D1%22%3EMugaru%3C%2Fa%3E.'),
(4, 1, 1416567897, '%3Ca+href%3D%22game.php%3Fvillage%3D%3B%26screen%3Dinfo_player%26id%3D2%22%3EUkiraki%3C%2Fa%3E+juntou-se+%C3%A0+tribo.'),
(5, 1, 1416824291, '%3Ca+href%3D%22game.php%3Fvillage%3D%3B%26screen%3Dinfo_player%26id%3D1%22%3EMugaru%3C%2Fa%3E+modificou+o+quadro+de+an%C3%BAncios.'),
(6, 1, 1416825175, '%3Ca+href%3D%22game.php%3Fvillage%3D%3B%26screen%3Dinfo_player%26id%3D1%22%3EMugaru%3C%2Fa%3E+modificou+o+quadro+de+an%C3%BAncios.'),
(7, 1, 1416825178, '%3Ca+href%3D%22game.php%3Fvillage%3D%3B%26screen%3Dinfo_player%26id%3D1%22%3EMugaru%3C%2Fa%3E+modificou+o+quadro+de+an%C3%BAncios.'),
(8, 1, 1416825476, '%3Ca+href%3D%22game.php%3Fvillage%3D%3B%26screen%3Dinfo_player%26id%3D1%22%3EMugaru%3C%2Fa%3E+modificou+o+quadro+de+an%C3%BAncios.'),
(9, 1, 1416826058, '%3Ca+href%3D%22game.php%3Fvillage%3D%3B%26screen%3Dinfo_player%26id%3D1%22%3EMugaru%3C%2Fa%3E+modificou+o+quadro+de+an%C3%BAncios.'),
(10, 1, 1416826065, '%3Ca+href%3D%22game.php%3Fvillage%3D%3B%26screen%3Dinfo_player%26id%3D1%22%3EMugaru%3C%2Fa%3E+modificou+o+quadro+de+an%C3%BAncios.'),
(11, 1, 1416826330, '%3Ca+href%3D%22game.php%3Fvillage%3D%3B%26screen%3Dinfo_player%26id%3D1%22%3EMugaru%3C%2Fa%3E+modificou+o+quadro+de+an%C3%BAncios.'),
(12, 1, 1416826401, '%3Ca+href%3D%22game.php%3Fvillage%3D%3B%26screen%3Dinfo_player%26id%3D1%22%3EMugaru%3C%2Fa%3E+modificou+o+quadro+de+an%C3%BAncios.'),
(13, 1, 1416826407, '%3Ca+href%3D%22game.php%3Fvillage%3D%3B%26screen%3Dinfo_player%26id%3D1%22%3EMugaru%3C%2Fa%3E+modificou+o+quadro+de+an%C3%BAncios.'),
(14, 1, 1416826627, '%3Ca+href%3D%22game.php%3Fvillage%3D%3B%26screen%3Dinfo_player%26id%3D1%22%3EMugaru%3C%2Fa%3E+modificou+o+quadro+de+an%C3%BAncios.'),
(15, 1, 1416826674, '%3Ca+href%3D%22game.php%3Fvillage%3D%3B%26screen%3Dinfo_player%26id%3D1%22%3EMugaru%3C%2Fa%3E+modificou+o+quadro+de+an%C3%BAncios.'),
(16, 1, 1416826913, '%3Ca+href%3D%22game.php%3Fvillage%3D%3B%26screen%3Dinfo_player%26id%3D1%22%3EMugaru%3C%2Fa%3E+modificou+o+quadro+de+an%C3%BAncios.');

-- --------------------------------------------------------

--
-- Table structure for  `ally_invites`
--

CREATE TABLE IF NOT EXISTS `ally_invites` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `from_ally` int(11) unsigned NOT NULL,
  `to_userid` int(11) unsigned NOT NULL,
  `to_username` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `time` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=2 ;

-- --------------------------------------------------------

--
-- Table structure for  `announcement`
--

CREATE TABLE IF NOT EXISTS `announcement` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `text` text COLLATE utf8_unicode_ci NOT NULL,
  `link` varchar(320) COLLATE utf8_unicode_ci NOT NULL,
  `graphic` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `time` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for  `build`
--

CREATE TABLE IF NOT EXISTS `build` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `mode` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `building` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `villageid` int(11) unsigned DEFAULT NULL,
  `end_time` int(11) unsigned NOT NULL,
  `build_time` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `villageid` (`villageid`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=480 ;

-- --------------------------------------------------------

--
-- Table structure for  `config`
--

CREATE TABLE IF NOT EXISTS `config` (
  `name` varchar(100) NOT NULL,
  `ano` varchar(100) NOT NULL,
  `cdn` varchar(100) NOT NULL,
  `forum` varchar(100) NOT NULL,
  `version` varchar(100) NOT NULL,
  `global_db` varchar(100) NOT NULL,
  `world_name` varchar(100) NOT NULL,
  `master_pw` varchar(100) NOT NULL,
  `speed` varchar(100) NOT NULL,
  `count_create_left` varchar(100) NOT NULL,
  `min_villages` varchar(100) NOT NULL,
  `map_incircle` varchar(100) NOT NULL,
  `left_name` varchar(100) NOT NULL,
  `village_choose_direction` varchar(100) NOT NULL,
  `reason_defense` varchar(100) NOT NULL,
  `factor_spy` varchar(100) NOT NULL,
  `cancel_movement` varchar(100) NOT NULL,
  `movement_speed` varchar(100) NOT NULL,
  `moral_activ` enum('0','1') NOT NULL,
  `min_moral` varchar(100) NOT NULL,
  `agreement_per_hour` varchar(100) NOT NULL,
  `agreement_min` varchar(100) NOT NULL,
  `agreement_max` varchar(100) NOT NULL,
  `noob_protection` varchar(100) NOT NULL,
  `ennobled_protection` varchar(100) NOT NULL,
  `dealer_time` varchar(100) NOT NULL,
  `cancel_dealers` varchar(100) NOT NULL,
  `ag_style` varchar(100) NOT NULL,
  `bh_style` varchar(100) NOT NULL,
  `create_ally` enum('0','1') NOT NULL,
  `leave_ally` enum('0','1') NOT NULL,
  `close_ally` enum('0','1') NOT NULL,
  `members_ally` varchar(100) NOT NULL,
  `auto_ally` enum('0','1') NOT NULL,
  `no_actions` enum('0','1') NOT NULL,
  `not_more_villages` enum('0','1') NOT NULL,
  `ip_control` enum('0','1') NOT NULL,
  `attack_visit` enum('0','1') NOT NULL,
  `build_destroy` enum('0','1') NOT NULL,
  `archers` enum('0','1') NOT NULL,
  `night_start` varchar(100) NOT NULL,
  `night_end` varchar(100) NOT NULL,
  `spy_style` varchar(100) NOT NULL,
  `gold_coin_price_wood` varchar(100) NOT NULL,
  `gold_coin_price_stone` varchar(100) NOT NULL,
  `gold_coin_price_iron` varchar(100) NOT NULL,
  `auto_build_active` varchar(100) NOT NULL,
  `auto_build_max_points` varchar(100) NOT NULL,
  `auto_build_grow_time` varchar(100) NOT NULL,
  `buildings_base` varchar(100) NOT NULL,
  `buildings_factor` varchar(100) NOT NULL,
  `catapult_wall_base` varchar(100) NOT NULL,
  `catapult_wall_factor` varchar(100) NOT NULL,
  `ram_buildings_base` varchar(100) NOT NULL,
  `ram_buildings_factor` varchar(100) NOT NULL,
  `ram_wall_base` varchar(100) NOT NULL,
  `ram_wall_factor` varchar(100) NOT NULL,
  `church` enum('0','1') NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for  `country`
--

CREATE TABLE IF NOT EXISTS `country` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `begin_ip` varchar(20) CHARACTER SET latin1 DEFAULT NULL,
  `end_ip` varchar(20) CHARACTER SET latin1 DEFAULT NULL,
  `begin_ip_num` int(11) unsigned DEFAULT NULL,
  `end_ip_num` int(11) unsigned DEFAULT NULL,
  `country_code` varchar(3) CHARACTER SET latin1 DEFAULT NULL,
  `country_name` varchar(150) CHARACTER SET latin1 DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `begin_ip_num` (`begin_ip_num`,`end_ip_num`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for  `create_village`
--

CREATE TABLE IF NOT EXISTS `create_village` (
  `nw_c` int(10) NOT NULL DEFAULT '1',
  `no_c` int(10) NOT NULL DEFAULT '1',
  `so_c` int(10) NOT NULL DEFAULT '1',
  `sw_c` int(10) NOT NULL DEFAULT '1',
  `nw` int(10) NOT NULL DEFAULT '0',
  `no` int(10) NOT NULL DEFAULT '0',
  `so` int(10) NOT NULL DEFAULT '0',
  `sw` int(10) NOT NULL DEFAULT '0',
  `no_alpha` int(10) NOT NULL DEFAULT '0',
  `nw_alpha` int(10) NOT NULL DEFAULT '0',
  `so_alpha` int(10) NOT NULL DEFAULT '0',
  `sw_alpha` int(10) NOT NULL DEFAULT '0',
  `next_left` int(15) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Populate data for table `create_village`
--

INSERT INTO `create_village` (`nw_c`, `no_c`, `so_c`, `sw_c`, `nw`, `no`, `so`, `sw`, `no_alpha`, `nw_alpha`, `so_alpha`, `sw_alpha`, `next_left`) VALUES
(4, 3, 1, 1, 1, 1, 0, 0, 0, 51, 0, 0, 1);

-- --------------------------------------------------------

--
-- Table structure for  `create_village_barb`
--

CREATE TABLE IF NOT EXISTS `create_village_barb` (
  `nw_c` int(11) NOT NULL DEFAULT '1',
  `no_c` int(11) NOT NULL DEFAULT '1',
  `so_c` int(11) NOT NULL DEFAULT '1',
  `sw_c` int(11) NOT NULL DEFAULT '1',
  `nw` int(11) NOT NULL DEFAULT '0',
  `no` int(11) NOT NULL DEFAULT '0',
  `so` int(11) NOT NULL DEFAULT '0',
  `sw` int(11) NOT NULL DEFAULT '0',
  `no_alpha` int(11) NOT NULL DEFAULT '0',
  `nw_alpha` int(11) NOT NULL DEFAULT '0',
  `so_alpha` int(11) NOT NULL DEFAULT '0',
  `sw_alpha` int(11) NOT NULL DEFAULT '0',
  `next_left` int(11) NOT NULL DEFAULT '1'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Populate data for table `create_village_barb`
--

INSERT INTO `create_village_barb` (`nw_c`, `no_c`, `so_c`, `sw_c`, `nw`, `no`, `so`, `sw`, `no_alpha`, `nw_alpha`, `so_alpha`, `sw_alpha`, `next_left`) VALUES
(20, 21, 19, 19, 54, 54, 53, 53, 62, 84, 20, 87, 1);

-- --------------------------------------------------------

--
-- Table structure for  `cron`
--

CREATE TABLE IF NOT EXISTS `cron` (
  `mail` int(11) NOT NULL DEFAULT '0',
  `mail_last` int(11) NOT NULL,
  `report` int(11) NOT NULL DEFAULT '0',
  `report_last` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for  `dealers`
--

CREATE TABLE IF NOT EXISTS `dealers` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `from_userid` int(11) unsigned NOT NULL,
  `to_userid` int(11) unsigned NOT NULL,
  `from_village` int(11) unsigned NOT NULL,
  `to_village` int(11) unsigned NOT NULL,
  `wood` int(11) unsigned NOT NULL,
  `stone` int(11) unsigned NOT NULL,
  `iron` int(11) unsigned NOT NULL,
  `start_time` int(11) unsigned NOT NULL,
  `end_time` int(11) unsigned NOT NULL,
  `is_offer` int(1) unsigned NOT NULL DEFAULT '0',
  `dealers` int(6) unsigned NOT NULL DEFAULT '0',
  `type` varchar(4) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `from_village` (`from_village`),
  KEY `to_village` (`to_village`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=4 ;

-- --------------------------------------------------------

--
-- Table structure for  `destroy`
--

CREATE TABLE IF NOT EXISTS `destroy` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `building` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `villageid` int(11) unsigned NOT NULL,
  `end_time` int(11) unsigned NOT NULL,
  `build_time` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for  `events`
--

CREATE TABLE IF NOT EXISTS `events` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `event_time` int(11) unsigned DEFAULT '0',
  `event_type` varchar(15) COLLATE utf8_unicode_ci DEFAULT NULL,
  `event_id` int(11) unsigned NOT NULL,
  `user_id` int(11) unsigned NOT NULL,
  `villageid` int(11) unsigned DEFAULT NULL,
  `knot_event` int(15) NOT NULL,
  `cid` varchar(32) COLLATE utf8_unicode_ci DEFAULT '0',
  `can_knot` int(1) NOT NULL DEFAULT '0',
  `is_locked` int(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `event_type` (`event_type`),
  KEY `event_id` (`event_id`),
  KEY `event_time` (`event_time`),
  KEY `user_id` (`user_id`),
  KEY `villageid` (`villageid`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=633 ;

-- --------------------------------------------------------

--
-- Table structure for  `forum`
--

CREATE TABLE IF NOT EXISTS `forum` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(500) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `ally` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci AUTO_INCREMENT=127 ;

-- --------------------------------------------------------

--
-- Table structure for  `forum_f_read`
--

CREATE TABLE IF NOT EXISTS `forum_f_read` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `forum_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for  `forum_post`
--

CREATE TABLE IF NOT EXISTS `forum_post` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `thread_id` int(11) NOT NULL,
  `message` varchar(4000) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `posted_by` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `time` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci AUTO_INCREMENT=65 ;

-- --------------------------------------------------------

--
-- Table structure for  `forum_read`
--

CREATE TABLE IF NOT EXISTS `forum_read` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `thread_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci AUTO_INCREMENT=334 ;

-- --------------------------------------------------------

--
-- Table structure for  `forum_thread`
--

CREATE TABLE IF NOT EXISTS `forum_thread` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category_id` int(11) NOT NULL,
  `title` varchar(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `message` varchar(5000) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `author` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `time` int(11) NOT NULL,
  `important` int(11) NOT NULL DEFAULT '0',
  `closed` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci AUTO_INCREMENT=62 ;

-- --------------------------------------------------------

--
-- Table structure for  `friends`
--

CREATE TABLE IF NOT EXISTS `friends` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `to_userid` int(11) NOT NULL DEFAULT '0',
  `from_userid` int(11) NOT NULL DEFAULT '0',
  `status` enum('activ','pending') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'pending',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=730 ;

-- --------------------------------------------------------

--
-- Table structure for  `groups`
--

CREATE TABLE IF NOT EXISTS `groups` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `group_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `user_id` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for  `knight_items`
--

CREATE TABLE IF NOT EXISTS `knight_items` (
  `uid` int(11) unsigned NOT NULL,
  `chosen` varchar(150) COLLATE utf8_unicode_ci DEFAULT NULL,
  `progress` int(3) unsigned DEFAULT NULL,
  `last_actu` int(11) unsigned DEFAULT NULL,
  `spear` enum('false','true') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'false',
  `sword` enum('false','true') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'false',
  `axe` enum('false','true') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'false',
  `archer` enum('false','true') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'false',
  `spy` enum('false','true') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'false',
  `light` enum('false','true') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'false',
  `heavy` enum('false','true') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'false',
  `marcher` enum('false','true') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'false',
  `ram` enum('false','true') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'false',
  `catapult` enum('false','true') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'false',
  `snob` enum('false','true') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'false',
  PRIMARY KEY (`uid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Populate data for table `knight_items`
--

INSERT INTO `knight_items` (`uid`, `chosen`, `progress`, `last_actu`, `spear`, `sword`, `axe`, `archer`, `spy`, `light`, `heavy`, `marcher`, `ram`, `catapult`, `snob`) VALUES
(1, NULL, 0, 1416673375, 'true', 'true', 'true', 'false', 'true', 'true', 'true', 'false', 'true', 'true', 'true');

-- --------------------------------------------------------

--
-- Table structure for  `login`
--

CREATE TABLE IF NOT EXISTS `login` (
  `login_locked` enum('yes','no') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'no',
  `start` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `first_visit` tinyint(1) NOT NULL DEFAULT '0',
  `extern_auth` varchar(32) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for  `logins`
--

CREATE TABLE IF NOT EXISTS `logins` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `time` int(11) unsigned NOT NULL,
  `ip` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `userid` int(11) unsigned NOT NULL,
  `uv` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=89 ;

--
-- Populate data for table `logins`
--

INSERT INTO `logins` (`id`, `username`, `time`, `ip`, `userid`, `uv`) VALUES
(49, 'Mugaru', 1416476661, '83.81.200.141', 1, ''),
(50, 'Mugaru', 1416476684, '83.81.200.141', 1, ''),
(51, 'Mugaru', 1416476691, '83.81.200.141', 1, ''),
(52, 'Mugaru', 1416481322, '83.81.200.141', 1, ''),
(53, 'Mugaru', 1416481624, '83.81.200.141', 1, ''),
(54, 'Mugaru', 1416483997, '83.81.200.141', 1, ''),
(55, 'Mugaru', 1416490007, '83.81.200.141', 1, ''),
(56, 'Mugaru', 1416493416, '83.81.200.141', 1, ''),
(57, 'Mugaru', 1416494916, '83.81.200.141', 1, ''),
(58, 'Mugaru', 1416495111, '83.81.200.141', 1, ''),
(59, 'Mugaru', 1416497314, '83.81.200.141', 1, ''),
(60, 'Mugaru', 1416559519, '83.81.200.141', 1, ''),
(61, 'Ukiraki', 1416566729, '83.81.212.175', 2, ''),
(62, 'Ukiraki', 1416566737, '83.81.212.175', 2, ''),
(63, 'Mugaru', 1416566791, '83.81.200.141', 1, ''),
(64, 'Mugaru', 1416588558, '84.85.223.71', 1, ''),
(65, 'Mugaru', 1416593065, '84.85.223.71', 1, ''),
(66, 'Mugaru', 1416593070, '84.85.223.71', 1, ''),
(67, 'Mugaru', 1416759798, '84.85.223.71', 1, ''),
(68, 'Mugaru', 1416765799, '84.85.223.71', 1, ''),
(69, 'Mugaru', 1416765832, '84.85.223.71', 1, ''),
(70, 'Mugaru', 1416765836, '84.85.223.71', 1, ''),
(71, 'Mugaru', 1416818677, '83.81.200.141', 1, ''),
(72, 'Mugaru', 1416819277, '83.81.200.141', 1, ''),
(73, 'Mugaru', 1416819295, '83.81.200.141', 1, ''),
(74, 'Mugaru', 1416820588, '83.81.200.141', 1, ''),
(75, 'Mugaru', 1416821749, '83.81.200.141', 1, ''),
(76, 'Mugaru', 1416825001, '83.81.200.141', 1, ''),
(77, 'Mugaru', 1416825280, '83.81.200.141', 1, ''),
(78, 'Mugaru', 1416825285, '83.81.200.141', 1, ''),
(79, 'Mugaru', 1416827388, '83.81.200.141', 1, ''),
(80, 'Mugaru', 1416834314, '83.81.200.141', 1, ''),
(81, 'Mugaru', 1416840930, '83.81.200.141', 1, ''),
(82, 'Mugaru', 1416847475, '84.85.223.71', 1, ''),
(83, 'Mugaru', 1416908167, '83.81.200.141', 1, ''),
(84, 'Mugaru', 1416910872, '83.81.200.141', 1, ''),
(85, 'Mugaru', 1416911236, '83.81.200.141', 1, ''),
(86, 'Mugaru', 1416921834, '83.81.200.141', 1, ''),
(87, 'Mugaru', 1416923716, '83.81.200.141', 1, ''),
(88, 'Mugaru', 1416928402, '83.81.200.141', 1, '');

-- --------------------------------------------------------

--
-- Table structure for  `logs`
--

CREATE TABLE IF NOT EXISTS `logs` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user` varchar(320) COLLATE utf8_unicode_ci NOT NULL,
  `village` varchar(320) COLLATE utf8_unicode_ci NOT NULL,
  `time` int(11) unsigned NOT NULL,
  `log` text COLLATE utf8_unicode_ci NOT NULL,
  `event_id` int(11) unsigned NOT NULL,
  `event_type` varchar(25) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=70 ;

--
-- Populate data for table `logs`
--

INSERT INTO `logs` (`id`, `user`, `village`, `time`, `log`, `event_id`, `event_type`) VALUES
(5, '', 'b5691fb35076a588724f378b2ee51ead', 1416478881, '1281198.755%3A+Angriff%3A+350%3Cbr+%2F%3E1281198.772%3A+Gehe+in+do_mov%28%29.%3Cbr+%2F%3E1281198.782%3A+Lese+query+mov%3Cbr+%2F%3E1281199.038%3A+Gehe+in+do_mov_attack%3Cbr+%2F%3E1281202.363%3A+Update+mov%3Cbr+%2F%3E1281206.742%3A+Event+updaten%3Cbr+%2F%3E1281207.327%3A+gleich+zur%C3%83%C2%BCck%3Cbr+%2F%3E1281207.343%3A+Lese+query+mov%3Cbr+%2F%3E1281208.248%3A+L%C3%AF%C2%BF%C2%BDsche+event+main%3Cbr+%2F%3E', 5, ''),
(6, '', '108908052f9d7a009893ff8c3afbec4a', 1416479583, '1983887.178%3A+Angriff%3A+358%3Cbr+%2F%3E1983887.213%3A+Gehe+in+do_mov%28%29.%3Cbr+%2F%3E1983887.238%3A+Lese+query+mov%3Cbr+%2F%3E1983887.476%3A+Gehe+in+do_mov_attack%3Cbr+%2F%3E1983889.818%3A+Update+mov%3Cbr+%2F%3E1983893.156%3A+Event+updaten%3Cbr+%2F%3E1983893.751%3A+update+event+main%3Cbr+%2F%3E', 6, ''),
(7, '', '4da5e186dce877cbbc722b46fa4e5f60', 1416479590, '1990887.153%3A+Angriff%3A+359%3Cbr+%2F%3E1990887.184%3A+Gehe+in+do_mov%28%29.%3Cbr+%2F%3E1990887.2%3A+Lese+query+mov%3Cbr+%2F%3E1990895.982%3A+Gehe+in+do_mov_attack%3Cbr+%2F%3E1990898.07%3A+Update+mov%3Cbr+%2F%3E1990901.136%3A+Event+updaten%3Cbr+%2F%3E1990901.726%3A+update+event+main%3Cbr+%2F%3E', 7, ''),
(8, '', 'ad74094460430a3f1a9ce3fa414d8564', 1416479739, '2139148.923%3A+Angriff%3A+360%3Cbr+%2F%3E2139148.957%3A+Gehe+in+do_mov%28%29.%3Cbr+%2F%3E2139148.974%3A+Lese+query+mov%3Cbr+%2F%3E2139149.318%3A+Gehe+in+do_mov_attack%3Cbr+%2F%3E2139152.854%3A+Update+mov%3Cbr+%2F%3E2139158.242%3A+Event+updaten%3Cbr+%2F%3E2139159.041%3A+update+event+main%3Cbr+%2F%3E', 8, ''),
(9, '', 'bb61eeea24830ece156b7497e604ea94', 1416479922, '2322499.803%3A+Angriff%3A+358%3Cbr+%2F%3E2322499.84%3A+Gehe+in+do_mov%28%29.%3Cbr+%2F%3E2322499.854%3A+Lese+query+mov%3Cbr+%2F%3E2322501.86%3A+L%C3%AF%C2%BF%C2%BDsche+event+main%3Cbr+%2F%3E', 6, ''),
(10, '', '0a8ccf3f3230ba13104542320879dd04', 1416479929, '2329498.745%3A+Angriff%3A+359%3Cbr+%2F%3E2329498.769%3A+Gehe+in+do_mov%28%29.%3Cbr+%2F%3E2329498.779%3A+Lese+query+mov%3Cbr+%2F%3E2329500.197%3A+L%C3%AF%C2%BF%C2%BDsche+event+main%3Cbr+%2F%3E', 7, ''),
(11, '', 'edf1867f1a04cde04e52167538d448c6', 1416480219, '2619022.934%3A+Angriff%3A+360%3Cbr+%2F%3E2619022.974%3A+Gehe+in+do_mov%28%29.%3Cbr+%2F%3E2619022.999%3A+Lese+query+mov%3Cbr+%2F%3E2619024.596%3A+L%C3%AF%C2%BF%C2%BDsche+event+main%3Cbr+%2F%3E', 8, ''),
(12, '', '9f68dbd6741ead536b2011d36d3edb44', 1416481367, '167403.385%3A+Angriff%3A+363%3Cbr+%2F%3E167403.424%3A+Gehe+in+do_mov%28%29.%3Cbr+%2F%3E167403.445%3A+Lese+query+mov%3Cbr+%2F%3E167403.797%3A+Gehe+in+do_mov_attack%3Cbr+%2F%3E167407.661%3A+Update+mov%3Cbr+%2F%3E167413.034%3A+Event+updaten%3Cbr+%2F%3E167413.995%3A+update+event+main%3Cbr+%2F%3E', 9, ''),
(13, '', '0d376226b0ac47101c66809d66af2783', 1416481369, '169403.041%3A+Angriff%3A+364%3Cbr+%2F%3E169403.073%3A+Gehe+in+do_mov%28%29.%3Cbr+%2F%3E169403.09%3A+Lese+query+mov%3Cbr+%2F%3E169403.321%3A+Gehe+in+do_mov_attack%3Cbr+%2F%3E169406.261%3A+Update+mov%3Cbr+%2F%3E169418.336%3A+Event+updaten%3Cbr+%2F%3E169419.026%3A+update+event+main%3Cbr+%2F%3E', 10, ''),
(14, '', '3fb4e55c0b526497fd30a751ab056620', 1416481370, '170403.534%3A+Angriff%3A+365%3Cbr+%2F%3E170403.566%3A+Gehe+in+do_mov%28%29.%3Cbr+%2F%3E170403.582%3A+Lese+query+mov%3Cbr+%2F%3E170403.893%3A+Gehe+in+do_mov_attack%3Cbr+%2F%3E170411.742%3A+Update+mov%3Cbr+%2F%3E170419.174%3A+Event+updaten%3Cbr+%2F%3E170419.987%3A+update+event+main%3Cbr+%2F%3E', 11, ''),
(15, '', 'dfd2ec0fb72383290009ff825d22999f', 1416481372, '172403.185%3A+Angriff%3A+366%3Cbr+%2F%3E172403.215%3A+Gehe+in+do_mov%28%29.%3Cbr+%2F%3E172403.228%3A+Lese+query+mov%3Cbr+%2F%3E172403.476%3A+Gehe+in+do_mov_attack%3Cbr+%2F%3E172410.449%3A+Update+mov%3Cbr+%2F%3E172414.177%3A+Event+updaten%3Cbr+%2F%3E172415.102%3A+L%C3%AF%C2%BF%C2%BDsche+event+main%3Cbr+%2F%3E', 12, ''),
(16, '', 'd59c486c3e8fd5b55f11196f2499ed14', 1416481927, '727097.368%3A+Angriff%3A+375%3Cbr+%2F%3E727097.399%3A+Gehe+in+do_mov%28%29.%3Cbr+%2F%3E727097.415%3A+Lese+query+mov%3Cbr+%2F%3E727098.388%3A+L%C3%AF%C2%BF%C2%BDsche+event+main%3Cbr+%2F%3E', 13, ''),
(17, '', 'f636ddbe3e4dbfc67659c68c4c040606', 1416482567, '1367686.777%3A+Angriff%3A+363%3Cbr+%2F%3E1367686.812%3A+Gehe+in+do_mov%28%29.%3Cbr+%2F%3E1367686.827%3A+Lese+query+mov%3Cbr+%2F%3E1367688.263%3A+L%C3%AF%C2%BF%C2%BDsche+event+main%3Cbr+%2F%3E', 9, ''),
(18, '', '2c870b7c1902cc7e93afce30f3b16e0d', 1416482569, '1369677.308%3A+Angriff%3A+364%3Cbr+%2F%3E1369677.342%3A+Gehe+in+do_mov%28%29.%3Cbr+%2F%3E1369677.353%3A+Lese+query+mov%3Cbr+%2F%3E1369678.506%3A+L%C3%AF%C2%BF%C2%BDsche+event+main%3Cbr+%2F%3E', 10, ''),
(19, '', '5831ba6c09734c98360f56c38e05f29e', 1416482570, '1370677.309%3A+Angriff%3A+365%3Cbr+%2F%3E1370677.332%3A+Gehe+in+do_mov%28%29.%3Cbr+%2F%3E1370677.34%3A+Lese+query+mov%3Cbr+%2F%3E1370678.344%3A+L%C3%AF%C2%BF%C2%BDsche+event+main%3Cbr+%2F%3E', 11, ''),
(20, '', 'c5b418c6677f4838f2f4bce4a172e0fe', 1416484952, '152089.545%3A+Angriff%3A+414%3Cbr+%2F%3E152089.579%3A+Gehe+in+do_mov%28%29.%3Cbr+%2F%3E152089.592%3A+Lese+query+mov%3Cbr+%2F%3E152089.825%3A+Gehe+in+do_mov_attack%3Cbr+%2F%3E152092.677%3A+Update+mov%3Cbr+%2F%3E152098.351%3A+Event+updaten%3Cbr+%2F%3E152099.058%3A+update+event+main%3Cbr+%2F%3E', 14, ''),
(21, '', '10e27e93ac7fadaf0270be5a25575ecd', 1416484955, '155085.299%3A+Angriff%3A+415%3Cbr+%2F%3E155085.332%3A+Gehe+in+do_mov%28%29.%3Cbr+%2F%3E155085.343%3A+Lese+query+mov%3Cbr+%2F%3E155085.627%3A+Gehe+in+do_mov_attack%3Cbr+%2F%3E155088.8%3A+Update+mov%3Cbr+%2F%3E155092.51%3A+Event+updaten%3Cbr+%2F%3E155093.119%3A+update+event+main%3Cbr+%2F%3E', 15, ''),
(22, '', 'b55c975895b3402e395f4d574bf21479', 1416484956, '156090.905%3A+Angriff%3A+416%3Cbr+%2F%3E156090.94%3A+Gehe+in+do_mov%28%29.%3Cbr+%2F%3E156090.957%3A+Lese+query+mov%3Cbr+%2F%3E156091.271%3A+Gehe+in+do_mov_attack%3Cbr+%2F%3E156095.027%3A+Update+mov%3Cbr+%2F%3E156100.429%3A+Event+updaten%3Cbr+%2F%3E156101.113%3A+update+event+main%3Cbr+%2F%3E', 16, ''),
(23, '', '275674fb9e05b1ffad932b5a49d544f3', 1416484958, '158081.499%3A+Angriff%3A+417%3Cbr+%2F%3E158081.523%3A+Gehe+in+do_mov%28%29.%3Cbr+%2F%3E158081.533%3A+Lese+query+mov%3Cbr+%2F%3E158081.757%3A+Gehe+in+do_mov_attack%3Cbr+%2F%3E158084.24%3A+Update+mov%3Cbr+%2F%3E158095.498%3A+Event+updaten%3Cbr+%2F%3E158096.338%3A+update+event+main%3Cbr+%2F%3E', 17, ''),
(24, '', 'b72baeff0625682821d72a9c5f6f8803', 1416485801, '1001995.289%3A+Angriff%3A+414%3Cbr+%2F%3E1001995.312%3A+Gehe+in+do_mov%28%29.%3Cbr+%2F%3E1001995.322%3A+Lese+query+mov%3Cbr+%2F%3E1001996.627%3A+L%C3%AF%C2%BF%C2%BDsche+event+main%3Cbr+%2F%3E', 14, ''),
(25, '', 'a3a0864f499c96a4c4ab2b4b3526ab10', 1416485805, '1004995.288%3A+Angriff%3A+415%3Cbr+%2F%3E1004995.319%3A+Gehe+in+do_mov%28%29.%3Cbr+%2F%3E1004995.336%3A+Lese+query+mov%3Cbr+%2F%3E1005004.473%3A+L%C3%AF%C2%BF%C2%BDsche+event+main%3Cbr+%2F%3E', 15, ''),
(26, '', '0d4e24d167f215963173b0039ead162a', 1416485805, '1005995.205%3A+Angriff%3A+416%3Cbr+%2F%3E1005995.226%3A+Gehe+in+do_mov%28%29.%3Cbr+%2F%3E1005995.235%3A+Lese+query+mov%3Cbr+%2F%3E1005996.285%3A+L%C3%AF%C2%BF%C2%BDsche+event+main%3Cbr+%2F%3E', 16, ''),
(27, '', '83ea54c0c36a3fd97017913acbbdab77', 1416485807, '1007995.263%3A+Angriff%3A+417%3Cbr+%2F%3E1007995.292%3A+Gehe+in+do_mov%28%29.%3Cbr+%2F%3E1007995.302%3A+Lese+query+mov%3Cbr+%2F%3E1007996.426%3A+L%C3%AF%C2%BF%C2%BDsche+event+main%3Cbr+%2F%3E', 17, ''),
(28, '', 'ddaee5b50bf68bdd6eb870e2ef95e849', 1416486043, '1243773.509%3A+Angriff%3A+422%3Cbr+%2F%3E1243773.547%3A+Gehe+in+do_mov%28%29.%3Cbr+%2F%3E1243773.562%3A+Lese+query+mov%3Cbr+%2F%3E1243773.831%3A+Gehe+in+do_mov_attack%3Cbr+%2F%3E1243777.17%3A+Update+mov%3Cbr+%2F%3E1243782.564%3A+Event+updaten%3Cbr+%2F%3E1243783.486%3A+update+event+main%3Cbr+%2F%3E', 20, ''),
(29, '', '024675e298b9c5d5ebc61c3fc63b3ecf', 1416486213, '1413225.024%3A+Angriff%3A+422%3Cbr+%2F%3E1413225.059%3A+Gehe+in+do_mov%28%29.%3Cbr+%2F%3E1413225.074%3A+Lese+query+mov%3Cbr+%2F%3E1413226.325%3A+L%C3%AF%C2%BF%C2%BDsche+event+main%3Cbr+%2F%3E', 20, ''),
(30, '', '354fad664415f2efe53832901d85569f', 1416486703, '1903423.499%3A+Angriff%3A+420%3Cbr+%2F%3E1903423.521%3A+Gehe+in+do_mov%28%29.%3Cbr+%2F%3E1903423.532%3A+Lese+query+mov%3Cbr+%2F%3E1903428.62%3A+Gehe+in+do_mov_attack%3Cbr+%2F%3E1903434.539%3A+Update+mov%3Cbr+%2F%3E1903438.073%3A+Event+updaten%3Cbr+%2F%3E1903438.821%3A+L%C3%AF%C2%BF%C2%BDsche+event+main%3Cbr+%2F%3E', 18, ''),
(31, '', '45aed7866d66cd7330e801e9f24cd073', 1416486706, '1906427.553%3A+Angriff%3A+421%3Cbr+%2F%3E1906427.65%3A+Gehe+in+do_mov%28%29.%3Cbr+%2F%3E1906427.668%3A+Lese+query+mov%3Cbr+%2F%3E1906427.893%3A+Gehe+in+do_mov_attack%3Cbr+%2F%3E1906433.704%3A+Update+mov%3Cbr+%2F%3E1906438.697%3A+Event+updaten%3Cbr+%2F%3E1906439.507%3A+L%C3%AF%C2%BF%C2%BDsche+event+main%3Cbr+%2F%3E', 19, ''),
(32, '', '808f2ca4d53011a5d1b87b97ea5e2f61', 1416500245, '1045174.39%3A+Angriff%3A+458%3Cbr+%2F%3E1045174.419%3A+Gehe+in+do_mov%28%29.%3Cbr+%2F%3E1045174.436%3A+Lese+query+mov%3Cbr+%2F%3E1045174.642%3A+Gehe+in+do_mov_attack%3Cbr+%2F%3E1045177.387%3A+Update+mov%3Cbr+%2F%3E1045181.82%3A+Event+updaten%3Cbr+%2F%3E1045182.448%3A+update+event+main%3Cbr+%2F%3E', 22, ''),
(33, '', '3d09115ebdf5d61a1b5fb0a308f313ef', 1416500246, '1046174.604%3A+Angriff%3A+459%3Cbr+%2F%3E1046174.627%3A+Gehe+in+do_mov%28%29.%3Cbr+%2F%3E1046174.636%3A+Lese+query+mov%3Cbr+%2F%3E1046174.896%3A+Gehe+in+do_mov_attack%3Cbr+%2F%3E1046177.687%3A+Update+mov%3Cbr+%2F%3E1046181.689%3A+Event+updaten%3Cbr+%2F%3E1046182.383%3A+update+event+main%3Cbr+%2F%3E', 23, ''),
(34, '', 'a0c340af2733b2a1073a3c1bdb1a86df', 1416501094, '1894149.68%3A+Angriff%3A+458%3Cbr+%2F%3E1894149.735%3A+Gehe+in+do_mov%28%29.%3Cbr+%2F%3E1894149.754%3A+Lese+query+mov%3Cbr+%2F%3E1894150.875%3A+L%C3%AF%C2%BF%C2%BDsche+event+main%3Cbr+%2F%3E', 22, ''),
(35, '', '3ead3cb77e302a4148a347bd695bfe0e', 1416501095, '1895149.896%3A+Angriff%3A+459%3Cbr+%2F%3E1895149.918%3A+Gehe+in+do_mov%28%29.%3Cbr+%2F%3E1895149.927%3A+Lese+query+mov%3Cbr+%2F%3E1895150.971%3A+L%C3%AF%C2%BF%C2%BDsche+event+main%3Cbr+%2F%3E', 23, ''),
(36, '', '7d10a315e6850a8c1239d9a24a28d93c', 1416501433, '2233860.942%3A+Angriff%3A+457%3Cbr+%2F%3E2233860.964%3A+Gehe+in+do_mov%28%29.%3Cbr+%2F%3E2233860.973%3A+Lese+query+mov%3Cbr+%2F%3E2233861.23%3A+Gehe+in+do_mov_attack%3Cbr+%2F%3E2233863.926%3A+Update+mov%3Cbr+%2F%3E2233867.654%3A+Event+updaten%3Cbr+%2F%3E2233868.354%3A+update+event+main%3Cbr+%2F%3E', 21, ''),
(37, '', '0d5cb9c7201fe525515d1897ae839768', 1416501510, '2309993.659%3A+Angriff%3A+463%3Cbr+%2F%3E2309993.693%3A+Gehe+in+do_mov%28%29.%3Cbr+%2F%3E2309993.712%3A+Lese+query+mov%3Cbr+%2F%3E2309994.02%3A+Gehe+in+do_mov_attack%3Cbr+%2F%3E2309997.88%3A+Update+mov%3Cbr+%2F%3E2310002.651%3A+Event+updaten%3Cbr+%2F%3E2310003.451%3A+update+event+main%3Cbr+%2F%3E', 24, ''),
(38, '', '3f80e4d3634812a6ac72511959f5a37f', 1416503482, '682479.921%3A+Angriff%3A+457%3Cbr+%2F%3E682479.957%3A+Gehe+in+do_mov%28%29.%3Cbr+%2F%3E682479.971%3A+Lese+query+mov%3Cbr+%2F%3E682481.191%3A+L%C3%AF%C2%BF%C2%BDsche+event+main%3Cbr+%2F%3E', 21, ''),
(39, '', 'b48ca7fe7e76a8aeff609d1a6eb16c18', 1416503558, '758669.809%3A+Angriff%3A+463%3Cbr+%2F%3E758669.835%3A+Gehe+in+do_mov%28%29.%3Cbr+%2F%3E758669.849%3A+Lese+query+mov%3Cbr+%2F%3E758670.908%3A+L%C3%AF%C2%BF%C2%BDsche+event+main%3Cbr+%2F%3E', 24, ''),
(40, '', 'a35caae4d00d2bcefd6e310cafb9ddb1', 1416568544, '944795.809%3A+Angriff%3A+482%3Cbr+%2F%3E944795.835%3A+Gehe+in+do_mov%28%29.%3Cbr+%2F%3E944795.848%3A+Lese+query+mov%3Cbr+%2F%3E944798.353%3A+L%C3%AF%C2%BF%C2%BDsche+event+main%3Cbr+%2F%3E', 25, ''),
(41, '', 'a66024cbfe292f30cd9270b6505fbcce', 1416764115, '2115694.987%3A+Angriff%3A+540%3Cbr+%2F%3E2115695.031%3A+Gehe+in+do_mov%28%29.%3Cbr+%2F%3E2115695.053%3A+Lese+query+mov%3Cbr+%2F%3E2115697.853%3A+L%C3%AF%C2%BF%C2%BDsche+event+main%3Cbr+%2F%3E', 27, ''),
(42, '', '80a8cc8ee4142ede9206b9f88719b671', 1416764378, '2378237.691%3A+Angriff%3A+541%3Cbr+%2F%3E2378237.722%3A+Gehe+in+do_mov%28%29.%3Cbr+%2F%3E2378237.737%3A+Lese+query+mov%3Cbr+%2F%3E2378238.583%3A+L%C3%AF%C2%BF%C2%BDsche+event+main%3Cbr+%2F%3E', 28, ''),
(43, '', '9d09a706ab3bc928c5fa7d46d67c00c0', 1416764459, '2459383.702%3A+Angriff%3A+539%3Cbr+%2F%3E2459383.738%3A+Gehe+in+do_mov%28%29.%3Cbr+%2F%3E2459383.762%3A+Lese+query+mov%3Cbr+%2F%3E2459384.007%3A+Gehe+in+do_mov_attack%3Cbr+%2F%3E2459387.127%3A+Update+mov%3Cbr+%2F%3E2459391.037%3A+Event+updaten%3Cbr+%2F%3E2459391.733%3A+update+event+main%3Cbr+%2F%3E', 26, ''),
(44, '', '5c264b2b2fe7a92e88c8239b680ea347', 1416765179, '3179879.52%3A+Angriff%3A+539%3Cbr+%2F%3E3179879.547%3A+Gehe+in+do_mov%28%29.%3Cbr+%2F%3E3179879.56%3A+Lese+query+mov%3Cbr+%2F%3E3179880.62%3A+L%C3%AF%C2%BF%C2%BDsche+event+main%3Cbr+%2F%3E', 26, ''),
(45, '', '5c92a4177556896e2f31616283cc9068', 1416820793, '1193113.552%3A+Angriff%3A+542%3Cbr+%2F%3E1193113.585%3A+Gehe+in+do_mov%28%29.%3Cbr+%2F%3E1193113.597%3A+Lese+query+mov%3Cbr+%2F%3E1193113.843%3A+Gehe+in+do_mov_attack%3Cbr+%2F%3E1193116.672%3A+Update+mov%3Cbr+%2F%3E1193120.482%3A+Event+updaten%3Cbr+%2F%3E1193121.151%3A+update+event+main%3Cbr+%2F%3E', 29, ''),
(46, '', '5b1d7b3d08970fcc1c9db012e0788a13', 1416820963, '1363573.253%3A+Angriff%3A+542%3Cbr+%2F%3E1363573.276%3A+Gehe+in+do_mov%28%29.%3Cbr+%2F%3E1363573.286%3A+Lese+query+mov%3Cbr+%2F%3E1363574.202%3A+L%C3%AF%C2%BF%C2%BDsche+event+main%3Cbr+%2F%3E', 29, ''),
(47, '', '8a4c425c3a466f7238dff6ff533b0936', 1416821177, '1577063.781%3A+Angriff%3A+553%3Cbr+%2F%3E1577063.792%3A+Gehe+in+do_mov%28%29.%3Cbr+%2F%3E1577063.799%3A+Lese+query+mov%3Cbr+%2F%3E1577064.025%3A+Gehe+in+do_mov_attack%3Cbr+%2F%3E1577066.515%3A+Update+mov%3Cbr+%2F%3E1577069.997%3A+Event+updaten%3Cbr+%2F%3E1577070.635%3A+update+event+main%3Cbr+%2F%3E', 30, ''),
(48, '', 'ee957929f51e53d185a317e799031b01', 1416821347, '1747467.116%3A+Angriff%3A+553%3Cbr+%2F%3E1747467.134%3A+Gehe+in+do_mov%28%29.%3Cbr+%2F%3E1747467.146%3A+Lese+query+mov%3Cbr+%2F%3E1747469.115%3A+L%C3%AF%C2%BF%C2%BDsche+event+main%3Cbr+%2F%3E', 30, ''),
(49, '', 'aa843cd655d57a8e5b221d6f2d23926e', 1416821595, '1995113.958%3A+Angriff%3A+554%3Cbr+%2F%3E1995113.986%3A+Gehe+in+do_mov%28%29.%3Cbr+%2F%3E1995114.002%3A+Lese+query+mov%3Cbr+%2F%3E1995114.242%3A+Gehe+in+do_mov_attack%3Cbr+%2F%3E1995118.779%3A+Update+mov%3Cbr+%2F%3E1995122.477%3A+Event+updaten%3Cbr+%2F%3E1995123.189%3A+update+event+main%3Cbr+%2F%3E', 31, ''),
(50, '', 'e805eb87b300d8068bbb6c9e2ba4e816', 1416822161, '2561402.703%3A+Angriff%3A+554%3Cbr+%2F%3E2561402.725%3A+Gehe+in+do_mov%28%29.%3Cbr+%2F%3E2561402.736%3A+Lese+query+mov%3Cbr+%2F%3E2561404.392%3A+L%C3%AF%C2%BF%C2%BDsche+event+main%3Cbr+%2F%3E', 31, ''),
(51, '', 'fe007906fccb0cf08a579939c25c5302', 1416828619, '1819918.573%3A+Angriff%3A+558%3Cbr+%2F%3E1819918.594%3A+Gehe+in+do_mov%28%29.%3Cbr+%2F%3E1819918.608%3A+Lese+query+mov%3Cbr+%2F%3E1819918.83%3A+Gehe+in+do_mov_attack%3Cbr+%2F%3E1819921.486%3A+Update+mov%3Cbr+%2F%3E1819924.966%3A+Event+updaten%3Cbr+%2F%3E1819925.63%3A+update+event+main%3Cbr+%2F%3E', 32, ''),
(52, '', '056cf1cab1887b7fdf00cffea7596fa0', 1416828621, '1821918.89%3A+Angriff%3A+559%3Cbr+%2F%3E1821918.901%3A+Gehe+in+do_mov%28%29.%3Cbr+%2F%3E1821918.91%3A+Lese+query+mov%3Cbr+%2F%3E1821919.105%3A+Gehe+in+do_mov_attack%3Cbr+%2F%3E1821921.545%3A+Update+mov%3Cbr+%2F%3E1821925.688%3A+Event+updaten%3Cbr+%2F%3E1821926.383%3A+update+event+main%3Cbr+%2F%3E', 33, ''),
(53, '', '5ccc7fd065b592be8171f0f337677d3f', 1416828622, '1822919.163%3A+Angriff%3A+560%3Cbr+%2F%3E1822919.195%3A+Gehe+in+do_mov%28%29.%3Cbr+%2F%3E1822919.211%3A+Lese+query+mov%3Cbr+%2F%3E1822919.53%3A+Gehe+in+do_mov_attack%3Cbr+%2F%3E1822922.757%3A+Update+mov%3Cbr+%2F%3E1822927.705%3A+Event+updaten%3Cbr+%2F%3E1822928.748%3A+update+event+main%3Cbr+%2F%3E', 34, ''),
(54, '', 'bde77744dd5a3c60c2f59f34e62ffa59', 1416828624, '1824918.527%3A+Angriff%3A+561%3Cbr+%2F%3E1824918.537%3A+Gehe+in+do_mov%28%29.%3Cbr+%2F%3E1824918.544%3A+Lese+query+mov%3Cbr+%2F%3E1824918.756%3A+Gehe+in+do_mov_attack%3Cbr+%2F%3E1824921.506%3A+Update+mov%3Cbr+%2F%3E1824925.788%3A+Event+updaten%3Cbr+%2F%3E1824926.515%3A+update+event+main%3Cbr+%2F%3E', 35, ''),
(55, '', '8de8b50195ca1003b3c3bd4529859c23', 1416829468, '2668967.111%3A+Angriff%3A+558%3Cbr+%2F%3E2668967.122%3A+Gehe+in+do_mov%28%29.%3Cbr+%2F%3E2668967.13%3A+Lese+query+mov%3Cbr+%2F%3E2668968.208%3A+L%C3%AF%C2%BF%C2%BDsche+event+main%3Cbr+%2F%3E', 32, ''),
(56, '', '27b82d3129374b61a05127d96af62501', 1416829470, '2670967.361%3A+Angriff%3A+559%3Cbr+%2F%3E2670967.372%3A+Gehe+in+do_mov%28%29.%3Cbr+%2F%3E2670967.38%3A+Lese+query+mov%3Cbr+%2F%3E2670968.365%3A+L%C3%AF%C2%BF%C2%BDsche+event+main%3Cbr+%2F%3E', 33, ''),
(57, '', '79418aaed12bfa866edc85ad38d92c14', 1416829471, '2671970.959%3A+Angriff%3A+560%3Cbr+%2F%3E2671970.991%3A+Gehe+in+do_mov%28%29.%3Cbr+%2F%3E2671971.004%3A+Lese+query+mov%3Cbr+%2F%3E2671972.337%3A+L%C3%AF%C2%BF%C2%BDsche+event+main%3Cbr+%2F%3E', 34, ''),
(58, '', 'effc67bfeca4c05e3ab35f2cf2164fda', 1416829473, '2673965.888%3A+Angriff%3A+561%3Cbr+%2F%3E2673965.909%3A+Gehe+in+do_mov%28%29.%3Cbr+%2F%3E2673965.918%3A+Lese+query+mov%3Cbr+%2F%3E2673967.069%3A+L%C3%AF%C2%BF%C2%BDsche+event+main%3Cbr+%2F%3E', 35, ''),
(59, '', '351be1b49aae4194926df06ed2fa822c', 1416833054, '2654187.003%3A+Angriff%3A+563%3Cbr+%2F%3E2654187.034%3A+Gehe+in+do_mov%28%29.%3Cbr+%2F%3E2654187.048%3A+Lese+query+mov%3Cbr+%2F%3E2654187.303%3A+Gehe+in+do_mov_attack%3Cbr+%2F%3E2654197.571%3A+Update+mov%3Cbr+%2F%3E2654203.602%3A+Event+updaten%3Cbr+%2F%3E2654204.799%3A+L%C3%AF%C2%BF%C2%BDsche+event+main%3Cbr+%2F%3E', 36, ''),
(60, '', '891f111531e57daf355ad24abe29344d', 1416833072, '2672190.847%3A+Angriff%3A+564%3Cbr+%2F%3E2672190.866%3A+Gehe+in+do_mov%28%29.%3Cbr+%2F%3E2672190.884%3A+Lese+query+mov%3Cbr+%2F%3E2672191.189%3A+Gehe+in+do_mov_attack%3Cbr+%2F%3E2672194.802%3A+Update+mov%3Cbr+%2F%3E2672203.123%3A+Event+updaten%3Cbr+%2F%3E2672204.181%3A+update+event+main%3Cbr+%2F%3E', 37, ''),
(61, '', '17e24f5ab6546ff56048c285717a00e6', 1416833921, '3521258.457%3A+Angriff%3A+564%3Cbr+%2F%3E3521258.483%3A+Gehe+in+do_mov%28%29.%3Cbr+%2F%3E3521258.496%3A+Lese+query+mov%3Cbr+%2F%3E3521259.648%3A+L%C3%AF%C2%BF%C2%BDsche+event+main%3Cbr+%2F%3E', 37, ''),
(62, '', 'c544c310147dc55ad9ae44a07d0148a2', 1416842897, '1697965.964%3A+Angriff%3A+591%3Cbr+%2F%3E1697965.99%3A+Gehe+in+do_mov%28%29.%3Cbr+%2F%3E1697966.001%3A+Lese+query+mov%3Cbr+%2F%3E1697966.937%3A+L%C3%AF%C2%BF%C2%BDsche+event+main%3Cbr+%2F%3E', 41, ''),
(63, '', 'bfc3b912b3119b1b709356518cf140b6', 1416846108, '1308734.923%3A+Angriff%3A+588%3Cbr+%2F%3E1308734.949%3A+Gehe+in+do_mov%28%29.%3Cbr+%2F%3E1308734.962%3A+Lese+query+mov%3Cbr+%2F%3E1308735.278%3A+Gehe+in+do_mov_attack%3Cbr+%2F%3E1308738.217%3A+Update+mov%3Cbr+%2F%3E1308741.868%3A+Event+updaten%3Cbr+%2F%3E1308742.446%3A+update+event+main%3Cbr+%2F%3E', 38, ''),
(64, '', '78f9f86e24e0b5a4180f20194ff4180d', 1416846109, '1309734.883%3A+Angriff%3A+589%3Cbr+%2F%3E1309734.91%3A+Gehe+in+do_mov%28%29.%3Cbr+%2F%3E1309734.925%3A+Lese+query+mov%3Cbr+%2F%3E1309735.175%3A+Gehe+in+do_mov_attack%3Cbr+%2F%3E1309738.023%3A+Update+mov%3Cbr+%2F%3E1309741.624%3A+Event+updaten%3Cbr+%2F%3E1309742.206%3A+update+event+main%3Cbr+%2F%3E', 39, ''),
(65, '', '841866c5956f6f495dc9157e5add62d9', 1416846111, '1311734.9%3A+Angriff%3A+590%3Cbr+%2F%3E1311734.922%3A+Gehe+in+do_mov%28%29.%3Cbr+%2F%3E1311734.931%3A+Lese+query+mov%3Cbr+%2F%3E1311735.167%3A+Gehe+in+do_mov_attack%3Cbr+%2F%3E1311738.011%3A+Update+mov%3Cbr+%2F%3E1311741.401%3A+Event+updaten%3Cbr+%2F%3E1311742.13%3A+update+event+main%3Cbr+%2F%3E', 40, ''),
(66, '', 'dafaf28a210b14c86b5d0b4c36cc76a1', 1416846178, '1378857.421%3A+Angriff%3A+592%3Cbr+%2F%3E1378857.452%3A+Gehe+in+do_mov%28%29.%3Cbr+%2F%3E1378857.465%3A+Lese+query+mov%3Cbr+%2F%3E1378857.753%3A+Gehe+in+do_mov_attack%3Cbr+%2F%3E1378865.849%3A+Update+mov%3Cbr+%2F%3E1378870.182%3A+Event+updaten%3Cbr+%2F%3E1378871.039%3A+L%C3%AF%C2%BF%C2%BDsche+event+main%3Cbr+%2F%3E', 42, ''),
(67, '', 'c06b77e99c85b1f3e5ae5774cbb4f9fb', 1416850908, '2508978.939%3A+Angriff%3A+588%3Cbr+%2F%3E2508978.979%3A+Gehe+in+do_mov%28%29.%3Cbr+%2F%3E2508979.001%3A+Lese+query+mov%3Cbr+%2F%3E2508980.588%3A+L%C3%AF%C2%BF%C2%BDsche+event+main%3Cbr+%2F%3E', 38, ''),
(68, '', '0180eeb7265654d6dc3025a093a4ad09', 1416850909, '2509978.671%3A+Angriff%3A+589%3Cbr+%2F%3E2509978.693%3A+Gehe+in+do_mov%28%29.%3Cbr+%2F%3E2509978.725%3A+Lese+query+mov%3Cbr+%2F%3E2509979.771%3A+L%C3%AF%C2%BF%C2%BDsche+event+main%3Cbr+%2F%3E', 39, ''),
(69, '', '0e53a3b0af91d3dd138c472c5500950d', 1416850911, '2511978.671%3A+Angriff%3A+590%3Cbr+%2F%3E2511978.694%3A+Gehe+in+do_mov%28%29.%3Cbr+%2F%3E2511978.738%3A+Lese+query+mov%3Cbr+%2F%3E2511979.84%3A+L%C3%AF%C2%BF%C2%BDsche+event+main%3Cbr+%2F%3E', 40, '');

-- --------------------------------------------------------

--
-- Table structure for  `mail_archiv`
--

CREATE TABLE IF NOT EXISTS `mail_archiv` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `from_id` int(11) NOT NULL DEFAULT '0',
  `from_username` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `to_id` int(11) unsigned NOT NULL DEFAULT '0',
  `to_username` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `subject` varchar(150) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `text` text COLLATE utf8_unicode_ci NOT NULL,
  `time` int(11) unsigned NOT NULL DEFAULT '0',
  `owner` int(11) unsigned NOT NULL,
  `type` varchar(3) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `to_id` (`to_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for  `mail_block`
--

CREATE TABLE IF NOT EXISTS `mail_block` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `userid` int(11) unsigned NOT NULL,
  `blocked_id` int(11) unsigned NOT NULL,
  `blocked_name` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `blocked_id` (`blocked_id`),
  KEY `blocked_name` (`blocked_name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for  `mail_in`
--

CREATE TABLE IF NOT EXISTS `mail_in` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `from_id` int(11) NOT NULL DEFAULT '0',
  `from_username` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `to_id` int(11) unsigned NOT NULL DEFAULT '0',
  `to_username` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `subject` varchar(150) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `text` text COLLATE utf8_unicode_ci NOT NULL,
  `is_read` int(1) unsigned NOT NULL DEFAULT '0',
  `is_answered` int(1) unsigned NOT NULL DEFAULT '0',
  `output_id` int(11) NOT NULL DEFAULT '0',
  `time` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `to_id` (`to_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=7 ;

--
-- Populate data for table `mail_in`
--

INSERT INTO `mail_in` (`id`, `from_id`, `from_username`, `to_id`, `to_username`, `subject`, `text`, `is_read`, `is_answered`, `output_id`, `time`) VALUES
(4, -1, 'Equipe Imperalis', 1, 'Mugaru', 'Bem-vindo+ao+Imperalis%21', 'Bem-vindo+ao+Wereld+1+%5Bplayer%5DMugaru%5B%2Fplayer%5D%21%0A%0A++++Esperamos+que+se+divirta+entrando+nessa+nova+jornada%21%0A%09%0A%09Se+tiver+perguntas+ou+algum+problema+no+jogo+poder%C3%A1+nos+contactar+pelo+%5Burl%3Dhttp%3A%2F%2Fsupport.zapping.tk%5Dsuporte%5B%2Furl%5D.%0A%09%0A%09Entre+em+nosso+%5Burl%3Dhttp%3A%2F%2Fforum.zapping.tk%5Df%C3%B3rum%5B%2Furl%5D+e+fique+atualizado+sobre+tudo%21%0A%0A%09Atenciosamente%2C%0A%09Equipe+%5Burl%3Dhttp%3A%2F%2Fzapping.tk%5DImperalis%5B%2Furl%5D', 1, 0, 0, 1416476927),
(6, -1, 'Equipe Imperalis', 2, 'Ukiraki', 'Bem-vindo+ao+Imperalis%21', 'Bem-vindo+ao+Wereld+1+%5Bplayer%5DUkiraki%5B%2Fplayer%5D%21%0A%0A++++Esperamos+que+se+divirta+entrando+nessa+nova+jornada%21%0A%09%0A%09Se+tiver+perguntas+ou+algum+problema+no+jogo+poder%C3%A1+nos+contactar+pelo+%5Burl%3Dhttp%3A%2F%2Fsupport.zapping.tk%5Dsuporte%5B%2Furl%5D.%0A%09%0A%09Entre+em+nosso+%5Burl%3Dhttp%3A%2F%2Fforum.zapping.tk%5Df%C3%B3rum%5B%2Furl%5D+e+fique+atualizado+sobre+tudo%21%0A%0A%09Atenciosamente%2C%0A%09Equipe+%5Burl%3Dhttp%3A%2F%2Fzapping.tk%5DImperalis%5B%2Furl%5D', 0, 0, 0, 1416566789);

-- --------------------------------------------------------

--
-- Table structure for  `mail_in_post`
--

CREATE TABLE IF NOT EXISTS `mail_in_post` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `username` varchar(100) COLLATE latin1_general_ci NOT NULL,
  `text` text COLLATE latin1_general_ci NOT NULL,
  `time` int(35) NOT NULL,
  `msg_id` varchar(250) COLLATE latin1_general_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for  `mail_mass`
--

CREATE TABLE IF NOT EXISTS `mail_mass` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `subject` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `time` int(20) NOT NULL,
  `text` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `array_subjects_id` varchar(1000) COLLATE utf8_unicode_ci NOT NULL,
  `from_id` int(20) NOT NULL,
  `from_username` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `belongs_to` int(12) NOT NULL DEFAULT '0',
  `delete` enum('y','n') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'n',
  `id_display` int(15) NOT NULL DEFAULT '-1',
  `username_display` varchar(300) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `from_id` (`from_id`),
  KEY `belongs_to` (`belongs_to`),
  KEY `delete` (`delete`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=2 ;

-- --------------------------------------------------------

--
-- Table structure for  `mail_out`
--

CREATE TABLE IF NOT EXISTS `mail_out` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `from_id` int(11) unsigned NOT NULL DEFAULT '0',
  `from_username` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `to_id` int(11) unsigned NOT NULL DEFAULT '0',
  `to_username` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `subject` varchar(150) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `text` text COLLATE utf8_unicode_ci NOT NULL,
  `is_read` int(1) unsigned NOT NULL DEFAULT '0',
  `time` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `from_id` (`from_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=2 ;

--
-- Populate data for table `mail_out`
--

INSERT INTO `mail_out` (`id`, `from_id`, `from_username`, `to_id`, `to_username`, `subject`, `text`, `is_read`, `time`) VALUES
(1, 1, 'Mugaru', 1, 'Mugaru', '123', '123', 1, 1416480302);

-- --------------------------------------------------------

--
-- Table structure for  `mail_post`
--

CREATE TABLE IF NOT EXISTS `mail_post` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `subject_id` int(20) NOT NULL,
  `text` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `time` int(20) NOT NULL,
  `from_id` int(20) NOT NULL,
  `from_username` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `to_id` int(11) NOT NULL,
  `to_username` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `subject_id` (`subject_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=16392 ;

-- --------------------------------------------------------

--
-- Table structure for  `mail_subject`
--

CREATE TABLE IF NOT EXISTS `mail_subject` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `subject` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `last_post` int(20) NOT NULL,
  `from_id` int(20) NOT NULL DEFAULT '-1',
  `to_id` int(20) NOT NULL DEFAULT '-1',
  `from_username` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `to_username` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `post_num` int(20) NOT NULL,
  `status_from` enum('read','new','answered') COLLATE utf8_unicode_ci NOT NULL,
  `status_to` enum('read','new','answered') COLLATE utf8_unicode_ci NOT NULL,
  `delete_from` enum('y','n') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'n',
  `delete_to` enum('y','n') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'n',
  `read_unique` enum('y','n') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'n',
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `delete_from` (`delete_from`),
  KEY `delete_to` (`delete_to`),
  KEY `from_id` (`from_id`),
  KEY `to_id` (`to_id`),
  KEY `subject` (`subject`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=16138 ;

--
-- Populate data for table `mail_subject`
--

INSERT INTO `mail_subject` (`id`, `subject`, `last_post`, `from_id`, `to_id`, `from_username`, `to_username`, `post_num`, `status_from`, `status_to`, `delete_from`, `delete_to`, `read_unique`, `time`) VALUES
(16136, 'Bem-vindo+ao+Imperalis%21', 1416476927, -1, 1, 'Equipe Imperalis', 'Mugaru', 1, 'answered', 'new', 'n', 'n', 'n', '2014-11-20 09:48:47'),
(16137, 'Bem-vindo+ao+Imperalis%21', 1416566789, -1, 2, 'Equipe Imperalis', 'Ukiraki', 1, 'answered', 'new', 'n', 'n', 'n', '2014-11-21 10:46:29');

-- --------------------------------------------------------

--
-- Table structure for  `map`
--

CREATE TABLE IF NOT EXISTS `map` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `x` smallint(3) NOT NULL,
  `y` smallint(3) NOT NULL,
  `type` enum('grass','berg','see','forest','other') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'other',
  `image` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `x` (`x`),
  KEY `y` (`y`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=354256 ;

-- --------------------------------------------------------

--
-- Table structure for  `map_info`
--

CREATE TABLE IF NOT EXISTS `map_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userid` int(11) NOT NULL,
  `resources` int(1) NOT NULL,
  `farm` int(1) NOT NULL,
  `dealers` int(1) NOT NULL,
  `troops` int(1) NOT NULL,
  `attktime` int(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci AUTO_INCREMENT=18 ;

-- --------------------------------------------------------

--
-- Table structure for  `map_styling`
--

CREATE TABLE IF NOT EXISTS `map_styling` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `x` int(11) unsigned NOT NULL,
  `y` int(11) unsigned NOT NULL,
  `type` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for  `marked`
--

CREATE TABLE IF NOT EXISTS `marked` (
  `marker_id` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `marked_id` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `color` varchar(6) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for  `medal`
--

CREATE TABLE IF NOT EXISTS `medal` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `points` int(11) NOT NULL DEFAULT '0',
  `points_stage` int(11) NOT NULL DEFAULT '0',
  `lad` int(11) NOT NULL DEFAULT '0',
  `lad_stage` int(11) NOT NULL DEFAULT '0',
  `saque` int(11) NOT NULL DEFAULT '0',
  `saque_stage` int(11) NOT NULL DEFAULT '0',
  `conquer` int(11) NOT NULL DEFAULT '0',
  `conquer_stage` int(11) NOT NULL DEFAULT '0',
  `lider` int(11) NOT NULL DEFAULT '0',
  `lider_stage` int(11) NOT NULL DEFAULT '0',
  `hero` int(11) NOT NULL DEFAULT '0',
  `hero_stage` int(11) NOT NULL DEFAULT '0',
  `rank` int(11) NOT NULL DEFAULT '0',
  `rank_stage` int(11) NOT NULL DEFAULT '0',
  `reserved` int(11) NOT NULL DEFAULT '0',
  `reserved_stage` int(11) NOT NULL DEFAULT '0',
  `merkat` int(11) NOT NULL DEFAULT '0',
  `merkat_stage` int(11) NOT NULL DEFAULT '0',
  `friends` int(11) NOT NULL DEFAULT '0',
  `friends_stage` int(11) NOT NULL DEFAULT '0',
  `wars` int(11) NOT NULL DEFAULT '0',
  `wars_stage` int(11) NOT NULL DEFAULT '0',
  `demolisher` int(11) NOT NULL DEFAULT '0',
  `demolisher_stage` int(11) NOT NULL DEFAULT '0',
  `tribo` int(11) NOT NULL DEFAULT '0',
  `tribo_stage` int(11) NOT NULL DEFAULT '0',
  `nobles_faith` int(11) NOT NULL DEFAULT '0',
  `nobles_faith_stage` int(11) NOT NULL DEFAULT '0',
  `master_camp` int(11) NOT NULL DEFAULT '0',
  `master_camp_stage` int(11) NOT NULL DEFAULT '0',
  `scout` int(11) NOT NULL DEFAULT '0',
  `scout_stage` int(11) NOT NULL DEFAULT '0',
  `gluck` int(11) NOT NULL DEFAULT '0',
  `gluck_stage` int(11) NOT NULL DEFAULT '0',
  `bluck` int(11) NOT NULL DEFAULT '0',
  `bluck_stage` int(11) NOT NULL DEFAULT '0',
  `vit` int(11) NOT NULL DEFAULT '0',
  `vit_stage` int(11) NOT NULL DEFAULT '0',
  `aconquer` int(11) NOT NULL DEFAULT '0',
  `aconquer_stage` int(11) NOT NULL DEFAULT '0',
  `aatack` int(11) NOT NULL DEFAULT '0',
  `aatack_stage` int(11) NOT NULL DEFAULT '0',
  `refors` int(11) NOT NULL DEFAULT '0',
  `refors_stage` int(11) NOT NULL DEFAULT '0',
  `resurrection` int(11) NOT NULL DEFAULT '0',
  `resurrection_stage` int(11) NOT NULL DEFAULT '0',
  `gold` int(11) NOT NULL DEFAULT '0',
  `gold_stage` int(11) NOT NULL DEFAULT '0',
  `wallbreaker` int(11) NOT NULL DEFAULT '0',
  `wallbreaker_stage` int(11) NOT NULL DEFAULT '0',
  `rank_view` int(11) NOT NULL DEFAULT '0',
  `points_view` int(11) NOT NULL DEFAULT '0',
  `lad_view` int(11) NOT NULL DEFAULT '0',
  `saque_view` int(11) NOT NULL DEFAULT '0',
  `conquer_view` int(11) NOT NULL DEFAULT '0',
  `lider_view` int(11) NOT NULL DEFAULT '0',
  `hero_view` int(11) NOT NULL DEFAULT '0',
  `reserved_view` int(11) NOT NULL DEFAULT '0',
  `merkat_view` int(11) NOT NULL DEFAULT '0',
  `friends_view` int(11) NOT NULL DEFAULT '0',
  `wars_view` int(11) NOT NULL DEFAULT '0',
  `demolisher_view` int(11) NOT NULL DEFAULT '0',
  `tribo_view` int(11) NOT NULL DEFAULT '0',
  `nobles_faith_view` int(11) NOT NULL DEFAULT '0',
  `master_camp_view` int(11) NOT NULL DEFAULT '0',
  `scout_view` int(11) NOT NULL DEFAULT '0',
  `aatack_view` int(11) NOT NULL DEFAULT '0',
  `gluck_view` int(11) NOT NULL DEFAULT '0',
  `bluck_view` int(11) NOT NULL DEFAULT '0',
  `aconquer_view` int(11) NOT NULL DEFAULT '0',
  `refors_view` int(11) NOT NULL DEFAULT '0',
  `resurrection_view` int(11) NOT NULL DEFAULT '0',
  `gold_view` int(11) NOT NULL DEFAULT '0',
  `wallbreaker_view` int(11) NOT NULL DEFAULT '0',
  `total_stage` int(11) NOT NULL DEFAULT '0',
  `rang` int(11) NOT NULL DEFAULT '0',
  `userid` int(11) NOT NULL DEFAULT '0',
  `username` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AVG_ROW_LENGTH=289 AUTO_INCREMENT=1467 ;

--
-- Populate data for table `medal`
--

INSERT INTO `medal` (`id`, `points`, `points_stage`, `lad`, `lad_stage`, `saque`, `saque_stage`, `conquer`, `conquer_stage`, `lider`, `lider_stage`, `hero`, `hero_stage`, `rank`, `rank_stage`, `reserved`, `reserved_stage`, `merkat`, `merkat_stage`, `friends`, `friends_stage`, `wars`, `wars_stage`, `demolisher`, `demolisher_stage`, `tribo`, `tribo_stage`, `nobles_faith`, `nobles_faith_stage`, `master_camp`, `master_camp_stage`, `scout`, `scout_stage`, `gluck`, `gluck_stage`, `bluck`, `bluck_stage`, `vit`, `vit_stage`, `aconquer`, `aconquer_stage`, `aatack`, `aatack_stage`, `refors`, `refors_stage`, `resurrection`, `resurrection_stage`, `gold`, `gold_stage`, `wallbreaker`, `wallbreaker_stage`, `rank_view`, `points_view`, `lad_view`, `saque_view`, `conquer_view`, `lider_view`, `hero_view`, `reserved_view`, `merkat_view`, `friends_view`, `wars_view`, `demolisher_view`, `tribo_view`, `nobles_faith_view`, `master_camp_view`, `scout_view`, `aatack_view`, `gluck_view`, `bluck_view`, `aconquer_view`, `refors_view`, `resurrection_view`, `gold_view`, `wallbreaker_view`, `total_stage`, `rang`, `userid`, `username`) VALUES
(1465, 43092, 2, 527219, 3, 33, 1, 5, 1, 0, 0, 2200, 2, 1, 4, 0, 0, 0, 0, 0, 0, 33, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 2640, 3, 2, 0, 0, 0, 66, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 20, 0, 1, 'Mugaru'),
(1466, 100, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4, 0, 2, 'Ukiraki');

-- --------------------------------------------------------

--
-- Table structure for  `movements`
--

CREATE TABLE IF NOT EXISTS `movements` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `from_village` int(11) unsigned DEFAULT NULL,
  `to_village` int(11) unsigned DEFAULT NULL,
  `units` varchar(350) COLLATE utf8_unicode_ci NOT NULL,
  `type` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `start_time` int(11) unsigned NOT NULL,
  `end_time` int(11) unsigned NOT NULL,
  `building` varchar(60) COLLATE utf8_unicode_ci DEFAULT NULL,
  `from_userid` int(11) unsigned NOT NULL,
  `to_userid` int(11) unsigned NOT NULL,
  `to_hidden` int(1) unsigned DEFAULT '0',
  `wood` int(11) unsigned NOT NULL DEFAULT '0',
  `stone` int(11) unsigned NOT NULL DEFAULT '0',
  `iron` int(11) unsigned NOT NULL DEFAULT '0',
  `send_from_village` int(11) unsigned NOT NULL,
  `send_from_user` int(11) unsigned NOT NULL,
  `send_to_user` int(11) unsigned NOT NULL,
  `send_to_village` int(11) unsigned NOT NULL,
  `die` int(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `end_time` (`end_time`),
  KEY `send_from_village` (`send_from_village`),
  KEY `send_from_user` (`send_from_user`),
  KEY `send_to_user` (`send_to_user`),
  KEY `send_to_village` (`send_to_village`),
  KEY `from_hidden` (`to_hidden`),
  KEY `type` (`type`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=43 ;

-- --------------------------------------------------------

--
-- Table structure for  `offers`
--

CREATE TABLE IF NOT EXISTS `offers` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `sell` int(11) unsigned NOT NULL,
  `buy` int(11) unsigned NOT NULL,
  `sell_ress` varchar(5) COLLATE utf8_unicode_ci NOT NULL,
  `buy_ress` varchar(5) COLLATE utf8_unicode_ci NOT NULL,
  `multi` int(11) NOT NULL,
  `from_village` int(11) unsigned NOT NULL,
  `time` int(11) unsigned NOT NULL,
  `do_action` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `ratio_max` double unsigned NOT NULL,
  `userid` int(11) unsigned NOT NULL,
  `x` int(11) unsigned NOT NULL,
  `y` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for  `offers_multi`
--

CREATE TABLE IF NOT EXISTS `offers_multi` (
  `id` int(11) unsigned NOT NULL,
  KEY `id` (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for  `quests`
--

CREATE TABLE IF NOT EXISTS `quests` (
  `userid` int(11) NOT NULL,
  `leem30` int(2) NOT NULL,
  `hout30` int(2) NOT NULL,
  `ijzer30` int(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Populate data for table `quests`
--

INSERT INTO `quests` (`userid`, `leem30`, `hout30`, `ijzer30`) VALUES
(1, 1, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for  `quickbar`
--

CREATE TABLE IF NOT EXISTS `quickbar` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` text COLLATE utf8_unicode_ci NOT NULL,
  `img` text COLLATE utf8_unicode_ci NOT NULL,
  `href` text COLLATE utf8_unicode_ci NOT NULL,
  `target` int(11) unsigned NOT NULL,
  `uid` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for  `ranking_ally_k`
--

CREATE TABLE IF NOT EXISTS `ranking_ally_k` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `allyid` int(11) NOT NULL,
  `ally` varchar(255) NOT NULL,
  `members` int(11) NOT NULL,
  `rank` int(11) NOT NULL,
  `points` int(11) NOT NULL,
  `villages` int(11) NOT NULL,
  `continent` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=65 ;

-- --------------------------------------------------------

--
-- Table structure for  `ranking_user_k`
--

CREATE TABLE IF NOT EXISTS `ranking_user_k` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userid` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `rank` int(11) NOT NULL,
  `points` int(11) NOT NULL,
  `villages` int(11) NOT NULL,
  `continent` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=1574 ;

-- --------------------------------------------------------

--
-- Table structure for  `recruit`
--

CREATE TABLE IF NOT EXISTS `recruit` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `unit` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `num_unit` int(11) unsigned DEFAULT '0',
  `num_finished` int(11) unsigned DEFAULT '0',
  `last_reload` int(11) DEFAULT '-1',
  `time_finished` int(11) unsigned NOT NULL,
  `time_start` int(11) unsigned NOT NULL,
  `time_per_unit` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `building` varchar(35) COLLATE utf8_unicode_ci NOT NULL,
  `villageid` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `building` (`building`),
  KEY `villageid` (`villageid`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=93 ;

-- --------------------------------------------------------

--
-- Table structure for  `reports`
--

CREATE TABLE IF NOT EXISTS `reports` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(230) COLLATE utf8_unicode_ci NOT NULL,
  `title_image` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `time` int(11) unsigned NOT NULL,
  `type` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `a_units` varchar(350) COLLATE utf8_unicode_ci NOT NULL,
  `b_units` varchar(350) COLLATE utf8_unicode_ci NOT NULL,
  `c_units` varchar(350) COLLATE utf8_unicode_ci NOT NULL,
  `d_units` varchar(350) COLLATE utf8_unicode_ci NOT NULL,
  `e_units` varchar(350) COLLATE utf8_unicode_ci DEFAULT NULL,
  `agreement` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `ram` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `catapult` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `message` text COLLATE utf8_unicode_ci NOT NULL,
  `to_user` int(11) unsigned NOT NULL,
  `from_user` int(11) NOT NULL,
  `to_village` int(11) unsigned NOT NULL,
  `from_village` int(11) unsigned NOT NULL,
  `receiver_userid` int(11) unsigned NOT NULL,
  `is_new` int(1) unsigned NOT NULL DEFAULT '1',
  `in_group` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  `luck` varchar(6) COLLATE utf8_unicode_ci DEFAULT NULL,
  `moral` int(6) DEFAULT NULL,
  `wins` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `hives` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `see_def_units` int(1) unsigned NOT NULL DEFAULT '1',
  `ally` int(11) unsigned NOT NULL,
  `allyname` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `from_username` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `to_username` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `receiver_userid` (`receiver_userid`),
  KEY `group` (`in_group`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=116 ;

--
-- Populate data for table `reports`
--

INSERT INTO `reports` (`id`, `title`, `title_image`, `time`, `type`, `a_units`, `b_units`, `c_units`, `d_units`, `e_units`, `agreement`, `ram`, `catapult`, `message`, `to_user`, `from_user`, `to_village`, `from_village`, `receiver_userid`, `is_new`, `in_group`, `luck`, `moral`, `wins`, `hives`, `see_def_units`, `ally`, `allyname`, `from_username`, `to_username`) VALUES
(83, '001+%7C+TT+apoiou+Mugaru.', '', 1416764114, 'support', '0;0;0;0;1671;0;0;0;0;0', '', '', '', NULL, '', '', '', '', 1, 1, 25, 22, 1, 0, 'support', NULL, NULL, '', '', 1, 0, '', '', ''),
(78, 'Medalha+Campe%C3%A3o+de+Pontua%C3%A7%C3%A3o+Hout+-+Level+1', '', 1416569849, 'medal', '', '', '', '', NULL, '', '', '', 'points;1', 0, 0, 0, 0, 2, 0, 'other', NULL, NULL, '', '', 1, 0, '', '', ''),
(84, 'Mugaru+%28001+%7C+TT%29+ataca+Barbarendorp+%28500%7C504%29+K55.', '../global_cdn/graphic/dots/green.png', 1416764458, 'attack', '0;0;5323;0;0;0;0;0;0;0', '0;0;0;0;0;0;0;0;0;0', '0;0;0;0;0;0;0;0;0;0', '0;0;0;0;0;0;0;0;0;0', '', '100;100', '3;3', '0;0;', '', 0, 1, 31, 22, 1, 0, 'attack', '-11', 100, 'att', '1463;1463;1463;4389;53230', 1, 0, '', '', ''),
(85, 'Barbarendorp+%28500%7C504%29+K55+foi+atacada+por+Mugaru+%28001+%7C+TT%29', '../global_cdn/graphic/dots/red.png', 1416764458, 'attack', '0;0;5323;0;0;0;0;0;0;0', '0;0;0;0;0;0;0;0;0;0', '0;0;0;0;0;0;0;0;0;0', '0;0;0;0;0;0;0;0;0;0', '', '100;100', '3;3', '0;0;', '', 0, 1, 31, 22, 0, 1, 'defense', '-11', 100, 'att', '1463;1463;1463;4389;53230', 1, 0, '', '', ''),
(22, 'Barbarendorp+%28501%7C502%29+K55+foi+atacada+por+Mugaru+%28Aldeia+de+Mugaru%29', '../global_cdn/graphic/dots/blue.png', 1416478880, 'attack', '0;0;0;0;118;0;0;0;0;0;0;0', '0;0;0;0;0;0;0;0;0;0;0;0', '0;0;0;0;0;0;0;0;0;0;0;0', '0;0;0;0;0;0;0;0;0;0;0;0', '', '100;100', '20;20', '0;0;', '', 0, 1, 24, 22, 0, 1, 'defense', '17', 100, 'att', '0;0;0;0;0', 1, 0, '', '', ''),
(86, 'Mugaru+%28001+%7C+TT%29+ataca+Barbarendorp+%28501%7C502%29+K55.', '../global_cdn/graphic/dots/blue.png', 1416820792, 'attack', '0;0;0;118;0;0;0;0;0;0', '0;0;0;0;0;0;0;0;0;0', '0;0;0;0;0;0;0;0;0;0', '0;0;0;0;0;0;0;0;0;0', '', '100;100', '20;20', '0;0;', '', 0, 1, 24, 22, 1, 0, 'attack', '-25', 100, 'def', '0;0;0;0;0', 1, 0, '', '', ''),
(25, 'Barbarendorp+%28499%7C502%29+K54+foi+atacada+por+Mugaru+%28001+%7C+TT%29', '../global_cdn/graphic/dots/red.png', 1416479582, 'attack', '0;0;1000;0;0;0;0;0;0;0', '0;0;0;0;0;0;0;0;0;0', '0;0;0;0;0;0;0;0;0;0', '0;0;0;0;0;0;0;0;0;0', '', '100;100', '20;20', '0;0;', '', 0, 1, 25, 22, 0, 1, 'defense', '-4', 100, 'att', '3840;5205;955;10000;10000', 1, 0, '', '', ''),
(87, 'Barbarendorp+%28501%7C502%29+K55+foi+atacada+por+Mugaru+%28001+%7C+TT%29', '../global_cdn/graphic/dots/blue.png', 1416820792, 'attack', '0;0;0;118;0;0;0;0;0;0', '0;0;0;0;0;0;0;0;0;0', '0;0;0;0;0;0;0;0;0;0', '0;0;0;0;0;0;0;0;0;0', '', '100;100', '20;20', '0;0;', '', 0, 1, 24, 22, 0, 1, 'defense', '-25', 100, 'def', '0;0;0;0;0', 1, 0, '', '', ''),
(88, 'Mugaru+%28001+%7C+TT%29+ataca+Barbarendorp+%28501%7C502%29+K55.', '../global_cdn/graphic/dots/blue.png', 1416821176, 'attack', '0;0;0;265;0;0;0;0;0;0', '0;0;0;0;0;0;0;0;0;0', '0;0;0;0;0;0;0;0;0;0', '0;0;0;0;0;0;0;0;0;0', '', '100;100', '20;20', '0;0;', '', 0, 1, 24, 22, 1, 1, 'attack', '5', 100, 'att', '0;0;0;0;0', 1, 0, '', '', ''),
(28, 'Barbarendorp+%28501%7C502%29+K55+foi+atacada+por+Mugaru+%28001+%7C+TT%29', '../global_cdn/graphic/dots/red.png', 1416479589, 'attack', '0;0;1000;0;0;0;0;0;0;0', '0;0;0;0;0;0;0;0;0;0', '0;0;0;0;0;0;0;0;0;0', '0;0;0;0;0;0;0;0;0;0', '', '100;100', '20;20', '0;0;', '', 0, 1, 24, 22, 0, 1, 'defense', '0', 100, 'att', '3334;3333;3333;10000;10000', 1, 0, '', '', ''),
(89, 'Barbarendorp+%28501%7C502%29+K55+foi+atacada+por+Mugaru+%28001+%7C+TT%29', '../global_cdn/graphic/dots/blue.png', 1416821176, 'attack', '0;0;0;265;0;0;0;0;0;0', '0;0;0;0;0;0;0;0;0;0', '0;0;0;0;0;0;0;0;0;0', '0;0;0;0;0;0;0;0;0;0', '', '100;100', '20;20', '0;0;', '', 0, 1, 24, 22, 0, 1, 'defense', '5', 100, 'att', '0;0;0;0;0', 1, 0, '', '', ''),
(30, 'Barbarendorp+%28500%7C499%29+K45+foi+atacada+por+Mugaru+%28001+%7C+TT%29', '../global_cdn/graphic/dots/red.png', 1416479738, 'attack', '0;0;1000;0;0;0;0;0;0;0', '0;0;0;0;0;0;0;0;0;0', '0;0;0;0;0;0;0;0;0;0', '0;0;0;0;0;0;0;0;0;0', '', '100;100', '20;20', '0;0;', '', 0, 1, 23, 22, 0, 1, 'defense', '16', 100, 'att', '4164;3575;2261;10000;10000', 1, 0, '', '', ''),
(32, 'Barbarendorp+%28500%7C499%29+K45+foi+atacada+por+Mugaru+%28001+%7C+TT%29', '../global_cdn/graphic/dots/red.png', 1416481366, 'attack', '0;0;500;0;50;0;0;0;0;1', '0;0;0;0;0;0;0;0;0;0', '0;0;0;0;0;0;0;0;0;0', '0;0;0;0;0;0;0;0;0;0', '', '100;69', '20;20', '0;0;', '', 0, 1, 23, 22, 0, 1, 'defense', '-21', 100, 'att', '3544;3340;2116;9000;9000', 1, 0, '', '', ''),
(90, 'Mugaru+%28001+%7C+TT%29+ataca+Barbarendorp+%28501%7C502%29+K55.', '../global_cdn/graphic/dots/green.png', 1416821594, 'attack', '0;0;5323;0;1671;0;330;0;0;0', '0;0;0;0;0;0;0;0;0;0', '0;0;0;0;0;0;0;0;0;0', '0;0;0;0;0;0;0;0;0;0', '', '100;100', '20;0', '0;0;', '', 0, 1, 24, 22, 1, 0, 'attack', '-5', 100, 'att', '62304;62303;62303;186910;186910', 1, 0, '', '', ''),
(34, 'Barbarendorp+%28500%7C499%29+K45+foi+atacada+por+Mugaru+%28001+%7C+TT%29', '../global_cdn/graphic/dots/red.png', 1416481368, 'attack', '0;0;500;0;50;0;0;0;0;1', '0;0;0;0;0;0;0;0;0;0', '0;0;0;0;0;0;0;0;0;0', '0;0;0;0;0;0;0;0;0;0', '', '69;46', '20;20', '0;0;', '', 0, 1, 23, 22, 0, 1, 'defense', '10', 100, 'att', '3418;3417;2165;9000;9000', 1, 0, '', '', ''),
(91, 'Barbarendorp+%28501%7C502%29+K55+foi+atacada+por+Mugaru+%28001+%7C+TT%29', '../global_cdn/graphic/dots/red.png', 1416821594, 'attack', '0;0;5323;0;1671;0;330;0;0;0', '0;0;0;0;0;0;0;0;0;0', '0;0;0;0;0;0;0;0;0;0', '0;0;0;0;0;0;0;0;0;0', '', '100;100', '20;0', '0;0;', '', 0, 1, 24, 22, 0, 1, 'defense', '-5', 100, 'att', '62304;62303;62303;186910;186910', 1, 0, '', '', ''),
(36, 'Barbarendorp+%28500%7C499%29+K45+foi+atacada+por+Mugaru+%28001+%7C+TT%29', '../global_cdn/graphic/dots/red.png', 1416481369, 'attack', '0;0;500;0;50;0;0;0;0;1', '0;0;0;0;0;0;0;0;0;0', '0;0;0;0;0;0;0;0;0;0', '0;0;0;0;0;0;0;0;0;0', '', '46;11', '20;20', '0;0;', '', 0, 1, 23, 22, 0, 1, 'defense', '-17', 100, 'att', '3418;3417;2165;9000;9000', 1, 0, '', '', ''),
(92, 'Medalha+Comandante+de+Guerra+Brons+-+Level+2', '', 1416827771, 'medal', '', '', '', '', NULL, '', '', '', 'wars;2', 0, 0, 0, 0, 1, 0, 'other', NULL, NULL, '', '', 1, 0, '', '', ''),
(93, 'Mugaru+%28001+%7C+TT%29+ataca+Barbarendorp+%28501%7C502%29+K55.', '../global_cdn/graphic/dots/green.png', 1416828618, 'attack', '0;0;1000;0;200;0;0;0;0;1', '0;0;0;0;0;0;0;0;0;0', '0;0;0;0;0;0;0;0;0;0', '0;0;0;0;0;0;0;0;0;0', '', '100;75', '0;0', '0;0;', '', 0, 1, 24, 22, 1, 1, 'attack', '-2', 100, 'att', '8667;8667;8666;26000;26000', 1, 0, '', '', ''),
(38, 'Barbarendorp+%28500%7C499%29+K45+foi+conquistada+por+Mugaru+%28001+%7C+TT%29', '../global_cdn/graphic/dots/red.png', 1416481371, 'attack', '0;0;500;0;50;0;0;0;0;1', '0;0;0;0;0;0;0;0;0;0', '0;0;0;0;0;0;0;0;0;0', '0;0;0;0;0;0;0;0;0;0', '0;0;0;0;0;0;0;0;0;0', '11;-14', '20;20', '0;0;', '', 0, 1, 23, 22, 0, 1, 'defense', '-3', 100, 'att', '3418;3417;2165;9000;9000', 1, 0, '', '', ''),
(94, 'Barbarendorp+%28501%7C502%29+K55+foi+atacada+por+Mugaru+%28001+%7C+TT%29', '../global_cdn/graphic/dots/red.png', 1416828618, 'attack', '0;0;1000;0;200;0;0;0;0;1', '0;0;0;0;0;0;0;0;0;0', '0;0;0;0;0;0;0;0;0;0', '0;0;0;0;0;0;0;0;0;0', '', '100;75', '0;0', '0;0;', '', 0, 1, 24, 22, 0, 1, 'defense', '-2', 100, 'att', '8667;8667;8666;26000;26000', 1, 0, '', '', ''),
(41, 'Barbarendorp+%28499%7C502%29+K54+foi+atacada+por+Mugaru+%28001+%7C+TT%29', '../global_cdn/graphic/dots/red.png', 1416484951, 'attack', '0;0;1000;0;50;0;0;0;0;1', '0;0;0;0;0;0;0;0;0;0', '0;0;0;0;0;0;0;0;0;0', '0;0;0;0;0;0;0;0;0;0', '', '100;74', '20;20', '0;0;', '', 0, 1, 25, 22, 0, 1, 'defense', '-23', 100, 'att', '5838;5838;2324;14000;14000', 1, 0, '', '', ''),
(95, 'Mugaru+%28001+%7C+TT%29+ataca+Barbarendorp+%28501%7C502%29+K55.', '../global_cdn/graphic/dots/green.png', 1416828620, 'attack', '0;0;1000;0;200;0;0;0;0;1', '0;0;0;0;0;0;0;0;0;0', '0;0;0;0;0;0;0;0;0;0', '0;0;0;0;0;0;0;0;0;0', '', '75;49', '0;0', '0;0;', '', 0, 1, 24, 22, 1, 1, 'attack', '20', 100, 'att', '8666;8668;8666;26000;26000', 1, 0, '', '', ''),
(43, 'Barbarendorp+%28499%7C502%29+K54+foi+atacada+por+Mugaru+%28001+%7C+TT%29', '../global_cdn/graphic/dots/red.png', 1416484954, 'attack', '0;0;1000;0;50;0;0;0;0;1', '0;0;0;0;0;0;0;0;0;0', '0;0;0;0;0;0;0;0;0;0', '0;0;0;0;0;0;0;0;0;0', '', '74;46', '20;20', '0;0;', '', 0, 1, 25, 22, 0, 1, 'defense', '-24', 100, 'att', '5838;5838;2324;14000;14000', 1, 0, '', '', ''),
(96, 'Barbarendorp+%28501%7C502%29+K55+foi+atacada+por+Mugaru+%28001+%7C+TT%29', '../global_cdn/graphic/dots/red.png', 1416828620, 'attack', '0;0;1000;0;200;0;0;0;0;1', '0;0;0;0;0;0;0;0;0;0', '0;0;0;0;0;0;0;0;0;0', '0;0;0;0;0;0;0;0;0;0', '', '75;49', '0;0', '0;0;', '', 0, 1, 24, 22, 0, 1, 'defense', '20', 100, 'att', '8666;8668;8666;26000;26000', 1, 0, '', '', ''),
(45, 'Barbarendorp+%28499%7C502%29+K54+foi+atacada+por+Mugaru+%28001+%7C+TT%29', '../global_cdn/graphic/dots/red.png', 1416484955, 'attack', '0;0;1000;0;50;0;0;0;0;1', '0;0;0;0;0;0;0;0;0;0', '0;0;0;0;0;0;0;0;0;0', '0;0;0;0;0;0;0;0;0;0', '', '46;26', '20;20', '0;0;', '', 0, 1, 25, 22, 0, 1, 'defense', '-16', 100, 'att', '5838;5839;2323;14000;14000', 1, 0, '', '', ''),
(97, 'Mugaru+%28001+%7C+TT%29+ataca+Barbarendorp+%28501%7C502%29+K55.', '../global_cdn/graphic/dots/green.png', 1416828621, 'attack', '0;0;1000;0;200;0;0;0;0;1', '0;0;0;0;0;0;0;0;0;0', '0;0;0;0;0;0;0;0;0;0', '0;0;0;0;0;0;0;0;0;0', '', '49;29', '0;0', '0;0;', '', 0, 1, 24, 22, 1, 1, 'attack', '-1', 100, 'att', '8667;8668;8665;26000;26000', 1, 0, '', '', ''),
(47, 'Barbarendorp+%28499%7C502%29+K54+foi+atacada+por+Mugaru+%28001+%7C+TT%29', '../global_cdn/graphic/dots/red.png', 1416484957, 'attack', '0;0;1000;0;50;0;0;0;0;1', '0;0;0;0;0;0;0;0;0;0', '0;0;0;0;0;0;0;0;0;0', '0;0;0;0;0;0;0;0;0;0', '', '26;6', '20;20', '0;0;', '', 0, 1, 25, 22, 0, 1, 'defense', '-21', 100, 'att', '5839;5838;2323;14000;14000', 1, 0, '', '', ''),
(98, 'Barbarendorp+%28501%7C502%29+K55+foi+atacada+por+Mugaru+%28001+%7C+TT%29', '../global_cdn/graphic/dots/red.png', 1416828621, 'attack', '0;0;1000;0;200;0;0;0;0;1', '0;0;0;0;0;0;0;0;0;0', '0;0;0;0;0;0;0;0;0;0', '0;0;0;0;0;0;0;0;0;0', '', '49;29', '0;0', '0;0;', '', 0, 1, 24, 22, 0, 1, 'defense', '-1', 100, 'att', '8667;8668;8665;26000;26000', 1, 0, '', '', ''),
(51, 'Barbarendorp+%28499%7C502%29+K54+foi+atacada+por+Mugaru+%28001+%7C+TT%29', '../global_cdn/graphic/dots/blue.png', 1416486042, 'attack', '0;0;0;118;0;0;0;0;0;0', '0;0;0;0;0;0;0;0;0;0', '0;0;0;0;0;0;0;0;0;0', '0;0;0;0;0;0;0;0;0;0', '', '100;100', '20;20', '0;0;', '', 0, 1, 25, 22, 0, 1, 'defense', '6', 100, 'att', '0;0;0;0;0', 1, 0, '', '', ''),
(99, 'Mugaru+%28001+%7C+TT%29+ataca+Barbarendorp+%28501%7C502%29+K55.', '../global_cdn/graphic/dots/green.png', 1416828623, 'attack', '0;0;1000;0;200;0;0;0;0;1', '0;0;0;0;0;0;0;0;0;0', '0;0;0;0;0;0;0;0;0;0', '0;0;0;0;0;0;0;0;0;0', '', '29;4', '0;0', '0;0;', '', 0, 1, 24, 22, 1, 0, 'attack', '7', 100, 'att', '8667;8669;8664;26000;26000', 1, 0, '', '', ''),
(53, 'Barbarendorp+%28499%7C502%29+K54+foi+conquistada+por+Mugaru+%28001+%7C+TT%29', '../global_cdn/graphic/dots/red.png', 1416486702, 'attack', '0;0;1000;0;0;0;0;0;0;1', '0;0;0;0;0;0;0;0;0;0', '0;0;0;0;0;0;0;0;0;0', '0;0;0;0;0;0;0;0;0;0', '0;0;0;0;0;0;0;0;0;0', '10;-21', '20;20', '0;0;', '', 0, 1, 25, 22, 0, 1, 'defense', '3', 100, 'att', '4093;4092;1815;10000;10000', 1, 0, '', '', ''),
(100, 'Barbarendorp+%28501%7C502%29+K55+foi+atacada+por+Mugaru+%28001+%7C+TT%29', '../global_cdn/graphic/dots/red.png', 1416828623, 'attack', '0;0;1000;0;200;0;0;0;0;1', '0;0;0;0;0;0;0;0;0;0', '0;0;0;0;0;0;0;0;0;0', '0;0;0;0;0;0;0;0;0;0', '', '29;4', '0;0', '0;0;', '', 0, 1, 24, 22, 0, 1, 'defense', '7', 100, 'att', '8667;8669;8664;26000;26000', 1, 0, '', '', ''),
(101, 'Mugaru+%28001+%7C+TT%29+conquista+Barbarendorp+%28501%7C502%29+K55.', '../global_cdn/graphic/dots/green.png', 1416833053, 'attack', '0;0;1000;0;200;0;0;0;0;1', '0;0;0;0;0;0;0;0;0;0', '0;0;0;0;0;0;0;0;0;0', '0;0;0;0;0;0;0;0;0;0', '0;0;0;0;0;0;0;0;0;0', '16;-8', '0;0', '0;0;', '', 0, 1, 24, 22, 1, 1, 'attack', '-10', 100, 'att', '8667;8667;8666;26000;26000', 1, 0, '', '', ''),
(60, 'Barbarendorp+%28501%7C502%29+K55+foi+atacada+por+Mugaru+%28001+%7C+TT%29', '../global_cdn/graphic/dots/red.png', 1416500244, 'attack', '0;0;1000;0;0;0;0;0;0;1', '0;0;0;0;0;0;0;0;0;0', '0;0;0;0;0;0;0;0;0;0', '0;0;0;0;0;0;0;0;0;0', '', '100;80', '20;20', '0;0;', '', 0, 1, 24, 22, 0, 1, 'defense', '-2', 100, 'att', '3334;3333;3333;10000;10000', 1, 0, '', '', ''),
(102, 'Barbarendorp+%28501%7C502%29+K55+foi+conquistada+por+Mugaru+%28001+%7C+TT%29', '../global_cdn/graphic/dots/red.png', 1416833053, 'attack', '0;0;1000;0;200;0;0;0;0;1', '0;0;0;0;0;0;0;0;0;0', '0;0;0;0;0;0;0;0;0;0', '0;0;0;0;0;0;0;0;0;0', '0;0;0;0;0;0;0;0;0;0', '16;-8', '0;0', '0;0;', '', 0, 1, 24, 22, 0, 1, 'defense', '-10', 100, 'att', '8667;8667;8666;26000;26000', 1, 0, '', '', ''),
(62, 'Barbarendorp+%28501%7C502%29+K55+foi+atacada+por+Mugaru+%28001+%7C+TT%29', '../global_cdn/graphic/dots/red.png', 1416500245, 'attack', '0;0;1000;0;0;0;0;0;0;1', '0;0;0;0;0;0;0;0;0;0', '0;0;0;0;0;0;0;0;0;0', '0;0;0;0;0;0;0;0;0;0', '', '80;59', '20;20', '0;0;', '', 0, 1, 24, 22, 0, 1, 'defense', '8', 100, 'att', '3334;3333;3333;10000;10000', 1, 0, '', '', ''),
(103, 'Seu+apoio+de+001+%7C+TT+em+Barbarendorp+%28501%7C502%29+K55+foi+atacado.', '../global_cdn/graphic/dots/red.png', 1416833072, 'supportAttack', '0;0;1000;0;200;0;0;0;0;0', '0;0;1000;0;200;0;0;0;0;0', '', '', NULL, '', '', '', '', 1, 1, 24, 22, 1, 0, 'defense', NULL, NULL, '', '', 1, 0, '', '', ''),
(104, 'Mugaru+%28001+%7C+TT%29+ataca+Barbarendorp+%28501%7C502%29+K55.', '../global_cdn/graphic/dots/yellow.png', 1416833071, 'attack', '0;0;1000;0;0;0;0;0;0;1', '0;0;127;0;0;0;0;0;0;0', '0;0;1000;0;200;0;0;0;0;0', '0;0;1000;0;200;0;0;0;0;0', '', '25;1', '0;0', '0;0;', '', 1, 1, 24, 22, 1, 1, 'attack', '19', 100, 'att', '2908;2914;2908;8730;8730', 1, 0, '', '', ''),
(65, 'Barbarendorp+%28501%7C502%29+K55+foi+atacada+por+Mugaru+%28002+%7C+TT%29', '../global_cdn/graphic/dots/red.png', 1416501432, 'attack', '0;1000;0;0;0;0;0;0;0;1', '0;0;0;0;0;0;0;0;0;0', '0;0;0;0;0;0;0;0;0;0', '0;0;0;0;0;0;0;0;0;0', '', '62;39', '20;20', '0;0;', '', 0, 1, 24, 23, 0, 1, 'defense', '10', 100, 'att', '5000;5000;5000;15000;15000', 1, 0, '', '', ''),
(105, 'Medalha+Cara+sem+sorte+Hout+-+Level+1', '', 1416833698, 'medal', '', '', '', '', NULL, '', '', '', 'bluck;1', 0, 0, 0, 0, 1, 1, 'other', NULL, NULL, '', '', 1, 0, '', '', ''),
(67, 'Barbarendorp+%28501%7C502%29+K55+foi+atacada+por+Mugaru+%28002+%7C+TT%29', '../global_cdn/graphic/dots/red.png', 1416501508, 'attack', '0;1000;0;0;0;0;0;0;0;1', '0;0;0;0;0;0;0;0;0;0', '0;0;0;0;0;0;0;0;0;0', '0;0;0;0;0;0;0;0;0;0', '', '39;10', '20;20', '0;0;', '', 0, 1, 24, 23, 0, 1, 'defense', '22', 100, 'att', '4985;5028;4987;15000;15000', 1, 0, '', '', ''),
(106, 'Medalha+A+riqueza+vem+em+ouro+Hout+-+Level+1', '', 1416841246, 'medal', '', '', '', '', NULL, '', '', '', 'gold;1', 0, 0, 0, 0, 1, 0, 'other', NULL, NULL, '', '', 1, 0, '', '', ''),
(70, 'Medalha+L%C3%ADder+em+pontos+Prata+-+N%C3%ADvel+3', '', 1416566789, 'medal', '', '', '', '', NULL, '', '', '', 'rank;3', 0, 0, 0, 0, 2, 1, 'other', NULL, NULL, '', '', 1, 0, '', '', ''),
(107, 'Mugaru+%28001+%7C+TT%29+ataca+Bonusdorp+%28492%7C501%29+K54.', '../global_cdn/graphic/dots/green.png', 1416846107, 'attack', '0;0;300;0;100;0;0;0;0;1', '0;0;0;0;0;0;0;0;0;0', '0;0;0;0;0;0;0;0;0;0', '0;0;0;0;0;0;0;0;0;0', '', '100;77', '3;3', '0;0;', '', 0, 1, 321, 22, 1, 1, 'attack', '25', 100, 'att', '2632;2632;2632;7896;11000', 1, 0, '', '', ''),
(72, '001+%7C+TT+forneceu+Ukiraki.', '', 1416567223, 'sendRess', '', '', '', '', NULL, '', '', '', '', 2, 1, 226, 22, 2, 1, 'trade', NULL, NULL, '', '5000;5000;5000', 1, 0, '', '', ''),
(74, '001+%7C+TT+forneceu+Ukiraki.', '', 1416567234, 'sendRess', '', '', '', '', NULL, '', '', '', '', 2, 1, 226, 22, 2, 0, 'trade', NULL, NULL, '', '5000;5000;5000', 1, 0, '', '', ''),
(75, 'Mugaru+lhe+convidou+para+%C3%A0+tribo+%27Test%27.', '', 1416567371, 'ally_invite', '', '', '', '', NULL, '', '', '', '', 2, 1, 0, 0, 2, 0, 'other', NULL, NULL, '', '', 1, 1, 'Test', '', ''),
(108, 'Bonusdorp+%28492%7C501%29+K54+foi+atacada+por+Mugaru+%28001+%7C+TT%29', '../global_cdn/graphic/dots/red.png', 1416846107, 'attack', '0;0;300;0;100;0;0;0;0;1', '0;0;0;0;0;0;0;0;0;0', '0;0;0;0;0;0;0;0;0;0', '0;0;0;0;0;0;0;0;0;0', '', '100;77', '3;3', '0;0;', '', 0, 1, 321, 22, 0, 1, 'defense', '25', 100, 'att', '2632;2632;2632;7896;11000', 1, 0, '', '', ''),
(109, 'Mugaru+%28001+%7C+TT%29+ataca+Bonusdorp+%28492%7C501%29+K54.', '../global_cdn/graphic/dots/green.png', 1416846108, 'attack', '0;0;300;0;100;0;0;0;0;1', '0;0;0;0;0;0;0;0;0;0', '0;0;0;0;0;0;0;0;0;0', '0;0;0;0;0;0;0;0;0;0', '', '77;53', '3;3', '0;0;', '', 0, 1, 321, 22, 1, 1, 'attack', '-22', 100, 'att', '1;1;2;4;11000', 1, 0, '', '', ''),
(110, 'Bonusdorp+%28492%7C501%29+K54+foi+atacada+por+Mugaru+%28001+%7C+TT%29', '../global_cdn/graphic/dots/red.png', 1416846108, 'attack', '0;0;300;0;100;0;0;0;0;1', '0;0;0;0;0;0;0;0;0;0', '0;0;0;0;0;0;0;0;0;0', '0;0;0;0;0;0;0;0;0;0', '', '77;53', '3;3', '0;0;', '', 0, 1, 321, 22, 0, 1, 'defense', '-22', 100, 'att', '1;1;2;4;11000', 1, 0, '', '', ''),
(111, 'Mugaru+%28001+%7C+TT%29+ataca+Bonusdorp+%28492%7C501%29+K54.', '../global_cdn/graphic/dots/green.png', 1416846110, 'attack', '0;0;300;0;100;0;0;0;0;1', '0;0;0;0;0;0;0;0;0;0', '0;0;0;0;0;0;0;0;0;0', '0;0;0;0;0;0;0;0;0;0', '', '53;26', '3;3', '0;0;', '', 0, 1, 321, 22, 1, 1, 'attack', '17', 100, 'att', '4;3;6;13;11000', 1, 0, '', '', ''),
(112, 'Bonusdorp+%28492%7C501%29+K54+foi+atacada+por+Mugaru+%28001+%7C+TT%29', '../global_cdn/graphic/dots/red.png', 1416846110, 'attack', '0;0;300;0;100;0;0;0;0;1', '0;0;0;0;0;0;0;0;0;0', '0;0;0;0;0;0;0;0;0;0', '0;0;0;0;0;0;0;0;0;0', '', '53;26', '3;3', '0;0;', '', 0, 1, 321, 22, 0, 1, 'defense', '17', 100, 'att', '4;3;6;13;11000', 1, 0, '', '', ''),
(113, 'Mugaru+%28001+%7C+TT%29+conquista+Bonusdorp+%28492%7C501%29+K54.', '../global_cdn/graphic/dots/green.png', 1416846177, 'attack', '0;0;100;0;100;0;0;0;0;1', '0;0;0;0;0;0;0;0;0;0', '0;0;0;0;0;0;0;0;0;0', '0;0;0;0;0;0;0;0;0;0', '0;0;0;0;0;0;0;0;0;0', '26;-9', '3;3', '0;0;', '', 0, 1, 321, 22, 1, 0, 'attack', '17', 100, 'att', '119;102;186;407;9000', 1, 0, '', '', ''),
(114, 'Bonusdorp+%28492%7C501%29+K54+foi+conquistada+por+Mugaru+%28001+%7C+TT%29', '../global_cdn/graphic/dots/red.png', 1416846177, 'attack', '0;0;100;0;100;0;0;0;0;1', '0;0;0;0;0;0;0;0;0;0', '0;0;0;0;0;0;0;0;0;0', '0;0;0;0;0;0;0;0;0;0', '0;0;0;0;0;0;0;0;0;0', '26;-9', '3;3', '0;0;', '', 0, 1, 321, 22, 0, 1, 'defense', '17', 100, 'att', '119;102;186;407;9000', 1, 0, '', '', ''),
(115, 'Medalha+Conquista+Hout+-+Level+1', '', 1416847476, 'medal', '', '', '', '', NULL, '', '', '', 'conquer;1', 0, 0, 0, 0, 1, 1, 'other', NULL, NULL, '', '', 1, 0, '', '', '');

-- --------------------------------------------------------

--
-- Table structure for  `research`
--

CREATE TABLE IF NOT EXISTS `research` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `research` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `villageid` int(11) unsigned NOT NULL,
  `end_time` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `villageid` (`villageid`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=14 ;

-- --------------------------------------------------------

--
-- Table structure for  `run_events`
--

CREATE TABLE IF NOT EXISTS `run_events` (
  `id` int(11) unsigned NOT NULL,
  UNIQUE KEY `id` (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for  `save_players`
--

CREATE TABLE IF NOT EXISTS `save_players` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `round_id` int(11) unsigned NOT NULL DEFAULT '0',
  `username` varchar(200) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `rank` int(11) unsigned NOT NULL DEFAULT '0',
  `ally` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `points` int(11) unsigned NOT NULL DEFAULT '0',
  `villages` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for  `save_rounds`
--

CREATE TABLE IF NOT EXISTS `save_rounds` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `start` varchar(80) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `end` varchar(80) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `description` text COLLATE utf8_unicode_ci NOT NULL,
  `speed_units` varchar(10) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `moral` int(1) unsigned NOT NULL DEFAULT '0',
  `speed` int(11) unsigned NOT NULL DEFAULT '0',
  `name` varchar(200) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `map` int(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for  `sessions`
--

CREATE TABLE IF NOT EXISTS `sessions` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `userid` int(11) unsigned NOT NULL,
  `sid` varchar(5000) COLLATE utf8_unicode_ci NOT NULL,
  `hkey` varchar(5000) COLLATE utf8_unicode_ci NOT NULL,
  `is_vacation` int(1) unsigned NOT NULL DEFAULT '0',
  `username` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sid` (`sid`(333)),
  KEY `userid` (`userid`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=18 ;

--
-- Populate data for table `sessions`
--

INSERT INTO `sessions` (`id`, `userid`, `sid`, `hkey`, `is_vacation`, `username`) VALUES
(17, 1, 'aSjb8PMkPT1OmBA6LwBEDStyvVkJbeQc', 'W0dV', 0, 'Mugaru');

-- --------------------------------------------------------

--
-- Table structure for  `share`
--

CREATE TABLE IF NOT EXISTS `share` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_from` int(20) NOT NULL,
  `id_to` int(20) NOT NULL,
  `time` int(11) NOT NULL,
  `username_to` varchar(320) COLLATE utf8_unicode_ci NOT NULL,
  `delete_time` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=10 ;

-- --------------------------------------------------------

--
-- Table structure for  `unit_place`
--

CREATE TABLE IF NOT EXISTS `unit_place` (
  `unit_spear` int(11) DEFAULT '0',
  `unit_sword` int(11) DEFAULT '0',
  `unit_archer` int(11) DEFAULT '0',
  `unit_axe` int(11) DEFAULT '0',
  `unit_spy` int(11) DEFAULT '0',
  `unit_light` int(11) DEFAULT '0',
  `unit_marcher` int(11) DEFAULT '0',
  `unit_heavy` int(11) DEFAULT '0',
  `unit_ram` int(11) DEFAULT '0',
  `unit_catapult` int(11) DEFAULT '0',
  `unit_knight` int(5) DEFAULT '0',
  `unit_snob` int(5) DEFAULT '0',
  `villages_from_id` int(11) NOT NULL DEFAULT '0',
  `villages_to_id` int(11) NOT NULL DEFAULT '0',
  KEY `villages_from_id` (`villages_from_id`),
  KEY `villages_to_id` (`villages_to_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Populate data for table `unit_place`
--

INSERT INTO `unit_place` (`unit_spear`, `unit_sword`, `unit_archer`, `unit_axe`, `unit_spy`, `unit_light`, `unit_marcher`, `unit_heavy`, `unit_ram`, `unit_catapult`, `unit_knight`, `unit_snob`, `villages_from_id`, `villages_to_id`) VALUES
(0, 0, 0, 6497, 1118, 1371, 0, 0, 1213, 0, 0, 3, 22, 22),
(3096, 3923, 0, 0, 0, 0, 0, 3, 0, 0, 0, 4, 23, 23),
(500, 500, 0, 0, 500, 0, 0, 100, 0, 20, 0, 0, 24, 24),
(969, 0, 0, 2208, 0, 0, 0, 0, 1976, 0, 0, 0, 25, 25),
(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 26, 26),
(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 27, 27),
(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 28, 28),
(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 29, 29),
(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 30, 30),
(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 31, 31),
(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 32, 32),
(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 33, 33),
(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 34, 34),
(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 35, 35),
(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 36, 36),
(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 37, 37),
(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 38, 38),
(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 39, 39),
(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 40, 40),
(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 41, 41),
(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 42, 42),
(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 43, 43),
(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 44, 44),
(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 45, 45),
(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 46, 46),
(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 47, 47),
(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 48, 48),
(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 49, 49),
(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 50, 50),
(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 51, 51),
(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 52, 52),
(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 53, 53),
(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 54, 54),
(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 55, 55),
(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 56, 56),
(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 57, 57),
(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 58, 58),
(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 59, 59),
(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 60, 60),
(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 61, 61),
(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 62, 62),
(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 63, 63),
(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 64, 64),
(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 65, 65),
(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 66, 66),
(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 67, 67),
(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 68, 68),
(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 69, 69),
(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 70, 70),
(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 71, 71),
(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 72, 72),
(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 73, 73),
(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 74, 74),
(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 75, 75),
(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 76, 76),
(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 77, 77),
(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 78, 78),
(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 79, 79),
(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 80, 80),
(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 81, 81),
(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 82, 82),
(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 83, 83),
(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 84, 84),
(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 85, 85),
(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 86, 86),
(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 87, 87),
(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 88, 88),
(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 89, 89),
(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 90, 90),
(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 91, 91),
(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 92, 92),
(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 93, 93),
(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 94, 94),
(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 95, 95),
(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 96, 96),
(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 97, 97),
(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 98, 98),
(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 99, 99),
(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 100),
(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 101, 101),
(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 102, 102),
(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 103, 103),
(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 104, 104),
(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 105, 105),
(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 106, 106),
(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 107, 107),
(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 108, 108),
(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 109, 109),
(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 110, 110),
(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 111, 111),
(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 112, 112),
(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 113, 113),
(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 114, 114),
(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 115, 115),
(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 116, 116),
(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 117, 117),
(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 118, 118),
(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 119, 119),
(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 120, 120),
(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 121, 121),
(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 122, 122),
(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 123, 123),
(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 124, 124),
(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 125, 125),
(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 126, 126),
(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 127, 127),
(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 128, 128),
(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 129, 129),
(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 130, 130),
(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 131, 131),
(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 132, 132),
(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 133, 133),
(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 134, 134),
(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 135, 135),
(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 136, 136),
(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 137, 137),
(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 138, 138),
(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 139, 139),
(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 140, 140),
(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 141, 141),
(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 142, 142),
(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 143, 143),
(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 144, 144),
(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 145, 145),
(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 146, 146),
(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 147, 147),
(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 148, 148),
(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 149, 149),
(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 150, 150),
(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 151, 151),
(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 152, 152),
(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 153, 153),
(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 154, 154),
(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 155, 155),
(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 156, 156),
(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 157, 157),
(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 158, 158),
(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 159, 159),
(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 160, 160),
(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 161, 161),
(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 162, 162),
(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 163, 163),
(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 164, 164),
(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 165, 165),
(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 166, 166),
(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 167, 167),
(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 168, 168),
(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 169, 169),
(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 170, 170),
(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 171, 171),
(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 172, 172),
(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 173, 173),
(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 174, 174),
(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 175, 175),
(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 176, 176),
(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 177, 177),
(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 178, 178),
(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 179, 179),
(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 180, 180),
(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 181, 181),
(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 182, 182),
(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 183, 183),
(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 184, 184),
(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 185, 185),
(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 186, 186),
(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 187, 187),
(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 188, 188),
(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 189, 189),
(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 190, 190),
(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 191, 191),
(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 192, 192),
(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 193, 193),
(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 194, 194),
(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 195, 195),
(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 196, 196),
(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 197, 197),
(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 198, 198),
(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 199, 199),
(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 200, 200),
(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 201, 201),
(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 202, 202),
(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 203, 203),
(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 204, 204),
(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 205, 205),
(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 206, 206),
(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 207, 207),
(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 208, 208),
(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 209, 209),
(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 210, 210),
(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 211, 211),
(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 212, 212),
(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 213, 213),
(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 214, 214),
(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 215, 215),
(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 216, 216),
(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 217, 217),
(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 218, 218),
(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 219, 219),
(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 220, 220),
(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 221, 221),
(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 222, 222),
(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 223, 223),
(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 224, 224),
(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 225, 225),
(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 227, 227),
(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 226, 226),
(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 228, 228),
(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 229, 229),
(0, 0, 0, 100, 0, 100, 0, 0, 0, 0, 0, 0, 22, 321),
(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 230, 230),
(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 231, 231),
(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 232, 232),
(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 233, 233),
(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 234, 234),
(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 235, 235),
(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 236, 236),
(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 237, 237),
(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 238, 238),
(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 239, 239),
(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 240, 240),
(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 241, 241),
(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 242, 242),
(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 243, 243),
(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 244, 244),
(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 245, 245),
(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 246, 246),
(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 247, 247),
(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 248, 248),
(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 249, 249),
(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 250, 250),
(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 251, 251),
(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 252, 252),
(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 253, 253),
(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 254, 254),
(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 255, 255),
(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 256, 256),
(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 257, 257),
(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 258, 258),
(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 259, 259),
(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 260, 260),
(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 261, 261),
(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 262, 262),
(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 263, 263),
(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 264, 264),
(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 265, 265),
(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 266, 266),
(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 267, 267),
(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 268, 268),
(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 269, 269),
(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 270, 270),
(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 271, 271),
(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 272, 272),
(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 273, 273),
(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 274, 274),
(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 275, 275),
(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 276, 276),
(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 277, 277),
(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 278, 278),
(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 279, 279),
(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 280, 280),
(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 281, 281),
(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 282, 282),
(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 283, 283),
(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 284, 284),
(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 285, 285),
(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 286, 286),
(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 287, 287),
(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 288, 288),
(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 289, 289),
(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 290, 290),
(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 291, 291),
(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 292, 292),
(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 293, 293),
(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 294, 294),
(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 295, 295),
(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 296, 296),
(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 297, 297),
(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 298, 298),
(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 299, 299),
(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 300, 300),
(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 301, 301),
(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 302, 302),
(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 303, 303),
(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 304, 304),
(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 305, 305),
(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 306, 306),
(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 307, 307),
(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 308, 308),
(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 309, 309),
(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 310, 310),
(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 311, 311),
(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 312, 312),
(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 313, 313),
(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 314, 314),
(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 315, 315),
(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 316, 316),
(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 317, 317),
(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 318, 318),
(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 319, 319),
(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 320, 320),
(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 321, 321),
(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 322, 322),
(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 323, 323),
(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 324, 324),
(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 325, 325),
(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 326, 326),
(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 327, 327),
(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 328, 328),
(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 329, 329),
(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 330, 330),
(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 331, 331),
(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 332, 332),
(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 333, 333),
(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 334, 334),
(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 335, 335),
(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 336, 336),
(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 337, 337),
(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 338, 338),
(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 339, 339),
(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 340, 340),
(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 341, 341),
(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 342, 342),
(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 343, 343),
(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 344, 344),
(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 345, 345),
(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 346, 346),
(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 347, 347),
(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 348, 348),
(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 349, 349),
(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 350, 350),
(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 351, 351),
(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 352, 352),
(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 353, 353),
(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 354, 354),
(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 355, 355),
(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 356, 356),
(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 357, 357),
(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 358, 358),
(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 359, 359),
(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 360, 360),
(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 361, 361),
(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 362, 362),
(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 363, 363),
(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 364, 364),
(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 365, 365),
(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 366, 366),
(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 367, 367),
(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 368, 368),
(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 369, 369),
(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 370, 370),
(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 371, 371),
(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 372, 372),
(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 373, 373),
(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 374, 374),
(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 375, 375),
(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 376, 376),
(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 377, 377),
(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 378, 378),
(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 379, 379),
(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 380, 380),
(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 381, 381),
(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 382, 382),
(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 383, 383),
(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 384, 384),
(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 385, 385),
(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 386, 386),
(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 387, 387),
(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 388, 388),
(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 389, 389),
(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 390, 390),
(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 391, 391),
(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 392, 392),
(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 393, 393),
(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 394, 394),
(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 395, 395),
(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 396, 396),
(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 397, 397),
(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 398, 398),
(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 399, 399),
(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 400, 400),
(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 401, 401),
(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 402, 402),
(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 403, 403),
(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 404, 404),
(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 405, 405),
(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 406, 406),
(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 407, 407),
(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 408, 408),
(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 409, 409),
(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 410, 410),
(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 411, 411),
(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 412, 412),
(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 413, 413),
(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 414, 414),
(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 415, 415),
(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 416, 416),
(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 417, 417),
(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 418, 418),
(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 419, 419),
(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 420, 420),
(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 421, 421),
(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 422, 422),
(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 423, 423),
(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 424, 424),
(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 425, 425),
(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 426, 426),
(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 427, 427),
(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 428, 428),
(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 429, 429),
(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 430, 430),
(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 431, 431),
(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 432, 432),
(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 433, 433),
(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 434, 434),
(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 435, 435),
(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 436, 436),
(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 437, 437),
(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 438, 438),
(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 439, 439),
(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 440, 440),
(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 441, 441),
(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 442, 442),
(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 443, 443),
(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 444, 444),
(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 445, 445),
(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 446, 446),
(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 447, 447),
(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 448, 448),
(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 449, 449),
(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 450, 450),
(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 451, 451),
(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 452, 452),
(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 453, 453),
(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 454, 454),
(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 455, 455),
(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 456, 456),
(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 457, 457),
(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 458, 458),
(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 459, 459),
(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 460, 460),
(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 461, 461),
(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 462, 462),
(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 463, 463),
(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 464, 464),
(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 465, 465),
(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 466, 466),
(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 467, 467),
(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 468, 468),
(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 469, 469),
(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 470, 470),
(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 471, 471),
(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 472, 472),
(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 473, 473),
(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 474, 474),
(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 475, 475),
(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 476, 476),
(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 477, 477),
(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 478, 478),
(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 479, 479),
(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 480, 480),
(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 481, 481),
(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 482, 482),
(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 483, 483),
(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 484, 484),
(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 485, 485),
(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 486, 486),
(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 487, 487),
(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 488, 488),
(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 489, 489),
(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 490, 490),
(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 491, 491),
(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 492, 492),
(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 493, 493);

-- --------------------------------------------------------

--
-- Table structure for  `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(150) COLLATE utf8_unicode_ci DEFAULT NULL,
  `password` varchar(32) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `banned` enum('Y','N') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `villages` int(10) NOT NULL,
  `points` int(20) unsigned NOT NULL,
  `ennobled_by` varchar(90) COLLATE utf8_unicode_ci NOT NULL,
  `ally` int(11) NOT NULL DEFAULT '-1',
  `ally_titel` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `ally_found` int(1) unsigned NOT NULL DEFAULT '0',
  `ally_lead` int(1) unsigned NOT NULL DEFAULT '0',
  `ally_invite` int(1) unsigned NOT NULL DEFAULT '0',
  `ally_diplomacy` int(1) unsigned NOT NULL DEFAULT '0',
  `ally_mass_mail` int(1) unsigned NOT NULL DEFAULT '0',
  `rang` int(11) unsigned NOT NULL,
  `villages_mode` varchar(25) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'prod',
  `attacks` int(5) unsigned DEFAULT '0',
  `new_report` int(1) unsigned NOT NULL DEFAULT '0',
  `new_mail` int(1) unsigned DEFAULT '0',
  `market_sell` varchar(10) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'all',
  `market_buy` varchar(10) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'all',
  `market_ratio_max` varchar(5) COLLATE utf8_unicode_ci NOT NULL DEFAULT '3',
  `killed_units_att` int(25) unsigned NOT NULL,
  `killed_units_att_rank` int(11) unsigned NOT NULL,
  `killed_units_def` int(25) unsigned NOT NULL,
  `killed_units_def_rank` int(25) unsigned NOT NULL,
  `killed_units_altogether` int(25) unsigned NOT NULL,
  `killed_units_altogether_rank` int(11) unsigned NOT NULL,
  `do_action` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `last_activity` int(11) unsigned NOT NULL,
  `birthday` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `vacation_id` int(11) NOT NULL DEFAULT '-1',
  `vacation_name` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `vacation_accept` int(1) unsigned NOT NULL DEFAULT '0',
  `b_day` int(2) unsigned NOT NULL,
  `b_month` int(2) unsigned NOT NULL,
  `b_year` int(4) unsigned NOT NULL,
  `sex` enum('f','m','x') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'x',
  `home` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `image` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `personal_text` text COLLATE utf8_unicode_ci NOT NULL,
  `window_width` int(4) unsigned NOT NULL DEFAULT '840',
  `show_toolbar` int(1) unsigned NOT NULL DEFAULT '1',
  `dyn_menu` int(1) unsigned NOT NULL DEFAULT '1',
  `confirm_queue` int(1) unsigned NOT NULL DEFAULT '1',
  `map_size` int(2) unsigned NOT NULL DEFAULT '9',
  `minimap_size` enum('s','m','b') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'm',
  `memo` text COLLATE utf8_unicode_ci NOT NULL,
  `map_reload` text COLLATE utf8_unicode_ci NOT NULL,
  `graphical_overview` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `overview` varchar(5) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'new',
  `labels` varchar(5) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'yes',
  `coins` int(11) unsigned NOT NULL DEFAULT '0',
  `snobs` int(11) unsigned NOT NULL DEFAULT '0',
  `coinsNext` int(11) unsigned NOT NULL DEFAULT '1',
  `protection` int(11) NOT NULL DEFAULT '0',
  `group` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `css` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'stamm.css',
  `image_base` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'graphic',
  `gfx_old` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `knightname` varchar(150) COLLATE utf8_unicode_ci DEFAULT 'Paladin',
  `data_inregistrare` varchar(1111) COLLATE utf8_unicode_ci NOT NULL,
  `ip_inregistrare` varchar(1111) COLLATE utf8_unicode_ci NOT NULL,
  `medc` enum('0','1') COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `premium_active` int(11) NOT NULL,
  `premium_active_until` int(11) NOT NULL,
  `premium_activated_at` int(11) NOT NULL,
  `join_actions` enum('n','y') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'n',
  PRIMARY KEY (`id`),
  KEY `username` (`username`),
  KEY `rang` (`rang`),
  KEY `vacation_id` (`vacation_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=11419 ;

--
-- Populate data for table `users`
--

INSERT INTO `users` (`id`, `username`, `password`, `banned`, `villages`, `points`, `ennobled_by`, `ally`, `ally_titel`, `ally_found`, `ally_lead`, `ally_invite`, `ally_diplomacy`, `ally_mass_mail`, `rang`, `villages_mode`, `attacks`, `new_report`, `new_mail`, `market_sell`, `market_buy`, `market_ratio_max`, `killed_units_att`, `killed_units_att_rank`, `killed_units_def`, `killed_units_def_rank`, `killed_units_altogether`, `killed_units_altogether_rank`, `do_action`, `last_activity`, `birthday`, `vacation_id`, `vacation_name`, `vacation_accept`, `b_day`, `b_month`, `b_year`, `sex`, `home`, `image`, `personal_text`, `window_width`, `show_toolbar`, `dyn_menu`, `confirm_queue`, `map_size`, `minimap_size`, `memo`, `map_reload`, `graphical_overview`, `overview`, `labels`, `coins`, `snobs`, `coinsNext`, `protection`, `group`, `css`, `image_base`, `gfx_old`, `knightname`, `data_inregistrare`, `ip_inregistrare`, `medc`, `premium_active`, `premium_active_until`, `premium_activated_at`, `join_actions`) VALUES
(1, 'Mugaru', '', 'N', 5, 43092, 'Mugaru', 1, '', 1, 1, 1, 1, 1, 1, 'combined', 0, 0, 0, 'all', 'all', '3', 2800, 1, 440, 1, 3240, 1, '1416931969', 1416933105, '', -1, '', 0, 0, 0, 0, 'x', '', '', 'w123', 840, 1, 1, 1, 9, 'm', '', '', 1, 'new', 'yes', 66, 5, 12, 0, '', 'stamm.css', 'graphic', 0, 'Paladin', '', '', '1', 0, 0, 0, 'y'),
(2, 'Ukiraki', '', 'N', 1, 100, '', 1, '', 0, 0, 0, 0, 0, 2, 'prod', 0, 0, 0, 'all', 'all', '3', 0, 2, 0, 2, 0, 2, '1416570051', 1416570051, '', -1, '', 0, 0, 0, 0, 'x', '', '', '', 840, 1, 1, 1, 9, 'm', '', '', 1, 'new', 'yes', 0, 0, 1, 0, '', 'stamm.css', 'graphic', 0, 'Paladin', '', '', '1', 0, 0, 0, 'y');

-- --------------------------------------------------------

--
-- Table structure for  `villages`
--

CREATE TABLE IF NOT EXISTS `villages` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `x` int(11) unsigned NOT NULL,
  `y` int(11) unsigned NOT NULL,
  `bonus` int(11) NOT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `userid` int(11) NOT NULL,
  `r_wood` double unsigned DEFAULT '500',
  `r_stone` double unsigned DEFAULT '500',
  `r_iron` double unsigned DEFAULT '400',
  `r_bh` int(15) unsigned NOT NULL DEFAULT '0',
  `last_prod_aktu` int(11) unsigned NOT NULL,
  `points` int(11) unsigned NOT NULL,
  `continent` int(6) unsigned NOT NULL,
  `main` int(5) unsigned DEFAULT '1',
  `barracks` int(5) unsigned DEFAULT '0',
  `stable` int(5) unsigned DEFAULT '0',
  `garage` int(5) unsigned DEFAULT '0',
  `snob` int(5) unsigned DEFAULT '0',
  `smith` int(5) unsigned DEFAULT '0',
  `place` int(5) unsigned DEFAULT '1',
  `statue` int(5) unsigned DEFAULT '0',
  `market` int(5) unsigned DEFAULT '0',
  `wood` int(5) unsigned DEFAULT '0',
  `stone` int(5) unsigned DEFAULT '0',
  `iron` int(5) unsigned DEFAULT '0',
  `storage` int(5) unsigned DEFAULT '1',
  `farm` int(5) unsigned DEFAULT '1',
  `hide` int(5) unsigned DEFAULT '1',
  `wall` int(5) unsigned DEFAULT '0',
  `unit_spear_tec_level` int(11) unsigned DEFAULT '1',
  `unit_sword_tec_level` int(11) unsigned DEFAULT '0',
  `unit_axe_tec_level` int(11) unsigned DEFAULT '0',
  `unit_archer_tec_level` int(11) unsigned DEFAULT '1',
  `unit_spy_tec_level` int(11) unsigned DEFAULT '1',
  `unit_light_tec_level` int(11) unsigned DEFAULT '0',
  `unit_marcher_tec_level` int(11) unsigned DEFAULT '0',
  `unit_heavy_tec_level` int(11) unsigned DEFAULT '0',
  `unit_ram_tec_level` int(11) unsigned DEFAULT '0',
  `unit_catapult_tec_level` int(11) unsigned DEFAULT '0',
  `unit_knight_tec_level` int(11) unsigned DEFAULT '1',
  `unit_snob_tec_level` int(11) unsigned DEFAULT '1',
  `trader_away` int(5) unsigned DEFAULT '0',
  `main_build` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `all_unit_spear` int(6) unsigned NOT NULL DEFAULT '0',
  `all_unit_sword` int(6) unsigned DEFAULT '0',
  `all_unit_axe` int(6) unsigned DEFAULT '0',
  `all_unit_archer` int(6) unsigned DEFAULT '0',
  `all_unit_spy` int(6) unsigned DEFAULT '0',
  `all_unit_light` int(6) unsigned DEFAULT '0',
  `all_unit_marcher` int(6) unsigned DEFAULT '0',
  `all_unit_heavy` int(6) unsigned DEFAULT '0',
  `all_unit_ram` int(6) unsigned DEFAULT '0',
  `all_unit_catapult` int(6) unsigned DEFAULT '0',
  `all_unit_knight` int(6) unsigned DEFAULT '0',
  `all_unit_snob` int(6) unsigned DEFAULT '0',
  `recruited_snobs` int(5) unsigned DEFAULT '0',
  `control_villages` int(5) unsigned DEFAULT '0',
  `attacks` int(5) unsigned DEFAULT '0',
  `agreement` varchar(200) COLLATE utf8_unicode_ci DEFAULT '100',
  `agreement_aktu` int(35) unsigned NOT NULL,
  `snobed_by` int(11) DEFAULT '-1',
  `dealers_outside` int(6) unsigned NOT NULL DEFAULT '0',
  `create_time` int(11) unsigned NOT NULL,
  `smith_tec` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `conmap_con` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `group` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `l_grow` int(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `x_2` (`x`,`y`),
  KEY `name` (`name`),
  KEY `userid` (`userid`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=494 ;

--
-- Populate data for table `villages`
--

INSERT INTO `villages` (`id`, `x`, `y`, `bonus`, `name`, `userid`, `r_wood`, `r_stone`, `r_iron`, `r_bh`, `last_prod_aktu`, `points`, `continent`, `main`, `barracks`, `stable`, `garage`, `snob`, `smith`, `place`, `statue`, `market`, `wood`, `stone`, `iron`, `storage`, `farm`, `hide`, `wall`, `unit_spear_tec_level`, `unit_sword_tec_level`, `unit_axe_tec_level`, `unit_archer_tec_level`, `unit_spy_tec_level`, `unit_light_tec_level`, `unit_marcher_tec_level`, `unit_heavy_tec_level`, `unit_ram_tec_level`, `unit_catapult_tec_level`, `unit_knight_tec_level`, `unit_snob_tec_level`, `trader_away`, `main_build`, `all_unit_spear`, `all_unit_sword`, `all_unit_axe`, `all_unit_archer`, `all_unit_spy`, `all_unit_light`, `all_unit_marcher`, `all_unit_heavy`, `all_unit_ram`, `all_unit_catapult`, `all_unit_knight`, `all_unit_snob`, `recruited_snobs`, `control_villages`, `attacks`, `agreement`, `agreement_aktu`, `snobed_by`, `dealers_outside`, `create_time`, `smith_tec`, `conmap_con`, `group`, `l_grow`) VALUES
(22, 500, 501, 2, '001+%7C+TT', 1, 400000, 400000, 400000, 24390, 1416933105, 10372, 55, 21, 25, 20, 15, 3, 20, 1, 1, 21, 30, 30, 30, 30, 30, 10, 20, 1, 0, 1, 1, 1, 1, 0, 0, 1, 0, 1, 1, 0, '', 0, 0, 7284, 0, 1118, 1471, 0, 0, 1213, 0, 0, 3, 3, 4, 0, '100', 0, -1, 0, 1416476927, '', '', '', 0),
(23, 500, 499, 0, '002+%7C+TT', 1, 400000, 400000, 400000, 11473, 1416908222, 10720, 45, 20, 25, 20, 15, 3, 20, 1, 1, 25, 30, 30, 30, 30, 30, 10, 20, 1, 1, 0, 1, 1, 0, 0, 1, 0, 0, 1, 1, 0, '', 3096, 3923, 0, 0, 0, 0, 0, 3, 0, 0, 0, 4, 4, 0, 0, '100', 1416559587, 22, 0, 1416476927, '', '', '', 1416478614),
(24, 501, 502, 0, '004+%7C+TT', 1, 10388.972222213, 10388.972222213, 144860.94444442, 6243, 1416908215, 9179, 55, 30, 25, 20, 15, 1, 20, 1, 1, 25, 24, 29, 22, 28, 23, 10, 20, 1, 1, 0, 1, 1, 0, 0, 1, 0, 1, 1, 1, 0, '', 500, 500, 0, 0, 500, 0, 0, 100, 0, 20, 0, 0, 0, 0, 0, '24.441666666666', 1416841493, 22, 0, 1416476927, '', '', '', 1416478629),
(25, 499, 502, 0, '003+%7C+TT', 1, 179460.66666667, 179460.66666667, 314269.66666667, 17469, 1416908221, 12379, 54, 30, 25, 20, 15, 3, 20, 1, 1, 25, 30, 30, 30, 30, 30, 10, 20, 1, 0, 1, 1, 1, 0, 0, 0, 1, 0, 1, 1, 0, '', 969, 0, 2208, 0, 0, 0, 0, 0, 1976, 0, 0, 0, 0, 0, 0, '100', 1416569771, 22, 0, 1416476927, '', '', '', 1416478641),
(492, 519, 510, 0, 'Barbarendorp', -1, 500, 500, 400, 222, 1416839816, 401, 55, 9, 2, 6, 5, 0, 7, 1, 0, 10, 4, 5, 10, 8, 9, 7, 6, 1, 0, 0, 1, 1, 0, 0, 0, 0, 0, 1, 1, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '100', 0, -1, 0, 1416839816, '', '', '', 1416839906),
(493, 480, 502, 0, 'Barbarendorp', -1, 500, 500, 400, 202, 1416839816, 401, 54, 6, 8, 8, 2, 0, 9, 1, 0, 4, 3, 4, 9, 8, 11, 6, 2, 1, 0, 0, 1, 1, 0, 0, 0, 0, 0, 1, 1, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '100', 0, -1, 0, 1416839816, '', '', '', 1416839903),
(491, 481, 499, 0, 'Barbarendorp', -1, 500, 500, 400, 217, 1416839815, 402, 44, 9, 6, 4, 7, 0, 10, 1, 0, 4, 3, 7, 4, 8, 5, 6, 5, 1, 0, 0, 1, 1, 0, 0, 0, 0, 0, 1, 1, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '100', 0, -1, 0, 1416839815, '', '', '', 1416839895),
(490, 507, 481, 0, 'Barbarendorp', -1, 500, 500, 400, 163, 1416839815, 408, 45, 5, 8, 6, 10, 0, 5, 1, 0, 6, 5, 3, 9, 2, 6, 6, 4, 1, 0, 0, 1, 1, 0, 0, 0, 0, 0, 1, 1, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '100', 0, -1, 0, 1416839815, '', '', '', 1416839891),
(489, 481, 505, 0, 'Barbarendorp', -1, 500, 500, 400, 146, 1416839815, 401, 54, 7, 7, 10, 4, 0, 4, 1, 0, 6, 7, 6, 3, 7, 7, 10, 6, 1, 0, 0, 1, 1, 0, 0, 0, 0, 0, 1, 1, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '100', 0, -1, 0, 1416839815, '', '', '', 1416839909),
(488, 517, 512, 0, 'Barbarendorp', -1, 500, 500, 400, 185, 1416839815, 402, 55, 2, 8, 6, 4, 0, 6, 1, 0, 7, 4, 8, 6, 8, 8, 9, 12, 1, 0, 0, 1, 1, 0, 0, 0, 0, 0, 1, 1, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '100', 0, -1, 0, 1416839815, '', '', '', 1416839907),
(487, 481, 495, 0, 'Barbarendorp', -1, 500, 500, 400, 158, 1416839815, 405, 44, 10, 6, 7, 8, 0, 5, 1, 0, 5, 4, 7, 6, 7, 5, 6, 7, 1, 0, 0, 1, 1, 0, 0, 0, 0, 0, 1, 1, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '100', 0, -1, 0, 1416839815, '', '', '', 1416839900),
(486, 504, 480, 0, 'Barbarendorp', -1, 500, 500, 400, 181, 1416839815, 406, 45, 9, 3, 4, 8, 0, 6, 1, 0, 9, 6, 6, 6, 7, 12, 4, 6, 1, 0, 0, 1, 1, 0, 0, 0, 0, 0, 1, 1, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '100', 0, -1, 0, 1416839815, '', '', '', 1416839902),
(484, 515, 514, 0, 'Barbarendorp', -1, 500, 500, 400, 192, 1416839815, 401, 55, 6, 5, 5, 5, 0, 8, 1, 0, 7, 12, 6, 4, 8, 12, 6, 4, 1, 0, 0, 1, 1, 0, 0, 0, 0, 0, 1, 1, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '100', 0, -1, 0, 1416839815, '', '', '', 1416839907),
(485, 482, 508, 0, 'Barbarendorp', -1, 500, 500, 400, 176, 1416839815, 405, 54, 5, 3, 7, 7, 0, 6, 1, 0, 7, 10, 5, 7, 9, 8, 8, 8, 1, 0, 0, 1, 1, 0, 0, 0, 0, 0, 1, 1, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '100', 0, -1, 0, 1416839815, '', '', '', 1416839908),
(483, 482, 493, 0, 'Barbarendorp', -1, 500, 500, 400, 213, 1416839815, 403, 44, 7, 6, 4, 7, 0, 9, 1, 0, 7, 6, 6, 6, 8, 8, 5, 6, 1, 0, 0, 1, 1, 0, 0, 0, 0, 0, 1, 1, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '100', 0, -1, 0, 1416839815, '', '', '', 1416839903),
(482, 501, 482, 0, 'Barbarendorp', -1, 500, 500, 400, 172, 1416839815, 405, 45, 8, 2, 5, 8, 0, 7, 1, 0, 6, 8, 3, 5, 10, 8, 10, 7, 1, 0, 0, 1, 1, 0, 0, 0, 0, 0, 1, 1, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '100', 0, -1, 0, 1416839815, '', '', '', 1416839912),
(481, 483, 511, 0, 'Barbarendorp', -1, 500, 500, 400, 166, 1416839815, 406, 54, 8, 8, 2, 6, 0, 3, 1, 0, 8, 7, 8, 6, 8, 7, 10, 11, 1, 0, 0, 1, 1, 0, 0, 0, 0, 0, 1, 1, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '100', 0, -1, 0, 1416839815, '', '', '', 1416839919),
(480, 513, 516, 0, 'Barbarendorp', -1, 500, 500, 400, 189, 1416839815, 403, 55, 4, 10, 2, 6, 0, 7, 1, 0, 8, 7, 6, 7, 8, 11, 2, 5, 1, 0, 0, 1, 1, 0, 0, 0, 0, 0, 1, 1, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '100', 0, -1, 0, 1416839815, '', '', '', 1416839898),
(479, 484, 490, 0, 'Barbarendorp', -1, 500, 500, 400, 177, 1416839815, 402, 44, 9, 4, 6, 5, 0, 6, 1, 0, 7, 7, 7, 4, 5, 11, 7, 11, 1, 0, 0, 1, 1, 0, 0, 0, 0, 0, 1, 1, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '100', 0, -1, 0, 1416839815, '', '', '', 1416839912),
(478, 517, 497, 0, 'Barbarendorp', -1, 500, 500, 400, 165, 1416839815, 402, 45, 6, 8, 6, 9, 0, 4, 1, 0, 8, 6, 5, 8, 7, 3, 7, 2, 1, 0, 0, 1, 1, 0, 0, 0, 0, 0, 1, 1, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '100', 0, -1, 0, 1416839815, '', '', '', 1416839901),
(476, 511, 518, 0, 'Barbarendorp', -1, 500, 500, 400, 179, 1416839815, 402, 55, 7, 9, 4, 7, 0, 5, 1, 0, 9, 7, 7, 5, 7, 7, 9, 3, 1, 0, 0, 1, 1, 0, 0, 0, 0, 0, 1, 1, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '100', 0, -1, 0, 1416839815, '', '', '', 1416839910),
(477, 485, 514, 0, 'Barbarendorp', -1, 500, 500, 400, 208, 1416839815, 403, 54, 8, 6, 4, 7, 0, 7, 1, 0, 8, 4, 9, 9, 8, 6, 7, 5, 1, 0, 0, 1, 1, 0, 0, 0, 0, 0, 1, 1, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '100', 0, -1, 0, 1416839815, '', '', '', 1416839910),
(475, 486, 487, 0, 'Barbarendorp', -1, 500, 500, 400, 162, 1416839815, 401, 44, 7, 9, 5, 8, 0, 5, 1, 0, 8, 6, 8, 2, 9, 6, 3, 3, 1, 0, 0, 1, 1, 0, 0, 0, 0, 0, 1, 1, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '100', 0, -1, 0, 1416839815, '', '', '', 1416839897),
(474, 516, 494, 0, 'Barbarendorp', -1, 500, 500, 400, 211, 1416839815, 403, 45, 4, 6, 7, 6, 0, 9, 1, 0, 5, 7, 9, 4, 7, 4, 8, 7, 1, 0, 0, 1, 1, 0, 0, 0, 0, 0, 1, 1, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '100', 0, -1, 0, 1416839815, '', '', '', 1416839904),
(473, 488, 516, 0, 'Barbarendorp', -1, 500, 500, 400, 186, 1416839815, 402, 54, 6, 6, 9, 6, 0, 7, 1, 0, 7, 3, 6, 8, 9, 6, 4, 3, 1, 0, 0, 1, 1, 0, 0, 0, 0, 0, 1, 1, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '100', 0, -1, 0, 1416839815, '', '', '', 1416839897),
(472, 509, 519, 0, 'Barbarendorp', -1, 500, 500, 400, 168, 1416839815, 410, 55, 6, 10, 5, 5, 0, 6, 1, 0, 5, 5, 8, 7, 9, 11, 7, 6, 1, 0, 0, 1, 1, 0, 0, 0, 0, 0, 1, 1, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '100', 0, -1, 0, 1416839815, '', '', '', 1416839912),
(471, 488, 484, 0, 'Barbarendorp', -1, 500, 500, 400, 154, 1416839815, 403, 44, 6, 7, 3, 3, 0, 7, 1, 0, 4, 8, 6, 3, 15, 7, 10, 8, 1, 0, 0, 1, 1, 0, 0, 0, 0, 0, 1, 1, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '100', 0, -1, 0, 1416839815, '', '', '', 1416839905),
(470, 517, 491, 0, 'Barbarendorp', -1, 500, 500, 400, 215, 1416839815, 403, 45, 5, 7, 7, 1, 0, 9, 1, 0, 5, 7, 9, 5, 6, 9, 10, 8, 1, 0, 0, 1, 1, 0, 0, 0, 0, 0, 1, 1, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '100', 0, -1, 0, 1416839815, '', '', '', 1416839912),
(468, 506, 520, 0, 'Barbarendorp', -1, 500, 500, 400, 230, 1416839815, 410, 55, 9, 4, 5, 8, 0, 9, 1, 0, 9, 0, 6, 5, 4, 7, 9, 4, 1, 0, 0, 1, 1, 0, 0, 0, 0, 0, 1, 1, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '100', 0, -1, 0, 1416839815, '', '', '', 1416839895),
(469, 490, 517, 0, 'Barbarendorp', -1, 500, 500, 400, 214, 1416839815, 406, 54, 5, 6, 5, 7, 0, 7, 1, 0, 9, 6, 12, 6, 5, 9, 5, 4, 1, 0, 0, 1, 1, 0, 0, 0, 0, 0, 1, 1, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '100', 0, -1, 0, 1416839815, '', '', '', 1416839903),
(467, 491, 483, 0, 'Barbarendorp', -1, 500, 500, 400, 186, 1416839815, 402, 44, 5, 10, 4, 7, 0, 8, 1, 0, 5, 5, 7, 4, 3, 9, 7, 5, 1, 0, 0, 1, 1, 0, 0, 0, 0, 0, 1, 1, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '100', 0, -1, 0, 1416839815, '', '', '', 1416839900),
(466, 513, 489, 0, 'Barbarendorp', -1, 500, 500, 400, 185, 1416839815, 409, 45, 7, 8, 7, 5, 0, 7, 1, 0, 6, 6, 9, 4, 5, 11, 6, 7, 1, 0, 0, 1, 1, 0, 0, 0, 0, 0, 1, 1, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '100', 0, -1, 0, 1416839815, '', '', '', 1416839911),
(465, 493, 519, 0, 'Barbarendorp', -1, 500, 500, 400, 215, 1416839815, 408, 54, 6, 8, 9, 4, 0, 8, 1, 0, 9, 5, 4, 4, 2, 7, 5, 7, 1, 0, 0, 1, 1, 0, 0, 0, 0, 0, 1, 1, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '100', 0, -1, 0, 1416839815, '', '', '', 1416839898),
(464, 520, 502, 0, 'Barbarendorp', -1, 500, 500, 400, 132, 1416839815, 405, 55, 4, 10, 6, 8, 0, 4, 1, 0, 3, 6, 6, 5, 6, 10, 7, 7, 1, 0, 0, 1, 1, 0, 0, 0, 0, 0, 1, 1, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '100', 0, -1, 0, 1416839815, '', '', '', 1416839907),
(463, 494, 482, 0, 'Barbarendorp', -1, 500, 500, 400, 168, 1416839815, 402, 44, 7, 8, 9, 5, 0, 4, 1, 0, 6, 6, 10, 8, 4, 6, 7, 5, 1, 0, 0, 1, 1, 0, 0, 0, 0, 0, 1, 1, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '100', 0, -1, 0, 1416839815, '', '', '', 1416839907),
(462, 511, 487, 0, 'Barbarendorp', -1, 500, 500, 400, 209, 1416839815, 402, 45, 9, 5, 6, 5, 0, 9, 1, 0, 3, 6, 5, 10, 5, 11, 7, 4, 1, 0, 0, 1, 1, 0, 0, 0, 0, 0, 1, 1, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '100', 0, -1, 0, 1416839815, '', '', '', 1416839904),
(460, 519, 505, 0, 'Barbarendorp', -1, 500, 500, 400, 192, 1416839815, 404, 55, 5, 11, 3, 4, 0, 7, 1, 0, 7, 4, 4, 8, 4, 10, 10, 7, 1, 0, 0, 1, 1, 0, 0, 0, 0, 0, 1, 1, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '100', 0, -1, 0, 1416839815, '', '', '', 1416839910),
(461, 497, 520, 0, 'Barbarendorp', -1, 500, 500, 400, 227, 1416839815, 414, 54, 7, 7, 5, 7, 0, 9, 1, 0, 4, 4, 6, 11, 5, 6, 4, 8, 1, 0, 0, 1, 1, 0, 0, 0, 0, 0, 1, 1, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '100', 0, -1, 0, 1416839815, '', '', '', 1416839899),
(459, 497, 481, 0, 'Barbarendorp', -1, 500, 500, 400, 172, 1416839815, 403, 44, 8, 10, 3, 6, 0, 6, 1, 0, 3, 10, 5, 10, 6, 8, 7, 3, 1, 0, 0, 1, 1, 0, 0, 0, 0, 0, 1, 1, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '100', 0, -1, 0, 1416839815, '', '', '', 1416839901),
(458, 509, 486, 0, 'Barbarendorp', -1, 500, 500, 400, 167, 1416839815, 403, 45, 6, 4, 7, 8, 0, 5, 1, 0, 4, 3, 7, 11, 7, 9, 9, 7, 1, 0, 0, 1, 1, 0, 0, 0, 0, 0, 1, 1, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '100', 0, -1, 0, 1416839815, '', '', '', 1416839909),
(457, 494, 516, 0, 'Barbarendorp', -1, 500, 500, 400, 185, 1416839815, 403, 54, 8, 5, 3, 7, 0, 5, 1, 0, 7, 7, 12, 9, 10, 6, 7, 5, 1, 0, 0, 1, 1, 0, 0, 0, 0, 0, 1, 1, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '100', 0, -1, 0, 1416839815, '', '', '', 1416839911),
(456, 519, 507, 0, 'Barbarendorp', -1, 500, 500, 400, 154, 1416839815, 421, 55, 3, 5, 11, 8, 0, 6, 1, 0, 1, 1, 5, 8, 7, 8, 6, 6, 1, 0, 0, 1, 1, 0, 0, 0, 0, 0, 1, 1, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '100', 0, -1, 0, 1416839815, '', '', '', 1416839896),
(455, 494, 483, 0, 'Barbarendorp', -1, 500, 500, 400, 183, 1416839815, 404, 44, 9, 9, 5, 5, 0, 6, 1, 0, 9, 8, 3, 5, 10, 7, 4, 4, 1, 0, 0, 1, 1, 0, 0, 0, 0, 0, 1, 1, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '100', 0, -1, 0, 1416839815, '', '', '', 1416839900),
(454, 507, 483, 0, 'Barbarendorp', -1, 500, 500, 400, 202, 1416839815, 407, 45, 9, 8, 4, 6, 0, 8, 1, 0, 6, 6, 9, 4, 6, 6, 9, 6, 1, 0, 0, 1, 1, 0, 0, 0, 0, 0, 1, 1, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '100', 0, -1, 0, 1416839815, '', '', '', 1416839902),
(453, 482, 502, 5, 'Bonusdorp', -1, 500, 500, 400, 171, 1416839811, 402, 54, 8, 9, 2, 7, 0, 6, 1, 0, 6, 4, 7, 6, 7, 8, 9, 8, 1, 0, 0, 1, 1, 0, 0, 0, 0, 0, 1, 1, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '100', 0, -1, 0, 1416839811, '', '', '', 1416839904),
(452, 517, 510, 5, 'Bonusdorp', -1, 500, 500, 400, 199, 1416839811, 404, 55, 8, 5, 7, 4, 0, 6, 1, 0, 8, 7, 9, 7, 9, 3, 7, 10, 1, 0, 0, 1, 1, 0, 0, 0, 0, 0, 1, 1, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '100', 0, -1, 0, 1416839811, '', '', '', 1416839904),
(451, 483, 500, 5, 'Bonusdorp', -1, 500, 500, 400, 195, 1416839811, 402, 54, 10, 6, 5, 5, 0, 6, 1, 0, 7, 9, 11, 6, 4, 7, 5, 8, 1, 0, 0, 1, 1, 0, 0, 0, 0, 0, 1, 1, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '100', 0, -1, 0, 1416839811, '', '', '', 1416839905),
(449, 483, 505, 5, 'Bonusdorp', -1, 500, 500, 400, 218, 1416839811, 408, 54, 6, 4, 6, 8, 0, 9, 1, 0, 7, 6, 4, 7, 6, 4, 10, 4, 1, 0, 0, 1, 1, 0, 0, 0, 0, 0, 1, 1, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '100', 0, -1, 0, 1416839811, '', '', '', 1416839899),
(450, 503, 482, 5, 'Bonusdorp', -1, 500, 500, 400, 175, 1416839811, 408, 45, 10, 7, 6, 5, 0, 4, 1, 0, 8, 13, 8, 5, 4, 7, 8, 2, 1, 0, 0, 1, 1, 0, 0, 0, 0, 0, 1, 1, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '100', 0, -1, 0, 1416839811, '', '', '', 1416839906),
(448, 515, 513, 4, 'Bonusdorp', -1, 500, 500, 400, 201, 1416839808, 409, 55, 7, 10, 8, 1, 0, 5, 1, 0, 10, 6, 9, 6, 7, 4, 6, 4, 1, 0, 0, 1, 1, 0, 0, 0, 0, 0, 1, 1, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '100', 0, -1, 0, 1416839808, '', '', '', 1416839891),
(447, 483, 497, 4, 'Bonusdorp', -1, 500, 500, 400, 160, 1416839808, 406, 44, 7, 6, 8, 7, 0, 5, 1, 0, 3, 4, 4, 9, 6, 5, 8, 11, 1, 0, 0, 1, 1, 0, 0, 0, 0, 0, 1, 1, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '100', 0, -1, 0, 1416839808, '', '', '', 1416839897),
(446, 503, 483, 4, 'Bonusdorp', -1, 500, 500, 400, 221, 1416839808, 402, 45, 5, 8, 8, 5, 0, 9, 1, 0, 8, 4, 7, 3, 5, 4, 6, 4, 1, 0, 0, 1, 1, 0, 0, 0, 0, 0, 1, 1, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '100', 0, -1, 0, 1416839808, '', '', '', 1416839884),
(444, 513, 515, 4, 'Bonusdorp', -1, 500, 500, 400, 171, 1416839808, 401, 55, 8, 7, 10, 2, 0, 5, 1, 0, 6, 10, 5, 8, 5, 4, 10, 2, 1, 0, 0, 1, 1, 0, 0, 0, 0, 0, 1, 1, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '100', 0, -1, 0, 1416839808, '', '', '', 1416839893),
(445, 484, 508, 4, 'Bonusdorp', -1, 500, 500, 400, 172, 1416839808, 403, 54, 9, 8, 6, 4, 0, 5, 1, 0, 7, 8, 7, 3, 7, 6, 7, 11, 1, 0, 0, 1, 1, 0, 0, 0, 0, 0, 1, 1, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '100', 0, -1, 0, 1416839808, '', '', '', 1416839900),
(442, 515, 499, 2, 'Bonusdorp', -1, 500, 500, 400, 206, 1416839803, 405, 45, 4, 10, 3, 5, 0, 5, 1, 0, 11, 10, 3, 9, 8, 7, 2, 5, 1, 0, 0, 1, 1, 0, 0, 0, 0, 0, 1, 1, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '100', 0, -1, 0, 1416839803, '', '', '', 1416839893),
(440, 510, 517, 2, 'Bonusdorp', -1, 500, 500, 400, 245, 1416839803, 404, 55, 7, 4, 3, 5, 0, 10, 1, 0, 6, 6, 9, 6, 5, 4, 10, 10, 1, 0, 0, 1, 1, 0, 0, 0, 0, 0, 1, 1, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '100', 0, -1, 0, 1416839803, '', '', '', 1416839893),
(441, 487, 511, 2, 'Bonusdorp', -1, 500, 500, 400, 118, 1416839803, 404, 54, 8, 4, 8, 10, 0, 1, 1, 0, 5, 6, 8, 4, 8, 5, 5, 5, 1, 0, 0, 1, 1, 0, 0, 0, 0, 0, 1, 1, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '100', 0, -1, 0, 1416839803, '', '', '', 1416839885),
(439, 486, 492, 2, 'Bonusdorp', -1, 500, 500, 400, 160, 1416839803, 418, 44, 8, 5, 4, 11, 0, 4, 1, 0, 8, 4, 7, 6, 5, 7, 8, 1, 1, 0, 0, 1, 1, 0, 0, 0, 0, 0, 1, 1, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '100', 0, -1, 0, 1416839803, '', '', '', 1416839882),
(438, 515, 495, 2, 'Bonusdorp', -1, 500, 500, 400, 129, 1416839803, 401, 45, 9, 8, 9, 8, 0, 3, 1, 0, 3, 3, 2, 8, 3, 7, 7, 3, 1, 0, 0, 1, 1, 0, 0, 0, 0, 0, 1, 1, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '100', 0, -1, 0, 1416839803, '', '', '', 1416839881),
(437, 489, 513, 2, 'Bonusdorp', -1, 500, 500, 400, 172, 1416839803, 401, 54, 6, 8, 7, 5, 0, 5, 1, 0, 5, 9, 12, 5, 8, 4, 6, 7, 1, 0, 0, 1, 1, 0, 0, 0, 0, 0, 1, 1, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '100', 0, -1, 0, 1416839803, '', '', '', 1416839896),
(436, 508, 518, 2, 'Bonusdorp', -1, 500, 500, 400, 233, 1416839803, 414, 55, 7, 7, 6, 5, 0, 9, 1, 0, 5, 6, 8, 11, 6, 8, 5, 5, 1, 0, 0, 1, 1, 0, 0, 0, 0, 0, 1, 1, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '100', 0, -1, 0, 1416839803, '', '', '', 1416839896),
(435, 488, 490, 2, 'Bonusdorp', -1, 500, 500, 400, 239, 1416839803, 401, 44, 8, 4, 5, 5, 0, 8, 1, 0, 11, 5, 7, 5, 5, 8, 5, 9, 1, 0, 0, 1, 1, 0, 0, 0, 0, 0, 1, 1, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '100', 0, -1, 0, 1416839803, '', '', '', 1416839891),
(443, 485, 495, 2, 'Bonusdorp', -1, 500, 500, 400, 157, 1416839803, 402, 44, 8, 9, 4, 6, 0, 5, 1, 0, 3, 7, 6, 10, 9, 9, 10, 3, 1, 0, 0, 1, 1, 0, 0, 0, 0, 0, 1, 1, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '100', 0, -1, 0, 1416839803, '', '', '', 1416839898),
(434, 515, 492, 2, 'Bonusdorp', -1, 500, 500, 400, 150, 1416839803, 414, 45, 6, 4, 6, 8, 0, 5, 1, 0, 7, 4, 3, 8, 13, 11, 8, 4, 1, 0, 0, 1, 1, 0, 0, 0, 0, 0, 1, 1, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '100', 0, -1, 0, 1416839803, '', '', '', 1416839891),
(433, 491, 515, 3, 'Bonusdorp', -1, 500, 500, 400, 181, 1416839798, 404, 54, 9, 10, 5, 4, 0, 6, 1, 0, 3, 9, 8, 8, 2, 5, 4, 10, 1, 0, 0, 1, 1, 0, 0, 0, 0, 0, 1, 1, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '100', 0, -1, 0, 1416839798, '', '', '', 1416839885),
(432, 506, 519, 3, 'Bonusdorp', -1, 500, 500, 400, 179, 1416839798, 403, 55, 6, 4, 7, 6, 0, 6, 1, 0, 6, 9, 9, 7, 7, 10, 7, 8, 1, 0, 0, 1, 1, 0, 0, 0, 0, 0, 1, 1, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '100', 0, -1, 0, 1416839798, '', '', '', 1416839893),
(431, 489, 488, 3, 'Bonusdorp', -1, 500, 500, 400, 206, 1416839798, 402, 44, 8, 6, 7, 3, 0, 8, 1, 0, 5, 7, 11, 8, 9, 8, 5, 3, 1, 0, 0, 1, 1, 0, 0, 0, 0, 0, 1, 1, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '100', 0, -1, 0, 1416839798, '', '', '', 1416839889),
(430, 510, 487, 3, 'Bonusdorp', -1, 500, 500, 400, 211, 1416839798, 402, 45, 5, 3, 3, 8, 0, 7, 1, 0, 10, 4, 8, 6, 7, 9, 7, 9, 1, 0, 0, 1, 1, 0, 0, 0, 0, 0, 1, 1, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '100', 0, -1, 0, 1416839798, '', '', '', 1416839888),
(428, 503, 520, 3, 'Bonusdorp', -1, 500, 500, 400, 178, 1416839798, 405, 55, 10, 7, 5, 4, 0, 5, 1, 0, 7, 5, 7, 9, 10, 8, 7, 9, 1, 0, 0, 1, 1, 0, 0, 0, 0, 0, 1, 1, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '100', 0, -1, 0, 1416839798, '', '', '', 1416839895),
(429, 494, 517, 3, 'Bonusdorp', -1, 500, 500, 400, 151, 1416839798, 402, 54, 12, 2, 4, 7, 0, 5, 1, 0, 3, 12, 6, 6, 9, 4, 5, 8, 1, 0, 0, 1, 1, 0, 0, 0, 0, 0, 1, 1, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '100', 0, -1, 0, 1416839798, '', '', '', 1416839884),
(427, 491, 484, 3, 'Bonusdorp', -1, 500, 500, 400, 176, 1416839798, 404, 44, 6, 4, 3, 5, 0, 5, 1, 0, 7, 6, 8, 7, 10, 9, 10, 13, 1, 0, 0, 1, 1, 0, 0, 0, 0, 0, 1, 1, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '100', 0, -1, 0, 1416839798, '', '', '', 1416839902),
(426, 516, 497, 3, 'Bonusdorp', -1, 500, 500, 400, 139, 1416839798, 401, 45, 5, 6, 3, 6, 0, 5, 1, 0, 3, 7, 8, 5, 14, 7, 4, 12, 1, 0, 0, 1, 1, 0, 0, 0, 0, 0, 1, 1, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '100', 0, -1, 0, 1416839798, '', '', '', 1416839889),
(425, 498, 517, 3, 'Bonusdorp', -1, 500, 500, 400, 166, 1416839798, 402, 54, 9, 7, 10, 2, 0, 6, 1, 0, 4, 10, 2, 7, 5, 7, 6, 6, 1, 0, 0, 1, 1, 0, 0, 0, 0, 0, 1, 1, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '100', 0, -1, 0, 1416839798, '', '', '', 1416839883),
(424, 506, 517, 3, 'Bonusdorp', -1, 500, 500, 400, 159, 1416839798, 414, 55, 8, 10, 6, 9, 0, 5, 1, 0, 7, 5, 5, 2, 5, 3, 4, 4, 1, 0, 0, 1, 1, 0, 0, 0, 0, 0, 1, 1, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '100', 0, -1, 0, 1416839798, '', '', '', 1416839872),
(423, 494, 484, 0, 'Barbarendorp', -1, 500, 500, 400, 190, 1416839793, 415, 44, 1, 3, 11, 5, 0, 6, 1, 0, 9, 6, 9, 3, 7, 8, 6, 6, 1, 0, 0, 1, 1, 0, 0, 0, 0, 0, 1, 1, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '100', 0, -1, 0, 1416839793, '', '', '', 1416839886),
(421, 498, 515, 0, 'Barbarendorp', -1, 500, 500, 400, 172, 1416839793, 405, 54, 6, 9, 5, 8, 0, 5, 1, 0, 5, 6, 7, 10, 4, 7, 7, 6, 1, 0, 0, 1, 1, 0, 0, 0, 0, 0, 1, 1, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '100', 0, -1, 0, 1416839793, '', '', '', 1416839877),
(422, 514, 495, 0, 'Barbarendorp', -1, 500, 500, 400, 139, 1416839793, 401, 45, 7, 5, 8, 8, 0, 3, 1, 0, 7, 7, 5, 4, 4, 11, 8, 7, 1, 0, 0, 1, 1, 0, 0, 0, 0, 0, 1, 1, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '100', 0, -1, 0, 1416839793, '', '', '', 1416839884),
(420, 518, 503, 0, 'Barbarendorp', -1, 500, 500, 400, 133, 1416839793, 404, 55, 8, 7, 4, 10, 0, 4, 1, 0, 2, 7, 8, 6, 9, 3, 6, 5, 1, 0, 0, 1, 1, 0, 0, 0, 0, 0, 1, 1, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '100', 0, -1, 0, 1416839793, '', '', '', 1416839874),
(419, 496, 483, 0, 'Barbarendorp', -1, 500, 500, 400, 215, 1416839793, 403, 44, 8, 7, 4, 6, 0, 8, 1, 0, 9, 5, 9, 4, 7, 8, 9, 1, 1, 0, 0, 1, 1, 0, 0, 0, 0, 0, 1, 1, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '100', 0, -1, 0, 1416839793, '', '', '', 1416839881),
(418, 514, 492, 0, 'Barbarendorp', -1, 500, 500, 400, 138, 1416839792, 412, 45, 10, 6, 4, 10, 0, 4, 1, 0, 5, 3, 1, 7, 5, 10, 6, 7, 1, 0, 0, 1, 1, 0, 0, 0, 0, 0, 1, 1, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '100', 0, -1, 0, 1416839792, '', '', '', 1416839871),
(417, 486, 502, 0, 'Barbarendorp', -1, 500, 500, 400, 170, 1416839792, 403, 54, 8, 9, 7, 5, 0, 5, 1, 0, 7, 8, 6, 6, 7, 5, 10, 4, 1, 0, 0, 1, 1, 0, 0, 0, 0, 0, 1, 1, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '100', 0, -1, 0, 1416839792, '', '', '', 1416839881),
(416, 517, 506, 0, 'Barbarendorp', -1, 500, 500, 400, 170, 1416839792, 403, 55, 8, 6, 7, 5, 0, 6, 1, 0, 5, 7, 7, 6, 8, 9, 7, 10, 1, 0, 0, 1, 1, 0, 0, 0, 0, 0, 1, 1, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '100', 0, -1, 0, 1416839792, '', '', '', 1416839890),
(415, 496, 488, 0, 'Barbarendorp', -1, 500, 500, 400, 165, 1416839792, 407, 44, 8, 9, 6, 9, 0, 6, 1, 0, 6, 6, 4, 5, 6, 3, 2, 3, 1, 0, 0, 1, 1, 0, 0, 0, 0, 0, 1, 1, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '100', 0, -1, 0, 1416839792, '', '', '', 1416839868),
(413, 490, 509, 0, 'Barbarendorp', -1, 500, 500, 400, 138, 1416839792, 406, 54, 7, 8, 6, 9, 0, 4, 1, 0, 4, 8, 6, 5, 7, 8, 7, 5, 1, 0, 0, 1, 1, 0, 0, 0, 0, 0, 1, 1, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '100', 0, -1, 0, 1416839792, '', '', '', 1416839884),
(414, 511, 490, 0, 'Barbarendorp', -1, 500, 500, 400, 148, 1416839792, 402, 45, 6, 5, 2, 10, 0, 5, 1, 0, 6, 4, 10, 2, 6, 11, 9, 5, 1, 0, 0, 1, 1, 0, 0, 0, 0, 0, 1, 1, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '100', 0, -1, 0, 1416839792, '', '', '', 1416839879),
(412, 516, 508, 0, 'Barbarendorp', -1, 500, 500, 400, 192, 1416839792, 405, 55, 4, 7, 8, 5, 0, 6, 1, 0, 6, 8, 11, 9, 9, 4, 7, 3, 1, 0, 0, 1, 1, 0, 0, 0, 0, 0, 1, 1, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '100', 0, -1, 0, 1416839792, '', '', '', 1416839882),
(411, 486, 497, 0, 'Barbarendorp', -1, 500, 500, 400, 238, 1416839792, 409, 44, 8, 3, 5, 5, 0, 7, 1, 0, 12, 8, 7, 6, 8, 8, 8, 5, 1, 0, 0, 1, 1, 0, 0, 0, 0, 0, 1, 1, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '100', 0, -1, 0, 1416839792, '', '', '', 1416839885),
(410, 510, 489, 0, 'Barbarendorp', -1, 500, 500, 400, 196, 1416839792, 408, 45, 4, 7, 2, 6, 0, 7, 1, 0, 9, 4, 9, 6, 14, 2, 10, 3, 1, 0, 0, 1, 1, 0, 0, 0, 0, 0, 1, 1, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '100', 0, -1, 0, 1416839792, '', '', '', 1416839889),
(409, 491, 513, 0, 'Barbarendorp', -1, 500, 500, 400, 144, 1416839792, 403, 54, 8, 6, 8, 7, 0, 5, 1, 0, 3, 8, 2, 5, 7, 6, 10, 9, 1, 0, 0, 1, 1, 0, 0, 0, 0, 0, 1, 1, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '100', 0, -1, 0, 1416839792, '', '', '', 1416839879),
(408, 514, 511, 0, 'Barbarendorp', -1, 500, 500, 400, 170, 1416839792, 404, 55, 6, 10, 5, 8, 0, 5, 1, 0, 5, 2, 10, 8, 3, 4, 7, 5, 1, 0, 0, 1, 1, 0, 0, 0, 0, 0, 1, 1, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '100', 0, -1, 0, 1416839792, '', '', '', 1416839873),
(407, 488, 492, 0, 'Barbarendorp', -1, 500, 500, 400, 166, 1416839792, 402, 44, 5, 8, 8, 2, 0, 3, 1, 0, 9, 6, 7, 5, 10, 5, 10, 10, 1, 0, 0, 1, 1, 0, 0, 0, 0, 0, 1, 1, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '100', 0, -1, 0, 1416839792, '', '', '', 1416839884),
(405, 493, 513, 0, 'Barbarendorp', -1, 500, 500, 400, 167, 1416839792, 407, 54, 6, 3, 7, 3, 0, 7, 1, 0, 5, 10, 6, 8, 15, 8, 5, 4, 1, 0, 0, 1, 1, 0, 0, 0, 0, 0, 1, 1, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '100', 0, -1, 0, 1416839792, '', '', '', 1416839878),
(406, 508, 486, 0, 'Barbarendorp', -1, 500, 500, 400, 150, 1416839792, 421, 45, 6, 3, 11, 7, 0, 3, 1, 0, 7, 8, 6, 7, 10, 6, 2, 5, 1, 0, 0, 1, 1, 0, 0, 0, 0, 0, 1, 1, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '100', 0, -1, 0, 1416839792, '', '', '', 1416839873),
(404, 512, 513, 0, 'Barbarendorp', -1, 500, 500, 400, 168, 1416839792, 404, 55, 8, 7, 8, 5, 0, 5, 1, 0, 6, 5, 11, 3, 5, 8, 10, 6, 1, 0, 0, 1, 1, 0, 0, 0, 0, 0, 1, 1, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '100', 0, -1, 0, 1416839792, '', '', '', 1416839882),
(403, 490, 490, 0, 'Barbarendorp', -1, 500, 500, 400, 115, 1416839792, 407, 44, 5, 11, 2, 8, 0, 2, 1, 0, 5, 5, 4, 6, 13, 6, 9, 2, 1, 0, 0, 1, 1, 0, 0, 0, 0, 0, 1, 1, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '100', 0, -1, 0, 1416839792, '', '', '', 1416839872),
(402, 506, 485, 0, 'Barbarendorp', -1, 500, 500, 400, 167, 1416839792, 401, 45, 5, 3, 8, 8, 0, 1, 1, 0, 11, 10, 7, 5, 9, 3, 6, 3, 1, 0, 0, 1, 1, 0, 0, 0, 0, 0, 1, 1, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '100', 0, -1, 0, 1416839792, '', '', '', 1416839869),
(401, 496, 516, 0, 'Barbarendorp', -1, 500, 500, 400, 156, 1416839792, 403, 54, 11, 3, 6, 7, 0, 5, 1, 0, 5, 6, 7, 5, 4, 10, 9, 9, 1, 0, 0, 1, 1, 0, 0, 0, 0, 0, 1, 1, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '100', 0, -1, 0, 1416839792, '', '', '', 1416839887),
(400, 510, 515, 0, 'Barbarendorp', -1, 500, 500, 400, 178, 1416839792, 404, 55, 8, 7, 8, 6, 0, 8, 1, 0, 1, 6, 4, 7, 8, 5, 3, 8, 1, 0, 0, 1, 1, 0, 0, 0, 0, 0, 1, 1, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '100', 0, -1, 0, 1416839792, '', '', '', 1416839870),
(399, 494, 489, 0, 'Barbarendorp', -1, 500, 500, 400, 154, 1416839792, 403, 44, 6, 7, 9, 6, 0, 5, 1, 0, 5, 6, 10, 3, 7, 9, 5, 6, 1, 0, 0, 1, 1, 0, 0, 0, 0, 0, 1, 1, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '100', 0, -1, 0, 1416839792, '', '', '', 1416839877),
(397, 495, 512, 0, 'Barbarendorp', -1, 500, 500, 400, 208, 1416839792, 401, 54, 10, 7, 7, 3, 0, 9, 1, 0, 4, 9, 6, 6, 6, 5, 4, 5, 1, 0, 0, 1, 1, 0, 0, 0, 0, 0, 1, 1, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '100', 0, -1, 0, 1416839792, '', '', '', 1416839877),
(398, 502, 486, 0, 'Barbarendorp', -1, 500, 500, 400, 179, 1416839792, 406, 45, 8, 4, 5, 8, 0, 7, 1, 0, 6, 7, 3, 8, 9, 9, 8, 6, 1, 0, 0, 1, 1, 0, 0, 0, 0, 0, 1, 1, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '100', 0, -1, 0, 1416839792, '', '', '', 1416839886),
(396, 507, 517, 0, 'Barbarendorp', -1, 500, 500, 400, 155, 1416839792, 402, 55, 2, 4, 5, 10, 0, 4, 1, 0, 8, 6, 6, 6, 7, 8, 8, 8, 1, 0, 0, 1, 1, 0, 0, 0, 0, 0, 1, 1, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '100', 0, -1, 0, 1416839792, '', '', '', 1416839877),
(395, 497, 487, 0, 'Barbarendorp', -1, 500, 500, 400, 174, 1416839792, 401, 44, 7, 7, 8, 7, 0, 7, 1, 0, 5, 4, 7, 4, 7, 5, 7, 6, 1, 0, 0, 1, 1, 0, 0, 0, 0, 0, 1, 1, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '100', 0, -1, 0, 1416839792, '', '', '', 1416839874),
(394, 506, 486, 0, 'Barbarendorp', -1, 500, 500, 400, 197, 1416839792, 401, 45, 5, 5, 6, 8, 0, 7, 1, 0, 6, 6, 12, 6, 5, 3, 7, 6, 1, 0, 0, 1, 1, 0, 0, 0, 0, 0, 1, 1, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '100', 0, -1, 0, 1416839792, '', '', '', 1416839877),
(393, 487, 501, 0, 'Barbarendorp', -1, 500, 500, 400, 209, 1416839792, 402, 54, 7, 9, 1, 4, 0, 6, 1, 0, 9, 8, 9, 7, 5, 7, 10, 9, 1, 0, 0, 1, 1, 0, 0, 0, 0, 0, 1, 1, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '100', 0, -1, 0, 1416839792, '', '', '', 1416839892),
(392, 503, 518, 0, 'Barbarendorp', -1, 500, 500, 400, 233, 1416839792, 402, 55, 9, 5, 3, 7, 0, 9, 1, 0, 6, 5, 8, 10, 4, 5, 5, 7, 1, 0, 0, 1, 1, 0, 0, 0, 0, 0, 1, 1, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '100', 0, -1, 0, 1416839792, '', '', '', 1416839879),
(391, 500, 487, 0, 'Barbarendorp', -1, 500, 500, 400, 174, 1416839792, 404, 45, 4, 10, 6, 6, 0, 6, 1, 0, 4, 9, 5, 9, 8, 3, 8, 6, 1, 0, 0, 1, 1, 0, 0, 0, 0, 0, 1, 1, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '100', 0, -1, 0, 1416839792, '', '', '', 1416839884),
(389, 487, 504, 0, 'Barbarendorp', -1, 500, 500, 400, 153, 1416839792, 405, 54, 10, 7, 5, 7, 0, 3, 1, 0, 9, 6, 4, 3, 11, 5, 6, 8, 1, 0, 0, 1, 1, 0, 0, 0, 0, 0, 1, 1, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '100', 0, -1, 0, 1416839792, '', '', '', 1416839877),
(390, 514, 499, 0, 'Barbarendorp', -1, 500, 500, 400, 193, 1416839792, 404, 45, 5, 5, 8, 5, 0, 7, 1, 0, 8, 6, 9, 3, 7, 9, 10, 6, 1, 0, 0, 1, 1, 0, 0, 0, 0, 0, 1, 1, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '100', 0, -1, 0, 1416839792, '', '', '', 1416839887),
(388, 504, 515, 0, 'Barbarendorp', -1, 500, 500, 400, 226, 1416839792, 405, 55, 7, 3, 9, 1, 0, 8, 1, 0, 10, 6, 4, 7, 6, 9, 10, 5, 1, 0, 0, 1, 1, 0, 0, 0, 0, 0, 1, 1, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '100', 0, -1, 0, 1416839792, '', '', '', 1416839879),
(387, 487, 498, 0, 'Barbarendorp', -1, 500, 500, 400, 158, 1416839792, 405, 44, 8, 8, 8, 5, 0, 3, 1, 0, 8, 4, 8, 7, 10, 8, 7, 4, 1, 0, 0, 1, 1, 0, 0, 0, 0, 0, 1, 1, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '100', 0, -1, 0, 1416839792, '', '', '', 1416839882),
(386, 514, 497, 0, 'Barbarendorp', -1, 500, 500, 400, 225, 1416839792, 411, 45, 7, 2, 6, 7, 0, 9, 1, 0, 8, 6, 7, 4, 2, 10, 6, 9, 1, 0, 0, 1, 1, 0, 0, 0, 0, 0, 1, 1, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '100', 0, -1, 0, 1416839792, '', '', '', 1416839883),
(385, 488, 506, 0, 'Barbarendorp', -1, 500, 500, 400, 193, 1416839792, 404, 54, 6, 2, 8, 4, 0, 9, 1, 0, 2, 10, 6, 7, 5, 13, 8, 4, 1, 0, 0, 1, 1, 0, 0, 0, 0, 0, 1, 1, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '100', 0, -1, 0, 1416839792, '', '', '', 1416839877),
(384, 516, 502, 0, 'Barbarendorp', -1, 500, 500, 400, 181, 1416839792, 409, 55, 7, 5, 6, 7, 0, 6, 1, 0, 7, 8, 7, 8, 9, 10, 7, 6, 1, 0, 0, 1, 1, 0, 0, 0, 0, 0, 1, 1, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '100', 0, -1, 0, 1416839792, '', '', '', 1416839887),
(383, 487, 495, 1, 'Bonusdorp', -1, 500, 500, 400, 146, 1416839789, 409, 44, 7, 5, 6, 8, 0, 7, 1, 0, 3, 3, 4, 1, 11, 11, 10, 6, 1, 0, 0, 1, 1, 0, 0, 0, 0, 0, 1, 1, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '100', 0, -1, 0, 1416839789, '', '', '', 1416839873),
(382, 512, 493, 1, 'Bonusdorp', -1, 500, 500, 400, 165, 1416839789, 403, 45, 4, 9, 10, 4, 0, 6, 1, 0, 6, 5, 5, 5, 8, 7, 4, 6, 1, 0, 0, 1, 1, 0, 0, 0, 0, 0, 1, 1, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '100', 0, -1, 0, 1416839789, '', '', '', 1416839870),
(380, 515, 504, 1, 'Bonusdorp', -1, 500, 500, 400, 211, 1416839789, 401, 55, 6, 4, 9, 6, 0, 10, 1, 0, 5, 6, 3, 1, 7, 2, 4, 6, 1, 0, 0, 1, 1, 0, 0, 0, 0, 0, 1, 1, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '100', 0, -1, 0, 1416839789, '', '', '', 1416839858),
(381, 490, 508, 1, 'Bonusdorp', -1, 500, 500, 400, 196, 1416839789, 402, 54, 3, 7, 5, 9, 0, 7, 1, 0, 8, 4, 4, 8, 4, 6, 10, 4, 1, 0, 0, 1, 1, 0, 0, 0, 0, 0, 1, 1, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '100', 0, -1, 0, 1416839789, '', '', '', 1416839873),
(379, 490, 494, 1, 'Bonusdorp', -1, 500, 500, 400, 172, 1416839789, 402, 44, 11, 6, 5, 5, 0, 6, 1, 0, 6, 10, 5, 2, 4, 7, 9, 10, 1, 0, 0, 1, 1, 0, 0, 0, 0, 0, 1, 1, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '100', 0, -1, 0, 1416839789, '', '', '', 1416839877),
(378, 510, 490, 1, 'Bonusdorp', -1, 500, 500, 400, 271, 1416839789, 401, 45, 5, 8, 3, 5, 0, 11, 1, 0, 9, 5, 5, 6, 5, 6, 5, 2, 1, 0, 0, 1, 1, 0, 0, 0, 0, 0, 1, 1, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '100', 0, -1, 0, 1416839789, '', '', '', 1416839866),
(377, 492, 510, 1, 'Bonusdorp', -1, 500, 500, 400, 166, 1416839789, 402, 54, 8, 7, 3, 8, 0, 6, 1, 0, 5, 5, 12, 3, 5, 11, 4, 5, 1, 0, 0, 1, 1, 0, 0, 0, 0, 0, 1, 1, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '100', 0, -1, 0, 1416839789, '', '', '', 1416839874),
(376, 514, 507, 1, 'Bonusdorp', -1, 500, 500, 400, 170, 1416839789, 404, 55, 6, 8, 3, 7, 0, 7, 1, 0, 4, 9, 2, 6, 10, 6, 7, 10, 1, 0, 0, 1, 1, 0, 0, 0, 0, 0, 1, 1, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '100', 0, -1, 0, 1416839789, '', '', '', 1416839882),
(375, 492, 491, 1, 'Bonusdorp', -1, 500, 500, 400, 153, 1416839789, 403, 44, 7, 1, 10, 7, 0, 5, 1, 0, 5, 11, 5, 5, 4, 9, 5, 6, 1, 0, 0, 1, 1, 0, 0, 0, 0, 0, 1, 1, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '100', 0, -1, 0, 1416839789, '', '', '', 1416839871),
(374, 508, 488, 1, 'Bonusdorp', -1, 500, 500, 400, 193, 1416839789, 407, 45, 9, 4, 6, 6, 0, 7, 1, 0, 8, 7, 7, 3, 9, 6, 10, 7, 1, 0, 0, 1, 1, 0, 0, 0, 0, 0, 1, 1, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '100', 0, -1, 0, 1416839789, '', '', '', 1416839884),
(372, 512, 510, 1, 'Bonusdorp', -1, 500, 500, 400, 151, 1416839789, 418, 55, 7, 4, 11, 4, 0, 4, 1, 0, 4, 3, 7, 9, 7, 11, 10, 5, 1, 0, 0, 1, 1, 0, 0, 0, 0, 0, 1, 1, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '100', 0, -1, 0, 1416839789, '', '', '', 1416839885),
(373, 494, 511, 1, 'Bonusdorp', -1, 500, 500, 400, 152, 1416839789, 405, 54, 9, 5, 1, 10, 0, 4, 1, 0, 8, 5, 3, 4, 8, 6, 8, 9, 1, 0, 0, 1, 1, 0, 0, 0, 0, 0, 1, 1, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '100', 0, -1, 0, 1416839789, '', '', '', 1416839870),
(371, 494, 488, 1, 'Bonusdorp', -1, 500, 500, 400, 219, 1416839789, 403, 44, 6, 4, 6, 5, 0, 7, 1, 0, 9, 2, 8, 11, 11, 5, 10, 3, 1, 0, 0, 1, 1, 0, 0, 0, 0, 0, 1, 1, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '100', 0, -1, 0, 1416839789, '', '', '', 1416839884),
(370, 504, 487, 1, 'Bonusdorp', -1, 500, 500, 400, 162, 1416839789, 406, 45, 8, 5, 8, 6, 0, 4, 1, 0, 9, 5, 7, 3, 10, 8, 9, 6, 1, 0, 0, 1, 1, 0, 0, 0, 0, 0, 1, 1, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '100', 0, -1, 0, 1416839789, '', '', '', 1416839881),
(369, 497, 513, 1, 'Bonusdorp', -1, 500, 500, 400, 203, 1416839789, 403, 54, 9, 8, 6, 6, 0, 9, 1, 0, 6, 2, 5, 4, 9, 4, 6, 2, 1, 0, 0, 1, 1, 0, 0, 0, 0, 0, 1, 1, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '100', 0, -1, 0, 1416839789, '', '', '', 1416839868),
(368, 509, 513, 1, 'Bonusdorp', -1, 500, 500, 400, 157, 1416839789, 403, 55, 4, 5, 7, 7, 0, 2, 1, 0, 6, 9, 7, 11, 8, 9, 10, 7, 1, 0, 0, 1, 1, 0, 0, 0, 0, 0, 1, 1, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '100', 0, -1, 0, 1416839789, '', '', '', 1416839886),
(367, 488, 497, 1, 'Bonusdorp', -1, 500, 500, 400, 226, 1416839789, 401, 44, 5, 7, 4, 7, 0, 9, 1, 0, 9, 7, 5, 4, 7, 5, 6, 6, 1, 0, 0, 1, 1, 0, 0, 0, 0, 0, 1, 1, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '100', 0, -1, 0, 1416839789, '', '', '', 1416839871),
(366, 503, 488, 1, 'Bonusdorp', -1, 500, 500, 400, 219, 1416839789, 403, 45, 9, 8, 7, 3, 0, 9, 1, 0, 6, 6, 6, 7, 6, 4, 7, 4, 1, 0, 0, 1, 1, 0, 0, 0, 0, 0, 1, 1, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '100', 0, -1, 0, 1416839789, '', '', '', 1416839873),
(364, 507, 514, 1, 'Bonusdorp', -1, 500, 500, 400, 198, 1416839789, 401, 55, 7, 6, 7, 2, 0, 5, 1, 0, 11, 8, 6, 6, 11, 7, 8, 6, 1, 0, 0, 1, 1, 0, 0, 0, 0, 0, 1, 1, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '100', 0, -1, 0, 1416839789, '', '', '', 1416839885),
(365, 496, 512, 1, 'Bonusdorp', -1, 500, 500, 400, 188, 1416839789, 405, 54, 3, 8, 10, 2, 0, 6, 1, 0, 7, 9, 7, 8, 6, 7, 5, 6, 1, 0, 0, 1, 1, 0, 0, 0, 0, 0, 1, 1, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '100', 0, -1, 0, 1416839789, '', '', '', 1416839875),
(362, 512, 497, 0, 'Barbarendorp', -1, 500, 500, 400, 177, 1416839783, 403, 45, 7, 7, 10, 2, 0, 7, 1, 0, 2, 7, 7, 7, 5, 6, 10, 6, 1, 0, 0, 1, 1, 0, 0, 0, 0, 0, 1, 1, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '100', 0, -1, 0, 1416839783, '', '', '', 1416839867),
(363, 490, 495, 0, 'Barbarendorp', -1, 500, 500, 400, 181, 1416839783, 404, 44, 9, 7, 1, 8, 0, 7, 1, 0, 6, 7, 8, 5, 7, 9, 9, 4, 1, 0, 0, 1, 1, 0, 0, 0, 0, 0, 1, 1, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '100', 0, -1, 0, 1416839783, '', '', '', 1416839873),
(361, 489, 504, 0, 'Barbarendorp', -1, 500, 500, 400, 185, 1416839783, 402, 54, 9, 5, 8, 4, 0, 6, 1, 0, 7, 8, 7, 6, 7, 6, 8, 9, 1, 0, 0, 1, 1, 0, 0, 0, 0, 0, 1, 1, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '100', 0, -1, 0, 1416839783, '', '', '', 1416839875),
(360, 514, 502, 0, 'Barbarendorp', -1, 500, 500, 400, 180, 1416839783, 401, 55, 9, 6, 5, 4, 0, 6, 1, 0, 7, 10, 4, 7, 8, 10, 6, 10, 1, 0, 0, 1, 1, 0, 0, 0, 0, 0, 1, 1, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '100', 0, -1, 0, 1416839783, '', '', '', 1416839877),
(359, 491, 492, 0, 'Barbarendorp', -1, 500, 500, 400, 202, 1416839783, 407, 44, 4, 7, 4, 8, 0, 5, 1, 0, 8, 8, 8, 12, 6, 6, 7, 5, 1, 0, 0, 1, 1, 0, 0, 0, 0, 0, 1, 1, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '100', 0, -1, 0, 1416839783, '', '', '', 1416839871),
(358, 510, 494, 0, 'Barbarendorp', -1, 500, 500, 400, 190, 1416839783, 401, 45, 8, 8, 6, 5, 0, 6, 1, 0, 6, 4, 7, 11, 7, 9, 6, 6, 1, 0, 0, 1, 1, 0, 0, 0, 0, 0, 1, 1, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '100', 0, -1, 0, 1416839783, '', '', '', 1416839876),
(357, 491, 505, 0, 'Barbarendorp', -1, 500, 500, 400, 219, 1416839783, 404, 54, 7, 3, 8, 5, 0, 7, 1, 0, 10, 4, 5, 8, 7, 4, 10, 7, 1, 0, 0, 1, 1, 0, 0, 0, 0, 0, 1, 1, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '100', 0, -1, 0, 1416839783, '', '', '', 1416839874),
(356, 513, 506, 0, 'Barbarendorp', -1, 500, 500, 400, 154, 1416839783, 402, 55, 6, 11, 4, 6, 0, 4, 1, 0, 6, 8, 5, 7, 6, 8, 9, 6, 1, 0, 0, 1, 1, 0, 0, 0, 0, 0, 1, 1, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '100', 0, -1, 0, 1416839783, '', '', '', 1416839873),
(354, 508, 491, 0, 'Barbarendorp', -1, 500, 500, 400, 189, 1416839783, 405, 45, 8, 3, 7, 4, 0, 7, 1, 0, 7, 9, 8, 6, 9, 11, 7, 7, 1, 0, 0, 1, 1, 0, 0, 0, 0, 0, 1, 1, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '100', 0, -1, 0, 1416839783, '', '', '', 1416839879),
(355, 493, 490, 0, 'Barbarendorp', -1, 500, 500, 400, 159, 1416839783, 421, 44, 7, 8, 4, 10, 0, 4, 1, 0, 5, 7, 8, 9, 6, 7, 4, 5, 1, 0, 0, 1, 1, 0, 0, 0, 0, 0, 1, 1, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '100', 0, -1, 0, 1416839783, '', '', '', 1416839873),
(353, 492, 508, 0, 'Barbarendorp', -1, 500, 500, 400, 170, 1416839783, 404, 54, 2, 6, 7, 10, 0, 7, 1, 0, 5, 6, 7, 4, 4, 5, 5, 5, 1, 0, 0, 1, 1, 0, 0, 0, 0, 0, 1, 1, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '100', 0, -1, 0, 1416839783, '', '', '', 1416839859),
(352, 512, 508, 0, 'Barbarendorp', -1, 500, 500, 400, 190, 1416839783, 401, 55, 6, 4, 2, 3, 0, 7, 1, 0, 5, 5, 4, 6, 8, 7, 7, 16, 1, 0, 0, 1, 1, 0, 0, 0, 0, 0, 1, 1, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '100', 0, -1, 0, 1416839783, '', '', '', 1416839864),
(351, 497, 489, 0, 'Barbarendorp', -1, 500, 500, 400, 179, 1416839783, 401, 44, 7, 6, 7, 4, 0, 7, 1, 0, 7, 11, 2, 6, 7, 12, 4, 6, 1, 0, 0, 1, 1, 0, 0, 0, 0, 0, 1, 1, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '100', 0, -1, 0, 1416839783, '', '', '', 1416839875),
(350, 506, 489, 0, 'Barbarendorp', -1, 500, 500, 400, 178, 1416839783, 404, 45, 7, 5, 6, 4, 0, 5, 1, 0, 9, 8, 8, 5, 11, 11, 6, 9, 1, 0, 0, 1, 1, 0, 0, 0, 0, 0, 1, 1, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '100', 0, -1, 0, 1416839783, '', '', '', 1416839878),
(226, 497, 503, 0, 'Aldeia+de+Ukiraki', 2, 457.77777777775, 443.11111111109, 1417.2777777777, 42, 1416570051, 100, 54, 5, 0, 0, 0, 0, 0, 1, 0, 0, 8, 6, 7, 6, 1, 1, 0, 1, 0, 0, 1, 1, 0, 0, 0, 0, 0, 1, 1, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '100', 0, -1, 0, 1416566789, '', '', '', 0),
(349, 495, 509, 0, 'Barbarendorp', -1, 500, 500, 400, 128, 1416839783, 405, 54, 5, 7, 7, 4, 0, 4, 1, 0, 3, 8, 6, 6, 14, 8, 10, 8, 1, 0, 0, 1, 1, 0, 0, 0, 0, 0, 1, 1, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '100', 0, -1, 0, 1416839783, '', '', '', 1416839876),
(348, 509, 510, 0, 'Barbarendorp', -1, 500, 500, 400, 183, 1416839783, 402, 55, 10, 3, 7, 5, 0, 8, 1, 0, 3, 7, 7, 2, 7, 7, 4, 11, 1, 0, 0, 1, 1, 0, 0, 0, 0, 0, 1, 1, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '100', 0, -1, 0, 1416839783, '', '', '', 1416839868),
(346, 512, 499, 0, 'Barbarendorp', -1, 500, 500, 400, 160, 1416839783, 403, 45, 8, 9, 3, 6, 0, 4, 1, 0, 8, 6, 8, 7, 12, 7, 4, 5, 1, 0, 0, 1, 1, 0, 0, 0, 0, 0, 1, 1, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '100', 0, -1, 0, 1416839783, '', '', '', 1416839872),
(347, 496, 491, 0, 'Barbarendorp', -1, 500, 500, 400, 228, 1416839783, 404, 44, 8, 1, 4, 7, 0, 10, 1, 0, 8, 5, 2, 4, 3, 12, 6, 7, 1, 0, 0, 1, 1, 0, 0, 0, 0, 0, 1, 1, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '100', 0, -1, 0, 1416839783, '', '', '', 1416839861),
(345, 497, 512, 0, 'Barbarendorp', -1, 500, 500, 400, 132, 1416839783, 408, 54, 7, 6, 8, 10, 0, 2, 1, 0, 4, 5, 4, 9, 6, 4, 5, 6, 1, 0, 0, 1, 1, 0, 0, 0, 0, 0, 1, 1, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '100', 0, -1, 0, 1416839783, '', '', '', 1416839859),
(344, 506, 512, 0, 'Barbarendorp', -1, 500, 500, 400, 134, 1416839783, 404, 55, 6, 9, 5, 9, 0, 3, 1, 0, 6, 4, 6, 6, 11, 5, 7, 3, 1, 0, 0, 1, 1, 0, 0, 0, 0, 0, 1, 1, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '100', 0, -1, 0, 1416839783, '', '', '', 1416839865),
(334, 506, 491, 0, 'Barbarendorp', -1, 500, 500, 400, 203, 1416839783, 410, 45, 9, 10, 5, 2, 0, 7, 1, 0, 10, 3, 3, 4, 8, 10, 5, 6, 1, 0, 0, 1, 1, 0, 0, 0, 0, 0, 1, 1, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '100', 0, -1, 0, 1416839783, '', '', '', 1416839868),
(342, 511, 496, 0, 'Barbarendorp', -1, 500, 500, 400, 161, 1416839783, 406, 45, 8, 8, 6, 7, 0, 7, 1, 0, 2, 7, 7, 4, 9, 8, 7, 5, 1, 0, 0, 1, 1, 0, 0, 0, 0, 0, 1, 1, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '100', 0, -1, 0, 1416839783, '', '', '', 1416839869),
(341, 499, 508, 0, 'Barbarendorp', -1, 500, 500, 400, 188, 1416839783, 410, 54, 9, 3, 11, 4, 0, 7, 1, 0, 7, 4, 8, 2, 5, 4, 9, 3, 1, 0, 0, 1, 1, 0, 0, 0, 0, 0, 1, 1, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '100', 0, -1, 0, 1416839783, '', '', '', 1416839861),
(337, 493, 503, 0, 'Barbarendorp', -1, 500, 500, 400, 161, 1416839783, 403, 54, 4, 7, 3, 10, 0, 4, 1, 0, 9, 9, 5, 3, 7, 4, 7, 6, 1, 0, 0, 1, 1, 0, 0, 0, 0, 0, 1, 1, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '100', 0, -1, 0, 1416839783, '', '', '', 1416839868),
(343, 489, 498, 0, 'Barbarendorp', -1, 500, 500, 400, 188, 1416839783, 401, 44, 8, 5, 6, 5, 0, 4, 1, 0, 9, 10, 5, 9, 8, 3, 8, 10, 1, 0, 0, 1, 1, 0, 0, 0, 0, 0, 1, 1, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '100', 0, -1, 0, 1416839783, '', '', '', 1416839881),
(339, 490, 496, 0, 'Barbarendorp', -1, 500, 500, 400, 193, 1416839783, 405, 44, 4, 6, 6, 7, 0, 7, 1, 0, 9, 2, 9, 3, 10, 9, 8, 4, 1, 0, 0, 1, 1, 0, 0, 0, 0, 0, 1, 1, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '100', 0, -1, 0, 1416839783, '', '', '', 1416839869),
(338, 509, 492, 0, 'Barbarendorp', -1, 500, 500, 400, 268, 1416839783, 402, 45, 6, 6, 4, 4, 0, 11, 1, 0, 8, 5, 8, 6, 6, 8, 6, 4, 1, 0, 0, 1, 1, 0, 0, 0, 0, 0, 1, 1, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '100', 0, -1, 0, 1416839783, '', '', '', 1416839867),
(336, 502, 511, 0, 'Barbarendorp', -1, 500, 500, 400, 207, 1416839783, 404, 55, 5, 7, 9, 5, 0, 9, 1, 0, 5, 5, 2, 8, 3, 8, 6, 5, 1, 0, 0, 1, 1, 0, 0, 0, 0, 0, 1, 1, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '100', 0, -1, 0, 1416839783, '', '', '', 1416839861),
(333, 494, 505, 0, 'Barbarendorp', -1, 500, 500, 400, 160, 1416839783, 401, 54, 4, 4, 10, 5, 0, 5, 1, 0, 6, 4, 6, 7, 9, 7, 9, 9, 1, 0, 0, 1, 1, 0, 0, 0, 0, 0, 1, 1, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '100', 0, -1, 0, 1416839783, '', '', '', 1416839870),
(340, 503, 514, 0, 'Barbarendorp', -1, 500, 500, 400, 156, 1416839783, 402, 55, 6, 7, 4, 8, 0, 4, 1, 0, 4, 4, 7, 10, 7, 9, 10, 9, 1, 0, 0, 1, 1, 0, 0, 0, 0, 0, 1, 1, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '100', 0, -1, 0, 1416839783, '', '', '', 1416839874),
(335, 492, 494, 0, 'Barbarendorp', -1, 500, 500, 400, 149, 1416839783, 403, 44, 8, 10, 3, 8, 0, 3, 1, 0, 6, 6, 4, 9, 8, 5, 7, 6, 1, 0, 0, 1, 1, 0, 0, 0, 0, 0, 1, 1, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '100', 0, -1, 0, 1416839783, '', '', '', 1416839869),
(332, 511, 500, 0, 'Barbarendorp', -1, 500, 500, 400, 168, 1416839783, 421, 55, 5, 3, 6, 10, 0, 6, 1, 0, 6, 8, 5, 6, 10, 2, 10, 6, 1, 0, 0, 1, 1, 0, 0, 0, 0, 0, 1, 1, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '100', 0, -1, 0, 1416839783, '', '', '', 1416839869),
(329, 497, 507, 0, 'Barbarendorp', -1, 500, 500, 400, 192, 1416839783, 402, 54, 7, 6, 4, 8, 0, 6, 1, 0, 8, 6, 10, 6, 7, 3, 8, 7, 1, 0, 0, 1, 1, 0, 0, 0, 0, 0, 1, 1, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '100', 0, -1, 0, 1416839783, '', '', '', 1416839870),
(328, 510, 503, 0, 'Barbarendorp', -1, 500, 500, 400, 189, 1416839783, 404, 55, 9, 7, 9, 5, 0, 7, 1, 0, 4, 5, 9, 7, 2, 5, 5, 6, 1, 0, 0, 1, 1, 0, 0, 0, 0, 0, 1, 1, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '100', 0, -1, 0, 1416839783, '', '', '', 1416839864),
(327, 498, 490, 0, 'Barbarendorp', -1, 500, 500, 400, 156, 1416839783, 402, 44, 8, 5, 3, 5, 0, 6, 1, 0, 5, 8, 7, 7, 14, 10, 5, 8, 1, 0, 0, 1, 1, 0, 0, 0, 0, 0, 1, 1, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '100', 0, -1, 0, 1416839783, '', '', '', 1416839877),
(326, 502, 492, 0, 'Barbarendorp', -1, 500, 500, 400, 207, 1416839783, 401, 45, 6, 5, 7, 5, 0, 8, 1, 0, 8, 5, 3, 8, 10, 7, 6, 8, 1, 0, 0, 1, 1, 0, 0, 0, 0, 0, 1, 1, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '100', 0, -1, 0, 1416839783, '', '', '', 1416839872),
(325, 498, 506, 0, 'Barbarendorp', -1, 500, 500, 400, 194, 1416839783, 405, 54, 5, 4, 3, 7, 0, 7, 1, 0, 9, 8, 5, 4, 9, 10, 10, 9, 1, 0, 0, 1, 1, 0, 0, 0, 0, 0, 1, 1, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '100', 0, -1, 0, 1416839783, '', '', '', 1416839878),
(324, 509, 506, 0, 'Barbarendorp', -1, 500, 500, 400, 173, 1416839783, 401, 55, 7, 5, 7, 8, 0, 5, 1, 0, 8, 11, 5, 4, 4, 4, 5, 8, 1, 0, 0, 1, 1, 0, 0, 0, 0, 0, 1, 1, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '100', 0, -1, 0, 1416839783, '', '', '', 1416839866),
(331, 495, 492, 0, 'Barbarendorp', -1, 500, 500, 400, 174, 1416839783, 402, 44, 5, 5, 10, 5, 0, 6, 1, 0, 6, 4, 4, 8, 8, 6, 7, 9, 1, 0, 0, 1, 1, 0, 0, 0, 0, 0, 1, 1, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '100', 0, -1, 0, 1416839783, '', '', '', 1416839870),
(330, 503, 489, 0, 'Barbarendorp', -1, 500, 500, 400, 215, 1416839783, 401, 45, 5, 6, 3, 8, 0, 8, 1, 0, 5, 5, 6, 13, 6, 9, 5, 2, 1, 0, 0, 1, 1, 0, 0, 0, 0, 0, 1, 1, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '100', 0, -1, 0, 1416839783, '', '', '', 1416839865),
(323, 498, 491, 6, 'Bonusdorp', -1, 500, 500, 400, 223, 1416839371, 405, 44, 8, 6, 7, 5, 0, 9, 1, 0, 7, 5, 3, 9, 8, 5, 7, 4, 1, 0, 0, 1, 1, 0, 0, 0, 0, 0, 1, 1, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '100', 0, -1, 0, 1416839371, '', '', '', 1416839457),
(322, 508, 500, 6, 'Bonusdorp', -1, 500, 500, 400, 173, 1416839371, 409, 55, 10, 5, 4, 5, 0, 5, 1, 0, 6, 8, 3, 9, 5, 11, 10, 11, 1, 0, 0, 1, 1, 0, 0, 0, 0, 0, 1, 1, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '100', 0, -1, 0, 1416839371, '', '', '', 1416839468),
(321, 492, 501, 6, '005+%7C+TT', 1, 249.33333333322, 249.33333333322, 1499.3333333332, 198, 1416908199, 442, 54, 5, 6, 3, 10, 0, 3, 1, 0, 10, 10, 10, 9, 8, 5, 8, 3, 1, 0, 0, 1, 1, 0, 0, 0, 0, 0, 1, 1, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '100', 1416908183, 22, 0, 1416839371, '', '', '', 1416839453),
(320, 508, 508, 6, 'Bonusdorp', -1, 500, 500, 400, 154, 1416839371, 401, 55, 8, 5, 8, 6, 0, 6, 1, 0, 3, 8, 7, 5, 9, 9, 9, 6, 1, 0, 0, 1, 1, 0, 0, 0, 0, 0, 1, 1, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '100', 0, -1, 0, 1416839371, '', '', '', 1416839464),
(319, 492, 499, 6, 'Bonusdorp', -1, 500, 500, 400, 193, 1416839371, 401, 44, 6, 10, 5, 4, 0, 7, 1, 0, 7, 6, 7, 5, 5, 6, 10, 8, 1, 0, 0, 1, 1, 0, 0, 0, 0, 0, 1, 1, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '100', 0, -1, 0, 1416839371, '', '', '', 1416839461),
(314, 506, 493, 6, 'Bonusdorp', -1, 500, 500, 400, 146, 1416839371, 401, 45, 9, 7, 9, 4, 0, 1, 1, 0, 8, 9, 4, 7, 7, 9, 7, 6, 1, 0, 0, 1, 1, 0, 0, 0, 0, 0, 1, 1, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '100', 0, -1, 0, 1416839371, '', '', '', 1416839459);
INSERT INTO `villages` (`id`, `x`, `y`, `bonus`, `name`, `userid`, `r_wood`, `r_stone`, `r_iron`, `r_bh`, `last_prod_aktu`, `points`, `continent`, `main`, `barracks`, `stable`, `garage`, `snob`, `smith`, `place`, `statue`, `market`, `wood`, `stone`, `iron`, `storage`, `farm`, `hide`, `wall`, `unit_spear_tec_level`, `unit_sword_tec_level`, `unit_axe_tec_level`, `unit_archer_tec_level`, `unit_spy_tec_level`, `unit_light_tec_level`, `unit_marcher_tec_level`, `unit_heavy_tec_level`, `unit_ram_tec_level`, `unit_catapult_tec_level`, `unit_knight_tec_level`, `unit_snob_tec_level`, `trader_away`, `main_build`, `all_unit_spear`, `all_unit_sword`, `all_unit_axe`, `all_unit_archer`, `all_unit_spy`, `all_unit_light`, `all_unit_marcher`, `all_unit_heavy`, `all_unit_ram`, `all_unit_catapult`, `all_unit_knight`, `all_unit_snob`, `recruited_snobs`, `control_villages`, `attacks`, `agreement`, `agreement_aktu`, `snobed_by`, `dealers_outside`, `create_time`, `smith_tec`, `conmap_con`, `group`, `l_grow`) VALUES
(313, 497, 506, 6, 'Bonusdorp', -1, 500, 500, 400, 206, 1416839371, 405, 54, 10, 6, 6, 4, 0, 7, 1, 0, 5, 10, 11, 7, 1, 2, 10, 6, 1, 0, 0, 1, 1, 0, 0, 0, 0, 0, 1, 1, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '100', 0, -1, 0, 1416839371, '', '', '', 1416839461),
(312, 503, 511, 6, 'Bonusdorp', -1, 500, 500, 400, 200, 1416839371, 401, 55, 7, 5, 7, 7, 0, 8, 1, 0, 3, 9, 7, 9, 4, 4, 7, 6, 1, 0, 0, 1, 1, 0, 0, 0, 0, 0, 1, 1, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '100', 0, -1, 0, 1416839371, '', '', '', 1416839456),
(311, 495, 494, 6, 'Bonusdorp', -1, 500, 500, 400, 192, 1416839371, 404, 44, 7, 7, 7, 5, 0, 7, 1, 0, 8, 4, 6, 5, 10, 5, 9, 7, 1, 0, 0, 1, 1, 0, 0, 0, 0, 0, 1, 1, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '100', 0, -1, 0, 1416839371, '', '', '', 1416839465),
(310, 503, 492, 6, 'Bonusdorp', -1, 500, 500, 400, 176, 1416839371, 403, 45, 8, 9, 5, 7, 0, 5, 1, 0, 6, 9, 8, 9, 4, 7, 7, 1, 1, 0, 0, 1, 1, 0, 0, 0, 0, 0, 1, 1, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '100', 0, -1, 0, 1416839371, '', '', '', 1416839454),
(309, 500, 506, 6, 'Bonusdorp', -1, 500, 500, 400, 208, 1416839371, 412, 55, 6, 5, 3, 8, 0, 9, 1, 0, 5, 9, 9, 4, 5, 10, 10, 2, 1, 0, 0, 1, 1, 0, 0, 0, 0, 0, 1, 1, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '100', 0, -1, 0, 1416839371, '', '', '', 1416839458),
(307, 498, 493, 6, 'Bonusdorp', -1, 500, 500, 400, 180, 1416839371, 403, 44, 7, 4, 8, 8, 0, 6, 1, 0, 7, 2, 5, 9, 6, 7, 7, 6, 1, 0, 0, 1, 1, 0, 0, 0, 0, 0, 1, 1, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '100', 0, -1, 0, 1416839371, '', '', '', 1416839454),
(305, 495, 503, 6, 'Bonusdorp', -1, 500, 500, 400, 290, 1416839371, 405, 54, 8, 6, 3, 3, 0, 10, 1, 0, 12, 6, 5, 7, 5, 3, 7, 4, 1, 0, 0, 1, 1, 0, 0, 0, 0, 0, 1, 1, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '100', 0, -1, 0, 1416839371, '', '', '', 1416839450),
(318, 508, 495, 6, 'Bonusdorp', -1, 500, 500, 400, 240, 1416839371, 411, 45, 5, 4, 5, 8, 0, 10, 1, 0, 5, 6, 4, 11, 7, 5, 4, 5, 1, 0, 0, 1, 1, 0, 0, 0, 0, 0, 1, 1, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '100', 0, -1, 0, 1416839371, '', '', '', 1416839451),
(317, 493, 504, 6, 'Bonusdorp', -1, 500, 500, 400, 179, 1416839371, 403, 54, 9, 3, 5, 8, 0, 7, 1, 0, 6, 5, 4, 4, 2, 9, 8, 11, 1, 0, 0, 1, 1, 0, 0, 0, 0, 0, 1, 1, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '100', 0, -1, 0, 1416839371, '', '', '', 1416839453),
(304, 508, 502, 6, 'Bonusdorp', -1, 500, 500, 400, 173, 1416839371, 403, 55, 7, 4, 9, 5, 0, 6, 1, 0, 6, 9, 6, 8, 10, 7, 7, 4, 1, 0, 0, 1, 1, 0, 0, 0, 0, 0, 1, 1, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '100', 0, -1, 0, 1416839371, '', '', '', 1416839463),
(302, 506, 498, 6, 'Bonusdorp', -1, 500, 500, 400, 174, 1416839371, 403, 45, 13, 6, 4, 4, 0, 3, 1, 0, 9, 7, 7, 8, 7, 8, 8, 5, 1, 0, 0, 1, 1, 0, 0, 0, 0, 0, 1, 1, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '100', 0, -1, 0, 1416839371, '', '', '', 1416839459),
(300, 507, 504, 6, 'Bonusdorp', -1, 500, 500, 400, 170, 1416839371, 401, 55, 5, 6, 9, 8, 0, 7, 1, 0, 4, 5, 8, 3, 4, 3, 8, 5, 1, 0, 0, 1, 1, 0, 0, 0, 0, 0, 1, 1, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '100', 0, -1, 0, 1416839371, '', '', '', 1416839450),
(299, 505, 495, 6, 'Bonusdorp', -1, 500, 500, 400, 138, 1416839371, 402, 45, 10, 3, 5, 10, 0, 3, 1, 0, 6, 6, 4, 5, 5, 6, 7, 9, 1, 0, 0, 1, 1, 0, 0, 0, 0, 0, 1, 1, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '100', 0, -1, 0, 1416839371, '', '', '', 1416839452),
(293, 498, 500, 0, 'Barbarendorp', -1, 500, 500, 400, 164, 1416839358, 406, 54, 6, 9, 7, 5, 0, 4, 1, 0, 9, 9, 6, 3, 10, 7, 8, 3, 1, 0, 0, 1, 1, 0, 0, 0, 0, 0, 1, 1, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '100', 0, -1, 0, 1416839358, '', '', '', 1416839445),
(294, 502, 508, 6, 'Bonusdorp', -1, 500, 500, 400, 195, 1416839371, 401, 55, 7, 8, 2, 5, 0, 5, 1, 0, 9, 6, 6, 10, 9, 7, 7, 10, 1, 0, 0, 1, 1, 0, 0, 0, 0, 0, 1, 1, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '100', 0, -1, 0, 1416839371, '', '', '', 1416839463),
(290, 500, 502, 0, 'Barbarendorp', -1, 500, 500, 400, 202, 1416839358, 403, 55, 6, 7, 8, 4, 0, 7, 1, 0, 8, 5, 6, 8, 3, 10, 6, 8, 1, 0, 0, 1, 1, 0, 0, 0, 0, 0, 1, 1, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '100', 0, -1, 0, 1416839358, '', '', '', 1416839449),
(287, 500, 498, 0, 'Barbarendorp', -1, 500, 500, 400, 198, 1416839358, 403, 45, 6, 4, 9, 3, 0, 7, 1, 0, 8, 4, 6, 9, 8, 10, 9, 5, 1, 0, 0, 1, 1, 0, 0, 0, 0, 0, 1, 1, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '100', 0, -1, 0, 1416839358, '', '', '', 1416839445),
(286, 500, 497, 0, 'Barbarendorp', -1, 500, 500, 400, 182, 1416839358, 404, 45, 8, 5, 7, 5, 0, 6, 1, 0, 9, 4, 4, 3, 9, 9, 4, 11, 1, 0, 0, 1, 1, 0, 0, 0, 0, 0, 1, 1, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '100', 0, -1, 0, 1416839358, '', '', '', 1416839442),
(316, 506, 509, 6, 'Bonusdorp', -1, 500, 500, 400, 221, 1416839371, 403, 55, 8, 4, 5, 3, 0, 9, 1, 0, 4, 9, 9, 10, 7, 11, 8, 4, 1, 0, 0, 1, 1, 0, 0, 0, 0, 0, 1, 1, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '100', 0, -1, 0, 1416839371, '', '', '', 1416839464),
(315, 494, 496, 6, 'Bonusdorp', -1, 500, 500, 400, 158, 1416839371, 403, 44, 9, 10, 3, 6, 0, 3, 1, 0, 5, 4, 3, 12, 7, 8, 10, 4, 1, 0, 0, 1, 1, 0, 0, 0, 0, 0, 1, 1, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '100', 0, -1, 0, 1416839371, '', '', '', 1416839455),
(298, 498, 504, 6, 'Bonusdorp', -1, 500, 500, 400, 175, 1416839371, 403, 54, 11, 6, 8, 4, 0, 4, 1, 0, 7, 5, 10, 7, 3, 4, 10, 6, 1, 0, 0, 1, 1, 0, 0, 0, 0, 0, 1, 1, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '100', 0, -1, 0, 1416839371, '', '', '', 1416839457),
(285, 504, 502, 0, 'Barbarendorp', -1, 500, 500, 400, 169, 1416839358, 404, 55, 8, 0, 9, 8, 0, 5, 1, 0, 7, 7, 6, 8, 10, 5, 8, 4, 1, 0, 0, 1, 1, 0, 0, 0, 0, 0, 1, 1, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '100', 0, -1, 0, 1416839358, '', '', '', 1416839444),
(291, 501, 496, 0, 'Barbarendorp', -1, 500, 500, 400, 186, 1416839358, 408, 45, 9, 9, 6, 6, 0, 7, 1, 0, 5, 4, 3, 9, 8, 5, 6, 6, 1, 0, 0, 1, 1, 0, 0, 0, 0, 0, 1, 1, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '100', 0, -1, 0, 1416839358, '', '', '', 1416839442),
(303, 500, 495, 6, 'Bonusdorp', -1, 500, 500, 400, 140, 1416839371, 405, 45, 8, 5, 5, 9, 0, 2, 1, 0, 6, 3, 11, 5, 7, 10, 8, 7, 1, 0, 0, 1, 1, 0, 0, 0, 0, 0, 1, 1, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '100', 0, -1, 0, 1416839371, '', '', '', 1416839458),
(296, 502, 494, 6, 'Bonusdorp', -1, 500, 500, 400, 227, 1416839371, 402, 45, 10, 9, 5, 0, 0, 10, 1, 0, 5, 4, 7, 5, 9, 11, 6, 3, 1, 0, 0, 1, 1, 0, 0, 0, 0, 0, 1, 1, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '100', 0, -1, 0, 1416839371, '', '', '', 1416839457),
(289, 495, 498, 0, 'Barbarendorp', -1, 500, 500, 400, 241, 1416839358, 410, 44, 6, 7, 8, 2, 0, 11, 1, 0, 4, 6, 7, 3, 8, 6, 4, 5, 1, 0, 0, 1, 1, 0, 0, 0, 0, 0, 1, 1, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '100', 0, -1, 0, 1416839358, '', '', '', 1416839437),
(295, 496, 502, 6, 'Bonusdorp', -1, 500, 500, 400, 151, 1416839371, 404, 54, 6, 4, 5, 10, 0, 4, 1, 0, 6, 11, 6, 6, 4, 7, 6, 7, 1, 0, 0, 1, 1, 0, 0, 0, 0, 0, 1, 1, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '100', 0, -1, 0, 1416839371, '', '', '', 1416839457),
(292, 501, 505, 0, 'Barbarendorp', -1, 500, 500, 400, 123, 1416839358, 402, 55, 8, 3, 9, 9, 0, 3, 1, 0, 3, 7, 5, 4, 5, 7, 10, 6, 1, 0, 0, 1, 1, 0, 0, 0, 0, 0, 1, 1, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '100', 0, -1, 0, 1416839358, '', '', '', 1416839441),
(297, 505, 506, 6, 'Bonusdorp', -1, 500, 500, 400, 281, 1416839371, 414, 55, 4, 3, 5, 6, 0, 11, 1, 0, 8, 9, 8, 8, 6, 3, 4, 6, 1, 0, 0, 1, 1, 0, 0, 0, 0, 0, 1, 1, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '100', 0, -1, 0, 1416839371, '', '', '', 1416839453),
(308, 500, 508, 6, 'Bonusdorp', -1, 500, 500, 400, 177, 1416839371, 404, 55, 6, 4, 12, 5, 0, 8, 1, 0, 4, 2, 3, 5, 5, 5, 4, 1, 1, 0, 0, 1, 1, 0, 0, 0, 0, 0, 1, 1, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '100', 0, -1, 0, 1416839371, '', '', '', 1416839436),
(288, 498, 495, 0, 'Barbarendorp', -1, 500, 500, 400, 210, 1416839358, 402, 44, 7, 8, 8, 2, 0, 7, 1, 0, 10, 4, 3, 7, 9, 4, 9, 3, 1, 0, 0, 1, 1, 0, 0, 0, 0, 0, 1, 1, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '100', 0, -1, 0, 1416839358, '', '', '', 1416839442),
(284, 502, 498, 0, 'Barbarendorp', -1, 500, 500, 400, 142, 1416839358, 403, 45, 5, 7, 9, 7, 0, 4, 1, 0, 6, 8, 3, 6, 10, 6, 5, 6, 1, 0, 0, 1, 1, 0, 0, 0, 0, 0, 1, 1, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '100', 0, -1, 0, 1416839358, '', '', '', 1416839441),
(301, 498, 505, 6, 'Bonusdorp', -1, 500, 500, 400, 162, 1416839371, 404, 54, 11, 6, 7, 7, 0, 3, 1, 0, 7, 4, 5, 9, 5, 4, 7, 8, 1, 0, 0, 1, 1, 0, 0, 0, 0, 0, 1, 1, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '100', 0, -1, 0, 1416839371, '', '', '', 1416839456),
(306, 501, 493, 6, 'Bonusdorp', -1, 500, 500, 400, 182, 1416839371, 402, 45, 5, 8, 8, 5, 0, 6, 1, 0, 7, 3, 3, 8, 6, 4, 9, 10, 1, 0, 0, 1, 1, 0, 0, 0, 0, 0, 1, 1, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '100', 0, -1, 0, 1416839371, '', '', '', 1416839452);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

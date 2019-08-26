--saravanan -20-apr-2014
CREATE TABLE IF NOT EXISTS `category_file_map` (
  `file_id` int(11) NOT NULL AUTO_INCREMENT,
  `category_id` int(11) NOT NULL,
  `file_name` varchar(255) DEFAULT NULL,
  `category_file` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`file_id`),
  KEY `category_id` (`category_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;


ALTER TABLE `category_file_map`
  ADD CONSTRAINT `category_file_map_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `category` (`category_id`);

---Guna 07-05-2015---
CREATE TABLE IF NOT EXISTS `album` (
  `album_id` int(11) NOT NULL AUTO_INCREMENT,
  `album_name` varchar(255) DEFAULT NULL,
  `album_slug` varchar(500) NOT NULL,
  `created_on` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `album_image` varchar(255) DEFAULT NULL,
  `status` varchar(255) NOT NULL DEFAULT 'active',
  PRIMARY KEY (`album_id`)
);
CREATE TABLE IF NOT EXISTS `home_banners` (
  `banner_id` int(11) NOT NULL AUTO_INCREMENT,
  `banner` varchar(500) DEFAULT NULL,
  `url` varchar(1000) NOT NULL DEFAULT 'javascript:void(0);',
  `status` varchar(255) DEFAULT NULL,
  `added_on` datetime DEFAULT NULL,
  PRIMARY KEY (`banner_id`)
);
ALTER TABLE  `home_banners` ADD  `caption` TEXT NULL DEFAULT NULL AFTER  `banner` ;

---Guna 08-05-2015---
DROP TABLE IF EXISTS `album_gallery`;
		
CREATE TABLE `album_gallery` (
  `galery_id` INT(11) NOT NULL AUTO_INCREMENT,
  `album_id` INT(11) NOT NULL,
  `caption` VARCHAR(255) NULL DEFAULT NULL,
  `gallery_image` MEDIUMTEXT NULL DEFAULT NULL,
  PRIMARY KEY (`galery_id`)
);
ALTER TABLE `album_gallery` ADD FOREIGN KEY (album_id) REFERENCES `album` (`album_id`);

---Guna 11-05-2015---
ALTER TABLE  `album` ADD  `short_desc` VARCHAR( 500 ) NULL DEFAULT NULL AFTER  `album_slug` ;
--saravanan 12-may-2015
ALTER TABLE  `download_category` ADD  `parent_id` INT( 11 ) NOT NULL DEFAULT  '0' AFTER  `category_slug` ;

--saravanan 13-may-2015
CREATE TABLE IF NOT EXISTS `global_config` (
  `config_id` int(11) NOT NULL AUTO_INCREMENT,
  `display_name` varchar(255) NOT NULL,
  `global_name` varchar(255) DEFAULT NULL,
  `global_value` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`config_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `global_config`
--

INSERT INTO `global_config` (`config_id`, `display_name`, `global_name`, `global_value`) VALUES
(1, 'Admin Email', 'admin_email', 'saravanan@deforay.com'),
(2, 'Admin From Name', 'admin_name', 'slmta support one');


--saravanan 21-may-2015
ALTER TABLE  `events` ADD  `event_slug` VARCHAR( 255 ) NULL DEFAULT NULL AFTER  `event_name` ;

ALTER TABLE  `accredited_labs` ADD  `recommended_status` VARCHAR( 255 ) NULL DEFAULT NULL AFTER  `lab_id` ;

--saravanan 25-may-2015

INSERT INTO `global_config` (`config_id`, `display_name`, `global_name`, `global_value`) VALUES
(null, 'Legend', 'mng_legend', '<p><strong>CAP</strong>&nbsp;- College of American Pathologists&nbsp;<strong>KENAS</strong>&nbsp;- Kenya Accreditation Service&nbsp;<strong>SADCAS</strong>&nbsp;- The South African National Accreditation System&nbsp;<strong>IPAC</strong>&nbsp;- Instituto Portugues de Acreditacao</p>\r\n');

-- Amit 29-Jun-2015
ALTER TABLE `album` ADD `album_order` INT NOT NULL DEFAULT '0' AFTER `album_image`;

--saravanan 10-jul-2015
ALTER TABLE  `album_gallery` ADD  `youtube_url` VARCHAR( 255 ) NULL DEFAULT NULL ,
ADD  `video_file` VARCHAR( 255 ) NULL DEFAULT NULL ;

--saravanan 13-jul-2015
ALTER TABLE  `album_gallery` ADD  `choose_file` VARCHAR( 255 ) NULL DEFAULT NULL;

--saravanan 7-aug-2015
ALTER TABLE  `accredited_labs` ADD  `lessons_learned` VARCHAR( 255 ) NULL DEFAULT NULL ;

---Guna 19-aug-2015

CREATE TABLE IF NOT EXISTS `user_roles` (
  `user_role_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_role_name` varchar(255) NOT NULL,
  PRIMARY KEY (`user_role_id`)
);

INSERT INTO `user_roles` (`user_role_id`, `user_role_name`) VALUES
(1, 'Super Admin'),
(2, 'Manager'),
(3, 'Partner');

CREATE TABLE IF NOT EXISTS `user` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(255) DEFAULT NULL,
  `gender` varchar(255) DEFAULT NULL,
  `alternate_email` varchar(255) DEFAULT NULL,
  `address` text,
  `email` mediumtext NOT NULL,
  `password` mediumtext NOT NULL,
  `contact_no` int(11) DEFAULT NULL,
  `alternate_contact` int(11) DEFAULT NULL,
  `role` int(11) NOT NULL,
  `status` varchar(255) DEFAULT NULL,
  `added_on` date NOT NULL,
  PRIMARY KEY (`user_id`),
  KEY `role` (`role`)
);

ALTER TABLE `user`
  ADD CONSTRAINT `user_ibfk_1` FOREIGN KEY (`role`) REFERENCES `user_roles` (`user_role_id`);

CREATE TABLE IF NOT EXISTS `lab_profile` (
  `lab_profile_id` int(11) NOT NULL AUTO_INCREMENT,
  `audit_date` date DEFAULT NULL,
  `last_audit_date` date DEFAULT NULL,
  `auditor_name` varchar(255) DEFAULT NULL,
  `audit_status` varchar(255) DEFAULT NULL,
  `laboratory_name` varchar(255) DEFAULT NULL,
  `laboratory_address` text,
  `laboratory_number` varchar(255) DEFAULT NULL,
  `laboratory_telephone` int(11) DEFAULT NULL,
  `laboratory_fax` varchar(255) DEFAULT NULL,
  `laboratory_head` varchar(255) DEFAULT NULL,
  `laboratory_email` varchar(255) DEFAULT NULL,
  `head_telephone` int(11) DEFAULT NULL,
  `laboratory_level` varchar(255) DEFAULT NULL,
  `laboratory_type` varchar(255) DEFAULT NULL,
  `other_laboratory_type` varchar(255) DEFAULT NULL,
  `degree_holding` varchar(255) DEFAULT NULL,
  `degree_holding_operation` varchar(255) DEFAULT NULL,
  `diploma_staff` varchar(255) DEFAULT NULL,
  `diploma_staff_operation` varchar(255) DEFAULT NULL,
  `certificate_holding` varchar(255) DEFAULT NULL,
  `certificate_holding_operation` varchar(255) DEFAULT NULL,
  `microscopist` varchar(255) DEFAULT NULL,
  `microscopist_operation` varchar(255) DEFAULT NULL,
  `data_clerk` varchar(255) DEFAULT NULL,
  `data_clerk_operation` varchar(255) DEFAULT NULL,
  `phlebotomist` varchar(255) DEFAULT NULL,
  `phlebotomist_operation` varchar(255) DEFAULT NULL,
  `cleaner` varchar(255) DEFAULT NULL,
  `cleaner_operation` varchar(255) DEFAULT NULL,
  `dedicated_cleaner` varchar(255) DEFAULT NULL,
  `trainer_cleaner` varchar(255) DEFAULT NULL,
  `driver` varchar(255) DEFAULT NULL,
  `driver_operation` varchar(255) DEFAULT NULL,
  `dedicated_driver` varchar(255) DEFAULT NULL,
  `trained_driver` varchar(255) DEFAULT NULL,
  `other_specification` varchar(255) DEFAULT NULL,
  `other_specification_operation` varchar(255) DEFAULT NULL,
  `sufficient_space` varchar(255) DEFAULT NULL,
  `equipment` varchar(255) DEFAULT NULL,
  `supplies` varchar(255) DEFAULT NULL,
  `personnel` varchar(255) DEFAULT NULL,
  `infrastructure` varchar(255) DEFAULT NULL,
  `other_lab_details` text,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`lab_profile_id`),
  KEY `user_id` (`user_id`)
);

ALTER TABLE `lab_profile`
  ADD CONSTRAINT `lab_profile_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`);
  
--------------------------------- Guna --- 28-Aug-2015-------
  ALTER TABLE  `lab_profile` ADD  `audit_type` VARCHAR( 255 ) NULL DEFAULT NULL AFTER  `audit_date` ,
ADD  `cohort` VARCHAR( 255 ) NULL DEFAULT NULL AFTER  `audit_type` ;
  
  UPDATE  `slmta`.`user_roles` SET  `user_role_name` =  'Country Manager' WHERE  `user_roles`.`user_role_id` =2;
  UPDATE  `slmta`.`user_roles` SET  `user_role_name` =  'HQ Manager' WHERE  `user_roles`.`user_role_id` =3;
  INSERT INTO `slmta`.`user_roles` (`user_role_id`, `user_role_name`) VALUES (NULL, 'Lab');
  
  CREATE TABLE IF NOT EXISTS `countries` (
  `country_id` int(11) NOT NULL AUTO_INCREMENT,
  `country_name` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`country_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=8 ;

--
-- Dumping data for table `countries`
--

INSERT INTO `countries` (`country_id`, `country_name`) VALUES
(1, 'Cameroon'),
(2, 'Ethiopia'),
(3, 'Kenya'),
(4, 'Malawi'),
(5, 'Tanzania'),
(6, 'Uganda'),
(7, 'Zambia');

ALTER TABLE  `lab_profile` ADD  `laboratory_country` VARCHAR( 255 ) NULL DEFAULT NULL AFTER  `laboratory_address` ;

-------------------------Guna -------- 03-Sept-2015-----------

DROP TABLE IF EXISTS `audit_score_2012`;
		
DROP TABLE IF EXISTS `audit_score_2012`;
		
CREATE TABLE `audit_score_2012` (
  `audit_score_id` INTEGER(11) NOT NULL AUTO_INCREMENT,
  `lab_profile_id` INTEGER(11) NOT NULL,
  `documents_and_records` VARCHAR(255) NULL DEFAULT NULL,
  `management_reviews` VARCHAR(255) NULL DEFAULT NULL,
  `organization_and_personnel` VARCHAR(255) NULL DEFAULT NULL,
  `client_management_and_customer_service` VARCHAR(255) NULL DEFAULT NULL,
  `equipment` VARCHAR(255) NULL DEFAULT NULL,
  `internal_audit` VARCHAR(255) NULL DEFAULT NULL,
  `purchasing_and_inventory` VARCHAR(255) NULL DEFAULT NULL,
  `process_control_and_internal_and_external_quality_assessment` VARCHAR(255) NULL DEFAULT NULL,
  `information_management` VARCHAR(255) NULL DEFAULT NULL,
  `corrective_action` VARCHAR(255) NULL DEFAULT NULL,
  `occurrence_management_and_process_improvement` VARCHAR(255) NULL DEFAULT NULL,
  `facilities_and_safety` VARCHAR(255) NULL DEFAULT NULL,
  PRIMARY KEY (`audit_score_id`)
);

DROP TABLE IF EXISTS `audit_score_2015`;
		
CREATE TABLE `audit_score_2015` (
  `audit_score_id` INTEGER(11) NOT NULL AUTO_INCREMENT,
  `lab_profile_id` INTEGER(11) NOT NULL,
  `documents_and_records` VARCHAR(255) NULL DEFAULT NULL,
  `management_reviews` VARCHAR(255) NULL DEFAULT NULL,
  `organization_and_personnel` VARCHAR(255) NULL DEFAULT NULL,
  `client_management_and_customer_service` VARCHAR(255) NULL DEFAULT NULL,
  `equipment` VARCHAR(255) NULL DEFAULT NULL,
  `internal_audit` VARCHAR(255) NULL DEFAULT NULL,
  `purchasing_and_inventory` VARCHAR(255) NULL DEFAULT NULL,
  `process_control_and_internal_and_external_quality_assessment` VARCHAR(255) NULL DEFAULT NULL,
  `information_management` VARCHAR(255) NULL DEFAULT NULL,
  `corrective_action` VARCHAR(255) NULL DEFAULT NULL,
  `occurrence_management_and_process_improvement` VARCHAR(255) NULL DEFAULT NULL,
  `facilities_and_safety` VARCHAR(255) NULL DEFAULT NULL,
  PRIMARY KEY (`audit_score_id`)
);

ALTER TABLE `audit_score_2012` ADD FOREIGN KEY (lab_profile_id) REFERENCES `lab_profile` (`lab_profile_id`);
ALTER TABLE `audit_score_2015` ADD FOREIGN KEY (lab_profile_id) REFERENCES `lab_profile` (`lab_profile_id`);

ALTER TABLE  `lab_profile` ADD  `audit_score_version` VARCHAR( 255 ) NULL DEFAULT NULL AFTER  `user_id` ;
ALTER TABLE  `lab_profile` ADD  `total_audit_score` VARCHAR( 255 ) NULL DEFAULT NULL AFTER  `audit_score_version` ;


-- Amit 24 Oc 2015


CREATE TABLE IF NOT EXISTS `lab_types` (
`lab_type_id` int(11) NOT NULL,
  `lab_type_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

ALTER TABLE `lab_types` ADD PRIMARY KEY (`lab_type_id`);
ALTER TABLE `lab_types` MODIFY `lab_type_id` int(11) NOT NULL AUTO_INCREMENT;
INSERT INTO `lab_types` (`lab_type_id`, `lab_type_name`) VALUES ('1', 'National'), ('2', 'Regional or Provincial');
INSERT INTO `lab_types` (`lab_type_id`, `lab_type_name`) VALUES ('3', 'District or Primary'), ('4', 'NGO, faith-based, or private or Primary');
INSERT INTO `lab_types` (`lab_type_id`, `lab_type_name`) VALUES ('5', 'Military'), ('6', 'Blood Bank/Blood Transfusion Services');


-- Amit 25 Oct 2015

ALTER TABLE `cohort_labs` ADD `approval_status` VARCHAR(255) NOT NULL DEFAULT 'pending' AFTER `graduated`;
ALTER TABLE `cohort_labs` ADD `comments` TEXT NULL DEFAULT NULL AFTER `approval_status`;

--- Guna 28 Oct 2015
ALTER TABLE  `countries` ADD  `status` VARCHAR( 255 ) NULL DEFAULT NULL AFTER  `country_name` ;
ALTER TABLE  `lab_audits` ADD  `approval_status` VARCHAR( 255 ) NOT NULL DEFAULT  'pending' AFTER  `latest_audit` ;

--Guna 29 Oct 2015
ALTER TABLE  `user` ADD  `mail_to` TEXT NULL DEFAULT NULL AFTER  `role` ;
ALTER TABLE  `user` ADD  `unique_id` TEXT NULL DEFAULT NULL AFTER  `mail_to` ;

CREATE TABLE IF NOT EXISTS `mail_template` (
  `mail_temp_id` int(11) NOT NULL AUTO_INCREMENT,
  `mail_purpose` varchar(255) NOT NULL,
  `from_name` varchar(255) DEFAULT NULL,
  `mail_from` varchar(255) DEFAULT NULL,
  `mail_subject` varchar(255) DEFAULT NULL,
  `mail_content` text,
  `mail_footer` text,
  PRIMARY KEY (`mail_temp_id`)
);

INSERT INTO `mail_template` (`mail_temp_id`, `mail_purpose`, `from_name`, `mail_from`, `mail_subject`, `mail_content`, `mail_footer`) VALUES
(1, 'userActivation', 'SLMTA', 'slmtalabs@gmail.com', 'SLMTA account activation mail', 'HI<b> ##USER## ,</b><b><br><br></b>Thank you for registering with SLMTA.You are just a click away to activate your account first.To activate please click here <b>##URL## </b>or copy and paste this url in the browser <b>##URLWITHOUTLINK##. </b>Your login credentials are<b> </b><b>##EMAIL## , </b><b>##PASSWORD##</b> <br><br>Have a great time!<b><br></b><br>Regards<br>SLMTA Team', 'This is a confidential mail plz don''t replay to this mail');


-- Amit 30 Oct 2015
--ALTER TABLE `audit_score_2012` ADD `submitter_comments` TEXT NULL DEFAULT NULL AFTER `facilities_and_safety`;
--ALTER TABLE `audit_score_2015` ADD `submitter_comments` TEXT NULL DEFAULT NULL AFTER `facilities_and_safety`;


-- Amit 03 Nov 2015

DROP TABLE `countries`;
CREATE TABLE IF NOT EXISTS `countries` (
  `country_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `country_name` varchar(255) COLLATE utf8_bin NOT NULL,
  `iso2` varchar(2) COLLATE utf8_bin NOT NULL,
  `iso3` varchar(3) COLLATE utf8_bin NOT NULL,
  `numeric_code` smallint(6) NOT NULL,
  `status` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT 'inactive',
  PRIMARY KEY (`country_id`),
  UNIQUE KEY `country_id` (`country_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=250 ;


INSERT INTO `countries` (`country_id`, `country_name`, `iso2`, `iso3`, `numeric_code`, `status`) VALUES
(1, 'Afghanistan', 'AF', 'AFG', 4, 'inactive'),
(2, 'Aland Islands', 'AX', 'ALA', 248, 'inactive'),
(3, 'Albania', 'AL', 'ALB', 8, 'inactive'),
(4, 'Algeria', 'DZ', 'DZA', 12, 'inactive'),
(5, 'American Samoa', 'AS', 'ASM', 16, 'inactive'),
(6, 'Andorra', 'AD', 'AND', 20, 'inactive'),
(7, 'Angola', 'AO', 'AGO', 24, 'inactive'),
(8, 'Anguilla', 'AI', 'AIA', 660, 'inactive'),
(9, 'Antarctica', 'AQ', 'ATA', 10, 'inactive'),
(10, 'Antigua and Barbuda', 'AG', 'ATG', 28, 'inactive'),
(11, 'Argentina', 'AR', 'ARG', 32, 'inactive'),
(12, 'Armenia', 'AM', 'ARM', 51, 'inactive'),
(13, 'Aruba', 'AW', 'ABW', 533, 'inactive'),
(14, 'Australia', 'AU', 'AUS', 36, 'inactive'),
(15, 'Austria', 'AT', 'AUT', 40, 'inactive'),
(16, 'Azerbaijan', 'AZ', 'AZE', 31, 'inactive'),
(17, 'Bahamas', 'BS', 'BHS', 44, 'inactive'),
(18, 'Bahrain', 'BH', 'BHR', 48, 'inactive'),
(19, 'Bangladesh', 'BD', 'BGD', 50, 'inactive'),
(20, 'Barbados', 'BB', 'BRB', 52, 'inactive'),
(21, 'Belarus', 'BY', 'BLR', 112, 'inactive'),
(22, 'Belgium', 'BE', 'BEL', 56, 'inactive'),
(23, 'Belize', 'BZ', 'BLZ', 84, 'inactive'),
(24, 'Benin', 'BJ', 'BEN', 204, 'inactive'),
(25, 'Bermuda', 'BM', 'BMU', 60, 'inactive'),
(26, 'Bhutan', 'BT', 'BTN', 64, 'inactive'),
(27, 'Bolivia, Plurinational State of', 'BO', 'BOL', 68, 'inactive'),
(28, 'Bonaire, Sint Eustatius and Saba', 'BQ', 'BES', 535, 'inactive'),
(29, 'Bosnia and Herzegovina', 'BA', 'BIH', 70, 'inactive'),
(30, 'Botswana', 'BW', 'BWA', 72, 'inactive'),
(31, 'Bouvet Island', 'BV', 'BVT', 74, 'inactive'),
(32, 'Brazil', 'BR', 'BRA', 76, 'inactive'),
(33, 'British Indian Ocean Territory', 'IO', 'IOT', 86, 'inactive'),
(34, 'Brunei Darussalam', 'BN', 'BRN', 96, 'inactive'),
(35, 'Bulgaria', 'BG', 'BGR', 100, 'inactive'),
(36, 'Burkina Faso', 'BF', 'BFA', 854, 'inactive'),
(37, 'Burundi', 'BI', 'BDI', 108, 'inactive'),
(38, 'Cambodia', 'KH', 'KHM', 116, 'inactive'),
(39, 'Cameroon', 'CM', 'CMR', 120, 'active'),
(40, 'Canada', 'CA', 'CAN', 124, 'inactive'),
(41, 'Cape Verde', 'CV', 'CPV', 132, 'inactive'),
(42, 'Cayman Islands', 'KY', 'CYM', 136, 'inactive'),
(43, 'Central African Republic', 'CF', 'CAF', 140, 'inactive'),
(44, 'Chad', 'TD', 'TCD', 148, 'inactive'),
(45, 'Chile', 'CL', 'CHL', 152, 'inactive'),
(46, 'China', 'CN', 'CHN', 156, 'inactive'),
(47, 'Christmas Island', 'CX', 'CXR', 162, 'inactive'),
(48, 'Cocos (Keeling) Islands', 'CC', 'CCK', 166, 'inactive'),
(49, 'Colombia', 'CO', 'COL', 170, 'inactive'),
(50, 'Comoros', 'KM', 'COM', 174, 'inactive'),
(51, 'Congo', 'CG', 'COG', 178, 'inactive'),
(52, 'Congo, the Democratic Republic of the', 'CD', 'COD', 180, 'inactive'),
(53, 'Cook Islands', 'CK', 'COK', 184, 'inactive'),
(54, 'Costa Rica', 'CR', 'CRI', 188, 'inactive'),
(55, 'Cote d''Ivoire', 'CI', 'CIV', 384, 'inactive'),
(56, 'Croatia', 'HR', 'HRV', 191, 'inactive'),
(57, 'Cuba', 'CU', 'CUB', 192, 'inactive'),
(58, 'Cura', 'CW', 'CUW', 531, 'inactive'),
(59, 'Cyprus', 'CY', 'CYP', 196, 'inactive'),
(60, 'Czech Republic', 'CZ', 'CZE', 203, 'inactive'),
(61, 'Denmark', 'DK', 'DNK', 208, 'inactive'),
(62, 'Djibouti', 'DJ', 'DJI', 262, 'inactive'),
(63, 'Dominica', 'DM', 'DMA', 212, 'inactive'),
(64, 'Dominican Republic', 'DO', 'DOM', 214, 'inactive'),
(65, 'Ecuador', 'EC', 'ECU', 218, 'inactive'),
(66, 'Egypt', 'EG', 'EGY', 818, 'inactive'),
(67, 'El Salvador', 'SV', 'SLV', 222, 'inactive'),
(68, 'Equatorial Guinea', 'GQ', 'GNQ', 226, 'inactive'),
(69, 'Eritrea', 'ER', 'ERI', 232, 'inactive'),
(70, 'Estonia', 'EE', 'EST', 233, 'inactive'),
(71, 'Ethiopia', 'ET', 'ETH', 231, 'inactive'),
(72, 'Falkland Islands (Malvinas)', 'FK', 'FLK', 238, 'inactive'),
(73, 'Faroe Islands', 'FO', 'FRO', 234, 'inactive'),
(74, 'Fiji', 'FJ', 'FJI', 242, 'inactive'),
(75, 'Finland', 'FI', 'FIN', 246, 'inactive'),
(76, 'France', 'FR', 'FRA', 250, 'inactive'),
(77, 'French Guiana', 'GF', 'GUF', 254, 'inactive'),
(78, 'French Polynesia', 'PF', 'PYF', 258, 'inactive'),
(79, 'French Southern Territories', 'TF', 'ATF', 260, 'inactive'),
(80, 'Gabon', 'GA', 'GAB', 266, 'inactive'),
(81, 'Gambia', 'GM', 'GMB', 270, 'inactive'),
(82, 'Georgia', 'GE', 'GEO', 268, 'inactive'),
(83, 'Germany', 'DE', 'DEU', 276, 'inactive'),
(84, 'Ghana', 'GH', 'GHA', 288, 'inactive'),
(85, 'Gibraltar', 'GI', 'GIB', 292, 'inactive'),
(86, 'Greece', 'GR', 'GRC', 300, 'inactive'),
(87, 'Greenland', 'GL', 'GRL', 304, 'inactive'),
(88, 'Grenada', 'GD', 'GRD', 308, 'inactive'),
(89, 'Guadeloupe', 'GP', 'GLP', 312, 'inactive'),
(90, 'Guam', 'GU', 'GUM', 316, 'inactive'),
(91, 'Guatemala', 'GT', 'GTM', 320, 'inactive'),
(92, 'Guernsey', 'GG', 'GGY', 831, 'inactive'),
(93, 'Guinea', 'GN', 'GIN', 324, 'inactive'),
(94, 'Guinea-Bissau', 'GW', 'GNB', 624, 'inactive'),
(95, 'Guyana', 'GY', 'GUY', 328, 'inactive'),
(96, 'Haiti', 'HT', 'HTI', 332, 'inactive'),
(97, 'Heard Island and McDonald Islands', 'HM', 'HMD', 334, 'inactive'),
(98, 'Holy See (Vatican City State)', 'VA', 'VAT', 336, 'inactive'),
(99, 'Honduras', 'HN', 'HND', 340, 'inactive'),
(100, 'Hong Kong', 'HK', 'HKG', 344, 'inactive'),
(101, 'Hungary', 'HU', 'HUN', 348, 'inactive'),
(102, 'Iceland', 'IS', 'ISL', 352, 'inactive'),
(103, 'India', 'IN', 'IND', 356, 'inactive'),
(104, 'Indonesia', 'ID', 'IDN', 360, 'inactive'),
(105, 'Iran, Islamic Republic of', 'IR', 'IRN', 364, 'inactive'),
(106, 'Iraq', 'IQ', 'IRQ', 368, 'inactive'),
(107, 'Ireland', 'IE', 'IRL', 372, 'inactive'),
(108, 'Isle of Man', 'IM', 'IMN', 833, 'inactive'),
(109, 'Israel', 'IL', 'ISR', 376, 'inactive'),
(110, 'Italy', 'IT', 'ITA', 380, 'inactive'),
(111, 'Jamaica', 'JM', 'JAM', 388, 'inactive'),
(112, 'Japan', 'JP', 'JPN', 392, 'inactive'),
(113, 'Jersey', 'JE', 'JEY', 832, 'inactive'),
(114, 'Jordan', 'JO', 'JOR', 400, 'inactive'),
(115, 'Kazakhstan', 'KZ', 'KAZ', 398, 'inactive'),
(116, 'Kenya', 'KE', 'KEN', 404, 'inactive'),
(117, 'Kiribati', 'KI', 'KIR', 296, 'inactive'),
(118, 'Korea, Democratic People''s Republic of', 'KP', 'PRK', 408, 'inactive'),
(119, 'Korea, Republic of', 'KR', 'KOR', 410, 'inactive'),
(120, 'Kuwait', 'KW', 'KWT', 414, 'inactive'),
(121, 'Kyrgyzstan', 'KG', 'KGZ', 417, 'inactive'),
(122, 'Lao People''s Democratic Republic', 'LA', 'LAO', 418, 'inactive'),
(123, 'Latvia', 'LV', 'LVA', 428, 'inactive'),
(124, 'Lebanon', 'LB', 'LBN', 422, 'inactive'),
(125, 'Lesotho', 'LS', 'LSO', 426, 'inactive'),
(126, 'Liberia', 'LR', 'LBR', 430, 'inactive'),
(127, 'Libya', 'LY', 'LBY', 434, 'inactive'),
(128, 'Liechtenstein', 'LI', 'LIE', 438, 'inactive'),
(129, 'Lithuania', 'LT', 'LTU', 440, 'inactive'),
(130, 'Luxembourg', 'LU', 'LUX', 442, 'inactive'),
(131, 'Macao', 'MO', 'MAC', 446, 'inactive'),
(132, 'Macedonia, the former Yugoslav Republic of', 'MK', 'MKD', 807, 'inactive'),
(133, 'Madagascar', 'MG', 'MDG', 450, 'inactive'),
(134, 'Malawi', 'MW', 'MWI', 454, 'inactive'),
(135, 'Malaysia', 'MY', 'MYS', 458, 'inactive'),
(136, 'Maldives', 'MV', 'MDV', 462, 'inactive'),
(137, 'Mali', 'ML', 'MLI', 466, 'inactive'),
(138, 'Malta', 'MT', 'MLT', 470, 'inactive'),
(139, 'Marshall Islands', 'MH', 'MHL', 584, 'inactive'),
(140, 'Martinique', 'MQ', 'MTQ', 474, 'inactive'),
(141, 'Mauritania', 'MR', 'MRT', 478, 'inactive'),
(142, 'Mauritius', 'MU', 'MUS', 480, 'inactive'),
(143, 'Mayotte', 'YT', 'MYT', 175, 'inactive'),
(144, 'Mexico', 'MX', 'MEX', 484, 'inactive'),
(145, 'Micronesia, Federated States of', 'FM', 'FSM', 583, 'inactive'),
(146, 'Moldova, Republic of', 'MD', 'MDA', 498, 'inactive'),
(147, 'Monaco', 'MC', 'MCO', 492, 'inactive'),
(148, 'Mongolia', 'MN', 'MNG', 496, 'inactive'),
(149, 'Montenegro', 'ME', 'MNE', 499, 'inactive'),
(150, 'Montserrat', 'MS', 'MSR', 500, 'inactive'),
(151, 'Morocco', 'MA', 'MAR', 504, 'inactive'),
(152, 'Mozambique', 'MZ', 'MOZ', 508, 'inactive'),
(153, 'Myanmar', 'MM', 'MMR', 104, 'inactive'),
(154, 'Namibia', 'NA', 'NAM', 516, 'inactive'),
(155, 'Nauru', 'NR', 'NRU', 520, 'inactive'),
(156, 'Nepal', 'NP', 'NPL', 524, 'inactive'),
(157, 'Netherlands', 'NL', 'NLD', 528, 'inactive'),
(158, 'New Caledonia', 'NC', 'NCL', 540, 'inactive'),
(159, 'New Zealand', 'NZ', 'NZL', 554, 'inactive'),
(160, 'Nicaragua', 'NI', 'NIC', 558, 'inactive'),
(161, 'Niger', 'NE', 'NER', 562, 'inactive'),
(162, 'Nigeria', 'NG', 'NGA', 566, 'inactive'),
(163, 'Niue', 'NU', 'NIU', 570, 'inactive'),
(164, 'Norfolk Island', 'NF', 'NFK', 574, 'inactive'),
(165, 'Northern Mariana Islands', 'MP', 'MNP', 580, 'inactive'),
(166, 'Norway', 'NO', 'NOR', 578, 'inactive'),
(167, 'Oman', 'OM', 'OMN', 512, 'inactive'),
(168, 'Pakistan', 'PK', 'PAK', 586, 'inactive'),
(169, 'Palau', 'PW', 'PLW', 585, 'inactive'),
(170, 'Palestine, State of', 'PS', 'PSE', 275, 'inactive'),
(171, 'Panama', 'PA', 'PAN', 591, 'inactive'),
(172, 'Papua New Guinea', 'PG', 'PNG', 598, 'inactive'),
(173, 'Paraguay', 'PY', 'PRY', 600, 'inactive'),
(174, 'Peru', 'PE', 'PER', 604, 'inactive'),
(175, 'Philippines', 'PH', 'PHL', 608, 'inactive'),
(176, 'Pitcairn', 'PN', 'PCN', 612, 'inactive'),
(177, 'Poland', 'PL', 'POL', 616, 'inactive'),
(178, 'Portugal', 'PT', 'PRT', 620, 'inactive'),
(179, 'Puerto Rico', 'PR', 'PRI', 630, 'inactive'),
(180, 'Qatar', 'QA', 'QAT', 634, 'inactive'),
(181, 'Reunion', 'RE', 'REU', 638, 'inactive'),
(182, 'Romania', 'RO', 'ROU', 642, 'inactive'),
(183, 'Russian Federation', 'RU', 'RUS', 643, 'inactive'),
(184, 'Rwanda', 'RW', 'RWA', 646, 'inactive'),
(185, 'Saint Barthelemy', 'BL', 'BLM', 652, 'inactive'),
(186, 'Saint Helena, Ascension and Tristan da Cunha', 'SH', 'SHN', 654, 'inactive'),
(187, 'Saint Kitts and Nevis', 'KN', 'KNA', 659, 'inactive'),
(188, 'Saint Lucia', 'LC', 'LCA', 662, 'inactive'),
(189, 'Saint Martin (French part)', 'MF', 'MAF', 663, 'inactive'),
(190, 'Saint Pierre and Miquelon', 'PM', 'SPM', 666, 'inactive'),
(191, 'Saint Vincent and the Grenadines', 'VC', 'VCT', 670, 'inactive'),
(192, 'Samoa', 'WS', 'WSM', 882, 'inactive'),
(193, 'San Marino', 'SM', 'SMR', 674, 'inactive'),
(194, 'Sao Tome and Principe', 'ST', 'STP', 678, 'inactive'),
(195, 'Saudi Arabia', 'SA', 'SAU', 682, 'inactive'),
(196, 'Senegal', 'SN', 'SEN', 686, 'inactive'),
(197, 'Serbia', 'RS', 'SRB', 688, 'inactive'),
(198, 'Seychelles', 'SC', 'SYC', 690, 'inactive'),
(199, 'Sierra Leone', 'SL', 'SLE', 694, 'inactive'),
(200, 'Singapore', 'SG', 'SGP', 702, 'inactive'),
(201, 'Sint Maarten (Dutch part)', 'SX', 'SXM', 534, 'inactive'),
(202, 'Slovakia', 'SK', 'SVK', 703, 'inactive'),
(203, 'Slovenia', 'SI', 'SVN', 705, 'inactive'),
(204, 'Solomon Islands', 'SB', 'SLB', 90, 'inactive'),
(205, 'Somalia', 'SO', 'SOM', 706, 'inactive'),
(206, 'South Africa', 'ZA', 'ZAF', 710, 'inactive'),
(207, 'South Georgia and the South Sandwich Islands', 'GS', 'SGS', 239, 'inactive'),
(208, 'South Sudan', 'SS', 'SSD', 728, 'inactive'),
(209, 'Spain', 'ES', 'ESP', 724, 'inactive'),
(210, 'Sri Lanka', 'LK', 'LKA', 144, 'inactive'),
(211, 'Sudan', 'SD', 'SDN', 729, 'inactive'),
(212, 'Suriname', 'SR', 'SUR', 740, 'inactive'),
(213, 'Svalbard and Jan Mayen', 'SJ', 'SJM', 744, 'inactive'),
(214, 'Swaziland', 'SZ', 'SWZ', 748, 'inactive'),
(215, 'Sweden', 'SE', 'SWE', 752, 'inactive'),
(216, 'Switzerland', 'CH', 'CHE', 756, 'inactive'),
(217, 'Syrian Arab Republic', 'SY', 'SYR', 760, 'inactive'),
(218, 'Taiwan, Province of China', 'TW', 'TWN', 158, 'inactive'),
(219, 'Tajikistan', 'TJ', 'TJK', 762, 'inactive'),
(220, 'Tanzania, United Republic of', 'TZ', 'TZA', 834, 'inactive'),
(221, 'Thailand', 'TH', 'THA', 764, 'inactive'),
(222, 'Timor-Leste', 'TL', 'TLS', 626, 'inactive'),
(223, 'Togo', 'TG', 'TGO', 768, 'inactive'),
(224, 'Tokelau', 'TK', 'TKL', 772, 'inactive'),
(225, 'Tonga', 'TO', 'TON', 776, 'inactive'),
(226, 'Trinidad and Tobago', 'TT', 'TTO', 780, 'inactive'),
(227, 'Tunisia', 'TN', 'TUN', 788, 'inactive'),
(228, 'Turkey', 'TR', 'TUR', 792, 'inactive'),
(229, 'Turkmenistan', 'TM', 'TKM', 795, 'inactive'),
(230, 'Turks and Caicos Islands', 'TC', 'TCA', 796, 'inactive'),
(231, 'Tuvalu', 'TV', 'TUV', 798, 'inactive'),
(232, 'Uganda', 'UG', 'UGA', 800, 'inactive'),
(233, 'Ukraine', 'UA', 'UKR', 804, 'inactive'),
(234, 'United Arab Emirates', 'AE', 'ARE', 784, 'inactive'),
(235, 'United Kingdom', 'GB', 'GBR', 826, 'inactive'),
(236, 'United States', 'US', 'USA', 840, 'inactive'),
(237, 'United States Minor Outlying Islands', 'UM', 'UMI', 581, 'inactive'),
(238, 'Uruguay', 'UY', 'URY', 858, 'inactive'),
(239, 'Uzbekistan', 'UZ', 'UZB', 860, 'inactive'),
(240, 'Vanuatu', 'VU', 'VUT', 548, 'inactive'),
(241, 'Venezuela, Bolivarian Republic of', 'VE', 'VEN', 862, 'inactive'),
(242, 'Viet Nam', 'VN', 'VNM', 704, 'inactive'),
(243, 'Virgin Islands, British', 'VG', 'VGB', 92, 'inactive'),
(244, 'Virgin Islands, U.S.', 'VI', 'VIR', 850, 'inactive'),
(245, 'Wallis and Futuna', 'WF', 'WLF', 876, 'inactive'),
(246, 'Western Sahara', 'EH', 'ESH', 732, 'inactive'),
(247, 'Yemen', 'YE', 'YEM', 887, 'inactive'),
(248, 'Zambia', 'ZM', 'ZMB', 894, 'inactive'),
(249, 'Zimbabwe', 'ZW', 'ZWE', 716, 'inactive');


ALTER TABLE `lab_audits` ADD `submitter_comments` TEXT NULL DEFAULT NULL AFTER `latest_audit`;
ALTER TABLE `audit_score_2012`
  DROP `submitter_comments`;
  ALTER TABLE `audit_score_2015`
  DROP `submitter_comments`;
  
  
-- Amit 11 Nov 2015
ALTER TABLE `lab_audits` CHANGE `audit_date` `audit_date` DATE NULL DEFAULT NULL;  
ALTER TABLE `cohort` CHANGE `first_slmta_workshop` `first_slmta_workshop` DATE NULL DEFAULT NULL;
ALTER TABLE  `cohort_labs` ADD  `current_stars` INT NOT NULL DEFAULT  '0' AFTER  `graduated` ;


--Amit Dec 14 2015

ALTER TABLE  `accredited_labs` CHANGE  `date_accredited`  `date_accredited` DATE NULL DEFAULT NULL ;


ALTER TABLE `cohort_labs` ADD `first_slmta_workshop` DATE NOT NULL AFTER `lab_type`;

-- Amit Jan 4 2015
ALTER TABLE  `category_file_map` ADD  `sort_order` INT NOT NULL AFTER  `category_file` ;

--saravanan 01-jun-2016
ALTER TABLE  `heroes` ADD  `added_by` INT NOT NULL ,
ADD  `added_on` DATETIME NULL DEFAULT NULL ;

--Amit 02-jun-2016
ALTER TABLE `heroes` CHANGE `short_desc` `slug` VARCHAR(1000) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL;

--Pal 08-jun-2016
CREATE TABLE IF NOT EXISTS `lessons_learned` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `slug` varchar(55) NOT NULL,
  `content` text,
  `added_on` datetime DEFAULT NULL,
  `added_by` int(11) NOT NULL,
  `status` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `added_by` (`added_by`)
)


ALTER TABLE `lessons_learned`
  ADD CONSTRAINT `lessons_learned_ibfk_1` FOREIGN KEY (`added_by`) REFERENCES `admin` (`id`);
  
  
--Pal 09-jun-2016
INSERT INTO `lessons_learned` (`id`, `title`, `slug`, `content`, `added_on`, `added_by`, `status`) VALUES
(1, 'National HIV Reference Laboratory, Kenya', 'nhrlkenya', '<img alt="" src="/uploads/backend/images/b0dcd6693-hnrl-kenya1.png" style="max-height:500px" />\r\n\r\n<h4 style="text-align:center"><strong>NHRL STAFF holding the accreditation certificate</strong></h4>\r\n\r\n<p style="text-align:justify">Visible from the front left: Mamo Umuro (previous Laboratory Manager), Thomas Gachuki (previous QA Manager), David Njogu (Logistician, NHRL)</p>\r\n\r\n<img alt="" src="/uploads/backend/images/82551c66c-hnrl-kenya2.png" style="max-height:500px" />\r\n\r\n<p style="text-align:justify">From left, Bosley Nyandieka (NHRL staff), Hellen Barsigan (NHRL staff), Mamo Umuro (previous Laboratory Manager). Thomas Gachuki (previous QA manager), Richard Kihara (NHRL staff), Roselyn Warutere (NHRL staff - hidden, holding the certificate), Stephen Kipkerich (QA Officer), Risper Sewe (current QA Manager), Caleb Ogada (Section Head, NHRL), and David Njogu (Logistician, NHRL)</p>\r\n\r\n<div style="text-align: left;">\r\n<ol>\r\n	<li>What was the hardest thing to do in order to get accredited?\r\n	<p>To change staff attitudes so they own the process.</p>\r\n	</li>\r\n	<li>What was the easiest?\r\n	<p>Monitoring staff compliance of the established system with the policies and procedures.</p>\r\n	</li>\r\n	<li>What was the most important contributing factor to getting accredited?\r\n	<p>Having management that fully supported the accreditation process.</p>\r\n	</li>\r\n	<li>What steps did you take?\r\n	<ul style="list-style:none;">\r\n		<li><strong>Step 1 :</strong>Ensured management understood the purpose of accreditation.</li>\r\n		<li><strong>Step 2 :</strong>Trained all staff on Good Clinical Laboratory Practice, SLMTA and biosafety.</li>\r\n		<li><strong>Step 3 :</strong>Obtained mentorship for laboratory accreditation.</li>\r\n		<li><strong>Step 4 :</strong>Conducted ISO training.</li>\r\n		<li><strong>Step 5 :</strong>Secured Technical Assistance.</li>\r\n		<li><strong>Step 6 :</strong>Sensitized staff members to change attitudes.</li>\r\n		<li><strong>Step 7 :</strong>Established a strong QA committee to spearhead the accreditation process.</li>\r\n		<li><strong>Step 8 :</strong>Facilitated team work so staff have ownership of the process.</li>\r\n	</ul>\r\n	</li>\r\n    <p></p>\r\n	<li>What were the biggest mistakes you made?\r\n	<p>Not involving the staff members on the implementation process initially</p>\r\n	</li>\r\n	<li>What is the best advice you can give to others?\r\n	<p>Laboratory accreditation is highly regarded both nationally and internationally as a reliable indicator of technical competence and trust in the services offered. Through accreditation our laboratory has been identified as one which can perform specialized tests and national surveys, and this benefitted both the staff and the public.</p>\r\n	</li>\r\n</ol>\r\n</div>\r\n', '2016-06-08 17:59:35', 1, 'active'),
(2, 'HIV National Reference Laboratory, Bahamas', 'hnrlbahamas', '<img alt="" src="/uploads/backend/images/c7a7cbc37-hnrl-bahamas1.png" style="max-height:500px;" />\r\n\r\n<p style="text-align:left"><strong>From left : </strong> Dr Ronald Chiu (CAP Assessor), Ms Vianna Williams (Ref Lab Phlebotomist), Dr Carlos Machicao (Lead CAP Assessor), Mrs Clarice Bain-Adderley (Ref Lab Security Officer), Dr Indira Martin (Lab Strengthening Manager), Dr Stan Read (Lab Director), Ms Marva Jervis (HIV Centre Managing Director), Ms Rochelle Sands (Ref Lab Medical Technologist).<br />\r\n<strong>Staff not in the photo : </strong> Mr Keith McConnell (Research Officer), Mr Desmond Ferguson (Phlebotomist), Ms Carisse Seymour (Cleaner)</p>\r\n\r\n<div style="text-align: left;">\r\n<ol>\r\n	<li>What was the hardest thing to do in order to get accredited?\r\n	<p>Getting started. Most of us have worked in labs for many years without getting in-depth training in QMS. Fortunately, we were able to take advantage of the SLMTA training and mentorship program, which was funded by the PEPFAR/CDC agreement with technical partners AFENET. The training and mentorship was invaluable in terms of preparing us for accreditation and gave us the confidence and skills to begin the first steps of a long journey.</p>\r\n	</li>\r\n	<li>What was the easiest?\r\n	<p>The easiest was getting staff&rsquo;s buy-in to the idea of aiming for quality and excellence.</p>\r\n	</li>\r\n	<li>What was the most important contributing factor to getting accredited?\r\n	<p>In one word, teamwork. It was extremely important to have all staff understand the accreditation process and its importance, and that all staff participated in the process and were motivated by it. We also had a great deal of support and encouragement from Ministry officials, which was truly indispensable. The SLMTA mentors were also absolutely pivotal to providing and conveying experience and know-how to both management and staff.</p>\r\n	</li>\r\n	<li>What steps did you take?\r\n	<p>SLMTA training was a critical first step, and the follow-up mentorship even more so. We started with the fundamentals- the Quality and Safety manuals and core technical SOPs and just branched out from there. We had to build systems, which was key, and systems building required communication and constant implementation. Staff meetings and meetings with the upper Ministry officials played a big role in communicating and standardising procedures in the lab, as well as creating an enabling environment for accreditation.</p>\r\n	</li>\r\n	<li>What were the biggest mistakes you made?\r\n	<p>The biggest mistake one can make on the road to accreditation is to consider any &#39;mishap&#39;, event or transgression as a &#39;mistake&#39;; in the philosophy of effective Quality Management, there is no such thing as a mistake, only an opportunity for improvement. An effective QMS relies on flexibility and is dynamic and responsive to the prevailing conditions, and is also self-reflective and has the inherent ability to correct itself when in error (and this includes both technical and administrative matters). Therefore I can&#39;t say we made any &#39;mistakes&#39; because without those events we could not have grown and continue to grow.</p>\r\n	</li>\r\n	<li>What is the best advice you can give to others?\r\n	<p>Accreditation is worth the work; it raises the overall quality of lab output in a way that is measurable and meaningful. It is a lot of work and the most important motivating force for your team is the quest for excellence. It is important to have a spirit of positivity and teamwork rather than one of reprimand, because this encourages honest constructive critique and self-correction. Accreditation is a process that requires participation of every member, from the cleaner to the lab director; everyone must know the value of their contribution.</p>\r\n	</li>\r\n</ol>\r\n</div>\r\n', '2016-06-09 11:04:11', 1, 'active'),
(3, 'Hai Duong Prevention Medicine Center, Vietnam', 'haiduong', '<img alt="" src="/uploads/backend/images/d82bb3920-hai-duong-prevention-medicine-center.png" style="max-height:500px" />\r\n\r\n<p style="text-align:justify">Front row from left: Nguy?n T&ugrave;ng L&acirc;m, Nguy?n Th? H?nh, Dr. ??ng V?n Nhan (Director of the Laboratory Department), T? V?n C?m (Vice Director of the Laboratory Department and Head of the HIV Laboratory), Nguy?n V?n Tu?n, B&ugrave;i V?n Huy Back row from left: L&ecirc; Th? H?nh, Nguy?n Th? Xu&acirc;n, Ho&agrave;ng Mai H??ng, Nguy?n T Qu?nh Mai, Tr?nh Thu Huy?n, L&ecirc; Th? H?nh, V? Th? Huy&ecirc;n</p>\r\n\r\n<div style="text-align: left;">\r\n\r\n<ol>\r\n	<li>What was the hardest thing to do in order to get accredited?\r\n	<ul>\r\n		<li>Lack of budget for purchasing and validating equipment.</li>\r\n		<li>Insufficient knowledge and competency of staff.</li>\r\n	</ul>\r\n	</li>\r\n    <p></p>\r\n	<li>What was the easiest?\r\n	<p>Staff consolidation and high morale/sense of responsibility.</p>\r\n	</li>\r\n	<li>What was the most important contributing factor to getting accredited?\r\n	<p>Thanks to the SLMTA program, laboratory staff were trained to plan and conduct quality improvement projects, thus increasing the capacity both in management and technical skills.</p>\r\n	</li>\r\n	<li>What steps did you take?\r\n	<ul style="list-style:none;">\r\n		<li><strong>Step 1 :</strong> Establish policies</li>\r\n		<li><strong>Step 2 :</strong> Write SOPs</li>\r\n		<li><strong>Step 3 :</strong> Make plans for the improvement projects</li>\r\n		<li><strong>Step 4 :</strong> Implement the plans with strictly compliance.</li>\r\n		<li><strong>Step 5 :</strong> Follow up and report the actions and results</li>\r\n		<li><strong>Step 6 :</strong> Perform corrective actions where needed</li>\r\n		<li><strong>Step 7 :</strong> Improve the process</li>\r\n	</ul>\r\n	</li>\r\n    <p></p>\r\n	<li>What were the biggest mistakes you made?\r\n	<ul>\r\n		<li>Lacking experience in selecting suppliers who were capable to provide equipment validation services</li>\r\n		<li>Failing to encourage staff members when they faced challenges, which resulted in reduced motivation in implementing their work.</li>\r\n	</ul>\r\n	</li>\r\n    <p></p>\r\n	<li>What is the best advice you can give to others?\r\n	<p>Implementing the laboratory quality management system will be very difficult at first, but once it starts showing the effects, QMS will be the vital element for satisfying the customers.</p>\r\n	</li>\r\n</ol>\r\n</div>\r\n', '2016-06-09 11:05:08', 1, 'active'),
(4, 'Bungoma District Hospital Laboratory, Kenya', 'bungoma', '<img alt="" src="/uploads/backend/images/bff7e0d2b-bungoma1.png" style="max-height:500px" />\n\n<p>From left: <strong>Robert Mose</strong> (Hospital Health Administrator); <strong>Joan Wasike</strong> (Laboratory Manager); <strong>Beatrice Lungai</strong> (Laboratory Supervisor); <strong>Phidelis Maruti</strong> (Laboratory Quality Manager); <strong>Dr. Sylvester Mutoro</strong> (Hospital Medical Superintendent)</p>\n\n<div style="text-align: left;">\n\n<ol>\n	<li>What was the hardest thing to do in order to get accredited?\n	<ul>\n		<li>Development of documents.</li>\n		<li>Changing staff attitudes and fostering a culture of quality.</li>\n		<li>Process control and method validation.</li>\n		<li>Root cause analysis.</li>\n	</ul>\n	</li><br>\n	<li>What was the easiest?\n	<p>Improvement associated with Facility and Safety (one of the 12 sections in the SLIPTA checklist).</p>\n	</li>\n	<li>What was the most important contributing factor to getting accredited?\n	<ul>\n		<li>Involving hospital management; identifying and engaging other stakeholders like procurement unit, maintenance unit, and nursing staff.</li>\n		<li>Commitment and team work.</li>\n		<li>A change of staff attitude.</li>\n		<li>Monitoring through regular internal audits.</li>\n	</ul>\n	</li><br>\n	<li>What steps did you take?\n	<ul style="list-style:none;">\n		<li><strong>Step 1 :</strong> Organized the laboratory, re-arranged the workstations, and removed clutter.</li>\n		<li><strong>Step 2 :</strong> Developed the system (policies and procedures).</li>\n		<li><strong>Step 3 :</strong> Trained staff personnel on the policies and procedures.</li>\n		<li><strong>Step 4 :</strong> Monitored the implementation through scheduled internal audits.</li>\n		<li><strong>Step 5 :</strong> Recognized personnel who adhered to the developed system/standards.</li>\n		<li><strong>Step 6 :</strong> Reviewed the system to fix the gaps and implemented improvement projects to improve the system.</li>\n		<li><strong>Step 7 :</strong> Applied for accreditation.</li>\n		<li><strong>Step 8 :</strong> Continued with internal audits and improvement projects to maintain the standards.</li>\n	</ul>\n	</li><br>\n	<li>What were the biggest mistakes you made?\n	<ul>\n		<li>Forgetting that mentorship and support provided by the partners could end.</li>\n		<li>At first not identifying personnel capabilities and utilizing them.</li>\n	</ul>\n	</li><br>\n	<li>What is the best advice you can give to others?\n	<ul>\n		<li>Involving the top management, identifying your stakeholders, defining time commitment, and using a priority matrix are crucial in achieving and maintaining accreditation.</li>\n		<li>Planning and monitoring the progress is key!</li>\n	</ul>\n	</li>\n</ol>\n</div>\n', '2016-06-09 11:06:15', 1, 'active'),
(5, 'Cimas Harare Medical Laboratory, Zimbabwe', 'cimas', '<img alt="" src="/uploads/backend/images/e6d973627-cimas1.png" style="clear:both; float:none !important; margin:0 auto !important; max-height:500px; text-align:center" />\r\n\r\n<h3>SADCAS Accreditation Certificate Handover Ceremony</h3>\r\n\r\n<p>From left: <strong>Dr. Mafingei Nyamwanza</strong> (Managing Director, Cimas Medical Services Division), <strong>Maureen Mutasa</strong> (CEO SADCAS), <strong>Dr David Parirenyatwa</strong> (Minister of Health and Child Care), <strong>Douglas Mangwanya</strong> (Chairman of Laboratory Services in SADC)</p>\r\n\r\n<img alt="" src="/uploads/backend/images/c4ce48f6f-cimas2.png" style="clear:both; float:none !important; margin:0 auto !important; max-height:500px; text-align:center" />\r\n\r\n<h3>Internal Audit Team</h3>\r\n\r\n<p>From left: <strong>Naison Machaka</strong>, <strong>Lydia Madovi</strong>, <strong>Erica Chidziva</strong> (Lead Internal Auditor), <strong>Roselin Magaramombe</strong> (Laboratory Manager), <strong>Sandra Mavuto</strong> (Quality Coordinator), <strong>Sandra Mamvura</strong> and <strong>Josphat Chinyama</strong>.</p>\r\n\r\n<div style="text-align: left;">\r\n\r\n<ol>\r\n	<li>What was the hardest thing to do in order to get accredited?\r\n\r\n	<ul>\r\n		<li>To get buy-in from staff and foster teamwork in the various departments.</li>\r\n		<li>To get staff to start documenting everything, because it was perceived as extra work in view of the already existing tasks.</li>\r\n		<li>To get staff to write SOPs in a standardized format, read the policies and procedures, and to follow the written procedures.</li>\r\n	</ul>\r\n\r\n	</li>\r\n<br>\r\n	<li>What was the easiest?\r\n\r\n	<ul>\r\n		<li>To get buy-in from Management on the financial requirements.</li>\r\n		<li>To train enthusiastic internal auditors.</li>\r\n	</ul>\r\n\r\n	</li>\r\n<br>\r\n	<li>What was the most important contributing factor to getting accredited?\r\n\r\n	<ul>\r\n		<li>Having the lab manager enroll and participate in the SLMTA program.</li>\r\n		<li>Having the Managing Director champion the cause.</li>\r\n		<li>Training all staff in QMS and ensuring that they embrace quality as a way of life.</li>\r\n		<li>Getting a SLMTA mentor to walk the walk with us.</li>\r\n	</ul>\r\n\r\n	</li>\r\n<br>\r\n	<li>What steps did you take ?\r\n\r\n	<ul style="list-style:none;">\r\n		<li><strong>Step 1 :</strong> Enrolling and participating in the SLMTA program.</li>\r\n		<li><strong>Step 2 :</strong> Identifying staff&rsquo;s talents and empowering them to use those talents.</li>\r\n		<li><strong>Step 3 :</strong> Involving a mentor all the way.</li>\r\n		<li><strong>Step 4 :</strong> Training staff in all aspects of QMS.</li>\r\n		<li><strong>Step 5 :</strong> Internal auditing and having a quality team to assess and review all processes.</li>\r\n	</ul>\r\n\r\n	</li>\r\n    <br>\r\n	<li>What were the biggest mistakes you made?\r\n\r\n	<ul>\r\n		<li>Not budgeting for accreditation initially (i.e., the costs involving improvement projects to comply with all the requirements).</li>\r\n		<li>Assuming that because we had highly qualified and experienced scientists, the road towards accreditation would be smooth going.</li>\r\n		<li>Inadequate knowledge of the application process and time lines.</li>\r\n	</ul>\r\n\r\n	</li>\r\n    <br>\r\n	<li>What is the best advice you can give to others?\r\n\r\n	<ul>\r\n		<li>Ensure top management is heavily involved and committed.</li>\r\n		<li>Never give up even when the going is tough.</li>\r\n		<li>Involve everyone and communicate with staff all the way; give praise where it is due and acknowledge good work by giving certificates etc.</li>\r\n		<li>Involve the finance people and make them part of the process since they control the finances.</li>\r\n		<li>Accreditation is a journey with no destination &ndash; no system is perfect but there is room for continuous improvement as the identified gaps are closed.</li>\r\n	</ul>\r\n\r\n	</li>\r\n</ol>\r\n</div>\r\n', '2016-06-09 11:07:00', 1, 'active'),
(6, 'Nyangabgwe Referral Hospital Laboratory, Botswana', 'nyangabgwe', '<img alt="" src="/uploads/backend/images/4e011e6a2-nyangabgwe1.png" style="clear:both; float:none !important; margin:0 auto !important; max-height:500px; text-align:center" />\n\n<div style="text-align: left;">\n<p>Left: <strong>Bazibi Moiteelasilo</strong> (Deputy Laboratory Manager) holding the SADCAS certificate of accreditation.<br />\nRight: <strong>Kelly Mokobela</strong> (Chief Medical Laboratory Scientist and Laboratory Manager) holding the trophy given by the government of Botswana for being the first government hospital laboratory ever accredited</p>\n\n\n<ol>\n	<li>What was the hardest thing to do in order to get accredited?\n	<p>Convincing the hospital staff to comply with our procedures according to SOPs. To overcome this challenge, we trained them on specimen handling and management requirements; the annual laboratory-clinician meeting also helped. The initiative to get the hospital accredited by the Council for Health Service Accreditation of Southern Africa (COHSASA) also helped change their mindset.</p>\n	</li>\n	<li>What was the biggest success factor?\n\n	<ul>\n		<li>Staffing the Quality Assurance positions (including QA officer, deputy QA officer, and biosafety officer) with the right people (those who are enthusiastic and motivated). Once we put the right people in those positions, things began moving. 2013 became a turning point for us.</li>\n		<li>We involved everyone from the beginning.</li>\n		<li>We had a supportive hospital superintendent. Accreditation is not cheap. He provided necessary resources for training and improvement work and critical advocacy to the clinicians.</li>\n	</ul>\n\n	</li><br>\n	<li>What was the most important contributing factor to getting accredited?\n\n	<ul style="list-style:none;">\n		<li><strong>Step 1 :</strong> Botswana Bureau of Standards (BOBS) trained key people on quality such as ISO15189 and documentation.</li>\n		<li><strong>Step 2 :</strong> We formed multiple committees so everyone was involved and had a specific role to play (e.g., quality, biosafety, equipment, supplies, housekeeping, scientific training, and even social).</li>\n		<li><strong>Step 3 :</strong> We developed SOPs - technical SOPs were developed before quality manual was written. All staff members were involved in reviewing the draft of system SOPs and providing feedback.</li>\n		<li><strong>Step 4 :</strong> We trained staff on SOPs developed and began implementing the system according to the SOPs.</li>\n		<li><strong>Step 5 :</strong> We monitored the implementation through internal audit, management review of logs, and laboratory indicators</li>\n	</ul>\n\n	</li><br>\n	<li>What is the best advice you can give to others?\n\n	<ul>\n		<li>Start with the easier tasks &ndash; write technical SOPs before tackling the quality manual.</li>\n		<li>Involve all staff members from the beginning.</li>\n	</ul>\n\n	</li><br>\n	<li>What were the benefits of getting accredited?\n\n	<ul>\n		<li>Relationship with clinicians has improved significantly; evidence of this is in their compliance with specimen collection and management requirements</li>\n		<li>Everyone is more vigilant of what they do. Chances of getting wrong results have decreased. Laboratory staff don&rsquo;t just run QC. They also review the QC results and take corrective action before releasing the results (versus rushing to release results previously).</li>\n		<li>During staff meeting, people are more inclined to suggest areas for improvement.</li>\n		<li>Accreditation raised motivation. Staff are proud. They want to maintain it. It made them work harder.</li>\n	</ul>\n\n	</li>\n</ol>\n\n</div>\n', '2016-06-09 11:10:23', 1, 'active'),
(7, 'Sekgoma Memorial Hospital Laboratory, Botswana', 'sekgoma', '<img alt="" src="/uploads/backend/images/63d872636-sekgoma1.png" style="clear:both; float:none !important; margin:0 auto !important; max-height:500px; text-align:center" />\r\n\r\n<div style="text-align: left;">\r\n<p>Standing from left: <strong>Mosetsanagape Modukanele</strong> (CDC-Botswana), <strong>Edna Caba Abiera</strong> (Deputy Laboratory Manager), <strong>Wonder Makhuza</strong> (Deputy Quality Officer), <strong>Clemence Simango</strong> (Safety Officer)<br />\r\nSitting from left: <strong>Fredrick Samuel</strong> (Quality Officer), <strong>David Matema</strong> (Chief Medical Laboratory Scientific Officer, MOH)</p>\r\n\r\n\r\n<ol>\r\n	<li>What was the hardest thing to do in order to get accredited?\r\n	<p>Staff attitudes and their resistance to change.</p>\r\n	</li>\r\n	<li>What was the easiest?\r\n	<p>We had no problem having the staff members draft the technical SOPs. This is because in 2009, the laboratory manager made SOP development an evaluation criteria for staff performance assessment. This was before SLMTA initiation in 2010.</p>\r\n	</li>\r\n	<li>What was the most important contributing factor to getting accredited?\r\n	<p>SLMTA. When we started SLMTA in 2010, our quality efforts began to have focus and direction. SLMTA taught us &ldquo;how to&rdquo; implement corrective action through improvement projects. All staff members were involved and each had a role in implementing the improvement projects. All laboratory personnel were trained and coached in-house on SLMTA by the laboratory manager, who was an official trainee in the SLMTA workshop series.</p>\r\n	</li>\r\n	<li>What steps did you take ?\r\n\r\n	<ul style="list-style:none;">\r\n		<li><strong>Step 1 :</strong> We developed SOPs for both technical and system procedures</li>\r\n		<li><strong>Step 2 :</strong> Bureau of Botswana Standards (BOBS) trained all staff members on ISO15189</li>\r\n		<li><strong>Step 3 :</strong> We began monitoring quality indicators and occurrence management</li>\r\n		<li><strong>Step 4 :</strong> Our laboratory was audited by BOBS and personnel from other laboratories to identify gaps between the system and the documented procedures. They found gaps in the system procedures, but not the technical procedures.</li>\r\n		<li><strong>Step 5 :</strong> We began working on improvement projects to close the gaps identified in the audit.</li>\r\n	</ul>\r\n\r\n	</li><br>\r\n	<li>What were the biggest mistakes you made?\r\n	<p>We failed to monitor the day-to-day implementation &ndash; that is, checking to see if what was being done was according to the documented procedures. We did not know discrepancies existed until the first SADCAS inspection. We also wished staff had more exposures to the auditing process earlier.</p>\r\n	</li>\r\n	<li>What is the best advice you can give to others?\r\n	<p><img alt="" src="/uploads/backend/images/f7b5d8170-sekgoma2.png" style="float:left;max-width:200px;margin-top:3px;margin-right:5px;" />Changing staff attitudes is a continuous process. You have to constantly training them, reminding them, and involving them in all improvement projects. Benchmark with other laboratories that have achieved accreditation to inspire them. When we received the only 4 SLIPTA stars in Botswana, it was a big motivation booster.</p>\r\n	</li>\r\n</ol>\r\n\r\n<p>&nbsp;</p>\r\n</div>\r\n', '2016-06-09 11:11:11', 1, 'active'),
(8, 'Princess Marina Hospital Laboratory, Botswana', 'princessmarina', '<img alt="" src="/uploads/backend/images/bb8ffa0da-princess-marina-botswana1.png" style="max-height:500px" />\r\n\r\n<p style="text-align:left">Back row from left: S. Johane (Quality Officer), T. Senosi (Laboratory Manager), L. Mudzikati (Head of Haematology), L. Masvingise (Deputy Quality Officer and Safety Officer)<br />\r\nFront row from left: B. Ngwako (Deputy Head of Chemistry), O. Chishawa (Head of Blood Bank)</p>\r\n\r\n<div style="text-align: left;">\r\n\r\n<ol>\r\n	<li>What was the hardest thing to do in order to get accredited?\r\n\r\n	<ul>\r\n		<li>Quality Improvement Project in terms of time to complete them and understanding of the projects. We felt training should have been done onsite to cover all staff instead of selecting 2 people to attend SLMTA training at the Botswana Bureau of Standards.</li>\r\n		<li>Management commitment &ndash; in terms of availing resources.</li>\r\n		<li>Buy-in from clients &ndash; clinicians wanted their samples tested and had no concern for quality or safety. They wanted to come in holding samples in their hands and it was a challenge to make them understand the lab safety and quality requirements.</li>\r\n		<li>Time and resources required to close non-conformities.</li>\r\n	</ul>\r\n\r\n	</li><br>\r\n	<li>What was the easiest?\r\n	<p>Nothing was easy but communication within the lab &ndash; we understood each other.</p>\r\n	</li>\r\n	<li>What was the most important contributing factor to getting accredited?\r\n	<p>Staff commitment &ndash; they were always available and willing to put in extra hours.</p>\r\n	</li>\r\n	<li>What steps did you take?\r\n\r\n	<ul>\r\n		<li>Strengthened the quality office &ndash; a Senior Officer was assigned to the quality office.</li>\r\n		<li>Started working on technical SOPs at the section level.</li>\r\n		<li>Began implementing the management procedures. Implementation was reviewed daily in a one-hour morning meeting.</li>\r\n	</ul>\r\n\r\n	</li><br>\r\n	<li>What were the biggest mistakes you made?\r\n	<p>Having too many consultants- they kept on cancelling/condemning each other&rsquo;s work, especially those who prescribed &lsquo;this is how you should do it&rsquo; without checking for staff understanding.</p>\r\n	</li>\r\n	<li>What is the best advice you can give to others?\r\n\r\n	<ul>\r\n		<li>Always have a plan &ndash; it is the sure way to succeed.</li>\r\n		<li>Involve everyone from the beginning.</li>\r\n	</ul>\r\n\r\n	</li>\r\n</ol>\r\n\r\n</div>\r\n', '2016-06-09 11:11:59', 1, 'active'),
(9, 'Bomu Hospital Laboratory, Kenya', 'bomu', '<img alt="" src="/uploads/backend/images/7761be12a-bomu1.png" style="max-height:500px;" />\r\n\r\n<p style="text-align:left">Left: Mr John Kamau, the Ag CEO of KENAS ; Right: Dr Aabid Ahmed, CEO, Bomu Hospital</p>\r\n\r\n<div style="text-align: left;">\r\n\r\n<ol>\r\n	<li>What was the hardest thing to do in order to get accredited?\r\n	<p>Training all staff on understanding and implementation of ISO 15189:2012</p>\r\n	</li>\r\n	<li>What was the easiest?\r\n\r\n	<ul>\r\n		<li>QMS documentation as per 15189:2012</li>\r\n		<li>Staff teamwork towards implementation of developed QMS as per 15189:2012</li>\r\n	</ul>\r\n\r\n	</li><br>\r\n	<li>What was the most important contributing factor to getting accredited?\r\n\r\n	<ul>\r\n		<li>Top management support</li>\r\n		<li>Development and implementation of policies, procedures and forms as per 15189:2012</li>\r\n		<li>Staff team work on implementation of QMS</li>\r\n	</ul>\r\n\r\n	</li><br>\r\n	<li>What steps did you take?\r\n\r\n	<ul>\r\n		<li>Regularly audited the QMS for compliance</li>\r\n		<li>Conducted and monitored corrective action and preventive action for identified non-conformities</li>\r\n	</ul>\r\n\r\n	</li><br>\r\n	<li>What were the biggest mistakes you made?\r\n	<p>Initially putting more emphasis on SLIPTA than ISO 15189</p>\r\n	</li>\r\n	<li>What is the best advice you can give to others?\r\n	<p>Ensure that all policies and procedures fulfill the requirements of ISO 15189 and show evidence of implementation</p>\r\n	</li>\r\n</ol>\r\n\r\n</div>\r\n', '2016-06-09 11:12:49', 1, 'active');

--- Amit 26 July 2017

ALTER TABLE `download_category` ADD `sort_order` INT NULL AFTER `parent_id`;

--saravanan 02-dec-2017
CREATE TABLE `testimonials` (
  `testimonial_id` int(11) NOT NULL,
  `event_id` int(11) DEFAULT NULL,
  `other_event_name` varchar(255) DEFAULT NULL,
  `testimonial_by` varchar(255) DEFAULT NULL,
  `location` varchar(255) DEFAULT NULL,
  `testimonial_date` date DEFAULT NULL,
  `testimonial_text` text,
  `status` varchar(255) DEFAULT NULL,
  `added_on` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
ALTER TABLE `testimonials`
  ADD PRIMARY KEY (`testimonial_id`);

ALTER TABLE `testimonials`
  MODIFY `testimonial_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1;
  
  
--Pal 14-APR-2018
INSERT INTO `mail_template` (`mail_temp_id`, `mail_purpose`, `from_name`, `mail_from`, `mail_subject`, `mail_content`, `mail_footer`) VALUES
(2, 'biosafetyUserActivation', 'SLMTA', 'slmtalabs@gmail.com', 'SLMTA Biosafety account activation mail', 'HI<b> ##USER## ,</b><b><br><br></b>Thank you for registering with SLMTA.You are just a click away to activate your account first.To activate please click here <b>##URL## </b>or copy and paste this url in the browser <b>##URLWITHOUTLINK##.</b> <br><br>Have a great time!<b><br></b><br>Regards<br>SLMTA Team', 'This is an autogenerated email. Please do not respond to this mail.'),
(3, 'biosafetyUserAccountRecovery', 'SLMTA', 'slmtalabs@gmail.com', 'SLMTA Biosafety account recovery mail', "Hi <b>##USER##</b>,<br><br>We have received a request to reset your Biosafety login password. To link to reset your Biosafety password please <a href="##URLWITHOUTLINK##">click here</a> or copy and paste the following URL in the browser address bar<b> ##URLWITHOUTLINK## </b> <br><br>If you don't want to change your password, you can ignore this mail<b><br></b><br>Regards<br>Biosafety Team', 'This is an autogenerated email. Please do not respond to this mail.');"


CREATE TABLE `biosafety_user` (
  `bs_user_id` int(11) NOT NULL,
  `unique_id` varchar(45) DEFAULT NULL,
  `full_name` varchar(255) DEFAULT NULL,
  `email_id` varchar(255) DEFAULT NULL,
  `password` varchar(500) DEFAULT NULL,
  `mobile` varchar(45) DEFAULT NULL,
  `organization` varchar(255) DEFAULT NULL,
  `country` int(11) DEFAULT NULL,
  `registered_on` datetime NOT NULL,
  `status` varchar(45) DEFAULT 'inactive'
);

ALTER TABLE `biosafety_user`
  ADD PRIMARY KEY (`bs_user_id`);
  
ALTER TABLE `biosafety_user`
  MODIFY `bs_user_id` int(11) NOT NULL AUTO_INCREMENT

-- Thanaseelan 09/10/2018

CREATE TABLE `questions` (
 `question_id` int(11) NOT NULL AUTO_INCREMENT,
 `question` mediumtext,
 `section` int(11) DEFAULT NULL,
 `status` varchar(255) DEFAULT NULL,
 `correct_option` varchar(255) DEFAULT NULL,
 `correct_option_text` text,
 PRIMARY KEY (`question_id`),
 KEY `section` (`section`),
 CONSTRAINT `questions_ibfk_1` FOREIGN KEY (`section`) REFERENCES `sections` (`section_id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=latin1


CREATE TABLE `options` (
 `option_id` int(11) NOT NULL AUTO_INCREMENT,
 `question` int(11) DEFAULT NULL,
 `option` mediumtext,
 `status` varchar(255) DEFAULT NULL,
 PRIMARY KEY (`option_id`),
 KEY `question` (`question`),
 CONSTRAINT `options_ibfk_1` FOREIGN KEY (`question`) REFERENCES `questions` (`question_id`)
) ENGINE=InnoDB AUTO_INCREMENT=105 DEFAULT CHARSET=latin1
-- Thanaseelan 19 -8-1028
-- Test config table query
CREATE TABLE `test_config` (
 `config_id` int(11) NOT NULL AUTO_INCREMENT,
 `display_name` varchar(255) NOT NULL,
 `test_config_name` varchar(255) NOT NULL,
 `test_config_value` varchar(255) NOT NULL,
 PRIMARY KEY (`config_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1

-- Test-config data
INSERT INTO `test_config` (`config_id`, `display_name`, `test_config_name`, `test_config_value`) VALUES (NULL, 'Passing Percentage', 'passing-percentage', '70'), (NULL, 'Maximum question per test', 'maximum-question-per-test', '4');

INSERT INTO `test_config` (`config_id`, `display_name`, `test_config_name`, `test_config_value`) VALUES (NULL, 'Maximum question per test', 'maximum-question-per-test', '3');

INSERT INTO `test_config` (`config_id`, `display_name`, `test_config_name`, `test_config_value`) VALUES (NULL, 'Allow Retest', 'allow-retest', 'yes');

INSERT INTO `test_config` (`config_id`, `display_name`, `test_config_name`, `test_config_value`) VALUES (NULL, 'Months certification is valid', 'month-valid', '12');

--  Biosafety table query
CREATE TABLE `biosafety_user` (
 `bs_user_id` int(11) NOT NULL AUTO_INCREMENT,
 `unique_id` varchar(45) DEFAULT NULL,
 `full_name` varchar(255) DEFAULT NULL,
 `email_id` varchar(255) DEFAULT NULL,
 `password` varchar(500) DEFAULT NULL,
 `mobile` varchar(45) DEFAULT NULL,
 `organization` varchar(255) DEFAULT NULL,
 `country` int(11) DEFAULT NULL,
 `registered_on` datetime NOT NULL,
 `status` varchar(45) DEFAULT 'inactive',
 PRIMARY KEY (`bs_user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1

-- Tests table query
CREATE TABLE `tests` (
 `test_id` int(11) NOT NULL AUTO_INCREMENT,
 `pretest_start_datetime` datetime NOT NULL,
 `pretest_end_datetime` datetime NOT NULL,
 `pre_test_score` varchar(255) NOT NULL,
 `posttest_start_datetime` datetime NOT NULL,
 `posttest_end_datetime` datetime NOT NULL,
 `post_test_score` varchar(22) NOT NULL,
 `user_id` int(11) NOT NULL,
 PRIMARY KEY (`test_id`),
 KEY `user_foreign_id` (`user_id`),
 CONSTRAINT `user_foreign_id` FOREIGN KEY (`user_id`) REFERENCES `biosafety_user` (`bs_user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=latin1

-- Thanaseelan 20-08-2018
ALTER TABLE `tests` ADD `pre_test_status` VARCHAR(255) NOT NULL AFTER `pre_test_score`;
ALTER TABLE `tests` ADD `post_test_status` VARCHAR(255) NOT NULL AFTER `post_test_score`;


-- Pre test table query
 	CREATE TABLE `pretest_questions` (
 `pre_test_id` int(11) NOT NULL AUTO_INCREMENT,
 `test_id` int(11) NOT NULL,
 `question_id` int(11) NOT NULL,
 `question_text` varchar(255) NOT NULL,
 `response_id` int(11) NOT NULL,
 `response_text` varchar(255) NOT NULL,
 `score` varchar(255) NOT NULL,
 PRIMARY KEY (`pre_test_id`),
 KEY `pre_question_foreign_id` (`question_id`),
 KEY `pre_test_id` (`test_id`),
 CONSTRAINT `pre_question_foreign_id` FOREIGN KEY (`question_id`) REFERENCES `questions` (`question_id`),
 CONSTRAINT `pre_test_id` FOREIGN KEY (`test_id`) REFERENCES `tests` (`test_id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=latin1

-- Thanaseelan 20-08-2018
ALTER TABLE `pretest_questions` ADD `pre_test_status` INT(11) NOT NULL AFTER `score`;

-- post test table query
CREATE TABLE `posttest_questions` (
 `post_test_id` int(11) NOT NULL AUTO_INCREMENT,
 `test_id` int(11) NOT NULL,
 `question_id` int(11) NOT NULL,
 `question_text` varchar(255) NOT NULL,
 `response_id` int(11) NOT NULL,
 `response_text` varchar(255) NOT NULL,
 `score` varchar(255) NOT NULL,
 PRIMARY KEY (`post_test_id`),
 KEY `post_test_id` (`test_id`),
 KEY `post_question_foreign_id` (`question_id`),
 CONSTRAINT `post_question_foreign_id` FOREIGN KEY (`question_id`) REFERENCES `questions` (`question_id`),
 CONSTRAINT `post_test_id` FOREIGN KEY (`test_id`) REFERENCES `tests` (`test_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1

-- Thanaseelan 20-08-2018
ALTER TABLE `posttest_questions` ADD `post_test_status` INT(11) NOT NULL AFTER `score`; 

-- Thanaseelan 20-08-2018 r_biosafety_professions job table
CREATE TABLE `r_biosafety_professions` (
 `rbp_id` int(11) NOT NULL AUTO_INCREMENT,
 `rbp_job` varchar(255) NOT NULL,
 `rbp_status` varchar(255) NOT NULL DEFAULT 'active',
 PRIMARY KEY (`rbp_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1

-- To add the field to the biosafety_user table
ALTER TABLE `biosafety_user` ADD `rbp_job_id` INT(11) NOT NULL AFTER `organization`;
-- saravanan 20-Aug-2018
ALTER TABLE `tests` CHANGE `pretest_end_datetime` `pretest_end_datetime` DATETIME NULL DEFAULT NULL;

ALTER TABLE `tests` CHANGE `post_test_score` `post_test_score` VARCHAR(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '0';
ALTER TABLE `tests` CHANGE `pre_test_score` `pre_test_score` VARCHAR(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '0';
ALTER TABLE `tests` CHANGE `pre_test_status` `pre_test_status` VARCHAR(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL;
ALTER TABLE `tests` CHANGE `post_test_status` `post_test_status` VARCHAR(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL;
ALTER TABLE `tests` CHANGE `posttest_end_datetime` `posttest_end_datetime` DATETIME NULL DEFAULT NULL;
ALTER TABLE `tests` CHANGE `posttest_start_datetime` `posttest_start_datetime` DATETIME NULL DEFAULT NULL;
ALTER TABLE `pretest_questions` CHANGE `pre_test_id` `pre_test_id` INT(11) NOT NULL AUTO_INCREMENT, CHANGE `question_text` `question_text` VARCHAR(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL, CHANGE `response_id` `response_id` INT(11) NULL DEFAULT NULL, CHANGE `response_text` `response_text` VARCHAR(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL, CHANGE `score` `score` VARCHAR(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL, CHANGE `pre_test_status` `pre_test_status` INT(11) NULL DEFAULT NULL;
ALTER TABLE `pretest_questions` ADD `pre_test_status` INT NOT NULL DEFAULT '0' AFTER `score`;

ALTER TABLE `posttest_questions` CHANGE `question_text` `question_text` VARCHAR(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL;
ALTER TABLE `posttest_questions` CHANGE `response_id` `response_id` INT(11) NULL DEFAULT NULL, CHANGE `response_text` `response_text` VARCHAR(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL, CHANGE `score` `score` VARCHAR(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL, CHANGE `post_test_status` `post_test_status` INT(11) NULL DEFAULT NULL;

-- saravanan 21-Aug-2018
INSERT INTO `test_config` (`config_id`, `display_name`, `test_config_name`, `test_config_value`) VALUES (NULL, 'Months certification is valid', 'month-valid', '12');

-- Tests Table PDF certification
ALTER TABLE `tests` ADD `certificate_no` VARCHAR(255) NULL DEFAULT NULL AFTER `user_id`;

ALTER TABLE `tests` ADD `user_test_status` VARCHAR(255) NULL DEFAULT NULL AFTER `certificate_no`;

-- Admin table extra field thanaseelan 28-08-2018
ALTER TABLE `admin` ADD `is_biosafety_admin` VARCHAR(255) NULL DEFAULT 'no' AFTER `role`;
INSERT INTO `admin` (`id`, `login`, `password`, `role`, `is_biosafety_admin`) VALUES (NULL, 'biosafety', '12345', '1', 'yes');

-- Create default value for pre and post test status as a not started Thanaseelan 29-08-2018
ALTER TABLE `tests` CHANGE `pre_test_status` `pre_test_status` VARCHAR(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT 'not started';
ALTER TABLE `tests` CHANGE `post_test_status` `post_test_status` VARCHAR(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT 'not started';

-- Thanaseelan 07-09-2018
CREATE TABLE `aslm_symposium` (
 `aslm_id` int(11) NOT NULL AUTO_INCREMENT,
 `name` varchar(255) DEFAULT NULL,
 `email` varchar(255) DEFAULT NULL,
 `country_reside_work` varchar(255) DEFAULT NULL,
 `organization` varchar(255) DEFAULT NULL,
 `job_position` varchar(255) DEFAULT NULL,
 PRIMARY KEY (`aslm_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1
ALTER TABLE `aslm_symposium` ADD `status` VARCHAR(255) NULL DEFAULT NULL AFTER `job_position`;
ALTER TABLE `aslm_symposium` ADD `unique_id` VARCHAR(255) NULL DEFAULT NULL AFTER `status`;

/* Thanaseelan 17-08-2018 */
ALTER TABLE `events` ADD `event_url` VARCHAR(255) NOT NULL AFTER `description`;

-- saravanan 28-sep-2018
ALTER TABLE `questions` CHANGE `correct_option` `correct_option` VARCHAR(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL;
ALTER TABLE `tests` CHANGE `pretest_end_datetime` `pretest_end_datetime` DATETIME NULL DEFAULT NULL;
ALTER TABLE `tests` CHANGE `posttest_end_datetime` `posttest_end_datetime` DATETIME NULL DEFAULT NULL;
ALTER TABLE `tests` CHANGE `pre_test_score` `pre_test_score` VARCHAR(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL;
ALTER TABLE `tests` CHANGE `post_test_score` `post_test_score` VARCHAR(22) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL;
ALTER TABLE pretest_questions DROP FOREIGN KEY pre_response_foreign_id;
ALTER TABLE `pretest_questions` CHANGE `response_id` `response_id` VARCHAR(255) NULL DEFAULT NULL;
ALTER TABLE `pretest_questions` CHANGE `response_text` `response_text` TEXT CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL;

ALTER TABLE `posttest_questions` CHANGE `response_id` `response_id` VARCHAR(255) NULL DEFAULT NULL;
ALTER TABLE `posttest_questions` CHANGE `response_text` `response_text` TEXT CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL;
ALTER TABLE `questions` ADD `correct_option_text` TEXT NULL DEFAULT NULL AFTER `correct_option`;



-- Amit Oct 9 2018

ALTER TABLE `test_config` ADD UNIQUE(`test_config_name`);

-- Thanaseelan 09-Oct 2018
ALTER TABLE `aslm_symposium` ADD `register_on` DATETIME NULL DEFAULT NULL AFTER `unique_id`;

-- Thanaseelan 16-10-2018
INSERT INTO `r_biosafety_professions` (`rbp_id`, `rbp_job`, `rbp_status`) VALUES (NULL, 'Microbiologist', 'active'), (NULL, 'Safety Professional', 'active');

-- Thanaseelan 07-Dec-2018
ALTER TABLE `temp_mail` ADD `attachment` VARCHAR(255) NOT NULL AFTER `from_full_name`;

-- Thanaseelan 30 Apr, 2019
ALTER TABLE `accredited_labs` ADD `country` INT(11) NOT NULL AFTER `lessons_learned`;
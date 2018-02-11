-- phpMyAdmin SQL Dump
-- version 4.6.6
-- https://www.phpmyadmin.net/
--
-- Хост: db
-- Час створення: Січ 12 2018 р., 15:36
-- Версія сервера: 8.0.0-dmr
-- Версія PHP: 7.0.16

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База даних: `rbc`
--

-- --------------------------------------------------------

--
-- Структура таблиці `administrators`
--

CREATE TABLE `administrators` (
  `createdAt` bigint(20) DEFAULT NULL,
  `updatedAt` bigint(20) DEFAULT NULL,
  `id` int(11) NOT NULL,
  `username` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблиці `conversations`
--

CREATE TABLE `conversations` (
  `createdAt` bigint(20) DEFAULT NULL,
  `updatedAt` bigint(20) DEFAULT NULL,
  `id` int(11) NOT NULL,
  `isEmergency` tinyint(1) DEFAULT NULL,
  `policeAgencyFromOurDb` longtext COLLATE utf8_unicode_ci,
  `policeAgencyFromGoogleApi` longtext COLLATE utf8_unicode_ci,
  `userIncident` text COLLATE utf8_unicode_ci,
  `wasBotHelpful` tinyint(1) DEFAULT NULL,
  `feedbackAboutBotWasNotHelpful` text COLLATE utf8_unicode_ci,
  `wasIncidentReported` tinyint(1) DEFAULT NULL,
  `feedbackAboutIncidentWasNotReported` text COLLATE utf8_unicode_ci,
  `wasPoliceHelpful` tinyint(1) DEFAULT NULL,
  `feedbackAboutPoliceWasNotHelpful` text COLLATE utf8_unicode_ci,
  `userId` bigint(20) DEFAULT NULL,
  `policeAgencyId` int(11) DEFAULT NULL,
  `reportPreferenceId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблиці `messages`
--

CREATE TABLE `messages` (
  `createdAt` bigint(20) DEFAULT NULL,
  `updatedAt` bigint(20) DEFAULT NULL,
  `id` int(11) NOT NULL,
  `who` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `message` text COLLATE utf8_unicode_ci,
  `conversationId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблиці `police_agencies`
--

CREATE TABLE `police_agencies` (
  `createdAt` bigint(20) DEFAULT NULL,
  `updatedAt` bigint(20) DEFAULT NULL,
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `country` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `state` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `city` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `zipCode` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `street` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `internationalCode` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `website` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `onlineCrimeReportSystemType` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `onlineCrimeReportLink` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `twitter` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `facebook` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `instagram` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `nextdoor` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп даних таблиці `police_agencies`
--

INSERT INTO `police_agencies` (`createdAt`, `updatedAt`, `id`, `name`, `country`, `state`, `city`, `zipCode`, `street`, `internationalCode`, `phone`, `website`, `onlineCrimeReportSystemType`, `onlineCrimeReportLink`, `twitter`, `facebook`, `instagram`, `nextdoor`) VALUES
(1513683584400, 1513683584400, 1, 'Anchorage Police Department', 'USA', 'AK', 'Anchorage', '99507', '501 Elmore Rd', '1', '(907) 786-8900', 'http://www.muni.org/Departments/police/Pages/Default.aspx', 'CopLogic', 'http://www.muni.org/Departments/police/forms/Pages/OnlineReportingSystem.aspx', NULL, NULL, NULL, NULL),
(1513683584400, 1513683584400, 2, 'Juneau Police Department', 'USA', 'AK', 'Juneau', '99801', '6255 Alaway Avenue', '1', '(907) 586-0600', 'http://www.juneau.org/jpd/', 'CopLogic', 'http://www.juneau.org/police/CitizenOnlineReporting.php', NULL, NULL, NULL, NULL),
(1513683584400, 1513683584400, 3, 'Birmingham Police Department', 'USA', 'AL', 'Birmingham', '35215', '600 Red Lane Rd', '1', '(205) 328-9311', 'http://police.birminghamal.gov/', NULL, NULL, NULL, NULL, NULL, NULL),
(1513683584400, 1513683584400, 4, 'Montgomery Police Department', 'USA', 'AL', 'Montgomery', '36104', '320 N Ripley St', '1', '(334) 241-2651', 'http://www.montgomeryal.gov/city-government/city-departments/police', NULL, NULL, NULL, NULL, NULL, NULL),
(1513683584400, 1513683584400, 5, 'Mobile Police Department', 'USA', 'AL', 'Mobile', '36606', '2460 Government St', '1', '(251) 208-7211', 'http://www.mobilepd.org/', NULL, NULL, NULL, NULL, NULL, NULL),
(1513683584400, 1513683584400, 6, 'Huntsville Police Department', 'USA', 'AL', 'Huntsville', '35801', '815 Wheeler Ave', '1', '(256) 427-7001', 'https://www.huntsvilleal.gov/government/departments/huntsville-police-department/', NULL, 'https://www.huntsvilleal.gov/residents/neighborhoods/huntsville-connect-service-request/', NULL, NULL, NULL, NULL),
(1513683584400, 1513683584400, 7, 'Little Rock Police Department', 'USA', 'AR', 'Little Rock', '72201', '700 W Markham St', '1', '(501) 371-4829', 'https://www.littlerock.gov/for-residents/police-department/', NULL, NULL, NULL, NULL, NULL, NULL),
(1513683584400, 1513683584400, 8, 'Phoenix Police Department', 'USA', 'AZ', 'Phoenix', '85003', '620 West Washington Street', '1', '(602) 262-6151', 'https://www.phoenix.gov/police', 'CopLogic', 'https://www.phoenix.gov/police/policereport', NULL, NULL, NULL, NULL),
(1513683584400, 1513683584400, 9, 'Tucson Police Department', 'USA', 'AZ', 'Tucson', '85701', '270 S Stone Ave', '1', '(520) 791-6813', 'https://www.tucsonaz.gov/police', 'Department Designed', 'https://www.tucsonaz.gov/apps/crime-reporting/', NULL, NULL, NULL, NULL),
(1513683584400, 1513683584400, 10, 'Mesa Police Department', 'USA', 'AZ', 'Mesa', '85201', '130 N Robson, Mesa', '1', '(480) 644-2211', 'http://www.mesaaz.gov/residents/police', 'CopLogic', 'http://www.mesaaz.gov/residents/police/report-a-non-emergency', NULL, NULL, NULL, NULL),
(1513683584400, 1513683584400, 11, 'Chandler Police Department', 'USA', 'AZ', 'Chandler', '85225', '250 E Chicago St', '1', '(480) 782-4130', 'http://www.chandlerpd.com/', 'CopLogic', 'http://www.chandlerpd.com/forms/file-report/', NULL, NULL, NULL, NULL),
(1513683584400, 1513683584400, 12, 'Gilbert Police Department', 'USA', 'AZ', 'Gilbert', '85296', '75 E Civic Center Dr', '1', '(480) 503-6500', 'https://www.gilbertaz.gov/departments/police', NULL, NULL, NULL, NULL, NULL, NULL),
(1513683584400, 1513683584400, 13, 'Glendale Police Department', 'USA', 'AZ', 'Glendale', '85301', '6835 N 57th Drive', '1', '(623) 930-3000', 'https://www.glendaleaz.com/police/', 'CopLogic', 'https://www.glendaleaz.com/police/OnlinePoliceReport.cfm', NULL, NULL, NULL, NULL),
(1513683584400, 1513683584400, 14, 'Scottsdale Police Department', 'USA', 'AZ', 'Scottsdale', '85251', '8401 E Indian School Rd', '1', '(480) 312-5000', 'http://www.scottsdaleaz.gov/police', 'CopLogic', 'https://eservices.scottsdaleaz.gov/crimereport', NULL, NULL, NULL, NULL),
(1513683584400, 1513683584400, 15, 'Tempe Police Department', 'USA', 'AZ', 'Tempe', '85003', '550 W. Jackson Street', '1', '(480) 350-8311', 'http://www.tempe.gov/city-hall/police', NULL, NULL, NULL, NULL, NULL, NULL),
(1513683584400, 1513683584400, 16, 'Peoria Police Department', 'USA', 'AZ', 'Peoria', '85345', '8351 W Cinnabar Ave', '1', '(623) 773-8311', 'https://www.peoriaaz.gov/government/departments/police', 'CopLogic', 'https://www.peoriaaz.gov/government/departments/police/online-reporting', NULL, NULL, NULL, NULL),
(1513683584400, 1513683584400, 17, 'Los Angeles Police Department', 'USA', 'CA', 'Los Angeles', '90012', '100 W 1st St', '1', '(877) 275-5273', 'http://www.lapdonline.org/', 'CopLogic', 'http://www.lapdonline.org/home/content_basic_view/60409', NULL, NULL, NULL, NULL),
(1513683584400, 1513683584400, 18, 'San Diego Police Department', 'USA', 'CA', 'San Diego', '92101', '1401 Broadway', '1', '(619) 531-2000', 'https://www.sandiego.gov/police/', 'CopLogic', 'https://www.sandiego.gov/police/crimereports/startaccess', NULL, NULL, NULL, NULL),
(1513683584400, 1513683584400, 19, 'San Jose Police Department', 'USA', 'CA', 'San Jose', '95110', '201 W Mission St', '1', '(408) 277-8900', 'http://www.sjpd.org/', 'CopLogic', 'http://www.sjpd.org/ReportingCrime/OnlineReport/', NULL, NULL, NULL, NULL),
(1513683584400, 1513683584400, 20, 'San Francisco Police Department', 'USA', 'CA', 'San Francisco', '94158', '1251 3rd St', '1', '(415) 553-0123', 'http://sanfranciscopolice.org/', 'CopLogic', 'http://sanfranciscopolice.org/reports', NULL, NULL, NULL, NULL),
(1513683584400, 1513683584400, 21, 'Fresno Police Department', 'USA', 'CA', 'Fresno', '93721', '2323 Mariposa Mall', '1', '(559) 621-7000', 'https://www.fresno.gov/police/', 'CopLogic', 'https://www.fresno.gov/police/police-online-reporting-system/', NULL, NULL, NULL, NULL),
(1513683584400, 1513683584400, 22, 'Sacramento Police Department', 'USA', 'CA', 'Sacramento', '95822', '5770 Freeport Blvd #100', '1', '(916) 264-5471', 'https://www.cityofsacramento.org/Police', 'CopLogic', 'https://www.cityofsacramento.org/Police/How-Do-I/File-a-Police-Report', NULL, NULL, NULL, NULL),
(1513683584400, 1513683584400, 23, 'Long Beach Police Department', 'USA', 'CA', 'Long Beach', '90802', '400 W Broadway', '1', '(562) 435-6711', 'http://www.longbeach.gov/police/', 'NONE', NULL, NULL, NULL, NULL, NULL),
(1513683584400, 1513683584400, 24, 'Oakland Police Department', 'USA', 'CA', 'Oakland', '94607', '455 7th St', '1', '(510) 777-3333', 'http://www2.oaklandnet.com/government/o/OPD/index.htm', 'CopLogic', 'http://www2.oaklandnet.com/government/o/OPD/s/report-crime/index.htm', NULL, NULL, NULL, NULL),
(1513683584400, 1513683584400, 25, 'Bakersfield Police Department', 'USA', 'CA', 'Bakersfield', '93307', '1630 E 11th St', '1', '(661) 327-7111', 'http://www.bakersfieldcity.us/gov/depts/police/default.htm', NULL, 'http://www.bakersfieldcity.us/gov/depts/police/crime/report_crime_non_emergency.htm', NULL, NULL, NULL, NULL),
(1513683584400, 1513683584400, 26, 'Anaheim Police Department', 'USA', 'CA', 'Anaheim', '92805', '425 South Harbor Boulevard', '1', '(714) 765-1900', 'https://www.anaheim.net/171/Police-Department', 'CopLogic', 'https://www.anaheim.net/1643/File-a-Police-Report', NULL, NULL, NULL, NULL),
(1513683584400, 1513683584400, 27, 'Santa Ana Police Department', 'USA', 'CA', 'Santa Ana', '92701', '60 Civic Center Plaza', '1', '(714) 245-8665', 'http://www.ci.santa-ana.ca.us/pd/', NULL, NULL, NULL, NULL, NULL, NULL),
(1513683584400, 1513683584400, 28, 'Riverside Police Department', 'USA', 'CA', 'Riverside', '92501', '4102 Orange St', '1', '(951) 354-2007', 'http://www.riversideca.gov/rpd/default.asp', 'CopLogic', 'http://www.riversideca.gov/rpd/report/default.asp', NULL, NULL, NULL, NULL),
(1513683584400, 1513683584400, 29, 'Stockton Police Department', 'USA', 'CA', 'Stockton', '95202', '22 E. Market Street', '1', '(209) 937-8377', 'http://www.stocktongov.com/government/departments/police/default.html', 'CopLogic', 'http://www.stocktongov.com/government/departments/police/onRep.html', NULL, NULL, NULL, NULL),
(1513683584400, 1513683584400, 30, 'Chula Vista Police Department', 'USA', 'CA', 'Chula Vista', '91910', '315 4th Ave', '1', '(619) 691-5151', 'http://www.chulavistaca.gov/departments/police-department', NULL, NULL, NULL, NULL, NULL, NULL),
(1513683584400, 1513683584400, 31, 'Irvine Police Department', 'USA', 'CA', 'Irvine', '92606', '1 Civic Center Plaza', '1', '(949) 724-7000', 'http://www.cityofirvine.org/irvine-police-department', 'CopLogic', 'http://www.cityofirvine.org/irvine-police-department/report-crime', NULL, NULL, NULL, NULL),
(1513683584400, 1513683584400, 32, 'Fremont Police Department', 'USA', 'CA', 'Fremont', '94538', '2000 Stevenson Blvd', '1', '(510) 790-6800', 'http://www.fremontpolice.org/', 'CopLogic', 'http://www.fremontpolice.org/index.aspx?nid=89', NULL, NULL, NULL, NULL),
(1513683584400, 1513683584400, 33, 'San Bernardino Police Department', 'USA', 'CA', 'San Bernardino', '92401', '710 N D St', '1', '(909) 383-5311', 'http://www.ci.san-bernardino.ca.us/cityhall/police_department/default.asp', 'CopLogic', 'http://www.ci.san-bernardino.ca.us/howdoi/report/default.asp', NULL, NULL, NULL, NULL),
(1513683584400, 1513683584400, 34, 'Modesto Police Department', 'USA', 'CA', 'Modesto', '95354', '600 10th St', '1', '(209) 572-9500', 'http://www.modestogov.com/223/Police-Department', 'CopLogic', 'http://www.modestogov.com/1169/File-a-Report', NULL, NULL, NULL, NULL),
(1513683584400, 1513683584400, 35, 'Oxnard Police Department', 'USA', 'CA', 'Oxnard', '93030', '251 S C St', '1', '(805) 385-7740', 'https://www.oxnardpd.org/', 'CopLogic', 'https://www.oxnardpd.org/contact-us/report-a-crime/', NULL, NULL, NULL, NULL),
(1513683584400, 1513683584400, 36, 'Fontana Police Department', 'USA', 'CA', 'Fontana', '92335', '17005 Upland Ave', '1', '(909) 350-7700', 'https://www.fontana.org/112/Police-Department', 'CopLogic', 'https://www.fontana.org/114/File-a-Police-Report-Online', NULL, NULL, NULL, NULL),
(1513683584400, 1513683584400, 37, 'Moreno Valley Police Department', 'USA', 'CA', 'Moreno Valley', '92553', '22850 Calle San Juan De Los Lagos', '1', '(951) 486-6700', 'http://www.moreno-valley.ca.us/city_hall/departments/police/index-police.shtml', NULL, 'http://www.moval.org/resident_services/police/crime-report.shtml', NULL, NULL, NULL, NULL),
(1513683584400, 1513683584400, 38, 'Glendale Police Department', 'USA', 'CA', 'Glendale', '91206', '131 North Isabel Street', '1', '(818) 548-4840', 'http://www.glendaleca.gov/government/departments/police-department', NULL, NULL, NULL, NULL, NULL, NULL),
(1513683584400, 1513683584400, 39, 'Huntington Beach Police Department', 'USA', 'CA', 'Huntington Beach', '92648', '2000 Main St', '1', '(714) 960-8811', 'http://www.huntingtonbeachca.gov/government/departments/pd/', 'CopLogic', 'http://www.huntingtonbeachca.gov/government/departments/pd/online_services/online_crime_reporting.cfm', NULL, NULL, NULL, NULL),
(1513683584400, 1513683584400, 40, 'Los Angeles County Sheriff Department', 'USA', 'CA', 'Santa Clarita', '91355', '23740 Magic Mountain Pkwy', '1', '(661) 255-1121', 'http://shq.lasdnews.net/pages/patrolstation.aspx?id=SCT', 'CopLogic', 'http://shq.lasdnews.net/shq/SORTS/sorts_intro.aspx', NULL, NULL, NULL, NULL),
(1513683584400, 1513683584400, 41, 'Garden Grove Police Department', 'USA', 'CA', 'Garden Grove', '92840', '11222 Acacia Parkway', '1', '(714) 741-5704', 'http://www.ci.garden-grove.ca.us/police', NULL, NULL, NULL, NULL, NULL, NULL),
(1513683584400, 1513683584400, 42, 'Santa Rosa Police Department', 'USA', 'CA', 'Santa Rosa', '95404', '965 Sonoma Ave', '1', '(707) 543-3550', 'https://srcity.org/214/Police', 'CopLogic', 'https://srcity.org/529/Report-a-Crime', NULL, NULL, NULL, NULL),
(1513683584400, 1513683584400, 43, 'Oceanside Police Department', 'USA', 'CA', 'Oceanside', '92058', '3855 Mission Ave', '1', '(760) 435-4900', 'http://www.ci.oceanside.ca.us/gov/police/default.asp', 'CopLogic', 'http://www.ci.oceanside.ca.us/gov/police/ors.asp', NULL, NULL, NULL, NULL),
(1513683584400, 1513683584400, 44, 'Rancho Cucamonga Police Department', 'USA', 'CA', 'Rancho Cucamonga', '91730', '10510 Civic Center Dr', '1', '(909) 941-1488', 'https://www.cityofrc.us/cityhall/police/default.asp', NULL, NULL, NULL, NULL, NULL, NULL),
(1513683584400, 1513683584400, 45, 'Ontario Police Department', 'USA', 'CA', 'Ontario', '91761', '2500 S. Archibald Avenue', '1', '(909) 986-6711', 'http://www.ontarioca.gov/police', 'CopLogic', 'http://www.ontarioca.gov/police/online-police-reporting', NULL, NULL, NULL, NULL),
(1513683584400, 1513683584400, 46, 'Elk Grove Police Department', 'USA', 'CA', 'Elk Grove', '95758', '8400 Laguna Palms Way', '1', '(916) 714-5115', 'http://www.elkgrovepd.org/', 'CopLogic', 'http://www.elkgrovepd.org/online_reporting', NULL, NULL, NULL, NULL),
(1513683584400, 1513683584400, 47, 'Los Angeles County Sheriff', 'USA', 'CA', 'Palmdale', '90012', '450 Bauchet St', '1', '(661) 272-2400', 'http://shq.lasdnews.net/pages/patrolstation.aspx?id=PLM', 'CopLogic', 'http://shq.lasdnews.net/shq/SORTS/sorts_intro.aspx', NULL, NULL, NULL, NULL),
(1513683584400, 1513683584400, 48, 'Corona Police Department', 'USA', 'CA', 'Corona', '92880', '730 Public Safety Way', '1', '(951) 736-2334', 'https://www.coronaca.gov/government/departments/police-department', 'Department Designed', 'https://www.coronaca.gov/government/departments/police-department/9-1-1-dispatch/citizen-assisted-reporting', NULL, NULL, NULL, NULL),
(1513683584400, 1513683584400, 49, 'Salinas Police Department', 'USA', 'CA', 'Salinas', '93901', '222 Lincoln Ave', '1', '(831) 758-7321', 'https://www.salinaspd.com/', 'CopLogic', 'https://www.salinaspd.com/report_a_problem', NULL, NULL, NULL, NULL),
(1513683584400, 1513683584400, 50, 'Pomona Police Department', 'USA', 'CA', 'Pomona', '91766', '490 W Mission Blvd', '1', '(909) 622-1241', 'http://www.ci.pomona.ca.us/index.php/government/city-departments/police-department', 'CopLogic', 'http://www.ci.pomona.ca.us/index.php/police-department-home/online-citizen-reporting', NULL, NULL, NULL, NULL),
(1513683584400, 1513683584400, 51, 'Torrance Police Department', 'USA', 'CA', 'Torrance', '90503', '3300 Civic Center Dr', '1', '(310) 328-3456', 'https://www.torranceca.gov/our-city/police', NULL, NULL, NULL, NULL, NULL, NULL),
(1513683584400, 1513683584400, 52, 'Hayward Police Department', 'USA', 'CA', 'Hayward', '94544', '300 W. Winton Ave', '1', '(510) 293-7000', 'https://www.hayward-ca.gov/police-department', 'CopLogic', 'https://www.hayward-ca.gov/police-department/public-services/file-police-report', NULL, NULL, NULL, NULL),
(1513683584400, 1513683584400, 53, 'Escondido Police Department', 'USA', 'CA', 'Escondido', '92026', '1163 Centre City Parkway', '1', '(760) 839-4722', 'https://police.escondido.org/', 'CopLogic', 'https://police.escondido.org/online-reporting-system.aspx', NULL, NULL, NULL, NULL),
(1513683584400, 1513683584400, 54, 'Sunnyvale Police Department', 'USA', 'CA', 'Sunnyvale', '94086', '700 All America Way', '1', '(408) 730-7180', 'https://sunnyvale.ca.gov/government/safety/default.htm', 'CopLogic', 'https://sunnyvale.ca.gov/government/safety/services/reportcrime.htm', NULL, NULL, NULL, NULL),
(1513683584400, 1513683584400, 55, 'Pasadena Police Department', 'USA', 'CA', 'Pasadena', '91101', '207 Garfield Ave', '1', '(626) 744-4241', 'http://ww5.cityofpasadena.net/police/', 'CopLogic', 'http://ww5.cityofpasadena.net/police/', NULL, NULL, NULL, NULL),
(1513683584400, 1513683584400, 56, 'Orange City Police Department', 'USA', 'CA', 'Orange', '92866', '1107 N. Batavia St.', '1', '(714) 744-7444', 'http://www.cityoforange.org/592/Police', NULL, NULL, NULL, NULL, NULL, NULL),
(1513683584400, 1513683584400, 57, 'Fullerton Police Department', 'USA', 'CA', 'Fullerton', '92832', '237 W Commonwealth Ave', '1', '(714) 738-6700', 'http://www.fullertonpd.org/', NULL, NULL, NULL, NULL, NULL, NULL),
(1513683584400, 1513683584400, 58, 'Antioch Police Department', 'USA', 'CA', 'Antioch', '94509', '607 W 2nd St', '1', '(925) 779-6900', 'http://www.ci.antioch.ca.us/CityGov/Police/', 'CopLogic', 'http://www.ci.antioch.ca.us/CityGov/Police/DORS/start-report.html', NULL, NULL, NULL, NULL),
(1513683584400, 1513683584400, 59, 'West Covina Police Department', 'USA', 'CA', 'West Covina', '91790', '1444 West Garvey Ave', '1', '(626) 939-8500', 'https://www.wcpd.org/', 'CopLogic', 'https://www.wcpd.org/online/file-a-police-report/', NULL, NULL, NULL, NULL),
(1513683584400, 1513683584400, 60, 'Alhambra Police Department', 'USA', 'CA', 'Alhambra', '91801', '211 S 1st St', '1', '(626) 570-5151', 'http://www.cityofalhambra.org/page/22/police_department/', NULL, 'http://www.cityofalhambra.org/page/179/make_an_online_police_report/', NULL, NULL, NULL, NULL),
(1513683584400, 1513683584400, 61, 'Los Angeles County Sheriff', 'USA', 'CA', 'Lakewood', '90712', '5130 Clark Avenue', '1', '(562) 623-3500', 'http://shq.lasdnews.net/pages/patrolstation.aspx?id=LKD', 'CopLogic', 'http://shq.lasdnews.net/shq/SORTS/sorts_intro.aspx', NULL, NULL, NULL, NULL),
(1513683584400, 1513683584400, 62, 'Alameda Police Department', 'USA', 'CA', 'Alameda', '94501', '1555 Oak St', '1', '(510) 337-8340', 'https://alamedaca.gov/police', NULL, 'https://www.epolicereport.com/asp/pdweb.asp?pdkey=CA94501APD', NULL, NULL, NULL, NULL),
(1513683584400, 1513683584400, 63, 'Baldwin Park Police Department', 'USA', 'CA', 'Baldwin Park', '91706', '14403 Pacific Ave', '1', '(626) 960-1955', 'http://www.baldwinparkpolice.com/bureaus', NULL, 'http://www.baldwinparkpolice.com/report-a-crime', NULL, NULL, NULL, NULL),
(1513683584400, 1513683584400, 64, 'Arcata Police Department', 'USA', 'CA', 'Arcata', '95521', '736 F St', '1', '(707) 822-2424', 'http://www.cityofarcata.org/206/Police', NULL, NULL, NULL, NULL, NULL, NULL),
(1513683584400, 1513683584400, 65, 'Azusa Police Department', 'USA', 'CA', 'Azusa', '91702', '725 N Alameda Ave', '1', '(626) 812-3200', 'https://azusapd.org/', NULL, NULL, NULL, NULL, NULL, NULL),
(1513683584400, 1513683584400, 66, 'Beaumont Police Department', 'USA', 'CA', 'Beaumont', '92223', '550 E 6th St', '1', '(951) 769-8500', 'http://www.beaumontpd.org/', NULL, 'http://www.beaumontpd.org/online-reporting/', NULL, NULL, NULL, NULL),
(1513683584400, 1513683584400, 67, 'Bell Gardens Police Department', 'USA', 'CA', 'Bell Gardens', '90201', '7100 Garfield Ave', '1', '(951) 769-8529', 'http://www.bellgardens.org/GOVERNMENT/PublicSafety/PoliceDepartment.aspx', NULL, NULL, NULL, NULL, NULL, NULL),
(1513683584400, 1513683584400, 68, 'Los Angeles County Sheriff', 'USA', 'CA', 'West Hollywood', '90069', '780 N. San Vicente Bl.', '1', '(310) 855-8850', 'http://www.wehosheriff.com/', NULL, 'http://shq.lasdnews.net/shq/SORTS/sorts_intro.aspx', NULL, NULL, NULL, NULL),
(1513683584400, 1513683584400, 69, 'San Bernardino County Sheriff\'s Department', 'USA', 'CA', 'Adelanto', '92301', '11613 Bartlett Ave', '1', '(760) 246-1052', 'http://cms.sbcounty.gov/sheriff/PatrolStations/VictorValley.aspx', NULL, NULL, NULL, NULL, NULL, NULL),
(1513683584400, 1513683584400, 70, 'Atascadero Police Department', 'USA', 'CA', 'Atascadero', '93422', '5505 El Camino Real', '1', '(805) 461-5051', 'http://www.atascadero.org/index.php?option=com_content&view=article&id=620&Itemid=475', NULL, NULL, NULL, NULL, NULL, NULL),
(1513683584400, 1513683584400, 71, 'Banning Police Department', 'USA', 'CA', 'Banning', '92220', '99 E Ramsey St', '1', '(951) 922-3170', 'http://www.banningpolice.org/', NULL, 'http://www.banningpolice.org/OnlineReporting/start-report.html', NULL, NULL, NULL, NULL),
(1513683584400, 1513683584400, 72, 'Barstow Police Department', 'USA', 'CA', 'Barstow', '92311', '100 Sandstone Ct', '1', '(760) 256-2211', 'http://38.106.5.201/city-hall/city-departments/police/police', NULL, NULL, NULL, NULL, NULL, NULL),
(1513683584400, 1513683584400, 73, 'Arvin Police Department', 'USA', 'CA', 'Arvin', '93203', '200 Campus Drive', '1', '(661) 854-5583', 'http://www.arvin.org/government/police/', NULL, NULL, NULL, NULL, NULL, NULL),
(1513683584400, 1513683584400, 74, 'Arcadia Police Department', 'USA', 'CA', 'Arcadia', '91007', '240 W Huntington Dr', '1', '(626) 574-5151', 'https://www.arcadiaca.gov/government/city-departments/police-department', NULL, NULL, NULL, NULL, NULL, NULL),
(1513683584400, 1513683584400, 75, 'Auburn Police Department', 'USA', 'CA', 'Auburn', '95603', '1215 Lincoln Way', '1', '(530) 823-4234', 'http://www.auburn.ca.gov/168/Police', NULL, NULL, NULL, NULL, NULL, NULL),
(1513683584400, 1513683584400, 76, 'Atherton Police Department', 'USA', 'CA', 'Atherton', '94027', '83 Ashfield Rd', '1', '(650) 688-6500', 'http://www.ci.atherton.ca.us/police', NULL, 'http://www.ci.atherton.ca.us/FormCenter/Police-3/Crime-Report-39', NULL, NULL, NULL, NULL),
(1513683584400, 1513683584400, 77, 'Santa Cruz County Sheriff Department', 'USA', 'CA', 'Aptos', '95003', '19D Rancho Del Mar Shopping Center', '1', '(831) 662-0690', 'http://www.scsheriff.com/Home/MyCommunity/Aptos.aspx', NULL, NULL, NULL, NULL, NULL, NULL),
(1513683584400, 1513683584400, 78, 'Burlingame Police Department', 'USA', 'CA', 'Burlingame', '94010', '1111 Trousdale Dr', '1', '(650) 777-4100', 'http://www.burlingame.org/index.aspx?page=35', NULL, NULL, NULL, NULL, NULL, NULL),
(1513683584400, 1513683584400, 79, 'Los Altos Police Department', 'USA', 'CA', 'Los Altos', '94022', '1 N San Antonio Rd', '1', '(650) 947-2770', 'https://www.losaltosca.gov/police', NULL, NULL, NULL, NULL, NULL, NULL),
(1513683584400, 1513683584400, 80, 'Menlo Park Police Department', 'USA', 'CA', 'Menlo Park', '94025', '701 Laurel Street', '1', '(650) 330-6300', 'https://menlopark.org/288/Police', NULL, 'https://menlopark.org/617/Online-crime-reporting', NULL, NULL, NULL, NULL),
(1513683584400, 1513683584400, 81, 'Mountain View Police Department', 'USA', 'CA', 'Mountain View', '94041', '1000 Villa St', '1', '(650) 903-6395', 'http://www.mountainview.gov/depts/police/default.asp', NULL, 'http://www.mountainview.gov/depts/police/default.asp', NULL, NULL, NULL, NULL),
(1513683584400, 1513683584400, 82, 'Palo Alto Police Department', 'USA', 'CA', 'Palo Alto', '94301', '250 Hamilton Ave', '1', '(650) 329-2413', 'http://www.cityofpaloalto.org/gov/depts/pol/default.asp', NULL, NULL, NULL, NULL, NULL, NULL),
(1513683584400, 1513683584400, 83, 'Redwood City Police Department', 'USA', 'CA', 'Redwood City', '94063', '1301 Maple St', '1', '(650) 780-7118', 'https://www.redwoodcity.org/departments/police-department', NULL, 'http://www.redwoodcity.org/departments/police-department/report-crime-online', NULL, NULL, NULL, NULL),
(1513683584400, 1513683584400, 84, 'San Mateo Sheriff\'s Office', 'USA', 'CA', 'San Carlos', '94070', '600 Elm St', '1', '(650) 802-4277', 'http://www.cityofsancarlos.org/depts/pd/default.asp', NULL, 'http://www.cityofsancarlos.org/depts/pd/online_reporting/default.asp', NULL, NULL, NULL, NULL),
(1513683584400, 1513683584400, 85, 'Santa Cruz Police Department', 'USA', 'CA', 'Santa Cruz', '95060', '155 Center St', '1', '(831) 420-5800', 'http://www.cityofsantacruz.com/government/city-departments/police', NULL, 'http://www.cityofsantacruz.com/government/city-departments/police/report-a-crime/online-police-reporting-system', NULL, NULL, NULL, NULL),
(1513683584400, 1513683584400, 86, 'Ventura Police Department', 'USA', 'CA', 'Ventura', '93003', '1425 Dowell Dr', '1', '(805) 339-4400', 'https://www.cityofventura.ca.gov/816/Police-Department', 'CopLogic', 'https://www.cityofventura.ca.gov/1069/File-a-Police-Report', NULL, NULL, NULL, NULL),
(1513683584400, 1513683584400, 87, 'Denver Police Department', 'USA', 'CO', 'Denver', '80202', '1331 N Cherokee St', '1', '(720) 913-2000', 'https://www.denvergov.org/content/denvergov/en/police-department.html', 'CopLogic', 'https://www.denvergov.org/content/denvergov/en/police-department.html', NULL, NULL, NULL, NULL),
(1513683584400, 1513683584400, 88, 'Colorado Springs Police Department', 'USA', 'CO', 'Colorado Springs', '80903', '705 S Nevada Avenue', '1', '(719) 444-7000', 'https://cspd.coloradosprings.gov/', 'CopLogic', 'https://cspd.coloradosprings.gov/content/report-crime-online', NULL, NULL, NULL, NULL),
(1513683584400, 1513683584400, 89, 'Aurora Police Department', 'USA', 'CO', 'Aurora', '80021', '15001 E. Alameda Parkway', '1', '(303) 627-3100', 'https://www.auroragov.org/residents/public_safety/police', 'CopLogic', 'https://www.auroragov.org/residents/public_safety/police/make_an_online_report/', NULL, NULL, NULL, NULL),
(1513683584400, 1513683584400, 90, 'Fort Collins Police Department', 'USA', 'CO', 'Fort Collins', '80525', '2221 South Timberline Road', '1', '(970) 221-6540', 'https://www.fcgov.com/police/', 'CopLogic', 'https://www.fcgov.com/police/coplogic-start-report.php', NULL, NULL, NULL, NULL),
(1513683584400, 1513683584400, 91, 'Lakewood Police Department', 'USA', 'CO', 'Lakewood', '80226', '445 S Allison Pkwy', '1', '(303) 987-7111', 'http://www.lakewood.org/police/', 'Department Designed', 'https://www.lakewood.org/CrimeReportForm/', NULL, NULL, NULL, NULL),
(1513683584400, 1513683584400, 92, 'Thorton Police Department', 'USA', 'CO', 'Thornton', '80229', '9551 Civic Center Dr', '1', '(720) 977-5150', 'https://www.cityofthornton.net/public-safety/police-department/Pages/default.aspx', NULL, NULL, NULL, NULL, NULL, NULL),
(1513683584400, 1513683584400, 93, 'Bridgeport Police Department', 'USA', 'CT', 'Bridgeport', '06604', '300 Congress St.', '1', '(203) 581-5100', 'http://www.bridgeportct.gov/content/341307/341425/341439/default.aspx', NULL, NULL, NULL, NULL, NULL, NULL),
(1513683584400, 1513683584400, 94, 'Metropolitan Police Department', 'USA', 'DC', 'Washington', '20001', '300 Indiana Ave NW', '1', '(202) 727-9099', 'https://mpdc.dc.gov/', 'CopLogic', 'https://mpdc.dc.gov/service/file-police-report-online', NULL, NULL, NULL, NULL),
(1513683584400, 1513683584400, 95, 'Miami-Dade Police Department', 'USA', 'FL', 'Miami', '33128', '400 NW 2nd Ave', '1', '(305) 579-6111', 'http://www.miamidade.gov/police', 'CopLogic', 'http://www.miami-police.org/incident_reporting.html', NULL, NULL, NULL, NULL),
(1513683584400, 1513683584400, 96, 'Tampa Police Department', 'USA', 'FL', 'Tampa', '33602', '411 N Franklin St,', '1', '(813) 231-6130', 'https://www.tampagov.net/police', 'Department Designed', 'https://apps.tampagov.net/appl_Customer_Service_Center/index.asp?strSection=complaints', NULL, NULL, NULL, NULL),
(1513683584400, 1513683584400, 97, 'Orlando Police Department', 'USA', 'FL', 'Orlando', '32805', '1250 W South S', '1', '(407) 246-2470', 'http://www.cityoforlando.net/police/', 'CopLogic', 'http://www.cityoforlando.net/police/selfonline-reporting/', NULL, NULL, NULL, NULL),
(1513683584400, 1513683584400, 98, 'St. Petersburg Police Department', 'USA', 'FL', 'St. Petersburg', '33705', '1300 1st Ave N,', '1', '(727) 893-7780', 'http://police.stpete.org/', 'CopLogic', 'http://police.stpete.org/solve-crime/file-a-report.html', NULL, NULL, NULL, NULL),
(1513683584400, 1513683584400, 99, 'Hialeah Police Department', 'USA', 'FL', 'Hialeah', '33013', '5555 E 8th Ave', '1', '(305) 687-2525', 'http://hialeahfl.gov/index.php?option=com_content&view=article&id=128&Itemid=382&lang=en', NULL, NULL, NULL, NULL, NULL, NULL),
(1513683584400, 1513683584400, 100, 'Tallahassee Police Department', 'USA', 'FL', 'Tallahassee', '32303', '234 E 7th Ave', '1', '(850) 891-4200', 'http://talgov.com/publicsafety/tpd.aspx', 'CopLogic', 'http://www.talgov.com/publicsafety/tpd-onlinecrimereporting.aspx', NULL, NULL, NULL, NULL),
(1513683584400, 1513683584400, 101, 'Fort Lauderdale Police Department', 'USA', 'FL', 'Fort Lauderdale', '33312', '1300 W Broward Blvd', '1', '(954) 764-4357', 'http://www.flpd.org/', NULL, NULL, NULL, NULL, NULL, NULL),
(1513683584400, 1513683584400, 102, 'Port St. Lucie Police Department', 'USA', 'FL', 'Port St. Lucie', '34984', '121 SW Port St Lucie Blvd', '1', '(772) 871-5000', 'http://www.cityofpsl.com/police/index.html', 'CopLogic', 'http://www.cityofpsl.com/police/file_police_report_online.html', NULL, NULL, NULL, NULL),
(1513683584400, 1513683584400, 103, 'Cape Coral Police Department', 'USA', 'FL', 'Cape Coral', '33990', '1100 Cultural Park Blvd', '1', '(239) 574-3223', 'https://www.capecops.com/', NULL, NULL, NULL, NULL, NULL, NULL),
(1513683584400, 1513683584400, 104, 'Pembroke Pines Police Department', 'USA', 'FL', 'Pembroke Pines', '33024', '9500 Pines Blvd', '1', '(954) 764-4357', 'http://www.ppines.com/police', NULL, NULL, NULL, NULL, NULL, NULL),
(1513683584400, 1513683584400, 105, 'Hollywood Police Department', 'USA', 'FL', 'Hollywood', '33021', '3250 Hollywood Blvd', '1', '(954) 764-4357', 'http://www.hollywoodfl.org/99/Police', NULL, NULL, NULL, NULL, NULL, NULL),
(1513683584400, 1513683584400, 106, 'Coral Springs Police Department', 'USA', 'FL', 'Coral Springs', '33065', '2801 Coral Springs Dr', '1', '(954) 344-1800', 'http://www.coralsprings.org/government/other-departments-and-services/police', 'Superion', 'http://p2c.coralsprings.org/', NULL, NULL, NULL, NULL),
(1513683584400, 1513683584400, 107, 'Miramar Police Department', 'USA', 'FL', 'Miramar', '33025', '11765 City Hall Promenade', '1', '(954) 764-4357', 'http://www.miramarpd.org/378/Police', NULL, 'http://fl-miramar.civicplus.com/502/Filing-a-Complaint', NULL, NULL, NULL, NULL),
(1513683584400, 1513683584400, 108, 'Clearwater Police Department', 'USA', 'FL', 'Clearwater', '33756', '645 Pierce St', '1', '(727) 562-4242', 'http://www.clearwaterpolice.org/', 'CopLogic', 'http://www.clearwaterpolice.org/chief-s-office/file-an-online-report', NULL, NULL, NULL, NULL),
(1513683584400, 1513683584400, 109, 'Palm Bay Police Department', 'USA', 'FL', 'Palm Bay', '32907', '130 Malabar Rd. SE', '1', '(321) 952-3456', 'http://www.palmbayflorida.org/government/departments/police', 'CopLogic', 'http://www.palmbayflorida.org/government/departments/police/requests-services/file-a-police-report', NULL, NULL, NULL, NULL),
(1513683584400, 1513683584400, 110, 'Lakeland Police Department', 'USA', 'FL', 'Lakeland', '33801', '219 N Massachusetts Avenue', '1', '(863) 834-6900', 'http://www.lakelandgov.net/departments/lakeland-police-department/', NULL, NULL, NULL, NULL, NULL, NULL),
(1513683584400, 1513683584400, 111, 'Daytona Beach Police Department', 'USA', 'FL', 'Daytona Beach', '32114', '129 Valor Blvd', '1', '(386) 671-5100', 'http://www.codb.us/index.aspx?NID=280', 'CopLogic', 'http://www.codb.us/index.aspx?NID=288', NULL, NULL, NULL, NULL),
(1513683584400, 1513683584400, 112, 'Titusville Police Department', 'USA', 'FL', 'Titusville', '32780', '1100 John Glenn Blvd', '1', '(321) 264-7800', 'http://www.titusville.com/SectionIndex.asp?SectionID=7', NULL, NULL, NULL, NULL, NULL, NULL),
(1513683584400, 1513683584400, 113, 'Haines City Police Department', 'USA', 'FL', 'Haines City', '33844', '35400 U.S. 27', '1', '(863) 421-3636', 'https://hainescity.com/government/departments/police-department/', NULL, NULL, NULL, NULL, NULL, NULL),
(1513683584400, 1513683584400, 114, 'Atlanta Police Department', 'USA', 'GA', 'Atlanta', '30303', '226 Peachtree St S.W.', '1', '(404) 614-6544', 'http://www.atlantapd.org/', NULL, 'http://www.atlantapd.org/i-want-to/report-a-crime', NULL, NULL, NULL, NULL),
(1513683584400, 1513683584400, 115, 'Richmond Sheriff Department', 'USA', 'GA', 'Augusta', '30901', '400 Walton Way', '1', '(706) 821-1080', 'http://www.augustaga.gov/294/Sheriff', NULL, NULL, NULL, NULL, NULL, NULL),
(1513683584400, 1513683584400, 116, 'Columbus Police Department', 'USA', 'GA', 'Columbus', '31901', '510 E 10th St', '1', '(706) 653-3231', 'http://www.columbusga.org/Police/', NULL, NULL, NULL, NULL, NULL, NULL),
(1513683584400, 1513683584400, 117, 'Savannah Police Department', 'USA', 'GA', 'Savannah', '38372', '80 King St', '1', '(731) 925-4989', 'http://cityofsavannah.org/fire-police/', NULL, NULL, NULL, NULL, NULL, NULL),
(1513683584400, 1513683584400, 118, 'Bibb Sheriff', 'USA', 'GA', 'Macon', '31201', '668 Oglethorpe St,', '1', '(478) 751-7500', 'http://bibbsheriff.us/', NULL, NULL, NULL, NULL, NULL, NULL),
(1513683584400, 1513683584400, 119, 'Honolulu Police Department', 'USA', 'HI', 'Honolulu', '96813', '801 S Beretania St', '1', '(808) 529-3111', 'http://www.honolulupd.org/', 'Department Designed', 'http://www.honolulupd.org/rs/index.php?page=onlineuser_login', NULL, NULL, NULL, NULL),
(1513683584400, 1513683584400, 120, 'Des Moines Police Department', 'USA', 'IA', 'Des Moines', '50309', '25 E 1st St', '1', '(515) 283-4824', 'http://www.dmgov.org/Departments/Police/Pages/About.aspx', NULL, NULL, NULL, NULL, NULL, NULL),
(1513683584400, 1513683584400, 121, 'Boise Police Department', 'USA', 'ID', 'Boise City', '83704', '333 N Mark Stall Place', '1', '(208) 377-6790', 'http://police.cityofboise.org/home/contact-bpd/', 'CopLogic', 'http://police.cityofboise.org/online-crime-reporting/', NULL, NULL, NULL, NULL),
(1513683584400, 1513683584400, 122, 'Chicago Police Department', 'USA', 'IL', 'Chicago', '60626', '6464 N Clark S', '1', '(312) 746-6000', 'https://home.chicagopolice.org/', 'CopLogic', 'https://home.chicagopolice.org/online-services/online-crime-reporting/', NULL, NULL, NULL, NULL),
(1513683584400, 1513683584400, 123, 'Aurora Police Department', 'USA', 'IL', 'Aurora', '60505', '1200 E Indian Trail', '1', '(630) 256-5000', 'https://www.aurora-il.org/343/About-Aurora-Illinois-Police', NULL, NULL, NULL, NULL, NULL, NULL),
(1513683584400, 1513683584400, 124, 'Rockford Police Department', 'USA', 'IL', 'Rockford', '61108', '557 S Newtowne Dr', '1', '(815) 966-2900', 'http://rockfordil.gov/city-departments/police/', NULL, NULL, NULL, NULL, NULL, NULL),
(1513683584400, 1513683584400, 125, 'Joilet Police Department', 'USA', 'IL', 'Joliet', '60402', '150 W Washington St', '1', '(815) 726-2491', 'https://jolietpolice.org/', 'Department Designed', 'https://jolietpolice.org/report/', NULL, NULL, NULL, NULL),
(1513683584400, 1513683584400, 126, 'Naperville Police Department', 'USA', 'IL', 'Naperville', '60540', '1350 Aurora Ave', '1', '(630) 420-6666', 'https://www.naperville.il.us/services/naperville-police-department/', 'Superion', 'http://p2c.naperville.il.us/p2c/main.aspx', NULL, NULL, NULL, NULL),
(1513683584400, 1513683584400, 127, 'Indianapolis Police Department', 'USA', 'IN', 'Indianapolis', '46204', '50 N Alabama St', '1', '(317) 327-3811', 'http://www.indy.gov/egov/city/dps/impd/Pages/home.aspx', NULL, NULL, NULL, NULL, NULL, NULL),
(1513683584400, 1513683584400, 128, 'Fort Wayne Police Department', 'USA', 'IN', 'Fort Wayne', '46803', 'E Main St', '1', '(260) 427-1222', 'http://www.fwpd.org/', NULL, NULL, NULL, NULL, NULL, NULL),
(1513683584400, 1513683584400, 129, 'Wichita Police Department', 'USA', 'KS', 'Wichita', '67202', '455 N Main St', '1', '(316) 268-4221', 'http://www.wichita.gov/Pages/default.aspx', NULL, 'http://www.wichita.gov/Issues/Pages/default.aspx', NULL, NULL, NULL, NULL),
(1513683584400, 1513683584400, 130, 'Overland Park Police Department', 'USA', 'KS', 'Overland Park', '66213', '12400 Foster St', '1', '(913) 895-6300', 'https://www.opkansas.org/City-Government/Police-Department/', 'CopLogic', 'https://www.opkansas.org/city-government/police-department/makingrequesting-a-police-report/online-police-reporting/', NULL, NULL, NULL, NULL),
(1513683584400, 1513683584400, 131, 'Kansas City Police Department', 'USA', 'KS', 'Kansas City', '66101', '700 Minnesota Ave', '1', '(913) 596-3000', 'http://www.kckpd.org/', NULL, NULL, NULL, NULL, NULL, NULL),
(1513683584400, 1513683584400, 132, 'Olathe Police Department', 'USA', 'KS', 'Olathe', '66061', '501 E Highway 56', '1', '(913) 782-0720', 'http://www.olatheks.org/government/police', NULL, NULL, NULL, NULL, NULL, NULL),
(1513683584400, 1513683584400, 133, 'Topeka Police Department', 'USA', 'KS', 'Topeka', '66603', '320 S Kansas, Suite 100', '1', '(785) 368-9551', 'https://www.topeka.org/tpd', 'CopLogic', 'https://www.topeka.org/tpd/Pages/Online-Police-Reporting-System.aspx', NULL, NULL, NULL, NULL),
(1513683584400, 1513683584400, 134, 'Louisville Police Department', 'USA', 'KY', 'Louisville', '40202', '633 W Jefferson St', '1', '(502) 574-7111', 'https://louisvilleky.gov/government/police', NULL, 'https://louisvilleky.gov/government/police/services/file-police-report', NULL, NULL, NULL, NULL),
(1513683584400, 1513683584400, 135, 'Lexington Police Department', 'USA', 'KY', 'Lexington-Fayette', '40507', '150 E Main St', '1', '(859) 258-3600', 'https://www.lexingtonky.gov/browse/public-safety/police', 'CopLogic', 'https://www.lexingtonky.gov/citizen-report', NULL, NULL, NULL, NULL),
(1513683584400, 1513683584400, 136, 'New Orleans Police Department', 'USA', 'LA', 'New Orleans', '70119', '715 S Broad Ave', '1', '(504) 821-2222', 'https://www.nola.gov/nopd/', NULL, NULL, NULL, NULL, NULL, NULL),
(1513683584400, 1513683584400, 137, 'Baton Rouge Police Department', 'USA', 'LA', 'Baton Rouge', '70815', '9000 Airline Hwy', '1', '(225) 389-2000', 'http://www.brgov.com/dept/brpd/', NULL, NULL, NULL, NULL, NULL, NULL),
(1513683584400, 1513683584400, 138, 'Shreveport Police Department', 'USA', 'LA', 'Shreveport', '71101', '1234 Texas Ave', '1', '(318) 673-7300', 'https://www.shreveportla.gov/422/Police', NULL, NULL, NULL, NULL, NULL, NULL),
(1513683584400, 1513683584400, 139, 'Boston Police Department', 'USA', 'MA', 'Boston', '02120', '1 Schroeder Plaza', '1', '(617) 343-4200', 'http://bpdnews.com/', NULL, NULL, NULL, NULL, NULL, NULL),
(1513683584400, 1513683584400, 140, 'Worcester Police Department', 'USA', 'MA', 'Worcester', '01608', '9-11 Lincoln Square', '1', '(508) 799-8600', 'http://www.worcesterma.gov/police', NULL, NULL, NULL, NULL, NULL, NULL),
(1513683584400, 1513683584400, 141, 'Springfield Police Department', 'USA', 'MA', 'Springfield', '01105', '130 Pearl St', '1', '(413) 787-6302', 'http://www.springfield-ma.gov/police/', NULL, NULL, NULL, NULL, NULL, NULL),
(1513683584400, 1513683584400, 142, 'Baltimore Police Departmnet', 'USA', 'MD', 'Baltimore', '21202', '601 East Fayette Street', '1', '(410) 395-2525', 'https://www.baltimorepolice.org/', 'CopLogic', 'https://www.baltimorepolice.org/file-police-report', NULL, NULL, NULL, NULL),
(1513683584400, 1513683584400, 143, 'Detroit Police Department', 'USA', 'MI', 'Detroit', '48226', '1301 3rd Ave', '1', '(313) 267-4600', 'http://www.detroitmi.gov/police', 'NONE', 'http://www.detroitmi.gov/How-Do-I/Report/Crime', NULL, NULL, NULL, NULL),
(1513683584400, 1513683584400, 144, 'Grand Rapids Police Department', 'USA', 'MI', 'Grand Rapids', '49503', '1 Monroe Center St NW', '1', '(616) 456-3400', 'http://grcity.us/police-department/Pages/default.aspx', 'Department Designed', 'http://grcrimereporting.grcity.us/fmi/iwp/cgi?-db=GRPD_Web&-loadframes', NULL, NULL, NULL, NULL),
(1513683584400, 1513683584400, 145, 'Warren Police Department', 'USA', 'MI', 'Warren', '48093', '29900 S Civic Center Blvd', '1', '(586) 574-4700', 'http://www.cityofwarren.org/index.php/departments/police-department', NULL, NULL, NULL, NULL, NULL, NULL),
(1513683584400, 1513683584400, 146, 'Lansing Police Department', 'USA', 'MI', 'Lansing', '48933', '120 W Michigan Avenue', '1', '(517) 483-4600', 'http://www.lansingmi.gov/398/Police-Department', 'CopLogic', 'http://www.lansingmi.gov/572/Online-Crime-Reporting', NULL, NULL, NULL, NULL),
(1513683584400, 1513683584400, 147, 'Sterling Heights Police Department', 'USA', 'MI', 'Sterling Heights', '48313', '40333 Dodge Park Road', '1', '(586) 446-2800', 'https://www.sterling-heights.net/466/Police-Department', NULL, NULL, NULL, NULL, NULL, NULL),
(1513683584400, 1513683584400, 148, 'Minneapolis Police Department', 'USA', 'MN', 'Minneapolis', '55415', '350 South 5th Street', '1', '(612) 348-2345', 'http://www.minneapolismn.gov/police/index.htm', 'CopLogic', 'http://www.ci.minneapolis.mn.us/police/report/eReport/index.htm', NULL, NULL, NULL, NULL),
(1513683584400, 1513683584400, 149, 'St. Paul Police Department', 'USA', 'MN', 'St. Paul', '55101', '367 Grove St', '1', '(651) 291-1111', 'https://www.stpaul.gov/departments/police', 'CopLogic', 'https://www.stpaul.gov/departments/police/file-police-report', NULL, NULL, NULL, NULL),
(1513683584400, 1513683584400, 150, 'Kansas City Police Department', 'USA', 'MS', 'Kansas City', '64106', '1125 Locust St', '1', '(816) 234-5111', 'http://kcmo.gov/police/#.WcnGW9OGPOQ', NULL, NULL, NULL, NULL, NULL, NULL),
(1513683584400, 1513683584400, 151, 'St. Louis Police Department', 'USA', 'MS', 'St. Louis', '39520', '310 Old Spanish Trl', '1', '(314) 231-1212', 'http://www.slmpd.org/index.shtml', NULL, NULL, NULL, NULL, NULL, NULL),
(1513683584400, 1513683584400, 152, 'Jackson Police Department', 'USA', 'MS', 'Jackson', '39205', '327 East Pascagoula St', '1', '(601) 960-1234', 'http://www.jacksonms.gov/index.aspx?nid=196', NULL, NULL, NULL, NULL, NULL, NULL),
(1513683584400, 1513683584400, 153, 'Charlotte Mecklenburg Police Department', 'USA', 'NC', 'Charlotte', '28202', '601 E. Trade Street', '1', '(704) 336-7600', 'http://charlottenc.gov/CMPD/Pages/default.aspx', 'CopLogic', 'http://charlottenc.gov/CMPD/ReportACrime/Pages/default.aspx', NULL, NULL, NULL, NULL),
(1513683584400, 1513683584400, 154, 'Raleigh Police Department', 'USA', 'NC', 'Raleigh', '27615', '6716 Six Forks Rd', '1', '(919) 831-6311', 'http://www.raleighnc.gov/safety', 'CopLogic', 'http://www.raleighnc.gov/home/content/Police/Articles/OnlineCrimeReporting.html', NULL, NULL, NULL, NULL),
(1513683584400, 1513683584400, 155, 'Greensboro Police Department', 'USA', 'NC', 'Greensboro', '27401', '300 W Washington St', '1', '(336) 373-2222', 'http://www.greensboro-nc.gov/index.aspx?page=1045', 'Superion', 'http://p2c.greensboro-nc.gov/ReportIncident/IncidentEntry_Disclaimer.aspx', NULL, NULL, NULL, NULL),
(1513683584400, 1513683584400, 156, 'Durham Police Department', 'USA', 'NC', 'Durham', '27701', '505 W Chapel Hill St', '1', '(919) 560-4600', 'http://durhamnc.gov/149/Police-Department', 'Superion', 'http://p2c.durhampolice.com/', NULL, NULL, NULL, NULL),
(1513683584400, 1513683584400, 157, 'Winston-Salem Police Department', 'USA', 'NC', 'Winston-Salem', '27101', '725 N Cherry St', '1', '(336) 773-7700', 'http://www.cityofws.org/departments/Police', 'Superion', 'http://www.wspdp2c.org/ReportIncident/IncidentEntry_Disclaimer.aspx', NULL, NULL, NULL, NULL),
(1513683584400, 1513683584400, 158, 'Fayetteville Police Department', 'USA', 'NC', 'Fayetteville', '28301', '467 Hay St', '1', '(910) 433-1529', 'http://fayettevillenc.gov/government/city-departments/police', 'CopLogic', 'https://fayettevillenc.gov/government/city-departments/police/police-reports', NULL, NULL, NULL, NULL),
(1513683584400, 1513683584400, 159, 'Cary Police Department', 'USA', 'NC', 'Cary', '27513', '120 Wilkinson Ave', '1', '(919) 469-4012', 'http://www.townofcary.org/services-publications/police', NULL, NULL, NULL, NULL, NULL, NULL),
(1513683584400, 1513683584400, 160, 'Omaha Police Department', 'USA', 'NE', 'Omaha', '68102', '505 S 15th Street', '1', '(402) 444-5600', 'https://police.cityofomaha.org/', NULL, NULL, NULL, NULL, NULL, NULL),
(1513683584400, 1513683584400, 161, 'Lincoln Police Department', 'USA', 'NE', 'Lincoln', '86850', '575 S 10th St', '1', '(402) 441-6000', 'http://lincoln.ne.gov/city/police/index.htm', 'CopLogic', 'http://lincoln.ne.gov/city/police/stats/incident.htm', NULL, NULL, NULL, NULL),
(1513683584400, 1513683584400, 162, 'Newark Police Department', 'USA', 'NJ', 'Newark', '07112', '1009 Bergen St', '1', '(973) 733-6000', 'http://npd.newarkpublicsafety.org/index.php', 'CopLogic', 'http://npd.newarkpublicsafety.org/corp', NULL, NULL, NULL, NULL),
(1513683584400, 1513683584400, 163, 'Jersey City Police Department', 'USA', 'NJ', 'Jersey City', '07302', '207 7th St', '1', '(201) 547-5477', 'http://www.njjcpd.org/', NULL, NULL, NULL, NULL, NULL, NULL),
(1513683584400, 1513683584400, 164, 'Paterson Police Department', 'USA', 'NJ', 'Paterson', '07505', '111 Broadway #1', '1', '(973) 321-1111', 'http://www.patersonpd.com/', NULL, NULL, NULL, NULL, NULL, NULL),
(1513683584400, 1513683584400, 165, 'Albuquerque Police Department', 'USA', 'NM', 'Albuquerque', '87102', '400 Roma Ave NW', '1', '(505) 242-2677', 'http://www.cabq.gov/police', 'CopLogic', 'http://www.cabq.gov/police/police-reports', NULL, NULL, NULL, NULL),
(1513683584400, 1513683584400, 166, 'Las Vegas Metropolitan Police Department', 'USA', 'NV', 'Las Vegas', '89115', '400 S. Martin L. King Blvd', '1', '(702) 828-3111', 'https://www.lvmpd.com/en-us/Pages/default.aspx', 'CopLogic', 'https://www.lvmpd.com/en-us/RecordsFingerprintBureau/Pages/FileAReportOnline.aspx', NULL, NULL, NULL, NULL),
(1513683584400, 1513683584400, 167, 'Henderson Police Department', 'USA', 'NV', 'Henderson', '89015', '223 Lead St', '1', '(702) 267-5000', 'http://www.cityofhenderson.com/police', 'CopLogic', 'http://www.cityofhenderson.com/static/eMag/police/citizen_online_reporting_system/start-report.html', NULL, NULL, NULL, NULL),
(1513683584400, 1513683584400, 168, 'Reno Police Department', 'USA', 'NV', 'Reno', '89502', '455 E 2nd St', '1', '(775) 334-2121', 'http://renopd.com/', 'CopLogic', 'http://renopd.com/report', NULL, NULL, NULL, NULL),
(1513683584400, 1513683584400, 169, 'North Las Vegas Police Department', 'USA', 'NV', 'North Las Vegas', '89030', '2332 Las Vegas Blvd. North, Ste. 200', '1', '(702) 633-9111', 'http://www.cityofnorthlasvegas.com/Departments/Police/', NULL, 'https://www.cityofnorthlasvegas.com/departments/city_manager/info_finder/ContactCity.aspx', NULL, NULL, NULL, NULL),
(1513683584400, 1513683584400, 170, 'New York Police Department', 'USA', 'NY', 'New York', '11224', '2860 W 23rd St', '1', '(646) 610-5000', 'www.nyc.gov/nypd', NULL, NULL, NULL, NULL, NULL, NULL),
(1513683584400, 1513683584400, 171, 'Buffalo Police Department', 'USA', 'NY', 'Buffalo', '14202', '74 Franklin St', '1', '(716) 851-4444', 'http://www.bpdny.org/', NULL, 'http://www.bpdny.org/Home/Community/CitizenComplaintForm', NULL, NULL, NULL, NULL),
(1513683584400, 1513683584400, 172, 'Rochester Police Department', 'USA', 'NY', 'Rochester', '14614', '185 Exchange Blvd', '1', '(585) 428-7210', 'http://www.cityofrochester.gov/police/', NULL, NULL, NULL, NULL, NULL, NULL),
(1513683584400, 1513683584400, 173, 'Yonkers Police Department', 'USA', 'NY', 'Yonkers', '10701', '104 S Broadway', '1', '(914) 377-7900', 'http://www.yonkersny.gov/live/public-safety/police-department', NULL, NULL, NULL, NULL, NULL, NULL),
(1513683584400, 1513683584400, 174, 'Syracuse Police Department', 'USA', 'NY', 'Syracuse', '13202', '511 S State St', '1', '(315) 442-5111', 'http://www.syracusepolice.org/', 'CopLogic', 'http://www.syracusepolice.org/eServe/start-report.html', NULL, NULL, NULL, NULL),
(1513683584400, 1513683584400, 175, 'Columbus Police Department', 'USA', 'OH', 'Columbus', '43215', '120 Marconi Blvd', '1', '(614) 645-4545', 'https://www.columbus.gov/police/', 'CopLogic', 'https://www.columbus.gov/police-offensetypes/', NULL, NULL, NULL, NULL),
(1513683584400, 1513683584400, 176, 'Cleveland Police Department', 'USA', 'OH', 'Cleveland', '44113', '1300 Ontario St', '1', '(216) 621-1234', 'http://city.cleveland.oh.us/CityofCleveland/Home/Government/CityAgencies/PublicSafety/Police', 'CopLogic', 'http://city.cleveland.oh.us/CityofCleveland/Home/Government/CityAgencies/PublicSafety/Police/OnlineReports', NULL, NULL, NULL, NULL),
(1513683584400, 1513683584400, 177, 'Cincinnati Police Department', 'USA', 'OH', 'Cincinnati', '45204', '800 Evans St', '1', '(513) 765-1212', 'http://www.cincinnati-oh.gov/police/', 'CopLogic', 'http://www.cincinnati-oh.gov/police/online-reporting/', NULL, NULL, NULL, NULL),
(1513683584400, 1513683584400, 178, 'Toledo Police Department', 'USA', 'OH', 'Toledo', '43604', '525 N Erie St', '1', '(419) 245-3340', 'https://www.toledopolice.com/', 'CopLogic', 'https://coprs.noris.org/Disclaimer.aspx?AgencyCode=TOLPOL', NULL, NULL, NULL, NULL),
(1513683584400, 1513683584400, 179, 'Akron Police Department', 'USA', 'OH', 'Akron', '44308', '217 S High St', '1', '(330) 375-2552', 'http://www.akronohio.gov/cms/site/10c5e96e7db5b10f/index.html', NULL, NULL, NULL, NULL, NULL, NULL),
(1513683584400, 1513683584400, 180, 'Dayton Police Department', 'USA', 'OH', 'Dayton', '45402', '335 W Third St', '1', '(937) 333-2677', 'http://www.daytonohio.gov/230/Police', 'CopLogic', 'http://www.daytonohio.gov/321/Report-a-Crime', NULL, NULL, NULL, NULL),
(1513683584400, 1513683584400, 181, 'Oklahoma City Police Department', 'USA', 'OK', 'Oklahoma City', '73102', '700 Colcord Dr', '1', '(405) 231-2121', 'https://www.okc.gov/departments/police', NULL, 'https://www.okc.gov/departments/police/report-a-crime', NULL, NULL, NULL, NULL),
(1513683584400, 1513683584400, 182, 'Tulsa Police Department', 'USA', 'OK', 'Tulsa', '74110', '3436 N Delaware Ave', '1', '(918) 596-9222', 'https://www.tulsapolice.org/default.aspx', 'CopLogic', 'https://www.tulsapolice.org/police-report/report-a-crime-online.aspx', NULL, NULL, NULL, NULL),
(1513683584400, 1513683584400, 183, 'Portland Police Bureau', 'USA', 'OR', 'Portland', '97204', '1111 S.W. 2nd Ave', '1', '(503) 823-3333', 'https://www.portlandoregon.gov/police/', 'CopLogic', 'https://www.portlandoregon.gov/police/cor/', NULL, NULL, NULL, NULL),
(1513683584400, 1513683584400, 184, 'Eugene Police Department', 'USA', 'OR', 'Eugene', '97401', '300 Country Club Rd', '1', '(541) 682-5111', 'https://www.eugene-or.gov/162/Police', 'CopLogic', 'http://ceapps.eugene-or.gov/epdcoplogic/', NULL, NULL, NULL, NULL),
(1513683584400, 1513683584400, 185, 'Salem Police Department', 'USA', 'OR', 'Salem', '97301', '555 Liberty St SE', '1', '(503) 588-6123', 'http://www.cityofsalem.net/police', 'CopLogic', 'http://www.cityofsalem.net/Pages/report-crime.aspx', NULL, NULL, NULL, NULL),
(1513683584400, 1513683584400, 186, 'Philadelphia Police Department', 'USA', 'PA', 'Philadelphia', '19140', '4000 N American St', '1', '(215) 686-3280', 'http://www.phillypolice.com/', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `police_agencies` (`createdAt`, `updatedAt`, `id`, `name`, `country`, `state`, `city`, `zipCode`, `street`, `internationalCode`, `phone`, `website`, `onlineCrimeReportSystemType`, `onlineCrimeReportLink`, `twitter`, `facebook`, `instagram`, `nextdoor`) VALUES
(1513683584400, 1513683584400, 187, 'Pittsburgh Bureau of Police', 'USA', 'PA', 'Pittsburgh', '15233', '1203 Western Ave', '1', '(412) 323-7800', 'http://pittsburghpa.gov/publicsafety/publicsafety.html', 'Department Designed', 'https://communitysafety.pittsburghpa.gov/SubmitTip.aspx', NULL, NULL, NULL, NULL),
(1513683584400, 1513683584400, 188, 'Falls Township Police Department', 'USA', 'PA', 'Fairless Hills', '19030', '188 Lincoln Highway', '1', '(215) 945-3100', 'https://www.fallstwp.com/departments/police.aspx', NULL, NULL, NULL, NULL, NULL, NULL),
(1513683584400, 1513683584400, 189, 'Providence Police Department', 'USA', 'RI', 'Providence', '02903', '325 Washington St', '1', '(401) 272-3121', 'http://www.providenceri.gov/police-department/', 'CopLogic', 'http://www.providenceri.gov/police/citizens-online-police-reporting-system/', NULL, NULL, NULL, NULL),
(1513683584400, 1513683584400, 190, 'Columbia Police Department', 'USA', 'SC', 'Columbia', '29201', '1 Justice Square', '1', '(803) 252-2911', 'https://columbiapd.net/', 'CopLogic', 'https://columbiapd.net/submit-a-police-report/', NULL, NULL, NULL, NULL),
(1513683584400, 1513683584400, 191, 'Charleston Police Department', 'USA', 'SC', 'Charleston', '29403', '180 Lockwood Dr', '1', '(843) 743-7200', 'http://www.charleston-sc.gov/index.aspx?nid=303', NULL, NULL, NULL, NULL, NULL, NULL),
(1513683584400, 1513683584400, 192, 'Sioux Falls Police Department', 'USA', 'SD', 'Sioux Falls', '57104', '320 W 4th St', '1', '(605) 367-7212', 'http://www.siouxfalls.org/police.aspx', NULL, 'http://www.siouxfalls.org/police/online-citizen-report', NULL, NULL, NULL, NULL),
(1513683584400, 1513683584400, 193, 'Memphis Police Department', 'USA', 'TN', 'Memphis', '38112', '426 Tillman St', '1', '(901) 545-2677', 'http://www.memphispolice.org/', NULL, NULL, NULL, NULL, NULL, NULL),
(1513683584400, 1513683584400, 194, 'Metro Nashville Police Department', 'USA', 'TN', 'Nashville', '37214', '3055 Lebanon Pike', '1', '(615) 862-8600', 'http://www.nashville.gov/Police-Department.aspx', NULL, 'https://www.nashville.gov/Police-Department/Online-Services.aspx', NULL, NULL, NULL, NULL),
(1513683584400, 1513683584400, 195, 'Knoxville Police Department', 'USA', 'TN', 'Knoxville', '37915', '800 Howard Baker Jr Blvd', '1', '(865) 215-7000', 'http://knoxvilletn.gov/government/city_departments_offices/police_department/', NULL, NULL, NULL, NULL, NULL, NULL),
(1513683584400, 1513683584400, 196, 'Cattanooga Police Department', 'USA', 'TN', 'Chattanooga', '37406', '3410 Amnicola Hwy', '1', '(423) 698-2525', 'http://www.chattanooga.gov/police-department', NULL, NULL, NULL, NULL, NULL, NULL),
(1513683584400, 1513683584400, 197, 'Clarksville Police Department', 'USA', 'TN', 'Clarksville', '37040', '135 Commerce St', '1', '(931) 648-0656', 'http://www.cityofclarksville.com/index.aspx?page=177', NULL, NULL, NULL, NULL, NULL, NULL),
(1513683584400, 1513683584400, 198, 'Houston Police Department', 'USA', 'TX', 'Houston', '77002', '1200 Travis Street', '1', '(713) 884-3131', 'http://www.houstontx.gov/police/', 'CopLogic', 'http://www.houstontx.gov/police/online_report.htm', NULL, NULL, NULL, NULL),
(1513683584400, 1513683584400, 199, 'San Antonio Police Department', 'USA', 'TX', 'San Antonio', '78207', '315 South Santa Rosa', '1', '(210) 207-7273', 'https://www.sanantonio.gov/sapd', 'Department Designed', 'https://www.sanantonio.gov/SAPD/File-Electronic-Report', NULL, NULL, NULL, NULL),
(1513683584400, 1513683584400, 200, 'Dallas Police Department', 'USA', 'TX', 'Dallas', '75215', '1400 S Lamar St', '1', '(214) 744-4444', 'http://www.dallaspolice.net/', NULL, NULL, NULL, NULL, NULL, NULL),
(1513683584400, 1513683584400, 201, 'Austin Police Department', 'USA', 'TX', 'Austin', '78748', '404 Ralph Ablanedo Dr', '1', '(512) 974-2000', 'http://www.austintexas.gov/department/police', 'CopLogic', 'http://www.austintexas.gov/department/ireportaustincom', NULL, NULL, NULL, NULL),
(1513683584400, 1513683584400, 202, 'Fort Worth Police Department', 'USA', 'TX', 'Fort Worth', '76115', '505 W. Felix', '1', '(817) 392-4222', 'https://www.fortworthpd.com/', 'CopLogic', 'https://www.fortworthpd.com/online/coplogic-start-report.aspx', NULL, NULL, NULL, NULL),
(1513683584400, 1513683584400, 203, 'El Paso Police Department', 'USA', 'TX', 'El Paso', '79903', '911 N Raynor St', '1', '(915) 832-4400', 'http://www.elpasotexas.gov/police-department', 'Department Designed', 'http://www.elpasotexas.gov/police-department/online-services/online-reports-and-other-forms', NULL, NULL, NULL, NULL),
(1513683584400, 1513683584400, 204, 'Arlington Police Department', 'USA', 'TX', 'Arlington', '76010', '2001 New York Ave', '1', '(817)-274-4444', 'http://www.arlington-tx.gov/police', 'CopLogic', 'http://www.arlington-tx.gov/police/911-2/file-report/', NULL, NULL, NULL, NULL),
(1513683584400, 1513683584400, 205, 'Corpus Christi Police Department', 'USA', 'TX', 'Corpus Christi', '78401', '321 John Sartain S', '1', '(361) 886-2600', 'http://www.cctexas.com/departments/police-department', 'CopLogic', 'http://www.cctexas.com/services/public-safety/make-police-report/report-online', NULL, NULL, NULL, NULL),
(1513683584400, 1513683584400, 206, 'Plano Police Department', 'USA', 'TX', 'Plano', '75074', '909 14th St', '1', '(972) 424-5678', 'http://www.plano.gov/214/Police', 'CopLogic', 'http://www.plano.gov/1529/Online-Police-Reporting', NULL, NULL, NULL, NULL),
(1513683584400, 1513683584400, 207, 'Laredo Police Department', 'USA', 'TX', 'Laredo', '78041', '4712 Maher Ave', '1', '(956) 795-2800', 'http://laredopd.com/', 'CopLogic', 'https://policereports.lexisnexis.com/', NULL, NULL, NULL, NULL),
(1513683584400, 1513683584400, 208, 'Lubbock Police Department', 'USA', 'TX', 'Lubbock', '79457', '916 Texas Ave', '1', '(806) 775-2865', 'https://www.mylubbock.us/departmental-websites/departments/police-department/home', 'CopLogic', 'https://www.mylubbock.us/departmental-websites/departments/police-department/police-top-navigation-menu/file-police-report', NULL, NULL, NULL, NULL),
(1513683584400, 1513683584400, 209, 'Garland Police Department', 'USA', 'TX', 'Garland', '75042', '1891 Forest Ln', '1', '(972) 485-4840', 'http://www.garlandtx.gov/gov/lq/safety/police/default.asp', NULL, NULL, NULL, NULL, NULL, NULL),
(1513683584400, 1513683584400, 210, 'Irving Police Department', 'USA', 'TX', 'Irving', '75061', '305 N O\'Connor Rd', '1', '(972) 273-1010', 'http://cityofirving.org/662/Police-Department', 'CopLogic', 'http://cityofirving.org/1290/Citizens-Online-Police-Reporting', NULL, NULL, NULL, NULL),
(1513683584400, 1513683584400, 211, 'Amarillo Police Department', 'USA', 'TX', 'Amarillo', '79101', '200 SE 3rd Ave', '1', '(806) 378-3038', 'http://police.amarillo.gov/', 'CopLogic', 'http://amarillo.gov/departments/public-safety-and-organizational-services/police/reports/online-reporting', NULL, NULL, NULL, NULL),
(1513683584400, 1513683584400, 212, 'Grand Prairie Police Department', 'USA', 'TX', 'Grand Prairie', '75052', '1525 Arkansas Ln', '1', '(972) 237-8700', 'http://www.gptx.org/city-government/city-departments/police-department', 'Superion', 'http://p2c.gptx.org/ReportIncident/IncidentEntry_Disclaimer.aspx', NULL, NULL, NULL, NULL),
(1513683584400, 1513683584400, 213, 'Brownsville Police Department', 'USA', 'TX', 'Brownsville', '78520', '600 E Jackson St', '1', '(956) 548-7000', 'http://www.brownsvillepd.com/', 'CopLogic', 'http://www.brownsvillepd.com/online-reporting', NULL, NULL, NULL, NULL),
(1513683584400, 1513683584400, 214, 'Pasdena Police Department', 'USA', 'TX', 'Pasadena', '77506', '1201 Davis St', '1', '(713) 477-1221', 'http://www.ci.pasadena.tx.us/default.aspx?name=pol.home', NULL, NULL, NULL, NULL, NULL, NULL),
(1513683584400, 1513683584400, 215, 'Mesquite Police Department', 'USA', 'TX', 'Mesquite', '75149', '777 N Galloway Ave', '1', '(972) 285-6336', 'https://www.cityofmesquite.com/442/Police', NULL, NULL, NULL, NULL, NULL, NULL),
(1513683584400, 1513683584400, 216, 'McKinney Police Department', 'USA', 'TX', 'McKinney', '75071', '2200 Taylor Burk Dr', '1', '(972) 547-2700', 'http://www.mckinneytexas.org/166/Police', NULL, NULL, NULL, NULL, NULL, NULL),
(1513683584400, 1513683584400, 217, 'McAllen Police Department', 'USA', 'TX', 'McAllen', '78501', '1601 N Bicentennial Blvd', '1', '(956) 681-2000', 'http://www.mcallen.net/departments/pd/home', NULL, NULL, NULL, NULL, NULL, NULL),
(1513683584400, 1513683584400, 218, 'Killeen Police Department', 'USA', 'TX', 'Killeen', '76542', '3304 Community Blvd', '1', '(254) 501-8800', 'http://www.killeentexas.gov/index.php?section=224', NULL, 'http://www.killeentexas.gov/index.php?section=262', NULL, NULL, NULL, NULL),
(1513683584400, 1513683584400, 219, 'Waco Police Department', 'USA', 'TX', 'Waco', '76708', '3115 Pine Ave', '1', '(254) 750-7650', 'http://www.waco-texas.com/police/', 'CopLogic', 'http://www.waco-texas.com/police/police-online-report.asp', NULL, NULL, NULL, NULL),
(1513683584400, 1513683584400, 220, 'Carrollton Police Department', 'USA', 'TX', 'Carrollton', '75006', '2025 E Jackson Rd,', '1', '(972) 466-3333', 'http://www.cityofcarrollton.com/departments/departments-g-p/police', NULL, NULL, NULL, NULL, NULL, NULL),
(1513683584400, 1513683584400, 221, 'Frisco Police Department', 'USA', 'TX', 'Frisco', '75034', '7200 Stonebrook Pkwy', '1', '(972) 292-6010', 'http://www.friscotexas.gov/239/Police', NULL, NULL, NULL, NULL, NULL, NULL),
(1513683584400, 1513683584400, 222, 'Midland Police Department', 'USA', 'TX', 'Midland', '79701', '601 N Loraine St', '1', '(432) 685-7110', 'http://www.midlandtexas.gov/237/Police', NULL, NULL, NULL, NULL, NULL, NULL),
(1513683584400, 1513683584400, 223, 'Coppell Police Department', 'USA', 'TX', 'Coppell', '75019', '130 Town Center Blvd', '1', '(972)-304-3600', 'http://www.coppelltx.gov/government/departments/police-department', NULL, NULL, NULL, NULL, NULL, NULL),
(1513683584400, 1513683584400, 224, 'Salt Lake City Police Department', 'USA', 'UT', 'Salt Lake City', '84111', '475 South 300 East', '1', '(801) 799-3000', 'http://www.slcpd.com/', 'CopLogic', 'http://www.slcpd.com/resources/online-report/', NULL, NULL, NULL, NULL),
(1513683584400, 1513683584400, 225, 'West Valley City Police Department', 'USA', 'UT', 'West Valley City', '84119', '3600 South Constitution Blvd', '1', '(801) 840-4000', 'http://www.wvc-ut.gov/24/Police-Department', 'CopLogic', 'http://www.wvc-ut.gov/1390/Police-Reporting-System', NULL, NULL, NULL, NULL),
(1513683584400, 1513683584400, 226, 'Virginia Beach Police Department', 'USA', 'VA', 'Virginia Beach', '23456', '2509 Princess Anne Rd', '1', '(757) 385-5000', 'https://www.vbgov.com/government/departments/police/Pages/default.aspx', NULL, NULL, NULL, NULL, NULL, NULL),
(1513683584400, 1513683584400, 227, 'Norfolk Police Department', 'USA', 'VA', 'Norfolk', '23502', '3661 E Virginia Beach Blvd', '1', '(757) 441-5610', 'https://www.norfolk.gov/index.aspx?nid=305', 'CopLogic', 'https://www.norfolk.gov/index.aspx?NID=3089', NULL, NULL, NULL, NULL),
(1513683584400, 1513683584400, 228, 'Chesapeake Police Department', 'USA', 'VA', 'Chesapeake', '23322', '304 Albemarle Dr', '1', '(757) 382-6161', 'http://www.cityofchesapeake.net/Government/City-Departments/Departments/Police-Department.htm', 'CopLogic', 'http://www.cityofchesapeake.net/government/City-Departments/Departments/Police-Department/onlinereporting.htm', NULL, NULL, NULL, NULL),
(1513683584400, 1513683584400, 229, 'Richmond Police Department', 'USA', 'VA', 'Richmond', '23219', '200 W Grace St', '1', '(804) 646-5100', 'http://www.richmondgov.com/Police/', 'NONE', NULL, NULL, NULL, NULL, NULL),
(1513683584400, 1513683584400, 230, 'Newport News Police Department', 'USA', 'VA', 'Newport News', '23605', '9710 Jefferson Ave', '1', '(757) 247-2500', 'https://www.nnva.gov/police', NULL, 'https://www.nnva.gov/2188/Report', NULL, NULL, NULL, NULL),
(1513683584400, 1513683584400, 231, 'Alexandria Police Department', 'USA', 'VA', 'Alexandria', '22304', '3600 Wheeler Ave', '1', '(703) 746-4444', 'https://www.alexandriava.gov/Police', 'CopLogic', 'https://www.alexandriava.gov/police/info/default.aspx?id=81594', NULL, NULL, NULL, NULL),
(1513683584400, 1513683584400, 232, 'Hampton Police Department', 'USA', 'VA', 'Hampton', '23669', '40 Lincoln St', '1', '(757) 727-6111', 'http://www.hampton.gov/256/Police', NULL, NULL, NULL, NULL, NULL, NULL),
(1513683584400, 1513683584400, 233, 'Seattle Police Department', 'USA', 'WA', 'Seattle', '98124', '610 5th Ave', '1', '(206) 625-5011', 'http://www.seattle.gov/police', 'CopLogic', 'https://www.seattle.gov/police/need-help/online-reporting', NULL, NULL, NULL, NULL),
(1513683584400, 1513683584400, 234, 'Spokane Police Department', 'USA', 'WA', 'Spokane', '99260', '1100 W Mallon Ave', '1', '(509) 456-2233', 'https://my.spokanecity.org/police/', 'NONE', NULL, NULL, NULL, NULL, NULL),
(1513683584400, 1513683584400, 235, 'Tacoma Police Department', 'USA', 'WA', 'Tacoma', '98409', '3701 S Pine St', '1', '(253) 798-4721', 'http://www.cityoftacoma.org/government/city_departments/police/', NULL, 'https://tacomasafe.org/', NULL, NULL, NULL, NULL),
(1513683584400, 1513683584400, 236, 'Vancouver Police Department', 'USA', 'WA', 'Vancouver', '98661', '2800 NE Stapleton Rd', '1', '(360) 693-3111', 'http://www.cityofvancouver.us/police', NULL, NULL, NULL, NULL, NULL, NULL),
(1513683584400, 1513683584400, 237, 'Bellevue Police Department', 'USA', 'WA', 'Bellevue', '98004', '450 110th Ave NE', '1', '(425) 577-5656', 'https://police.bellevuewa.gov/', 'CopLogic', 'https://police.bellevuewa.gov/report-and-prevent-crime', NULL, NULL, NULL, NULL),
(1513683584400, 1513683584400, 238, 'Milwaukee Police Department', 'USA', 'WI', 'Milwaukee', '53233', '749 W State S', '1', '(414) 933-4444', 'http://city.milwaukee.gov/police#.WcWdU9OGPOQ', NULL, NULL, NULL, NULL, NULL, NULL),
(1513683584400, 1513683584400, 239, 'Madison Police Department', 'USA', 'WI', 'Madison', '53702', '211 S Carroll St', '1', '(608) 255-2345', 'http://www.cityofmadison.com/police/', 'Department Designed', 'http://www.cityofmadison.com/police/contact/', NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Структура таблиці `report_preferences`
--

CREATE TABLE `report_preferences` (
  `createdAt` bigint(20) DEFAULT NULL,
  `updatedAt` bigint(20) DEFAULT NULL,
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп даних таблиці `report_preferences`
--

INSERT INTO `report_preferences` (`createdAt`, `updatedAt`, `id`, `name`) VALUES
(1513683584400, 1513683584400, 1, 'Phone'),
(1513683584400, 1513683584400, 2, 'Online');

-- --------------------------------------------------------

--
-- Структура таблиці `users`
--

CREATE TABLE `users` (
  `createdAt` bigint(20) DEFAULT NULL,
  `updatedAt` bigint(20) DEFAULT NULL,
  `id` int(11) NOT NULL,
  `psid` bigint(20) NOT NULL,
  `firstName` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `lastName` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `locale` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `timezone` tinyint(4) DEFAULT NULL,
  `gender` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблиці `user_locations`
--

CREATE TABLE `user_locations` (
  `createdAt` bigint(20) DEFAULT NULL,
  `updatedAt` bigint(20) DEFAULT NULL,
  `id` int(11) NOT NULL,
  `location` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `retrievedLocation` longtext COLLATE utf8_unicode_ci,
  `isRetrievedLocationCorrect` tinyint(1) DEFAULT NULL,
  `conversationId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Індекси збережених таблиць
--

--
-- Індекси таблиці `administrators`
--
ALTER TABLE `administrators`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Індекси таблиці `conversations`
--
ALTER TABLE `conversations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`);

--
-- Індекси таблиці `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`);

--
-- Індекси таблиці `police_agencies`
--
ALTER TABLE `police_agencies`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`);

--
-- Індекси таблиці `report_preferences`
--
ALTER TABLE `report_preferences`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Індекси таблиці `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`psid`),
  ADD UNIQUE KEY `id` (`id`),
  ADD UNIQUE KEY `psid` (`psid`);

--
-- Індекси таблиці `user_locations`
--
ALTER TABLE `user_locations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`);

--
-- AUTO_INCREMENT для збережених таблиць
--

--
-- AUTO_INCREMENT для таблиці `administrators`
--
ALTER TABLE `administrators`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблиці `conversations`
--
ALTER TABLE `conversations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблиці `messages`
--
ALTER TABLE `messages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблиці `police_agencies`
--
ALTER TABLE `police_agencies`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=240;
--
-- AUTO_INCREMENT для таблиці `report_preferences`
--
ALTER TABLE `report_preferences`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT для таблиці `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблиці `user_locations`
--
ALTER TABLE `user_locations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
-- phpMyAdmin SQL Dump
-- version 5.2.2deb1+deb13u1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Apr 19, 2026 at 10:54 AM
-- Server version: 11.8.6-MariaDB-0+deb13u1 from Debian
-- PHP Version: 8.4.16

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `mythdle`
--

-- --------------------------------------------------------

--
-- Table structure for table `characters`
--

CREATE TABLE `characters` (
  `id` int(11) NOT NULL,
  `name` text NOT NULL,
  `type` text NOT NULL,
  `environment` text NOT NULL,
  `morality` text NOT NULL,
  `culture` text NOT NULL,
  `era` text NOT NULL,
  `power` text NOT NULL,
  `hint` text NOT NULL,
  `image` text NOT NULL,
  `emoji` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `characters`
--

INSERT INTO `characters` (`id`, `name`, `type`, `environment`, `morality`, `culture`, `era`, `power`, `hint`, `image`, `emoji`) VALUES
(1, 'Perun', 'bůh', 'nebe', 'dobrý', 'pan-slovanská', 'mytologie', 'blesky', 'Bůh hromu a vládce blesků', '', '⛈️👑☁️⚡'),
(2, 'Morena', 'bohyně', 'zima', 'zlý', 'západoslovanská', 'mytologie', 'smrt', 'Bohyně zimy a smrti', '', '❄️💀🌑🥀'),
(3, 'Veles', 'bůh', 'podsvětí', 'neutrální', 'východoslovanská\r\n\r\n', 'mytologie\r\n\r\n', 'magie\r\n\r\n', 'Bůh podsvětí a protivník Peruna.\r\n\r\n', '', '🐍🌑🐄🔮'),
(4, 'Svarog', 'bůh', 'nebe', 'dobrý', 'východoslovanská', 'mytologie', 'slunce', 'Nebeský bůh spojený s ohňem.\r\n\r\n', '', '🔥☀️👨‍🏭🌌'),
(5, 'Dažbog', 'bůh', 'slunce', 'dobrý', 'východoslovanská', 'mytologie', 'slunce', 'Sluneční bůh přinášející světlo.\r\n\r\n', '', '☀️✨🌅🙏'),
(6, 'Stribog', 'bůh', 'vítr', 'neutrální', 'východoslovanská', 'mytologie', 'vítr', 'Bůh větru a bouří.\r\n\r\n', '', '🌬️🌪️🌫️'),
(7, 'Jarilo', 'bůh', 'jaro', 'dobrý', 'východoslovanská', 'mytologie', 'plodnost', 'Bůh jara a nového života.\r\n\r\n', '', '🌱🌸🌞🐑'),
(8, 'Mokoš', 'bohyně', 'země', 'dobrý', 'východoslovanská', 'mytologie', 'plodnost', 'Bohyně země a ženského osudu.\r\n\r\n', '', '🌍🧵🤰🌾'),
(9, 'Lada', 'bohyně', 'láska', 'dobrý', 'západoslovanská', 'mytologie', 'láska', 'Bohyně lásky a krásy.\r\n\r\n', '', '❤️🌹✨👩'),
(10, 'Svantovít', 'bůh', 'válka', 'dobrý', 'polská', 'mytologie', 'věštba', 'Čtyřhlavý bůh války a věštby.\r\n\r\n', '', '⚔️🐎🔮4️⃣'),
(11, 'Radegast', 'bůh', 'válka', 'neutrální', 'západoslovanská', 'mytologie', 'ochrana', 'Bůh pohostinnosti a války.\r\n\r\n', '', '🍞🍺⚔️🏰'),
(12, 'Triglav', 'bůh', 'svět', 'neutrální', 'balkánská', 'mytologie', 'vláda', 'Trojhlavý bůh vládnoucí světu.\r\n\r\n', '', '3️⃣👤🌍👑'),
(13, 'Svarožic', 'bůh', 'oheň', 'dobrý', 'západoslovanská', 'mytologie', 'oheň', 'Syn Svaroga, bůh ohně.\r\n\r\n', '', '🔥👶🌞'),
(14, 'Rod', 'bůh', 'stvoření', 'dobrý', 'východoslovanská', 'mytologie', 'stvoření', 'Prastaré stvořitelské božstvo.\r\n\r\n', '', '🌌👶🌱✨'),
(15, 'Živa', 'bohyně', 'život', 'dobrý', 'polská', 'mytologie', 'život', 'Bohyně života.\r\n\r\n', '', '🌿💚🌸👩'),
(16, 'Baba Jaga', 'démon', 'les', 'zlý', 'ruská', 'pohádka', 'čarodějnictví', 'Čarodějnice žijící v domku na kuřích nohách.\r\n\r\n', '', '🧙‍♀️🏚️🐔🌲'),
(17, 'Rusalka', 'duch', 'voda', 'neutrální', 'východoslovanská', 'folklór', 'svádění', 'Vodní duch v podobě krásné dívky.\r\n\r\n', '', '💧👩🌙🎶'),
(18, 'Vodník', 'démon', 'voda', 'neutrální', 'česká', 'folklór', 'utopení', 'Zelený vodní duch sbírající duše.', '', '🟢💧🫙🌊'),
(19, 'Domovoj', 'duch', 'dům', 'dobrý', 'ruská', 'folklór', 'ochrana', 'Ochranný duch domácnosti.\r\n\r\n', '', '🏠👴🔥🛏️'),
(20, 'Lesovik', 'duch', 'les', 'neutrální', 'ruská', 'folklór', 'iluze', 'Pán lesa, který mate poutníky.\r\n\r\n', '', '🌲👹🧭🌫️'),
(21, 'Upír', 'nemrtvý', 'noc', 'zlý', 'balkánská', 'folklór', 'krev', 'Nemrtvá bytost pijící krev.\r\n\r\n', '', '🧛‍♂️🩸🌙🦇'),
(22, 'Vlkodlak', 'bytost', 'les', 'neutrální', 'pan-slovanská', 'folklór', 'proměna', 'Člověk měnící se ve vlka.\r\n\r\n', '', '🐺🌕👤🔄'),
(23, 'Polednice', 'démon', 'pole', 'zlý', 'česká', 'folklór', 'strašení', 'Démon přicházející v poledne.\r\n\r\n', '', '🌾☀️👻⚠️'),
(24, 'Kikimora', 'démon', 'dům', 'zlý', 'ruská', 'folklór', 'strašení', 'Zlý domácí duch.', '', '🏠👻😈🛌'),
(25, 'Zmey', 'drak', 'nebe', 'zlý', 'balkáská', 'mytologie', 'oheň', 'Slovanský drak chrlící oheň.\r\n\r\n', '', '🐉🔥🌩️'),
(26, 'Čert', 'démon', 'peklo', 'zlý', 'česká', 'folklór', 'pokušení', 'Pekelný démon z pohádek.\r\n\r\n', '', '😈🔥🔱'),
(27, 'Víla', 'bytost', 'les', 'dobrý', 'pan-slovanská', 'folklór', 'magie', 'Krásná nadpřirozená bytost lesa.\r\n\r\n', '', '🧚‍♀️🌸🌲✨'),
(28, 'Bludička', 'duch', 'bažina', 'neutrální', 'česká', 'folklór', 'klamání', 'Světélko svádějící poutníky.\r\n\r\n', '', '🔥🌫️🧭🌙'),
(29, 'Hejkal', 'duch', 'les', 'neutrální', 'česká', 'folklór', 'křik', 'Lesní duch známý hlasitým křikem.\r\n\r\n', '', '🌲📣😱'),
(30, 'Hastrman', 'démon', 'voda', 'neutrální', 'česká', 'folklór', 'voda', 'Česká verze vodníka.\r\n\r\n', '', '💧🟢🎩🌊'),
(31, 'Bolotnik', 'duch', 'bažina', 'zlý', 'ruská', 'folklór', 'utopení', 'Duch bažiny.', '', '🌫️🟤💀💧'),
(32, 'Polevik', 'duch', 'pole', 'neutrální', 'ruská', 'folklór', 'ochrana', 'Duch polí.', '', '🌾👻🌞'),
(33, 'Poludnica', 'démon', 'pole', 'zlý', 'slovenská', 'folklór', 'strašení', 'Varianta Polednice.', '', '🌾☀️😈'),
(34, 'Bannik', 'duch', 'lázeň', 'neutrální', 'ruská', 'folklór', 'pára', 'Duch lážně.', '', '🛁♨️👻'),
(35, 'Ovinnik', 'duch', 'stodola', 'neutrální', 'ruská', 'folklór', 'oheň', 'Duch stodoly.', '', '🌾🔥🏚️'),
(36, 'Likho', 'démon', 'neštěstí', 'zlý', 'ruská', 'folklór', 'smůla', 'Démon neštěstí.', '', '👁️😈🍀❌'),
(37, 'Navka', 'duch', 'podsvětí', 'neutrální', 'česká', 'folklór', 'smrt', 'Duch mrtvých.\r\n\r\n', '', '👻⚰️🌑'),
(38, 'Strzyga', 'démon', 'noc', 'zlý', 'polská', 'folklór', 'krev', 'Upíří démon.\r\n\r\n', '', '🧛‍♀️🩸🦉🌙'),
(39, 'Alkonost', 'bytost', 'nebe', 'dobrý', 'ruská', 'mytologie', 'štěstí', 'Mystický pták štěstí.', '', '🐦🎶😊🍀'),
(40, 'Sirin', 'bytost', 'nebe', 'neutrální', 'ruská', 'mytolgie', 'zpěv', 'Mystický pták smrti.', '', '🐦🎶💀'),
(41, 'Gamajun', 'bytost', 'nebe', 'dobrý', 'ruská', 'mytologie', 'proroctví', 'Věštecký pták.', '', '🐦🔮📜'),
(42, 'Rarach', 'démon', 'oheň', 'neutrální', 'česká', 'folklór', 'oheň', 'Ohnivý démon.', '', '🔥🌪️👹'),
(43, 'Jitřenka', 'bohyně', 'ráno', 'neutrální', 'pan-slovanská', 'mytologie', 'naděje', 'Bohyně úsvitu a ranních červánků.\r\n\r\n', '', '🌅✨🌸'),
(44, 'Večernice', 'bohyně', 'večer', 'neutrální', 'pan-slovanská', 'mytologie', 'ochrana', 'Bohyně večera a noci.', '', '🌙🌆✨'),
(45, 'Simargl', 'bytost', 'rostliny', 'dobrý', 'ruská', 'mytologie', 'ochrana', 'Okřídlený pes  považován za ochránce semen, rostlin a zemědělství.\r\n\r\n', '', '🐕🪽🌱🔥'),
(46, 'Chors', 'bůh', 'slunce', 'dobrý', 'východoslovanská', 'mytologie', 'světlo', 'Slovanský bůh spojený se sluncem a světlem.\r\n\r\n', '', '☀️💡👑'),
(47, 'Devana', 'bohyně', 'les', 'dobrý', 'polská', 'mytologie', 'lov', 'Bohyně lovu a divoké přírody.', '', '🏹🌲🦌'),
(48, 'Dodola', 'bohyně', 'dobrý', 'dobrý', 'mytologie', 'folklór', 'déšť', 'Bytost nebo bohyně přivolávající déšť během sucha.\r\n\r\n', '', '🌧️💃🌿'),
(49, 'Kupala', 'duch', 'voda', 'neutrální', 'východoslovanská', 'folklór', 'očista', 'Duch nebo božstvo spojené se svátkem letního slunovratu.\r\n', '', '🔥💧🌞🌿'),
(50, 'Bies', 'démon', 'peklo', 'zlý', 'východoslovanská', 'folklór', 'pokušení', 'Zlý démon nebo ďábel ve slovanském folklóru\r\n\r\n', '', '😈🔥👿'),
(51, 'Praotec Čech', 'hrdina', 'země', 'dobrý', 'česká', 'pověst', 'vůdce', 'Zakladatel českého národa.\r\n\r\n', '', '🧔⛰️🇨🇿'),
(52, 'Krok', 'vládce', 'země', 'dobrý', 'česká', 'pověst', 'vláda', 'Otec Libuše.', '', '👑👨‍👧‍👧🇨🇿'),
(53, 'Libuše', 'vládkyně', 'věštba', 'dobrý', 'česká', 'pověst', 'proroctví', 'Kněžna, která prorokovala Prahu.', '', '👸🔮🏰'),
(54, 'Přemysl Oráč', 'vládce', 'země', 'dobrý', 'česká', 'pověst', 'vláda', 'Rolník, který se stal knížetem.', '', '🌾👑🚜'),
(55, 'Teta', 'čarodějka', 'magie', 'neutrální', 'česká', 'pověst', 'kouzla', 'Dcera knížete Kroka, známá znalostí magie a starých rituálů.', '', ' 🧙‍♀️📜✨'),
(56, 'Kazi', 'léčitelka', 'léčení', 'dobrý', 'česká', 'pověst', 'léčitelství', 'Dcera knížete Kroka, proslulá léčitelka z českých pověstí.', '', '🌿💊👩‍⚕️'),
(57, 'Bivoj', 'hrdina', 'les', 'dobrý', 'česká', 'pověst', 'síla', 'Hrdina, který zabil divokého kance.', '', '🐗💪🪓'),
(58, 'Horymír', 'rytíř', 'země', 'dobrý', 'česká', 'pověst', 'odvaha', 'Rytíř z legendy o Vyšehradu.', '', '🏇⚔️🏰'),
(59, 'Šemík', 'zvíře', 'země', 'dobrý', 'česká', 'pověst', 'rychlost', 'Kůň Horymíra.', '', '🐎💨💨 '),
(60, 'Blaničtí rytíři', 'hrdinové', 'hora', 'dobrý', 'česká', 'pověst', 'ochrana', 'Spící vojsko v hoře Blaník.', '', '🛡️⚔️⛰️😴'),
(61, 'Krakonoš', 'duch', 'hory', 'neutrální', 'česká', 'pohádka', 'počasí', 'Vládce Krakonoš.', '', '⛰️🌨️🧔🌲'),
(62, 'Hloupý Honza', 'hrdina', 'vesnice', 'dobrý', 'česká', 'pohádka', 'štěstí', 'Pohádkový hrdina, který uspěje díky štěstí.', '', '🧑‍🌾🍀😄'),
(63, 'Otesánek', 'bytost', 'dům', 'neutrální', 'česká', 'pohádka', 'hlad', 'Dřevěné dítě, které stále jí.', '', '🌳👶🍽️'),
(64, 'Dlouhý', 'bytost', 'pohádka', 'dobrý', 'česká', 'pohádka', 'natahování', 'Postava s extrémně dlouhým tělem.', '', '🧍📏↕️'),
(65, 'Široký', 'bytost', 'pohádka', 'dobrý', 'česká', 'pohádka', 'síla', 'Postava s obrovskou sílou.', '', '💪📦🧍'),
(66, 'Bystrozraký', 'bytost', 'pohádka', 'dobrý', 'česká', 'pohádka', 'zrak', 'Postava s neobyčejným zrakem.', '', '👁️🔭🎯'),
(67, 'Zlatovláska', 'princezna', 'království', 'dobrý', 'česká', 'pohádka', 'krása', 'Princezna se zlatými vlasy.', '', '👸💛✨'),
(68, 'Bílá paní', 'duch', 'hrad', 'neutrální', 'česká', 'folklór', 'zjevení', 'Duch objevující se na hradech.', '', '👻🤍🏰'),
(69, 'Černá paní', 'duch', 'hrad', 'zlý', 'česká', 'folklór', 'strašení', 'Temný duch na hradech.', '', '👻🖤🏰'),
(70, 'Permoník', 'duch', 'důl', 'neutrální', 'česká', 'folklór', 'ochrana', 'Duch dolů a horníků.;', '', '⛏️👷‍♂️👻'),
(71, 'Divoký muž', 'bytost', 'les', 'neutrální', 'pan-slovanská', 'folklór', 'síla', 'Divoký lesní obr.', '', '🌲🧌💪'),
(72, 'Psoglav', 'bytost', 'jeskyně', 'zlý', 'balkánská', 'folklór', 'síla', 'Bytost s psí hlavou.', '', '🐕👤💀'),
(73, 'Plivník', 'démon', 'oheň', 'neutrální', 'česká', 'folklór', 'bohatství', 'Ohnivý démon přinášející bohatství.', '', '🔥💰😈'),
(74, 'Zmora', 'démon', 'noc', 'zlý', 'polská', 'folklór', 'noční můry', 'Noční démon podobný More.', '', '😴👻🌙'),
(75, 'Vodní panna', 'bytost', 'voda', 'neutrální', 'pan-slovanská', 'folklór', 'zpěv', 'Vodní bytost podobná mořské panně.', '', '🧜‍♀️💧🎶'),
(76, 'Žitný mužík', 'duch', 'pole', 'neutrální', 'západoslovanská', 'folklór', 'ochrana', 'Duch obilí', '', '🌾👴🌞'),
(77, 'Studničná víla', 'bytost', 'voda', 'dobrý', 'česká', 'folklór', 'léčení', 'Víla žijící u studánek.', '', '💧🧚‍♀️🌿'),
(78, 'Skřítek', 'bytost', 'dům', 'neutrální', 'pan-slovanská', 'folklór', 'škodolibost', 'Malý domácí duch.', '', '🧝‍♂️🏠😏'),
(79, 'Kostěj Nesmrtelný', 'démon', 'magie', 'zlý', 'ruská', 'pohádka', 'nesmrtelnost', 'Zlý čaroděj, který nemůže zemřít.', '', '💀🔮❌⚰️'),
(80, 'Mora', 'démon', 'noc', 'zlý', 'západoslovanská', 'folklór', 'noční můry', 'Démon, který lidem ve spánku způsobuje noční můry.', '', '🌙😈😴');

-- --------------------------------------------------------

--
-- Table structure for table `daily_correct`
--

CREATE TABLE `daily_correct` (
  `date` date NOT NULL,
  `character_id` int(11) NOT NULL,
  `mode` enum('classic','emoji','image') NOT NULL DEFAULT 'classic'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `daily_correct`
--

INSERT INTO `daily_correct` (`date`, `character_id`, `mode`) VALUES
('2026-03-15', 2, 'classic'),
('2026-03-15', 1, 'emoji'),
('2026-03-15', 2, 'image'),
('2026-03-16', 2, 'classic'),
('2026-03-16', 1, 'emoji'),
('2026-03-16', 1, 'image'),
('2026-03-24', 16, 'classic'),
('2026-03-24', 27, 'emoji'),
('2026-03-24', 31, 'image'),
('2026-03-26', 40, 'classic'),
('2026-03-26', 40, 'emoji'),
('2026-03-26', 19, 'image'),
('2026-03-29', 40, 'classic'),
('2026-03-29', 15, 'emoji'),
('2026-03-29', 14, 'image'),
('2026-04-15', 57, 'classic'),
('2026-04-15', 24, 'emoji'),
('2026-04-15', 14, 'image'),
('2026-04-16', 35, 'classic'),
('2026-04-16', 56, 'emoji'),
('2026-04-16', 6, 'image'),
('2026-04-17', 74, 'classic'),
('2026-04-17', 68, 'emoji'),
('2026-04-17', 8, 'image'),
('2026-04-18', 24, 'classic'),
('2026-04-18', 6, 'emoji'),
('2026-04-18', 14, 'image'),
('2026-04-19', 18, 'classic'),
('2026-04-19', 63, 'emoji'),
('2026-04-19', 20, 'image');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `characters`
--
ALTER TABLE `characters`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `daily_correct`
--
ALTER TABLE `daily_correct`
  ADD PRIMARY KEY (`date`,`mode`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `characters`
--
ALTER TABLE `characters`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=81;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

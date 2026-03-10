-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Czas generowania: 16 Lut 2026, 11:05
-- Wersja serwera: 10.4.25-MariaDB
-- Wersja PHP: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Baza danych: `firma`
--

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `jednostki`
--

CREATE TABLE `jednostki` (
  `id` int(10) UNSIGNED NOT NULL,
  `nazwaJedn` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Zrzut danych tabeli `jednostki`
--

INSERT INTO `jednostki` (`id`, `nazwaJedn`) VALUES
(1, 'metry'),
(2, 'sztuki');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `materialy`
--

CREATE TABLE `materialy` (
  `id` int(10) UNSIGNED NOT NULL,
  `Producenci_id` int(10) UNSIGNED NOT NULL,
  `Jednostki_id` int(10) UNSIGNED NOT NULL,
  `nazwa` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `ilosc` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Zrzut danych tabeli `materialy`
--

INSERT INTO `materialy` (`id`, `Producenci_id`, `Jednostki_id`, `nazwa`, `ilosc`) VALUES
(1, 1, 1, 'Skrętka U/UTP drut', 20),
(2, 3, 1, 'Skrętka U/UTP linka', 2),
(3, 1, 2, 'Wtyk 8P8C', 10),
(4, 3, 2, 'Moduł Keystone', 30),
(5, 2, 2, 'Gniazdo pojedyncze', 2),
(6, 2, 2, 'Gniazdo podwójne', 5),
(7, 3, 2, 'Zaciskarka', 1);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `pracownicy`
--

CREATE TABLE `pracownicy` (
  `id` int(10) UNSIGNED NOT NULL,
  `stanowiska_id` int(10) UNSIGNED NOT NULL,
  `imie` varchar(20) DEFAULT NULL,
  `nazwisko1` varchar(50) DEFAULT NULL,
  `nazwisko` varchar(50) DEFAULT NULL,
  `adres` text DEFAULT NULL,
  `miasto` varchar(20) DEFAULT NULL,
  `czyRODO` tinyint(1) DEFAULT NULL,
  `czyBadania` tinyint(1) DEFAULT NULL,
  `dataUr` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Zrzut danych tabeli `pracownicy`
--

INSERT INTO `pracownicy` (`id`, `stanowiska_id`, `imie`, `nazwisko1`, `nazwisko`, `adres`, `miasto`, `czyRODO`, `czyBadania`, `dataUr`) VALUES
(1, 1, 'Jan', NULL, 'Nowak', 'ul. Grottgera 5', 'Bytom', 1, 1, '1975-06-09'),
(2, 1, 'Anna', NULL, 'Nowak', 'ul. Piekarska 6', 'Bytom', 1, 1, '1977-07-09'),
(3, 2, 'Katarzyna', NULL, 'Kowalska', 'ul. Klonowa 1', 'Bytom', 0, 1, '1966-06-20'),
(4, 3, 'Ewelina', NULL, 'Rak', 'ul. Musialika 20', 'Bytom', 1, 0, '1985-01-29'),
(5, 3, 'Joanna', NULL, 'Nowakowska', 'ul. Stawowa 6', 'Bytom', 1, 1, '1976-12-24'),
(6, 4, 'Krzysztof', NULL, 'Rostecki', 'ul. Piekarska 33', 'Bytom', 0, 0, '1982-06-09'),
(7, 4, 'Robert', NULL, 'Marcinkowski', 'ul. Szkolna 2', 'Bytom', 0, 1, '1975-06-09'),
(8, 4, 'Ewa', NULL, 'Maj', 'ul. Szkolna 4', 'Bytom', 1, 0, '1979-02-28'),
(9, 4, 'Piotr', NULL, 'Biernacki', 'ul. Jaworowa 10', 'Bytom', 1, 1, '1980-10-01'),
(10, 1, 'Renata', NULL, 'Leszczyńska', 'ul. Butsztynowa 3', 'Przodkowo', 0, 0, '1999-12-12');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `producenci`
--

CREATE TABLE `producenci` (
  `id` int(10) UNSIGNED NOT NULL,
  `nazwaProd` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Zrzut danych tabeli `producenci`
--

INSERT INTO `producenci` (`id`, `nazwaProd`) VALUES
(1, 'Netrack'),
(2, 'Ospel'),
(3, 'UGreen'),
(4, 'Dipol');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `stanowiska`
--

CREATE TABLE `stanowiska` (
  `id` int(10) UNSIGNED NOT NULL,
  `nazwa` varchar(20) DEFAULT NULL,
  `opis` text DEFAULT NULL,
  `placa` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Zrzut danych tabeli `stanowiska`
--

INSERT INTO `stanowiska` (`id`, `nazwa`, `opis`, `placa`) VALUES
(1, 'kierownik', 'kierownik grupy programistow', 6000),
(2, 'prezes', 'prezes firmy', 10000),
(3, 'sekretarka', 'prace biurowe i kadry', 3600),
(4, 'programista', 'programowanie aplikacji', 8000);

--
-- Indeksy dla zrzutów tabel
--

--
-- Indeksy dla tabeli `jednostki`
--
ALTER TABLE `jednostki`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `materialy`
--
ALTER TABLE `materialy`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `pracownicy`
--
ALTER TABLE `pracownicy`
  ADD PRIMARY KEY (`id`),
  ADD KEY `stanowisko_id_idx` (`stanowiska_id`);

--
-- Indeksy dla tabeli `producenci`
--
ALTER TABLE `producenci`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `stanowiska`
--
ALTER TABLE `stanowiska`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT dla zrzuconych tabel
--

--
-- AUTO_INCREMENT dla tabeli `jednostki`
--
ALTER TABLE `jednostki`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT dla tabeli `materialy`
--
ALTER TABLE `materialy`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT dla tabeli `pracownicy`
--
ALTER TABLE `pracownicy`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT dla tabeli `producenci`
--
ALTER TABLE `producenci`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT dla tabeli `stanowiska`
--
ALTER TABLE `stanowiska`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Ograniczenia dla zrzutów tabel
--

--
-- Ograniczenia dla tabeli `pracownicy`
--
ALTER TABLE `pracownicy`
  ADD CONSTRAINT `pracownicy_ibfk_1` FOREIGN KEY (`stanowiska_id`) REFERENCES `stanowiska` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: mysql:3306
-- Generation Time: Nov 25, 2023 at 09:46 PM
-- Server version: 8.0.32
-- PHP Version: 8.2.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `laravel`
--

-- --------------------------------------------------------

--
-- Table structure for table `data_bases_q_s`
--

CREATE TABLE IF NOT EXISTS `data_bases_q_s` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `Name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `prefix` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Description` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE IF NOT EXISTS `failed_jobs` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(16, '2014_10_12_000000_create_users_table', 1),
(17, '2014_10_12_100000_create_password_reset_tokens_table', 1),
(18, '2019_08_19_000000_create_failed_jobs_table', 1),
(19, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(20, '2023_11_24_233739_data_bases_q_s', 1),
(21, '2023_11_24_233758_q_db_molecules', 1),
(22, '2023_11_24_233805_q_db_radicals', 1),
(23, '2023_11_24_233808_q_db_solvents', 1),
(24, '2023_11_24_233809_q_db_references', 1),
(25, '2023_11_24_233810_q_db_k_overalls', 1),
(26, '2023_11_24_233819_q_db_pks', 1),
(27, '2023_11_24_233843_profile', 1),
(28, '2023_11_24_233849_password_resets', 1),
(29, '2023_11_24_234921_roles', 1),
(30, '2023_11_24_234945_role_user', 1);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE IF NOT EXISTS `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE IF NOT EXISTS `password_reset_tokens` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE IF NOT EXISTS `personal_access_tokens` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `profile`
--

CREATE TABLE IF NOT EXISTS `profile` (
  `Usuario` bigint UNSIGNED NOT NULL,
  `Descripcion` varchar(1000) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `imagen` varchar(300) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Grado` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`Usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `q_db_k_overalls`
--

CREATE TABLE IF NOT EXISTS `q_db_k_overalls` (
  `ID_K_OVERALL` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `ID_Molecule` bigint UNSIGNED NOT NULL,
  `radical` bigint UNSIGNED DEFAULT NULL,
  `Solvent` bigint UNSIGNED DEFAULT NULL,
  `Valor` float NOT NULL,
  `pH` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Tipo` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Descripcion` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ID_Alta` bigint UNSIGNED DEFAULT NULL,
  `id_reference` bigint UNSIGNED DEFAULT NULL,
  PRIMARY KEY (`ID_K_OVERALL`),
  KEY `q_db_k_overalls_id_molecule_foreign` (`ID_Molecule`),
  KEY `q_db_k_overalls_radical_foreign` (`radical`),
  KEY `q_db_k_overalls_solvent_foreign` (`Solvent`),
  KEY `q_db_k_overalls_id_alta_foreign` (`ID_Alta`),
  KEY `q_db_k_overalls_id_reference_foreign` (`id_reference`)
) ENGINE=InnoDB AUTO_INCREMENT=68 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `q_db_k_overalls`
--

INSERT INTO `q_db_k_overalls` (`ID_K_OVERALL`, `ID_Molecule`, `radical`, `Solvent`, `Valor`, `pH`, `Tipo`, `Descripcion`, `ID_Alta`, `id_reference`) VALUES
(1, 1, 1, 1, 30900000, '7.4', 'Theo. without f_M', '6-311+G(d,p) basis set, SMD continuum model and M06-2X functional', 4, NULL),
(3, 1, 1, 1, 1530000, '3', 'Theo. with f_M', '6-311+G(d,p) basis set, SMD continuum model and M06-2X functional', 4, NULL),
(4, 1, 1, 1, 3630000, '4', 'Theo. with f_M', '6-311+G(d,p) basis set, SMD continuum model and M06-2X functional', 4, NULL),
(5, 1, 1, 1, 4640000, '5', 'Theo. with f_M', '6-311+G(d,p) basis set, SMD continuum model and M06-2X functional', 4, NULL),
(6, 1, 1, 1, 971000, '6', 'Theo. with f_M', '6-311+G(d,p) basis set, SMD continuum model and M06-2X functional', 4, NULL),
(7, 1, 1, 1, 139000, '7', 'Theo. with f_M', '6-311+G(d,p) basis set, SMD continuum model and M06-2X functional', 4, NULL),
(8, 1, 1, 1, 77300, '7.4', 'Theo. with f_M', '6-311+G(d,p) basis set, SMD continuum model and M06-2X functional', 4, NULL),
(9, 1, 1, 1, 46600, '8', 'Theo. with f_M', '6-311+G(d,p) basis set, SMD continuum model and M06-2X functional', 4, NULL),
(10, 1, 1, 1, 35000, '9', 'Theo. with f_M', '6-311+G(d,p) basis set, SMD continuum model and M06-2X functional', 4, NULL),
(11, 1, 1, 1, 21100, '10', 'Theo. with f_M', '6-311+G(d,p) basis set, SMD continuum model and M06-2X functional', 4, NULL),
(12, 2, 2, 1, 27800000000, NULL, 'Theo. without f_M', NULL, 1, NULL),
(13, 2, 1, 1, 89600, NULL, 'Theo. without f_M', NULL, 4, NULL),
(14, 2, 1, 1, 410000, '7.4', 'Experimental', 'R. Amorati, A. Baschieri, G. Morroni, R. Gambino and L. Valgimigli, Chem. – Eur. J., 2016, 22, 7924–', 4, NULL),
(15, 2, 3, 1, 1720000000, NULL, 'Theo. without f_M', NULL, 1, NULL),
(16, 2, 3, 1, 6610000, NULL, 'Theo. without f_M', NULL, 1, NULL),
(17, 2, 4, 1, 7620000, NULL, 'Theo. without f_M', NULL, 1, NULL),
(18, 3, 2, 8, 0.00000000000103, NULL, 'Theo. with f_M', 'MPWB1K/6-311++G(d,p)', 3, NULL),
(19, 3, 2, 8, 0.00000000000183, NULL, 'Experimental', NULL, 3, NULL),
(20, 10, 1, 1, 244000000, '7.4', 'Theo. with f_M', NULL, 1, NULL),
(21, 10, 1, 1, 63600000, '6.8', 'Theo. with f_M', NULL, 1, NULL),
(22, 10, 1, 3, 33300, NULL, 'Theo. without f_M', NULL, 1, NULL),
(23, 10, 2, 1, 22900000000, '7.4', 'Theo. with f_M', NULL, 1, NULL),
(24, 10, 2, 1, 23700000000, '6.8', 'Theo. with f_M', NULL, 1, NULL),
(25, 10, 2, 1, 11000000000, '6.8', 'Theo. without f_M', NULL, 1, NULL),
(26, 10, 2, 3, 14500000000, NULL, 'Theo. without f_M', NULL, 1, NULL),
(27, 10, 5, 1, 760000000, '7.4', 'Theo. with f_M', NULL, 1, NULL),
(28, 10, 5, 1, 541000000, '6.8', 'Theo. with f_M', NULL, 1, NULL),
(29, 10, 5, 1, 370000000, '6.8', 'Theo. without f_M', NULL, 1, NULL),
(30, 10, 6, 1, 38900000, '7.4', 'Theo. with f_M', NULL, NULL, NULL),
(31, 10, 6, 1, 1360000000, '11', 'Theo. with f_M', NULL, NULL, NULL),
(32, 10, 6, 1, 300000000, '11', 'Theo. without f_M', NULL, NULL, NULL),
(53, 15, 1, 3, 166000, NULL, 'Theo. without f_M', '6-311+G(d,p) basis set and the SMD continuum model using the M06-2X functional', 4, NULL),
(54, 15, 1, 1, 1570000, '7.4', 'Theo. with f_M', '6-311+G(d,p) basis set and the SMD continuum model using the M06-2X functional', 4, NULL),
(55, 16, 1, 1, 2510000, '7.4', 'Theo. with f_M', '6-311+G(d,p) basis set and the SMD continuum model using the M06-2X functional', 4, NULL),
(56, 16, 1, 3, 129000, NULL, 'Theo. without f_M', '6-311+G(d,p) basis set and the SMD continuum model using the M06-2X functional', 4, NULL),
(57, 18, 1, 1, 1340000000, '7.4', 'Theo. with f_M', '.', 3, NULL),
(58, 18, 1, 3, 51800, NULL, 'Theo. without f_M', '.', 3, NULL),
(59, 3, 2, 8, 0.000000000292, NULL, 'Theo. with f_M', 'B3LYP/6-311++G(d,p)', 3, NULL),
(60, 3, 2, 8, 0.00000000000000116, NULL, 'Theo. with f_M', 'BH&HLYP/6-311++G(d,p)', 3, NULL),
(61, 3, 2, 8, 2.44e-17, NULL, 'Theo. with f_M', 'CCSD(T)//MP2/6-311++G(d,p)', 3, NULL),
(62, 3, 2, 8, 1.01e-16, NULL, 'Theo. with f_M', 'MP2/6-311++G(d,p)', 3, NULL),
(63, 3, 2, 8, 0.0000000000000022, NULL, 'Theo. with f_M', 'CCSD(T)//BH&HLYP/6-311++G(d,p)', 3, NULL),
(64, 3, 2, 8, 0.0000000000024, NULL, 'Theo. with f_M', 'CBS-QB3', 3, NULL),
(65, 2, 1, 2, 25000, NULL, 'Experimental', 'J. Cedrowski, G. Litwinienko, A. Baschieri and R. Amorati, Chem. – Eur. J., 2016, 22, 16441–16445.', 4, NULL),
(66, 2, 1, 4, 16000000, NULL, 'Experimental', 'J. Cedrowski, G. Litwinienko, A. Baschieri and R. Amorati, Chem. – Eur. J., 2016, 22, 16441–16445.', 4, NULL),
(67, 1, 1, 3, 2440000, NULL, 'Theo. without f_M', '6-311+G(d,p) basis set, SMD continuum model and M06-2X functional', 4, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `q_db_molecules`
--

CREATE TABLE IF NOT EXISTS `q_db_molecules` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `Name` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `RIS` text COLLATE utf8mb4_unicode_ci,
  `SMILE` text COLLATE utf8mb4_unicode_ci,
  `Imagen` text COLLATE utf8mb4_unicode_ci,
  `Description` varchar(1000) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Active` varchar(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `q_db_molecules`
--

INSERT INTO `q_db_molecules` (`id`, `Name`, `RIS`, `SMILE`, `Imagen`, `Description`, `Active`, `created_at`, `updated_at`) VALUES
(1, '3-hydroxyanthranilic acid', 'TY  - JOUR\r\nT1  - Dual antioxidant/pro-oxidant behavior of the tryptophan metabolite 3-hydroxyanthranilic acid: a theoretical investigation of reaction mechanisms and kinetics\r\nA1  - Pérez-González, Adriana\r\nA1  - Alvarez-Idaboy, Juan Raúl\r\nA1  - Galano, Annia\r\nY1  - 2017\r\nSP  - 3829\r\nEP  - 3845\r\nJF  - New Journal of Chemistry\r\nJO  - New J. Chem.\r\nVL  - 41\r\nIS  - 10\r\nPB  - The Royal Society of Chemistry\r\nSN  - 1144-0546\r\nDO  - 10.1039/C6NJ03980D\r\nM3  - 10.1039/C6NJ03980D\r\nUR  - http://dx.doi.org/10.1039/C6NJ03980D\r\nN2  - The antioxidant and pro-oxidant behavior of 3-hydroxyanthranilic acid was investigated using density functional theory. In the absence of metal ions 3-hydroxyanthranilic acid acts as an excellent antioxidant by scavenging free radicals. It was found to be an excellent peroxyl radical scavenger in both lipid and aqueous solution, reacting with ˙OOH faster than Trolox. Moreover, the gathered kinetic data support the idea that 3-hydroxyanthranilic acid significantly contributes to the antioxidant activity usually attributed to tryptophan. In contrast, in the presence of metal ions (at physiological pH) it exhibits pro-oxidant behavior. This behavior arises from the Cu(ii) reducing ability of the anionic fractions of this compound, which would contribute to producing Cu(i) and consequently promote ˙OH production via the Fenton reaction. Accordingly, the environmental factor identified to be crucial for ruling the dual behavior of 3-hydroxyanthranilic acid is the presence of metal ions. In addition, the pH is also predicted to influence the pro-oxidant effects of this compound.\r\nER  - \r\n', 'C1=C(C(=O)O)C(N)=C(C=C1)O', '3-hydroxyanthranilic_acid.jpg', NULL, 'true', NULL, NULL),
(2, 'Trolox', 'TY  - JOUR\r\n\r\nID  - 1\r\n\r\nA1  - Pérez-González, Adriana\r\n\r\nA1  - Alvarez-Idaboy, Juan Raúl\r\n\r\nA1  - Galano, Annia\r\n\r\nT1  - Dual antioxidant/pro-oxidant behavior of the tryptophan metabolite 3-hydroxyanthranilic acid: a theoretical investigation of reaction mechanisms and kineticsElectronic supplementary information (ESI): Molar fractions at different pH; equilibrium constants; reorganization energies, Gibbs energy of activation and rate constants for the Cu(ii) reduction; structures of some Cu complexes; and Cartesian coordinates of the optimized geometries. See DOI: 10.1039/c6nj03980d\r\n\r\nY1  - 2017\r\n\r\nVL  - 41\r\n\r\nIS  - 1\r\n\r\nSP  - 3829\r\n\r\nEP  - 3845\r\n\r\nAB  - The antioxidant and pro-oxidant behavior of 3-hydroxyanthranilic acid was investigated using density functional theory. In the absence of metal ions 3-hydroxyanthranilic acid acts as an excellent antioxidant by scavenging free radicals. It was found to be an excellent peroxyl radical scavenger in both lipid and aqueous solution, reacting with &z.rad;OOH faster than Trolox. Moreover, the gathered kinetic data support the idea that 3-hydroxyanthranilic acid significantly contributes to the antioxidant activity usually attributed to tryptophan. In contrast, in the presence of metal ions (at physiological pH) it exhibits pro-oxidant behavior. This behavior arises from the Cu( ii ) reducing ability of the anionic fractions of this compound, which would contribute to producing Cu( i ) and consequently promote &z.rad;OH production via the Fenton reaction. Accordingly, the environmental factor identified to be crucial for ruling the dual behavior of 3-hydroxyanthranilic acid is the presence of metal ions. In addition, the pH is also predicted to influence the pro-oxidant effects of this compound. Potent antioxidant in the absence of metal ions, responsible for the activity usually attributed to tryptophan. Pro-oxidant in the presence of metal ions; this effect increases with the pH.\r\n\r\nSN  - 1144-0546\r\n\r\nU5  - http://www.syndetics.com/index.aspx?isbn=/sc.gif&issn=1144-0546&client=conricyt;http://www.syndetics.com/index.aspx?isbn=/mc.gif&issn=1144-0546&client=conricyt;http://www.syndetics.com/index.aspx?isbn=/lc.gif&issn=1144-0546&client=conricyt;\r\n\r\nU6  - ctx_ver=Z39.88-2004&ctx_enc=info%3Aofi%2Fenc%3AUTF-8&rfr_id=info%3Asid%2Fsummon.serialssolutions.com&rft_val_fmt=info%3Aofi%2Ffmt%3Akev%3Amtx%3Ajournal&rft.genre=article&rft.atitle=Dual+antioxidant%2Fpro-oxidant+behavior+of+the+tryptophan+metabolite+3-hydroxyanthranilic+acid%3A+a+theoretical+investigation+of+reaction+mechanisms+and+kineticsElectronic+supplementary+information+%28ESI%29%3A+Molar+fractions+at+different+pH%3B+equilibrium+constants%3B+reorganization+energies%2C+Gibbs+energy+of+activation+and+rate+constants+for+the+Cu%28ii%29+reduction%3B+structures+of+some+Cu+complexes%3B+and+Cartesian+coordinates+of+the+optimized+geometries.+See+DOI%3A+10.1039%2Fc6nj03980d&rft.au=P%C3%A9rez-Gonz%C3%A1lez%2C+Adriana&rft.au=Alvarez-Idaboy%2C+Juan+Ra%C3%BAl&rft.au=Galano%2C+Annia&rft.date=2017-05-15&rft.issn=1144-0546&rft.eissn=1369-9261&rft.volume=41&rft.issue=1&rft.spage=3829&rft.epage=3845&rft_id=info:doi/10.1039%2Fc6nj03980d&rft.externalDocID=c6nj03980d&paramdict=en-US\r\n\r\nU7  - Journal Article\r\n\r\nUR  - http://conricytuam.summon.serialssolutions.com/2.0.0/link/0/eLvHCXMwtZ1bb9MwFMcNdA_AA-I2cRs6L0ibStiatGm7iocu6y4SCImO58lJPDAsSUkTtO578n04x67tlA0JHnipGic9cRP_7BPnnL8ZC_w3O95vfUKPVMI576c4XAz7Iu72_dDvpjshF8NwEHeU7PbgZOofvPOjm62WSY1xhf_1zmMZ3nvKpP2Hu2-NYgF-xzaAn9gK8POv2sF-rdQA8AQXMuWkMnCAnaa33LJp-iZWoCoXM9IaQOwzUWELoRzlduB9WaQU8MJpXQWeS5LG5olMda50MxtSOuEO7YqiV6qXI88EZRnLeaZlob-hf0sa0RO3EM-clhjV4ewl5SPazErygyfT41f-kE74nh7H22eltjunfEyzzkvVnh3RqgTiey1VNkOdUWA9ucDVnHaUomhkn7ZJdJuEMtTrARnHc12iwg7IvJ6w1kH46JU7WzY8M6qxblLS7EpJMrg6WGavrYV561KL-s6LjA7VEfziQqi6kNWIYmpVImtSFAhrTr6_uRkF9ueZvMRngs8CDVRqWgO7d9He_3Cs5nKUnAFpuSZh_hW_DXZSO9jpGIhSXHqHRX6ptjrn-oXBOMWWl9sReXz-g9NxxynecL2EdU2vdjj9aG9sg3AOKQ5W50XlueTNGSP0QkhsttcY5PAhGsuWU79ClwXh0Bv6WhjfjIxakmylB9DDXDBYTlOJ5aaWBL0yHF97BVblzRs7Sew-S2VSvRW592l6i635WKtei619nEaTsX052OlrGWTzN4zqcDDcdtbQVyzNGj7KVzy5z-4tH_JgrGl8wG6K_CG7HZm1FR_d-ElUQoPK7QaTYJiE4gywGYBjEhyTcB2TQEzuAocGkbBCJNk0RIIjEuuSwlUiYYVIaBAJm8jj1i4oFsGyCLwCyyLMjkbQIBEsPSNY5RAMh69BUai3F1RZR6GqI1Ho7ADWR12iqN6UcgssgSNw_JEV4g8PAsvfSFmz9EGDPnPZLX3QoA-QPkD6duFqY3jMNg4mJ9GRh03idKZlfE7d7mCdtfIiF08YBLx3lgSiF_Mg7PLUj7u9JI1D7nfibjceJE_Z-vU2nv1px3N2x0H4grXw34sNdhevFDq6i6rm2ctlA_8FBMZpbw\r\n\r\nDO  - 10.1039/c6nj03980d\r\n\r\nM1  - Journal Article\r\n\r\nER  -', 'CC1=C(C(=C2CCC(OC2=C1C)(C)C(=O)O)C)O', 'Trolox.jpg', 'Reference Antioxident', 'true', NULL, NULL),
(3, 'Acetylene', 'TY  - JOUR\r\nAU  - Galano, Annia\r\nAU  - Ruiz-Suárez, Luis Gerardo\r\nAU  - Vivier-Bunge, Annik\r\nPY  - 2008\r\nDA  - 2008/12/01\r\nTI  - On the mechanism of the OH initiated oxidation of acetylene in the presence of O2 and NOx\r\nJO  - Theoretical Chemistry Accounts\r\nSP  - 219\r\nEP  - 225\r\nVL  - 121\r\nIS  - 5\r\nAB  - The mechanism of the oxidation of acetylene, in the presence of O2 and NOx, has been studied. Different levels of theory have been tested for the first step of the mechanism: the acetylene + OH radical reaction. Based on these results the meta-hybrid functional MPWB1K has been chosen for modeling all the other steps involved in the oxidation of acetylene. Different reaction paths have been considered and the one leading to glyoxal formation and OH regeneration is predicted to be the main channel, independently of the presence of NOx. Two different mechanisms were modeled to account for formic acid formation, both of them involving cyclic intermediates. According to the computed activation free energies, the three-membered intermediate seems to be more likely to occur than the four-membered one. However, reaction barriers are very high and only a very small proportion of formic acid is expected to be formed through such intermediates. In the presence of NOx, considered in this work for the first time, the main product of the tropospheric oxidation of acetylene is also expected to be glyoxal.\r\nSN  - 1432-2234\r\nUR  - https://doi.org/10.1007/s00214-008-0467-y\r\nDO  - 10.1007/s00214-008-0467-y\r\nID  - Galano2008\r\nER  -', 'C@C', 'Acetylenee.png', NULL, 'true', NULL, NULL),
(4, 'Phenol', 'TY  - JOUR\r\nT1  - Comprehensive Investigation of the Antioxidant and Pro-oxidant Effects of Phenolic Compounds: A Double-Edged Sword in the Context of Oxidative Stress?\r\nAU  - Castañeda-Arriaga, Romina\r\nAU  - Pérez-González, Adriana\r\nAU  - Reina, Miguel\r\nAU  - Alvarez-Idaboy, J. Raúl\r\nAU  - Galano, Annia\r\nY1  - 2018/06/14\r\nPY  - 2018\r\nDA  - 2018/06/14\r\nN1  - doi: 10.1021/acs.jpcb.8b03500\r\nDO  - 10.1021/acs.jpcb.8b03500\r\nT2  - The Journal of Physical Chemistry B\r\nJF  - The Journal of Physical Chemistry B\r\nJO  - J. Phys. Chem. B\r\nSP  - 6198\r\nEP  - 6214\r\nVL  - 122\r\nIS  - 23\r\nPB  - American Chemical Society\r\nN2  - Oxidative stress (OS) is a health-threatening process that is involved, at least partially, in the development of several diseases. Although antioxidants can be used as a chemical defense against OS, they might also exhibit pro-oxidant effects, depending on environmental conditions. In this work, such a dual behavior was investigated for phenolic compounds (PhCs) within the framework of the density functional theory and based on kinetic data. Multiple reaction mechanisms were considered in both cases. The presence of redox metals, the pH, and the possibility that PhCs might be transformed into benzoquinones were identified as key aspects in the antioxidant versus pro-oxidant effects of these compounds. The main virtues of PhCs as antioxidants are their radical trapping activity, their regeneration under physiological conditions, and their behavior as OH-inactivating ligands. The main risks of PhCs as pro-oxidants are predicted to be the role of phenolate ions in the reduction of metal ions, which can promote Fenton-like reactions, and the formation of benzoquinones that might cause protein arylation at cysteine sites. Although the benefits seem to overcome the hazards, to properly design chemical strategies against OS using PhCs, it is highly recommended to carefully explore their duality in this context.\r\nAB  - Oxidative stress (OS) is a health-threatening process that is involved, at least partially, in the development of several diseases. Although antioxidants can be used as a chemical defense against OS, they might also exhibit pro-oxidant effects, depending on environmental conditions. In this work, such a dual behavior was investigated for phenolic compounds (PhCs) within the framework of the density functional theory and based on kinetic data. Multiple reaction mechanisms were considered in both cases. The presence of redox metals, the pH, and the possibility that PhCs might be transformed into benzoquinones were identified as key aspects in the antioxidant versus pro-oxidant effects of these compounds. The main virtues of PhCs as antioxidants are their radical trapping activity, their regeneration under physiological conditions, and their behavior as OH-inactivating ligands. The main risks of PhCs as pro-oxidants are predicted to be the role of phenolate ions in the reduction of metal ions, which can promote Fenton-like reactions, and the formation of benzoquinones that might cause protein arylation at cysteine sites. Although the benefits seem to overcome the hazards, to properly design chemical strategies against OS using PhCs, it is highly recommended to carefully explore their duality in this context.\r\nSN  - 1520-6106\r\nM3  - doi: 10.1021/acs.jpcb.8b03500\r\nUR  - https://doi.org/10.1021/acs.jpcb.8b03500\r\nER  - \r\n', 'c1ccc(cc1)O', 'Phenol.png', NULL, 'true', NULL, NULL),
(5, 'Catechol', 'TY  - JOUR\r\nT1  - Comprehensive Investigation of the Antioxidant and Pro-oxidant Effects of Phenolic Compounds: A Double-Edged Sword in the Context of Oxidative Stress?\r\nAU  - Castañeda-Arriaga, Romina\r\nAU  - Pérez-González, Adriana\r\nAU  - Reina, Miguel\r\nAU  - Alvarez-Idaboy, J. Raúl\r\nAU  - Galano, Annia\r\nY1  - 2018/06/14\r\nPY  - 2018\r\nDA  - 2018/06/14\r\nN1  - doi: 10.1021/acs.jpcb.8b03500\r\nDO  - 10.1021/acs.jpcb.8b03500\r\nT2  - The Journal of Physical Chemistry B\r\nJF  - The Journal of Physical Chemistry B\r\nJO  - J. Phys. Chem. B\r\nSP  - 6198\r\nEP  - 6214\r\nVL  - 122\r\nIS  - 23\r\nPB  - American Chemical Society\r\nN2  - Oxidative stress (OS) is a health-threatening process that is involved, at least partially, in the development of several diseases. Although antioxidants can be used as a chemical defense against OS, they might also exhibit pro-oxidant effects, depending on environmental conditions. In this work, such a dual behavior was investigated for phenolic compounds (PhCs) within the framework of the density functional theory and based on kinetic data. Multiple reaction mechanisms were considered in both cases. The presence of redox metals, the pH, and the possibility that PhCs might be transformed into benzoquinones were identified as key aspects in the antioxidant versus pro-oxidant effects of these compounds. The main virtues of PhCs as antioxidants are their radical trapping activity, their regeneration under physiological conditions, and their behavior as OH-inactivating ligands. The main risks of PhCs as pro-oxidants are predicted to be the role of phenolate ions in the reduction of metal ions, which can promote Fenton-like reactions, and the formation of benzoquinones that might cause protein arylation at cysteine sites. Although the benefits seem to overcome the hazards, to properly design chemical strategies against OS using PhCs, it is highly recommended to carefully explore their duality in this context.\r\nAB  - Oxidative stress (OS) is a health-threatening process that is involved, at least partially, in the development of several diseases. Although antioxidants can be used as a chemical defense against OS, they might also exhibit pro-oxidant effects, depending on environmental conditions. In this work, such a dual behavior was investigated for phenolic compounds (PhCs) within the framework of the density functional theory and based on kinetic data. Multiple reaction mechanisms were considered in both cases. The presence of redox metals, the pH, and the possibility that PhCs might be transformed into benzoquinones were identified as key aspects in the antioxidant versus pro-oxidant effects of these compounds. The main virtues of PhCs as antioxidants are their radical trapping activity, their regeneration under physiological conditions, and their behavior as OH-inactivating ligands. The main risks of PhCs as pro-oxidants are predicted to be the role of phenolate ions in the reduction of metal ions, which can promote Fenton-like reactions, and the formation of benzoquinones that might cause protein arylation at cysteine sites. Although the benefits seem to overcome the hazards, to properly design chemical strategies against OS using PhCs, it is highly recommended to carefully explore their duality in this context.\r\nSN  - 1520-6106\r\nM3  - doi: 10.1021/acs.jpcb.8b03500\r\nUR  - https://doi.org/10.1021/acs.jpcb.8b03500\r\nER  - ', 'Oc1c(O)cccc1', 'Catechol.png', NULL, 'true', NULL, NULL),
(6, 'Pyrogallol', 'TY  - JOUR\r\nT1  - Comprehensive Investigation of the Antioxidant and Pro-oxidant Effects of Phenolic Compounds: A Double-Edged Sword in the Context of Oxidative Stress?\r\nAU  - Castañeda-Arriaga, Romina\r\nAU  - Pérez-González, Adriana\r\nAU  - Reina, Miguel\r\nAU  - Alvarez-Idaboy, J. Raúl\r\nAU  - Galano, Annia\r\nY1  - 2018/06/14\r\nPY  - 2018\r\nDA  - 2018/06/14\r\nN1  - doi: 10.1021/acs.jpcb.8b03500\r\nDO  - 10.1021/acs.jpcb.8b03500\r\nT2  - The Journal of Physical Chemistry B\r\nJF  - The Journal of Physical Chemistry B\r\nJO  - J. Phys. Chem. B\r\nSP  - 6198\r\nEP  - 6214\r\nVL  - 122\r\nIS  - 23\r\nPB  - American Chemical Society\r\nN2  - Oxidative stress (OS) is a health-threatening process that is involved, at least partially, in the development of several diseases. Although antioxidants can be used as a chemical defense against OS, they might also exhibit pro-oxidant effects, depending on environmental conditions. In this work, such a dual behavior was investigated for phenolic compounds (PhCs) within the framework of the density functional theory and based on kinetic data. Multiple reaction mechanisms were considered in both cases. The presence of redox metals, the pH, and the possibility that PhCs might be transformed into benzoquinones were identified as key aspects in the antioxidant versus pro-oxidant effects of these compounds. The main virtues of PhCs as antioxidants are their radical trapping activity, their regeneration under physiological conditions, and their behavior as OH-inactivating ligands. The main risks of PhCs as pro-oxidants are predicted to be the role of phenolate ions in the reduction of metal ions, which can promote Fenton-like reactions, and the formation of benzoquinones that might cause protein arylation at cysteine sites. Although the benefits seem to overcome the hazards, to properly design chemical strategies against OS using PhCs, it is highly recommended to carefully explore their duality in this context.\r\nAB  - Oxidative stress (OS) is a health-threatening process that is involved, at least partially, in the development of several diseases. Although antioxidants can be used as a chemical defense against OS, they might also exhibit pro-oxidant effects, depending on environmental conditions. In this work, such a dual behavior was investigated for phenolic compounds (PhCs) within the framework of the density functional theory and based on kinetic data. Multiple reaction mechanisms were considered in both cases. The presence of redox metals, the pH, and the possibility that PhCs might be transformed into benzoquinones were identified as key aspects in the antioxidant versus pro-oxidant effects of these compounds. The main virtues of PhCs as antioxidants are their radical trapping activity, their regeneration under physiological conditions, and their behavior as OH-inactivating ligands. The main risks of PhCs as pro-oxidants are predicted to be the role of phenolate ions in the reduction of metal ions, which can promote Fenton-like reactions, and the formation of benzoquinones that might cause protein arylation at cysteine sites. Although the benefits seem to overcome the hazards, to properly design chemical strategies against OS using PhCs, it is highly recommended to carefully explore their duality in this context.\r\nSN  - 1520-6106\r\nM3  - doi: 10.1021/acs.jpcb.8b03500\r\nUR  - https://doi.org/10.1021/acs.jpcb.8b03500\r\nER  - ', 'Oc1cccc(O)c1O', 'Pyrogallol.png', NULL, 'true', NULL, NULL),
(7, 'p-hydroxybenzoic acid', 'TY  - JOUR\r\nT1  - Comprehensive Investigation of the Antioxidant and Pro-oxidant Effects of Phenolic Compounds: A Double-Edged Sword in the Context of Oxidative Stress?\r\nAU  - Castañeda-Arriaga, Romina\r\nAU  - Pérez-González, Adriana\r\nAU  - Reina, Miguel\r\nAU  - Alvarez-Idaboy, J. Raúl\r\nAU  - Galano, Annia\r\nY1  - 2018/06/14\r\nPY  - 2018\r\nDA  - 2018/06/14\r\nN1  - doi: 10.1021/acs.jpcb.8b03500\r\nDO  - 10.1021/acs.jpcb.8b03500\r\nT2  - The Journal of Physical Chemistry B\r\nJF  - The Journal of Physical Chemistry B\r\nJO  - J. Phys. Chem. B\r\nSP  - 6198\r\nEP  - 6214\r\nVL  - 122\r\nIS  - 23\r\nPB  - American Chemical Society\r\nN2  - Oxidative stress (OS) is a health-threatening process that is involved, at least partially, in the development of several diseases. Although antioxidants can be used as a chemical defense against OS, they might also exhibit pro-oxidant effects, depending on environmental conditions. In this work, such a dual behavior was investigated for phenolic compounds (PhCs) within the framework of the density functional theory and based on kinetic data. Multiple reaction mechanisms were considered in both cases. The presence of redox metals, the pH, and the possibility that PhCs might be transformed into benzoquinones were identified as key aspects in the antioxidant versus pro-oxidant effects of these compounds. The main virtues of PhCs as antioxidants are their radical trapping activity, their regeneration under physiological conditions, and their behavior as OH-inactivating ligands. The main risks of PhCs as pro-oxidants are predicted to be the role of phenolate ions in the reduction of metal ions, which can promote Fenton-like reactions, and the formation of benzoquinones that might cause protein arylation at cysteine sites. Although the benefits seem to overcome the hazards, to properly design chemical strategies against OS using PhCs, it is highly recommended to carefully explore their duality in this context.\r\nAB  - Oxidative stress (OS) is a health-threatening process that is involved, at least partially, in the development of several diseases. Although antioxidants can be used as a chemical defense against OS, they might also exhibit pro-oxidant effects, depending on environmental conditions. In this work, such a dual behavior was investigated for phenolic compounds (PhCs) within the framework of the density functional theory and based on kinetic data. Multiple reaction mechanisms were considered in both cases. The presence of redox metals, the pH, and the possibility that PhCs might be transformed into benzoquinones were identified as key aspects in the antioxidant versus pro-oxidant effects of these compounds. The main virtues of PhCs as antioxidants are their radical trapping activity, their regeneration under physiological conditions, and their behavior as OH-inactivating ligands. The main risks of PhCs as pro-oxidants are predicted to be the role of phenolate ions in the reduction of metal ions, which can promote Fenton-like reactions, and the formation of benzoquinones that might cause protein arylation at cysteine sites. Although the benefits seem to overcome the hazards, to properly design chemical strategies against OS using PhCs, it is highly recommended to carefully explore their duality in this context.\r\nSN  - 1520-6106\r\nM3  - doi: 10.1021/acs.jpcb.8b03500\r\nUR  - https://doi.org/10.1021/acs.jpcb.8b03500\r\nER  - ', 'O=C(O)c1ccc(O)cc1', 'phydroxybenzoic.png', NULL, 'true', NULL, NULL),
(8, 'p-nitrophenol', 'TY  - JOUR\r\nT1  - Comprehensive Investigation of the Antioxidant and Pro-oxidant Effects of Phenolic Compounds: A Double-Edged Sword in the Context of Oxidative Stress?\r\nAU  - Castañeda-Arriaga, Romina\r\nAU  - Pérez-González, Adriana\r\nAU  - Reina, Miguel\r\nAU  - Alvarez-Idaboy, J. Raúl\r\nAU  - Galano, Annia\r\nY1  - 2018/06/14\r\nPY  - 2018\r\nDA  - 2018/06/14\r\nN1  - doi: 10.1021/acs.jpcb.8b03500\r\nDO  - 10.1021/acs.jpcb.8b03500\r\nT2  - The Journal of Physical Chemistry B\r\nJF  - The Journal of Physical Chemistry B\r\nJO  - J. Phys. Chem. B\r\nSP  - 6198\r\nEP  - 6214\r\nVL  - 122\r\nIS  - 23\r\nPB  - American Chemical Society\r\nN2  - Oxidative stress (OS) is a health-threatening process that is involved, at least partially, in the development of several diseases. Although antioxidants can be used as a chemical defense against OS, they might also exhibit pro-oxidant effects, depending on environmental conditions. In this work, such a dual behavior was investigated for phenolic compounds (PhCs) within the framework of the density functional theory and based on kinetic data. Multiple reaction mechanisms were considered in both cases. The presence of redox metals, the pH, and the possibility that PhCs might be transformed into benzoquinones were identified as key aspects in the antioxidant versus pro-oxidant effects of these compounds. The main virtues of PhCs as antioxidants are their radical trapping activity, their regeneration under physiological conditions, and their behavior as OH-inactivating ligands. The main risks of PhCs as pro-oxidants are predicted to be the role of phenolate ions in the reduction of metal ions, which can promote Fenton-like reactions, and the formation of benzoquinones that might cause protein arylation at cysteine sites. Although the benefits seem to overcome the hazards, to properly design chemical strategies against OS using PhCs, it is highly recommended to carefully explore their duality in this context.\r\nAB  - Oxidative stress (OS) is a health-threatening process that is involved, at least partially, in the development of several diseases. Although antioxidants can be used as a chemical defense against OS, they might also exhibit pro-oxidant effects, depending on environmental conditions. In this work, such a dual behavior was investigated for phenolic compounds (PhCs) within the framework of the density functional theory and based on kinetic data. Multiple reaction mechanisms were considered in both cases. The presence of redox metals, the pH, and the possibility that PhCs might be transformed into benzoquinones were identified as key aspects in the antioxidant versus pro-oxidant effects of these compounds. The main virtues of PhCs as antioxidants are their radical trapping activity, their regeneration under physiological conditions, and their behavior as OH-inactivating ligands. The main risks of PhCs as pro-oxidants are predicted to be the role of phenolate ions in the reduction of metal ions, which can promote Fenton-like reactions, and the formation of benzoquinones that might cause protein arylation at cysteine sites. Although the benefits seem to overcome the hazards, to properly design chemical strategies against OS using PhCs, it is highly recommended to carefully explore their duality in this context.\r\nSN  - 1520-6106\r\nM3  - doi: 10.1021/acs.jpcb.8b03500\r\nUR  - https://doi.org/10.1021/acs.jpcb.8b03500\r\nER  - ', 'c1cc(ccc1[N+](=O)[O-])O', 'pnitrophenol.png', NULL, 'true', NULL, NULL),
(9, 'p-aminophenol', 'TY  - JOUR\r\nT1  - Comprehensive Investigation of the Antioxidant and Pro-oxidant Effects of Phenolic Compounds: A Double-Edged Sword in the Context of Oxidative Stress?\r\nAU  - Castañeda-Arriaga, Romina\r\nAU  - Pérez-González, Adriana\r\nAU  - Reina, Miguel\r\nAU  - Alvarez-Idaboy, J. Raúl\r\nAU  - Galano, Annia\r\nY1  - 2018/06/14\r\nPY  - 2018\r\nDA  - 2018/06/14\r\nN1  - doi: 10.1021/acs.jpcb.8b03500\r\nDO  - 10.1021/acs.jpcb.8b03500\r\nT2  - The Journal of Physical Chemistry B\r\nJF  - The Journal of Physical Chemistry B\r\nJO  - J. Phys. Chem. B\r\nSP  - 6198\r\nEP  - 6214\r\nVL  - 122\r\nIS  - 23\r\nPB  - American Chemical Society\r\nN2  - Oxidative stress (OS) is a health-threatening process that is involved, at least partially, in the development of several diseases. Although antioxidants can be used as a chemical defense against OS, they might also exhibit pro-oxidant effects, depending on environmental conditions. In this work, such a dual behavior was investigated for phenolic compounds (PhCs) within the framework of the density functional theory and based on kinetic data. Multiple reaction mechanisms were considered in both cases. The presence of redox metals, the pH, and the possibility that PhCs might be transformed into benzoquinones were identified as key aspects in the antioxidant versus pro-oxidant effects of these compounds. The main virtues of PhCs as antioxidants are their radical trapping activity, their regeneration under physiological conditions, and their behavior as OH-inactivating ligands. The main risks of PhCs as pro-oxidants are predicted to be the role of phenolate ions in the reduction of metal ions, which can promote Fenton-like reactions, and the formation of benzoquinones that might cause protein arylation at cysteine sites. Although the benefits seem to overcome the hazards, to properly design chemical strategies against OS using PhCs, it is highly recommended to carefully explore their duality in this context.\r\nAB  - Oxidative stress (OS) is a health-threatening process that is involved, at least partially, in the development of several diseases. Although antioxidants can be used as a chemical defense against OS, they might also exhibit pro-oxidant effects, depending on environmental conditions. In this work, such a dual behavior was investigated for phenolic compounds (PhCs) within the framework of the density functional theory and based on kinetic data. Multiple reaction mechanisms were considered in both cases. The presence of redox metals, the pH, and the possibility that PhCs might be transformed into benzoquinones were identified as key aspects in the antioxidant versus pro-oxidant effects of these compounds. The main virtues of PhCs as antioxidants are their radical trapping activity, their regeneration under physiological conditions, and their behavior as OH-inactivating ligands. The main risks of PhCs as pro-oxidants are predicted to be the role of phenolate ions in the reduction of metal ions, which can promote Fenton-like reactions, and the formation of benzoquinones that might cause protein arylation at cysteine sites. Although the benefits seem to overcome the hazards, to properly design chemical strategies against OS using PhCs, it is highly recommended to carefully explore their duality in this context.\r\nSN  - 1520-6106\r\nM3  - doi: 10.1021/acs.jpcb.8b03500\r\nUR  - https://doi.org/10.1021/acs.jpcb.8b03500\r\nER  - ', 'Oc1ccc(N)cc1', 'paminophenol.png', NULL, 'true', NULL, NULL),
(10, 'Sesamol', 'TY  - JOUR\r\nT1  - Physicochemical Insights on the Free Radical Scavenging Activity of Sesamol: Importance of the Acid/Base Equilibrium\r\nAU  - Galano, Annia\r\nAU  - Alvarez-Idaboy, Juan Raúl\r\nAU  - Francisco-Márquez, Misaela\r\nY1  - 2011/11/10\r\nPY  - 2011\r\nDA  - 2011/11/10\r\nN1  - doi: 10.1021/jp208315k\r\nDO  - 10.1021/jp208315k\r\nT2  - The Journal of Physical Chemistry B\r\nJF  - The Journal of Physical Chemistry B\r\nJO  - J. Phys. Chem. B\r\nSP  - 13101\r\nEP  - 13109\r\nVL  - 115\r\nIS  - 44\r\nPB  - American Chemical Society\r\nN2  - Reactions of sesamol with different free radicals, in lipid and aqueous media, have been studied at the M05-2X/6-311+G(d,p) level of theory in conjunction with the SMD continuum model. Different mechanisms of reaction have been considered as well as polar and nonpolar environments. According to the overall rate coefficients, sesamol is predicted to react significantly faster in aqueous solution than in nonpolar media. The polarity of the environment also changes the relative importance of the reaction mechanisms. The anionic form of sesamol was found to be particularly reactive toward peroxyl radicals by transferring one electron. This mechanism was found responsible for the exceptional peroxyl radical scavenging activity of sesamol in aqueous solution, which was found to be even better than carotenoids, 2-propenesulfenic acid, and glutathione under physiological conditions. The agreement between experimental and calculated data supports the presented results as well as the methodology used in this work.\r\nAB  - Reactions of sesamol with different free radicals, in lipid and aqueous media, have been studied at the M05-2X/6-311+G(d,p) level of theory in conjunction with the SMD continuum model. Different mechanisms of reaction have been considered as well as polar and nonpolar environments. According to the overall rate coefficients, sesamol is predicted to react significantly faster in aqueous solution than in nonpolar media. The polarity of the environment also changes the relative importance of the reaction mechanisms. The anionic form of sesamol was found to be particularly reactive toward peroxyl radicals by transferring one electron. This mechanism was found responsible for the exceptional peroxyl radical scavenging activity of sesamol in aqueous solution, which was found to be even better than carotenoids, 2-propenesulfenic acid, and glutathione under physiological conditions. The agreement between experimental and calculated data supports the presented results as well as the methodology used in this work.\r\nSN  - 1520-6106\r\nM3  - doi: 10.1021/jp208315k\r\nUR  - https://doi.org/10.1021/jp208315k\r\nER  -', 'O1c2ccc(O)cc2OC1', 'sesamol.png', NULL, 'true', NULL, NULL),
(15, 'Adrenaline', 'TY  - JOUR\r\nT1  - Adrenaline and Noradrenaline: Protectors against Oxidative Stress or Molecular Targets?\r\nAU  - Álvarez-Diduk, Ruslán\r\nAU  - Galano, Annia\r\nY1  - 2015/02/26\r\nPY  - 2015\r\nDA  - 2015/02/26\r\nN1  - doi: 10.1021/acs.jpcb.5b00052\r\nDO  - 10.1021/acs.jpcb.5b00052\r\nT2  - The Journal of Physical Chemistry B\r\nJF  - The Journal of Physical Chemistry B\r\nJO  - J. Phys. Chem. B\r\nSP  - 3479\r\nEP  - 3491\r\nVL  - 119\r\nIS  - 8\r\nPB  - American Chemical Society\r\nSN  - 1520-6106\r\nM3  - doi: 10.1021/acs.jpcb.5b00052\r\nUR  - https://doi.org/10.1021/acs.jpcb.5b00052\r\nER  -', 'CNC[C@H](O)C1=CC=C(O)C(O)=C1', 'Adrenaline.png', NULL, 'true', NULL, NULL),
(16, 'Noradrenaline', 'TY  - JOUR\r\nT1  - Adrenaline and Noradrenaline: Protectors against Oxidative Stress or Molecular Targets?\r\nAU  - Álvarez-Diduk, Ruslán\r\nAU  - Galano, Annia\r\nY1  - 2015/02/26\r\nPY  - 2015\r\nDA  - 2015/02/26\r\nN1  - doi: 10.1021/acs.jpcb.5b00052\r\nDO  - 10.1021/acs.jpcb.5b00052\r\nT2  - The Journal of Physical Chemistry B\r\nJF  - The Journal of Physical Chemistry B\r\nJO  - J. Phys. Chem. B\r\nSP  - 3479\r\nEP  - 3491\r\nVL  - 119\r\nIS  - 8\r\nPB  - American Chemical Society\r\nSN  - 1520-6106\r\nM3  - doi: 10.1021/acs.jpcb.5b00052\r\nUR  - https://doi.org/10.1021/acs.jpcb.5b00052\r\nER  -', 'C1=CC(=C(C=C1C(CN)O)O)O', 'NorAdrenaline.png', NULL, 'true', NULL, NULL),
(17, 'Anthranilic acid', 'TY  - JOUR\nT1  - Anthranilic acid as a secondary antioxidant: Implications to the inhibition of OH production and the associated oxidative stress\nAU  - Francisco-Marquez, Misaela\nAU  - Aguilar-Fernández, Mario\nAU  - Galano, Annia\nJO  - Computational and Theoretical Chemistry\nVL  - 1077\nSP  - 18\nEP  - 24\nPY  - 2016\nDA  - 2016/02/01/\nT2  - Antioxidants vs. Oxidative Stress: Insights from Computation\nSN  - 2210-271X\nDO  - https://doi.org/10.1016/j.comptc.2015.09.025\nUR  - http://www.sciencedirect.com/science/article/pii/S2210271X15003904\nKW  - Metal chelator\nKW  - Free radical scavenger\nKW  - Reaction mechanisms\nKW  - OH-inactivating ligand\nKW  - DFT\nAB  - The protection exerted by anthranilic acid against oxidative stress was investigated using the Density Functional Theory. It was found to be a rather poor primary antioxidant, not efficient as a peroxyl radical scavenger, albeit it may be able of scavenging other, more reactive, free radicals. On the contrary, it was found to be an excellent secondary antioxidant, through metal chelation. Anthranilic acid is proposed to be a proper OH-inactivating ligand, with ways of action that depend on the strength of the reductant. It is able of chelating Cu(II) ions and fully prevent them from reduction by not too strong reductants such as the ascorbate ion. Accordingly, it is predicted to behave as an efficient antioxidant for in vitro experiments using Cu(II)–ascorbate mixtures as oxidant. On the other hand, anthranilic acid is able of downgrading the production of OH in biological systems, where stronger reductants such as the superoxide radical anion are present, but only partially. However, under such conditions it would be efficient for deactivating this radical as it is formed through Fenton-like reactions. Accordingly, anthranilic would be an efficient protector against the OH associated oxidative stress through its secondary antioxidant activity.\nER  -', 'C1=CC=C(C(=C1)C(=O)O)N', 'anthranilic_acid.png', NULL, 'true', NULL, NULL),
(18, '3,5-dihydroxy-4-methoxybenzyl alcohol (DHMBA)', 'TY  - JOUR\r\nT1  - Assessing the Protective Activity of a Recently Discovered Phenolic Compound against Oxidative Stress Using Computational Chemistry\r\nAU  - Villuendas-Rey, Yenny\r\nAU  - Alvarez-Idaboy, Juan Raul\r\nAU  - Galano, Annia\r\nY1  - 2015/12/28\r\nPY  - 2015\r\nDA  - 2015/12/28\r\nN1  - doi: 10.1021/acs.jcim.5b00513\r\nDO  - 10.1021/acs.jcim.5b00513\r\nT2  - Journal of Chemical Information and Modeling\r\nJF  - Journal of Chemical Information and Modeling\r\nJO  - J. Chem. Inf. Model.\r\nSP  - 2552\r\nEP  - 2561\r\nVL  - 55\r\nIS  - 12\r\nPB  - American Chemical Society\r\nSN  - 1549-9596\r\nM3  - doi: 10.1021/acs.jcim.5b00513\r\nUR  - https://doi.org/10.1021/acs.jcim.5b00513\r\nER  -', 'COc1c(O)cc(CO)cc1O', 'DHMBA.png', NULL, 'true', NULL, NULL),
(19, 'D-Erythro-Hex-2-enonic acid, gamma-lactone', 'TY  - JOUR\r\nT1  - Kinetics and mechanism for the oxidation of ascorbic acid/ascorbate by HO2/O2- (hydroperoxyl/superoxide) radicals. A pulse radiolysis and stopped-flow photolysis study\r\nAU  - Cabelli, Diane E.\r\nAU  - Bielski, Benon H. J.\r\nY1  - 1983/05/01\r\nPY  - 1983\r\nDA  - 1983/05/01\r\nN1  - doi: 10.1021/j100233a031\r\nDO  - 10.1021/j100233a031\r\nT2  - The Journal of Physical Chemistry\r\nJF  - The Journal of Physical Chemistry\r\nJO  - J. Phys. Chem.\r\nSP  - 1809\r\nEP  - 1812\r\nVL  - 87\r\nIS  - 10\r\nPB  - American Chemical Society\r\nSN  - 0022-3654\r\nM3  - doi: 10.1021/j100233a031\r\nUR  - https://doi.org/10.1021/j100233a031\r\nER  -', 'O=C1OC(C(O)CO)C(O)=C1O', 'D-Erythro-Hex-2-enonic-acid-gamma-lactone.png', NULL, 'true', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `q_db_pks`
--

CREATE TABLE IF NOT EXISTS `q_db_pks` (
  `id_pks` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `ID` bigint UNSIGNED DEFAULT NULL,
  `Site` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `Tipo_Exp_teo` char(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Value` double(8,2) DEFAULT NULL,
  `ID_Alta` bigint UNSIGNED DEFAULT NULL,
  `id_reference` bigint UNSIGNED DEFAULT NULL,
  `Description` varchar(1000) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id_pks`),
  KEY `q_db_pks_id_foreign` (`ID`),
  KEY `q_db_pks_id_alta_foreign` (`ID_Alta`),
  KEY `q_db_pks_id_reference_foreign` (`id_reference`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `q_db_pks`
--

INSERT INTO `q_db_pks` (`id_pks`, `ID`, `Site`, `Tipo_Exp_teo`, `Value`, `ID_Alta`, `id_reference`, `Description`, `created_at`, `updated_at`) VALUES
(1, 1, '2a', 'T', 1.83, 4, NULL, 'pKa value was calculated using the parameters fitting method', NULL, NULL),
(2, 1, '1b', 'T', 4.62, 4, NULL, 'pKa value was calculated using the parameters fitting method', NULL, NULL),
(3, 1, '3a', 'T', 10.13, 4, NULL, 'pKa value was calculated using the parameters fitting method', NULL, NULL),
(4, 2, 'Carboxilic acid', 'T', 3.89, 4, NULL, NULL, NULL, NULL),
(5, 2, '1a', 'T', 11.92, NULL, NULL, NULL, NULL, NULL),
(6, 4, NULL, 'E', 10.00, NULL, NULL, NULL, NULL, NULL),
(7, 5, NULL, 'E', 9.45, NULL, NULL, NULL, NULL, NULL),
(8, 5, NULL, 'E', 13.30, NULL, NULL, NULL, NULL, NULL),
(9, 6, NULL, 'E', 8.96, NULL, NULL, NULL, NULL, NULL),
(10, 6, NULL, 'E', 11.00, NULL, NULL, NULL, NULL, NULL),
(11, 6, NULL, 'E', 14.00, NULL, NULL, NULL, NULL, NULL),
(12, 7, NULL, 'E', 4.58, NULL, NULL, NULL, NULL, NULL),
(13, 7, NULL, 'E', 9.46, NULL, NULL, NULL, NULL, NULL),
(14, 8, NULL, 'E', 7.15, NULL, NULL, NULL, NULL, NULL),
(15, 9, NULL, 'E', 10.30, NULL, NULL, NULL, NULL, NULL),
(16, 10, '4a', 'E', 8.75, NULL, NULL, NULL, NULL, NULL),
(18, 15, '4a', 'E', 12.00, 3, NULL, 'Average', NULL, NULL),
(19, 15, '9', 'E', 8.65, 3, NULL, 'Average', NULL, NULL),
(20, 15, '3a', 'E', 9.78, 3, NULL, 'Average', NULL, NULL),
(21, 16, '4a', 'E', 12.06, 3, NULL, 'Average', NULL, NULL),
(22, 16, '3a', 'E', 9.77, 3, NULL, 'Average', NULL, NULL),
(23, 16, '9', 'E', 8.65, 3, NULL, 'Average', NULL, NULL),
(24, 17, '1b', 'E', 6.33, 3, NULL, 'No es clara la referencia', NULL, NULL),
(25, 17, '2a', 'E', 1.12, 3, NULL, 'No es clara la referencia', NULL, NULL),
(26, 18, '2a', 'T', 7.41, 3, NULL, 'Average of isodesmic method', NULL, NULL),
(27, 1, NULL, 'E', 0.01, 4, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `q_db_radicals`
--

CREATE TABLE IF NOT EXISTS `q_db_radicals` (
  `ID_Radical` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `Name_Radical` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Description` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ID_Alta` bigint UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`ID_Radical`),
  KEY `q_db_radicals_id_alta_foreign` (`ID_Alta`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `q_db_radicals`
--

INSERT INTO `q_db_radicals` (`ID_Radical`, `Name_Radical`, `Description`, `ID_Alta`, `created_at`, `updated_at`) VALUES
(1, 'OOH', NULL, 1, NULL, NULL),
(2, 'OH', NULL, 1, NULL, NULL),
(3, 'OCH3', NULL, 1, NULL, NULL),
(4, 'OOCH=CH2', NULL, 1, NULL, NULL),
(5, 'OOCCl3', NULL, 1, NULL, NULL),
(6, 'OOL', NULL, 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `q_db_references`
--

CREATE TABLE IF NOT EXISTS `q_db_references` (
  `id_reference` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `Reference` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `Coments` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id_reference`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `q_db_references`
--

INSERT INTO `q_db_references` (`id_reference`, `Reference`, `Coments`) VALUES
(1, 'Smith, R. M.; Martell, A. E.; Motekaitis, R. J., NIST Standard Reference Database 46. In NIST\r\nStandard Reference Database 46, 8.0 ed.; National Institute of Standards and Technology (NIST):\r\nTexas A&M University, 2004.', NULL),
(2, 'Dissociation Constants of Organic Acids and Bases. In Handbook of Chemistry and Physics,', NULL),
(3, 'TY  - JOUR\r\nT1  - Free Radical Reactions and Antioxidant Activities of Sesamol:  Pulse Radiolytic and Biochemical Studies\r\nAU  - Joshi, Ravi\r\nAU  - Kumar, M. Sudheer\r\nAU  - Satyamoorthy, K.\r\nAU  - Unnikrisnan, M. K.\r\nAU  - Mukherjee, Tulsi\r\nY1  - 2005/04/01\r\nPY  - 2005\r\nDA  - 2005/04/01\r\nN1  - doi: 10.1021/jf0489769\r\nDO  - 10.1021/jf0489769\r\nT2  - Journal of Agricultural and Food Chemistry\r\nJF  - Journal of Agricultural and Food Chemistry\r\nJO  - J. Agric. Food Chem.\r\nSP  - 2696\r\nEP  - 2703\r\nVL  - 53\r\nIS  - 7\r\nPB  - American Chemical Society\r\nN2  - Sesamol (from Sesamum indicum) is a dietary compound, which is soluble in aqueous as well as lipid phases. Free radical scavenging reactions of sesamol, 5-hydroxy-1,3-benzodioxole, have been studied using a nanosecond pulse radiolysis technique. Sesamol efficiently scavenges hydroxyl, one-electron oxidizing, organo-haloperoxyl, lipid peroxyl, and tryptophanyl radicals. Its antioxidant activity has also been evaluated with cyclic voltammetry. In biochemical studies, it has been found to inhibit lipid peroxidation, hydroxyl radical-induced deoxyribose degradation, and DNA cleavage. These antioxidant and free radical scavenging activities of sesamol have been reported in the paper. Keywords: Sesamol; dietary antioxidant; pulse radiolysis; lipid peroxidation; deoxyribose degradation; DNA cleavage\r\nAB  - Sesamol (from Sesamum indicum) is a dietary compound, which is soluble in aqueous as well as lipid phases. Free radical scavenging reactions of sesamol, 5-hydroxy-1,3-benzodioxole, have been studied using a nanosecond pulse radiolysis technique. Sesamol efficiently scavenges hydroxyl, one-electron oxidizing, organo-haloperoxyl, lipid peroxyl, and tryptophanyl radicals. Its antioxidant activity has also been evaluated with cyclic voltammetry. In biochemical studies, it has been found to inhibit lipid peroxidation, hydroxyl radical-induced deoxyribose degradation, and DNA cleavage. These antioxidant and free radical scavenging activities of sesamol have been reported in the paper. Keywords: Sesamol; dietary antioxidant; pulse radiolysis; lipid peroxidation; deoxyribose degradation; DNA cleavage\r\nSN  - 0021-8561\r\nM3  - doi: 10.1021/jf0489769\r\nUR  - https://doi.org/10.1021/jf0489769\r\nER  - \r\n', ''),
(4, 'Smith, R. M.; Martell, A. E.; Motekaitis, R. J., NIST Standard Reference Database 46. In NIST\r\nStandard Reference Database 46, 8.0 ed.; National Institute of Standards and Technology (NIST):\r\nTexas A&M University, 2004.', NULL),
(5, 'Dissociation Constants of Organic Acids and Bases. In Handbook of Chemistry and Physics,', NULL),
(6, 'TY  - JOUR\r\nT1  - Free Radical Reactions and Antioxidant Activities of Sesamol:  Pulse Radiolytic and Biochemical Studies\r\nAU  - Joshi, Ravi\r\nAU  - Kumar, M. Sudheer\r\nAU  - Satyamoorthy, K.\r\nAU  - Unnikrisnan, M. K.\r\nAU  - Mukherjee, Tulsi\r\nY1  - 2005/04/01\r\nPY  - 2005\r\nDA  - 2005/04/01\r\nN1  - doi: 10.1021/jf0489769\r\nDO  - 10.1021/jf0489769\r\nT2  - Journal of Agricultural and Food Chemistry\r\nJF  - Journal of Agricultural and Food Chemistry\r\nJO  - J. Agric. Food Chem.\r\nSP  - 2696\r\nEP  - 2703\r\nVL  - 53\r\nIS  - 7\r\nPB  - American Chemical Society\r\nN2  - Sesamol (from Sesamum indicum) is a dietary compound, which is soluble in aqueous as well as lipid phases. Free radical scavenging reactions of sesamol, 5-hydroxy-1,3-benzodioxole, have been studied using a nanosecond pulse radiolysis technique. Sesamol efficiently scavenges hydroxyl, one-electron oxidizing, organo-haloperoxyl, lipid peroxyl, and tryptophanyl radicals. Its antioxidant activity has also been evaluated with cyclic voltammetry. In biochemical studies, it has been found to inhibit lipid peroxidation, hydroxyl radical-induced deoxyribose degradation, and DNA cleavage. These antioxidant and free radical scavenging activities of sesamol have been reported in the paper. Keywords: Sesamol; dietary antioxidant; pulse radiolysis; lipid peroxidation; deoxyribose degradation; DNA cleavage\r\nAB  - Sesamol (from Sesamum indicum) is a dietary compound, which is soluble in aqueous as well as lipid phases. Free radical scavenging reactions of sesamol, 5-hydroxy-1,3-benzodioxole, have been studied using a nanosecond pulse radiolysis technique. Sesamol efficiently scavenges hydroxyl, one-electron oxidizing, organo-haloperoxyl, lipid peroxyl, and tryptophanyl radicals. Its antioxidant activity has also been evaluated with cyclic voltammetry. In biochemical studies, it has been found to inhibit lipid peroxidation, hydroxyl radical-induced deoxyribose degradation, and DNA cleavage. These antioxidant and free radical scavenging activities of sesamol have been reported in the paper. Keywords: Sesamol; dietary antioxidant; pulse radiolysis; lipid peroxidation; deoxyribose degradation; DNA cleavage\r\nSN  - 0021-8561\r\nM3  - doi: 10.1021/jf0489769\r\nUR  - https://doi.org/10.1021/jf0489769\r\nER  - ', '\r\n');

-- --------------------------------------------------------

--
-- Table structure for table `q_db_solvents`
--

CREATE TABLE IF NOT EXISTS `q_db_solvents` (
  `ID_Solvent` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `Name_Solvent` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Description` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ID_Alta` bigint UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`ID_Solvent`),
  KEY `q_db_solvents_id_alta_foreign` (`ID_Alta`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `q_db_solvents`
--

INSERT INTO `q_db_solvents` (`ID_Solvent`, `Name_Solvent`, `Description`, `ID_Alta`, `created_at`, `updated_at`) VALUES
(1, 'Water', 'H20', 1, NULL, NULL),
(2, 'Tetrahydrofuran', NULL, 1, NULL, NULL),
(3, 'Pentylethanoate', NULL, 1, NULL, NULL),
(4, 'CCl4', NULL, 1, NULL, NULL),
(5, 'Clorophenol', NULL, 1, NULL, NULL),
(6, 'Dioxane', NULL, 1, NULL, NULL),
(7, 'Acetonitrile', NULL, 1, NULL, NULL),
(8, 'gas-phase', 'null', NULL, NULL, NULL),
(11, 'Carbon tetrachloride', NULL, NULL, NULL, NULL),
(12, 'un sovente', NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE IF NOT EXISTS `roles` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `description`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'Administrator', '2019-10-24 17:22:39', '2019-10-24 17:22:39'),
(2, 'user', 'User', '2019-10-24 17:22:39', '2019-10-24 17:22:39'),
(3, 'super-admin', 'root', '2019-10-24 17:22:39', '2019-10-24 17:22:39'),
(4, 'other', 'other', '2019-10-24 17:22:39', '2019-10-24 17:22:39');

-- --------------------------------------------------------

--
-- Table structure for table `role_user`
--

CREATE TABLE IF NOT EXISTS `role_user` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `role_id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `role_user_role_id_foreign` (`role_id`),
  KEY `role_user_user_id_foreign` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `role_user`
--

INSERT INTO `role_user` (`id`, `role_id`, `user_id`, `created_at`, `updated_at`) VALUES
(1, 1, 1, '2019-10-24 17:35:11', '2019-10-24 17:35:11'),
(2, 2, 2, '2019-11-02 15:02:44', '2019-11-02 15:02:44'),
(3, 1, 3, '2019-11-13 20:18:07', '2019-11-13 20:18:07'),
(4, 1, 4, '2019-11-20 04:23:53', '2019-11-20 04:23:53');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Cesar Guzman', '88-8@live.com.mx', NULL, '$2y$10$fil1lbKRs6S73LxKVm2ht.cE4pm4WWdqv9WloZNDG.Nbyo7wBC3c6', 'dev4ucxSNxST3LRp65uT4cl2dhC0lEJbu2qdj6U0CJuxsr5cC9M9oCtrRV2W', '2019-10-24 17:35:11', '2019-10-24 17:35:11'),
(2, 'cesar Guzman', 'cesarguzman@ieee.org', NULL, '$2y$10$rp5gG9BUDUDUQ9UX58ciwe73EE2tY7YYuv8cpbBxbRQ/ykD9AO2ES', NULL, '2019-11-02 15:02:43', '2019-11-02 15:02:43'),
(3, 'Eduardo Gabriel Guzmán López', 'eggl@ciencias.unam.mx', NULL, '$2y$10$5jBoalkRlIGUW4.NqPfTwu/EIm82Ovzfw4.KGekuMgSCUr/r6zE0i', '7oz0nLuceB9kcmHDaJk2a5qP3gYQoSbj79r6bywFoUlnpk9SrAqDuALDw4kl', '2019-11-13 20:18:07', '2019-11-13 20:18:07'),
(4, 'Annia Galano', 'annia.galano@gmail.com', NULL, '$2y$10$tp8UCw89GjyGJl/rNgdzEuBQObkFvkPZJswHIMNOEU02fpB9USS8a', 'MGvRb9rAucBOcgn0IHibRE8zpqryn4xfPdQbmbzd9sJadc5sg0g7YuhD3fEH', '2019-11-20 04:23:52', '2019-11-20 04:23:52');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD CONSTRAINT `password_resets_email_foreign` FOREIGN KEY (`email`) REFERENCES `users` (`email`);

--
-- Constraints for table `profile`
--
ALTER TABLE `profile`
  ADD CONSTRAINT `profile_usuario_foreign` FOREIGN KEY (`Usuario`) REFERENCES `users` (`id`);

--
-- Constraints for table `q_db_k_overalls`
--
ALTER TABLE `q_db_k_overalls`
  ADD CONSTRAINT `q_db_k_overalls_id_alta_foreign` FOREIGN KEY (`ID_Alta`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `q_db_k_overalls_id_molecule_foreign` FOREIGN KEY (`ID_Molecule`) REFERENCES `q_db_molecules` (`id`),
  ADD CONSTRAINT `q_db_k_overalls_id_reference_foreign` FOREIGN KEY (`id_reference`) REFERENCES `q_db_references` (`id_reference`),
  ADD CONSTRAINT `q_db_k_overalls_radical_foreign` FOREIGN KEY (`radical`) REFERENCES `q_db_radicals` (`ID_Radical`),
  ADD CONSTRAINT `q_db_k_overalls_solvent_foreign` FOREIGN KEY (`Solvent`) REFERENCES `q_db_solvents` (`ID_Solvent`);

--
-- Constraints for table `q_db_pks`
--
ALTER TABLE `q_db_pks`
  ADD CONSTRAINT `q_db_pks_id_alta_foreign` FOREIGN KEY (`ID_Alta`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `q_db_pks_id_foreign` FOREIGN KEY (`ID`) REFERENCES `q_db_molecules` (`id`),
  ADD CONSTRAINT `q_db_pks_id_reference_foreign` FOREIGN KEY (`id_reference`) REFERENCES `q_db_references` (`id_reference`);

--
-- Constraints for table `q_db_radicals`
--
ALTER TABLE `q_db_radicals`
  ADD CONSTRAINT `q_db_radicals_id_alta_foreign` FOREIGN KEY (`ID_Alta`) REFERENCES `users` (`id`);

--
-- Constraints for table `q_db_solvents`
--
ALTER TABLE `q_db_solvents`
  ADD CONSTRAINT `q_db_solvents_id_alta_foreign` FOREIGN KEY (`ID_Alta`) REFERENCES `users` (`id`);

--
-- Constraints for table `role_user`
--
ALTER TABLE `role_user`
  ADD CONSTRAINT `role_user_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`),
  ADD CONSTRAINT `role_user_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

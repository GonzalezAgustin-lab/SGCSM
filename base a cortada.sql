-- MariaDB dump 10.19  Distrib 10.4.32-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: mantenimiento
-- ------------------------------------------------------
-- Server version	10.4.32-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `area`
--

DROP TABLE IF EXISTS `area`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `area` (
  `id_a` varchar(3) NOT NULL,
  `nombre_a` varchar(50) NOT NULL,
  PRIMARY KEY (`id_a`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `area`
--

LOCK TABLES `area` WRITE;
/*!40000 ALTER TABLE `area` DISABLE KEYS */;
INSERT INTO `area` VALUES ('aaa','Administracion remota 1'),('aaw','prueba'),('aco','Acondicionamiento'),('act','Acondicionamiento turno tarde'),('adm','Administracion'),('ari','Asuntos Regulatorios Internacionales'),('asr','Asuntos Regulatorios'),('ATN','Acondicionamiento Turno Noche'),('cca','Control de Calidad'),('coe','Comercio Exterior'),('com','Compras'),('con','Contable'),('cos','Costos'),('dee','Dep├│sito Expedici├│n'),('der','Dep├│sito Recepci├│n'),('des','Desarrollo'),('dir','Directorio'),('dis','Dise├▒o'),('dit','Direcci├│n T├®cnica'),('dmp','Deposito materia prima aprobada'),('dse','Dep├│sito Semielaborado'),('ext','Exterior'),('fac','Facturaci├│n'),('gca','Garant├¡a de Calidad'),('GPL','Gerencia de Planta'),('gpr','Gerencia producci├│n'),('GSP','GERENCIA SUPPLY CHAIN'),('gua','Guardia'),('ind','Ingenier├¡a Industrial'),('ing','Ingenier├¡a'),('lnt','Liq. y S. Solidos No Est├®riles T. Tarde'),('lse','Liq. y S. Solidos Est├®riles'),('lsn','Liq. y S. Solidos No Est├®riles'),('lst','Liq. y S. Solidos Est├®riles T. Tarde'),('mae','Maestranza'),('man','Mantenimiento'),('mar','Marketing'),('med','Consultorio Medico'),('mic','Microbiolog├¡a'),('oft','Oftalmicos'),('ope','Operaciones'),('pag','Pagos'),('per','Personal'),('pes','Pesadas'),('pex','Playon exterior'),('pla','Planificaci├│n'),('pre','Presidencia'),('pro','Producci├│n'),('rec','Recepci├│n'),('reh','Recursos Humanos'),('sis','Sistemas'),('sm1','Sala de m├íquinas 1'),('sm2','Sala de m├íquinas 2'),('sm3','Sala de m├íquinas 3'),('sol','Solidos'),('sot','Solidos turno tarde'),('srs','Sala de Reuniones'),('tt1','Terraza t├®cnica 1'),('tt2','Terraza t├®cnica 2'),('val','Validaciones y Calificaciones'),('ven','Ventas'),('vic','Vicepresidencia');
/*!40000 ALTER TABLE `area` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `equipos_mant`
--

DROP TABLE IF EXISTS `equipos_mant`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `equipos_mant` (
  `id` varchar(7) NOT NULL,
  `marca` varchar(100) DEFAULT NULL,
  `modelo` varchar(100) DEFAULT NULL,
  `num_serie` varchar(50) DEFAULT NULL,
  `descripcion` varchar(1000) DEFAULT NULL,
  `uso` tinyint(1) NOT NULL,
  `id_tipo` int(4) NOT NULL,
  `id_area` varchar(3) NOT NULL,
  `id_localizacion` int(4) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_tipo` (`id_tipo`,`id_localizacion`),
  KEY `id_localizacion` (`id_localizacion`),
  KEY `id_area` (`id_area`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `equipos_mant`
--

LOCK TABLES `equipos_mant` WRITE;
/*!40000 ALTER TABLE `equipos_mant` DISABLE KEYS */;
INSERT INTO `equipos_mant` VALUES ('A-001','Samsung','784-fs','gfgdsfggregd',NULL,0,189,'com',36),('C-001',NULL,'','13MR99','',1,80,'cca',NULL),('C-002','Avic','','24MN05','Rango: 0,0 kg a 40,0 kg; resolucion: 0,1 kg',1,89,'cca',NULL),('C-003','Alycar','AF9000','210,267','',0,120,'cca',NULL),('C-004','Presvac ','DCS- 16 RV','','',1,57,'cca',NULL),('C-005','Testlab','TB04','','',1,146,'cca',NULL),('C-006','Lutron ','CD- 4303','','',0,67,'cca',NULL),('C-007','Heindolph ','REAX 1R','54113','',1,3,'mic',NULL),('C-013','Merk- Hitachi ','','','Autosampler: L-7200\nInterface: D-7000\nUV detector : L-7400 \nColumn over: L-7350 \nPump: L-7100',1,137,'cca',NULL),('C-017','Beckman ','DU 650','4323021','',1,105,'cca',NULL),('C-018','Hewlet Packard','','','',0,137,'cca',NULL),('C-019','Elibet ','','','',0,110,'cca',NULL),('C-027','Filtrar ','','','3 filtros HEPA de 24 x 30\"',1,124,'mic',39),('C-031','','','','',1,110,'mic',NULL),('C-032','','','','',1,111,'mic',NULL),('C-033','VZ','','','Tipo Chamberland',0,19,'mic',NULL),('C-034','Thermical','','','',1,184,'cca',NULL),('C-035','','uv sl-58','19635','',1,144,'cca',NULL),('C-036','Heindolph','MR80 ','50380','',1,3,'cca',NULL),('C-037','Electrotem','','','',1,30,'mic',NULL),('C-038','Hewlet Packard','','','',1,73,'cca',NULL),('C-040','Patrick- Fagor','Fresh line','','',1,208,'mic',NULL),('C-041','Denver Instrument','apx 200 ','a24083011',' Capacidad: max: 200 gr, min: 0,0050 gr\nDivision minima: 0,0001 gr.; Clase precision: 1',1,23,'mic',NULL),('C-044','Nicolet ','Avatar 320 FR IR','AEK 000386','',0,105,'cca',NULL),('C-045','Hewlet Packard','79852A','3448A03947','Series 1050',1,137,'cca',NULL),('C-046','Testlab','TB06TACA ','111002','Potencia calefactora: 100 W\nPotencia ultrasonica: 200 W',1,146,'cca',NULL),('C-047','Shimadzu','FCV-10AL VP','','System controller SCL-10A VP\nLiquid chromatograph LC-10AT VP\nDegasser DGV-14 A\nUV-VIS detector: SPD-10A VP\nAutoinductor: SIL-10A\nColumn oven: CTO-10AS VP',1,137,'cca',NULL),('C-048','Denver Instrument','APX 200 ','a24082033','Capacidad: max: 200 gr, d=0,1 mg\nClase precisi?n: 1',0,23,'cca',NULL),('C-052','San Jor','S1305','19214','',1,111,'mic',NULL),('C-053','Fungilab','','VBCL 110492','Viscobasic +L',0,273,'cca',NULL),('C-054','-','','','4 filtros HEPA de 24 x 30 x 6?',1,124,'cca',70),('C-055','Sigma ','J-A 7496','','Capacidad: 2250 frig.\nVolumen de aire: 1250 m3/h\nrefrigerante: R22/ 560g\nPotencia: 1000 W; 220 V; 4,6 A',1,8,'mic',NULL),('C-056','JP Selecta ','4001136','0355164','Capacidad: 70 litros',0,19,'mic',NULL),('C-057','Hanson ','SR8-plus','0108-0042','',1,83,'cca',NULL),('C-058','WTW','pH 340i/ set','08261116','codigo: 2a30-1012',1,191,'mic',NULL),('C-060','Shimadzu','','','Serie 20A\nDegasser DGU-20A 5\nLiquid chromatograph LC-20AT\nComunication bus module CBM-20A\nDiode array detector SPD-M20A\nRefractive index detector RID-10A\nAutosampler SIL-20A HT\nColumn oven CTO-10AS VP',1,137,'cca',NULL),('C-061','Shimadzu','TOC-V CSH ','H51114700039 AE / H52104703340 SA',' Muestreador ASI-V',1,14,'cca',NULL),('C-062','Thermical','','','Rango de temperatura: 55 a 61 ?C',1,113,'mic',NULL),('C-063','Copreva','','','Serie A-A',1,112,'des',NULL),('C-064','Auto Science','AM3250A','mAM001-0416','Capacidad de calefaccion para 10 litros. Regulacion de temp. hasta 350?C. \nDiametro de la plancha calefactora: 150 mm. Regulador de velocidad de 1 a 1500 rpm. \nPotencia 400 W ',1,3,'cca',NULL),('C-065','Thorbell ','','','',1,53,'cca',NULL),('C-066','Brand ','Titrette','03H99543','',0,42,'cca',NULL),('C-067','Metrohm','','19187','794 Basic Titrino\n',1,250,'cca',NULL),('C-068','Merk- Hitachi ','','','',1,137,'cca',NULL),('C-070','Chyo','P-60','','',0,138,'cca',70),('C-071','Bitness','LN1','001-0001000010','',0,3,'cca',NULL),('C-072','Electrolux','R13','','',1,208,'cca',NULL),('C-073','Vicking','Masson 1002 ES','23.013','',1,30,'cca',NULL),('C-074','And','GF3000','','Capacidad max: 3100,00 gr; min: 0,50 gr\nDivision minima: 0,01 gr ┬á(e=0,10gr)',1,23,'cca',NULL),('C-075','Vicking','Masson 9841','','',1,30,'cca',NULL),('C-076','WTC Binder ','KB-115','970034','tipo: 33115099003100\nRango temp. 20 a 25?C',1,110,'cca',NULL),('C-077','Citizen ','IDP 3535 ','','',1,138,'mic',NULL),('C-078','Citizen ','IDP 3535 ','','',1,138,'cca',NULL),('C-079','Citizen ','IDP 3535 ','03Z0832','',1,138,'cca',NULL),('C-080','AnyFig','IL-1470','IL-1470-100510 ','dimensiones de la camara: 570 x 1300 x 430 mm',0,110,'des',NULL),('C-081','Carrier ','','','Cpacidad: 15 Tr',1,8,'sm1',NULL),('C-082','Quequen ','','','',1,190,'mic',NULL),('C-083','Asitan','M0218','00100','Acero inoxidable 304\nPresion de trabajo: 40 Pa',0,141,'mic',NULL),('C-084','Nova Etica','','','',1,110,'cca',NULL),('C-085','Ionomex','A.B.M.K.3','638','Consumo: 4,1 A; 220 V; 900 W',1,30,'mic',NULL),('C-086','Fac','','','Agitador magn├®tico con calefacci├│n ',0,3,'cca',NULL),('C-087','Arcano','L1200B HBG','','├ôptica infinita. \nCabeza binocular con inclinaci├│n a 30┬║, rotatoria 360┬║\nTipo Seidentopf. \nPortaoculares con distancia interpupilar variable 55 - 75 mm y regulaci├│n di├│ptrica izquierda ┬▒5d. \nOculares 10x WF. Objetivos de ├│ptica acrom├ítica corregida a infinito de 4x/N.A 0.10,10x/N.A 0.25,40x(r)/N.A 0.65 y 100x (r)/N.A 1.25 oil seg├║n norma Din. Montados en rev├│lver cu├ídruple invertido. Aumentos totales 1000x. Platina mec├ínica de 135 x 125 mm, con movimiento mec├ínico x e y en comando coaxial bajo. Condensador de Abbe N.A 1.25 centrable, regulable en altura por pi├▒├│n y cremallera, con diafragma iris y portafiltro. Luz hal├│gena regulable 6V 20W, centrable.',1,170,'mic',NULL),('C-088','Merck-Hitachi','890-0852','23E97-004','Organizer\nPump L-2130 \nColumn oven L-2300 \nAutosamper L-2200 ┬á\nDetector uv-vis L-2420 ',1,137,'cca',NULL),('C-089','-','','','Rango de temperatura: -10 a 60 ┬║C\nResoluci├│n: 1┬║C',0,243,'cca',NULL),('C-090','-','','','Rango de temperatura: -10 a 60 ┬║C\nResoluci├│n: 1┬║C',0,243,'cca',NULL),('C-091','Luft','','','Rango de temperatura: -10 a 60 ┬║C\nResoluci├│n: 1┬║C',1,241,'mic',NULL),('C-096','-','','','Rango de temperatura: -10 a 360 ┬║C\nResoluci├│n: 2 ┬║C',1,243,'cca',NULL),('C-098','Nuova Fima','01.18.2.D.C 23 M','','Rango 0 a 28 kg/cm2',0,160,'cca',NULL),('C-102','Luft','','','',0,244,'cca',NULL),('C-103','Knauer','k-7400','88873','',1,185,'cca',NULL),('C-104','Atago','Polax-2L ','990418','',1,196,'cca',NULL),('C-105','Atago','Pal-RI','',' ',0,207,'cca',NULL),('C-106','Precisi?n Scientific','','6M-2537','Cat. N┬║ 1485\nTemp hasta 60 ┬║C\nPotencia: 300 W ',1,110,'mic',NULL),('C-107','','spectroquant multy','11/4155','',1,64,'cca',NULL),('C-108','WTW ','pH 7310P','13021233','',1,191,'cca',NULL),('C-109','-','','','Rango de temperatura: -10 a 360 ┬║C\nResoluci├│n: 2 ┬║C',1,243,'cca',NULL),('C-110','','','','Rango de temperatura: -10 a 360 ┬║C\nResoluci├│n: 1 ┬║CResoluci?n: 1 ?C',1,243,'cca',NULL),('C-112','Nuova Fima','01.10.2.A.C 23M-30/0INHG-KG/CM2','','Rango: -30,0 a 0,0 inHg',1,270,'cca',NULL),('C-113','Nuova Fima','','','Rango: 0 a -1 Kg/cm',1,270,'cca',NULL),('C-115','Luft','','','Rango de temperatura: -10 a 110 ┬║C\nResoluci├│n: 1┬║C',1,243,'cca',NULL),('C-120','Luft','','','',0,244,'cca',NULL),('C-122','','','','Rango: -50,0 a 300,0 ┬║C, resolcuci├│n: 0,1 ┬║C',1,244,'cca',NULL),('C-123','Luft','','','',1,244,'cca',NULL),('C-124','','','','',0,245,'cca',NULL),('C-125','','No Dry','','',1,134,'cca',NULL),('C-126','Denver Instrument','TP214','23951026','Capacidad m├íxima: 210,0000; m├¡nima: 0,0050 g\nM├¡nima divisi├│n: 0,0001 g \nClase 1',1,23,'cca',NULL),('C-127','Agilent ','G1311A','DEG2958000','Degasser G1322A\nQuat Pump G1311A\nALS G1329A\nTCC g1316A',1,137,'cca',NULL),('C-128','Avic','','','',0,89,'cca',NULL),('C-129','Alycar','Byk 20025','','',0,80,'cca',NULL),('C-130','Avic ','J II','RVINV 98',NULL,0,120,'cca',NULL),('C-131','Decalab ','','','Temperatura: 0 a 180 ┬║C\nVelocidad: 0 a 2000 rpm',0,3,'cca',NULL),('C-132','Alpaca ','HP 102-D2 SS','','Potencia: 1500 W',0,47,'cca',NULL),('C-133','','','','Consumo: 220 V, 50 Hz, 1,7 A\nVelocidad: 1450 rpm\nPresi├│n: 3 kg/cm2\nCaudal: 40 l/min',1,34,'cca',NULL),('C-135','Vicking','Masson','6917','',1,30,'mic',NULL),('C-136','Denver Instrument','PK-401','039BCF005','Capacidad max: 5,0 g; m├¡nima: 0,1 g\nClase II',1,23,'cca',70),('C-137','','','','Rango de temperatura: -10 a 60 ┬║C',1,243,'cca',NULL),('C-138','Vicking','6005','26827','',1,274,'cca',NULL),('C-139','Merck-Hitachi','','','Interface D-7000\nDiode array detector: L-7450\nColumn over: L-7350\nProgramable autosampler: L-7250\nPump: L-7100',1,137,'cca',NULL),('C-140','Brand ','Titrette','08N40124','',1,42,'cca',NULL),('C-141','Zonytest ','','00292','',1,81,'cca',NULL),('C-142','','','','',0,243,'cca',NULL),('C-143','','','','',0,243,'cca',NULL),('C-144','','','','',0,243,'cca',NULL),('C-145','Decalab ','','','',1,3,'cca',NULL),('C-146','','','','',1,3,'cca',NULL),('C-147','Shimadzu','','','Degassing unit: DGU-20A5R\nLiquid chromatograph LC-20AT\nComunication bus module: CBM-20A\nUV/VIS detector SPD-20A\nAutosampler SIL-20A HT\nColumn oven: CTO-10AS VP',1,137,'cca',NULL),('C-148','Fite','','59677','Rango de temperatura: -10 a 200 ┬║C',1,243,'cca',NULL),('C-149','Fite','','59675','Rango de temperatura: -10 a 200 ┬║C',1,243,'cca',NULL),('C-150','Fite','','59777','Rango de temperatura: -10 a 110 ┬║C',0,243,'cca',NULL),('C-151','Fite','','59797','Rango de temperatura: -10 a 110 ┬║C',1,243,'cca',NULL),('C-152','Fite','','59809','Rango de temperatura: -10 a 110 ┬║C',1,243,'cca',NULL),('C-153','Testo','mini-thermometer ','18030816','Rango de temperatura: -50 a 150 ┬║C',1,245,'cca',NULL),('C-154','Testo','mini-termometer','18030816','Rango de temperatura: -50 a 150 ┬║C',1,245,'cca',NULL),('C-155','Testo','Waterproof thermometer ','15082416','Rango de temperatura: -20 a 230 ┬║C',1,245,'cca',NULL),('C-156','Atago','PAL-RI','L211770','',1,207,'cca',NULL),('C-157','Radwag','AS 82/220,R2','447072','Max: 82/200 g; Min: 1 mg; T=-220 g, e=1 mg; d=0,01/01 mg',1,23,'cca',NULL),('C-158','SPRT ','SP-POS76 IIDS','140365279','',1,138,'cca',NULL),('C-159','Pharma Safe','ACPH 36','ACPH 36-219','',1,43,'cca',NULL),('C-160','Fisatpam','753D','172364','Agitador magnetico',1,3,'cca',NULL),('C-161','Shimpo','TNP-5','P95171D016','',1,252,'cca',NULL),('C-162','Waters','','','Inyeccion Manual. Detector ',1,137,'cca',NULL),('C-163','Philips ','Tropical ','','',1,134,'cca',42),('C-164','MBV','MAS-100 NT','0000112959','',1,182,'mic',NULL),('C-165','Luft','','','Rango de temperatura: -10 a 360 ┬║C\nresoluci├│n: 2 ┬║C',1,243,'cca',NULL),('C-166','Luft','','','Rango de temperatura: -10 a 200 ┬║C\nresoluci├│n: 1┬║C',1,243,'cca',NULL),('C-167','Luft','','','Rango de temperatura: -10 a 200 ┬║C\nresoluci├│n: 1┬║C',1,243,'cca',NULL),('C-168','Hanna','HI98501','0904D1','Rango : -50,0 a 150,0 ┬║C; resoluci├│n: 0,1 ┬║C',1,244,'cca',NULL),('C-169','Denver Instrument','APX-200','A24043012','Capacidad: m├íx: 200,0000 g, min: 0,0500 g  \ndivisi├│n m├¡nima=0,0001 g\nClase I',0,24,'cca',NULL),('C-170','Hanson ','RS8 Plus','1101-1879','',1,83,'cca',NULL),('C-171','Gehaka','TOC 2200','16071803001002','Version: 1.21.009',1,15,'cca',NULL),('C-172','Citizen ','','','N┬║ de parte: 1.800.843.8270',1,138,'cca',NULL),('C-173','Vitlab ','','05J91086','Rango: 100 a 1000 ┬Ál, resoluci├│n: 1 ┬Ál',1,168,'cca',NULL),('C-174','Vitlab ','','16C39915','Rango: 100 a 1000 ┬Ál, resoluci├│n: 1 ┬Ál',1,168,'cca',NULL),('C-175','Vitlab ','','01L79433','Rango: 100 a 1000 ┬Ál, resoluci├│n: 1 ┬Ál',0,168,'cca',NULL),('C-176','Vitlab ','','03K43545','Rango: 20,0 a 200,0 ┬Ál, resoluci├│n: 0,2 ┬Ál',1,168,'cca',NULL),('C-177','Brand ','transferpette','04G6724','Rango: 20,0 ┬Ál a 200,0 ┬Ál. Resoluci├│n: 0,2 ┬Ál',1,168,'cca',NULL),('C-178','Shimadzu','','','Bomba: LC-20AT\nDetector A: SPD-M20A\nDetector B: RID-20A\nControlador: CBM-20A\nHorno: CTO-10ASvp\nInyector autpm├ítico: SIL-20ACHT\nV├ílvula de gradiente: LPGE-20A\nSistema de integraci├│n: Lab Solution 5.90\nDesgasificador: DGU-20A5R',1,137,'cca',NULL),('C-179','Shimadzu','UV-1800','A11635406503','',1,106,'cca',NULL),('C-180','Radwag','AS220R2WIFI','530015','Balanza anal├¡tica\nCapacidad m├íx. 220g; min: 0,1 mg; d: 1mg',1,23,'cca',NULL),('C-181','Radwag','AS220R2WIFI','548778','Balanza anal├¡tica\nCapacidad m├íx. 220g; min: 0,1 mg; d: 1mg',1,23,'cca',NULL),('C-182','Ohaus','YS2101','','Balanza granataria',1,23,'cca',NULL),('C-183','Radwag','AS220R2WIFI','544550','Balanza anal├¡tica\nCapacidad m├íx. 220g; min: 0,1 mg; d: 1mg',1,23,'cca',NULL),('C-184','SPRT ','POS76II','140365279','',1,138,'cca',NULL),('C-185','SPRT ','POS76II','140365289','',1,138,'cca',NULL),('C-186','SPRT ','POS76II','140365310','',1,138,'cca',NULL),('C-187','SPRT ','POS76II','140365326','',1,138,'cca',NULL),('C-188','DOT','','10008700/0074','Cat├ílogo N┬║: 900011398',1,68,'mic',NULL),('C-189','Patrick- Fagor','','','',1,134,'cca',1),('C-190','Patrick- Fagor','','','',1,134,'mic',NULL),('C-191','','','','1 Filtro HEPA 48 x 24\"',1,124,'mic',40),('C-192','','','','1 Filtro HEPA 48 x 24\"',1,124,'mic',41),('C-193','IUL','Mitutoyo CD IS CP','1000900/484','N┬║ serie Halo: 0371146 (EQ 11)',1,163,'mic',43),('C-194','Vitlab ','','17C28033',' 20-200 microlitros ',1,168,'cca',NULL),('C-195','Vitlab ','','17C28032',' 20-200 microlitros',1,168,'cca',NULL),('C-196','Marca: Ohaus','SPX2201 ','B725278887','Capacidad: 2200 g - Resoluci├│n: 0,1g',1,26,'mic',NULL),('C-197','Varioklav','','','',1,19,'mic',NULL),('C-198','Oakton','','363475','eutech instruments',1,67,'cca',NULL),('C-199','Arcano','XS2-107BN','095695 ','LAMPARA: AC220V, 50-60HZ',1,170,'cca',NULL),('C-200','Black Jack','','','Rango 0 - 150mm - Presici├│n 0,01mm - Exactitud ┬▒0,2 ',1,49,'cca',NULL),('C-201','Black Jack','','','Rango 0 - 150mm - Presici├│n 0,01mm - Exactitud ┬▒0,2 ',0,49,'cca',NULL),('C-202','Fungilab','','00052','Visco Star-L.',0,273,'cca',NULL),('C-203','Lafedar','','','',1,181,'cca',NULL),('C-204','Lafedar','','','',1,30,'cca',NULL),('C-205','Shimadzu','','','SCL-10A System Controller / LC-10AT Liquid Chromatograph / FCV-10AL / DGU-14A Degasser / SPD-10A UV-Vis Detector / Eppendorf CH-500 Oven',1,137,'cca',NULL),('C-206','Shimadzu','','','SPD-10AV UV-VIS Detector / CTO-10AC Column Oven / SCL-10A System Controller / LC-10AT Liquid Chromatograph / FCV-10AL / DGU-14A Degasser / SIL-10AD Auto Injector',1,137,'cca',NULL),('C-207','','','','Zona II',1,51,'cca',38),('C-208','','','','Zona IV',1,51,'cca',38),('C-209','Ahura Scientific','','','TruScan GP',1,107,'cca',NULL),('C-210','Fisotom','752A','1796227','',1,4,'cca',NULL),('C-211','','','','',1,49,'cca',NULL),('C-212','','','','',1,110,'cca',NULL),('C-213','Wembley','','','Rango: 0 a 150mm',1,49,'cca',NULL),('C-214','Wembley','','','Rango: 0 a 200mm',1,49,'cca',NULL),('C-215','HACH','DR1900','','Espectrofot├│metro visible',1,105,'mic',NULL),('C-216','','','','Ba?o seco digital USB doble serie BD19CAK0000347 ',1,29,'mic',NULL),('C-217','Thermo Electron Corp','','',' Infrarrojo Transformado de Fourier (FTIR)  Modelo Nicolet iS-5 ASB2020142/ Adicional  Smart ID7 ATR S211010',1,123,'cca',NULL),('C-218','MMM Medcenter','','','Incubadora con circulacion natural-forzada de aire',1,110,'mic',NULL),('C-219','MMM Medcenter','','','Incubadora con circulacion de aire refrigerado',1,110,'mic',NULL),('C-220','MMM Medcenter','','','Esterilizador con circulacion forzada de aire',1,108,'mic',NULL),('C-221','Hogner','','','Autoclave a vapor de agua modelo VAP 5001 -E/DP- PHARMA',1,19,'mic',71),('C-222','BUCHI','','','Modelo: M-560; N Serie: 1100070738; 100-240 VAC 50Hz 150W',1,164,'cca',NULL),('C-223','KLOTZ','','','Modelo: Syringe; N? Serie: 18004; Power: AC 100-240V 50Hz 1.5A; Fusible 1.6A',1,69,'cca',NULL),('C-224','Guoming','','','Modelo: CS-3',1,129,'cca',NULL),('C-225','Eslabon de Lujo','','','',1,134,'mic',NULL),('C-226','Dosivac','','','Modelo: DVP 140\nN? de serie: 1071114\nCapacidad: 50 HZ ? 140 lts/min\n                   60 HZ ? 170 lts/min',0,34,'mic',NULL),('C-227','Silfab','','','Capacidad: 50HZ ? 40 lts/ min\nPresi?n: 3 kg/cm?\nRPM: 1450',1,34,'mic',NULL),('C-228','Brand ','','','Modelo: Transferpette                                                                 Capacidad: 100-1000UL, Volumen Variable                                          N? de Serie: 22D62998',1,169,'cca',NULL),('C-230','Merck - Millipore','','','Nro de serie: 44046',1,183,'mic',NULL),('C-231','Mettler Toledo','','','Modelo: Seven Direct SD20\nN? de serie: C221102540\n',1,191,'mic',NULL),('C-232','Ohaus','','','Balanza semi-micro analitica                                                    Modelo: EX225D\nN? de serie: C132309598\nCapacidad Maxima: 120g / 220g.                                                                Legilibilidad: 0,00001g / 0,0001g\nClase I',1,23,'cca',NULL),('C-233','Brand ','','','Modelo: Transferpette  S                                                          Capacidad: 100-1000,0 ?L,                                                                               N? de Serie: 22D62999',1,168,'cca',NULL),('C-234','Brand ','','','Modelo: Transferpette  S                                                          Capacidad: 20-200,0 ?L,                                                                               N? de Serie: 22L95348',1,168,'cca',NULL),('C-235','Dosivac','','','Modelo: DVP-3A\nN? de serie: \nCapacidad:  60 HZ ? 170 lts/min',1,34,'mic',NULL),('C-236','Ohaus','','','Modelo: PR223/E\nN? de serie: C207571427\nCapacidad m?x. 220g; min: 0,001g',1,23,'mic',NULL),('D-001','Hidranal ','','','Agitador de pie con h?lice\nN? de serie: 2031',0,3,'des',NULL),('D-002','Variomag','','','Agitador magn?tico\nModelo: Mobil 60\nCapacidad m?xima 150 litros',0,3,'des',NULL),('D-003','Rizmar','','','',1,11,'des',NULL),('D-004','Riva','','','Modelo: Piccola B-2/10\nN? de serie: 035',1,66,'des',NULL),('D-005','Precytec','','','Modelo: AE-15N\nPotencia: 1/4 HP',1,3,'des',NULL),('D-006','Transvar ','','','Modelor: Vibrasan',1,3,'des',NULL),('D-007','Braun ','','','Potencia 600W',1,149,'des',NULL),('D-008','Macrotec (ECUS)','','','',1,57,'des',NULL),('D-009','','','','Modelo: MP-500',1,201,'des',NULL),('D-010','Tecnolab','','','N? de serie: TFP01\nRevoluciones de trabajo: 25 rpm',1,120,'des',NULL),('D-011','Denver Instrument','','','Modelo: APX-200 \nN? de serie: A24043012\nCapacidad: m?x: 200 gr, d=0,1 mg\nClase precisi?n: 1',1,24,'cca',NULL),('D-012','Hewlet Packard','','','Modelo: UV8453\nN? de serie: DE62702050',0,106,'des',NULL),('D-013','Tecnolab','','','N? de serie: Pharma 01',1,82,'des',NULL),('D-014','Tecnolab','','','N? de serie: TDPharma 01\n0 - 7 kg/cm2',1,89,'des',NULL),('D-015','Hanson ','','','Modelo: Vision G2 Elite 8 TM\nN? de serie: 0817-1402 \nP/N: 74-101-008',1,83,'des',NULL),('D-016','','','','Filtro de agua AP55 TB',1,121,'des',NULL),('D-017','Testlab','','','Modelo: TB04 TACA \nN? de serie: 2L401017-10\nRango: 30?C a 110 ?C\nPot. Ultras?nica: 160W\nPotencia calefactora: 160W\nFrecuencia: 40 Khz',1,28,'des',NULL),('D-018','Radwag','','','Modelo:AS 82/200 R2\nN? de serie: 459861',1,24,'des',NULL),('D-019','Zonytest','','','Modelo: 2131807/2003',1,272,'des',NULL),('D-020','Dlab','','','Modelo: MS-M-S10\nN? de serie: ME174AE0000085',1,7,'des',NULL),('D-021','Denver Instrument','','','Modelo: Ultra basic UB-10 \nSerie: UB10043050',1,191,'des',NULL),('D-022','Merk- Hitachi ','','','Modelo: Elite lachrom\ndiode array detector: L-2455\nColumn oven: L-2300\nAutosampler: L-2200\nPump: L-2130\nOrganizer modelo: 809-0852, N? serie: 21E71-044',1,137,'des',NULL),('D-023','Arcano','','','Modelo: HH-S4\nN? de referencia:  929168',1,30,'des',NULL),('D-024','Ohaus ','','','Modelo: ST300\nN? de serie: B524053693',0,192,'des',NULL),('D-025','VELP scientifica','','','Modelo: AGE\nN? de serie: 385394',1,6,'des',NULL),('D-026','-','','','-',1,53,'des',NULL),('D-027','-','','','-',1,114,'des',NULL),('D-028','Fite','','','N? de serie: 36858\nRango: 0 a 200 ?C; resoluci?n: 1 ?C',0,243,'des',NULL),('D-029','Fite','','','N? de serie: 37827\nRango: 20 a 60 ?C; resoluci?n: 1?C',1,243,'des',NULL),('D-030','Shimadzu','','','Serie 20A\nDegasser DGU-20A 5\nLiquid chromatograph LC-20AT\nComunication bus module CBM-20A\nDiode array detector SPD-M20A\nRefractive index detector RID-10A\nAutosampler SIL-20A HT\nColumn oven CTO-10AS VP',1,137,'des',NULL),('D-031','Agilent ','','','Modelo: G1311A; serie: DEG2958000\nDegasser G1322A\nQuat Pump G1311A\nALS G1329A\nTCC g1316A',1,137,'des',NULL),('D-032','And','','','Modelo: GF3000\nN? de serie: 14655524\nCapacidad m?x: 3100,00 gr; min: 0,50 gr\nDivisi?n minima: 0,01 gr  (e=0,10gr)',1,23,'des',NULL),('D-033','','','','',1,34,'des',NULL),('D-035','Black Jack','','','Calibre digital',1,49,'des',NULL),('D-036','Ohaus','','','',1,191,'des',NULL),('D-037','Shakti Pharmatech Pvt.','','','',1,99,'des',NULL),('D-038','Comasa','','','',1,253,'cca',NULL),('D-039','Comasa','','','',1,175,'cca',NULL),('D-040','Shanghai Pharmaceutical Machinery Co. LTD','','','Serie DPP cod SPM1105008 ',1,32,'des',NULL),('D-041','','','','Rango: -10 a 100?C',1,241,'des',NULL),('D-042','Bioelec','','','',1,110,'des',NULL),('D-043','Variomag','','','Modelo: Mobil60',1,3,'des',NULL),('D-044','Radwag','','','Balanza anal?itica\nModelo: AS220R2WIFI\nN? de serie: 544550\nCapacidad m?x. 220g; min: 0,1 mg; d: 1mg',1,23,'des',NULL),('D-045','Avic','','','Modelo: DE II\nN? de serie: 18EN23',1,80,'des',NULL),('E-001','Cannel',NULL,NULL,'Reactor de 150 litros Indicador de peso G&A modelo:ITW 230-II con: 4 ruedas, 5 conexiones clamp de entrada, tapa herm├®tica, conexi├│n de salida, h├®lice y visor 3 Celdas de carga G&A modelo: HSX-SS Motor marca: Lentax tipo MEO; N┬║ 318858',1,203,'lse',NULL),('E-002','Ika','Ultra-turrax T-50 basic',NULL,'Modelo: Ultra-turrax T-50 basic Potencia: 1100 W N┬║ de serie: 05.011267',0,135,'lse',NULL),('E-003','Batiplane','BP60-AI',NULL,'Modelo: BP60-AI N┬║ de serie: 1H090',1,11,'lse',NULL),('E-004','Gallenkamp','Plus II Oven',NULL,'Modelo: Plus II Oven',1,113,'lse',6),('E-005','',NULL,NULL,'Capacidad: 110 litros Con pescante',1,236,'lse',7),('E-006','',NULL,NULL,'Capacidad: 110 litros Con tapa herm├®tica, 3 conexiones y pescante.',1,236,'lse',NULL),('E-007','Watson Marlow','620S',NULL,'Modelo: 620S N┬║ serie: 060.4131.020',1,38,'lse',8),('E-008','PALL',NULL,NULL,'Tama├▒o: 30 \"',1,197,'lse',7),('E-009','Meissner',NULL,NULL,'Contenedor con tapa',1,70,'lse',6),('E-010','',NULL,NULL,'Tamiz de acero inoxidable',1,233,'lse',NULL),('E-011','',NULL,NULL,NULL,1,172,'sol',NULL),('E-012','',NULL,NULL,NULL,1,180,'sol',NULL),('G-001','Distribuidor Durol SRL',NULL,NULL,'Capacidad 2000 Kg',1,275,'der',99),('G-002','ECOVI','Z3000',NULL,NULL,1,275,'der',99),('G-003','Almatec',NULL,NULL,'Capacidad 2000 Kg',1,275,'der',94),('G-004','Unionbull',NULL,NULL,'Capacidad 2500 Kg',1,275,'dee',92),('G-005','Distribuidor Durol SRL',NULL,NULL,'Capacidad: 2000 Kg',1,275,'dee',98),('G-006','ECOVI','Z3000',NULL,NULL,1,275,'dee',98),('G-007','imc',NULL,NULL,NULL,1,195,'dee',98),('G-008','Caterpillar','EC25KE','A3EC241233',NULL,1,22,'der',99),('G-009','Caterpillar','E5000','A4EC220881',NULL,1,22,'der',99),('G-010','Eco Charger','SP48140','C4037','\nPotencia: 48 Volt- Proveedor Premec',1,54,'der',99),('G-011','Electrica',NULL,NULL,NULL,1,17,'der',93),('L-001','LG','T9015TE',NULL,'Capacidad: 8 kg Vel. 640 rpm',1,147,'mae',100),('L-002','LG','T9015TE',NULL,'Capacidad: 8 kg Vel. 640 rpm',1,147,'mae',100),('L-003','LG','T9015TE',NULL,'Capacidad: 8 kg Vel. 640 rpm',1,147,'mae',100),('L-004','Philco','DR-PH70',NULL,NULL,1,212,'mae',100),('L-005','Atma','SCF5810B',NULL,NULL,1,212,'mae',100),('L-006','Philco','DR-PH70',NULL,NULL,1,212,'mae',100),('L-007','Florencia','PSP-990',NULL,NULL,1,193,'mae',100),('L-008','Dixter','6550 Super Kliner 550','53811','220V; 50 Hz; 9 A',1,145,'mae',100),('L-009','Turbion',NULL,NULL,NULL,1,153,'mae',100),('L-010','Super Speed',NULL,NULL,'Motor asincr├│nico Omicron 200 V; 50 Hz; 1 HP; 1470 rpm',1,153,'mae',100),('L-011','Catanese','Super Scrubber','4729','Potencia: 1400 W; tensi├│n: 220-230 Vac Consumo: 8A, 50/60 Kz A├▒o 2017 IP23 Clase I',1,145,'mae',101),('L-012','Candy',NULL,NULL,NULL,1,284,'mae',100),('L-013','Scrubber',NULL,NULL,NULL,1,148,'mae',NULL),('P-001','Corradi',NULL,NULL,'Capacidad: 1000 litros Motor marca STM; Modelo: RMI85FL',0,203,'lsn',11),('P-002','Corradi',NULL,NULL,'Capacidad: 1000 litros Motor marca Corradi, 1.5 KW, 935 rpm',1,203,'lsn',12),('P-003','Industrias Tegnomec',NULL,NULL,'Capacidad: 1000 litros',1,203,'lsn',NULL),('P-004',NULL,NULL,NULL,'Equipo purificador de agua por ├ôsmosis inversa',0,202,'sm1',NULL),('P-005','Blipack','203E',NULL,'Modelo: 203E N┬║ de serie: 2621297 Tensi├│n: 380 V',1,32,'sol',13),('P-006','',NULL,NULL,'Paila contrarrotante con agitador Potencia: 8 cv',0,187,'man',NULL),('P-007','Kretz','sobremesa',NULL,'Modelo: sobremesa N┬║ de serie: 3065006 Capacidad: max. 6Kg Clase III',0,23,'man',NULL),('P-008','AM','Mascot',NULL,'Modelo: Mascot Capacidad: max. 150 Kg Clase III',0,23,'man',NULL),('P-009','Eskabe','A6',NULL,'Aquapi├║, \nCapacidad: 1100 litros',1,248,'sm1',NULL),('P-010','AM','Wg',NULL,'Modelo: Wg N┬║ de serie: BE 70622 Capacidad max: 150 Kg Clase III ',0,23,'man',NULL),('P-011','Torres','He',NULL,'Modelo: He N┬║ de serie: 3065006 Capacidad m├íxima: 3 Kg Clase III',0,23,'man',NULL),('P-012','Ishida','Lc 1000 A',NULL,'Modelo: Lc 1000 A Capacidad m├íx. 10 Kg Clase III',0,23,'man',NULL),('P-013','',NULL,NULL,NULL,0,34,'man',NULL),('P-014',NULL,NULL,NULL,'Calidad sanitaria, acero AISI 316L\nCapacidad: 2000 litros',1,235,'sm1',NULL),('P-016','Moretti','Wagon G',NULL,'Modelo: Wagon G N┬░ de serie: 118457 Capacidad m├íx.: 60 kg; m├¡n.:400 g; d=20 g Clase III ',1,23,'lse',14),('P-017','',NULL,NULL,'Sellador de cunas para ap├│sitos',0,213,'man',NULL),('P-018','Tamecin','EC-48',NULL,'Modelo: EC-48 N┬░ de serie: 2090. Vibrador marca: VPR, N┬░ 1266, serie A. Motor cinta transportadora: MEC, modelo: MS801-4',1,85,'lsn',11),('P-019','Watson Marlow','701 U',NULL,'Modelo: 701 U N┬░ de serie: 4090369',0,38,'lsn',15),('P-021','Antonio Savini Raggio',NULL,NULL,'Codificadora a percusi├│n Modelo: PWE N┬║ de serie: 4574',0,60,'aco',16),('P-022','Dessol',NULL,NULL,'Calidad sanitaria motor marca: Czerweny',1,33,'lsn',NULL),('P-023','','T112',NULL,'Modelo: T112 Motor Altiu, modelo: TE2A90SP2; N┬║ de serie: 14031704',1,3,'lsn',NULL),('P-024','',NULL,NULL,NULL,0,110,'man',NULL),('P-025','',NULL,NULL,NULL,0,136,'man',NULL),('P-027','Moretti','W-G',NULL,'Modelo: W-G N┬║ de serie: 141.72 presici├│n media, Clase III Capacidad m├íx: 150 Kg; min: 2,5 Kg',1,23,'sol',17),('P-028','Uni├│n','Amf',NULL,'Modelo: Amf',0,166,'man',NULL),('P-029','Tover',NULL,NULL,'Llenadora y tapadora de grandes vol├║menes\nModelo: ML-2P\nSerie B m├íquina N┬║ 211/96',1,125,'lsn',18),('P-030','Bivans',NULL,NULL,NULL,1,109,'aco',19),('P-031','Iwka',NULL,NULL,NULL,0,109,'man',NULL),('P-032','Minymaspres','S-23',NULL,'Modelo: S-23\nN┬║ de serie: 5238',0,10,'man',NULL),('P-033','Condi film','EMPAK 60 Oreor',NULL,'Modelo: EMPAK 60 Oreor\nN┬║ de serie:81421\nA├▒o: 1981',1,136,'aco',19),('P-034',NULL,NULL,NULL,'Material: Acero inoxidable 304\nCapacidad: 1000 litros',1,235,'tt1',NULL),('P-035','Dir',NULL,NULL,NULL,0,65,'man',NULL),('P-036','Areco',NULL,NULL,'Dosificadora de pomos pl├ísticos y de aluminio',0,85,'man',NULL),('P-037','Tover','Next-8',NULL,'Modelo: Next-8\nSerie: A\nN┬║ de serie: 201-93',1,62,'aco',20),('P-040','-',NULL,NULL,'Capacidad: 400 litros\nMaterial: acero inoxidable\ncon 4 ruedas, tapa no herm├®tica y v├ílvula inferior de descarga.',1,235,'lsn',NULL),('P-041','-',NULL,NULL,'Capacidad: 400 litros\nMaterial: acero inoxidable\ncon 4 ruedas, tapa no herm├®tica y v├ílvula inferior de descarga.',1,235,'lsn',NULL),('P-042','Tover','ML-2P',NULL,'Modelo: ML-2P\nN┬║ 211/96\nSerie B',0,85,'man',NULL),('P-045','-',NULL,NULL,'Tapadora semiautom├ítica',1,238,'lsn',NULL),('P-046','Schulz','MSV 35/350',NULL,'\nN┬║ 1057321',0,65,'man',NULL),('P-047','Riva','Picola (10 punzones)',NULL,'Modelo: Picola (10 punzones)\nN┬║ 095\nTipo: BT10',0,66,'man',NULL),('P-050','Fitz Patrick',NULL,NULL,NULL,0,177,'man',NULL),('P-051','Amf','7433',NULL,'Modelo: 7433\nMatch N┬║ 881',0,11,'man',NULL),('P-052','Sullair','1020','3876',NULL,0,65,'man',NULL),('P-053','Sullair','SRD-125AC',NULL,'\nN┬║ de serie: 003-D10391\nB.O.M. N┬║ 254112\nRefrigerante: R-22; Potencia: 3/4 HP',1,77,'sm1',NULL),('P-054','Riva','1267',NULL,'Modelo: 1267 Td3 esf n┬║ 63 (14 punzones de 1\")',0,66,'man',NULL),('P-055','Duca',NULL,NULL,NULL,0,11,'man',NULL),('P-056','-',NULL,NULL,NULL,0,85,'man',NULL),('P-057','Prono Ingenier├¡a',NULL,NULL,NULL,0,228,'man',NULL),('P-058','Savini Raggio','PWE',NULL,'Modelo: PWE\nN┬║ de serie: 4574',0,60,'man',NULL),('P-059','-',NULL,NULL,NULL,0,162,'man',NULL),('P-060','',NULL,NULL,'Color rojo',1,275,'aco',NULL),('P-061','Fb Metal├║rgica',NULL,NULL,'Extractor del sector Pesadas',1,119,'tt1',NULL),('P-062','Duca','Atrm',NULL,'Modelo: Atrm\nN┬║ 188',0,238,'man',NULL),('P-063','',NULL,NULL,NULL,0,176,'lsn',NULL),('P-064','-',NULL,NULL,'Granulador v├¡a h├║meda P273',0,132,'man',NULL),('P-065','Colton',NULL,NULL,'Ganulador v├¡a h├║meda',0,132,'man',NULL),('P-066','Smart',NULL,NULL,NULL,0,48,'man',NULL),('P-067','-',NULL,NULL,NULL,0,76,'man',NULL),('P-068','-',NULL,NULL,NULL,0,76,'man',NULL),('P-069',NULL,NULL,NULL,'Tanque de 30 litros con boya',1,199,'lsn',NULL),('P-070',NULL,NULL,NULL,'Tanque de 30 litros sin boya',1,199,'lsn',NULL),('P-071',NULL,NULL,NULL,'Tama├▒o: 10\"',0,197,'man',NULL),('P-072',NULL,NULL,NULL,'Portafiltro de malla para filtro de 500 ┬Ám',1,197,'lsn',NULL),('P-073',NULL,NULL,NULL,'Capacidad: 20 litros, con tapa',1,205,'lsn',NULL),('P-074','Hanna',NULL,NULL,NULL,0,241,'man',NULL),('P-075',NULL,NULL,NULL,'Capacidad: 100 litros, con tapa',1,205,'lsn',NULL),('P-076',NULL,NULL,NULL,'Capacidad: 180 litros, sin tapa',1,205,'lsn',NULL),('P-078',NULL,NULL,NULL,'Capacidad: 12 litros, con tapa',1,205,'lsn',NULL),('P-079',NULL,NULL,NULL,'Capacidad: 7 litros, con manija',0,205,'man',NULL),('P-081',NULL,NULL,NULL,'Capacidad: 60 litros',1,205,'lsn',NULL),('P-082',NULL,NULL,NULL,'Capacidad: 60 litros, con tapa',1,205,'lsn',NULL),('P-083',NULL,NULL,NULL,'Capacidad: 200 litros, con tapa',1,205,'lsn',NULL),('P-084',NULL,NULL,NULL,'Capacidad: 180 litros, con tapa herm├®tica, conexiones y ruedas',1,205,'lsn',NULL),('P-085',NULL,NULL,NULL,'Carcaza met├ílica de 10\" con 2 salidas',1,197,'lsn',NULL),('P-086',NULL,NULL,NULL,'Bomba de vac├¡o para P-018',0,34,'man',NULL),('P-087',NULL,NULL,NULL,'Campana de Pesadas',1,53,'pes',NULL),('P-088','Altronix',NULL,NULL,NULL,0,191,'man',NULL),('P-089',NULL,NULL,NULL,'Capacidad: 75 litros, con camisa, tapa herm├®tica, 4 conexiones clamp de entrada, 2 conexiones de salida y 1 pescante',1,203,'lse',NULL),('P-090',NULL,NULL,NULL,'Tama├▒o: 10\"',0,197,'lsn',NULL),('P-092',NULL,NULL,NULL,NULL,0,162,'man',NULL),('P-093','Bosch','Dynapply 21',NULL,'Modelo: Dynapply 21',1,109,'man',NULL),('P-094',NULL,NULL,NULL,NULL,0,91,'man',NULL),('P-095',NULL,NULL,NULL,'Cerradora de frascos ampollas- Crimpadora',1,238,'lsn',NULL),('P-096','Image','Jaime 1000',NULL,'Modelo: Jaime 1000',0,60,'man',NULL),('P-097','Uhlman',NULL,NULL,NULL,0,96,'man',NULL),('P-098','Nahuester',NULL,NULL,NULL,0,110,'man',NULL),('P-099',NULL,NULL,'6895','Capacidad: 2000 kg',0,275,'man',NULL),('P-100','Powerful',NULL,NULL,'Modelo: V10\nPresi├│n de trabajo: 6 kg/cm2\nTemperatura de vapor: 160┬║C',0,45,'man',NULL),('P-101','Emac',NULL,NULL,NULL,0,33,'man',NULL),('P-102','Simes',NULL,NULL,'Motor: Czerweny Potencia: 1 HP',0,33,'man',NULL),('P-104','Corradi',NULL,NULL,'Calidad sanitaria',0,33,'man',NULL),('P-105','Emar','Cidal',NULL,'Patente: 119657 N├║mero 27, serie B',0,186,'man',NULL),('P-106','Emar','Cidal',NULL,'Patente: 119657 N├║mero 28, serie B',0,186,'man',NULL),('P-107','Fette',NULL,NULL,'33 estaciones',0,66,'man',NULL),('P-108',NULL,NULL,NULL,NULL,0,211,'man',NULL),('P-109','Ramillon',NULL,NULL,'Fraccionadora y cerradora de ampollas',0,125,'man',NULL),('P-110',NULL,NULL,NULL,'Material: acero inoxidable',0,100,'man',NULL),('P-111','Multipli',NULL,NULL,NULL,0,84,'man',NULL),('P-112',NULL,NULL,NULL,'filtro de 10 marcos',0,122,'man',NULL),('P-116','Cas','ME-310','0500050',NULL,0,23,'man',NULL),('P-119',NULL,NULL,NULL,'2 prefiltros 2 HEPA 24 x 48\"',0,124,'lse',7),('P-120',NULL,NULL,NULL,'Almacenamiento de agua potable para Administraci├│n.\nMaterial PVC\nCapacidad: 1000 litros',1,235,'tt1',NULL),('P-121',NULL,NULL,NULL,'Almacenamiento de agua potable para Administraci├│n.\nMaterial PVC\nCapacidad: 1000 litros',1,235,'tt1',NULL),('P-122',NULL,NULL,NULL,'Almacenamiento de agua potable para Administraci├│n.\nMaterial PVC\nCapacidad: 1000 litros',1,235,'tt1',NULL),('P-123',NULL,NULL,NULL,'Almacenamiento de agua potable para la planta\nMaterial: PVC\nCapacidad: 200 litros',1,235,'tt1',NULL),('P-124',NULL,NULL,NULL,'Almacenamiento de agua para caldera.\nCapacidad 300 litros',1,235,'man',NULL),('P-125','Frioar','PHA-81','1312','\n3 etapas de filtrado:\nTama├▒o HEPA: 2 de 24 x24 x12\" + 1 de 12 x24 x12\"\nCaudal: 340 m3/min; Presi├│n de fozador: 190 mmca; Potencia: 15 KW',1,266,'sm1',NULL),('P-126','Frioar','SE-550','1316',NULL,1,227,'sm1',NULL),('P-127','Frioar','PHA-130','1317','\n2 etapas de filtrado:\n2 filtros x etapa de 24 x24\nCaudal: 340 m3/min; Presi├│n de fozador: 190 mmca; Potencia: 15 KW',1,261,'sm1',NULL),('P-128','Frioar','SE-330','1314','\nPotencia: 18 KW',1,227,'sm1',NULL),('P-129','Frioar','PHA-204','1318','\n3 etapas de filtrado, 6 filtros c/u\nTama├▒o HEPA: 24 x24 x12\"\nCaudal: 340 m3/min; Presi├│n de fozador: 190 mmca; Potencia: 22 KW',1,262,'sm1',NULL),('P-130','Frioar','SE-660','1315','\nRefrigerante R22; Potencia: 48 KW',1,227,'sm1',NULL),('P-131',NULL,NULL,NULL,'Dep├│sito',0,8,'sm1',NULL),('P-132',NULL,NULL,NULL,'Vestuarios de planta',1,8,'tt1',NULL),('P-134','Peisa','MXP60','251685','\nBomba marca Marzo',1,45,'sm1',NULL),('P-135',NULL,'RAT-400/100',NULL,'\nDi├ím. 400 mm; altura total: 1700 mm\nMaterial: PRFV',1,1,'sm1',NULL),('P-136','A.V.O.',NULL,NULL,'Fraccionadora de Oft├ílmicos',0,125,'man',NULL),('P-137','Nuova Fima',NULL,NULL,'Rango: 0 a 6 Bar',1,160,'lse',82),('P-138','Bomben','P310','Serie: 122528; con tolva y paleta',NULL,1,218,'lse',NULL),('P-139','Faingol',NULL,NULL,'Codificadora de estuches',0,60,'man',NULL),('P-140','Nuova Fima',NULL,NULL,'Rango: 0,0 a 14,0 kg/cm2 divisi├│n m├¡nima: 0,2 kg/cm2',1,160,'lse',52),('P-141','York',NULL,NULL,'Acondicionamiento',1,8,'tt1',NULL),('P-142',NULL,NULL,NULL,'Portafiltro de malla para filtro de 100 ┬Ám',1,197,'lsn',NULL),('P-143','Mdr','SS07',NULL,NULL,0,59,'man',NULL),('P-144',NULL,NULL,NULL,'Calidad sanitario Capacidad: 1000 litros',1,203,'lsn',18),('P-145','Sipel','Aires KYB4-DL','20313','Capacidad: m├íx. 10 kg, min. 0,100 kg. E= 0,002 Kg Clase III',1,23,'pes',NULL),('P-146','Sipel','Aries','20312','\nCapacidad m├íx. 300,00 kg; min: 2,50 kg\nClase III',1,23,'der',99),('P-147','Genesis',NULL,NULL,'Tipo Inkjet, twin line, small chracter',0,60,'man',NULL),('P-149',NULL,NULL,NULL,NULL,0,36,'man',NULL),('P-150','Daumaq',NULL,NULL,NULL,1,85,'lsn',NULL),('P-153','Techlog',NULL,NULL,NULL,0,271,'man',NULL),('P-154','York',NULL,NULL,'Acondicionamiento',1,116,'tt1',NULL),('P-155',NULL,NULL,NULL,'Dep├│sito',0,116,'man',NULL),('P-156','Surrey',NULL,NULL,'Equipo Split fr├¡o/ calor para Administraci├│n',0,8,'tt1',NULL),('P-157','Surrey',NULL,NULL,'Equipo Split fr├¡o/ calor para Administraci├│n',0,116,'tt1',NULL),('P-158','Carrier','40MR0166900G0','23961-10694','\nPotencia: 2,9 HP',0,8,'man',NULL),('P-159','Carrier',NULL,NULL,'',0,116,'man',NULL),('P-160','Markem Imaje','9020','US09230187','Tipo Ink jet',1,60,'aco',NULL),('P-161',NULL,NULL,NULL,NULL,0,115,'man',NULL),('P-162','Cas','MWP-300H','08 MWP 0300H 0065','Capacidad m├íxima 300g; m├¡nima: 0,2 g Divisi├│n m├¡nima 0,005 g (e=0,010 g)',1,23,'pes',NULL),('P-163',NULL,NULL,NULL,NULL,1,130,'man',NULL),('P-164','Brigth Child','VR06',NULL,NULL,0,71,'man',NULL),('P-165','Urban','Tamper evident','06003',NULL,1,94,'aco',NULL),('P-166','Ohauss','Traveler TA 1501','7130281065','Capacidad m├íx: 1500,0 g Divisi├│n min. 0,1 g',1,23,'lsn',15),('P-167','Kretz','Elite 5530','342000339','\nCapacidad m├íx. 6 Kg; min: 0,1 Kg; d: 1 g\nClase III',1,23,'der',99),('P-168',NULL,NULL,NULL,NULL,1,5,'lse',NULL),('P-169','Schwanek','MS-632-4',NULL,'Motor cinta transportadora: marca Transpower',1,60,'aco',16),('P-170',NULL,NULL,NULL,'Capacidad: 120 litros, con tapa',1,205,'lsn',NULL),('P-172',NULL,NULL,NULL,'Calidad sanitario Capacidad: 120 litros Tapa herm├®tica, agitador, v├ílvula de drenaje y conexi├│n para inyecci├│n de N2',1,203,'lse',7),('P-173','Techlog',NULL,NULL,'Calidad sanitaria, con display',1,247,'lsn',NULL),('P-174','Dosi Bombas','PC600','B-457',NULL,1,38,'lsn',NULL),('P-177',NULL,NULL,NULL,'tama├▒o: 10\", conexi├│n Clamp',1,197,'lse',NULL),('P-178','Cannel',NULL,NULL,NULL,0,187,'lsn',83),('P-179','Willet','3850 plus',NULL,NULL,0,60,'man',NULL),('P-180','Mettler Toledo','SB 16001',NULL,'Capacidad max: 16100gr; min: 5 gr; d: 0,1 gr',0,23,'man',NULL),('P-181','And','GF 300','14667149','Capacidad max. 310 g; min. 0,5 g; divisi├│n m├¡nima: 0,001g Clase II',1,23,'lse',8),('P-183','Nuova Fima',NULL,NULL,'Rango: 0 a 7 kg/cm2 Divisi├│n m├¡nima: 0,2 kg/cm2',0,160,'lsn',NULL),('P-184','Zanazi','jet 2000',NULL,NULL,0,60,'man',NULL),('P-186',NULL,NULL,NULL,'Motor: Czerweny A80-4A N┬║ 02/98',1,3,'sol',NULL),('P-187','Watson Marlow','505 Di','6011672','Cabezal modelo: 505 L; N┬║ de serie: 6030646',1,38,'lse',NULL),('P-188','Mettler Toledo','Spider 3',NULL,'\nCapacidad m├íx: 150,00 Kg, min: 2,5 Kg;\ndivisi├│n m├¡nima: 0,05 kg; Clase: III',1,23,'der',95),('P-189','Badotherm','Tube & Socket',NULL,'Rango: 0,0 a 6,0 bar, resoluci├│n 0,2 bar',1,160,'sol',22),('P-190','Wika',NULL,NULL,'Rango: -1 a 7 bar',1,161,'lse',NULL),('P-191','Nuova Fima',NULL,NULL,'Rango: 0 a 14 Kg/cm2',1,161,'lse',23),('P-193','Abacus','Abacus 301','5257',NULL,1,69,'lse',NULL),('P-194','HM Pharmachine','HM-ED-F60','10HM6081','Llenadora y selladora',1,85,'lse',8),('P-195','HM Pharmachine','HM-TT-700','10HM6082',NULL,1,10,'lse',NULL),('P-196',NULL,NULL,NULL,'Tipo: plato giratorio',0,9,'aco',NULL),('P-197','Testo','Testo 926','33825572/010',NULL,1,245,'lsn',NULL),('P-198','Testo','Testo printer 5540549','35516652004',NULL,1,138,'lsn',NULL),('P-199','Eurostar','Euro-ST T 5V',NULL,'Motor marca Dunkermotoren Velocidad: 3350 rpm',1,3,'lsn',NULL),('P-200',NULL,NULL,NULL,'1 HEPA de 24 x 48\"',1,124,'lse',24),('P-201',NULL,NULL,NULL,'Tipo: vertical HEPA de 24 x 48 x 3 1/16\" 2 prefiltros mark 80 395 x 495 x 23 mm',1,124,'sol',25),('P-202',NULL,NULL,NULL,'Tipo: vertical 1 HEPA de 24 x 48 x 3 1/6\" 1 prefiltro mark 80 de 395 x 495 x 23 mm',1,124,'lse',8),('P-205','Anyfig',NULL,NULL,'Sistema de esterilizaci├│n de reactores por vapor de agua',1,224,'lse',7),('P-206','Fullgate','MT543- Ri plus',NULL,'\nResoluci├│n 0,1 ┬║C',1,241,'man',NULL),('P-207','MTH','AE9440ES','UCAE9440EC-R22','\nRefrigerante R-22',1,52,'der',94),('P-208','Bambi','FH 3300','01485301','\nRefrigerante: R134A',1,128,'dee',97),('P-209','Samsung','AQ24UGDAN','LR2568','Acondicionador de aire de c├ímara frigor├¡fica P-207\nTipo: Split\nRefrigerante: Fre├│n 22',1,8,'man',NULL),('P-210','Premixx',NULL,NULL,'Dosificadora de l├¡quidos Modelo: AR; tipo NEP Serie 806 N┬░ 359',1,85,'lse',NULL),('P-211','Hofliger + karg Bosch',NULL,NULL,'Dosificadora de polvos. Tipo Dos MIKRO N┬░ P1-5287.01.74 a├▒o 74',1,85,'sol',25),('P-212','Neumecanic',NULL,'148',NULL,1,239,'sol',NULL),('P-213',NULL,NULL,NULL,'2 acomodadores de frascos',1,59,'sol',25),('P-214','Ishida','DACS-W-003-SB/WP-1',NULL,NULL,0,23,'man',NULL),('P-216',NULL,NULL,NULL,'',0,119,'man',NULL),('P-217',NULL,NULL,NULL,'Pertence a Vestuarios\nPrefiltro 24 x 24 x 2\"',1,118,'sm1',NULL),('P-218',NULL,NULL,NULL,'Para Fraccionadora P-220\nRefrigerante para autos al 50%\nCapacidad del tanque: 60 litros',1,58,'tt1',NULL),('P-219',NULL,NULL,NULL,NULL,0,188,'man',NULL),('P-220','Zhejiang Hualian','F-400','326','Llenadora de pomos. Performance est├índar JB/T20063-2005 Velocidad: 30-60 pcs/min A├▒o de fabricaci├│n 2011- Origen China',1,85,'lsn',15),('P-221','SPM','DPB-80',NULL,NULL,0,32,'man',NULL),('P-222','-',NULL,NULL,'Hotstamping',0,60,'man',NULL),('P-223','Zhejiang Hualian','HLZRJD-500','11HLPMSC010','N┬░ de lote: 110503 Capacidad: 500 litros A├▒o de fabricaci├│n 2011- Origen China',1,92,'lsn',NULL),('P-224','Zhejiang Hualian','PY-0.4',NULL,'Calidad sanitaria Capacidad: 400 litros Con tapa herm├®tica, 5 entradas clamps, 2 salidas, visor, iluminaci├│n y 4 ruedas Origen China',1,203,'lse',NULL),('P-225','Almatec',NULL,NULL,'Capacidad m├íxima 2000,0 kg; capacidad m├¡nima: 10,0 kg Divisi├│n 0,2 ; N┬░ de divisiones 10000- Clase III Imprsora marca TP- Indicador de peso IND 220',1,90,'lsn',NULL),('P-228',NULL,NULL,NULL,'Tanque de acero inox., de 16 litros, con tapa, conexi├│n clamp',1,226,'lse',NULL),('P-229','Mayper',NULL,NULL,'Capacidad: 5600 litros',0,235,'man',NULL),('P-232',NULL,NULL,NULL,'Pantalla de inspecci├│n visual con luz blanca/ negra',1,189,'aco',NULL),('P-233',NULL,NULL,NULL,'Pantalla de inspecci├│n visual con luz blanca/ negra',1,189,'aco',NULL),('P-234',NULL,NULL,NULL,'Pantalla de inspecci├│n visual con luz blanca/ negra',1,189,'aco',NULL),('P-235','Sipel','T31P','31388','Capacidad m├íx. 15 kg; min. 0,020 g M├¡nima divisi├│n: 0,001g- Clase II',1,23,'pes',NULL),('P-236','Bosch Hofliger + karg','Cartonetta','4C1.4297.01.73','A├▒o de fabricaci├│n 1973',0,109,'aco',27),('P-238','G&A',NULL,NULL,NULL,0,23,'lse',7),('P-241','Tover','ST.3','217.80',NULL,1,229,'lsn',18),('P-242','Skil','3320',NULL,NULL,1,209,'lse',NULL),('P-243','Riva',NULL,'037','Compactapress Modelo: B N┬║: 037',1,66,'sol',26),('P-244','Zulyana','ZXL 210E','10019',NULL,1,32,'sol',29),('P-245','-',NULL,NULL,NULL,1,188,'sol',NULL),('P-246','-',NULL,NULL,NULL,0,211,'sol',NULL),('P-247','Nuova Fima',NULL,'30507','Rnago: 0,00 a 7,00 kg/cm2',1,160,'lsn',83),('P-248','Nuova Fima',NULL,'30506','Rnago: 0,00 a 7,00 kg/cm2',1,160,'lsn',83),('P-249','SPM','HD-800','SPM 1303001A',NULL,1,276,'sol',31),('P-250','SPM','SPM1303001B',NULL,'Volumen: 200 litros Capacidad de producci├│n: 25-75 kg',1,210,'sol',32),('P-251','HM Pharmachine','HM CF-A48','12HM4401','A├▒o 2013',1,93,'sol',79),('P-252','T├®cnica Giraudo','Gido 152','000007','A├▒o 2007',1,173,'sol',NULL),('P-253','Barbarella',NULL,NULL,NULL,1,96,'sol',25),('P-254','Frioar','PHA-204','1319','\n3 etapas de filtrado con 6 filtros\nTama├▒o HEPA 24 x 24 x 12\"',1,268,'sm1',NULL),('P-255','Frioar','SE-950.22.50','1313','\nPotencia: 55 Kw',1,227,'sm1',NULL),('P-256','Frioar','PHA-204','1395','\n3 etapas de filtrado con 6 filtros\nTama├▒o HEPA 24 x 24 x 12\"\nCaudal: 18540 m3/h; Potencia: 18,5 KW; presi├│n forzador: 180 mmca\nRefrigeraci├│n: 152000 Frig/h; Fluido: R-407C\nCalefacci├│n: 43000 Kcal/h; Fluido: agua',1,269,'sm2',NULL),('P-257','Frioar',NULL,NULL,'Unidad 1: Modelo: 2X15.4X2\nSerie: 1395/1\nRefrig: 83000 Frig/h; fluido: R-407C; Pot. 29,5 KW\nUnidad 2: Modelo: 2X15.4X2\nSerie: 1396/2\nRefrig. 69000 Frig/h; fluido: R-407C; Pot. 23,4 KW',1,227,'sm2',86),('P-258','Maccio',NULL,NULL,'Modelo: PressVapor\nSerie: 28-60V; N┬║ 0554\nCapacidad: 200000 Kcal/h\nPresi├│n de trabajo: 6 Kg/cm2\nPPH: 12 Kg/cm2\nSuperficie calef. 9 m2\nFabricaci├│n: 18/12/2012',1,45,'sm2',NULL),('P-259','Maccio',NULL,NULL,'Modelo: Presurizado\nSerie: 19-50A',0,45,'sm2',NULL),('P-260',NULL,NULL,NULL,'Capacidad 150 kg Dimensiones de la c├ímara: 1000 x 1700 x 800 mm',1,114,'sol',75),('P-261','Cronimo',NULL,NULL,'CroMill 2000',1,178,'sol',NULL),('P-262','Frewitt',NULL,NULL,NULL,0,179,'sol',NULL),('P-263','Frewitt','TE2A801P4B34',NULL,'Motor: Altium',1,165,'sol',NULL),('P-264','Riva','Precompress-M1',NULL,NULL,1,66,'sol',78),('P-265','Watson Marlow','504DU',NULL,'Velocidad: 55 a 220 rpm',1,38,'sol',NULL),('P-266','Sartorius','AZ214 M-power','28904938','Capacidad m├íx. 210,0000 g; min. 0,0500g M├¡nima divisi├│n: 0,0001 g Clase I',0,23,'sol',NULL),('P-267','Ohauss','MB35 Basic LA','B316238320','Capacidad; 35 g Resoluci├│n: 0,002 g',0,12,'sol',NULL),('P-268',NULL,NULL,NULL,NULL,1,129,'sol',46),('P-269','Avic','DU II','24oc13','Rango de 0 a 50 kg, resoluci├│n 0,01 kg',1,89,'sol',NULL),('P-270','Aerotratamientos',NULL,NULL,'3 etapas de filtrado, 1 filtro c/u\nTama├▒o HEPA 12 x 24 x 11┬¢\"',1,257,'sm2',NULL),('P-271','Aerotratamientos',NULL,NULL,'3 etapas de filtrado, 1 filtro c/u\nTama├▒o HEPA 12 x 24 x 11┬¢\"',1,260,'sm2',NULL),('P-272','Aerotratamientos',NULL,NULL,'3 etapas de filtrado, 1 filtro c/u\nTama├▒o HEPA 12 x 24 x 11┬¢\"',1,264,'sm2',NULL),('P-273','Ishida','DACS-G-S015-13/SS-I-S','100004469','Proyect N┬║: 131030301 Peso 1500 g- A├▒o 2013',1,23,'aco',27),('P-274','Tepelco',NULL,NULL,'Modelo: SM 10.1\nSerie: 068.13A',1,63,'sm2',NULL),('P-275','Tepelco',NULL,NULL,'Modelo: SM 10.1\nSerie: 068.13B',1,63,'tt2',NULL),('P-276','Aerotratamientos',NULL,NULL,'2 etapas de filtrado: Prefiltro y filtro bolsa',1,117,'sm2',NULL),('P-277','Aerotratamientos',NULL,NULL,'3 etapas de filtrado: Prefiltro y filtro bolsa',1,117,'tt2',NULL),('P-278',NULL,NULL,NULL,'Enfriador de agua para blistera',1,58,'sm2',NULL),('P-279',NULL,NULL,NULL,'Capacidad: 50 litros Con 2 manijas',1,205,'sol',NULL),('P-280',NULL,NULL,NULL,'Capacidad: 50 litros Con 2 manijas',1,205,'sol',NULL),('P-281','Tepelco',NULL,NULL,'Modelo: SM 20.1\nSerie: 55.00',1,63,'sm2',NULL),('P-282',NULL,NULL,NULL,'6 HEPA 24x 30 x 5 7/8\" 3 prefiltros Mark 80',1,124,'lse',8),('P-283',NULL,NULL,NULL,'4 HEPA 24x 30 x 5 7/8\" 2 prefiltros Mark 80',1,124,'lse',8),('P-284','Urbanbuchner','Maxilab C',NULL,NULL,0,115,'man',NULL),('P-285','Zhejiang Hualian','FG-0.4','HL20110502','Capacidad: 400 litros Potencia: 1,5 KW Peso: 420 kg Origen China',1,203,'lsn',33),('P-286',NULL,NULL,NULL,'Capacidad de almacenamiento: 5600 litros\nCuadro El├®ctrico de comando y potencia de las bombas de la red de incendio.\nAlarma/Bocina',1,231,'ext',89),('P-287','Cummins',NULL,NULL,'N┬║ de serie: GV71976D/2\nTipo MS150, Execution IIM, A├▒o 02/95\nPotencia:150 kva, Tensi├│n: 400 V; trif├ísica, cos?=0,8; Service S2\nBateria: Marozzi M12-160; 1150A; 12 V; 150 Ah\nMotor: Delco-Reny; serie 37MT; tipo 300; modelo: 1993931; N┬║ de serie: 91K12',1,133,'sm1',87),('P-288','Marchesini','MA315','125/17','a├▒o 1992',0,109,'aco',34),('P-289','Uhlman',NULL,NULL,'Dosificadora de polvo a tornillo isol. Cl B IP65 B3 VDE0530 Motor: Bauer M4455890',1,85,'sol',NULL),('P-290','Hapa',NULL,NULL,NULL,0,60,'man',NULL),('P-291',NULL,NULL,NULL,'Llenadora y Selladora',1,152,'lse',35),('P-292','Adelo','P-100',NULL,'Calidad sanitaria Entrada y salida de 1\" de di├ímetro Motor: marca Weg; Potencia: 2 HP',1,176,'lse',NULL),('P-293',NULL,NULL,NULL,'Capacidad: 10 litros',1,205,'lse',NULL),('P-294',NULL,NULL,NULL,'Capacidad: 10 litros',1,205,'lse',NULL),('P-295',NULL,NULL,NULL,'Capacidad: 10 litros',1,205,'lse',NULL),('P-296',NULL,NULL,NULL,'Capacidad: 10 litros',1,205,'lse',NULL),('P-297',NULL,NULL,NULL,'Capacidad: 10 litros',1,205,'lse',NULL),('P-298',NULL,NULL,NULL,'Capacidad: 10 litros',1,205,'lse',NULL),('P-299',NULL,NULL,NULL,'Capacidad: 10 litros',1,205,'lse',NULL),('P-300',NULL,NULL,NULL,'Capacidad: 20 litros',1,205,'lse',NULL),('P-301',NULL,NULL,NULL,'Capacidad: 10 litros',1,205,'lse',NULL),('P-302','Atlas Copco',NULL,NULL,'Modelo: GA 37\nI1810\nN┬║ de serie: 37-274',1,65,'sm2',NULL),('P-303',NULL,NULL,NULL,NULL,1,200,'sm2',NULL),('P-304','Met-Mod','',NULL,'N┬║: 0649\r\nCapacidad: 3000 litros\r\nPeso: 1100 Kg\r\nA├▒o 201\r\nindicador de peso marca G&A modelo ITW-230- Clase II\r\n4 celdas de carga: Marca Keli Sensor; modelo: SQB-SS',1,203,'lsn',33),('P-305','Cam',NULL,NULL,'C-13670P.M.M.23',1,109,'aco',72),('P-306','Moretti','MTN','178812','Capacidad m├íx: 60,00 kg; min: 0,20 kg divisi├│n m├¡nima: 0,02 Kg e= 20 g - Clase III',1,23,'sol',NULL),('P-307','Moretti','MTN','188810','Capacidad m├íx: 60,00 kg; min: 0,20 kg divisi├│n min: 0,02 kg - Clase III',1,23,'sol',47),('P-308','Moretti','MTN','178811','Capacidad m├íx: 60,00 kg; min: 0,20 kg divisi├│n min: 0,02 kg - Clase III',1,23,'sol',48),('P-309','Orbit',NULL,NULL,'Agitador, h├®rlice con 3 paletas',1,3,'sol',NULL),('P-310','Moretti','MTN','179337','Capacidad: m├íx: 60 kg; min: 200 g Divisi├│n min. 20 g - Clase III',1,23,'sol',NULL),('P-311','-','ES-200A.','CS040466','Capacidad m├íx. 200 g; min: 0,5 gr. D=0,01 g Clase II',0,23,'man',NULL),('P-312','Beyca',NULL,NULL,'Rango: 0 a 10 kg/ cm2',0,160,'lse',52),('P-313','Nuova Fima',NULL,NULL,'Rango: 0 a 7 kg/ cm3',1,160,'lse',44),('P-316','Ohauss','SP602','B450365449','Capacidad: max. 600 g; min: 0,50 g divisi├│n min. 0,01- Clase II',1,23,'lsn',18),('P-317','Asimeto','GA110825','306-06-0','Calibre digital electr├│nico de 150 mm Rango: 0,00 a 150,00 mm; Resoluci├│n: 0,01 mm',1,49,'sol',NULL),('P-318','Hobardt','A-200','872789','Potencia: 1/3 HP, 220 V, 1 fase',1,11,'sol',NULL),('P-319','Moretti','MTN','182147','Capacidad: max: 60 kg; min: 0,20 g. Divisi├│n m├¡nima: 0,02 kg Plataforma de acero inoxidable de 40 x 55 cm',1,23,'sol',76),('P-320','Kartel',NULL,NULL,NULL,1,78,'sol',NULL),('P-321','Polysak',NULL,NULL,NULL,1,214,'sol',NULL),('P-322','Nuova Fima',NULL,NULL,'Rango: -30,0 a 0,0 in Hg; resoluci├│n 0,5 inHg',1,270,'sol',NULL),('P-323','-',NULL,NULL,'tama├▒o: 10\"\"',1,197,'lse',NULL),('P-324','-',NULL,NULL,'tama├▒o: 10\"\"',1,197,'lse',NULL),('P-325','-',NULL,NULL,'Tama├▒o: 10\"\" para filtro punta flecha',1,197,'lsn',NULL),('P-326','-',NULL,NULL,'Tama├▒o: 10\"\" para filtro punta flecha',1,197,'lsn',NULL),('P-327','-',NULL,NULL,'Tama├▒o: 10\"\"',1,197,'lsn',NULL),('P-328','-',NULL,NULL,'esp├ítula chica',1,101,'lsn',NULL),('P-329','-',NULL,NULL,NULL,1,101,'lsn',NULL),('P-330','SPM','ZKS-3',NULL,'Prod. Cod.:SPM1303001C',1,55,'lsn',NULL),('P-331','-',NULL,NULL,NULL,1,171,'lsn',NULL),('P-332','-',NULL,NULL,'es E-008',1,197,'man',NULL),('P-333','Almatec','CG1646','11051616/25','\nCapacidad: 1600 Kg\nBateria 24 V; 280 Ah',1,17,'der',94),('P-334','Unionbull','CQD12R','1311022','\nCapacidad:1250 Kg\nAltura de elevaci├│n: 4500 mm;\nTensi├│n 24V',1,17,'dee',98),('P-335','Ohauss','SP602','B450370698','Capacidad: max. 600 g; min: 0,01 g divisi├│n min. 0,01 g -Clase II',1,23,'lsn',11),('P-336','Epson','S5-A901S','00531','Peso 38 Kg; a├│ 2011 motor marca Gebr.Becker modelo KDF 90 S-4; N┬║ de serie: 5038652 Motor cinta transportadora: marca Kaifa motor; MS712-4 N┬║ 14083489',1,221,'aco',72),('P-337','Elian K','AL300',NULL,NULL,1,139,'lsn',NULL),('P-338',NULL,NULL,NULL,NULL,1,52,'dee',98),('P-339','Testo','835-T1',NULL,NULL,1,246,'lse',7),('P-340','Markem Imaje','9410','FR 1539','Tipo Ink jet motor de cinta transp. Weg AL71 29JAN13 1018423881',1,60,'aco',NULL),('P-341','Questt','CARTOMAT AV',NULL,NULL,1,109,'aco',49),('P-342','Mazden','AVD-0544-000','316','Capacidad total: 576 dm3 Dimensiones de la c├ímara: 650 x 710 x 1250 mm',1,20,'lse',50),('P-343','Gaynor',NULL,'10101998','Horno termocontrailble autom├ítico Motor turbina: Czerweny 48MC4RB N┬║1210040 Motor tunel: Corradi MTA-71a/4 Motor cinta: Altium TE2A801P4B34',1,136,'aco',51),('P-344','Ohauss','PA323','B520949652','Capacidad: m├íx: 320,000g, min: 0,050 g M├¡nima divisi├│n: 0,001 g Clase I',1,23,'sol',46),('P-345','Moretti','MT-N','183918','\nCapacidad m├íx.: 60,00 kg; min: 0,20 Kg; divisi├│n m├¡nima: 0,02 Kg\nClase III',1,23,'dee',96),('P-346','Laundry SAIC yF','PVL.1','15109','N┬║ 016/79',1,115,'aco',16),('P-347','Urban',NULL,NULL,'Motor de 2 cabezales marca: Superior Electric, modelo: KML092F07\r\n2 motores de cinta marca: Sperior Electric, modelo: KML 093F14',0,115,'lse',81),('P-348','Gafa','Eternity XL410 full BL',NULL,NULL,1,128,'dee',97),('P-350',NULL,NULL,NULL,NULL,0,160,'lse',81),('P-351',NULL,NULL,NULL,'6 HEPA 24x 30 x 3\"\r\n3 prefiltros 20 x 20 x 2\"',1,124,'lse',35),('P-352',NULL,NULL,NULL,'6 HEPA 24x 24 x 6\"\r\n3 prefiltros 20 x 24 x 1\"',1,124,'lse',35),('P-353',NULL,NULL,NULL,'4 HEPA 24x 24 \"\r\n2 prefiltros 20 x 24 x 1\"',1,124,'lse',35),('P-354','Talleres Sanchez','HTTSM','00000000000101','Di├ímetro m├íx de medici├│n: 35 mm; abertura m├íxima mordaza: 40 mm; fuerza m├íxima de rotura 500 N',1,89,'sol',NULL),('P-355','Frioar',NULL,NULL,'Modelo: PHA 111\nSerie: 1479\nCaudal: 11100 m3/h\nCapacidad: 58700 Frig/h; Fluido: R-410 A\nCaudal de aire: 11000 m3/h\nPresi├│n de forzador: 160 mmca; Potencia: 9,3 Kw\n3 etapas de filtrado',1,261,'sm3',NULL),('P-356','Frioar',NULL,NULL,'Modelo: SE 25 L\nSerie: 1480\nCapacidad: 58700 Frig/h, 25 TR; Pot. 22 Kw',1,227,'tt1',NULL),('P-358','Frioar',NULL,NULL,'Modelo: PHA67\nSerie: 1481\nCaudal: 7200 m3/h; Presi├│n: 150 mmca; Pot. 5,55 KW\nCapacidad: 38800 Frig/h; Fluido: 410 A',1,262,'sm3',NULL),('P-359','Frioar',NULL,NULL,'Modelo: SE 15 L├¡nea L\nSerie: 1482\nPotencia compresor: 13,8 KW; Capacidad: 15 Tr',1,227,'tt1',NULL),('P-363','Sullair',NULL,NULL,'Modelo: 10 30\nN┬║ de serie: 2086\nPresi├│n m├íxima de trabajo: 7 Kg/cm2',1,65,'sm1',NULL),('P-373','Unionbull','CDD15M','12081004','\nC├│digo equipo: 4C90\nAltura de elevaci├│n: 4500 mm\nCap. Nominal: 1500 Kg',1,17,'dse',NULL),('P-374','Paletrans','PR17','NH0066','\nCapacidad bateria: 504 Ah; tensi├│n 48 V',1,17,'dee',98),('P-375','Aasa','AASA MR',NULL,'\nSerie: A\nCapacidad: 1000 Kg',1,17,'der',99),('P-376','Frioar',NULL,NULL,'Modelo: PHA 25\nSerie: 1511\nRefrig. 17500 Frig/h; Fluido: R-410A\nCalefacci├│n: 52,32 Kcal/h; fluido: vapor\nCaudal de aire: 1600 m3/h; Presi├│n forzador: 117 mmca; Potencia: 1,6 KW\n3 etapas de filtrado',1,259,'sm2',NULL),('P-379',NULL,NULL,NULL,'Capacidad: 40 litros',1,205,'lse',NULL),('P-380','PALL',NULL,NULL,'Tama├▒o: 10\"\nTipo: puntaflecha',1,197,'lse',NULL),('P-381',NULL,NULL,NULL,'Tama├▒o: 10\"\nTipo: puntaflecha\nPara agua purificada',1,197,'lse',NULL),('P-382',NULL,'PVL-1',NULL,'Modelo PVL-1\nN┬║ 016/72.\nMotor: Marca Corrady; Tipo MTA\nReductor: Marca El arte; Tipo EA65; relaci├│n 1:50',0,2,'aco',NULL),('P-383',NULL,NULL,NULL,'Tama├▒o: 10\"\nTipo: puntaflecha',1,197,'lse',NULL),('P-384','Adiabatic',NULL,NULL,NULL,1,230,'lse',NULL),('P-385','Nalgene',NULL,NULL,'Capacidad: 50 litros',1,31,'lse',NULL),('P-386','Nalgene',NULL,NULL,'Capacidad: 50 litros',1,31,'lse',NULL),('P-387','Nalgene',NULL,NULL,'Capacidad: 20 litros',1,31,'lse',NULL),('P-388','Nalgene',NULL,NULL,'Capacidad: 20 litros',1,31,'lse',NULL),('P-389',NULL,NULL,NULL,NULL,1,154,'lse',NULL),('P-390',NULL,NULL,NULL,NULL,1,154,'lse',NULL),('P-391','Gaynor','SRNA550','08923658','C├│d: A0EE0200C\nMotor cinta: Weg; modelo: 71 991 50\nMotor rollo film: Czerweny; tipo A714A/1: N┬║ 20 4/34\nMotor recolector film: Czerweny',1,215,'aco',51),('P-392','Nalgene',NULL,NULL,'Capacidad: 10 litros\nDestinado a Hipoclorito de Sodio',1,31,'lse',53),('P-393','Nalgene',NULL,NULL,'Capacidad: 10 litros\nDestinado a Alcohol Isoprop├¡lico',1,31,'lse',53),('P-394','Nalgene',NULL,NULL,'Capacidad: 10 litros\nDestinado a Degral',1,31,'lse',53),('P-395','Nalgene',NULL,NULL,'Capacidad: 10 litros \nDestinado a Rolls',1,31,'lse',53),('P-396','Nalgene',NULL,NULL,'Capacidad: 20 litros \nDestinado a Alcohol Et├¡lico',1,31,'lse',53),('P-397','Zhejiang Hualian','F-400','574','\nPeso: 1100 kg; Potencia: 5 kw;\nAlimentaci├│n: 380 W; 50 Hz',1,127,'lse',8),('P-398',NULL,NULL,NULL,'Aspiradora de polvo con cubiera de acero inoxidable',1,18,'sol',47),('P-399','Dott Bonapace',NULL,NULL,'Se adquiri├│ de HLB en 2015',1,186,'lsn',54),('P-400','Ingenieria & Packaging','Dispensadora IP-100',NULL,NULL,0,115,'aco',NULL),('P-401','Dosi Bombas','P-600','B-597',NULL,1,38,'lsn',NULL),('P-402','Alpaca','HP102-D2 SS',NULL,NULL,1,194,'lsn',15),('P-403',NULL,NULL,NULL,'Capacidad: 5 litros',1,205,'lsn',15),('P-404',NULL,NULL,NULL,'Capacidad: 9 litros',1,205,'sol',31),('P-405','Pall','Paltronic Flowstar IV Instrument',NULL,NULL,1,13,'lse',55),('P-406','Sipel','Orion','42607','\nCapacidad m├íx: 60 Kg',1,23,'aco',19),('P-407','Sipel','Orion','42608','\nCapacidad m├íx: 60 Kg',1,23,'lsn',11),('P-408','Lipari','C400','AV 6320',NULL,1,217,'aco',NULL),('P-409','Baires Pack','1062','402217',NULL,1,276,'aco',NULL),('P-410','Ika','Ultra-turrax T-50 digital',NULL,NULL,1,135,'lse',NULL),('P-411','Talleres Sanchez','DU2D2','D91710302',NULL,1,89,'sol',NULL),('P-412','Uni├│n Bull',NULL,NULL,'BF 550x1150\ncolor azul\nCapacidad: 2500 kg',1,275,'pes',NULL),('P-413',NULL,NULL,NULL,NULL,1,216,'pes',NULL),('P-414','Ohauss','ST300','B531251808',NULL,1,191,'lsn',NULL),('P-415',NULL,NULL,NULL,'Conteo de part├¡culas de L├¡quidos y semis├│lidos est├®riles',1,219,'lse',NULL),('P-416','Shimadzu','MOC63U 240V W/0 AC','D209408131','\nCapacidad: 60 g\nLegibilidad: 0,001 g',1,12,'sol',NULL),('P-417','Pirex',NULL,NULL,'Capacidad: 20 litros',1,206,'lse',NULL),('P-418','Pirex',NULL,NULL,'Capacidad: 20 litros',1,206,'lse',NULL),('P-419','Pirex',NULL,NULL,'Capacidad: 20 litros',1,206,'lse',NULL),('P-420','Nalgene',NULL,NULL,'Capacidad: 10 litros',1,31,'lse',NULL),('P-421','Nalgene',NULL,NULL,'Capacidad: 50 litros',1,31,'lse',NULL),('P-422','Fustec','DTM-100',NULL,'Modelo: DTM-100\nN├║mero: 2809\nTensi├│n de trabajo: 3 x 380 V; Frecuencia: 50 Hz\nMotor: Motoranga; modelo: MT802-8; N┬║ 1104118857; 0,85 KW; 900 rpm\nmotoreductor de agitaci├│n: Siemens 0,37 KW; 1370 rpm; 230-440V; 50 Hz',1,87,'sol',56),('P-423','Daumaq','H C',NULL,'\nN┬║ 321\nMotor: Corradi; tipo: B480692; 1/4 HP; 1430 rpm; 220V',1,238,'sol',56),('P-424','Harris',NULL,NULL,'Rango: 0 a 100 psi',1,160,'lse',57),('P-425','G.D.',NULL,NULL,'Rango: 0 a 7 bar\n0 a 100 psi',1,160,'lse',58),('P-427','Jornen','ZH150i','295','Velocidad m├íx: 150 estuches/min Tama├▒o m├¡nimo: 50x35x3,5 mm; m├í: ├ÿ 25x60 mm Ptencia total: 2 KW; V: 3 x 380V; 50 Hz Presi├│n de aire ? 0,6 Mpa Peso: 1200 Kg; fecha: 2017/12',1,109,'aco',27),('P-428','Epson','LS3-4015','L3HE005439','Robot manipulador Fecha 10/2015',1,222,'aco',34),('P-429','Merk','SH013',NULL,'Tipo: 036.013.1 N1 de fabricaci├│n: FN047329 para filtros de 30\" material: acero  inoxidable 316L',1,197,'lsn',NULL),('P-430','Markem Imaje','9410','FR17480239','Tipo: Ink-jet',1,60,'aco',NULL),('P-431','Ohauss',NULL,NULL,NULL,1,191,'lse',NULL),('P-432','Van  houten','Blue Print',NULL,'Modelo: Blue Print Capacidad: 500 litros',1,203,'lse',NULL),('P-433','Zulyana',NULL,NULL,'ID LF-CU210, 45.000 comprimidos/hora de capacidad, ├írea ├║til 500x210 mm',1,56,'sol',NULL),('P-434','Marca APEMA','BS60-MV1','1051',NULL,1,150,'lse',NULL),('P-435','AMS',NULL,NULL,NULL,1,151,'sol',NULL),('P-436',NULL,NULL,NULL,'Software - sistema de conteo de part├¡culas de L├¡quidos y semis├│lidos est├®riles (visualizaci├│n y registros)',1,220,'lse',NULL),('P-437','Black Jack',NULL,NULL,'Rango m├íx 150 mm',1,50,'sol',NULL),('P-438','Black Jack',NULL,NULL,'Rango m├íx 150 mm',1,50,'sol',NULL),('P-439','Nemo','NM021-BH-02S-12H',NULL,'Carcasa: Acero Inoxidable AISI316 pulido interno y externo Guarnici├│n: Anillos O Viton Ejes: Acero inoxidable AISE316 con cromo duro especial UM20 / Elaboraci├│n S.S/ Fraccionamiento S.S. III',1,40,'lsn',NULL),('P-440','Testo','Testo 835-T1','42902982/508',NULL,1,246,'lse',NULL),('P-441','-',NULL,NULL,'2 HEPA de 24 x 48 x 3 1/16\"',1,124,'lse',7),('P-442','Ohaus',NULL,NULL,'Scout SPX622',1,23,'lsn',NULL),('P-443','Comasa',NULL,NULL,'Revesta 150',1,187,'sol',80),('P-444','Nalgene',NULL,NULL,'Capacidad: 50 litros',1,31,'lse',NULL),('P-445','JXPE','PAK300',NULL,NULL,1,140,'dee',92),('P-446','Maccio',NULL,NULL,'Modelo: PressVapor\nSerie: 28-60V; N┬║ 0613\nCapacidad: 205000 Kcal/h\nPresi├│n de trabajo: 7 Kg/cm2\nPPH: 12 Kg/cm2\nSuperficie calef. 10,5 m2\nFabricaci├│n: 30/08/2017',1,45,'sm1',NULL),('P-447','Beyca',NULL,NULL,'Rango 0 - 2 kg/cm┬▓, Resoluci├│n 0,2 kg/cm┬▓',1,160,'lse',35),('P-448','Nalgene',NULL,NULL,'Capacidad: 20 litros',1,31,'lse',NULL),('P-449','Ohaus',NULL,NULL,'PA163 serie B750149780 Capacidad m├íx 150 gr Divisi├│n  min 0,01 gr',1,23,'sol',48),('P-450','Nalgene',NULL,NULL,'Capacidad: 20 litros',1,31,'lse',NULL),('P-451','Nalgene',NULL,NULL,'Jarra graduada 1ltr (PP)',1,143,'lse',NULL),('P-452','Nalgene',NULL,NULL,'Jarra graduada 3ltr (PP)',1,143,'lse',NULL),('P-453',NULL,NULL,NULL,NULL,1,249,'lsn',55),('P-454',NULL,NULL,NULL,NULL,1,102,'lse',7),('P-455',NULL,NULL,NULL,NULL,1,103,'lse',7),('P-456',NULL,NULL,NULL,NULL,1,104,'lse',NULL),('P-457',NULL,NULL,NULL,NULL,1,155,'lse',NULL),('P-458',NULL,NULL,NULL,NULL,1,234,'lse',NULL),('P-459',NULL,NULL,NULL,'Capacidad 1lt',1,142,'lse',NULL),('P-460',NULL,NULL,NULL,'1lt',1,204,'sol',NULL),('P-461',NULL,NULL,NULL,'5lt',1,204,'sol',NULL),('P-462',NULL,NULL,NULL,'20lt',1,204,'sol',NULL),('P-463','Indesur','D50ALYXN-AB-X.2',NULL,NULL,1,37,'lsn',NULL),('P-464','ADMAY',NULL,NULL,NULL,1,126,'der',74),('P-465','Comasa','CPS Line',NULL,NULL,1,174,'sol',NULL),('P-466',NULL,NULL,NULL,NULL,1,102,'lse',NULL),('P-467',NULL,NULL,NULL,NULL,1,102,'lse',NULL),('P-468',NULL,NULL,NULL,NULL,1,102,'lse',NULL),('P-469',NULL,NULL,NULL,NULL,1,102,'lse',NULL),('P-470','Lafedar',NULL,NULL,NULL,1,109,'aco',51),('P-471',NULL,NULL,NULL,NULL,1,49,'sol',NULL),('P-472',NULL,NULL,NULL,NULL,1,49,'sol',NULL),('P-473','Ohaus','SPX422','B748064092','Max: 420g - d: 0.01g',1,23,'sol',56),('P-474','Ohaus','SPX422','30268907(A)','Max: 420g - d: 0.01g',1,23,'lse',NULL),('P-475','Ohaus','SPX422','30268907(A)','Max: 420g - d: 0.01g',1,23,'aco',NULL),('P-476','Apema SRL',NULL,'1106','BS60.2-MV1-AE. Motor antiexplosivo. Microcontrolador MV1.',1,88,'lsn',NULL),('P-477','Zulyana','ZXL-RB-06',NULL,NULL,1,75,'sol',NULL),('P-478',NULL,NULL,NULL,'Capacidad 1000 L. Motor Corradi 5.5 kW 1440 rpm/ Reductor Lentax 470 rpm',1,203,'lsn',NULL),('P-479','SPM','SWH-800',NULL,'Vol: 800 L, Max VolC: 560 L, Max Carga: 500 Kg',1,167,'sol',59),('P-480','GZPK','GZPK 520','12','\nTensi├│n: 380 V / 50HZ',1,66,'sol',63),('P-482','Sikla','9937',NULL,'\nPotencia: 110 W\nTensi├│n: 220 V / 50HZ',1,97,'pes',NULL),('P-483','Avic','J II','RVINV 98',NULL,1,120,'sol',47),('P-484','Ohaus','PR223/E','C108184486','M├íx capacidad 220 gr.',1,27,'sol',26),('P-485','Apema SRL','BS60-MV1',NULL,NULL,1,35,'lse',NULL),('P-486','Australia HM Pharmachine','BP-BU100',NULL,NULL,1,2,'lsn',8),('P-487','Ohaus','PR223/3',NULL,NULL,1,23,'sol',77),('P-488','EPSON TM-T20IIIL','M352A','X5Z5007779',NULL,1,138,'sol',NULL),('P-489',NULL,NULL,NULL,'Tipo: vertical \nCantidad: 9 Filtros HEPA de 24 x 48 x 5 7/8\"',1,44,'pes',60),('P-490','Alicar','AF9000','210,267',NULL,1,129,'sol',26),('P-491','Jornen','ZH-150i','506',NULL,1,109,'aco',73),('P-492','Ohaus','R31P30',NULL,'\nTensi├│n: 100-240 V ~ 0,5A  50/60HZ\nCap. Max.: 30000gr \nCap. Min.: 1gr',1,23,'pes',NULL),('P-493','Moretti','MT-N','010202031','200018\nTensi├│n: 220Vca  50Hz\nCap. Max.: 60,0Kg \nCap. Min.: 0,20Kg',1,23,'sol',NULL),('P-494','Moretti','MT-N','010202031','200020\nM├íx: 60,00kg\nM├¡n: 0,20 kg\nTensi├│n: 220Vca 50Hz',1,23,'pes',NULL),('P-495','Van  houten',NULL,NULL,NULL,1,156,'lse',NULL),('P-496','Cronimo','BP701-VC',NULL,'con cabezal WM',1,39,'lsn',NULL),('P-497','Controlller XXI S.R.L.','ISA','016',NULL,1,72,'sol',NULL),('P-498','Siscod','LE 55','5108',NULL,1,95,'aco',NULL),('P-499','Markem Imaje','1050',NULL,NULL,1,61,'aco',NULL),('P-501','Van houten',NULL,NULL,'Acero inoxidable',1,157,'lse',NULL),('P-502','Moretti','MT-N','010202031','200022\nM├íx: 60,00kg\nM├¡n: 0,20 kg\nTensi├│n: 220Vca 50Hz',1,23,'sol',62),('P-503','Moretti','MT-N','010202031','200023\nM├íx: 60,00kg\nM├¡n: 0,20 kg\nTensi├│n: 220Vca 50Hz',1,23,'sol',59),('P-504','Moretti','MT-N','010202031','200024\nM├íx: 60,00kg\nM├¡n: 0,20 kg\nTensi├│n: 220Vca 50Hz',1,23,'sol',63),('P-505','Moretti','MT-N','010202031','200025\nM├íx: 60,00kg\nM├¡n: 0,20 kg\nTensi├│n: 220Vca 50Hz',1,23,'sol',64),('P-506','Lafedar',NULL,'001','Mesa de trabajo a 90┬¬',1,74,'aco',19),('P-507','ABB','IRB 1100',NULL,NULL,0,41,'man',NULL),('P-508','Nalgene',NULL,NULL,'Capaciadad: 20 litros\nMaterial: Prolipropileno (PP)',1,31,'lse',NULL),('P-509','Talleres Sanchez','DTS12C2','TSU 453','\nDiametro de medicion: 35mm\nAbertura maxima de mrdaza: 40 mm\nFuerza maxima de rotura: 500 newton\nTensi├│n de alimentaci├│n: 220 volts monof├ísico, m├ís tierra.',1,89,'sol',63),('P-510','MET-MOD SRL',NULL,NULL,'Acero inoxidable',1,158,'lse',NULL),('P-511','MET-MOD SRL',NULL,NULL,'Acero inoxidable',1,159,'lse',NULL),('P-512','Ohaus','PR223/E','C207571423','\nM├íx: 220 g\nM├¡n: 0,001g',1,23,'sol',NULL),('P-513','Ohaus','RC31P30','8342511722','\nM├íx: 30000g\nM├¡n: 50g',1,25,'aco',65),('S-001',NULL,NULL,NULL,'Bomba Marzo',1,46,'sm1',NULL),('S-002','Trox','Modelo: TKZ 032',NULL,'Caudal de alimentaci├│n: 2214 m3/h\nCaudal de retorno:2214 m3/h\nCaudal de aire exterior: 1679,4 m3/h\nPresi├│n disp. Alimentaci├│n 710 Pa\nAncho: 1020 mm, alto: 1020 mm, profundidad: 3190 mm\n2 etapas de filtrado: filtros G4: 1 de 610x 610 mm, 1 de 305 x 610 mm.\nfiltros F9: 1 de 610 x 610 mm, 1 de 610 x 305 mm\nFluido refrigerante: R-410',1,267,'sm3',85),('S-003','Trox','Modelo: TKZ 130',NULL,'Caudal de alimentaci├│n: 12173 m3/h\nCaudal de retorno:8738 m3/h\nCaudal de aire exterior: 3435 m3/h\nPresi├│n disp. Alimentaci├│n 390 Pa\nAncho: 1640 mm, alto: 1330 mm, profundidad: 5360 mm\n3 etapas de filtrado: filtros G4: 4 de 610x 610 mm, 2 de 305 x 610 mm.\nfiltros F9: 4 de 610 x 610 mm, 2 de 610 x 305 mm.\nFiltros HEPA: 4 de 610 x 610 mm y 2 de 305 x 610 mm\nFluido refrigerante: R-410',1,263,'sm3',85),('S-004','Trox','Modelo: TKZ 020',NULL,'Caudal de alimentaci├│n: 1794 m3/h\nCaudal de retorno:1194 m3/h\nCaudal de aire exterior: 600 m3/h\nPresi├│n disp. Alimentaci├│n: 710 Pa\nAncho: 1020 mm, alto: 1020 mm, profundidad: 3190 mm\n2 etapas de filtrado: filtros G4: 1 de 610x 610 mm.\nfiltros F9: 1 de 610 x 610 mm.\nFluido refrigerante: R-410',1,258,'sm3',85),('S-005','Trox','Modelo: TKZ 100',NULL,'Caudal de alimentaci├│n: 10628 m3/h\nCaudal de retorno:10128 m3/h\nCaudal de aire exterior: 500 m3/h\nPresi├│n disp. Alimentaci├│n: 390 Pa\nAncho: 1330 mm, alto: 1330 mm, profundidad: 3500 mm\n2 etapas de filtrado: filtros G4: 4 de 610x 610 mm.\nfiltros F9: 4 de 610 x 610 mm.\nFluido refrigerante: R-410',1,256,'sm1',84),('S-006','Midea',NULL,NULL,'Administraci├│n\nCapacidad: 15 TR\nrefrigeranto R410,\nc├│digo MCCH-R180N1-ACA',0,8,'tt1',NULL),('S-007','Surrey',NULL,NULL,'Tipo Roof Top\nCapacidad: 20TR\n2 compresores tipo Scroll; 2 turbinas de condensador y 2 forzadores en evaporador',1,8,'man',NULL),('S-008','IPA',NULL,NULL,'Equipo purificador de agua por ├ôsmosis inversa',1,98,'sm1',69),('S-009','Gatti',NULL,NULL,'Centrifugo RU300 T 0,75HP SASE DM4 H270┬║C TP CR',1,118,'sm1',NULL),('S-010','MotorMech',NULL,NULL,'3CV, Trifasico',1,118,'man',NULL),('S-011','Surrey',NULL,NULL,'capacidad 93-78 kw 337618 Consumo Electrico 57 ,7 A Fases 3 Frecuencia 50 Voltaje nominal 380 Modelo 559FZX320000SC',1,8,'sm1',NULL),('S-012',NULL,NULL,NULL,NULL,1,225,'man',NULL),('S-013','LG',NULL,NULL,'Modelo Multi V Plus II',1,8,'man',NULL),('S-014','Trox','Modelo: TKZe 3525',NULL,'Caudal de alimentaci├│n: 24000 m3/h\nCaudal de retorno:12000 m3/h\nCaudal de aire exterior: 12000 m3/h\nPresi├│n disp. Alimentaci├│n: 470 Pa\nAncho: 2260 mm, alto: 1740 mm, profundidad: 4740 mm\n3 etapas de filtrado: filtros G4: 6 de 610x 610 mm, 3 de 610 x 305 mm y 2 de 305 x 610 mm.\nFiltros F8: 6 de 610 x 610 mm,3 de 610 x 305 mm y  2 de 305 x 610 mm\nFiltros HEPA: 6 de 610 x 610 mm, 3 de 610 x 305 mm  y 2 de 305 x 610 mm\nFluido refrigerante: Agua fr├¡a',1,254,'sm2',91),('S-015','Trox','Modelo: TKZe 3525',NULL,'Caudal de alimentaci├│n: 20000 m3/h\nCaudal de retorno:15000 m3/h\nCaudal de aire exterior: 5000 m3/h\nPresi├│n disp. Alimentaci├│n: 480 Pa\nAncho: 2260 mm, alto: 1430 mm, profundidad: 4740 mm\n3 etapas de filtrado: filtros G4: 6 de 610x 610 mm y 2 de 305 x 610 mm.\nFiltros F8: 6 de 610 x 610 mm y  2 de 305 x 610 mm\nFiltros HEPA: 6 de 610 x 610 mm y 2 de 305 x 610 mm\nFluido refrigerante: R-410',1,255,'sm2',91),('S-016',NULL,NULL,NULL,NULL,1,119,'sm2',91),('S-017','Kaesser','DC 75','1133',NULL,1,79,'sm2',NULL),('S-018','Trox',NULL,'3256 B1',' Alimentaci├│n: 3 x 380 V 50 HZ Potencia: 22 kw Caudal de alimentaci├│n: m3/h\nCaudal de retorno:m3/h\nCaudal de aire exterior: m3/h\nPresi├│n disp. Alimentaci├│n: 390 Pa\nAncho: 1330 mm, alto: 1330 mm, profundidad: 3500 mm\n3 etapas de filtrado: filtros   G4: 2 de 610x 610 mm.\nfiltros F9: 4 de 610 x 610 mm. y  H13: 2 de 610 x 610 mm\nFluido refrigerante: ',1,265,'sm2',91),('S-019','Mayper',NULL,NULL,'Tipo: Tronco C├│nico, Capacidad 20.000 litros, Material: PRFC-fabricado en resina poliester reforzado con fibra de vidrio. Dimensiones: sup 3.080mm, inf 2.500mm, alt 3.620mm',1,237,'ext',88),('S-020','Mayper',NULL,NULL,'Tipo: Tronco C├│nico, Capacidad 20.000 litros, Material: PRFC-fabricado en resina poliester reforzado con fibra de vidrio. , Dimensiones: sup 3.080mm, inf 2.500mm, alt 3.620mm',1,237,'ext',88),('S-021','Mayper',NULL,NULL,'Tipo: Tronco C├│nico, Capacidad 20.000 litros, Material: PRFC-fabricado en resina poliester reforzado con fibra de vidrio.',1,237,'ext',88),('S-022','Mayper',NULL,NULL,'Capacidad: 1000 litros, Material: Polietilino Tricapa, Dimensi├│n: di├ímetro 1,10 mt, altura 1,21 mt',1,235,'sm2',90),('THM-001','TFA','305.002','AKTP826','Res: 0.1┬║C 1%hr',1,240,'der',94),('THM-002','TFA','305.002','AKTP827','Res: 0.1┬║C 1%hr',0,240,'der',NULL),('THM-003','TFA','305.002','AKTP828','Res: 0.1┬║C 1%hr',1,240,'dee',NULL),('THM-004','TFA','305.002','AKTP829','Res 0.1┬║C 1%hr',1,240,'der',103),('THM-005','TFA','305.002','AKTP1020','Res: 0.1┬║C 1%hr',0,240,'sol',104),('THM-006','TFA',NULL,'AKTP1021',NULL,0,240,'sol',78),('THM-008','TFA',NULL,'AKTP1024',NULL,0,240,'der',105),('THM-009','TFA',NULL,'AKTP1025/1306',NULL,0,240,'sol',26),('THM-010','Lascar','EL-USB-2-LCD','10010195','Res 0.5 ┬║C 0.5% hr',1,240,'mic',NULL),('THM-011','Lascar','EL-USB-2-LCD','10015750','Res 0.5 ┬║C 0.5% hr',1,285,'mic',NULL),('THM-012','Lascar','EL-USB-1','48443','Res 0.5┬║C',0,242,'mic',NULL),('THM-013','Lascar','EL-USB-1','54363','Res 0.5┬║C',1,286,'cca',NULL),('THM-014','Lascar','EL-USB-1','55651','Res 0.5┬║C',1,286,'mic',NULL),('THM-015','Lascar','EL-USB-1','56823','Res 0.5┬║C',1,286,'mic',NULL),('THM-016','Lascar','EL-USB-1','57467','Res 0.5┬║C',1,286,'mic',NULL),('THM-017','Lascar',NULL,'78697',NULL,0,286,'der',93),('THM-018','Lascar','EL-USB-1','79194','Res 0.5┬║C',1,286,'dee',NULL),('THM-019','Lascar','EL-USB-1','103268','Res 0.5┬║C',1,286,'mic',NULL),('THM-020','Lascar','EL-USB-2-LCD','10008062','Res 0.5 ┬║C 0.5% hr',1,285,'mic',NULL),('THM-021','Lascar','EL-USB-2-LCD','10008397','Res 0.5 ┬║C 0.5% hr',1,285,'mic',NULL),('THM-022','Lascar','EL-USB-2-LCD','10039972','Res 0.5 ┬║C 0.5% hr',1,285,'mic',NULL),('THM-023','Lascar','EL-USB-2-LCD','10038718','Res 0.5 ┬║C 0.5% hr',1,285,'mic',NULL),('THM-024','Lascar','EL-USB-2-LCD','10108482','Res 0.5 ┬║C 0.5% hr',1,285,'cca',NULL),('THM-025','Lascar',NULL,'522003360',NULL,0,286,'',NULL),('THM-026','Lascar','EL-USB-1','52204681','Res 0.5┬║C',1,286,'cca',NULL),('THM-027','TFA','LOG32TH','14111034','Res: 0.1┬║C 0.1%hr',1,285,'dse',NULL),('THM-028','Lascar','LoG32TH','16020675','Res: 0.1┬║C 0.1%hr',1,285,'cca',NULL),('THM-029','Lascar','LoG32TH','16020557','Res: 0.1┬║C 0.1% hr',1,285,'cca',NULL),('THM-030','Lascar','EL-USB-2-LCD','10015806','Res 0.5 ┬║C 0.5% hr',1,285,'cca',NULL),('THM-031','Lascar','EL-USB-1','52204126','Res 0.5┬║C',1,242,'mic',NULL),('THM-032','Lascar','EL-USB-1','78954','Res 0.5┬║C',0,242,'cca',NULL),('THM-033','Galileo','THD32000',NULL,NULL,0,285,'cca',106),('THM-034','Galileo','THD32000','2016122896','Res 0.1┬║C 0.1% hr',1,285,'cca',106),('THM-035','Galileo','THD32000',NULL,'Res 0.1┬║C 0.1% hr',1,285,'mic',NULL),('THM-036','Galileo','THD32000',NULL,'Res 0.1┬║C 0.12% hr',1,285,'cca',NULL),('THM-037','Galileo','THD32000',NULL,'Res 0.1┬║C 0.1% hr',1,285,'cca',NULL),('THM-038','Galileo','THD32000','2016122894','Res 0.1┬║C 0.1% hr',1,285,'dmp',NULL),('THM-039','Galileo','THD32000','2016122893','Res 0.1┬║C 0.1% hr',1,285,'dmp',NULL),('THM-040','Galileo','THD32000',NULL,'Res 0.1┬║C 0.1% hr',1,285,'cca',107),('THM-041','Galileo','THD32000','2016122941','Res 0.1┬║C 0.1% hr',1,285,'cca',NULL),('THM-042','Galileo','THD32000',NULL,'Res 0.1┬║C 0.1% hr',1,285,'cca',NULL),('THM-043','Galileo','THD32000','2016122950','Res 0.1┬║C 0.1% hr',1,285,'cca',109),('THM-044','Galileo','THD32000','2016122955','Res 0.1┬║C 0.1% hr',1,285,'dee',110),('THM-045','Galileo','THD32000','2016122955',NULL,1,285,'cca',NULL),('THM-047','Galileo','THD3200','20181107630',NULL,1,285,'der',NULL),('THM-048','Galileo','THD3200','20181107648',NULL,1,285,'dse',NULL),('THM-049','Galileo','THD3200','20181107639',NULL,0,285,'gca',NULL),('THM-050','Galileo','THD3200','20190304635',NULL,0,285,'gca',NULL),('THM-051','Galileo','THD3200','20181107688',NULL,0,285,'gca',NULL),('THM-052','Galileo','THD3200','20181107631',NULL,0,285,'gca',NULL),('THM-053','Galileo','THD3200','20181107644',NULL,0,285,'gca',NULL),('THM-054','Galileo','THD3200','20190304637',NULL,0,285,'gca',NULL),('THM-055','Galileo','THD3200','20190304613',NULL,0,285,'gca',NULL),('V-001','Digimess','RUG-04',NULL,NULL,1,283,'cca',NULL),('V-002','TSI-Alnor','EBT731','EBT731650013',NULL,1,278,'cca',NULL),('V-003','TSI-Alnor','AVM 430-A','AVM 431536005','Rango: (0ÔÇª50) m/s; (-17,8ÔÇª.+60) ┬░C',1,16,'cca',NULL),('V-004','Lafedar',NULL,NULL,'Rango 0 - 150┬║C',1,282,'val',NULL),('V-005','CEM','DT-9880M',NULL,NULL,1,279,'val',NULL),('V-006','Testo',NULL,NULL,'Datalogger de humedad y temperatura testo 176 H1',1,280,'val',NULL),('V-007','Drager',NULL,NULL,'Aero Test, analizador de gases por tubos colorimetricos. Mide CO2 CO H20 y aceite',1,281,'val',NULL),('W-01','FoumiSerie Athena Art. 3200/3217 LTR.7',NULL,NULL,'33675-P-1022/1-10 kg/26-10-2022',1,23,'pes',NULL),('W-02','F1 Serie AA9613 - Dolz',NULL,NULL,'33676-P-0922/10 g/19-09-22',1,23,'des',NULL),('W-03','E2 Serie AA8806 - Dolz',NULL,NULL,'33677-P-0922/1 -10 g/22-09-22',1,23,'pes',NULL),('W-04','E2 Serie AA5958 - Dolz',NULL,NULL,'33678-P-0922/1 -10 g/22-09-22',1,23,'pes',NULL),('W-05','M2 Serie AA9070 - Dolz',NULL,NULL,'33679-P-0922/100-200 g/07-09-22',1,23,'des',NULL),('W-06','E2 AB3292 - Dolz',NULL,NULL,'54625/1g - 10mg/08-03-18',1,23,'des',NULL),('W-07','E2 Serie AB2824 - Dolz',NULL,NULL,'33680-P-0922/50mg/23-09-22',1,23,'cca',NULL),('W-08','Denver-96086582- Dolz',NULL,NULL,'M-00019-04-07-21/ 100 - 100g/08-07-21',1,23,'gca',NULL),('W-09','OHAUS CAL. WT.',NULL,NULL,'M-00017-04-07-21/300 - 300 gr/08-07-21',1,23,'gca',NULL),('W-10','AD/MyCia',NULL,NULL,'M-00019-04-07-21/M-00016-04-07-21/100 g - 1 kg  /08-07-21',1,23,'gca',NULL),('W-11','OHAUS CAL. WT.',NULL,NULL,'M-00019-04-07-21/M-00017-04-07-21/200- 300 gr/08-07-21',1,23,'gca',NULL),('W-12','F1 Serie AB6473 - Dolz',NULL,NULL,'32330/10 mg, 1 - 10 gr/25-01-22',1,23,'sol',NULL),('W-13','E2 Serie AB6684 - Dolz',NULL,NULL,'32900-P-0522/50mg, 1 - 10gr/11-05-22',1,23,'cca',NULL),('W-14','E2 Serie AB7062 - Dolz',NULL,NULL,'33657-P-0922/50mg, 1 - 10gr/28-09-22',1,23,'mic',NULL);
/*!40000 ALTER TABLE `equipos_mant` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estados`
--

DROP TABLE IF EXISTS `estados`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `estados` (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estados`
--

LOCK TABLES `estados` WRITE;
/*!40000 ALTER TABLE `estados` DISABLE KEYS */;
INSERT INTO `estados` VALUES (1,'Abierta'),(2,'Asignada'),(3,'En proceso'),(4,'Rep. pendientes'),(5,'Aprob. pendiente'),(6,'Aprobada'),(7,'Reclamada');
/*!40000 ALTER TABLE `estados` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `frecuencias`
--

DROP TABLE IF EXISTS `frecuencias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `frecuencias` (
  `id` int(3) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(30) NOT NULL,
  `dias` int(5) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `frecuencias`
--

LOCK TABLES `frecuencias` WRITE;
/*!40000 ALTER TABLE `frecuencias` DISABLE KEYS */;
INSERT INTO `frecuencias` VALUES (1,'Una semana',7),(2,'Dos semanas',14),(3,'Un mes',30),(4,'Dos meses',60),(5,'Tres meses',90),(6,'Seis meses',180),(7,'Un a├▒o',365),(8,'Un a├▒o y medio',545),(9,'Dos a├▒os',730),(10,'Tres a├▒os',1095);
/*!40000 ALTER TABLE `frecuencias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `historico_solicitudes`
--

DROP TABLE IF EXISTS `historico_solicitudes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `historico_solicitudes` (
  `id_solicitud` int(20) NOT NULL,
  `id_estado` int(4) NOT NULL,
  `fecha` datetime NOT NULL DEFAULT current_timestamp(),
  `actual` tinyint(1) NOT NULL,
  `id_persona` int(10) unsigned NOT NULL,
  `descripcion` varchar(500) DEFAULT NULL,
  `repuestos` tinyint(1) DEFAULT NULL,
  `descripcion_repuestos` varchar(500) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id_solicitud`,`id_estado`,`fecha`),
  KEY `id_estado` (`id_estado`),
  KEY `id_persona` (`id_persona`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `localizaciones`
--

DROP TABLE IF EXISTS `localizaciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `localizaciones` (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `id_area` varchar(3) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_area` (`id_area`)
) ENGINE=InnoDB AUTO_INCREMENT=221 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `localizaciones`
--

LOCK TABLES `localizaciones` WRITE;
/*!40000 ALTER TABLE `localizaciones` DISABLE KEYS */;
INSERT INTO `localizaciones` VALUES (1,'Fisico-quimico','cca'),(2,'Oficina','sis'),(3,'Deposito','sis'),(4,'Oficina','com'),(5,'Oficina','asr'),(6,'Material limpio','lse'),(7,'Elaboraci├│n','lse'),(8,'Fraccionamiento 1','lse'),(11,'Fraccionamiento de pequ├▒os vol├║menes','lsn'),(12,'Preparaci├│n de soluciones','lsn'),(13,'Blisteado 3','sol'),(14,'Dep├│sito de material limpio','lse'),(15,'Fraccionamiento de semis├│lidos','lsn'),(16,'Acondicionamiento 3','aco'),(17,'Pasillo de granulado','sol'),(18,'Fraccionamiento de grandes vol├║menes','lsn'),(19,'Acondicionamiento 5','aco'),(20,'Acondicionamiento 8','aco'),(21,'Elaboraci├│n','lsn'),(22,'L├¡nea de Aire comprimido- Box 1','sol'),(23,'Elaboraci├│n - Linea de nitrogeno','lse'),(24,'Preparaci├│n de materiales','lse'),(25,'Ensobrado','sol'),(26,'Box 2','sol'),(27,'Acondicionamiento 6','aco'),(29,'Sellado','sol'),(30,'Moldeo','sol'),(31,'Mezclado','sol'),(32,'Granulado','sol'),(33,'Elaboracion de liquidos','lsn'),(34,'Acondicionamiento 4','aco'),(35,'Fraccionamiento 2','lse'),(36,'deposito','com'),(37,'C├ímara - Zona de Carga','mic'),(38,'Camara de Estabilidad','cca'),(39,'Control Higienico Planta baja.','mic'),(40,'Esterilidades','mic'),(41,'Control Higi├®nico','mic'),(42,'Estabilidades','cca'),(43,'Cepario','mic'),(44,'Lavadero - Linea aire comprimido','lse'),(45,'Ensobrado','sol'),(46,'Compresi├│n - Box 1','sol'),(47,'Compresi├│n','sol'),(48,'Recubrimiento','sol'),(49,'Empaque X','aco'),(50,'Descarga','lse'),(51,'Acondicionamiento 7','aco'),(52,'Lavadero - Punto de burbuja','lse'),(53,'Esclusa intermedia entre Fraccionamiento 1 y Elaboraci├│n','lse'),(54,'Fraccionamiento de Semis├│lidos 2','lsn'),(55,'Lavadero','lse'),(56,'Box 4','sol'),(57,'Fraccionamiento 1 - Linea de Nitr├│geno','lse'),(58,'Fraccionamiento 2 - L├¡nea de aire comprimido','lse'),(59,'Mezclado 2','sol'),(60,'Sala de Pesadas','pes'),(61,'Acondicionamiento 10','aco'),(62,'Recubrimiento 2','sol'),(63,'Box 6 - Compresi├│n','sol'),(64,'Blisteado 2','sol'),(65,'Empaque 9 - Box 2','aco'),(66,'Sector sur','pex'),(67,'Exterior sala de m├íquinas 1','sm1'),(68,'Exterior sala de m├íquinas 1','sm1'),(69,'Planta de Tratamiento de Agua','sm1'),(70,'Muestreo','cca'),(71,'C├ímara - Zona de Carga','cca'),(72,'Acondicionamiento 2','aco'),(73,'Acondicionamiento 9','aco'),(74,'Dep├│sito de inflamables','der'),(75,'Secado','sol'),(76,'Blisteado','sol'),(77,'Encapsulado','sol'),(78,'Box 1','sol'),(79,'Box 3','sol'),(80,'Paila','sol'),(81,'Elaboraci├│n - L├¡nea de vapor','lse'),(82,'Fraccionamiento 1 - L├¡nea de aire comprimido','lse'),(83,'Elaboracion semisolidos','lsn'),(84,'2do piso planta','sm1'),(85,'Entrepiso','sm3'),(86,'Exterior de sala de m├íquinas 2','sm2'),(87,'Exterior, debajo de escalera de acceso','sm1'),(88,'Exterior, sector sur de la empresa','ext'),(89,'Playon Exterior Sector sur de la empresa','ext'),(90,'Terraza t├®cnica 1','sm2'),(91,'Terraza t├®cnica 3','sm2'),(92,'Expedici├│n','dee'),(93,'Materia Prima','der'),(94,'Material de empaque','der'),(95,'Materia prima aprobada','der'),(96,'Picking','dee'),(97,'Pre c├ímara/ Producto terminado','dee'),(98,'Producto terminado','dee'),(99,'Recepci├│n de materiales','der'),(100,'Lavadero','mae'),(101,'Comedor','mae'),(103,'Material de empaque 3','der'),(104,'Mezclado y tamizado','sol'),(105,'Material de empaque 2','der'),(106,'Contramuestras','cca'),(107,'Contramuestra materia prima','cca'),(109,'Contramuestra producto termiando 2','cca'),(110,'Packaging 2','dee'),(111,'Otro','aco'),(112,'Otro','act'),(113,'Otro','ari'),(114,'Otro','asr'),(115,'Otro','cca'),(116,'Otro','coe'),(117,'Otro','com'),(118,'Otro','con'),(119,'Otro','cos'),(120,'Otro','dee'),(121,'Otro','der'),(122,'Otro','des'),(123,'Otro','dir'),(124,'Otro','dis'),(125,'Otro','dit'),(126,'Otro','dmp'),(127,'Otro','dse'),(128,'Otro','ext'),(129,'Otro','fac'),(130,'Otro','gca'),(131,'Otro','GSP'),(132,'Otro','gua'),(133,'Otro','ind'),(134,'Otro','ing'),(135,'Otro','lnt'),(136,'Otro','lse'),(137,'Otro','lsn'),(138,'Otro','lst'),(139,'Otro','mae'),(140,'Otro','man'),(141,'Otro','mar'),(142,'Otro','med'),(143,'Otro','mic'),(144,'Otro','oft'),(145,'Otro','ope'),(146,'Otro','pag'),(147,'Otro','per'),(148,'Otro','pes'),(149,'Otro','pex'),(150,'Otro','pla'),(151,'Otro','pre'),(152,'Otro','pro'),(153,'Otro','rec'),(154,'Otro','reh'),(155,'Otro','sis'),(156,'Otro','sm1'),(157,'Otro','sm2'),(158,'Otro','sm3'),(159,'Otro','sol'),(160,'Otro','sot'),(161,'Otro','srs'),(162,'Otro','tt1'),(163,'Otro','tt2'),(164,'Otro','val'),(165,'Otro','ven'),(166,'Oficina','aco'),(167,'Oficina 1','cca'),(168,'Oficina 2','cca'),(169,'Oficina','coe'),(170,'Oficina','con'),(171,'Oficina','cos'),(172,'Oficina','dir'),(173,'Oficina','dis'),(174,'Oficina','dit'),(175,'Oficina','fac'),(176,'Oficina','gca'),(177,'Oficina','GSP'),(178,'Oficina','gua'),(179,'Oficina','ind'),(180,'Oficina','ing'),(181,'Oficina','mae'),(182,'Sala vidriada 1','srs'),(183,'Sala vidriada 2','srs'),(184,'Sala de reuniones','srs'),(185,'Pasillo','lse'),(186,'Elaboracion','oft'),(187,'Oficina','adm'),(188,'Oficina planta baja','adm'),(189,'Oficina','pro'),(190,'Oficina','des'),(191,'Sala de servidor (administracion)','sis'),(192,'Sala de comunicaciones (planta)','sis'),(194,'Oficina','med'),(195,'Control de materiales','cca'),(196,'Oficina','der'),(197,'Oficina','dee'),(198,'Oficina','gpr'),(199,'Otro','gpr'),(200,'Oficina','lsn'),(201,'Oficina','man'),(202,'Oficina','mar'),(203,'Oficina','mic'),(204,'Oficina','oft'),(205,'Oficina','pag'),(206,'Oficina planta baja','pag'),(207,'Pasillo','oft'),(208,'Oficina','per'),(209,'Oficina','pla'),(210,'Oficina','pre'),(211,'Oficina','rec'),(212,'Oficina','reh'),(213,'Oficina','sol'),(214,'Oficina','val'),(215,'Oficina','ven'),(216,'Oficina','vic'),(217,'Oficina','aaa'),(218,'Prueba2','aaa'),(219,'Cotizaciones','com'),(220,'pruerwe fsd','aaw');
/*!40000 ALTER TABLE `localizaciones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mantenimientos_programados`
--

DROP TABLE IF EXISTS `mantenimientos_programados`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mantenimientos_programados` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) NOT NULL,
  `equipo` varchar(7) NOT NULL,
  `frecuencia` int(11) NOT NULL,
  `descripcion` text DEFAULT NULL,
  `activo` tinyint(1) NOT NULL DEFAULT 1,
  `ultima_fecha_mantenimiento` date DEFAULT NULL,
  `fecha_de_inicio` date NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mantenimientos_preventivos_frecuencia_foreign` (`frecuencia`),
  KEY `equipo` (`equipo`),
  CONSTRAINT `mantenimientos_preventivos_frecuencia_foreign` FOREIGN KEY (`frecuencia`) REFERENCES `frecuencias` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mantenimientos_programados`
--

LOCK TABLES `mantenimientos_programados` WRITE;
/*!40000 ALTER TABLE `mantenimientos_programados` DISABLE KEYS */;
INSERT INTO `mantenimientos_programados` VALUES (1,'Prueba 01 01','C-004',10,'Prueba 01 01',1,NULL,'2024-09-03','2024-09-03 21:31:13','2024-09-03 21:31:13'),(2,'prueba 10 10','C-002',4,'prueba 10 10',1,NULL,'2024-10-04','2024-09-04 20:15:31','2024-09-04 20:15:31'),(3,'pruena 10 10','C-003',5,'pruena 10 10',1,NULL,'2024-10-02','2024-09-04 20:16:15','2024-09-04 20:16:15'),(4,'pruena 10 10','C-004',2,'pruena 10 10',1,NULL,'2024-11-20','2024-09-04 20:17:23','2024-09-04 20:17:23'),(5,'sdfdsgdfsgfdgdsfg','C-004',5,'sdfgsdfgdfsgdfsgsdf',0,NULL,'2024-09-09','2024-09-04 22:30:34','2024-09-04 22:30:34'),(6,'prueba 11 11','C-033',6,'prueba 11 11',0,NULL,'2024-09-09','2024-09-06 22:19:49','2024-09-06 22:19:49'),(7,'$request[\'activo1\']','C-031',1,'$request[\'activo1\']',1,'2024-09-09','2024-09-09','2024-09-06 23:27:16','2024-09-06 23:27:16'),(8,'prueba 12 121','G-009',1,'prueba 12 121',0,NULL,'2024-09-09','2024-09-07 00:51:07','2024-09-07 00:51:07'),(9,'erterwterwtewrt','C-003',2,'ewtewrtewrtewr',1,'2024-09-09','2024-09-09','2024-09-07 01:18:09','2024-09-07 01:18:09'),(10,'sdfgdsfgsdfgfdsg','C-002',2,'dfsgdfsgdfsgdsfgdsf',1,'2024-09-09','2024-09-09','2024-09-07 01:18:57','2024-09-07 01:18:57'),(11,'fghfdghdfghfhfdg','C-002',2,'hdfghdgfhdfghdfgh',1,NULL,'2024-09-03','2024-09-10 01:56:07','2024-09-10 01:56:07'),(12,'gdfsgdsgdsfg','C-002',2,'sdfgdsfgdfsgdsfg',1,NULL,'2024-09-04','2024-09-10 01:57:00','2024-09-10 01:57:00'),(13,'sdfddsfsdfsdf','C-002',1,'sdfsdsdfsdfd',1,NULL,'2024-09-04','2024-09-10 01:58:08','2024-09-10 01:58:08'),(14,'adgfdgdfghgjgh','C-002',2,'sdfgdsfgsdfg',1,NULL,'2024-09-04','2024-09-10 20:41:37','2024-09-10 20:41:37');
/*!40000 ALTER TABLE `mantenimientos_programados` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (1,'2014_10_12_000000_create_users_table',1),(2,'2014_10_12_100000_create_password_reset_tokens_table',1),(3,'2019_08_19_000000_create_failed_jobs_table',1),(4,'2019_12_14_000001_create_personal_access_tokens_table',1),(5,'2024_01_11_225539_create_permission_tables',1),(6,'2024_07_31_191352_add_soft_deletes_to_solicitudes_and_historico_solicitudes',2),(10,'2024_08_27_212731_create_mantenimiento_preventivos_table',3);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `model_has_permissions`
--

DROP TABLE IF EXISTS `model_has_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `model_has_permissions` (
  `permission_id` bigint(20) unsigned NOT NULL,
  `model_type` varchar(255) NOT NULL,
  `model_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  KEY `model_has_permissions_model_id_model_type_index` (`model_id`,`model_type`),
  CONSTRAINT `model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `model_has_permissions`
--

LOCK TABLES `model_has_permissions` WRITE;
/*!40000 ALTER TABLE `model_has_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `model_has_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `model_has_roles`
--

DROP TABLE IF EXISTS `model_has_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `model_has_roles` (
  `role_id` bigint(20) unsigned NOT NULL,
  `model_type` varchar(255) NOT NULL,
  `model_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  KEY `model_has_roles_model_id_model_type_index` (`model_id`,`model_type`),
  CONSTRAINT `model_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `model_has_roles`
--

LOCK TABLES `model_has_roles` WRITE;
/*!40000 ALTER TABLE `model_has_roles` DISABLE KEYS */;
INSERT INTO `model_has_roles` VALUES (1,'App\\Models\\User',1),(1,'App\\Models\\User',2),(3,'App\\Models\\User',7);
/*!40000 ALTER TABLE `model_has_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_reset_tokens`
--

DROP TABLE IF EXISTS `password_reset_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password_reset_tokens`
--

LOCK TABLES `password_reset_tokens` WRITE;
/*!40000 ALTER TABLE `password_reset_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_reset_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `permissions`
--

DROP TABLE IF EXISTS `permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `permissions` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `guard_name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `permissions_name_guard_name_unique` (`name`,`guard_name`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permissions`
--

LOCK TABLES `permissions` WRITE;
/*!40000 ALTER TABLE `permissions` DISABLE KEYS */;
INSERT INTO `permissions` VALUES (1,'ver_solicitante','web','2024-01-12 03:42:28','2024-01-12 03:42:28'),(2,'ver_encargado','web','2024-01-12 03:42:28','2024-01-12 03:42:28'),(3,'actualizar-solicitud','web','2024-01-12 03:42:28','2024-01-12 03:42:28'),(4,'asignar-solicitud','web','2024-01-12 03:42:28','2024-01-12 03:42:28'),(5,'agregar-equiposmant','web','2024-01-12 03:42:28','2024-01-12 03:42:28'),(6,'editar-equiposmant','web','2024-01-12 03:42:28','2024-01-12 03:42:28'),(7,'eliminar-solicitud','web','2024-01-12 03:42:28','2024-01-12 03:42:28'),(8,'ver-todas-las-solicitudes','web','2024-01-12 03:42:28','2024-01-12 03:42:28'),(9,'ver-solicitudes-asignadas','web','2024-01-12 03:42:28','2024-01-12 03:42:28'),(10,'reporte-solicitudes','web','2024-01-12 03:42:28','2024-01-12 03:42:28'),(11,'ver-solicitudes-sin-asignar','web','2024-01-12 03:42:28','2024-01-12 03:42:28'),(12,'ver-todas-las-solicitudes-y-proyectos','web','2024-01-12 03:42:28','2024-01-12 03:42:28'),(13,'ver-proyectos','web','2024-01-12 03:42:28','2024-01-12 03:42:28'),(14,'correo-de-repuestos','web','2024-01-12 03:42:28','2024-01-12 03:42:28'),(15,'PRUEBA','web','2024-01-26 02:07:35','2024-01-26 02:07:35'),(16,'PRUEBA 2','web','2024-01-26 03:48:27','2024-01-26 03:48:27'),(17,'PRUEBA 3','web','2024-01-26 04:09:32','2024-01-26 04:09:32'),(18,'PRUEBA 4','web','2024-01-26 04:10:07','2024-01-26 04:10:07');
/*!40000 ALTER TABLE `permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `personal_access_tokens`
--

DROP TABLE IF EXISTS `personal_access_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) unsigned NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personal_access_tokens`
--

LOCK TABLES `personal_access_tokens` WRITE;
/*!40000 ALTER TABLE `personal_access_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `personal_access_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `personas`
--

DROP TABLE IF EXISTS `personas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `personas` (
  `id_p` int(10) NOT NULL AUTO_INCREMENT,
  `nombre_p` varchar(100) NOT NULL,
  `apellido` varchar(100) DEFAULT NULL,
  `dni` int(11) DEFAULT NULL,
  `interno` int(11) DEFAULT NULL,
  `correo` varchar(50) DEFAULT NULL,
  `fe_nac` date DEFAULT NULL,
  `fe_ing` date DEFAULT NULL,
  `area` varchar(3) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `jefe` int(1) NOT NULL,
  `usuario` bigint(20) unsigned DEFAULT NULL,
  `activo` tinyint(4) DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id_p`),
  KEY `usuario` (`usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=1468 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;



DROP TABLE IF EXISTS `role_has_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `role_has_permissions` (
  `permission_id` bigint(20) unsigned NOT NULL,
  `role_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`permission_id`,`role_id`),
  KEY `role_has_permissions_role_id_foreign` (`role_id`),
  CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role_has_permissions`
--

LOCK TABLES `role_has_permissions` WRITE;
/*!40000 ALTER TABLE `role_has_permissions` DISABLE KEYS */;
INSERT INTO `role_has_permissions` VALUES (1,1),(2,1),(3,1),(3,2),(3,3),(4,1),(4,2),(5,1),(5,2),(5,4),(6,1),(6,2),(6,4),(7,1),(7,2),(8,2),(9,3),(10,1),(10,2),(10,3),(12,1);
/*!40000 ALTER TABLE `role_has_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `roles` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `guard_name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `roles_name_guard_name_unique` (`name`,`guard_name`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'Administrador','web','2024-01-12 03:42:28','2024-01-12 03:42:28'),(2,'Jefe-Mantenimiento','web','2024-01-12 03:42:28','2024-01-12 03:42:28'),(3,'Empleado-Mantenimiento','web','2024-01-12 03:42:28','2024-01-12 03:42:28'),(4,'Empelado','web','2024-01-12 03:42:28','2024-01-12 03:42:28');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `solicitudes`
--

DROP TABLE IF EXISTS `solicitudes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `solicitudes` (
  `id` int(20) NOT NULL,
  `titulo` varchar(50) NOT NULL,
  `id_equipo` varchar(7) DEFAULT NULL,
  `id_falla` int(4) DEFAULT NULL,
  `id_solicitante` int(10) NOT NULL,
  `id_encargado` int(10) DEFAULT NULL,
  `id_tipo_solicitud` int(2) NOT NULL,
  `id_area_proyecto` varchar(3) DEFAULT NULL,
  `id_localizacion_edilicio` int(4) DEFAULT NULL,
  `horas_de_trabajo` float DEFAULT NULL,
  `id_estado` int(2) NOT NULL,
  `fecha_alta` datetime NOT NULL DEFAULT current_timestamp(),
  `fecha_finalizacion` datetime DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_tipo_solicitud` (`id_tipo_solicitud`),
  KEY `id_estado` (`id_estado`),
  KEY `id_area_proyecto` (`id_area_proyecto`),
  KEY `id_encargado` (`id_encargado`),
  KEY `id_solicitante` (`id_solicitante`),
  KEY `id_falla` (`id_falla`),
  KEY `id_equipo` (`id_equipo`),
  KEY `id_localizacion_edilicio` (`id_localizacion_edilicio`) USING BTREE,
  CONSTRAINT `solicitudes_ibfk_1` FOREIGN KEY (`id_tipo_solicitud`) REFERENCES `tipo_solicitudes` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tipo_solicitudes`
--

DROP TABLE IF EXISTS `tipo_solicitudes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tipo_solicitudes` (
  `id` int(2) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo_solicitudes`
--

LOCK TABLES `tipo_solicitudes` WRITE;
/*!40000 ALTER TABLE `tipo_solicitudes` DISABLE KEYS */;
INSERT INTO `tipo_solicitudes` VALUES (1,'Especializado'),(2,'Edilicio');
/*!40000 ALTER TABLE `tipo_solicitudes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipos_equipos`
--

DROP TABLE IF EXISTS `tipos_equipos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tipos_equipos` (
  `id` int(4) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipos_equipos`
--

LOCK TABLES `tipos_equipos` WRITE;
/*!40000 ALTER TABLE `tipos_equipos` DISABLE KEYS */;
INSERT INTO `tipos_equipos` VALUES (0,'Edilicio'),(1,'Ablandador'),(2,'Acomodador de frascos'),(3,'Agitador'),(4,'Agitador con placa calefactora'),(5,'Agitador Externo con Tolva'),(6,'Agitador magn├®tico'),(7,'Agitador multipunto'),(8,'Aire acondicionado'),(9,'Alimantador'),(10,'Alimentador de frascos'),(11,'Amasadora'),(12,'Analizador de humedad'),(13,'Analizador de integridad de filtros'),(14,'Analizador de TOC'),(15,'Analizador de TOC en l├¡nea'),(16,'Anem├│metro'),(17,'Apilador'),(18,'Aspiradora'),(19,'Autoclave'),(20,'Autoclave por vapor de agua'),(21,'Autoelevador'),(22,'Autoelevador el├®ctrico'),(23,'Balanza'),(24,'Balanza anal├¡tica'),(25,'Balanza contadora'),(26,'Balanza Granataria'),(27,'Balanza Ohaus'),(28,'Ba├▒o de ultrasonido'),(29,'Ba├▒o seco digital'),(30,'Ba├▒o termost├ítico'),(31,'Bid├│n'),(32,'Blistera'),(33,'Bomba centr├¡fuga'),(34,'Bomba de vacio'),(35,'Bomba Dosificadora Volumetrica'),(36,'Bomba neum├ítica'),(37,'Bomba neumatica de doble diafragma'),(38,'Bomba perist├íltica'),(39,'Bomba peristaltica sanitaria'),(40,'Bomba tornillo'),(41,'Brazo robotico'),(42,'Bureta'),(43,'Cabina de seguridad'),(44,'Cabinas flujos laminares'),(45,'Caldera'),(46,'Calder├¡n de SIP'),(47,'Calefactor'),(48,'Calibrador molino oscilante'),(49,'Calibre'),(50,'Calibre Digital'),(51,'C├ímara de Estabilidad'),(52,'C├ímara frigor├¡fica'),(53,'Campana de extracci├│n'),(54,'Cargador de baterias'),(55,'Cargador de polvo'),(56,'cargador universal'),(57,'Centrifuga'),(58,'Chiller'),(59,'Cinta transportadora'),(60,'Codificadora'),(61,'Codificadora inkjet'),(62,'Codificadora/ etiquetadora'),(63,'Colector de polvo'),(64,'Color├¡metro'),(65,'Compresor de aire'),(66,'Compresora'),(67,'Conductimetro'),(68,'Contador de colonias'),(69,'Contador de part├¡culas'),(70,'Contenedor de bolsas est├®riles descartables'),(71,'Controlador de agua purificada'),(72,'Controlador de comprimidos / Tablet Tester'),(73,'Cromat├│grafo'),(74,'Curban'),(75,'Desblisteadora Manual'),(76,'Desempolvador'),(77,'Deshumectador'),(78,'Deshumidificador'),(79,'Deshumidificador/ Secador por absorci├│n'),(80,'Desintegrador'),(81,'Determinador de granulometr├¡a'),(82,'Disgregador'),(83,'Disolutor'),(84,'Dobladora de prospectos'),(85,'Dosificadora'),(86,'Dosificadora de frascos goteros'),(87,'Dosificadora de polvo'),(88,'Dosificadora peristaltica (Bomba)'),(89,'Dur├│metro'),(90,'Zorra balanza'),(91,'Elevador de tambores'),(92,'Emulsificadora'),(93,'Encapsuladora'),(94,'Encintadora'),(95,'Encintadora / Sistema de etiquetado de sticker de seguridad'),(96,'Ensobradora'),(97,'Envasadora al Vacio y Selladora'),(98,'Equipo agua Purificada'),(99,'Equipo Multiproposito'),(100,'Escalera'),(101,'Esp├ítula'),(102,'Espatula de Acero Inoxidable'),(103,'Espatula de Goma'),(104,'Esp├ítula de tefl├│n grande'),(105,'Espectrofot├│metro'),(106,'Espectrofot├│metro UV-visible'),(107,'Espectrometro Raman'),(108,'Esterilizador'),(109,'Estuchadora'),(110,'Estufa'),(111,'Estufa de cultivo'),(112,'Estufa de estabilidad'),(113,'Estufa de esterilizaci├│n'),(114,'Estufa de secado'),(115,'Etiquetadora'),(116,'Evaporador de aire acondicionado'),(117,'Extractor a fuga'),(118,'Extractor de aire'),(119,'Extractor de polvos'),(120,'Fiabril├│metro'),(121,'Filtro'),(122,'Filtro prensa'),(123,'FITR (infrarojo)'),(124,'Flujo laminar'),(125,'Fraccionadora'),(126,'Fraccionadora de alcohol'),(127,'Fraccionadora de pomos'),(128,'Freezer'),(129,'Friabilometro'),(130,'Fundidor de grasa'),(131,'Generador de vac├¡o'),(132,'Granulador'),(133,'Grupo electr├│geno'),(134,'Heladera'),(135,'Homomixer'),(136,'Horno termocontraible'),(137,'HPLC'),(138,'Impresora'),(139,'Inductor'),(140,'Inflador de bolsas de embalaje'),(141,'Isolator'),(142,'Jarra de acero inoxidable'),(143,'Jarra Graduada'),(144,'L├ímpara UV'),(145,'Lavadora de pisos'),(146,'Lavadora ultras├│nica'),(147,'Lavarropas'),(148,'Lavasecadora fregadora de pisos'),(149,'Licuadora de mano'),(150,'Llenadora de Envases Perist├íltica'),(151,'Llenadora de polvos A.M.S'),(152,'Llenadora de viales pl├ísticos'),(153,'Lustradora'),(154,'Luz inact├¡nica'),(155,'Manifold de Acero inoxidable x 4'),(156,'Manifold FINO'),(157,'Manifold Fino x 6'),(158,'Manifold x 4 racord'),(159,'Manifold x 5 racord'),(160,'Man├│metro'),(161,'Manovacu├│metro'),(162,'Masa revisadora'),(163,'Medidor de halo de inhibici├│n'),(164,'Medidor de punto de fusion'),(165,'Mezclador de tambores'),(166,'Mezcladora'),(167,'Mezcladora 3D'),(168,'Micropipeta'),(169,'Micropipeta monocanal'),(170,'Microscopio ├│ptico'),(171,'Molino'),(172,'Molino a bolas'),(173,'Molino a martillo'),(174,'Molino Calibrador'),(175,'Molino Calibrador Conico'),(176,'Molino coloidal'),(177,'Molino de martillos'),(178,'Molino de pantalla c├│nica'),(179,'Molino oscilante'),(180,'Mortero'),(181,'Muestreador de aire comprimido y gases'),(182,'Muestreador de aire volumetrico'),(183,'Muestreador de aire y gases / RCS High Flow'),(184,'Mufla'),(185,'Osm├│metro'),(186,'Ovulera'),(187,'Paila'),(188,'Paila de Recubrimiento'),(189,'Pantalla'),(190,'Pass trough'),(191,'PHmetro'),(192,'Phmetro portatil'),(193,'Plancha a vapor'),(194,'Plancha calefactora'),(195,'Plataforma para elevador'),(196,'Polar├¡metro'),(197,'Portafiltro'),(198,'Precintadora'),(199,'Pulm├│n'),(200,'Pulm├│n de aire comprimido'),(201,'Punto de Fusi├│n'),(202,'Purificador de Agua'),(203,'Reactor'),(204,'Recipiente acero inoxidable'),(205,'Recipiente de acero inoxidable'),(206,'Recipiente de vidrio'),(207,'Refract├│metro'),(208,'Refrigerador'),(209,'Roscadora semiautom├ítica'),(210,'Rotogranulador'),(211,'Secador de lecho fluidizado'),(212,'Secarropas'),(213,'Sellador'),(214,'Sellador manual'),(215,'Sellador para Termocontraible'),(216,'Selladora de bolsas'),(217,'Selladora de polietileno'),(218,'Selladora de pomos'),(219,'Sensores contadores de part├¡culas'),(220,'Sistema contador de part├¡culas sector de Est├®riles'),(221,'Sistema de brazo mec├ínico'),(222,'Sistema de brazo rob├│tico'),(223,'Sistema de control y alarma'),(224,'Sistema de esterilizado'),(225,'Sistema de Generaci├│n de TyH de la c├ímaras de estabilidad'),(226,'Sistema de prueba punto de burbuja'),(227,'Sistema de refirgeraci├│n'),(228,'Sistema de ventilaci├│n'),(229,'Sopladora de frascos'),(230,'Sprayador de alcohol'),(231,'Tablero de la Red contra incendios'),(232,'Tac├│metro'),(233,'Tamiz'),(234,'Tamiz de Acero Inoxidable'),(235,'Tanque'),(236,'Tanque de acero inoxidable'),(237,'Tanque (Cisterna Red de Incendios)'),(238,'Tapadora'),(239,'Tapadora autom├ítica'),(240,'Termohigr├│metro'),(241,'Termometro'),(242,'Termometro Datalogger'),(243,'Term├│metro de Hg'),(244,'Term├│metro de punci├│n'),(245,'Termometro digital'),(246,'Term├│metro infrarrojo'),(247,'Term├│metro varilla'),(248,'Termotanque'),(249,'Testeador de integridad de filtros'),(250,'Titulador'),(251,'TOC Online'),(252,'Torqu├¡metro'),(253,'Turbomezclador Granulador'),(254,'UTA C (Ampliaci├│n S├│lidos, ala izquierda)'),(255,'UTA D (Ampliaci├│n S├│lidos, ala derecha)'),(256,'UTA Desarrollo farmac├®utico'),(257,'UTA Ensobrado'),(258,'UTA Esterilidad'),(259,'UTA estufa de secado'),(260,'UTA Lecho fluido'),(261,'UTA LySS est├®riles'),(262,'UTA LySS no est├®riles'),(263,'UTA Microbiolog├¡a general'),(264,'UTA Paila de recubrimiento'),(265,'UTA Paila de recubrimiento COMASA'),(266,'UTA Pesadas y Muestreo'),(267,'UTA Segregados'),(268,'UTA S├│lidos A'),(269,'UTA S├│lidos B'),(270,'Vacu├│metro'),(271,'Varilla term├│metro'),(272,'Vibrador'),(273,'Viscos├¡metro'),(274,'V├│rtex'),(275,'Zorra'),(276,'Mezclador multidireccional'),(277,'Termocontraible'),(278,'Bal├│metro'),(279,'Contador de particulas portatil'),(280,'Datalogger'),(281,'Analizador de gases'),(282,'Validador de Temperatura'),(283,'Rugos├¡metro'),(284,'Lavarropas automaticos'),(285,'Termohigr├│metro datalogger'),(286,'Term├│metro Datalogger');
/*!40000 ALTER TABLE `tipos_equipos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Agustin Gonzalez','agusgonzalez603@hotmail.com',NULL,'$2y$12$LJKgc3GOIHKrjJFmC547ouW9QKmdI31I3oCVvToPU5yP4bhuZXkma',NULL,'2024-01-12 03:44:38','2024-01-12 03:44:38'),(7,'Juliana Alfonsini','julianaalfonsini8@gmail.com',NULL,'$2y$12$AotwnHHGz1AuVr4uFKKyfeykUHmCll4xWBJe4Kpp7l4aq96tiizJq',NULL,'2024-09-09 18:29:54','2024-09-09 18:29:54');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-10-25 15:42:58

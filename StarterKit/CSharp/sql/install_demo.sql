DROP DATABASE AjaxDemo
GO

CREATE DATABASE AjaxDemo
GO

USE AjaxDemo
GO

CREATE TABLE dbo.Customers
(
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[Number] [char](6) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[PostCode] [char](6) NULL,
	CONSTRAINT [PK_Customers] PRIMARY KEY NONCLUSTERED 
	(
		[ID] ASC
	)
)
GO

CREATE TABLE dbo.Orders
(
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[OrderNumber] [char](10) NOT NULL,
	[PartNumber] [char](4) NOT NULL,
	[JobNumber] [char](1) NOT NULL,
	[DueDate] [datetime] NULL,
	[CustomerID] [bigint] NULL,
	CONSTRAINT [PK_Orders] PRIMARY KEY NONCLUSTERED 
	(
		[ID] ASC
	)
)
GO

ALTER TABLE dbo.Orders WITH CHECK
ADD CONSTRAINT [FK_Orders_Customers] FOREIGN KEY([CustomerID])
REFERENCES dbo.Customers ([ID])
ON DELETE CASCADE
GO

CREATE PROCEDURE dbo.AddOrder
(
	@OrderNumber char(10),
	@PartNumber char(4),
	@JobNumber char(1),
	@DueDate datetime,
	@CustomerName nvarchar(50),
	@OrderID bigint OUTPUT
	)
AS
	DECLARE @CustomerID bigint
	SELECT @CustomerID = ID FROM dbo.Customers WHERE Name=@CustomerName

	INSERT INTO dbo.Orders (OrderNumber, PartNumber, JobNumber, DueDate, CustomerID)
	VALUES (@OrderNumber, @PartNumber, @JobNumber, @DueDate, @CustomerID)
	SELECT @OrderID = @@Identity
GO


INSERT INTO dbo.Customers (Number, Name, PostCode) VALUES ('AD206 ','ADHESIA', '68720 ')
INSERT INTO dbo.Customers (Number, Name, PostCode) VALUES ('AT075 ','AEF ATELIER D''EM. FAULQU', '57380 ')
INSERT INTO dbo.Customers (Number, Name, PostCode) VALUES ('AL268 ','ALBEMARLE CHEMICALS S.A.', '13521 ')
INSERT INTO dbo.Customers (Number, Name, PostCode) VALUES ('PE0084','ALCAN PACKAGING CAPSULES', '71104 ')
INSERT INTO dbo.Customers (Number, Name, PostCode) VALUES ('AL338 ','ALCAN SINGEN GMBH', 'D78244')
INSERT INTO dbo.Customers (Number, Name, PostCode) VALUES ('DO060 ','ALCOOL PETROLE CHIMIE', '25220 ')
INSERT INTO dbo.Customers (Number, Name, PostCode) VALUES ('AL126 ','ALKO  SA.    MR. MILLIAT', '71500 ')
INSERT INTO dbo.Customers (Number, Name, PostCode) VALUES ('AL124 ','ALPACK SA', '67130 ')
INSERT INTO dbo.Customers (Number, Name, PostCode) VALUES ('AL053 ','ALPLAST', '68160 ')
INSERT INTO dbo.Customers (Number, Name, PostCode) VALUES ('AL102 ','ALUMINIUM-KONSTRUKTIONST', 'D79793')
INSERT INTO dbo.Customers (Number, Name, PostCode) VALUES ('AL287 ','ALUSOR', '67038 ')
INSERT INTO dbo.Customers (Number, Name, PostCode) VALUES ('WA202 ','AMERICAN STANDARD EUROPE', 'D29633')
INSERT INTO dbo.Customers (Number, Name, PostCode) VALUES ('AM211 ','AMMANN-SANDER SARL', '68300 ')
INSERT INTO dbo.Customers (Number, Name, PostCode) VALUES ('AN059 ','ANTALIS AG', 'CH8196')
INSERT INTO dbo.Customers (Number, Name, PostCode) VALUES ('AR252 ','ARBORA & AUSONIA', 'E03100')
INSERT INTO dbo.Customers (Number, Name, PostCode) VALUES ('AT229 ','ATELIER 16', '90300 ')
INSERT INTO dbo.Customers (Number, Name, PostCode) VALUES ('BU206 ','ATELIERS BUSCH & CIE', 'CH2926')
INSERT INTO dbo.Customers (Number, Name, PostCode) VALUES ('GR2232','ATLANTIC CLIMATISATION E', '69882 ')
INSERT INTO dbo.Customers (Number, Name, PostCode) VALUES ('FA005 ','AUTOBAR FLEXIBLE PACKAGI', '42703 ')
INSERT INTO dbo.Customers (Number, Name, PostCode) VALUES ('AV030 ','AVERY DENNISON COMPAGNY', '69240 ')
INSERT INTO dbo.Customers (Number, Name, PostCode) VALUES ('MU210 ','AXAL', '68000 ')
INSERT INTO dbo.Customers (Number, Name, PostCode) VALUES ('AX003 ','AXAL SAS', '68000 ')
INSERT INTO dbo.Customers (Number, Name, PostCode) VALUES ('MA130 ','B.B.A. ERDEM', '74330 ')
INSERT INTO dbo.Customers (Number, Name, PostCode) VALUES ('AL001 ','B.V.ALVERIMPORT', 'NL6833')
INSERT INTO dbo.Customers (Number, Name, PostCode) VALUES ('BA320 ','BAUR VERPACKUNG E.K.', 'D83352')
INSERT INTO dbo.Customers (Number, Name, PostCode) VALUES ('BE227 ','BECTON DICKINSON', '38560 ')
INSERT INTO dbo.Customers (Number, Name, PostCode) VALUES ('BE2922','BEHR SERVICE SAS', '68000 ')
INSERT INTO dbo.Customers (Number, Name, PostCode) VALUES ('BE285 ','BEHR-HELLA THERMOCONTROL', 'D59557')
INSERT INTO dbo.Customers (Number, Name, PostCode) VALUES ('BE222 ','BEKON-KORALLE AG', 'CH6252')
INSERT INTO dbo.Customers (Number, Name, PostCode) VALUES ('BR145 ','BONZI  EMBALLAGES', '74370 ')
INSERT INTO dbo.Customers (Number, Name, PostCode) VALUES ('BO193 ','BOURBON AUTOMOBILE', '01100 ')
INSERT INTO dbo.Customers (Number, Name, PostCode) VALUES ('BP010 ','BPW BERGISCHE ACHSEN KG', 'D51674')
INSERT INTO dbo.Customers (Number, Name, PostCode) VALUES ('BRA01 ','BRANGS + HEINRICH GMBH', 'D07554')
INSERT INTO dbo.Customers (Number, Name, PostCode) VALUES ('FR119 ','BRASSERIE FISCHER SA', '67300 ')
INSERT INTO dbo.Customers (Number, Name, PostCode) VALUES ('HE005 ','BRASSERIES HEINEKEN SA', '59370 ')
INSERT INTO dbo.Customers (Number, Name, PostCode) VALUES ('KR001 ','BRASSERIES KRONENBOURG 5', '67037 ')
INSERT INTO dbo.Customers (Number, Name, PostCode) VALUES ('BR003 ','BRENNER VERPACKUNG GMBH', 'D82069')
INSERT INTO dbo.Customers (Number, Name, PostCode) VALUES ('BU210 ','BUBENDORFF SA', '68306 ')
INSERT INTO dbo.Customers (Number, Name, PostCode) VALUES ('BU210 ','BUBENDORFF VOLET ROULANT', '68170 ')
INSERT INTO dbo.Customers (Number, Name, PostCode) VALUES ('      ','BV ALVERIMPORT', '      ')
INSERT INTO dbo.Customers (Number, Name, PostCode) VALUES ('CO068 ','C.2.P.', '69400 ')
INSERT INTO dbo.Customers (Number, Name, PostCode) VALUES ('CO554 ','CAP LOGISTIC', '57360 ')
INSERT INTO dbo.Customers (Number, Name, PostCode) VALUES ('CA117 ','CAPSUGEL', '68027 ')
INSERT INTO dbo.Customers (Number, Name, PostCode) VALUES ('CA422 ','CAREDIS', '21300 ')
INSERT INTO dbo.Customers (Number, Name, PostCode) VALUES ('CA042 ','CART.EMBAL. RHONE ALPES', '69881 ')
INSERT INTO dbo.Customers (Number, Name, PostCode) VALUES ('CA215 ','CARTON PLUS', '69657 ')
INSERT INTO dbo.Customers (Number, Name, PostCode) VALUES ('NI200 ','CARTONNAGES BERTRAND - N', '01590 ')
INSERT INTO dbo.Customers (Number, Name, PostCode) VALUES ('DR219 ','CARTONNAGES DREVET', '38370 ')
INSERT INTO dbo.Customers (Number, Name, PostCode) VALUES ('DA003 ','CARTONNAGES DU DAUPHINE', '38290 ')
INSERT INTO dbo.Customers (Number, Name, PostCode) VALUES ('PF001 ','CARTONNAGES PFAHRER', '25502 ')
INSERT INTO dbo.Customers (Number, Name, PostCode) VALUES ('RO016 ','CARTONNAGES ROSET', '74162 ')
INSERT INTO dbo.Customers (Number, Name, PostCode) VALUES ('CA453 ','CASPARI GMBH U.CO.KG', 'D51545')
INSERT INTO dbo.Customers (Number, Name, PostCode) VALUES ('CA204 ','CATEM S.A', 'E08560')
INSERT INTO dbo.Customers (Number, Name, PostCode) VALUES ('CA124 ','CAVE COOPERATIVE RIBEAUV', '68152 ')
INSERT INTO dbo.Customers (Number, Name, PostCode) VALUES ('AD209 ','CAVES J.B. ADAM', '68770 ')
INSERT INTO dbo.Customers (Number, Name, PostCode) VALUES ('FI207 ','CDF EMBALLAGE SA', 'CH2108')
INSERT INTO dbo.Customers (Number, Name, PostCode) VALUES ('UV200 ','CELLIER DES DAUPHINS', '26790 ')
INSERT INTO dbo.Customers (Number, Name, PostCode) VALUES ('CH145 ','CHAPEL', '38690 ')
INSERT INTO dbo.Customers (Number, Name, PostCode) VALUES ('CH212 ','CHARTREUSE DIFFUSION', '38503 ')
INSERT INTO dbo.Customers (Number, Name, PostCode) VALUES ('CH204 ','CHAVANOZ INDUSTRIE', '38230 ')
INSERT INTO dbo.Customers (Number, Name, PostCode) VALUES ('CH203 ','CHEDDITE FRANCE S.A.', '26260 ')
INSERT INTO dbo.Customers (Number, Name, PostCode) VALUES ('FR225 ','CIE FRANCO-SUISSE', '68720 ')
INSERT INTO dbo.Customers (Number, Name, PostCode) VALUES ('CI201 ','CIMEX AG/LTD', 'CH4253')
INSERT INTO dbo.Customers (Number, Name, PostCode) VALUES ('CL024 ','CLARIANT IBERICA S.A', 'E08820')
INSERT INTO dbo.Customers (Number, Name, PostCode) VALUES ('CLA01 ','CLARIANT PRODUKTE SCHWEI', 'CH4132')
INSERT INTO dbo.Customers (Number, Name, PostCode) VALUES ('CO405 ','COGESAL MIKO-FSEUR 58488', '52100 ')
INSERT INTO dbo.Customers (Number, Name, PostCode) VALUES ('CO649 ','COLAS MIDI MEDITERANNEE', '13742 ')
INSERT INTO dbo.Customers (Number, Name, PostCode) VALUES ('CO427 ','CONDI RHONE ALPES', '38340 ')
INSERT INTO dbo.Customers (Number, Name, PostCode) VALUES ('CO004 ','CONTINENTAL BISCUITS S.A', '68530 ')
INSERT INTO dbo.Customers (Number, Name, PostCode) VALUES ('CO403 ','COSMETIQUE ACTIVE DEUT.G', 'D76646')
INSERT INTO dbo.Customers (Number, Name, PostCode) VALUES ('BA226 ','CRISTALLERIES DE BACCARA', '54120 ')
INSERT INTO dbo.Customers (Number, Name, PostCode) VALUES ('CS2002','CSP', '77230 ')
INSERT INTO dbo.Customers (Number, Name, PostCode) VALUES ('SC245 ','CUISINES SCHMIDT SALM SA', '68660 ')
INSERT INTO dbo.Customers (Number, Name, PostCode) VALUES ('DS011 ','D S SMITH POLSKA', 'PL2563')
INSERT INTO dbo.Customers (Number, Name, PostCode) VALUES ('DP001 ','D.P.F. DIFFUS.PREST.FIAB', '38950 ')
INSERT INTO dbo.Customers (Number, Name, PostCode) VALUES ('DA0474','DAIMLER CHRYSLER AG', 'D76863')
INSERT INTO dbo.Customers (Number, Name, PostCode) VALUES ('DA047 ','DAIMLER CHRYSLER AG (AG)', 'D71711')
INSERT INTO dbo.Customers (Number, Name, PostCode) VALUES ('DE313 ','DECOFERM SAS', '68200 ')
INSERT INTO dbo.Customers (Number, Name, PostCode) VALUES ('DE260 ','DEKKER PACKAGING B.V.', 'NL1324')
INSERT INTO dbo.Customers (Number, Name, PostCode) VALUES ('DE034 ','DELACHAUX DIVISION EEM -', '01300 ')
INSERT INTO dbo.Customers (Number, Name, PostCode) VALUES ('DE354 ','DELIFRANCE SA', '84000 ')
INSERT INTO dbo.Customers (Number, Name, PostCode) VALUES ('DE143 ','DELIPAPIER', '54390 ')
INSERT INTO dbo.Customers (Number, Name, PostCode) VALUES ('DE299 ','DEUFOL GMBH', 'D46047')
INSERT INTO dbo.Customers (Number, Name, PostCode) VALUES ('DH202 ','DHL SOLUTIONS FRANCE SAS', '57100 ')
INSERT INTO dbo.Customers (Number, Name, PostCode) VALUES ('FI078 ','DIAGEO DEUTSCHLAND GMBH', 'D46395')
INSERT INTO dbo.Customers (Number, Name, PostCode) VALUES ('DI210 ','DICESA SA', 'E08100')
INSERT INTO dbo.Customers (Number, Name, PostCode) VALUES ('DI213 ','DIEFENBACH EMBALLAGE', '67260 ')
INSERT INTO dbo.Customers (Number, Name, PostCode) VALUES ('DI205 ','DIEFENBACH VERPACKUNGEN', 'D42719')
INSERT INTO dbo.Customers (Number, Name, PostCode) VALUES ('DI003 ','DITTE GMBH', 'D68789')
INSERT INTO dbo.Customers (Number, Name, PostCode) VALUES ('FE232 ','DOERENTRUP FEUERFESTPROD', 'D32694')
INSERT INTO dbo.Customers (Number, Name, PostCode) VALUES ('DO212 ','DOW AGROSCIENCES', '67850 ')
INSERT INTO dbo.Customers (Number, Name, PostCode) VALUES ('EL220 ','DOW AGROSCIENCES GMBH', 'D85107')
INSERT INTO dbo.Customers (Number, Name, PostCode) VALUES ('DO080 ','DOW AGROSCIENCES SWITERL', '67850 ')
INSERT INTO dbo.Customers (Number, Name, PostCode) VALUES ('DO080 ','DOW AGROSCIENCES SWITZEL', '67850 ')
INSERT INTO dbo.Customers (Number, Name, PostCode) VALUES ('DO080 ','DOW-AGROSCIENCES B.V', 'I24050')
INSERT INTO dbo.Customers (Number, Name, PostCode) VALUES ('DO080 ','DOW-AGROSCIENCES ITALIA', 'I24050')
INSERT INTO dbo.Customers (Number, Name, PostCode) VALUES ('DO0292','DOWELANCO ITALIA S.R.L', 'I24043')
INSERT INTO dbo.Customers (Number, Name, PostCode) VALUES ('KA018 ','DS SMITH KAYPAC', '88800 ')
INSERT INTO dbo.Customers (Number, Name, PostCode) VALUES ('#SOC  ','DS SMITH KAYSERSBERG', '68320 ')
INSERT INTO dbo.Customers (Number, Name, PostCode) VALUES ('LA033 ','DS SMITH SPECIALITY PACK', 'D36256')
INSERT INTO dbo.Customers (Number, Name, PostCode) VALUES ('DS022 ','DSM ELASTOMERS EUROPE', 'NL6167')
INSERT INTO dbo.Customers (Number, Name, PostCode) VALUES ('DU212 ','DU PONT DE NEMOURS (FRAN', '68110 ')
INSERT INTO dbo.Customers (Number, Name, PostCode) VALUES ('NE012 ','DU PONT DE NEMOURS S.A.', 'L2984 ')
INSERT INTO dbo.Customers (Number, Name, PostCode) VALUES ('DU069 ','DUPONT DE NEMOURS ITALIA', 'I39100')
INSERT INTO dbo.Customers (Number, Name, PostCode) VALUES ('NE2243','DUPONT IBERICA S.L.', 'E33469')
INSERT INTO dbo.Customers (Number, Name, PostCode) VALUES ('BI206 ','DUPONT POWDER COATINGS F', '42600 ')
INSERT INTO dbo.Customers (Number, Name, PostCode) VALUES ('TE208 ','DUPONT TEIJIN FILMS', 'L2984 ')
INSERT INTO dbo.Customers (Number, Name, PostCode) VALUES ('DU231 ','DUPONT-MEDICAL-FROUARD', '54250 ')
INSERT INTO dbo.Customers (Number, Name, PostCode) VALUES ('EB202 ','EBERSPAECHER GMBH & CO.K', 'D66539')
INSERT INTO dbo.Customers (Number, Name, PostCode) VALUES ('EC203 ','ECLAIRAGE TECHNIQUE', '54320 ')
INSERT INTO dbo.Customers (Number, Name, PostCode) VALUES ('EC215 ','ECOPACK FRANCE', '54154 ')
INSERT INTO dbo.Customers (Number, Name, PostCode) VALUES ('EC204 ','ECS', '68311 ')
INSERT INTO dbo.Customers (Number, Name, PostCode) VALUES ('FR004 ','ED.FRIEDRICH & CO GMBH', 'D34132')
INSERT INTO dbo.Customers (Number, Name, PostCode) VALUES ('HU205 ','EGON HUEBLER', 'CH4227')
INSERT INTO dbo.Customers (Number, Name, PostCode) VALUES ('EL233 ','ELCO SHARED SERVICES GMB', 'D72379')
INSERT INTO dbo.Customers (Number, Name, PostCode) VALUES ('CH050 ','ELNA INTERNATIONAL CORP.', 'CH1217')
INSERT INTO dbo.Customers (Number, Name, PostCode) VALUES ('FR208 ','EMIL FREI GMBH & CO.', 'D78199')
INSERT INTO dbo.Customers (Number, Name, PostCode) VALUES ('RO201 ','ERWIN ROTH VERPACKUNGSTE', 'D77736')
INSERT INTO dbo.Customers (Number, Name, PostCode) VALUES ('ET200 ','ETOL-WERK', 'D77652')
INSERT INTO dbo.Customers (Number, Name, PostCode) VALUES ('HU210 ','ETS HUGEL ET FILS S.A.', '68340 ')
INSERT INTO dbo.Customers (Number, Name, PostCode) VALUES ('EX045 ','EXEL NV', 'B2160 ')
INSERT INTO dbo.Customers (Number, Name, PostCode) VALUES ('FA208 ','FABI AUTOMOBILE', '25502 ')
INSERT INTO dbo.Customers (Number, Name, PostCode) VALUES ('FD201 ','FDT', 'D69502')
INSERT INTO dbo.Customers (Number, Name, PostCode) VALUES ('FE203 ','FEUER-VOGEL GMBH & CO. K', 'D67346')
INSERT INTO dbo.Customers (Number, Name, PostCode) VALUES ('FI049 ','FINE ORGANICS', 'GBTS 2')
INSERT INTO dbo.Customers (Number, Name, PostCode) VALUES ('FI062 ','FISCHER SERVICES', 'D79346')
INSERT INTO dbo.Customers (Number, Name, PostCode) VALUES ('BR179 ','FONDERIE DE BROUSSEVAL', '52130 ')
INSERT INTO dbo.Customers (Number, Name, PostCode) VALUES ('FO027 ','FORESCO PACKAGING N.V.', 'B2640 ')
INSERT INTO dbo.Customers (Number, Name, PostCode) VALUES ('FO250 ','FOREZ FOURME', '42940 ')
INSERT INTO dbo.Customers (Number, Name, PostCode) VALUES ('FR212 ','FRANCE CONDITIONNEMENT', '13830 ')
INSERT INTO dbo.Customers (Number, Name, PostCode) VALUES ('FR054 ','FREUDENBERG POLITEX S.A.', '68027 ')
INSERT INTO dbo.Customers (Number, Name, PostCode) VALUES ('FR062 ','FREUDENBERG VLIESSTOFFE', 'D69465')
INSERT INTO dbo.Customers (Number, Name, PostCode) VALUES ('BO202 ','FRIEDRICH BOYSEN GMBH &', 'D72213')
INSERT INTO dbo.Customers (Number, Name, PostCode) VALUES ('FR065 ','FRISETTA POLYMER GMBH &', 'D79694')
INSERT INTO dbo.Customers (Number, Name, PostCode) VALUES ('GE272 ','FRITZ W.A. GEHRKE', 'D72501')
INSERT INTO dbo.Customers (Number, Name, PostCode) VALUES ('AR022 ','FRUITIERE VINICOLE D''ARB', '21550 ')
INSERT INTO dbo.Customers (Number, Name, PostCode) VALUES ('GA241 ','GABRIEL GMBH', 'D01099')
INSERT INTO dbo.Customers (Number, Name, PostCode) VALUES ('GE0236','GEFCO SA POUR PMTC', '90150 ')
INSERT INTO dbo.Customers (Number, Name, PostCode) VALUES ('LI075 ','GE-LIGHTING', '57365 ')
INSERT INTO dbo.Customers (Number, Name, PostCode) VALUES ('FR2245','GENERAL MOTORS STRASBOUR', '67026 ')
INSERT INTO dbo.Customers (Number, Name, PostCode) VALUES ('      ','GEORGIA PACIFIC', '      ')
INSERT INTO dbo.Customers (Number, Name, PostCode) VALUES ('KA003 ','GEORGIA-PACIFIC FRANCE', '68320 ')
INSERT INTO dbo.Customers (Number, Name, PostCode) VALUES ('GE202 ','GEPAK W.GERNER GMBH', 'D74424')
INSERT INTO dbo.Customers (Number, Name, PostCode) VALUES ('GE273 ','GEPMAN S.A.S', '71430 ')
INSERT INTO dbo.Customers (Number, Name, PostCode) VALUES ('GI219 ','GIKO KARTONAGEN GMBH', 'A6833 ')
INSERT INTO dbo.Customers (Number, Name, PostCode) VALUES ('GI204 ','GIVAUDAN SUISSE SA.', 'CH1214')
INSERT INTO dbo.Customers (Number, Name, PostCode) VALUES ('CH2447','GRENOBLE PLASTIQUE EMBAL', '38360 ')
INSERT INTO dbo.Customers (Number, Name, PostCode) VALUES ('GY201 ','GROUPE GYMA', '84700 ')
INSERT INTO dbo.Customers (Number, Name, PostCode) VALUES ('SC2081','GUSTAV  SCHRAMM GMBH', 'D49835')
INSERT INTO dbo.Customers (Number, Name, PostCode) VALUES ('WO202 ','GUSTAV WONDRAK UND SOHN', 'D87600')
INSERT INTO dbo.Customers (Number, Name, PostCode) VALUES ('HT002 ','H T L VERPACKUNG GMBH', 'D19246')
INSERT INTO dbo.Customers (Number, Name, PostCode) VALUES ('FU202 ','H.B. FULLER AUSTRIA GMBH', 'A4600 ')
INSERT INTO dbo.Customers (Number, Name, PostCode) VALUES ('LI202 ','H.J.LICHTENBERGER GMBH', 'D68169')
INSERT INTO dbo.Customers (Number, Name, PostCode) VALUES ('HA099 ','HAASS', 'CH4132')
INSERT INTO dbo.Customers (Number, Name, PostCode) VALUES ('HW001 ','HAGSFELDER WERKSTAETTEN', 'D76327')
INSERT INTO dbo.Customers (Number, Name, PostCode) VALUES ('HE004 ','HEIDE WERKSTAETTEN E.V.', 'D29633')
INSERT INTO dbo.Customers (Number, Name, PostCode) VALUES ('KO004 ','HERMANN KOHLHOF GMBH', 'D22145')
INSERT INTO dbo.Customers (Number, Name, PostCode) VALUES ('EU210 ','HERO FRANCE', '26400 ')
INSERT INTO dbo.Customers (Number, Name, PostCode) VALUES ('HE0773','HEXCEL COMPOSITES', '01120 ')
INSERT INTO dbo.Customers (Number, Name, PostCode) VALUES ('HE074 ','HEXCEL FABRICS S.A.', '38630 ')
INSERT INTO dbo.Customers (Number, Name, PostCode) VALUES ('HO256 ','HOCHDORF NUTRITEC AG', 'CH6281')
INSERT INTO dbo.Customers (Number, Name, PostCode) VALUES ('HO236 ','HOLZWERK RIEDER AG', 'CH3772')
INSERT INTO dbo.Customers (Number, Name, PostCode) VALUES ('HO211 ','HORN VERPACKUNG GMBH', 'D71254')
INSERT INTO dbo.Customers (Number, Name, PostCode) VALUES ('HO070 ','HORNA GMBH VERPACKUNGEN', 'D97506')
INSERT INTO dbo.Customers (Number, Name, PostCode) VALUES ('HU211 ','HUSSON INTERNATIONAL', '68650 ')
INSERT INTO dbo.Customers (Number, Name, PostCode) VALUES ('HU001 ','HUWALD LIEBSCHNER GMBH', 'D22761')
INSERT INTO dbo.Customers (Number, Name, PostCode) VALUES ('HW001 ','HWK-HAGSFELDER WERKSTAET', 'D76327')
INSERT INTO dbo.Customers (Number, Name, PostCode) VALUES ('IL200 ','ILLBRUCK PRODUCTION S.A', 'CH4153')
INSERT INTO dbo.Customers (Number, Name, PostCode) VALUES ('WI208 ','IMPORTHAUS WILMS / IMPUL', 'D55232')
INSERT INTO dbo.Customers (Number, Name, PostCode) VALUES ('IN221 ','INA FRANCE', '67500 ')
INSERT INTO dbo.Customers (Number, Name, PostCode) VALUES ('IN221 ','INA ROULEMENTS S.A.', '67000 ')
INSERT INTO dbo.Customers (Number, Name, PostCode) VALUES ('IN255 ','INNOPAC SARL', 'CH1706')
INSERT INTO dbo.Customers (Number, Name, PostCode) VALUES ('IN079 ','INTERGESTION', '54710 ')
INSERT INTO dbo.Customers (Number, Name, PostCode) VALUES ('IN279 ','INTERSTUHL BÜROMÖBEL GMB', 'D72469')
INSERT INTO dbo.Customers (Number, Name, PostCode) VALUES ('LU019 ','J.LUEBER GMBH', 'D79576')
INSERT INTO dbo.Customers (Number, Name, PostCode) VALUES ('JA234 ','JACO', 'D77694')
INSERT INTO dbo.Customers (Number, Name, PostCode) VALUES ('JD200 ','JDW HOLDING GMBH', 'D45881')
INSERT INTO dbo.Customers (Number, Name, PostCode) VALUES ('JD000 ','JDW SPEDITION + LOGISTIK', 'D45881')
INSERT INTO dbo.Customers (Number, Name, PostCode) VALUES ('JO050 ','JOHNSONDIVERSEY SWITZERL', 'CH9542')
INSERT INTO dbo.Customers (Number, Name, PostCode) VALUES ('KO036 ','JTEKT AUTOMOBILE', '21000 ')
INSERT INTO dbo.Customers (Number, Name, PostCode) VALUES ('KO0361','JTEKT AUTOMOBILE LYON', '69540 ')
INSERT INTO dbo.Customers (Number, Name, PostCode) VALUES ('BE319 ','JÜRGEN BECKER RATIOFORM', 'D15566')
INSERT INTO dbo.Customers (Number, Name, PostCode) VALUES ('KO001 ','K O R D E L  ANTRIEBSTEC', 'D48249')
INSERT INTO dbo.Customers (Number, Name, PostCode) VALUES ('KO231 ','K.-J. KOPP GMBH', 'D66989')
INSERT INTO dbo.Customers (Number, Name, PostCode) VALUES ('KAY   ','KAYSERSBERG PACKAGING ST', '02100 ')
INSERT INTO dbo.Customers (Number, Name, PostCode) VALUES ('KE221 ','KEY PLASTICS', '25420 ')
INSERT INTO dbo.Customers (Number, Name, PostCode) VALUES ('KL213 ','KLUEBER LUBRICATION MUEN', 'D80992')
INSERT INTO dbo.Customers (Number, Name, PostCode) VALUES ('KN200 ','KNIPP GMBH', 'D63128')
INSERT INTO dbo.Customers (Number, Name, PostCode) VALUES ('KO034 ','KODAK INDUSTRIE', '71100 ')
INSERT INTO dbo.Customers (Number, Name, PostCode) VALUES ('MI210 ','KONICA MINOLTA SUP.MANU.', '88510 ')
INSERT INTO dbo.Customers (Number, Name, PostCode) VALUES ('KO0361','KOYO STEERING LYON', '69540 ')
INSERT INTO dbo.Customers (Number, Name, PostCode) VALUES ('KR007 ','KRAFT GMBH', 'D75417')
INSERT INTO dbo.Customers (Number, Name, PostCode) VALUES ('AL218 ','LABORATOIRE ALCON', '68240 ')
INSERT INTO dbo.Customers (Number, Name, PostCode) VALUES ('WE222 ','LABORATOIRE WELEDA', '68332 ')
INSERT INTO dbo.Customers (Number, Name, PostCode) VALUES ('FO213 ','LABORATOIRES FOURNIER S.', '21850 ')
INSERT INTO dbo.Customers (Number, Name, PostCode) VALUES ('GA213 ','LABORATOIRES GALDERMA', '74540 ')
INSERT INTO dbo.Customers (Number, Name, PostCode) VALUES ('UR012 ','LABORATOIRES URGO', '21800 ')
INSERT INTO dbo.Customers (Number, Name, PostCode) VALUES ('CU206 ','L''ALSACIENNE SANS CULOTT', '68100 ')
INSERT INTO dbo.Customers (Number, Name, PostCode) VALUES ('NE2072','LE FOURNIL DE FREDERIC', '01300 ')
INSERT INTO dbo.Customers (Number, Name, PostCode) VALUES ('LE263 ','LEGRAND', '67200 ')
INSERT INTO dbo.Customers (Number, Name, PostCode) VALUES ('WA026 ','LES GRANDES SOURCES WATT', '68703 ')
INSERT INTO dbo.Customers (Number, Name, PostCode) VALUES ('LE271 ','LESAFFRE AUSTRIA AG', 'A2355 ')
INSERT INTO dbo.Customers (Number, Name, PostCode) VALUES ('LE203 ','LESER GMBH', 'D77933')
INSERT INTO dbo.Customers (Number, Name, PostCode) VALUES ('LI203 ','LILLY FRANCE S.A.', '67720 ')
INSERT INTO dbo.Customers (Number, Name, PostCode) VALUES ('LI206 ','LINDAL-FRANCE', '54150 ')
INSERT INTO dbo.Customers (Number, Name, PostCode) VALUES ('LI251 ','LINNEMANN-SCHNETZER', 'D09481')
INSERT INTO dbo.Customers (Number, Name, PostCode) VALUES ('LO003 ','LONZA', 'CH4000')
INSERT INTO dbo.Customers (Number, Name, PostCode) VALUES ('LO076 ','LORMA', '88100 ')
INSERT INTO dbo.Customers (Number, Name, PostCode) VALUES ('LS0012','LSR PRODUCTION', '39000 ')
INSERT INTO dbo.Customers (Number, Name, PostCode) VALUES ('LU214 ','LUTZE DESIGN', 'CH1510')
INSERT INTO dbo.Customers (Number, Name, PostCode) VALUES ('WA044 ','MAAG  TECHNIC AG', 'CH4002')
INSERT INTO dbo.Customers (Number, Name, PostCode) VALUES ('MA118 ','MAGIMIX', '71430 ')
INSERT INTO dbo.Customers (Number, Name, PostCode) VALUES ('MA480 ','MAHLE VENTIELTRIEB GMBH', 'D79669')
INSERT INTO dbo.Customers (Number, Name, PostCode) VALUES ('PI006 ','MAHLE-PISTONS FRANCE SAR', '68124 ')
INSERT INTO dbo.Customers (Number, Name, PostCode) VALUES ('TR214 ','MAISON F.E. TRIMBACH SA.', '68150 ')
INSERT INTO dbo.Customers (Number, Name, PostCode) VALUES ('LO207 ','MAISON GUSTAVE LORENTZ S', '68750 ')
INSERT INTO dbo.Customers (Number, Name, PostCode) VALUES ('SP006 ','MAISON SPARR', '68240 ')
INSERT INTO dbo.Customers (Number, Name, PostCode) VALUES ('MA174 ','MAJORETTE', '01600 ')
INSERT INTO dbo.Customers (Number, Name, PostCode) VALUES ('MB003 ','MANZONI BOUCHOT FONDERIE', '39200 ')
INSERT INTO dbo.Customers (Number, Name, PostCode) VALUES ('MA286 ','MARK IV SYSTEMES MOTEURS', '68370 ')
INSERT INTO dbo.Customers (Number, Name, PostCode) VALUES ('BE3191','MÄRKISCHE KARTONAGENFABR', 'D15566')
INSERT INTO dbo.Customers (Number, Name, PostCode) VALUES ('MA231 ','MAURER FRERES', '68260 ')
INSERT INTO dbo.Customers (Number, Name, PostCode) VALUES ('MA602 ','MAUSER METAL', '69303 ')
INSERT INTO dbo.Customers (Number, Name, PostCode) VALUES ('MC207 ','MC PACK GMBH', 'D24159')
INSERT INTO dbo.Customers (Number, Name, PostCode) VALUES ('ME373 ','MECANIQUE ET ENVIRONNEME', '25310 ')
INSERT INTO dbo.Customers (Number, Name, PostCode) VALUES ('ME260 ','MEPHA AG', 'CH4144')
INSERT INTO dbo.Customers (Number, Name, PostCode) VALUES ('ME223 ','MEPHISTO', '57400 ')
INSERT INTO dbo.Customers (Number, Name, PostCode) VALUES ('ME345 ','METIMO GMBH', 'D64625')
INSERT INTO dbo.Customers (Number, Name, PostCode) VALUES ('MG200 ','MGI COUTIER', '80190 ')
INSERT INTO dbo.Customers (Number, Name, PostCode) VALUES ('MG200 ','MGI COUTIER PLASTIQUE', '01410 ')
INSERT INTO dbo.Customers (Number, Name, PostCode) VALUES ('MG200 ','MGI COUTIER VILLIEU', '01800 ')
INSERT INTO dbo.Customers (Number, Name, PostCode) VALUES ('MU207 ','MGLAS AG', 'D97702')
INSERT INTO dbo.Customers (Number, Name, PostCode) VALUES ('ML200 ','MLC LOGISTICS CONSULTANT', 'D21629')
INSERT INTO dbo.Customers (Number, Name, PostCode) VALUES ('ML001 ','MLP - MANUFACTURE DE PRE', '38291 ')
INSERT INTO dbo.Customers (Number, Name, PostCode) VALUES ('CR209 ','MME VASSELON MONIQUE', '21400 ')
INSERT INTO dbo.Customers (Number, Name, PostCode) VALUES ('MO213 ','MOEBEL-TRANSPORT AG', 'CH8952')
INSERT INTO dbo.Customers (Number, Name, PostCode) VALUES ('ES056 ','MONDI PACKAGING', 'D92675')
INSERT INTO dbo.Customers (Number, Name, PostCode) VALUES ('LE229 ','MOULAGES PLASTIQUES DE L', '74500 ')
INSERT INTO dbo.Customers (Number, Name, PostCode) VALUES ('MV200 ','MVI MOTORENTEILE GMBH', 'D71732')
INSERT INTO dbo.Customers (Number, Name, PostCode) VALUES ('NA001 ','NATIONAL ADHESIVES', '69400 ')
INSERT INTO dbo.Customers (Number, Name, PostCode) VALUES ('NE060 ','NESTLE DEUTSCHLAND AG', 'D55018')
INSERT INTO dbo.Customers (Number, Name, PostCode) VALUES ('NE024 ','NESTLE SUISSE S.A.', 'CH1350')
INSERT INTO dbo.Customers (Number, Name, PostCode) VALUES ('SO1115','NESTLE WATERS SUPPLY EST', '88800 ')
INSERT INTO dbo.Customers (Number, Name, PostCode) VALUES ('NE2071','NEUHAUSER', '57730 ')
INSERT INTO dbo.Customers (Number, Name, PostCode) VALUES ('BR064 ','NEXANS SCHWEIZ AG', 'CH4226')
INSERT INTO dbo.Customers (Number, Name, PostCode) VALUES ('NO314 ','NORD REDUCTEURS', '68800 ')
INSERT INTO dbo.Customers (Number, Name, PostCode) VALUES ('NO239 ','NOVA INNOVENE INTERNATIO', '13131 ')
INSERT INTO dbo.Customers (Number, Name, PostCode) VALUES ('      ','NOVARTIS', '      ')
INSERT INTO dbo.Customers (Number, Name, PostCode) VALUES ('NO095 ','NOVARTIS CONSUMER HEALTH', 'CH1260')
INSERT INTO dbo.Customers (Number, Name, PostCode) VALUES ('NO256 ','NOVES S.R.O.', 'CZ435 ')
INSERT INTO dbo.Customers (Number, Name, PostCode) VALUES ('VI215 ','OPTIBELT', '68520 ')
INSERT INTO dbo.Customers (Number, Name, PostCode) VALUES ('OR030 ','ORIS-FRANCE S.A.R.L', '68360 ')
INSERT INTO dbo.Customers (Number, Name, PostCode) VALUES ('RA002 ','OTTO RAUHUT GMBH & CO', 'D10997')
INSERT INTO dbo.Customers (Number, Name, PostCode) VALUES ('PR2713','P&G INTERNATIONAL OPERAT', 'D53881')
INSERT INTO dbo.Customers (Number, Name, PostCode) VALUES ('PO217 ','P.B.I.-PORTERET BEAULIEU', '21310 ')
INSERT INTO dbo.Customers (Number, Name, PostCode) VALUES ('PA2072','PACKMANN GMBH', 'D69214')
INSERT INTO dbo.Customers (Number, Name, PostCode) VALUES ('VO061 ','PAPETERIES DES VOSGES', '88600 ')
INSERT INTO dbo.Customers (Number, Name, PostCode) VALUES ('PA262 ','PATHEON', '38317 ')
INSERT INTO dbo.Customers (Number, Name, PostCode) VALUES ('IN104 ','P-D INTERGLAS TECHNOLOGI', '68550 ')
INSERT INTO dbo.Customers (Number, Name, PostCode) VALUES ('PE218 ','PELLAT', '69100 ')
INSERT INTO dbo.Customers (Number, Name, PostCode) VALUES ('PE201 ','PERSOON VLEESWARENFABRIE', 'NL2161')
INSERT INTO dbo.Customers (Number, Name, PostCode) VALUES ('PU001 ','PETER O. PURSCH', 'D94577')
INSERT INTO dbo.Customers (Number, Name, PostCode) VALUES ('PE0024','PEUGEOT CITROEN AUTOMOBI', '78091 ')
INSERT INTO dbo.Customers (Number, Name, PostCode) VALUES ('PO208 ','POLIMASZ SPOLKA JAWNA', 'PL6455')
INSERT INTO dbo.Customers (Number, Name, PostCode) VALUES ('PO204 ','POLYVAL CARTONNAGES', 'CH1450')
INSERT INTO dbo.Customers (Number, Name, PostCode) VALUES ('GR218 ','POMPES GRUNDFOS FRANCE', '57740 ')
INSERT INTO dbo.Customers (Number, Name, PostCode) VALUES ('PO220 ','PORCHER INDUSTRIES', '38300 ')
INSERT INTO dbo.Customers (Number, Name, PostCode) VALUES ('PR254 ','PRESTAPLAST INDUSTRIE', '13655 ')
INSERT INTO dbo.Customers (Number, Name, PostCode) VALUES ('PR001 ','PRODENE KLINT ESPACE LEA', '74540 ')
INSERT INTO dbo.Customers (Number, Name, PostCode) VALUES ('PR0722','PRODINGER OHG*STEINEN*', 'D79585')
INSERT INTO dbo.Customers (Number, Name, PostCode) VALUES ('PR0723','PRODINGER VERPACKUNG', 'D79106')
INSERT INTO dbo.Customers (Number, Name, PostCode) VALUES ('PR110 ','PRODINGER VERPACKUNG AG', 'CH4313')
INSERT INTO dbo.Customers (Number, Name, PostCode) VALUES ('PR320 ','PROVIMI KLIBA AG', 'CH4303')
INSERT INTO dbo.Customers (Number, Name, PostCode) VALUES ('BO207 ','R. BOURGEOIS S.R', 'CH2950')
INSERT INTO dbo.Customers (Number, Name, PostCode) VALUES ('SC305 ','R. SCHWINDT VERPACKUNGEN', 'D66333')
INSERT INTO dbo.Customers (Number, Name, PostCode) VALUES ('RE227 ','R.V.I.PIECES DE RECHANGE', '14550 ')
INSERT INTO dbo.Customers (Number, Name, PostCode) VALUES ('RA243 ','RAOUT BOIS USINES', '89110 ')
INSERT INTO dbo.Customers (Number, Name, PostCode) VALUES ('CO013 ','RAPAK', '34310 ')
INSERT INTO dbo.Customers (Number, Name, PostCode) VALUES ('RE074 ','REAL - PACK GMBH', 'D71299')
INSERT INTO dbo.Customers (Number, Name, PostCode) VALUES ('RE212 ','REGENT BELEUCHTUNGSKOERP', 'CH4018')
INSERT INTO dbo.Customers (Number, Name, PostCode) VALUES ('RE205 ','REHAU AG & CO', 'D94234')
INSERT INTO dbo.Customers (Number, Name, PostCode) VALUES ('RE283 ','REHAU INDUSTRIE SARL', '57340 ')
INSERT INTO dbo.Customers (Number, Name, PostCode) VALUES ('RE273 ','REICHOLD FEINKOST GMBH', 'D65582')
INSERT INTO dbo.Customers (Number, Name, PostCode) VALUES ('RE256 ','RENOLIT AG', 'D38229')
INSERT INTO dbo.Customers (Number, Name, PostCode) VALUES ('RI225 ','RICARD', '34550 ')
INSERT INTO dbo.Customers (Number, Name, PostCode) VALUES ('RI001 ','RICOH INDUSTRIE FRANCE', '68600 ')
INSERT INTO dbo.Customers (Number, Name, PostCode) VALUES ('      ','RICOLA', '      ')
INSERT INTO dbo.Customers (Number, Name, PostCode) VALUES ('RI025 ','RICOLA AG/LTD', 'CH4242')
INSERT INTO dbo.Customers (Number, Name, PostCode) VALUES ('RI028 ','RICOLA EUROPE SA', '68350 ')
INSERT INTO dbo.Customers (Number, Name, PostCode) VALUES ('RI060 ','RIVELLA AG', 'CH4852')
INSERT INTO dbo.Customers (Number, Name, PostCode) VALUES ('RO227 ','ROBOT COUPE', '71305 ')
INSERT INTO dbo.Customers (Number, Name, PostCode) VALUES ('RO218 ','ROCKWOOL FRANCE SAS', '63700 ')
INSERT INTO dbo.Customers (Number, Name, PostCode) VALUES ('MO288 ','ROGER MONDELIN SA', '42820 ')
INSERT INTO dbo.Customers (Number, Name, PostCode) VALUES ('SC2192','ROLF SCHWIERING GMBH', 'D24145')
INSERT INTO dbo.Customers (Number, Name, PostCode) VALUES ('RO114 ','ROTO OFFSET IMPRIMERIE', '68170 ')
INSERT INTO dbo.Customers (Number, Name, PostCode) VALUES ('RO221 ','ROULEAUX PACK', '42130 ')
INSERT INTO dbo.Customers (Number, Name, PostCode) VALUES ('RO305 ','ROYAL CHAUFFAGE', '26600 ')
INSERT INTO dbo.Customers (Number, Name, PostCode) VALUES ('RS002 ','RS COMPONENTS GMBH', 'D36251')
INSERT INTO dbo.Customers (Number, Name, PostCode) VALUES ('PE211 ','S.A. PEUGEOT MOTOCYCLES', '25350 ')
INSERT INTO dbo.Customers (Number, Name, PostCode) VALUES ('V3001 ','S.A. V 33', '39210 ')
INSERT INTO dbo.Customers (Number, Name, PostCode) VALUES ('      ','S.A.BOULANGERIE', '      ')
INSERT INTO dbo.Customers (Number, Name, PostCode) VALUES ('SM204 ','S.M.A.E.    (EDI)', '57302 ')
INSERT INTO dbo.Customers (Number, Name, PostCode) VALUES ('SM204 ','S.M.A.E. ZI METZ BORNY (', '57071 ')
INSERT INTO dbo.Customers (Number, Name, PostCode) VALUES ('SM226 ','S.M.S. - ALU SYSTEME', '68190 ')
INSERT INTO dbo.Customers (Number, Name, PostCode) VALUES ('SN200 ','S.N.R. ROULEMENTS', '01150 ')
INSERT INTO dbo.Customers (Number, Name, PostCode) VALUES ('CE039 ','SA CEDI PACKAGING', '44540 ')
INSERT INTO dbo.Customers (Number, Name, PostCode) VALUES ('NE2073','SA. BOULANGERIE NEUHAUSE', '57670 ')
INSERT INTO dbo.Customers (Number, Name, PostCode) VALUES ('CH210 ','SAE SERGE CHEVEAU', '89800 ')
INSERT INTO dbo.Customers (Number, Name, PostCode) VALUES ('CA223 ','SAEM DE RIBEAUVILLE', '68150 ')
INSERT INTO dbo.Customers (Number, Name, PostCode) VALUES ('SA233 ','SAEP DIFFUSION', '68000 ')
INSERT INTO dbo.Customers (Number, Name, PostCode) VALUES ('IS203 ','SAINT GOBAIN ISOVER', '71102 ')
INSERT INTO dbo.Customers (Number, Name, PostCode) VALUES ('SA361 ','SAM-STE D''ARCHIVAGE MODE', '25000 ')
INSERT INTO dbo.Customers (Number, Name, PostCode) VALUES ('SA206 ','SARKOS S.A.', 'CH1290')
INSERT INTO dbo.Customers (Number, Name, PostCode) VALUES ('CF022 ','SARL C.F.P. ENVIRONNEMEN', '54730 ')
INSERT INTO dbo.Customers (Number, Name, PostCode) VALUES ('MB202 ','SAS MB AUTOMOTIVE FVM', '54920 ')
INSERT INTO dbo.Customers (Number, Name, PostCode) VALUES ('IN221 ','SCHAEFFLER FRANCE', '67340 ')
INSERT INTO dbo.Customers (Number, Name, PostCode) VALUES ('SC220 ','SCHLIERBACHER KARTONAGEN', 'D73278')
INSERT INTO dbo.Customers (Number, Name, PostCode) VALUES ('SC366 ','SCHNEIDER ELECTRIC FRANC', '38120 ')
INSERT INTO dbo.Customers (Number, Name, PostCode) VALUES ('SC349 ','SCHNEIDER GMBH', 'D63069')
INSERT INTO dbo.Customers (Number, Name, PostCode) VALUES ('SC207 ','SCHUETZ GMBH & CO.KG  AA', 'D56242')
INSERT INTO dbo.Customers (Number, Name, PostCode) VALUES ('SC216 ','SCHWARZWAELDER TEXTILWER', 'D77773')
INSERT INTO dbo.Customers (Number, Name, PostCode) VALUES ('SC241 ','SCHWEITZER S.A.', '54710 ')
INSERT INTO dbo.Customers (Number, Name, PostCode) VALUES ('SE323 ','SELECTARC INDUSTRIES', '90600 ')
INSERT INTO dbo.Customers (Number, Name, PostCode) VALUES ('SEP001','SEP KUNHEIM', '68320 ')
INSERT INTO dbo.Customers (Number, Name, PostCode) VALUES ('SE332 ','SESAM SNC', '55500 ')
INSERT INTO dbo.Customers (Number, Name, PostCode) VALUES ('SH203 ','SHARP MANUFACTURING FRAN', '68360 ')
INSERT INTO dbo.Customers (Number, Name, PostCode) VALUES ('SI206 ','SIBO-VERPACKUNGEN', 'D57482')
INSERT INTO dbo.Customers (Number, Name, PostCode) VALUES ('SM229 ','SMURFIT PROVENCE,ALPES,', '06391 ')
INSERT INTO dbo.Customers (Number, Name, PostCode) VALUES ('SN208 ','SNF SAS', '42163 ')
INSERT INTO dbo.Customers (Number, Name, PostCode) VALUES ('SO024 ','SODETAL SARL', '55310 ')
INSERT INTO dbo.Customers (Number, Name, PostCode) VALUES ('SO2934','SOFLOG-SOFEMBAL', '07380 ')
INSERT INTO dbo.Customers (Number, Name, PostCode) VALUES ('SO2321','SOMFY', '74314 ')
INSERT INTO dbo.Customers (Number, Name, PostCode) VALUES ('SO0601','SONY FRANCE    US.D''ALSA', '68750 ')
INSERT INTO dbo.Customers (Number, Name, PostCode) VALUES ('VE219 ','ST GOBAIN VETROTEX FRANC', '73000 ')
INSERT INTO dbo.Customers (Number, Name, PostCode) VALUES ('ST008 ','STANLEY FRANCE DIVISION', '25000 ')
INSERT INTO dbo.Customers (Number, Name, PostCode) VALUES ('AL223 ','STE ALSA-CORK', '68230 ')
INSERT INTO dbo.Customers (Number, Name, PostCode) VALUES ('CO285 ','STE CONFILAND', 'CH2764')
INSERT INTO dbo.Customers (Number, Name, PostCode) VALUES ('FA214 ','STE INDUST.DE LEVURE FAL', '67100 ')
INSERT INTO dbo.Customers (Number, Name, PostCode) VALUES ('SM204 ','STE MECANIQUE AUTOMOB.DE', '57071 ')
INSERT INTO dbo.Customers (Number, Name, PostCode) VALUES ('MO282 ','STE MOBOIS', '01100 ')
INSERT INTO dbo.Customers (Number, Name, PostCode) VALUES ('SA221 ','STE SANTOS S.A.', '69120 ')
INSERT INTO dbo.Customers (Number, Name, PostCode) VALUES ('SI218 ','STE SIMU', '70103 ')
INSERT INTO dbo.Customers (Number, Name, PostCode) VALUES ('SY030 ','STE SYRAL', '67390 ')
INSERT INTO dbo.Customers (Number, Name, PostCode) VALUES ('WR001 ','STE WRIGLEY FRANCE S.N.C', '68600 ')
INSERT INTO dbo.Customers (Number, Name, PostCode) VALUES ('ST007 ','STERLING (STE ELECTRIQUE', '68330 ')
INSERT INTO dbo.Customers (Number, Name, PostCode) VALUES ('GR202 ','STI GREBENHAIN', 'D36355')
INSERT INTO dbo.Customers (Number, Name, PostCode) VALUES ('#SOC  ','STOCK USINE', '68320 ')
INSERT INTO dbo.Customers (Number, Name, PostCode) VALUES ('ST207 ','STOEBER ANTRIEBSTECHNIK', 'D76275')
INSERT INTO dbo.Customers (Number, Name, PostCode) VALUES ('SY035 ','SYMA-SYSTEM AG', 'CH9533')
INSERT INTO dbo.Customers (Number, Name, PostCode) VALUES ('TR200 ','T R W FAHRWERKSYS.GMBH &', 'D45881')
INSERT INTO dbo.Customers (Number, Name, PostCode) VALUES ('UN203 ','TECUMSEH EUROPE S.A.', '69007 ')
INSERT INTO dbo.Customers (Number, Name, PostCode) VALUES ('TH218 ','THECLA INDUSTRIES', '90101 ')
INSERT INTO dbo.Customers (Number, Name, PostCode) VALUES ('KO016 ','THERMOBILE INDUSTRIE BV', 'NL4825')
INSERT INTO dbo.Customers (Number, Name, PostCode) VALUES ('TH263 ','THIMM SERVICE', 'D71711')
INSERT INTO dbo.Customers (Number, Name, PostCode) VALUES ('TH242 ','THK MANUFACTURING OF EUR', '68190 ')
INSERT INTO dbo.Customers (Number, Name, PostCode) VALUES ('TH207 ','THOMPAC GMBH', 'D76437')
INSERT INTO dbo.Customers (Number, Name, PostCode) VALUES ('TH247 ','THOMSON SALES EUROPE', '88420 ')
INSERT INTO dbo.Customers (Number, Name, PostCode) VALUES ('SO221 ','THYSSENKRUPP PRESTA FRAN', '57970 ')
INSERT INTO dbo.Customers (Number, Name, PostCode) VALUES ('TI003 ','TILLMANN VERPACKUNGEN GM', 'D63165')
INSERT INTO dbo.Customers (Number, Name, PostCode) VALUES ('TI046 ','TILLOTTS PHARMA AG', 'D31028')
INSERT INTO dbo.Customers (Number, Name, PostCode) VALUES ('TI205 ','TIMKEN EUROPE', '68000 ')
INSERT INTO dbo.Customers (Number, Name, PostCode) VALUES ('TI203 ','TITANITE SA', '21270 ')
INSERT INTO dbo.Customers (Number, Name, PostCode) VALUES ('TO237 ','TOLIX 90 SL', 'E08630')
INSERT INTO dbo.Customers (Number, Name, PostCode) VALUES ('TO206 ','TOUT''EMBALL-ZI. DE CROUP', '30340 ')
INSERT INTO dbo.Customers (Number, Name, PostCode) VALUES ('TR202 ','TRANSPACK-KRUMBACH GMBH', 'D86381')
INSERT INTO dbo.Customers (Number, Name, PostCode) VALUES ('TR004 ','TRISS SPOL.S.R.O.', 'CZ1060')
INSERT INTO dbo.Customers (Number, Name, PostCode) VALUES ('TT002 ','TTE POLSKA SP Z.O.O', 'PL9630')
INSERT INTO dbo.Customers (Number, Name, PostCode) VALUES ('TU200 ','TUCHENHAGEN GMBH', 'D21514')
INSERT INTO dbo.Customers (Number, Name, PostCode) VALUES ('ZI008 ','UDO ZIER GMBH', 'D78120')
INSERT INTO dbo.Customers (Number, Name, PostCode) VALUES ('UM203 ','UMFORM & FÜGETECHNIK EIS', 'D99817')
INSERT INTO dbo.Customers (Number, Name, PostCode) VALUES ('UT202 ','UTP SCHWEISSMATERIAL GMB', 'D79189')
INSERT INTO dbo.Customers (Number, Name, PostCode) VALUES ('VA212 ','VALFLEURI-PATES ALIMENT.', '68270 ')
INSERT INTO dbo.Customers (Number, Name, PostCode) VALUES ('VE203 ','VERPACKUNGS MACHER GMBH', 'D56112')
INSERT INTO dbo.Customers (Number, Name, PostCode) VALUES ('VI020 ','VIESSMANN', '57670 ')
INSERT INTO dbo.Customers (Number, Name, PostCode) VALUES ('RE220 ','VISTEON SYSTEMES INTERIE', '90200 ')
INSERT INTO dbo.Customers (Number, Name, PostCode) VALUES ('VO023 ','VOLANPACK  RT', 'H1108 ')
INSERT INTO dbo.Customers (Number, Name, PostCode) VALUES ('VO219 ','VON ROLL FRANCE SA', '90300 ')
INSERT INTO dbo.Customers (Number, Name, PostCode) VALUES ('UD001 ','VON ROLL ISOLA FRANCE', '90101 ')
INSERT INTO dbo.Customers (Number, Name, PostCode) VALUES ('IS202 ','VON ROLL SUISSE SA', 'CH4226')
INSERT INTO dbo.Customers (Number, Name, PostCode) VALUES ('WO012 ','W O L F  GMBH', 'D84048')
INSERT INTO dbo.Customers (Number, Name, PostCode) VALUES ('WI203 ','W. WIRTH GMBH', 'D79346')
INSERT INTO dbo.Customers (Number, Name, PostCode) VALUES ('WA223 ','WABCO POLSKA SP.Z.O.O.', 'D30453')
INSERT INTO dbo.Customers (Number, Name, PostCode) VALUES ('PE262 ','WALTER PERSKE GMBH', 'D68167')
INSERT INTO dbo.Customers (Number, Name, PostCode) VALUES ('WA229 ','WALZ VERPACKUNGEN E.K.', 'D88515')
INSERT INTO dbo.Customers (Number, Name, PostCode) VALUES ('WE006 ','WELL-PACK AG', 'CH8840')
INSERT INTO dbo.Customers (Number, Name, PostCode) VALUES ('BO066 ','WESTIFORM GMBH & CO.KG', 'D77799')
INSERT INTO dbo.Customers (Number, Name, PostCode) VALUES ('WI035 ','WINTER & CO', 'D79576')
INSERT INTO dbo.Customers (Number, Name, PostCode) VALUES ('IN211 ','WIRTH VERPACKUNGEN GMBH', 'A2700 ')
INSERT INTO dbo.Customers (Number, Name, PostCode) VALUES ('WO001 ','WOLFBERGER', '68000 ')
INSERT INTO dbo.Customers (Number, Name, PostCode) VALUES ('WO008 ','WORK IN PROGRESS GMBH', 'D79576')
INSERT INTO dbo.Customers (Number, Name, PostCode) VALUES ('ZE001 ','ZEHNDER GMBH', 'D77933')
INSERT INTO dbo.Customers (Number, Name, PostCode) VALUES ('ZF201 ','ZF GETRIEBE GMBH', 'D66117')
GO

DECLARE @OrderID bigint
EXEC dbo.AddOrder '00010865  ','0001',' ',36556.5, 'INA ROULEMENTS S.A.', @OrderID OUTPUT
EXEC dbo.AddOrder '00012032  ','0001',' ',36547.5, 'MARK IV SYSTEMES MOTEURS', @OrderID OUTPUT
EXEC dbo.AddOrder '00012319  ','0001',' ',36549.5, 'THECLA INDUSTRIES', @OrderID OUTPUT
EXEC dbo.AddOrder '00012506  ','0001',' ',36544.5, 'MAISON GUSTAVE LORENTZ S', @OrderID OUTPUT
EXEC dbo.AddOrder '01043516  ','0001',' ',40677.5, 'MAJORETTE', @OrderID OUTPUT
EXEC dbo.AddOrder '05031764  ','0001',' ',38728.5, 'GEORGIA PACIFIC', @OrderID OUTPUT
EXEC dbo.AddOrder '05043460  ','0001',' ',38783.5, 'DU PONT DE NEMOURS S.A.', @OrderID OUTPUT
EXEC dbo.AddOrder '05043461  ','0001',' ',38797.5, 'DU PONT DE NEMOURS S.A.', @OrderID OUTPUT
EXEC dbo.AddOrder '05061063  ','0001',' ',38797.5, 'DU PONT DE NEMOURS S.A.', @OrderID OUTPUT
EXEC dbo.AddOrder '05062496  ','0001',' ',38763.5, 'DS SMITH KAYPAC', @OrderID OUTPUT
EXEC dbo.AddOrder '05062864  ','0001',' ',38776.5, 'CSP', @OrderID OUTPUT
EXEC dbo.AddOrder '05062866  ','0001',' ',38769.5, 'CSP', @OrderID OUTPUT
EXEC dbo.AddOrder '05062868  ','0001',' ',38770.5, 'CSP', @OrderID OUTPUT
EXEC dbo.AddOrder '05063081  ','0001',' ',38720.5, 'CSP', @OrderID OUTPUT
EXEC dbo.AddOrder '05063086  ','0001',' ',38676.5, 'CSP', @OrderID OUTPUT
EXEC dbo.AddOrder '05063086  ','0001','a',38690.5, 'CSP', @OrderID OUTPUT
EXEC dbo.AddOrder '05063344  ','0001',' ',38683.5, 'CSP', @OrderID OUTPUT
EXEC dbo.AddOrder '05090640  ','0001',' ',38798.5, 'CARTONNAGES PFAHRER', @OrderID OUTPUT
EXEC dbo.AddOrder '05093809  ','0001',' ',38635.5, 'TRISS SPOL.S.R.O.', @OrderID OUTPUT
EXEC dbo.AddOrder '05093889  ','0001',' ',38756.5, 'ELNA INTERNATIONAL CORP.', @OrderID OUTPUT
EXEC dbo.AddOrder '05100108  ','0001',' ',38731.5, 'S.A.BOULANGERIE', @OrderID OUTPUT
EXEC dbo.AddOrder '05100116  ','0001',' ',38731.5, 'S.A.BOULANGERIE', @OrderID OUTPUT
EXEC dbo.AddOrder '05100727  ','0001',' ',38811.5, 'KNIPP GMBH', @OrderID OUTPUT
EXEC dbo.AddOrder '05100954  ','0001',' ',38753.5, 'BECTON DICKINSON', @OrderID OUTPUT
EXEC dbo.AddOrder '05100954  ','0001','a',38753.5, 'BECTON DICKINSON', @OrderID OUTPUT
EXEC dbo.AddOrder '05102699  ','0001',' ',38789.5, 'DS SMITH KAYPAC', @OrderID OUTPUT
EXEC dbo.AddOrder '05102954  ','0001',' ',38761.5, 'RICOLA', @OrderID OUTPUT
EXEC dbo.AddOrder '05103204  ','0001',' ',38782.5, 'CRISTALLERIES DE BACCARA', @OrderID OUTPUT
EXEC dbo.AddOrder '05103238  ','0002',' ',42329.5, 'NESTLE SUISSE S.A.', @OrderID OUTPUT
EXEC dbo.AddOrder '05103594  ','0001',' ',38719.5, 'BV ALVERIMPORT', @OrderID OUTPUT
EXEC dbo.AddOrder '05103940  ','0001',' ',38816.5, 'FINE ORGANICS', @OrderID OUTPUT
EXEC dbo.AddOrder '05103942  ','0001',' ',38941.5, 'FINE ORGANICS', @OrderID OUTPUT
EXEC dbo.AddOrder '05103946  ','0001',' ',38830.5, 'FINE ORGANICS', @OrderID OUTPUT
EXEC dbo.AddOrder '05103950  ','0001',' ',38900.5, 'FINE ORGANICS', @OrderID OUTPUT
EXEC dbo.AddOrder '05110140  ','0001',' ',38664.5, 'NESTLE WATERS SUPPLY EST', @OrderID OUTPUT
EXEC dbo.AddOrder '05110146  ','0001',' ',38741.5, 'FRIEDRICH BOYSEN GMBH &', @OrderID OUTPUT
EXEC dbo.AddOrder '05110146  ','0001','a',38741.5, 'FRIEDRICH BOYSEN GMBH &', @OrderID OUTPUT
EXEC dbo.AddOrder '05110265  ','0001',' ',38670.5, 'KOYO STEERING LYON', @OrderID OUTPUT
EXEC dbo.AddOrder '05110272  ','0001',' ',38675.5, 'DS SMITH KAYSERSBERG', @OrderID OUTPUT
EXEC dbo.AddOrder '05110273  ','0001',' ',38675.5, 'DS SMITH KAYSERSBERG', @OrderID OUTPUT
EXEC dbo.AddOrder '05111631  ','0001',' ',38684.5, 'TRISS SPOL.S.R.O.', @OrderID OUTPUT
EXEC dbo.AddOrder '05112074  ','0001',' ',38383.5, 'DAIMLER CHRYSLER AG (AG)', @OrderID OUTPUT
EXEC dbo.AddOrder '05112470  ','0001',' ',38703.5, 'RICOH INDUSTRIE FRANCE', @OrderID OUTPUT
EXEC dbo.AddOrder '05112639  ','0001',' ',38747.5, 'PRODENE KLINT ESPACE LEA', @OrderID OUTPUT
EXEC dbo.AddOrder '05112640  ','0001',' ',38747.5, 'PRODENE KLINT ESPACE LEA', @OrderID OUTPUT
EXEC dbo.AddOrder '05112642  ','0001',' ',38746.5, 'PRODENE KLINT ESPACE LEA', @OrderID OUTPUT
EXEC dbo.AddOrder '05112716  ','0001',' ',38763.5, 'NOVARTIS', @OrderID OUTPUT
EXEC dbo.AddOrder '05112776  ','0001',' ',38748.5, 'HEXCEL COMPOSITES', @OrderID OUTPUT
EXEC dbo.AddOrder '05112777  ','0001',' ',38762.5, 'HEXCEL COMPOSITES', @OrderID OUTPUT
EXEC dbo.AddOrder '05113030  ','0001',' ',38700.5, 'NEUHAUSER', @OrderID OUTPUT
EXEC dbo.AddOrder '05113094  ','0001',' ',38777.5, 'LEGRAND', @OrderID OUTPUT
EXEC dbo.AddOrder '05113249  ','0001',' ',38748.5, 'GEPMAN S.A.S', @OrderID OUTPUT
EXEC dbo.AddOrder '05113251  ','0001',' ',38747.5, 'GEPMAN S.A.S', @OrderID OUTPUT
EXEC dbo.AddOrder '05113631  ','0001',' ',38718.5, 'LONZA', @OrderID OUTPUT
EXEC dbo.AddOrder '05113631  ','0001','a',38718.5, 'LONZA', @OrderID OUTPUT
EXEC dbo.AddOrder '05114068  ','0001',' ',38706.5, 'SA. BOULANGERIE NEUHAUSE', @OrderID OUTPUT
EXEC dbo.AddOrder '05114068  ','0001','a',38706.5, 'SA. BOULANGERIE NEUHAUSE', @OrderID OUTPUT
EXEC dbo.AddOrder '05114068  ','0001','b',38706.5, 'SA. BOULANGERIE NEUHAUSE', @OrderID OUTPUT
EXEC dbo.AddOrder '05114068  ','0001','c',38725.5, 'SA. BOULANGERIE NEUHAUSE', @OrderID OUTPUT
EXEC dbo.AddOrder '05114068  ','0001','d',38725.5, 'SA. BOULANGERIE NEUHAUSE', @OrderID OUTPUT
EXEC dbo.AddOrder '05114073  ','0001',' ',38705.5, 'SA. BOULANGERIE NEUHAUSE', @OrderID OUTPUT
EXEC dbo.AddOrder '05114073  ','0001','a',38705.5, 'SA. BOULANGERIE NEUHAUSE', @OrderID OUTPUT
EXEC dbo.AddOrder '05114149  ','0001',' ',38698.5, 'EXEL NV', @OrderID OUTPUT
EXEC dbo.AddOrder '05114149  ','0001','a',38698.5, 'EXEL NV', @OrderID OUTPUT
EXEC dbo.AddOrder '05114185  ','0001',' ',38741.5, 'DU PONT DE NEMOURS (FRAN', @OrderID OUTPUT
EXEC dbo.AddOrder '05114295  ','0001',' ',38693.5, 'TRISS SPOL.S.R.O.', @OrderID OUTPUT
EXEC dbo.AddOrder '05114420  ','0001',' ',38747.5, 'DELIPAPIER', @OrderID OUTPUT
EXEC dbo.AddOrder '05120071  ','0001',' ',38773.5, 'DU PONT DE NEMOURS S.A.', @OrderID OUTPUT
EXEC dbo.AddOrder '05120074  ','0001',' ',38770.5, 'DU PONT DE NEMOURS S.A.', @OrderID OUTPUT
EXEC dbo.AddOrder '05120226  ','0001',' ',38727.5, 'PATHEON', @OrderID OUTPUT
EXEC dbo.AddOrder '05120453  ','0001',' ',38746.5, 'LINDAL-FRANCE', @OrderID OUTPUT
EXEC dbo.AddOrder '05120602  ','0001',' ',38725.5, 'RICOH INDUSTRIE FRANCE', @OrderID OUTPUT
EXEC dbo.AddOrder '05120649  ','0001',' ',38696.5, 'B.V.ALVERIMPORT', @OrderID OUTPUT
EXEC dbo.AddOrder '05120667  ','0001',' ',38704.5, 'SA. BOULANGERIE NEUHAUSE', @OrderID OUTPUT
EXEC dbo.AddOrder '05120676  ','0001',' ',38698.5, 'PRODINGER VERPACKUNG AG', @OrderID OUTPUT
EXEC dbo.AddOrder '05120680  ','0001',' ',38747.5, 'NOVA INNOVENE INTERNATIO', @OrderID OUTPUT
EXEC dbo.AddOrder '05120681  ','0001',' ',38748.5, 'NOVA INNOVENE INTERNATIO', @OrderID OUTPUT
EXEC dbo.AddOrder '05120683  ','0001',' ',38726.5, 'NOVA INNOVENE INTERNATIO', @OrderID OUTPUT
EXEC dbo.AddOrder '05120970  ','0001',' ',38703.5, 'DOW AGROSCIENCES', @OrderID OUTPUT
EXEC dbo.AddOrder '05120971  ','0001',' ',38703.5, 'DOW AGROSCIENCES', @OrderID OUTPUT
EXEC dbo.AddOrder '05120972  ','0001',' ',38703.5, 'DOW AGROSCIENCES', @OrderID OUTPUT
EXEC dbo.AddOrder '05120976  ','0001',' ',38707.5, 'DOW AGROSCIENCES', @OrderID OUTPUT
EXEC dbo.AddOrder '05120983  ','0001',' ',38703.5, 'DOW AGROSCIENCES', @OrderID OUTPUT
EXEC dbo.AddOrder '05120989  ','0001',' ',38703.5, 'DOW AGROSCIENCES', @OrderID OUTPUT
EXEC dbo.AddOrder '05120993  ','0001',' ',38703.5, 'DOW AGROSCIENCES', @OrderID OUTPUT
EXEC dbo.AddOrder '05120995  ','0001',' ',38703.5, 'DOW AGROSCIENCES', @OrderID OUTPUT
EXEC dbo.AddOrder '05120998  ','0001',' ',38703.5, 'DOW AGROSCIENCES', @OrderID OUTPUT
EXEC dbo.AddOrder '05121184  ','0001',' ',38748.5, 'PERSOON VLEESWARENFABRIE', @OrderID OUTPUT
EXEC dbo.AddOrder '05121291  ','0001',' ',38747.5, 'NATIONAL ADHESIVES', @OrderID OUTPUT
EXEC dbo.AddOrder '05121292  ','0001',' ',38747.5, 'NATIONAL ADHESIVES', @OrderID OUTPUT
EXEC dbo.AddOrder '05121318  ','0001',' ',38748.5, 'VON ROLL ISOLA FRANCE', @OrderID OUTPUT
EXEC dbo.AddOrder '05121319  ','0001',' ',38748.5, 'VON ROLL ISOLA FRANCE', @OrderID OUTPUT
EXEC dbo.AddOrder '05121320  ','0001',' ',38748.5, 'VON ROLL ISOLA FRANCE', @OrderID OUTPUT
EXEC dbo.AddOrder '05121321  ','0001',' ',38748.5, 'VON ROLL ISOLA FRANCE', @OrderID OUTPUT
EXEC dbo.AddOrder '05121374  ','0001',' ',38762.5, 'MEPHA AG', @OrderID OUTPUT
EXEC dbo.AddOrder '05121745  ','0001',' ',38748.5, 'PEUGEOT CITROEN AUTOMOBI', @OrderID OUTPUT
EXEC dbo.AddOrder '05121759  ','0001',' ',38724.5, 'CARTONNAGES BERTRAND - N', @OrderID OUTPUT
EXEC dbo.AddOrder '05121781  ','0001',' ',38733.5, 'SA. BOULANGERIE NEUHAUSE', @OrderID OUTPUT
EXEC dbo.AddOrder '05121792  ','0001',' ',38740.5, 'RICOH INDUSTRIE FRANCE', @OrderID OUTPUT
EXEC dbo.AddOrder '05121828  ','0001',' ',38749.5, 'NESTLE WATERS SUPPLY EST', @OrderID OUTPUT
EXEC dbo.AddOrder '05121847  ','0001',' ',38707.5, 'DOW AGROSCIENCES', @OrderID OUTPUT
EXEC dbo.AddOrder '05121848  ','0001',' ',38707.5, 'DOW AGROSCIENCES', @OrderID OUTPUT
EXEC dbo.AddOrder '05121848  ','0001','a',38707.5, 'DOW AGROSCIENCES', @OrderID OUTPUT
EXEC dbo.AddOrder '05121857  ','0001',' ',38703.5, 'DOW AGROSCIENCES', @OrderID OUTPUT
EXEC dbo.AddOrder '05121858  ','0001',' ',38707.5, 'DOW AGROSCIENCES', @OrderID OUTPUT
EXEC dbo.AddOrder '05121862  ','0001',' ',38707.5, 'DOW AGROSCIENCES', @OrderID OUTPUT
EXEC dbo.AddOrder '05121863  ','0001',' ',38704.5, 'DOW AGROSCIENCES', @OrderID OUTPUT
EXEC dbo.AddOrder '05121865  ','0001',' ',38703.5, 'DOW AGROSCIENCES SWITERL', @OrderID OUTPUT
EXEC dbo.AddOrder '05121927  ','0001',' ',38739.5, 'DU PONT DE NEMOURS (FRAN', @OrderID OUTPUT
EXEC dbo.AddOrder '05121929  ','0001',' ',38748.5, 'DU PONT DE NEMOURS (FRAN', @OrderID OUTPUT
EXEC dbo.AddOrder '05121956  ','0001',' ',38703.5, 'NESTLE WATERS SUPPLY EST', @OrderID OUTPUT
EXEC dbo.AddOrder '05122026  ','0001',' ',38706.5, 'TIMKEN EUROPE', @OrderID OUTPUT
EXEC dbo.AddOrder '05122099  ','0001',' ',38749.5, 'LABORATOIRE WELEDA', @OrderID OUTPUT
EXEC dbo.AddOrder '05122163  ','0001',' ',38704.5, 'NOVARTIS CONSUMER HEALTH', @OrderID OUTPUT
EXEC dbo.AddOrder '05122163  ','0001','a',38763.5, 'NOVARTIS CONSUMER HEALTH', @OrderID OUTPUT
EXEC dbo.AddOrder '05122239  ','0001',' ',38762.5, 'S.N.R. ROULEMENTS', @OrderID OUTPUT
EXEC dbo.AddOrder '05122241  ','0001',' ',38741.5, 'S.N.R. ROULEMENTS', @OrderID OUTPUT
EXEC dbo.AddOrder '05122243  ','0001',' ',38762.5, 'S.N.R. ROULEMENTS', @OrderID OUTPUT
EXEC dbo.AddOrder '05122297  ','0001',' ',38728.5, 'P&G INTERNATIONAL OPERAT', @OrderID OUTPUT
EXEC dbo.AddOrder '05122297  ','0001','a',38728.5, 'P&G INTERNATIONAL OPERAT', @OrderID OUTPUT
EXEC dbo.AddOrder '05122330  ','0001',' ',38749.5, 'HEXCEL COMPOSITES', @OrderID OUTPUT
EXEC dbo.AddOrder '05122400  ','0001',' ',38704.5, 'KOYO STEERING LYON', @OrderID OUTPUT
EXEC dbo.AddOrder '05122415  ','0001',' ',38731.5, 'EBERSPAECHER GMBH & CO.K', @OrderID OUTPUT
EXEC dbo.AddOrder '05122416  ','0001',' ',38731.5, 'EBERSPAECHER GMBH & CO.K', @OrderID OUTPUT
EXEC dbo.AddOrder '05122418  ','0001',' ',38705.5, 'KOYO STEERING LYON', @OrderID OUTPUT
EXEC dbo.AddOrder '05122538  ','0001',' ',38718.5, 'DOW AGROSCIENCES SWITERL', @OrderID OUTPUT
EXEC dbo.AddOrder '05122545  ','0001',' ',38720.5, 'DOW AGROSCIENCES SWITERL', @OrderID OUTPUT
EXEC dbo.AddOrder '05122546  ','0001',' ',38718.5, 'DOW AGROSCIENCES SWITERL', @OrderID OUTPUT
EXEC dbo.AddOrder '05122546  ','0001','a',38718.5, 'DOW AGROSCIENCES SWITERL', @OrderID OUTPUT
EXEC dbo.AddOrder '05122553  ','0001',' ',38707.5, 'DOW AGROSCIENCES SWITERL', @OrderID OUTPUT
EXEC dbo.AddOrder '05122553  ','0001','a',38720.5, 'DOW AGROSCIENCES SWITERL', @OrderID OUTPUT
EXEC dbo.AddOrder '05122566  ','0001',' ',38707.5, 'DOWELANCO ITALIA S.R.L', @OrderID OUTPUT
EXEC dbo.AddOrder '05122569  ','0001',' ',38706.5, 'DOWELANCO ITALIA S.R.L', @OrderID OUTPUT
EXEC dbo.AddOrder '05122570  ','0001',' ',38707.5, 'DOWELANCO ITALIA S.R.L', @OrderID OUTPUT
EXEC dbo.AddOrder '05122674  ','0001',' ',38805.5, 'VIESSMANN', @OrderID OUTPUT
EXEC dbo.AddOrder '05122707  ','0001',' ',38721.5, 'CONTINENTAL BISCUITS S.A', @OrderID OUTPUT
EXEC dbo.AddOrder '05122707  ','0001','a',38724.5, 'CONTINENTAL BISCUITS S.A', @OrderID OUTPUT
EXEC dbo.AddOrder '05122719  ','0001',' ',38724.5, 'SOMFY', @OrderID OUTPUT
EXEC dbo.AddOrder '05122719  ','0001','a',38724.5, 'SOMFY', @OrderID OUTPUT
EXEC dbo.AddOrder '05122719  ','0001','b',38745.5, 'SOMFY', @OrderID OUTPUT
EXEC dbo.AddOrder '05122821  ','0001',' ',38759.5, 'VON ROLL SUISSE SA', @OrderID OUTPUT
EXEC dbo.AddOrder '05122827  ','0001',' ',38789.5, 'SA. BOULANGERIE NEUHAUSE', @OrderID OUTPUT
EXEC dbo.AddOrder '05122828  ','0001',' ',38749.5, 'STE SIMU', @OrderID OUTPUT
EXEC dbo.AddOrder '05122864  ','0001',' ',38738.5, 'CAVES J.B. ADAM', @OrderID OUTPUT
EXEC dbo.AddOrder '05122865  ','0001',' ',38738.5, 'CAVES J.B. ADAM', @OrderID OUTPUT
EXEC dbo.AddOrder '05122865  ','0001','a',38738.5, 'CAVES J.B. ADAM', @OrderID OUTPUT
EXEC dbo.AddOrder '05122865  ','0001','b',38745.5, 'CAVES J.B. ADAM', @OrderID OUTPUT
EXEC dbo.AddOrder '05122865  ','0001','c',38752.5, 'CAVES J.B. ADAM', @OrderID OUTPUT
EXEC dbo.AddOrder '05122866  ','0001',' ',38748.5, 'BUBENDORFF VOLET ROULANT', @OrderID OUTPUT
EXEC dbo.AddOrder '05122888  ','0001',' ',38720.5, 'ALPLAST', @OrderID OUTPUT
EXEC dbo.AddOrder '05122889  ','0001',' ',38754.5, 'CLARIANT PRODUKTE SCHWEI', @OrderID OUTPUT
EXEC dbo.AddOrder '05122910  ','0001',' ',38745.5, 'RICOH INDUSTRIE FRANCE', @OrderID OUTPUT
EXEC dbo.AddOrder '05122911  ','0001',' ',38745.5, 'RICOH INDUSTRIE FRANCE', @OrderID OUTPUT
EXEC dbo.AddOrder '05122912  ','0001',' ',38745.5, 'RICOH INDUSTRIE FRANCE', @OrderID OUTPUT
EXEC dbo.AddOrder '05122913  ','0001',' ',38745.5, 'RICOH INDUSTRIE FRANCE', @OrderID OUTPUT
EXEC dbo.AddOrder '05122914  ','0001',' ',38745.5, 'RICOH INDUSTRIE FRANCE', @OrderID OUTPUT
EXEC dbo.AddOrder '05122915  ','0001',' ',38745.5, 'RICOH INDUSTRIE FRANCE', @OrderID OUTPUT
EXEC dbo.AddOrder '05122930  ','0001',' ',38735.5, 'STERLING (STE ELECTRIQUE', @OrderID OUTPUT
EXEC dbo.AddOrder '05122930  ','0001','a',38735.5, 'STERLING (STE ELECTRIQUE', @OrderID OUTPUT
EXEC dbo.AddOrder '05122949  ','0001',' ',38766.5, 'RAPAK', @OrderID OUTPUT
EXEC dbo.AddOrder '05122951  ','0001',' ',38742.5, 'RAPAK', @OrderID OUTPUT
EXEC dbo.AddOrder '05122952  ','0001',' ',38742.5, 'RAPAK', @OrderID OUTPUT
EXEC dbo.AddOrder '05122952  ','0001','a',38756.5, 'RAPAK', @OrderID OUTPUT
EXEC dbo.AddOrder '05122952  ','0001','b',38742.5, 'RAPAK', @OrderID OUTPUT
EXEC dbo.AddOrder '05122976  ','0001',' ',38707.5, 'DOWELANCO ITALIA S.R.L', @OrderID OUTPUT
EXEC dbo.AddOrder '05123095  ','0001',' ',38782.5, 'BEHR-HELLA THERMOCONTROL', @OrderID OUTPUT
EXEC dbo.AddOrder '05123135  ','0001',' ',38717.5, 'DOW-AGROSCIENCES B.V', @OrderID OUTPUT
EXEC dbo.AddOrder '05123152  ','0001',' ',38756.5, 'NESTLE WATERS SUPPLY EST', @OrderID OUTPUT
EXEC dbo.AddOrder '05123152  ','0001','b',38756.5, 'NESTLE WATERS SUPPLY EST', @OrderID OUTPUT
EXEC dbo.AddOrder '05123187  ','0001',' ',38732.5, 'P&G INTERNATIONAL OPERAT', @OrderID OUTPUT
EXEC dbo.AddOrder '05123218  ','0001',' ',38707.5, 'DS SMITH SPECIALITY PACK', @OrderID OUTPUT
EXEC dbo.AddOrder '05123218  ','0001','a',38707.5, 'DS SMITH SPECIALITY PACK', @OrderID OUTPUT
EXEC dbo.AddOrder '05123220  ','0001',' ',38719.5, 'DS SMITH SPECIALITY PACK', @OrderID OUTPUT
EXEC dbo.AddOrder '05123248  ','0001',' ',38752.5, 'DU PONT DE NEMOURS (FRAN', @OrderID OUTPUT
EXEC dbo.AddOrder '05123254  ','0001',' ',38741.5, 'DU PONT DE NEMOURS (FRAN', @OrderID OUTPUT
EXEC dbo.AddOrder '05123256  ','0001',' ',38741.5, 'DU PONT DE NEMOURS (FRAN', @OrderID OUTPUT
EXEC dbo.AddOrder '05123264  ','0001',' ',38760.5, 'SIBO-VERPACKUNGEN', @OrderID OUTPUT
EXEC dbo.AddOrder '05123343  ','0001',' ',38762.5, 'CART.EMBAL. RHONE ALPES', @OrderID OUTPUT
EXEC dbo.AddOrder '05123346  ','0001',' ',38748.5, 'CART.EMBAL. RHONE ALPES', @OrderID OUTPUT
EXEC dbo.AddOrder '05123381  ','0001',' ',38717.5, 'DOW-AGROSCIENCES B.V', @OrderID OUTPUT
EXEC dbo.AddOrder '05123390  ','0001',' ',38740.5, 'S.A. PEUGEOT MOTOCYCLES', @OrderID OUTPUT
EXEC dbo.AddOrder '05123393  ','0001',' ',38742.5, 'S.A. PEUGEOT MOTOCYCLES', @OrderID OUTPUT
EXEC dbo.AddOrder '05123426  ','0001',' ',38738.5, 'PORCHER INDUSTRIES', @OrderID OUTPUT
EXEC dbo.AddOrder '05123427  ','0001',' ',38755.5, 'PORCHER INDUSTRIES', @OrderID OUTPUT
EXEC dbo.AddOrder '05123428  ','0001',' ',38738.5, 'PORCHER INDUSTRIES', @OrderID OUTPUT
EXEC dbo.AddOrder '05123457  ','0001',' ',38728.5, 'STE ALSA-CORK', @OrderID OUTPUT
EXEC dbo.AddOrder '05123457  ','0001','a',38728.5, 'STE ALSA-CORK', @OrderID OUTPUT
EXEC dbo.AddOrder '05123501  ','0001',' ',38752.5, 'PATHEON', @OrderID OUTPUT
EXEC dbo.AddOrder '05123502  ','0001',' ',38752.5, 'PATHEON', @OrderID OUTPUT
EXEC dbo.AddOrder '05123503  ','0001',' ',38752.5, 'PATHEON', @OrderID OUTPUT
EXEC dbo.AddOrder '05123503  ','0001','a',38752.5, 'PATHEON', @OrderID OUTPUT
EXEC dbo.AddOrder '05123536  ','0001',' ',38755.5, 'PRODENE KLINT ESPACE LEA', @OrderID OUTPUT
EXEC dbo.AddOrder '05123550  ','0001',' ',38753.5, 'DICESA SA', @OrderID OUTPUT
EXEC dbo.AddOrder '05123554  ','0001',' ',38749.5, 'DICESA SA', @OrderID OUTPUT
EXEC dbo.AddOrder '05123570  ','0001',' ',38790.5, 'DU PONT DE NEMOURS S.A.', @OrderID OUTPUT
EXEC dbo.AddOrder '05123572  ','0001',' ',38733.5, 'DU PONT DE NEMOURS S.A.', @OrderID OUTPUT
EXEC dbo.AddOrder '05123581  ','0001',' ',38732.5, 'R. BOURGEOIS S.R', @OrderID OUTPUT
EXEC dbo.AddOrder '05123596  ','0001',' ',38748.5, 'IMPORTHAUS WILMS / IMPUL', @OrderID OUTPUT
EXEC dbo.AddOrder '05123597  ','0001',' ',38783.5, 'IMPORTHAUS WILMS / IMPUL', @OrderID OUTPUT
EXEC dbo.AddOrder '05123599  ','0001',' ',38755.5, 'IMPORTHAUS WILMS / IMPUL', @OrderID OUTPUT
EXEC dbo.AddOrder '05123602  ','0001',' ',38752.5, 'IMPORTHAUS WILMS / IMPUL', @OrderID OUTPUT
EXEC dbo.AddOrder '05123602  ','0001','a',38753.5, 'IMPORTHAUS WILMS / IMPUL', @OrderID OUTPUT
EXEC dbo.AddOrder '05123602  ','0001','b',38760.5, 'IMPORTHAUS WILMS / IMPUL', @OrderID OUTPUT
EXEC dbo.AddOrder '05123604  ','0001',' ',38747.5, 'IMPORTHAUS WILMS / IMPUL', @OrderID OUTPUT
EXEC dbo.AddOrder '05123605  ','0001',' ',38773.5, 'IMPORTHAUS WILMS / IMPUL', @OrderID OUTPUT
EXEC dbo.AddOrder '05123607  ','0001',' ',38747.5, 'IMPORTHAUS WILMS / IMPUL', @OrderID OUTPUT
EXEC dbo.AddOrder '05123609  ','0001',' ',38742.5, 'IMPORTHAUS WILMS / IMPUL', @OrderID OUTPUT
EXEC dbo.AddOrder '05123609  ','0001','a',38745.5, 'IMPORTHAUS WILMS / IMPUL', @OrderID OUTPUT
EXEC dbo.AddOrder '05123610  ','0001',' ',38770.5, 'IMPORTHAUS WILMS / IMPUL', @OrderID OUTPUT
EXEC dbo.AddOrder '05123610  ','0001','a',38776.5, 'IMPORTHAUS WILMS / IMPUL', @OrderID OUTPUT
EXEC dbo.AddOrder '05123613  ','0001',' ',38747.5, 'IMPORTHAUS WILMS / IMPUL', @OrderID OUTPUT
EXEC dbo.AddOrder '05123615  ','0001',' ',38749.5, 'INA FRANCE', @OrderID OUTPUT
EXEC dbo.AddOrder '05123617  ','0001',' ',38754.5, 'SCHAEFFLER FRANCE', @OrderID OUTPUT
EXEC dbo.AddOrder '05123619  ','0001',' ',38749.5, 'INA FRANCE', @OrderID OUTPUT
EXEC dbo.AddOrder '05123622  ','0001',' ',38738.5, 'JDW HOLDING GMBH', @OrderID OUTPUT
EXEC dbo.AddOrder '05123623  ','0001',' ',38738.5, 'JDW HOLDING GMBH', @OrderID OUTPUT
EXEC dbo.AddOrder '05123624  ','0001',' ',38738.5, 'JDW HOLDING GMBH', @OrderID OUTPUT
EXEC dbo.AddOrder '05123625  ','0001',' ',38738.5, 'JDW HOLDING GMBH', @OrderID OUTPUT
EXEC dbo.AddOrder '05123635  ','0001',' ',38735.5, 'JDW HOLDING GMBH', @OrderID OUTPUT
EXEC dbo.AddOrder '05123636  ','0001',' ',38735.5, 'JDW HOLDING GMBH', @OrderID OUTPUT
EXEC dbo.AddOrder '05123637  ','0001',' ',38735.5, 'JDW HOLDING GMBH', @OrderID OUTPUT
EXEC dbo.AddOrder '05123659  ','0001',' ',38728.5, 'WELL-PACK AG', @OrderID OUTPUT
EXEC dbo.AddOrder '05123662  ','0001',' ',38745.5, 'LABORATOIRES URGO', @OrderID OUTPUT
EXEC dbo.AddOrder '05123663  ','0001',' ',38745.5, 'LABORATOIRES URGO', @OrderID OUTPUT
EXEC dbo.AddOrder '05123672  ','0001',' ',38755.5, 'AEF ATELIER D''EM. FAULQU', @OrderID OUTPUT
EXEC dbo.AddOrder '05123673  ','0001',' ',38769.5, 'AEF ATELIER D''EM. FAULQU', @OrderID OUTPUT
EXEC dbo.AddOrder '05123684  ','0001',' ',38767.5, 'DELIPAPIER', @OrderID OUTPUT
EXEC dbo.AddOrder '05123688  ','0001',' ',38747.5, 'DELIPAPIER', @OrderID OUTPUT
EXEC dbo.AddOrder '05123689  ','0001',' ',38747.5, 'DELIPAPIER', @OrderID OUTPUT
EXEC dbo.AddOrder '05123699  ','0001',' ',38728.5, 'NEUHAUSER', @OrderID OUTPUT
EXEC dbo.AddOrder '05123699  ','0001','a',38728.5, 'NEUHAUSER', @OrderID OUTPUT
EXEC dbo.AddOrder '05123710  ','0001',' ',38734.5, 'DIAGEO DEUTSCHLAND GMBH', @OrderID OUTPUT
EXEC dbo.AddOrder '05123710  ','0001','a',38745.5, 'DIAGEO DEUTSCHLAND GMBH', @OrderID OUTPUT
EXEC dbo.AddOrder '05123723  ','0001',' ',38759.5, 'DSM ELASTOMERS EUROPE', @OrderID OUTPUT
EXEC dbo.AddOrder '05123724  ','0001',' ',38763.5, 'DSM ELASTOMERS EUROPE', @OrderID OUTPUT
EXEC dbo.AddOrder '05123726  ','0001',' ',38738.5, 'DSM ELASTOMERS EUROPE', @OrderID OUTPUT
EXEC dbo.AddOrder '05123727  ','0001',' ',38741.5, 'DSM ELASTOMERS EUROPE', @OrderID OUTPUT
EXEC dbo.AddOrder '05123728  ','0001',' ',38740.5, 'DSM ELASTOMERS EUROPE', @OrderID OUTPUT
EXEC dbo.AddOrder '05123729  ','0001',' ',38738.5, 'DSM ELASTOMERS EUROPE', @OrderID OUTPUT
EXEC dbo.AddOrder '05123730  ','0001',' ',38747.5, 'DSM ELASTOMERS EUROPE', @OrderID OUTPUT
EXEC dbo.AddOrder '06010059  ','0001',' ',38731.5, 'JTEKT AUTOMOBILE LYON', @OrderID OUTPUT
EXEC dbo.AddOrder '06010108  ','0001',' ',38741.5, 'P&G INTERNATIONAL OPERAT', @OrderID OUTPUT
EXEC dbo.AddOrder '06010110  ','0001',' ',38742.5, 'P&G INTERNATIONAL OPERAT', @OrderID OUTPUT
EXEC dbo.AddOrder '06010112  ','0001',' ',38745.5, 'P&G INTERNATIONAL OPERAT', @OrderID OUTPUT
EXEC dbo.AddOrder '06010122  ','0001',' ',38741.5, 'P&G INTERNATIONAL OPERAT', @OrderID OUTPUT
EXEC dbo.AddOrder '06010126  ','0001',' ',38753.5, 'P&G INTERNATIONAL OPERAT', @OrderID OUTPUT
EXEC dbo.AddOrder '06010128  ','0001',' ',38753.5, 'P&G INTERNATIONAL OPERAT', @OrderID OUTPUT
EXEC dbo.AddOrder '06010137  ','0001',' ',38741.5, 'P&G INTERNATIONAL OPERAT', @OrderID OUTPUT
EXEC dbo.AddOrder '06010139  ','0001',' ',38755.5, 'P&G INTERNATIONAL OPERAT', @OrderID OUTPUT
EXEC dbo.AddOrder '06010141  ','0001',' ',38738.5, 'P&G INTERNATIONAL OPERAT', @OrderID OUTPUT
EXEC dbo.AddOrder '06010145  ','0001',' ',38755.5, 'P&G INTERNATIONAL OPERAT', @OrderID OUTPUT
EXEC dbo.AddOrder '06010147  ','0001',' ',38748.5, 'P&G INTERNATIONAL OPERAT', @OrderID OUTPUT
EXEC dbo.AddOrder '06010149  ','0001',' ',38740.5, 'P&G INTERNATIONAL OPERAT', @OrderID OUTPUT
EXEC dbo.AddOrder '06010192  ','0001',' ',38745.5, 'NESTLE WATERS SUPPLY EST', @OrderID OUTPUT
EXEC dbo.AddOrder '06010201  ','0001',' ',38741.5, 'NESTLE WATERS SUPPLY EST', @OrderID OUTPUT
EXEC dbo.AddOrder '06010201  ','0001','a',38741.5, 'NESTLE WATERS SUPPLY EST', @OrderID OUTPUT
EXEC dbo.AddOrder '06010232  ','0001',' ',38746.5, 'DS SMITH KAYPAC', @OrderID OUTPUT
EXEC dbo.AddOrder '06010255  ','0001',' ',38741.5, 'GIVAUDAN SUISSE SA.', @OrderID OUTPUT
EXEC dbo.AddOrder '06010261  ','0001',' ',38725.5, 'REHAU INDUSTRIE SARL', @OrderID OUTPUT
EXEC dbo.AddOrder '06010298  ','0001',' ',38747.5, 'SOMFY', @OrderID OUTPUT
EXEC dbo.AddOrder '06010299  ','0001',' ',38752.5, 'SOMFY', @OrderID OUTPUT
EXEC dbo.AddOrder '06010301  ','0001',' ',38752.5, 'SOMFY', @OrderID OUTPUT
EXEC dbo.AddOrder '06010309  ','0001',' ',38754.5, 'SOMFY', @OrderID OUTPUT
EXEC dbo.AddOrder '06010313  ','0001',' ',38748.5, 'SOMFY', @OrderID OUTPUT
EXEC dbo.AddOrder '06010315  ','0001',' ',38724.5, 'DOW-AGROSCIENCES B.V', @OrderID OUTPUT
EXEC dbo.AddOrder '06010319  ','0001',' ',38724.5, 'DOW-AGROSCIENCES B.V', @OrderID OUTPUT
EXEC dbo.AddOrder '06010322  ','0001',' ',38725.5, 'DOW AGROSCIENCES SWITZEL', @OrderID OUTPUT
EXEC dbo.AddOrder '06010325  ','0001',' ',38725.5, 'DOW AGROSCIENCES SWITZEL', @OrderID OUTPUT
EXEC dbo.AddOrder '06010325  ','0001','a',38725.5, 'DOW AGROSCIENCES SWITZEL', @OrderID OUTPUT
EXEC dbo.AddOrder '06010329  ','0001',' ',38724.5, 'DOWELANCO ITALIA S.R.L', @OrderID OUTPUT
EXEC dbo.AddOrder '06010330  ','0001',' ',38724.5, 'DOWELANCO ITALIA S.R.L', @OrderID OUTPUT
EXEC dbo.AddOrder '06010335  ','0001',' ',38724.5, 'DOW AGROSCIENCES SWITERL', @OrderID OUTPUT
EXEC dbo.AddOrder '06010336  ','0001',' ',38724.5, 'DOW AGROSCIENCES SWITERL', @OrderID OUTPUT
EXEC dbo.AddOrder '06010337  ','0001',' ',38724.5, 'DOW AGROSCIENCES SWITERL', @OrderID OUTPUT
EXEC dbo.AddOrder '06010338  ','0001',' ',38724.5, 'DOW AGROSCIENCES SWITERL', @OrderID OUTPUT
EXEC dbo.AddOrder '06010339  ','0001',' ',38724.5, 'DOW AGROSCIENCES SWITERL', @OrderID OUTPUT
EXEC dbo.AddOrder '06010340  ','0001',' ',38724.5, 'DOW AGROSCIENCES SWITERL', @OrderID OUTPUT
EXEC dbo.AddOrder '06010343  ','0001',' ',38724.5, 'DOW AGROSCIENCES', @OrderID OUTPUT
EXEC dbo.AddOrder '06010348  ','0001',' ',38724.5, 'DOW AGROSCIENCES', @OrderID OUTPUT
EXEC dbo.AddOrder '06010350  ','0001',' ',38724.5, 'DOW AGROSCIENCES', @OrderID OUTPUT
EXEC dbo.AddOrder '06010351  ','0001',' ',38747.5, 'SOMFY', @OrderID OUTPUT
EXEC dbo.AddOrder '06010401  ','0001',' ',38746.5, 'SOMFY', @OrderID OUTPUT
EXEC dbo.AddOrder '06010405  ','0001',' ',38747.5, 'SOMFY', @OrderID OUTPUT
EXEC dbo.AddOrder '06010407  ','0001',' ',38752.5, 'SOMFY', @OrderID OUTPUT
EXEC dbo.AddOrder '06010409  ','0001',' ',38748.5, 'SOMFY', @OrderID OUTPUT
EXEC dbo.AddOrder '06010412  ','0001',' ',38745.5, 'LILLY FRANCE S.A.', @OrderID OUTPUT
EXEC dbo.AddOrder '06010444  ','0001',' ',38763.5, 'STOCK USINE', @OrderID OUTPUT
EXEC dbo.AddOrder '06010445  ','0001',' ',38762.5, 'STOCK USINE', @OrderID OUTPUT
EXEC dbo.AddOrder '06010522  ','0001',' ',38753.5, 'REGENT BELEUCHTUNGSKOERP', @OrderID OUTPUT
EXEC dbo.AddOrder '06010526  ','0001',' ',38732.5, 'COGESAL MIKO-FSEUR 58488', @OrderID OUTPUT
EXEC dbo.AddOrder '06010526  ','0001','a',38732.5, 'COGESAL MIKO-FSEUR 58488', @OrderID OUTPUT
EXEC dbo.AddOrder '06010550  ','0001',' ',38735.5, 'P&G INTERNATIONAL OPERAT', @OrderID OUTPUT
EXEC dbo.AddOrder '06010550  ','0001','a',38735.5, 'P&G INTERNATIONAL OPERAT', @OrderID OUTPUT
EXEC dbo.AddOrder '06010550  ','0001','b',38735.5, 'P&G INTERNATIONAL OPERAT', @OrderID OUTPUT
EXEC dbo.AddOrder '06010568  ','0001',' ',38731.5, 'P&G INTERNATIONAL OPERAT', @OrderID OUTPUT
EXEC dbo.AddOrder '06010568  ','0001','a',38731.5, 'P&G INTERNATIONAL OPERAT', @OrderID OUTPUT
EXEC dbo.AddOrder '06010576  ','0001',' ',38742.5, 'P&G INTERNATIONAL OPERAT', @OrderID OUTPUT
EXEC dbo.AddOrder '06010584  ','0001',' ',38745.5, 'WELL-PACK AG', @OrderID OUTPUT
EXEC dbo.AddOrder '06010592  ','0001',' ',38747.5, 'HUWALD LIEBSCHNER GMBH', @OrderID OUTPUT
EXEC dbo.AddOrder '06010593  ','0001',' ',38753.5, 'DUPONT-MEDICAL-FROUARD', @OrderID OUTPUT
EXEC dbo.AddOrder '06010594  ','0001',' ',38753.5, 'DUPONT-MEDICAL-FROUARD', @OrderID OUTPUT
EXEC dbo.AddOrder '06010595  ','0001',' ',38753.5, 'DUPONT-MEDICAL-FROUARD', @OrderID OUTPUT
EXEC dbo.AddOrder '06010647  ','0001',' ',38753.5, 'ST GOBAIN VETROTEX FRANC', @OrderID OUTPUT
EXEC dbo.AddOrder '06010648  ','0001',' ',38753.5, 'ST GOBAIN VETROTEX FRANC', @OrderID OUTPUT
EXEC dbo.AddOrder '06010649  ','0001',' ',38753.5, 'ST GOBAIN VETROTEX FRANC', @OrderID OUTPUT
EXEC dbo.AddOrder '06010660  ','0001',' ',38745.5, 'STE ALSA-CORK', @OrderID OUTPUT
EXEC dbo.AddOrder '06010663  ','0001',' ',38742.5, 'DELIPAPIER', @OrderID OUTPUT
EXEC dbo.AddOrder '06010701  ','0001',' ',38741.5, 'NESTLE WATERS SUPPLY EST', @OrderID OUTPUT
EXEC dbo.AddOrder '06010706  ','0001',' ',38748.5, 'B.V.ALVERIMPORT', @OrderID OUTPUT
EXEC dbo.AddOrder '06010709  ','0001',' ',38733.5, 'TRISS SPOL.S.R.O.', @OrderID OUTPUT
EXEC dbo.AddOrder '06010719  ','0001',' ',38739.5, 'GEORGIA-PACIFIC FRANCE', @OrderID OUTPUT
EXEC dbo.AddOrder '06010720  ','0001',' ',38742.5, 'GEORGIA-PACIFIC FRANCE', @OrderID OUTPUT
EXEC dbo.AddOrder '06010761  ','0001',' ',38745.5, 'TECUMSEH EUROPE S.A.', @OrderID OUTPUT
EXEC dbo.AddOrder '06010771  ','0001',' ',38741.5, 'AEF ATELIER D''EM. FAULQU', @OrderID OUTPUT
EXEC dbo.AddOrder '06010789  ','0001',' ',38753.5, 'HERO FRANCE', @OrderID OUTPUT
EXEC dbo.AddOrder '06010790  ','0001',' ',38753.5, 'HERO FRANCE', @OrderID OUTPUT
EXEC dbo.AddOrder '06010791  ','0001',' ',38753.5, 'HERO FRANCE', @OrderID OUTPUT
EXEC dbo.AddOrder '06010792  ','0001',' ',38753.5, 'HERO FRANCE', @OrderID OUTPUT
EXEC dbo.AddOrder '06010793  ','0001',' ',38760.5, 'HERO FRANCE', @OrderID OUTPUT
EXEC dbo.AddOrder '06010794  ','0001',' ',38760.5, 'HERO FRANCE', @OrderID OUTPUT
EXEC dbo.AddOrder '06010795  ','0001',' ',38760.5, 'HERO FRANCE', @OrderID OUTPUT
EXEC dbo.AddOrder '06010796  ','0001',' ',38760.5, 'HERO FRANCE', @OrderID OUTPUT
EXEC dbo.AddOrder '06010805  ','0001',' ',38734.5, 'JDW HOLDING GMBH', @OrderID OUTPUT
EXEC dbo.AddOrder '06010886  ','0001',' ',38742.5, 'RICOH INDUSTRIE FRANCE', @OrderID OUTPUT
EXEC dbo.AddOrder '06010887  ','0001',' ',38742.5, 'RICOH INDUSTRIE FRANCE', @OrderID OUTPUT
EXEC dbo.AddOrder '06010889  ','0001',' ',38742.5, 'RICOH INDUSTRIE FRANCE', @OrderID OUTPUT
EXEC dbo.AddOrder '06010892  ','0001',' ',38742.5, 'RICOH INDUSTRIE FRANCE', @OrderID OUTPUT
EXEC dbo.AddOrder '06010895  ','0001',' ',38742.5, 'RICOH INDUSTRIE FRANCE', @OrderID OUTPUT
EXEC dbo.AddOrder '06010897  ','0001',' ',38742.5, 'RICOH INDUSTRIE FRANCE', @OrderID OUTPUT
EXEC dbo.AddOrder '06010898  ','0001',' ',38748.5, 'MAGIMIX', @OrderID OUTPUT
EXEC dbo.AddOrder '06010900  ','0001',' ',38746.5, 'RICOH INDUSTRIE FRANCE', @OrderID OUTPUT
EXEC dbo.AddOrder '06010901  ','0001',' ',38746.5, 'RICOH INDUSTRIE FRANCE', @OrderID OUTPUT
EXEC dbo.AddOrder '06010902  ','0001',' ',38746.5, 'RICOH INDUSTRIE FRANCE', @OrderID OUTPUT
EXEC dbo.AddOrder '06010907  ','0001',' ',38797.5, 'B.V.ALVERIMPORT', @OrderID OUTPUT
EXEC dbo.AddOrder '06010908  ','0001',' ',38797.5, 'B.V.ALVERIMPORT', @OrderID OUTPUT
EXEC dbo.AddOrder '06010918  ','0001',' ',38753.5, 'LILLY FRANCE S.A.', @OrderID OUTPUT
EXEC dbo.AddOrder '06010921  ','0001',' ',38754.5, 'LILLY FRANCE S.A.', @OrderID OUTPUT
EXEC dbo.AddOrder '06010932  ','0001',' ',38745.5, 'LABORATOIRES GALDERMA', @OrderID OUTPUT
EXEC dbo.AddOrder '06010935  ','0001',' ',38739.5, 'SAE SERGE CHEVEAU', @OrderID OUTPUT
EXEC dbo.AddOrder '06010935  ','0001','a',38739.5, 'SAE SERGE CHEVEAU', @OrderID OUTPUT
EXEC dbo.AddOrder '06010936  ','0001',' ',38741.5, 'BEKON-KORALLE AG', @OrderID OUTPUT
EXEC dbo.AddOrder '06010937  ','0001',' ',38745.5, 'BEKON-KORALLE AG', @OrderID OUTPUT
EXEC dbo.AddOrder '06010937  ','0001','b',38745.5, 'BEKON-KORALLE AG', @OrderID OUTPUT
EXEC dbo.AddOrder '06010947  ','0001',' ',38745.5, 'BEKON-KORALLE AG', @OrderID OUTPUT
EXEC dbo.AddOrder '06010952  ','0001',' ',38749.5, 'PEUGEOT CITROEN AUTOMOBI', @OrderID OUTPUT
EXEC dbo.AddOrder '06010954  ','0001',' ',38748.5, 'PEUGEOT CITROEN AUTOMOBI', @OrderID OUTPUT
EXEC dbo.AddOrder '06010957  ','0001',' ',38749.5, 'PEUGEOT CITROEN AUTOMOBI', @OrderID OUTPUT
EXEC dbo.AddOrder '06010968  ','0001',' ',38735.5, 'MLC LOGISTICS CONSULTANT', @OrderID OUTPUT
EXEC dbo.AddOrder '06010968  ','0001','a',38746.5, 'MLC LOGISTICS CONSULTANT', @OrderID OUTPUT
EXEC dbo.AddOrder '06010976  ','0001',' ',38745.5, 'PEUGEOT CITROEN AUTOMOBI', @OrderID OUTPUT
EXEC dbo.AddOrder '06010992  ','0001',' ',38766.5, 'LABORATOIRES GALDERMA', @OrderID OUTPUT
EXEC dbo.AddOrder '06011023  ','0001',' ',38727.5, 'STE WRIGLEY FRANCE S.N.C', @OrderID OUTPUT
EXEC dbo.AddOrder '06011040  ','0001',' ',38752.5, 'DU PONT DE NEMOURS (FRAN', @OrderID OUTPUT
EXEC dbo.AddOrder '06011042  ','0001',' ',38747.5, 'DU PONT DE NEMOURS (FRAN', @OrderID OUTPUT
EXEC dbo.AddOrder '06011044  ','0001',' ',38746.5, 'DU PONT DE NEMOURS (FRAN', @OrderID OUTPUT
EXEC dbo.AddOrder '06011046  ','0001',' ',38752.5, 'DU PONT DE NEMOURS (FRAN', @OrderID OUTPUT
EXEC dbo.AddOrder '06011048  ','0001',' ',38741.5, 'DU PONT DE NEMOURS (FRAN', @OrderID OUTPUT
EXEC dbo.AddOrder '06011050  ','0001',' ',38747.5, 'DU PONT DE NEMOURS (FRAN', @OrderID OUTPUT
EXEC dbo.AddOrder '06011050  ','0001','a',38747.5, 'DU PONT DE NEMOURS (FRAN', @OrderID OUTPUT
EXEC dbo.AddOrder '06011052  ','0001',' ',38747.5, 'DU PONT DE NEMOURS (FRAN', @OrderID OUTPUT
EXEC dbo.AddOrder '06011052  ','0001','a',38752.5, 'DU PONT DE NEMOURS (FRAN', @OrderID OUTPUT
EXEC dbo.AddOrder '06011052  ','0001','b',38747.5, 'DU PONT DE NEMOURS (FRAN', @OrderID OUTPUT
EXEC dbo.AddOrder '06011056  ','0001',' ',38748.5, 'DU PONT DE NEMOURS (FRAN', @OrderID OUTPUT
EXEC dbo.AddOrder '06011056  ','0001','a',38754.5, 'DU PONT DE NEMOURS (FRAN', @OrderID OUTPUT
EXEC dbo.AddOrder '06011097  ','0001',' ',38738.5, 'CARTONNAGES BERTRAND - N', @OrderID OUTPUT
EXEC dbo.AddOrder '06011098  ','0001',' ',38782.5, 'STE SIMU', @OrderID OUTPUT
EXEC dbo.AddOrder '06011103  ','0001',' ',38741.5, 'NOVARTIS CONSUMER HEALTH', @OrderID OUTPUT
EXEC dbo.AddOrder '06011104  ','0001',' ',38733.5, 'NOVARTIS CONSUMER HEALTH', @OrderID OUTPUT
EXEC dbo.AddOrder '06011106  ','0001',' ',38733.5, 'NOVARTIS CONSUMER HEALTH', @OrderID OUTPUT
EXEC dbo.AddOrder '06011107  ','0001',' ',38726.5, 'NOVARTIS CONSUMER HEALTH', @OrderID OUTPUT
EXEC dbo.AddOrder '06011121  ','0001',' ',38747.5, 'DICESA SA', @OrderID OUTPUT
EXEC dbo.AddOrder '06011122  ','0001',' ',38747.5, 'DICESA SA', @OrderID OUTPUT
EXEC dbo.AddOrder '06011123  ','0001',' ',38741.5, 'DICESA SA', @OrderID OUTPUT
EXEC dbo.AddOrder '06011125  ','0001',' ',38741.5, 'DICESA SA', @OrderID OUTPUT
EXEC dbo.AddOrder '06011125  ','0001','a',38741.5, 'DICESA SA', @OrderID OUTPUT
EXEC dbo.AddOrder '06011125  ','0001','b',38741.5, 'DICESA SA', @OrderID OUTPUT
EXEC dbo.AddOrder '06011126  ','0001',' ',38741.5, 'DICESA SA', @OrderID OUTPUT
EXEC dbo.AddOrder '06011127  ','0001',' ',38741.5, 'DICESA SA', @OrderID OUTPUT
EXEC dbo.AddOrder '06011127  ','0001','a',38741.5, 'DICESA SA', @OrderID OUTPUT
EXEC dbo.AddOrder '06011127  ','0001','b',38741.5, 'DICESA SA', @OrderID OUTPUT
EXEC dbo.AddOrder '06011130  ','0001',' ',38745.5, 'SHARP MANUFACTURING FRAN', @OrderID OUTPUT
EXEC dbo.AddOrder '06011134  ','0001',' ',38742.5, 'SHARP MANUFACTURING FRAN', @OrderID OUTPUT
EXEC dbo.AddOrder '06011136  ','0001',' ',38742.5, 'SHARP MANUFACTURING FRAN', @OrderID OUTPUT
EXEC dbo.AddOrder '06011138  ','0001',' ',38742.5, 'SHARP MANUFACTURING FRAN', @OrderID OUTPUT
EXEC dbo.AddOrder '06011142  ','0001',' ',38745.5, 'SHARP MANUFACTURING FRAN', @OrderID OUTPUT
EXEC dbo.AddOrder '06011152  ','0001',' ',38735.5, 'HAASS', @OrderID OUTPUT
EXEC dbo.AddOrder '06011170  ','0001',' ',38731.5, 'DOW AGROSCIENCES SWITERL', @OrderID OUTPUT
EXEC dbo.AddOrder '06011177  ','0001',' ',38731.5, 'DOW AGROSCIENCES', @OrderID OUTPUT
EXEC dbo.AddOrder '06011178  ','0001',' ',38731.5, 'DOW AGROSCIENCES', @OrderID OUTPUT
EXEC dbo.AddOrder '06011180  ','0001',' ',38731.5, 'DOW AGROSCIENCES', @OrderID OUTPUT
EXEC dbo.AddOrder '06011180  ','0001','a',38732.5, 'DOW AGROSCIENCES', @OrderID OUTPUT
EXEC dbo.AddOrder '06011181  ','0001',' ',38731.5, 'DOW AGROSCIENCES', @OrderID OUTPUT
EXEC dbo.AddOrder '06011181  ','0001','a',38735.5, 'DOW AGROSCIENCES', @OrderID OUTPUT
EXEC dbo.AddOrder '06011182  ','0001',' ',38731.5, 'DOW AGROSCIENCES', @OrderID OUTPUT
EXEC dbo.AddOrder '06011183  ','0001',' ',38731.5, 'DOW AGROSCIENCES', @OrderID OUTPUT
EXEC dbo.AddOrder '06011185  ','0001',' ',38731.5, 'DOW AGROSCIENCES', @OrderID OUTPUT
EXEC dbo.AddOrder '06011186  ','0001',' ',38731.5, 'DOW AGROSCIENCES', @OrderID OUTPUT
EXEC dbo.AddOrder '06011190  ','0001',' ',38731.5, 'DOW AGROSCIENCES', @OrderID OUTPUT
EXEC dbo.AddOrder '06011201  ','0001',' ',38726.5, 'DOW AGROSCIENCES', @OrderID OUTPUT
EXEC dbo.AddOrder '06011204  ','0001',' ',38731.5, 'DOW AGROSCIENCES', @OrderID OUTPUT
EXEC dbo.AddOrder '06011205  ','0001',' ',38731.5, 'DOW AGROSCIENCES', @OrderID OUTPUT
EXEC dbo.AddOrder '06011208  ','0001',' ',38731.5, 'DOW AGROSCIENCES', @OrderID OUTPUT
EXEC dbo.AddOrder '06011210  ','0001',' ',38748.5, 'DELIPAPIER', @OrderID OUTPUT
EXEC dbo.AddOrder '06011211  ','0001',' ',38753.5, 'DELIPAPIER', @OrderID OUTPUT
EXEC dbo.AddOrder '06011216  ','0001',' ',38761.5, 'MGI COUTIER PLASTIQUE', @OrderID OUTPUT
EXEC dbo.AddOrder '06011218  ','0001',' ',38755.5, 'MGI COUTIER PLASTIQUE', @OrderID OUTPUT
EXEC dbo.AddOrder '06011226  ','0001',' ',38770.5, 'DS SMITH KAYPAC', @OrderID OUTPUT
EXEC dbo.AddOrder '06011239  ','0001',' ',38763.5, 'ALBEMARLE CHEMICALS S.A.', @OrderID OUTPUT
EXEC dbo.AddOrder '06011240  ','0001',' ',38763.5, 'ALBEMARLE CHEMICALS S.A.', @OrderID OUTPUT
EXEC dbo.AddOrder '06011241  ','0001',' ',38763.5, 'ALBEMARLE CHEMICALS S.A.', @OrderID OUTPUT
EXEC dbo.AddOrder '06011242  ','0001',' ',38791.5, 'ALBEMARLE CHEMICALS S.A.', @OrderID OUTPUT
EXEC dbo.AddOrder '06011243  ','0001',' ',38791.5, 'ALBEMARLE CHEMICALS S.A.', @OrderID OUTPUT
EXEC dbo.AddOrder '06011244  ','0001',' ',38791.5, 'ALBEMARLE CHEMICALS S.A.', @OrderID OUTPUT
EXEC dbo.AddOrder '06011247  ','0001',' ',38754.5, 'DAIMLER CHRYSLER AG', @OrderID OUTPUT
EXEC dbo.AddOrder '06011263  ','0001',' ',38731.5, 'NESTLE WATERS SUPPLY EST', @OrderID OUTPUT
EXEC dbo.AddOrder '06011263  ','0001','a',38731.5, 'NESTLE WATERS SUPPLY EST', @OrderID OUTPUT
EXEC dbo.AddOrder '06011289  ','0001',' ',38752.5, 'DU PONT DE NEMOURS (FRAN', @OrderID OUTPUT
EXEC dbo.AddOrder '06011311  ','0001',' ',38735.5, 'BRASSERIE FISCHER SA', @OrderID OUTPUT
EXEC dbo.AddOrder '06011320  ','0001',' ',38745.5, 'DS SMITH KAYSERSBERG', @OrderID OUTPUT
EXEC dbo.AddOrder '06011324  ','0001',' ',38746.5, 'MGI COUTIER PLASTIQUE', @OrderID OUTPUT
EXEC dbo.AddOrder '06011327  ','0001',' ',38775.5, 'H.J.LICHTENBERGER GMBH', @OrderID OUTPUT
EXEC dbo.AddOrder '06011368  ','0001',' ',38741.5, 'BUBENDORFF VOLET ROULANT', @OrderID OUTPUT
EXEC dbo.AddOrder '06011414  ','0001',' ',38748.5, 'RICOH INDUSTRIE FRANCE', @OrderID OUTPUT
EXEC dbo.AddOrder '06011416  ','0001',' ',38747.5, 'RICOH INDUSTRIE FRANCE', @OrderID OUTPUT
EXEC dbo.AddOrder '06011417  ','0001',' ',38741.5, 'RICOH INDUSTRIE FRANCE', @OrderID OUTPUT
EXEC dbo.AddOrder '06011419  ','0001',' ',38746.5, 'RICOH INDUSTRIE FRANCE', @OrderID OUTPUT
EXEC dbo.AddOrder '06011441  ','0001',' ',38745.5, 'SYMA-SYSTEM AG', @OrderID OUTPUT
EXEC dbo.AddOrder '06011442  ','0001',' ',38745.5, 'SYMA-SYSTEM AG', @OrderID OUTPUT
EXEC dbo.AddOrder '06011451  ','0001',' ',38738.5, 'P&G INTERNATIONAL OPERAT', @OrderID OUTPUT
EXEC dbo.AddOrder '06011453  ','0001',' ',38741.5, 'P&G INTERNATIONAL OPERAT', @OrderID OUTPUT
EXEC dbo.AddOrder '06011457  ','0001',' ',38739.5, 'P&G INTERNATIONAL OPERAT', @OrderID OUTPUT
EXEC dbo.AddOrder '06011461  ','0001',' ',38739.5, 'P&G INTERNATIONAL OPERAT', @OrderID OUTPUT
EXEC dbo.AddOrder '06011464  ','0001',' ',38740.5, 'P&G INTERNATIONAL OPERAT', @OrderID OUTPUT
EXEC dbo.AddOrder '06011468  ','0001',' ',38746.5, 'P&G INTERNATIONAL OPERAT', @OrderID OUTPUT
EXEC dbo.AddOrder '06011470  ','0001',' ',38740.5, 'P&G INTERNATIONAL OPERAT', @OrderID OUTPUT
EXEC dbo.AddOrder '06011473  ','0001',' ',38742.5, 'KONICA MINOLTA SUP.MANU.', @OrderID OUTPUT
EXEC dbo.AddOrder '06011474  ','0001',' ',38742.5, 'KONICA MINOLTA SUP.MANU.', @OrderID OUTPUT
EXEC dbo.AddOrder '06011475  ','0001',' ',38754.5, 'KONICA MINOLTA SUP.MANU.', @OrderID OUTPUT
EXEC dbo.AddOrder '06011476  ','0001',' ',38754.5, 'KONICA MINOLTA SUP.MANU.', @OrderID OUTPUT
EXEC dbo.AddOrder '06011477  ','0001',' ',38747.5, 'KONICA MINOLTA SUP.MANU.', @OrderID OUTPUT
EXEC dbo.AddOrder '06011478  ','0001',' ',38742.5, 'KONICA MINOLTA SUP.MANU.', @OrderID OUTPUT
EXEC dbo.AddOrder '06011479  ','0001',' ',38742.5, 'KONICA MINOLTA SUP.MANU.', @OrderID OUTPUT
EXEC dbo.AddOrder '06011480  ','0001',' ',38742.5, 'KONICA MINOLTA SUP.MANU.', @OrderID OUTPUT
EXEC dbo.AddOrder '06011480  ','0001','a',38742.5, 'KONICA MINOLTA SUP.MANU.', @OrderID OUTPUT
EXEC dbo.AddOrder '06011481  ','0001',' ',38761.5, 'KONICA MINOLTA SUP.MANU.', @OrderID OUTPUT
EXEC dbo.AddOrder '06011482  ','0001',' ',38761.5, 'KONICA MINOLTA SUP.MANU.', @OrderID OUTPUT
EXEC dbo.AddOrder '06011483  ','0001',' ',38741.5, 'P&G INTERNATIONAL OPERAT', @OrderID OUTPUT
EXEC dbo.AddOrder '06011487  ','0001',' ',38742.5, 'COGESAL MIKO-FSEUR 58488', @OrderID OUTPUT
EXEC dbo.AddOrder '06011499  ','0001',' ',38749.5, 'GEPAK W.GERNER GMBH', @OrderID OUTPUT
EXEC dbo.AddOrder '06011500  ','0001',' ',38749.5, 'GEPAK W.GERNER GMBH', @OrderID OUTPUT
EXEC dbo.AddOrder '06011509  ','0001',' ',38740.5, 'P&G INTERNATIONAL OPERAT', @OrderID OUTPUT
EXEC dbo.AddOrder '06011513  ','0001',' ',38742.5, 'P&G INTERNATIONAL OPERAT', @OrderID OUTPUT
EXEC dbo.AddOrder '06011513  ','0001','a',38742.5, 'P&G INTERNATIONAL OPERAT', @OrderID OUTPUT
EXEC dbo.AddOrder '06011515  ','0001',' ',38745.5, 'P&G INTERNATIONAL OPERAT', @OrderID OUTPUT
EXEC dbo.AddOrder '06011520  ','0001',' ',38755.5, 'P&G INTERNATIONAL OPERAT', @OrderID OUTPUT
EXEC dbo.AddOrder '06011522  ','0001',' ',38738.5, 'P&G INTERNATIONAL OPERAT', @OrderID OUTPUT
EXEC dbo.AddOrder '06011525  ','0001',' ',38745.5, 'P&G INTERNATIONAL OPERAT', @OrderID OUTPUT
EXEC dbo.AddOrder '06011529  ','0001',' ',38742.5, 'P&G INTERNATIONAL OPERAT', @OrderID OUTPUT
EXEC dbo.AddOrder '06011531  ','0001',' ',38742.5, 'P&G INTERNATIONAL OPERAT', @OrderID OUTPUT
EXEC dbo.AddOrder '06011534  ','0001',' ',38742.5, 'P&G INTERNATIONAL OPERAT', @OrderID OUTPUT
EXEC dbo.AddOrder '06011542  ','0001',' ',38738.5, 'P&G INTERNATIONAL OPERAT', @OrderID OUTPUT
EXEC dbo.AddOrder '06011545  ','0001',' ',38746.5, 'NEUHAUSER', @OrderID OUTPUT
EXEC dbo.AddOrder '06011545  ','0001','a',38746.5, 'NEUHAUSER', @OrderID OUTPUT
EXEC dbo.AddOrder '06011548  ','0001',' ',38747.5, 'NEUHAUSER', @OrderID OUTPUT
EXEC dbo.AddOrder '06011549  ','0001',' ',38747.5, 'NEUHAUSER', @OrderID OUTPUT
EXEC dbo.AddOrder '06011551  ','0001',' ',38748.5, 'NEUHAUSER', @OrderID OUTPUT
EXEC dbo.AddOrder '06011554  ','0001',' ',38746.5, 'NEUHAUSER', @OrderID OUTPUT
EXEC dbo.AddOrder '06011556  ','0001',' ',38747.5, 'KONICA MINOLTA SUP.MANU.', @OrderID OUTPUT
EXEC dbo.AddOrder '06011557  ','0001',' ',38742.5, 'KONICA MINOLTA SUP.MANU.', @OrderID OUTPUT
EXEC dbo.AddOrder '06011558  ','0001',' ',38752.5, 'KONICA MINOLTA SUP.MANU.', @OrderID OUTPUT
EXEC dbo.AddOrder '06011559  ','0001',' ',38742.5, 'KONICA MINOLTA SUP.MANU.', @OrderID OUTPUT
EXEC dbo.AddOrder '06011560  ','0001',' ',38791.5, 'NEUHAUSER', @OrderID OUTPUT
EXEC dbo.AddOrder '06011578  ','0001',' ',38732.5, 'S.M.A.E.    (EDI)', @OrderID OUTPUT
EXEC dbo.AddOrder '06011587  ','0001',' ',38746.5, 'STE INDUST.DE LEVURE FAL', @OrderID OUTPUT
EXEC dbo.AddOrder '06011589  ','0001',' ',38746.5, 'PEUGEOT CITROEN AUTOMOBI', @OrderID OUTPUT
EXEC dbo.AddOrder '06011593  ','0001',' ',38755.5, 'P&G INTERNATIONAL OPERAT', @OrderID OUTPUT
EXEC dbo.AddOrder '06011595  ','0001',' ',38753.5, 'P&G INTERNATIONAL OPERAT', @OrderID OUTPUT
EXEC dbo.AddOrder '06011595  ','0001','a',38753.5, 'P&G INTERNATIONAL OPERAT', @OrderID OUTPUT
EXEC dbo.AddOrder '06011597  ','0001',' ',38746.5, 'P&G INTERNATIONAL OPERAT', @OrderID OUTPUT
EXEC dbo.AddOrder '06011603  ','0001',' ',38775.5, 'P&G INTERNATIONAL OPERAT', @OrderID OUTPUT
EXEC dbo.AddOrder '06011610  ','0001',' ',38754.5, 'P&G INTERNATIONAL OPERAT', @OrderID OUTPUT
EXEC dbo.AddOrder '06011612  ','0001',' ',38754.5, 'P&G INTERNATIONAL OPERAT', @OrderID OUTPUT
EXEC dbo.AddOrder '06011618  ','0001',' ',38747.5, 'ED.FRIEDRICH & CO GMBH', @OrderID OUTPUT
EXEC dbo.AddOrder '06011626  ','0001',' ',38784.5, 'RICOLA EUROPE SA', @OrderID OUTPUT
EXEC dbo.AddOrder '06011641  ','0001',' ',38742.5, 'RICOLA EUROPE SA', @OrderID OUTPUT
EXEC dbo.AddOrder '06011657  ','0001',' ',38733.5, 'SEP KUNHEIM', @OrderID OUTPUT
EXEC dbo.AddOrder '06011657  ','0001','a',38733.5, 'SEP KUNHEIM', @OrderID OUTPUT
EXEC dbo.AddOrder '06011657  ','0001','b',38733.5, 'SEP KUNHEIM', @OrderID OUTPUT
EXEC dbo.AddOrder '06011657  ','0004',' ',38742.5, 'SEP KUNHEIM', @OrderID OUTPUT
EXEC dbo.AddOrder '06011657  ','0004','a',38742.5, 'SEP KUNHEIM', @OrderID OUTPUT
EXEC dbo.AddOrder '06011667  ','0001',' ',38756.5, 'NESTLE WATERS SUPPLY EST', @OrderID OUTPUT
EXEC dbo.AddOrder '06011678  ','0001',' ',38738.5, 'DS SMITH KAYSERSBERG', @OrderID OUTPUT
EXEC dbo.AddOrder '06011680  ','0001',' ',38761.5, 'ADHESIA', @OrderID OUTPUT
EXEC dbo.AddOrder '06011681  ','0001',' ',38738.5, 'DS SMITH KAYSERSBERG', @OrderID OUTPUT
EXEC dbo.AddOrder '06011693  ','0001',' ',38738.5, 'DS SMITH KAYSERSBERG', @OrderID OUTPUT
EXEC dbo.AddOrder '06011699  ','0001',' ',38782.5, 'CRISTALLERIES DE BACCARA', @OrderID OUTPUT
EXEC dbo.AddOrder '06011700  ','0001',' ',38809.5, 'CRISTALLERIES DE BACCARA', @OrderID OUTPUT
EXEC dbo.AddOrder '06011701  ','0001',' ',38745.5, 'THOMPAC GMBH', @OrderID OUTPUT
EXEC dbo.AddOrder '06011702  ','0001',' ',38748.5, 'VISTEON SYSTEMES INTERIE', @OrderID OUTPUT
EXEC dbo.AddOrder '06011703  ','0001',' ',38733.5, 'HORNA GMBH VERPACKUNGEN', @OrderID OUTPUT
EXEC dbo.AddOrder '06011709  ','0001',' ',38747.5, 'ALCAN PACKAGING CAPSULES', @OrderID OUTPUT
EXEC dbo.AddOrder '06011711  ','0001',' ',38746.5, 'HWK-HAGSFELDER WERKSTAET', @OrderID OUTPUT
EXEC dbo.AddOrder '06011712  ','0001',' ',38746.5, 'HWK-HAGSFELDER WERKSTAET', @OrderID OUTPUT
EXEC dbo.AddOrder '06011714  ','0001',' ',38735.5, 'W. WIRTH GMBH', @OrderID OUTPUT
EXEC dbo.AddOrder '06011728  ','0001',' ',38749.5, 'BRASSERIES KRONENBOURG 5', @OrderID OUTPUT
EXEC dbo.AddOrder '06011733  ','0001',' ',38733.5, 'NESTLE WATERS SUPPLY EST', @OrderID OUTPUT
EXEC dbo.AddOrder '06011734  ','0001',' ',38774.5, 'BRASSERIES KRONENBOURG 5', @OrderID OUTPUT
EXEC dbo.AddOrder '06011741  ','0001',' ',38754.5, 'BRASSERIES KRONENBOURG 5', @OrderID OUTPUT
EXEC dbo.AddOrder '06011743  ','0001',' ',38745.5, 'BRASSERIES KRONENBOURG 5', @OrderID OUTPUT
EXEC dbo.AddOrder '06011743  ','0001','a',38745.5, 'BRASSERIES KRONENBOURG 5', @OrderID OUTPUT
EXEC dbo.AddOrder '06011745  ','0001',' ',38774.5, 'BRASSERIES KRONENBOURG 5', @OrderID OUTPUT
EXEC dbo.AddOrder '06011748  ','0001',' ',38746.5, 'GEORGIA-PACIFIC FRANCE', @OrderID OUTPUT
EXEC dbo.AddOrder '06011749  ','0001',' ',38752.5, 'GEORGIA-PACIFIC FRANCE', @OrderID OUTPUT
EXEC dbo.AddOrder '06011756  ','0001',' ',38746.5, 'CART.EMBAL. RHONE ALPES', @OrderID OUTPUT
EXEC dbo.AddOrder '06011765  ','0001',' ',38754.5, 'CIE FRANCO-SUISSE', @OrderID OUTPUT
EXEC dbo.AddOrder '06011772  ','0001',' ',38749.5, 'BRASSERIES KRONENBOURG 5', @OrderID OUTPUT
EXEC dbo.AddOrder '06011774  ','0001',' ',38774.5, 'BRASSERIES KRONENBOURG 5', @OrderID OUTPUT
EXEC dbo.AddOrder '06011776  ','0001',' ',38774.5, 'BRASSERIES KRONENBOURG 5', @OrderID OUTPUT
EXEC dbo.AddOrder '06011776  ','0001','b',38774.5, 'BRASSERIES KRONENBOURG 5', @OrderID OUTPUT
EXEC dbo.AddOrder '06011790  ','0001',' ',38735.5, 'NOVARTIS CONSUMER HEALTH', @OrderID OUTPUT
EXEC dbo.AddOrder '06011791  ','0001',' ',38735.5, 'NOVARTIS CONSUMER HEALTH', @OrderID OUTPUT
EXEC dbo.AddOrder '06011792  ','0001',' ',38742.5, 'NOVARTIS CONSUMER HEALTH', @OrderID OUTPUT
EXEC dbo.AddOrder '06011792  ','0001','a',38742.5, 'NOVARTIS CONSUMER HEALTH', @OrderID OUTPUT
EXEC dbo.AddOrder '06011793  ','0001',' ',38742.5, 'NOVARTIS CONSUMER HEALTH', @OrderID OUTPUT
EXEC dbo.AddOrder '06011797  ','0001',' ',38754.5, 'LES GRANDES SOURCES WATT', @OrderID OUTPUT
EXEC dbo.AddOrder '06011799  ','0001',' ',38748.5, 'LES GRANDES SOURCES WATT', @OrderID OUTPUT
EXEC dbo.AddOrder '06011800  ','0001',' ',38746.5, 'ROBOT COUPE', @OrderID OUTPUT
EXEC dbo.AddOrder '06011812  ','0001',' ',38784.5, 'DSM ELASTOMERS EUROPE', @OrderID OUTPUT
EXEC dbo.AddOrder '06011813  ','0001',' ',38790.5, 'DSM ELASTOMERS EUROPE', @OrderID OUTPUT
EXEC dbo.AddOrder '06011814  ','0001',' ',38797.5, 'DSM ELASTOMERS EUROPE', @OrderID OUTPUT
EXEC dbo.AddOrder '06011815  ','0001',' ',38756.5, 'DSM ELASTOMERS EUROPE', @OrderID OUTPUT
EXEC dbo.AddOrder '06011816  ','0001',' ',38756.5, 'DSM ELASTOMERS EUROPE', @OrderID OUTPUT
EXEC dbo.AddOrder '06011817  ','0001',' ',38763.5, 'DSM ELASTOMERS EUROPE', @OrderID OUTPUT
EXEC dbo.AddOrder '06011818  ','0001',' ',38762.5, 'DSM ELASTOMERS EUROPE', @OrderID OUTPUT
EXEC dbo.AddOrder '06011819  ','0001',' ',38774.5, 'DSM ELASTOMERS EUROPE', @OrderID OUTPUT
EXEC dbo.AddOrder '06011820  ','0001',' ',38773.5, 'DSM ELASTOMERS EUROPE', @OrderID OUTPUT
EXEC dbo.AddOrder '06011824  ','0001',' ',38755.5, 'DSM ELASTOMERS EUROPE', @OrderID OUTPUT
EXEC dbo.AddOrder '06011825  ','0001',' ',38766.5, 'DSM ELASTOMERS EUROPE', @OrderID OUTPUT
EXEC dbo.AddOrder '06011839  ','0001',' ',38745.5, 'CLARIANT PRODUKTE SCHWEI', @OrderID OUTPUT
EXEC dbo.AddOrder '06011844  ','0001',' ',38732.5, 'COGESAL MIKO-FSEUR 58488', @OrderID OUTPUT
EXEC dbo.AddOrder '06011844  ','0001','a',38732.5, 'COGESAL MIKO-FSEUR 58488', @OrderID OUTPUT
EXEC dbo.AddOrder '06011859  ','0001',' ',38745.5, 'SCHWEITZER S.A.', @OrderID OUTPUT
EXEC dbo.AddOrder '06011867  ','0001',' ',38755.5, 'ED.FRIEDRICH & CO GMBH', @OrderID OUTPUT
EXEC dbo.AddOrder '06011869  ','0001',' ',38753.5, 'IMPORTHAUS WILMS / IMPUL', @OrderID OUTPUT
EXEC dbo.AddOrder '06011870  ','0001',' ',38777.5, 'IMPORTHAUS WILMS / IMPUL', @OrderID OUTPUT
EXEC dbo.AddOrder '06011872  ','0001',' ',38777.5, 'IMPORTHAUS WILMS / IMPUL', @OrderID OUTPUT
EXEC dbo.AddOrder '06011874  ','0001',' ',38777.5, 'IMPORTHAUS WILMS / IMPUL', @OrderID OUTPUT
EXEC dbo.AddOrder '06011876  ','0001',' ',38777.5, 'IMPORTHAUS WILMS / IMPUL', @OrderID OUTPUT
EXEC dbo.AddOrder '06011878  ','0001',' ',38740.5, 'GEORGIA-PACIFIC FRANCE', @OrderID OUTPUT
EXEC dbo.AddOrder '06011881  ','0001',' ',38734.5, 'TIMKEN EUROPE', @OrderID OUTPUT
EXEC dbo.AddOrder '06011899  ','0001',' ',38735.5, 'NESTLE WATERS SUPPLY EST', @OrderID OUTPUT
EXEC dbo.AddOrder '06011901  ','0001',' ',38738.5, 'NESTLE WATERS SUPPLY EST', @OrderID OUTPUT
EXEC dbo.AddOrder '06011918  ','0001',' ',38749.5, 'PEUGEOT CITROEN AUTOMOBI', @OrderID OUTPUT
EXEC dbo.AddOrder '06011937  ','0001',' ',38742.5, 'TIMKEN EUROPE', @OrderID OUTPUT
EXEC dbo.AddOrder '06011941  ','0001',' ',38745.5, 'LINNEMANN-SCHNETZER', @OrderID OUTPUT
EXEC dbo.AddOrder '06011942  ','0001',' ',38745.5, 'LINNEMANN-SCHNETZER', @OrderID OUTPUT
EXEC dbo.AddOrder '06011943  ','0001',' ',38745.5, 'LINNEMANN-SCHNETZER', @OrderID OUTPUT
EXEC dbo.AddOrder '06011946  ','0001',' ',38746.5, 'DS SMITH KAYSERSBERG', @OrderID OUTPUT
EXEC dbo.AddOrder '06011947  ','0001',' ',38748.5, 'LESAFFRE AUSTRIA AG', @OrderID OUTPUT
EXEC dbo.AddOrder '06011950  ','0001',' ',38742.5, 'ED.FRIEDRICH & CO GMBH', @OrderID OUTPUT
EXEC dbo.AddOrder '06011954  ','0001',' ',38748.5, 'DAIMLER CHRYSLER AG', @OrderID OUTPUT
EXEC dbo.AddOrder '06011957  ','0001',' ',38747.5, 'LILLY FRANCE S.A.', @OrderID OUTPUT
EXEC dbo.AddOrder '06011960  ','0001',' ',38768.5, 'LILLY FRANCE S.A.', @OrderID OUTPUT
EXEC dbo.AddOrder '06011962  ','0001',' ',38748.5, 'LILLY FRANCE S.A.', @OrderID OUTPUT
EXEC dbo.AddOrder '06011965  ','0001',' ',38741.5, 'ED.FRIEDRICH & CO GMBH', @OrderID OUTPUT
EXEC dbo.AddOrder '06011978  ','0001',' ',38741.5, 'TRISS SPOL.S.R.O.', @OrderID OUTPUT
EXEC dbo.AddOrder '06011979  ','0001',' ',38763.5, 'DU PONT DE NEMOURS (FRAN', @OrderID OUTPUT
EXEC dbo.AddOrder '06011983  ','0001',' ',38745.5, 'SAEP DIFFUSION', @OrderID OUTPUT
EXEC dbo.AddOrder '06011983  ','0001','a',38747.5, 'SAEP DIFFUSION', @OrderID OUTPUT
EXEC dbo.AddOrder '06011984  ','0001',' ',38740.5, 'SAEP DIFFUSION', @OrderID OUTPUT
EXEC dbo.AddOrder '06011985  ','0001',' ',38740.5, 'SAEP DIFFUSION', @OrderID OUTPUT
EXEC dbo.AddOrder '06011986  ','0001',' ',38745.5, 'SAEP DIFFUSION', @OrderID OUTPUT
EXEC dbo.AddOrder '06011989  ','0001',' ',38749.5, 'TRISS SPOL.S.R.O.', @OrderID OUTPUT
EXEC dbo.AddOrder '06011991  ','0001',' ',38753.5, 'FREUDENBERG VLIESSTOFFE', @OrderID OUTPUT
EXEC dbo.AddOrder '06011992  ','0001',' ',38753.5, 'FREUDENBERG VLIESSTOFFE', @OrderID OUTPUT
EXEC dbo.AddOrder '06011993  ','0001',' ',38741.5, 'DUPONT POWDER COATINGS F', @OrderID OUTPUT
EXEC dbo.AddOrder '06011993  ','0001','a',38745.5, 'DUPONT POWDER COATINGS F', @OrderID OUTPUT
EXEC dbo.AddOrder '06012014  ','0001',' ',38748.5, 'SOMFY', @OrderID OUTPUT
EXEC dbo.AddOrder '06012025  ','0001',' ',38747.5, 'NESTLE DEUTSCHLAND AG', @OrderID OUTPUT
EXEC dbo.AddOrder '06012065  ','0001',' ',38755.5, 'SODETAL SARL', @OrderID OUTPUT
EXEC dbo.AddOrder '06012066  ','0001',' ',38755.5, 'SODETAL SARL', @OrderID OUTPUT
EXEC dbo.AddOrder '06012067  ','0001',' ',38781.5, 'SODETAL SARL', @OrderID OUTPUT
EXEC dbo.AddOrder '06012067  ','0001','a',38781.5, 'SODETAL SARL', @OrderID OUTPUT
EXEC dbo.AddOrder '06012088  ','0001',' ',38749.5, 'TRISS SPOL.S.R.O.', @OrderID OUTPUT
EXEC dbo.AddOrder '06012089  ','0001',' ',38749.5, 'TRISS SPOL.S.R.O.', @OrderID OUTPUT
EXEC dbo.AddOrder '06012100  ','0001',' ',38745.5, 'BUBENDORFF VOLET ROULANT', @OrderID OUTPUT
EXEC dbo.AddOrder '06012101  ','0001',' ',38745.5, 'BUBENDORFF VOLET ROULANT', @OrderID OUTPUT
EXEC dbo.AddOrder '06012102  ','0001',' ',38746.5, 'BUBENDORFF VOLET ROULANT', @OrderID OUTPUT
EXEC dbo.AddOrder '06012105  ','0001',' ',38756.5, 'NEUHAUSER', @OrderID OUTPUT
EXEC dbo.AddOrder '06012107  ','0001',' ',38753.5, 'NEUHAUSER', @OrderID OUTPUT
EXEC dbo.AddOrder '06012109  ','0001',' ',38769.5, 'NEUHAUSER', @OrderID OUTPUT
EXEC dbo.AddOrder '06012122  ','0001',' ',38753.5, 'SA. BOULANGERIE NEUHAUSE', @OrderID OUTPUT
EXEC dbo.AddOrder '06012140  ','0001',' ',38791.5, 'ALBEMARLE CHEMICALS S.A.', @OrderID OUTPUT
EXEC dbo.AddOrder '06012141  ','0001',' ',38791.5, 'ALBEMARLE CHEMICALS S.A.', @OrderID OUTPUT
EXEC dbo.AddOrder '06012142  ','0001',' ',38791.5, 'ALBEMARLE CHEMICALS S.A.', @OrderID OUTPUT
EXEC dbo.AddOrder '06012147  ','0001',' ',38745.5, 'CARTONNAGES BERTRAND - N', @OrderID OUTPUT
EXEC dbo.AddOrder '06012148  ','0001',' ',38745.5, 'CARTONNAGES BERTRAND - N', @OrderID OUTPUT
EXEC dbo.AddOrder '06012150  ','0001',' ',38760.5, 'STE INDUST.DE LEVURE FAL', @OrderID OUTPUT
EXEC dbo.AddOrder '06012153  ','0001',' ',38752.5, 'STE INDUST.DE LEVURE FAL', @OrderID OUTPUT
EXEC dbo.AddOrder '06012156  ','0001',' ',38752.5, 'STE INDUST.DE LEVURE FAL', @OrderID OUTPUT
EXEC dbo.AddOrder '06012158  ','0001',' ',38752.5, 'STE INDUST.DE LEVURE FAL', @OrderID OUTPUT
EXEC dbo.AddOrder '06012160  ','0001',' ',38748.5, 'STE INDUST.DE LEVURE FAL', @OrderID OUTPUT
EXEC dbo.AddOrder '06012162  ','0001',' ',38773.5, 'STE INDUST.DE LEVURE FAL', @OrderID OUTPUT
EXEC dbo.AddOrder '06012164  ','0001',' ',38748.5, 'STE INDUST.DE LEVURE FAL', @OrderID OUTPUT
EXEC dbo.AddOrder '06012166  ','0001',' ',38763.5, 'STE INDUST.DE LEVURE FAL', @OrderID OUTPUT
EXEC dbo.AddOrder '06012169  ','0001',' ',38760.5, 'STE INDUST.DE LEVURE FAL', @OrderID OUTPUT
EXEC dbo.AddOrder '06012177  ','0001',' ',38741.5, 'JTEKT AUTOMOBILE LYON', @OrderID OUTPUT
EXEC dbo.AddOrder '06012180  ','0001',' ',38756.5, 'STE INDUST.DE LEVURE FAL', @OrderID OUTPUT
EXEC dbo.AddOrder '06012182  ','0001',' ',38756.5, 'STE INDUST.DE LEVURE FAL', @OrderID OUTPUT
EXEC dbo.AddOrder '06012184  ','0001',' ',38756.5, 'STE INDUST.DE LEVURE FAL', @OrderID OUTPUT
EXEC dbo.AddOrder '06012186  ','0001',' ',38756.5, 'STE INDUST.DE LEVURE FAL', @OrderID OUTPUT
EXEC dbo.AddOrder '06012188  ','0001',' ',38756.5, 'STE INDUST.DE LEVURE FAL', @OrderID OUTPUT
EXEC dbo.AddOrder '06012190  ','0001',' ',38766.5, 'STE INDUST.DE LEVURE FAL', @OrderID OUTPUT
EXEC dbo.AddOrder '06012192  ','0001',' ',38766.5, 'STE INDUST.DE LEVURE FAL', @OrderID OUTPUT
EXEC dbo.AddOrder '06012211  ','0001',' ',38741.5, 'DS SMITH KAYSERSBERG', @OrderID OUTPUT
EXEC dbo.AddOrder '06012214  ','0001',' ',38746.5, 'STE WRIGLEY FRANCE S.N.C', @OrderID OUTPUT
EXEC dbo.AddOrder '06012215  ','0001',' ',38741.5, 'DS SMITH KAYSERSBERG', @OrderID OUTPUT
EXEC dbo.AddOrder '06012217  ','0001',' ',38745.5, 'STE WRIGLEY FRANCE S.N.C', @OrderID OUTPUT
EXEC dbo.AddOrder '06012220  ','0001',' ',38745.5, 'STE WRIGLEY FRANCE S.N.C', @OrderID OUTPUT
EXEC dbo.AddOrder '06012221  ','0001',' ',38752.5, 'KONICA MINOLTA SUP.MANU.', @OrderID OUTPUT
EXEC dbo.AddOrder '06012221  ','0001','a',38789.5, 'KONICA MINOLTA SUP.MANU.', @OrderID OUTPUT
EXEC dbo.AddOrder '06012224  ','0001',' ',38752.5, 'KONICA MINOLTA SUP.MANU.', @OrderID OUTPUT
EXEC dbo.AddOrder '06012224  ','0001','a',38789.5, 'KONICA MINOLTA SUP.MANU.', @OrderID OUTPUT
EXEC dbo.AddOrder '06012225  ','0001',' ',38741.5, 'DS SMITH KAYSERSBERG', @OrderID OUTPUT
EXEC dbo.AddOrder '06012228  ','0001',' ',38780.5, 'KONICA MINOLTA SUP.MANU.', @OrderID OUTPUT
EXEC dbo.AddOrder '06012233  ','0001',' ',38745.5, 'STE WRIGLEY FRANCE S.N.C', @OrderID OUTPUT
EXEC dbo.AddOrder '06012235  ','0001',' ',38745.5, 'STE WRIGLEY FRANCE S.N.C', @OrderID OUTPUT
EXEC dbo.AddOrder '06012237  ','0001',' ',38745.5, 'STE WRIGLEY FRANCE S.N.C', @OrderID OUTPUT
EXEC dbo.AddOrder '06012239  ','0001',' ',38745.5, 'STE WRIGLEY FRANCE S.N.C', @OrderID OUTPUT
EXEC dbo.AddOrder '06012243  ','0001',' ',38747.5, 'STE WRIGLEY FRANCE S.N.C', @OrderID OUTPUT
EXEC dbo.AddOrder '06012245  ','0001',' ',38748.5, 'STE WRIGLEY FRANCE S.N.C', @OrderID OUTPUT
EXEC dbo.AddOrder '06012247  ','0001',' ',38748.5, 'STE WRIGLEY FRANCE S.N.C', @OrderID OUTPUT
EXEC dbo.AddOrder '06012249  ','0001',' ',38748.5, 'STE WRIGLEY FRANCE S.N.C', @OrderID OUTPUT
EXEC dbo.AddOrder '06012251  ','0001',' ',38754.5, 'CUISINES SCHMIDT SALM SA', @OrderID OUTPUT
EXEC dbo.AddOrder '06012252  ','0001',' ',38748.5, 'STE WRIGLEY FRANCE S.N.C', @OrderID OUTPUT
EXEC dbo.AddOrder '06012255  ','0001',' ',38749.5, 'STE WRIGLEY FRANCE S.N.C', @OrderID OUTPUT
EXEC dbo.AddOrder '06012256  ','0001',' ',38747.5, 'DUPONT-MEDICAL-FROUARD', @OrderID OUTPUT
EXEC dbo.AddOrder '06012258  ','0001',' ',38752.5, 'STE WRIGLEY FRANCE S.N.C', @OrderID OUTPUT
EXEC dbo.AddOrder '06012258  ','0001','a',38756.5, 'STE WRIGLEY FRANCE S.N.C', @OrderID OUTPUT
EXEC dbo.AddOrder '06012260  ','0001',' ',38752.5, 'STE WRIGLEY FRANCE S.N.C', @OrderID OUTPUT
EXEC dbo.AddOrder '06012262  ','0001',' ',38745.5, 'ALCOOL PETROLE CHIMIE', @OrderID OUTPUT
EXEC dbo.AddOrder '06012264  ','0001',' ',38745.5, 'ALCOOL PETROLE CHIMIE', @OrderID OUTPUT
EXEC dbo.AddOrder '06012266  ','0001',' ',38745.5, 'ALCOOL PETROLE CHIMIE', @OrderID OUTPUT
EXEC dbo.AddOrder '06012268  ','0001',' ',38745.5, 'ALCOOL PETROLE CHIMIE', @OrderID OUTPUT
EXEC dbo.AddOrder '06012271  ','0001',' ',38749.5, 'LEGRAND', @OrderID OUTPUT
EXEC dbo.AddOrder '06012273  ','0001',' ',38740.5, 'TTE POLSKA SP Z.O.O', @OrderID OUTPUT
EXEC dbo.AddOrder '06012276  ','0001',' ',38761.5, 'TTE POLSKA SP Z.O.O', @OrderID OUTPUT
EXEC dbo.AddOrder '06012278  ','0001',' ',38752.5, 'TECUMSEH EUROPE S.A.', @OrderID OUTPUT
EXEC dbo.AddOrder '06012279  ','0001',' ',38752.5, 'TECUMSEH EUROPE S.A.', @OrderID OUTPUT
EXEC dbo.AddOrder '06012280  ','0001',' ',38752.5, 'TECUMSEH EUROPE S.A.', @OrderID OUTPUT
EXEC dbo.AddOrder '06012282  ','0001',' ',38753.5, 'TECUMSEH EUROPE S.A.', @OrderID OUTPUT
EXEC dbo.AddOrder '06012285  ','0001',' ',38756.5, 'CART.EMBAL. RHONE ALPES', @OrderID OUTPUT
EXEC dbo.AddOrder '06012288  ','0001',' ',38745.5, 'W. WIRTH GMBH', @OrderID OUTPUT
EXEC dbo.AddOrder '06012289  ','0001',' ',38746.5, 'SAE SERGE CHEVEAU', @OrderID OUTPUT
EXEC dbo.AddOrder '06012293  ','0001',' ',38749.5, 'DS SMITH KAYPAC', @OrderID OUTPUT
EXEC dbo.AddOrder '06012302  ','0001',' ',38742.5, 'NESTLE WATERS SUPPLY EST', @OrderID OUTPUT
EXEC dbo.AddOrder '06012307  ','0001',' ',38741.5, 'NESTLE WATERS SUPPLY EST', @OrderID OUTPUT
EXEC dbo.AddOrder '06012307  ','0001','a',38741.5, 'NESTLE WATERS SUPPLY EST', @OrderID OUTPUT
EXEC dbo.AddOrder '06012324  ','0001',' ',38739.5, 'GIKO KARTONAGEN GMBH', @OrderID OUTPUT
EXEC dbo.AddOrder '06012325  ','0001',' ',38739.5, 'GIKO KARTONAGEN GMBH', @OrderID OUTPUT
EXEC dbo.AddOrder '06012332  ','0001',' ',38738.5, 'DU PONT DE NEMOURS (FRAN', @OrderID OUTPUT
EXEC dbo.AddOrder '06012342  ','0001',' ',38762.5, 'H.J.LICHTENBERGER GMBH', @OrderID OUTPUT
EXEC dbo.AddOrder '06012359  ','0001',' ',38742.5, 'COGESAL MIKO-FSEUR 58488', @OrderID OUTPUT
EXEC dbo.AddOrder '06012360  ','0001',' ',38745.5, 'COGESAL MIKO-FSEUR 58488', @OrderID OUTPUT
EXEC dbo.AddOrder '06012361  ','0001',' ',38746.5, 'COGESAL MIKO-FSEUR 58488', @OrderID OUTPUT
EXEC dbo.AddOrder '06012363  ','0001',' ',38738.5, 'DOW AGROSCIENCES SWITERL', @OrderID OUTPUT
EXEC dbo.AddOrder '06012364  ','0001',' ',38738.5, 'DOW AGROSCIENCES SWITERL', @OrderID OUTPUT
EXEC dbo.AddOrder '06012366  ','0001',' ',38739.5, 'DOW AGROSCIENCES SWITERL', @OrderID OUTPUT
EXEC dbo.AddOrder '06012367  ','0001',' ',38738.5, 'DOW AGROSCIENCES SWITERL', @OrderID OUTPUT
EXEC dbo.AddOrder '06012368  ','0001',' ',38738.5, 'DOW AGROSCIENCES SWITERL', @OrderID OUTPUT
EXEC dbo.AddOrder '06012374  ','0001',' ',38738.5, 'DOW AGROSCIENCES SWITERL', @OrderID OUTPUT
EXEC dbo.AddOrder '06012378  ','0001',' ',38741.5, 'COGESAL MIKO-FSEUR 58488', @OrderID OUTPUT
EXEC dbo.AddOrder '06012379  ','0001',' ',38746.5, 'COGESAL MIKO-FSEUR 58488', @OrderID OUTPUT
EXEC dbo.AddOrder '06012380  ','0001',' ',38746.5, 'COGESAL MIKO-FSEUR 58488', @OrderID OUTPUT
EXEC dbo.AddOrder '06012381  ','0001',' ',38747.5, 'COGESAL MIKO-FSEUR 58488', @OrderID OUTPUT
EXEC dbo.AddOrder '06012383  ','0001',' ',38741.5, 'COGESAL MIKO-FSEUR 58488', @OrderID OUTPUT
EXEC dbo.AddOrder '06012384  ','0001',' ',38742.5, 'COGESAL MIKO-FSEUR 58488', @OrderID OUTPUT
EXEC dbo.AddOrder '06012385  ','0001',' ',38745.5, 'COGESAL MIKO-FSEUR 58488', @OrderID OUTPUT
EXEC dbo.AddOrder '06012387  ','0001',' ',38748.5, 'JDW HOLDING GMBH', @OrderID OUTPUT
EXEC dbo.AddOrder '06012388  ','0001',' ',38748.5, 'JDW HOLDING GMBH', @OrderID OUTPUT
EXEC dbo.AddOrder '06012389  ','0001',' ',38748.5, 'JDW HOLDING GMBH', @OrderID OUTPUT
EXEC dbo.AddOrder '06012391  ','0001',' ',38742.5, 'COGESAL MIKO-FSEUR 58488', @OrderID OUTPUT
EXEC dbo.AddOrder '06012392  ','0001',' ',38745.5, 'COGESAL MIKO-FSEUR 58488', @OrderID OUTPUT
EXEC dbo.AddOrder '06012395  ','0001',' ',38745.5, 'COGESAL MIKO-FSEUR 58488', @OrderID OUTPUT
EXEC dbo.AddOrder '06012397  ','0001',' ',38742.5, 'COGESAL MIKO-FSEUR 58488', @OrderID OUTPUT
EXEC dbo.AddOrder '06012398  ','0001',' ',38745.5, 'COGESAL MIKO-FSEUR 58488', @OrderID OUTPUT
EXEC dbo.AddOrder '06012401  ','0001',' ',38738.5, 'DOW AGROSCIENCES', @OrderID OUTPUT
EXEC dbo.AddOrder '06012403  ','0001',' ',38738.5, 'DOW AGROSCIENCES', @OrderID OUTPUT
EXEC dbo.AddOrder '06012404  ','0001',' ',38738.5, 'DOW AGROSCIENCES', @OrderID OUTPUT
EXEC dbo.AddOrder '06012406  ','0001',' ',38738.5, 'DOW AGROSCIENCES', @OrderID OUTPUT
EXEC dbo.AddOrder '06012410  ','0001',' ',38738.5, 'DOW AGROSCIENCES', @OrderID OUTPUT
EXEC dbo.AddOrder '06012417  ','0001',' ',38738.5, 'DOW AGROSCIENCES', @OrderID OUTPUT
EXEC dbo.AddOrder '06012420  ','0001',' ',38742.5, 'COGESAL MIKO-FSEUR 58488', @OrderID OUTPUT
EXEC dbo.AddOrder '06012422  ','0001',' ',38747.5, 'COGESAL MIKO-FSEUR 58488', @OrderID OUTPUT
EXEC dbo.AddOrder '06012424  ','0001',' ',38746.5, 'COGESAL MIKO-FSEUR 58488', @OrderID OUTPUT
EXEC dbo.AddOrder '06012433  ','0001',' ',38742.5, 'S.M.A.E. ZI METZ BORNY (', @OrderID OUTPUT
EXEC dbo.AddOrder '06012434  ','0001',' ',38742.5, 'S.M.A.E. ZI METZ BORNY (', @OrderID OUTPUT
EXEC dbo.AddOrder '06012435  ','0001',' ',38742.5, 'S.M.A.E. ZI METZ BORNY (', @OrderID OUTPUT
EXEC dbo.AddOrder '06012436  ','0001',' ',38742.5, 'S.M.A.E. ZI METZ BORNY (', @OrderID OUTPUT
EXEC dbo.AddOrder '06012437  ','0001',' ',38742.5, 'S.M.A.E. ZI METZ BORNY (', @OrderID OUTPUT
EXEC dbo.AddOrder '06012439  ','0001',' ',38742.5, 'S.M.A.E. ZI METZ BORNY (', @OrderID OUTPUT
EXEC dbo.AddOrder '06012441  ','0001',' ',38742.5, 'S.M.A.E. ZI METZ BORNY (', @OrderID OUTPUT
EXEC dbo.AddOrder '06012443  ','0001',' ',38742.5, 'S.M.A.E. ZI METZ BORNY (', @OrderID OUTPUT
EXEC dbo.AddOrder '06012444  ','0001',' ',38742.5, 'S.M.A.E. ZI METZ BORNY (', @OrderID OUTPUT
EXEC dbo.AddOrder '06012445  ','0001',' ',38742.5, 'S.M.A.E. ZI METZ BORNY (', @OrderID OUTPUT
EXEC dbo.AddOrder '06012446  ','0001',' ',38742.5, 'S.M.A.E. ZI METZ BORNY (', @OrderID OUTPUT
EXEC dbo.AddOrder '06012447  ','0001',' ',38742.5, 'S.M.A.E. ZI METZ BORNY (', @OrderID OUTPUT
EXEC dbo.AddOrder '06012453  ','0001',' ',38739.5, 'GEORGIA-PACIFIC FRANCE', @OrderID OUTPUT
EXEC dbo.AddOrder '06012455  ','0001',' ',38752.5, 'BRASSERIE FISCHER SA', @OrderID OUTPUT
EXEC dbo.AddOrder '06012457  ','0001',' ',38745.5, 'DS SMITH KAYPAC', @OrderID OUTPUT
EXEC dbo.AddOrder '06012461  ','0001',' ',38748.5, 'D.P.F. DIFFUS.PREST.FIAB', @OrderID OUTPUT
EXEC dbo.AddOrder '06012462  ','0001',' ',38748.5, 'D.P.F. DIFFUS.PREST.FIAB', @OrderID OUTPUT
EXEC dbo.AddOrder '06012465  ','0001',' ',38741.5, 'BRASSERIE FISCHER SA', @OrderID OUTPUT
EXEC dbo.AddOrder '06012467  ','0001',' ',38741.5, 'OTTO RAUHUT GMBH & CO', @OrderID OUTPUT
EXEC dbo.AddOrder '06012479  ','0001',' ',38754.5, 'ALUMINIUM-KONSTRUKTIONST', @OrderID OUTPUT
EXEC dbo.AddOrder '06012481  ','0001',' ',38749.5, 'AMMANN-SANDER SARL', @OrderID OUTPUT
EXEC dbo.AddOrder '06012482  ','0004',' ',38746.5, 'REHAU AG & CO', @OrderID OUTPUT
EXEC dbo.AddOrder '06012490  ','0001',' ',38746.5, 'COGESAL MIKO-FSEUR 58488', @OrderID OUTPUT
EXEC dbo.AddOrder '06012491  ','0001',' ',38747.5, 'COGESAL MIKO-FSEUR 58488', @OrderID OUTPUT
EXEC dbo.AddOrder '06012493  ','0001',' ',38742.5, 'COGESAL MIKO-FSEUR 58488', @OrderID OUTPUT
EXEC dbo.AddOrder '06012494  ','0001',' ',38745.5, 'COGESAL MIKO-FSEUR 58488', @OrderID OUTPUT
EXEC dbo.AddOrder '06012496  ','0001',' ',38747.5, 'COGESAL MIKO-FSEUR 58488', @OrderID OUTPUT
EXEC dbo.AddOrder '06012498  ','0001',' ',38756.5, 'WELL-PACK AG', @OrderID OUTPUT
EXEC dbo.AddOrder '06012503  ','0001',' ',38741.5, 'BRASSERIE FISCHER SA', @OrderID OUTPUT
EXEC dbo.AddOrder '06012516  ','0001',' ',38741.5, 'BRASSERIE FISCHER SA', @OrderID OUTPUT
EXEC dbo.AddOrder '06012546  ','0001',' ',38747.5, 'SCHWEITZER S.A.', @OrderID OUTPUT
EXEC dbo.AddOrder '06012547  ','0001',' ',38745.5, 'SCHWEITZER S.A.', @OrderID OUTPUT
EXEC dbo.AddOrder '06012548  ','0001',' ',38745.5, 'SCHWEITZER S.A.', @OrderID OUTPUT
EXEC dbo.AddOrder '06012552  ','0001',' ',38760.5, 'DELIPAPIER', @OrderID OUTPUT
EXEC dbo.AddOrder '06012553  ','0001',' ',38760.5, 'DELIPAPIER', @OrderID OUTPUT
EXEC dbo.AddOrder '06012554  ','0001',' ',38762.5, 'DELIPAPIER', @OrderID OUTPUT
EXEC dbo.AddOrder '06012554  ','0001','a',38762.5, 'DELIPAPIER', @OrderID OUTPUT
EXEC dbo.AddOrder '06012570  ','0001',' ',38745.5, 'GEPAK W.GERNER GMBH', @OrderID OUTPUT
EXEC dbo.AddOrder '06012577  ','0001',' ',38741.5, 'BRASSERIE FISCHER SA', @OrderID OUTPUT
EXEC dbo.AddOrder '06012579  ','0001',' ',38741.5, 'BRASSERIE FISCHER SA', @OrderID OUTPUT
EXEC dbo.AddOrder '06012579  ','0001','a',38741.5, 'BRASSERIE FISCHER SA', @OrderID OUTPUT
EXEC dbo.AddOrder '06012581  ','0001',' ',38756.5, 'RICOH INDUSTRIE FRANCE', @OrderID OUTPUT
EXEC dbo.AddOrder '06012582  ','0001',' ',38745.5, 'BRASSERIE FISCHER SA', @OrderID OUTPUT
EXEC dbo.AddOrder '06012583  ','0001',' ',38748.5, 'RICOH INDUSTRIE FRANCE', @OrderID OUTPUT
EXEC dbo.AddOrder '06012584  ','0001',' ',38756.5, 'RICOH INDUSTRIE FRANCE', @OrderID OUTPUT
EXEC dbo.AddOrder '06012586  ','0001',' ',38745.5, 'RICOH INDUSTRIE FRANCE', @OrderID OUTPUT
EXEC dbo.AddOrder '06012595  ','0001',' ',38746.5, 'RICOH INDUSTRIE FRANCE', @OrderID OUTPUT
EXEC dbo.AddOrder '06012596  ','0001',' ',38746.5, 'RICOH INDUSTRIE FRANCE', @OrderID OUTPUT
EXEC dbo.AddOrder '06012597  ','0001',' ',38746.5, 'RICOH INDUSTRIE FRANCE', @OrderID OUTPUT
EXEC dbo.AddOrder '06012598  ','0001',' ',38746.5, 'RICOH INDUSTRIE FRANCE', @OrderID OUTPUT
EXEC dbo.AddOrder '06012599  ','0001',' ',38746.5, 'RICOH INDUSTRIE FRANCE', @OrderID OUTPUT
EXEC dbo.AddOrder '06012600  ','0001',' ',38746.5, 'RICOH INDUSTRIE FRANCE', @OrderID OUTPUT
EXEC dbo.AddOrder '06012605  ','0001',' ',38760.5, 'P&G INTERNATIONAL OPERAT', @OrderID OUTPUT
EXEC dbo.AddOrder '06012607  ','0001',' ',38762.5, 'P&G INTERNATIONAL OPERAT', @OrderID OUTPUT
EXEC dbo.AddOrder '06012609  ','0001',' ',38756.5, 'P&G INTERNATIONAL OPERAT', @OrderID OUTPUT
EXEC dbo.AddOrder '06012613  ','0001',' ',38747.5, 'COGESAL MIKO-FSEUR 58488', @OrderID OUTPUT
EXEC dbo.AddOrder '06012614  ','0001',' ',38753.5, 'COGESAL MIKO-FSEUR 58488', @OrderID OUTPUT
EXEC dbo.AddOrder '06012616  ','0001',' ',38745.5, 'P&G INTERNATIONAL OPERAT', @OrderID OUTPUT
EXEC dbo.AddOrder '06012627  ','0001',' ',38746.5, 'GEORGIA-PACIFIC FRANCE', @OrderID OUTPUT
EXEC dbo.AddOrder '06012630  ','0001',' ',38746.5, 'GEORGIA-PACIFIC FRANCE', @OrderID OUTPUT
EXEC dbo.AddOrder '06012631  ','0001',' ',38752.5, 'DU PONT DE NEMOURS (FRAN', @OrderID OUTPUT
EXEC dbo.AddOrder '06012634  ','0001',' ',38746.5, 'SOFLOG-SOFEMBAL', @OrderID OUTPUT
EXEC dbo.AddOrder '06012635  ','0001',' ',38748.5, 'SOFLOG-SOFEMBAL', @OrderID OUTPUT
EXEC dbo.AddOrder '06012638  ','0001',' ',38746.5, 'GEORGIA-PACIFIC FRANCE', @OrderID OUTPUT
EXEC dbo.AddOrder '06012647  ','0001',' ',38738.5, 'DOW-AGROSCIENCES B.V', @OrderID OUTPUT
EXEC dbo.AddOrder '06012648  ','0001',' ',38738.5, 'DOW-AGROSCIENCES B.V', @OrderID OUTPUT
EXEC dbo.AddOrder '06012653  ','0001',' ',38745.5, 'TRISS SPOL.S.R.O.', @OrderID OUTPUT
EXEC dbo.AddOrder '06012654  ','0001',' ',38741.5, 'TRISS SPOL.S.R.O.', @OrderID OUTPUT
EXEC dbo.AddOrder '06012661  ','0001',' ',38760.5, 'PEUGEOT CITROEN AUTOMOBI', @OrderID OUTPUT
EXEC dbo.AddOrder '06012663  ','0001',' ',38747.5, 'DS SMITH KAYPAC', @OrderID OUTPUT
EXEC dbo.AddOrder '06012664  ','0001',' ',38748.5, 'DS SMITH KAYPAC', @OrderID OUTPUT
EXEC dbo.AddOrder '06012670  ','0001',' ',38742.5, 'S.M.A.E. ZI METZ BORNY (', @OrderID OUTPUT
EXEC dbo.AddOrder '06012671  ','0001',' ',38742.5, 'S.M.A.E. ZI METZ BORNY (', @OrderID OUTPUT
EXEC dbo.AddOrder '06012672  ','0001',' ',38742.5, 'S.M.A.E. ZI METZ BORNY (', @OrderID OUTPUT
EXEC dbo.AddOrder '06012673  ','0001',' ',38742.5, 'S.M.A.E. ZI METZ BORNY (', @OrderID OUTPUT
EXEC dbo.AddOrder '06012674  ','0001',' ',38742.5, 'S.M.A.E. ZI METZ BORNY (', @OrderID OUTPUT
EXEC dbo.AddOrder '06012676  ','0001',' ',38742.5, 'S.M.A.E. ZI METZ BORNY (', @OrderID OUTPUT
EXEC dbo.AddOrder '06012677  ','0001',' ',38742.5, 'S.M.A.E. ZI METZ BORNY (', @OrderID OUTPUT
EXEC dbo.AddOrder '06012678  ','0001',' ',38742.5, 'S.M.A.E. ZI METZ BORNY (', @OrderID OUTPUT
EXEC dbo.AddOrder '06012680  ','0001',' ',38742.5, 'S.M.A.E. ZI METZ BORNY (', @OrderID OUTPUT
EXEC dbo.AddOrder '06012681  ','0001',' ',38742.5, 'S.M.A.E. ZI METZ BORNY (', @OrderID OUTPUT
EXEC dbo.AddOrder '06012682  ','0001',' ',38742.5, 'S.M.A.E. ZI METZ BORNY (', @OrderID OUTPUT
EXEC dbo.AddOrder '06012688  ','0001',' ',38749.5, 'JACO', @OrderID OUTPUT
EXEC dbo.AddOrder '06012690  ','0001',' ',38747.5, 'MAHLE VENTIELTRIEB GMBH', @OrderID OUTPUT
EXEC dbo.AddOrder '06012692  ','0001',' ',38747.5, 'ELCO SHARED SERVICES GMB', @OrderID OUTPUT
EXEC dbo.AddOrder '06012697  ','0001',' ',38746.5, 'MGLAS AG', @OrderID OUTPUT
EXEC dbo.AddOrder '06012698  ','0001',' ',38746.5, 'WELL-PACK AG', @OrderID OUTPUT
EXEC dbo.AddOrder '06012705  ','0001',' ',38760.5, 'WIRTH VERPACKUNGEN GMBH', @OrderID OUTPUT
EXEC dbo.AddOrder '06012710  ','0001',' ',38754.5, 'NOVA INNOVENE INTERNATIO', @OrderID OUTPUT
EXEC dbo.AddOrder '06012711  ','0001',' ',38755.5, 'NOVA INNOVENE INTERNATIO', @OrderID OUTPUT
EXEC dbo.AddOrder '06012714  ','0001',' ',38763.5, 'NOVA INNOVENE INTERNATIO', @OrderID OUTPUT
EXEC dbo.AddOrder '06012714  ','0001','a',38770.5, 'NOVA INNOVENE INTERNATIO', @OrderID OUTPUT
EXEC dbo.AddOrder '06012715  ','0001',' ',38762.5, 'NOVA INNOVENE INTERNATIO', @OrderID OUTPUT
EXEC dbo.AddOrder '06012719  ','0001',' ',38763.5, 'NOVA INNOVENE INTERNATIO', @OrderID OUTPUT
EXEC dbo.AddOrder '06012719  ','0001','a',38763.5, 'NOVA INNOVENE INTERNATIO', @OrderID OUTPUT
EXEC dbo.AddOrder '06012720  ','0001',' ',38774.5, 'NOVA INNOVENE INTERNATIO', @OrderID OUTPUT
EXEC dbo.AddOrder '06012723  ','0001',' ',38768.5, 'KNIPP GMBH', @OrderID OUTPUT
EXEC dbo.AddOrder '06012724  ','0001',' ',38895.5, 'KNIPP GMBH', @OrderID OUTPUT
EXEC dbo.AddOrder '06012726  ','0001',' ',38748.5, 'DS SMITH KAYPAC', @OrderID OUTPUT
EXEC dbo.AddOrder '06012727  ','0001',' ',38742.5, 'SARKOS S.A.', @OrderID OUTPUT
EXEC dbo.AddOrder '06012728  ','0001',' ',38742.5, 'SARKOS S.A.', @OrderID OUTPUT
EXEC dbo.AddOrder '06012734  ','0001',' ',38755.5, 'H.J.LICHTENBERGER GMBH', @OrderID OUTPUT
EXEC dbo.AddOrder '06012735  ','0001',' ',38740.5, 'DOW AGROSCIENCES SWITZEL', @OrderID OUTPUT
EXEC dbo.AddOrder '06012738  ','0001',' ',38760.5, 'WIRTH VERPACKUNGEN GMBH', @OrderID OUTPUT
EXEC dbo.AddOrder '06012739  ','0001',' ',38748.5, 'TTE POLSKA SP Z.O.O', @OrderID OUTPUT
EXEC dbo.AddOrder '06012742  ','0001',' ',38739.5, 'SCHWEITZER S.A.', @OrderID OUTPUT
EXEC dbo.AddOrder '06012746  ','0001',' ',38748.5, 'P&G INTERNATIONAL OPERAT', @OrderID OUTPUT
EXEC dbo.AddOrder '06012748  ','0001',' ',38754.5, 'RICOH INDUSTRIE FRANCE', @OrderID OUTPUT
EXEC dbo.AddOrder '06012749  ','0001',' ',38749.5, 'P&G INTERNATIONAL OPERAT', @OrderID OUTPUT
EXEC dbo.AddOrder '06012751  ','0001',' ',38748.5, 'P&G INTERNATIONAL OPERAT', @OrderID OUTPUT
EXEC dbo.AddOrder '06012754  ','0001',' ',38753.5, 'P&G INTERNATIONAL OPERAT', @OrderID OUTPUT
EXEC dbo.AddOrder '06012757  ','0001',' ',38783.5, 'DIEFENBACH VERPACKUNGEN', @OrderID OUTPUT
EXEC dbo.AddOrder '06012758  ','0001',' ',38776.5, 'DIEFENBACH VERPACKUNGEN', @OrderID OUTPUT
EXEC dbo.AddOrder '06012760  ','0001',' ',38776.5, 'DIEFENBACH VERPACKUNGEN', @OrderID OUTPUT
EXEC dbo.AddOrder '06012761  ','0001',' ',38745.5, 'P&G INTERNATIONAL OPERAT', @OrderID OUTPUT
EXEC dbo.AddOrder '06012762  ','0001',' ',38762.5, 'DIEFENBACH VERPACKUNGEN', @OrderID OUTPUT
EXEC dbo.AddOrder '06012765  ','0001',' ',38746.5, 'P&G INTERNATIONAL OPERAT', @OrderID OUTPUT
EXEC dbo.AddOrder '06012765  ','0001','a',38746.5, 'P&G INTERNATIONAL OPERAT', @OrderID OUTPUT
EXEC dbo.AddOrder '06012767  ','0001',' ',38755.5, 'P&G INTERNATIONAL OPERAT', @OrderID OUTPUT
EXEC dbo.AddOrder '06012769  ','0001',' ',38752.5, 'P&G INTERNATIONAL OPERAT', @OrderID OUTPUT
EXEC dbo.AddOrder '06012773  ','0001',' ',38745.5, 'P&G INTERNATIONAL OPERAT', @OrderID OUTPUT
EXEC dbo.AddOrder '06012775  ','0001',' ',38740.5, 'COGESAL MIKO-FSEUR 58488', @OrderID OUTPUT
EXEC dbo.AddOrder '06012780  ','0001',' ',38752.5, 'P&G INTERNATIONAL OPERAT', @OrderID OUTPUT
EXEC dbo.AddOrder '06012783  ','0001',' ',38762.5, 'P&G INTERNATIONAL OPERAT', @OrderID OUTPUT
EXEC dbo.AddOrder '06012785  ','0001',' ',38752.5, 'P&G INTERNATIONAL OPERAT', @OrderID OUTPUT
EXEC dbo.AddOrder '06012788  ','0001',' ',38762.5, 'P&G INTERNATIONAL OPERAT', @OrderID OUTPUT
EXEC dbo.AddOrder '06012790  ','0001',' ',38762.5, 'DIEFENBACH VERPACKUNGEN', @OrderID OUTPUT
EXEC dbo.AddOrder '06012791  ','0001',' ',38747.5, 'CARTONNAGES ROSET', @OrderID OUTPUT
EXEC dbo.AddOrder '06012793  ','0001',' ',38742.5, 'P&G INTERNATIONAL OPERAT', @OrderID OUTPUT
EXEC dbo.AddOrder '06012795  ','0001',' ',38749.5, 'P&G INTERNATIONAL OPERAT', @OrderID OUTPUT
EXEC dbo.AddOrder '06012796  ','0001',' ',38753.5, 'DIEFENBACH VERPACKUNGEN', @OrderID OUTPUT
EXEC dbo.AddOrder '06012798  ','0001',' ',38742.5, 'P&G INTERNATIONAL OPERAT', @OrderID OUTPUT
EXEC dbo.AddOrder '06012800  ','0001',' ',38746.5, 'P&G INTERNATIONAL OPERAT', @OrderID OUTPUT
EXEC dbo.AddOrder '06012802  ','0001',' ',38747.5, 'P&G INTERNATIONAL OPERAT', @OrderID OUTPUT
EXEC dbo.AddOrder '06012807  ','0001',' ',38781.5, 'DIEFENBACH VERPACKUNGEN', @OrderID OUTPUT
EXEC dbo.AddOrder '06012808  ','0001',' ',38746.5, 'P&G INTERNATIONAL OPERAT', @OrderID OUTPUT
EXEC dbo.AddOrder '06012810  ','0001',' ',38748.5, 'P&G INTERNATIONAL OPERAT', @OrderID OUTPUT
EXEC dbo.AddOrder '06012813  ','0001',' ',38748.5, 'P&G INTERNATIONAL OPERAT', @OrderID OUTPUT
EXEC dbo.AddOrder '06012816  ','0001',' ',38780.5, 'DIEFENBACH VERPACKUNGEN', @OrderID OUTPUT
EXEC dbo.AddOrder '06012816  ','0001','a',38780.5, 'DIEFENBACH VERPACKUNGEN', @OrderID OUTPUT
EXEC dbo.AddOrder '06012817  ','0001',' ',38759.5, 'BUBENDORFF VOLET ROULANT', @OrderID OUTPUT
EXEC dbo.AddOrder '06012820  ','0001',' ',38745.5, 'P&G INTERNATIONAL OPERAT', @OrderID OUTPUT
EXEC dbo.AddOrder '06012822  ','0001',' ',38746.5, 'P&G INTERNATIONAL OPERAT', @OrderID OUTPUT
EXEC dbo.AddOrder '06012824  ','0001',' ',38756.5, 'P&G INTERNATIONAL OPERAT', @OrderID OUTPUT
EXEC dbo.AddOrder '06012834  ','0001',' ',38768.5, 'P&G INTERNATIONAL OPERAT', @OrderID OUTPUT
EXEC dbo.AddOrder '06012836  ','0001',' ',38755.5, 'FABI AUTOMOBILE', @OrderID OUTPUT
EXEC dbo.AddOrder '06012837  ','0001',' ',38755.5, 'FABI AUTOMOBILE', @OrderID OUTPUT
EXEC dbo.AddOrder '06012838  ','0001',' ',38755.5, 'FABI AUTOMOBILE', @OrderID OUTPUT
EXEC dbo.AddOrder '06012839  ','0001',' ',38755.5, 'FABI AUTOMOBILE', @OrderID OUTPUT
EXEC dbo.AddOrder '06012840  ','0001',' ',38755.5, 'FABI AUTOMOBILE', @OrderID OUTPUT
EXEC dbo.AddOrder '06012841  ','0001',' ',38754.5, 'P&G INTERNATIONAL OPERAT', @OrderID OUTPUT
EXEC dbo.AddOrder '06012843  ','0001',' ',38752.5, 'P&G INTERNATIONAL OPERAT', @OrderID OUTPUT
EXEC dbo.AddOrder '06012848  ','0001',' ',38739.5, 'P&G INTERNATIONAL OPERAT', @OrderID OUTPUT
EXEC dbo.AddOrder '06012848  ','0001','a',38739.5, 'P&G INTERNATIONAL OPERAT', @OrderID OUTPUT
EXEC dbo.AddOrder '06012850  ','0001',' ',38740.5, 'P&G INTERNATIONAL OPERAT', @OrderID OUTPUT
EXEC dbo.AddOrder '06012853  ','0001',' ',38752.5, 'P&G INTERNATIONAL OPERAT', @OrderID OUTPUT
EXEC dbo.AddOrder '06012857  ','0001',' ',38749.5, 'C.2.P.', @OrderID OUTPUT
EXEC dbo.AddOrder '06012858  ','0001',' ',38747.5, 'C.2.P.', @OrderID OUTPUT
EXEC dbo.AddOrder '06012860  ','0001',' ',38753.5, 'P&G INTERNATIONAL OPERAT', @OrderID OUTPUT
EXEC dbo.AddOrder '06012862  ','0001',' ',38745.5, 'DU PONT DE NEMOURS (FRAN', @OrderID OUTPUT
EXEC dbo.AddOrder '06012864  ','0001',' ',38754.5, 'P&G INTERNATIONAL OPERAT', @OrderID OUTPUT
EXEC dbo.AddOrder '06012869  ','0001',' ',38768.5, 'STE ALSA-CORK', @OrderID OUTPUT
EXEC dbo.AddOrder '06012873  ','0001',' ',38745.5, 'BRASSERIE FISCHER SA', @OrderID OUTPUT
EXEC dbo.AddOrder '06012878  ','0001',' ',38748.5, 'BRASSERIE FISCHER SA', @OrderID OUTPUT
EXEC dbo.AddOrder '06012880  ','0001',' ',38753.5, 'DU PONT DE NEMOURS (FRAN', @OrderID OUTPUT
EXEC dbo.AddOrder '06012882  ','0001',' ',38775.5, 'DU PONT DE NEMOURS (FRAN', @OrderID OUTPUT
EXEC dbo.AddOrder '06012884  ','0001',' ',38742.5, 'DU PONT DE NEMOURS (FRAN', @OrderID OUTPUT
EXEC dbo.AddOrder '06012886  ','0001',' ',38746.5, 'DU PONT DE NEMOURS (FRAN', @OrderID OUTPUT
EXEC dbo.AddOrder '06012888  ','0001',' ',38745.5, 'DU PONT DE NEMOURS (FRAN', @OrderID OUTPUT
EXEC dbo.AddOrder '06012892  ','0001',' ',38748.5, 'LABORATOIRE ALCON', @OrderID OUTPUT
EXEC dbo.AddOrder '06012893  ','0001',' ',38749.5, 'LABORATOIRE ALCON', @OrderID OUTPUT
EXEC dbo.AddOrder '06012894  ','0001',' ',38749.5, 'LABORATOIRE ALCON', @OrderID OUTPUT
EXEC dbo.AddOrder '06012895  ','0001',' ',38752.5, 'LABORATOIRE ALCON', @OrderID OUTPUT
EXEC dbo.AddOrder '06012896  ','0001',' ',38755.5, 'LABORATOIRE ALCON', @OrderID OUTPUT
EXEC dbo.AddOrder '06012904  ','0001',' ',38741.5, 'NESTLE WATERS SUPPLY EST', @OrderID OUTPUT
EXEC dbo.AddOrder '06012908  ','0001',' ',38742.5, 'GENERAL MOTORS STRASBOUR', @OrderID OUTPUT
EXEC dbo.AddOrder '06012911  ','0001',' ',38747.5, 'NORD REDUCTEURS', @OrderID OUTPUT
EXEC dbo.AddOrder '06012913  ','0001',' ',38739.5, 'R.V.I.PIECES DE RECHANGE', @OrderID OUTPUT
EXEC dbo.AddOrder '06012918  ','0001',' ',38754.5, 'S.A. V 33', @OrderID OUTPUT
EXEC dbo.AddOrder '06012920  ','0001',' ',38762.5, 'PRODENE KLINT ESPACE LEA', @OrderID OUTPUT
EXEC dbo.AddOrder '06012930  ','0001',' ',38740.5, 'DOW AGROSCIENCES', @OrderID OUTPUT
EXEC dbo.AddOrder '06012932  ','0001',' ',38749.5, 'PEUGEOT CITROEN AUTOMOBI', @OrderID OUTPUT
EXEC dbo.AddOrder '06012932  ','0001','a',38749.5, 'PEUGEOT CITROEN AUTOMOBI', @OrderID OUTPUT
EXEC dbo.AddOrder '06012933  ','0001',' ',38742.5, 'INTERGESTION', @OrderID OUTPUT
EXEC dbo.AddOrder '06012935  ','0001',' ',38745.5, 'FRANCE CONDITIONNEMENT', @OrderID OUTPUT
EXEC dbo.AddOrder '06012937  ','0001',' ',38749.5, 'GEORGIA-PACIFIC FRANCE', @OrderID OUTPUT
EXEC dbo.AddOrder '06012943  ','0001',' ',38748.5, 'WESTIFORM GMBH & CO.KG', @OrderID OUTPUT
EXEC dbo.AddOrder '06012947  ','0001',' ',38755.5, 'GEORGIA-PACIFIC FRANCE', @OrderID OUTPUT
EXEC dbo.AddOrder '06012948  ','0001',' ',38760.5, 'GEORGIA-PACIFIC FRANCE', @OrderID OUTPUT
EXEC dbo.AddOrder '06012950  ','0001',' ',38749.5, 'GEORGIA-PACIFIC FRANCE', @OrderID OUTPUT
EXEC dbo.AddOrder '06012956  ','0001',' ',38748.5, 'MGI COUTIER PLASTIQUE', @OrderID OUTPUT
EXEC dbo.AddOrder '06012959  ','0001',' ',38755.5, 'EMIL FREI GMBH & CO.', @OrderID OUTPUT
EXEC dbo.AddOrder '06012960  ','0001',' ',38742.5, 'TRISS SPOL.S.R.O.', @OrderID OUTPUT
EXEC dbo.AddOrder '06012962  ','0001',' ',38742.5, 'TRISS SPOL.S.R.O.', @OrderID OUTPUT
EXEC dbo.AddOrder '06012963  ','0001',' ',38742.5, 'TRISS SPOL.S.R.O.', @OrderID OUTPUT
EXEC dbo.AddOrder '06012964  ','0001',' ',38742.5, 'TRISS SPOL.S.R.O.', @OrderID OUTPUT
EXEC dbo.AddOrder '06012965  ','0001',' ',38742.5, 'TRISS SPOL.S.R.O.', @OrderID OUTPUT
EXEC dbo.AddOrder '06012966  ','0001',' ',38742.5, 'TRISS SPOL.S.R.O.', @OrderID OUTPUT
EXEC dbo.AddOrder '06012970  ','0001',' ',38755.5, 'TECUMSEH EUROPE S.A.', @OrderID OUTPUT
EXEC dbo.AddOrder '06012971  ','0001',' ',38749.5, 'TECUMSEH EUROPE S.A.', @OrderID OUTPUT
EXEC dbo.AddOrder '06012972  ','0001',' ',38755.5, 'TECUMSEH EUROPE S.A.', @OrderID OUTPUT
EXEC dbo.AddOrder '06012978  ','0001',' ',38747.5, 'DICESA SA', @OrderID OUTPUT
EXEC dbo.AddOrder '06012979  ','0001',' ',38747.5, 'WELL-PACK AG', @OrderID OUTPUT
EXEC dbo.AddOrder '06012984  ','0001',' ',38781.5, 'ST GOBAIN VETROTEX FRANC', @OrderID OUTPUT
EXEC dbo.AddOrder '06012986  ','0001',' ',38747.5, 'GEORGIA-PACIFIC FRANCE', @OrderID OUTPUT
EXEC dbo.AddOrder '06012988  ','0001',' ',38755.5, 'FOREZ FOURME', @OrderID OUTPUT
EXEC dbo.AddOrder '06012992  ','0001',' ',38749.5, 'B.V.ALVERIMPORT', @OrderID OUTPUT
EXEC dbo.AddOrder '06012995  ','0001',' ',38768.5, 'B.V.ALVERIMPORT', @OrderID OUTPUT
EXEC dbo.AddOrder '06012997  ','0001',' ',38745.5, 'DS SMITH KAYSERSBERG', @OrderID OUTPUT
EXEC dbo.AddOrder '06012997  ','0001','b',38745.5, 'DS SMITH KAYSERSBERG', @OrderID OUTPUT
EXEC dbo.AddOrder '06012998  ','0001',' ',38749.5, 'DS SMITH KAYSERSBERG', @OrderID OUTPUT
EXEC dbo.AddOrder '06012999  ','0001',' ',38748.5, 'DS SMITH KAYSERSBERG', @OrderID OUTPUT
EXEC dbo.AddOrder '06013006  ','0001',' ',38742.5, 'TTE POLSKA SP Z.O.O', @OrderID OUTPUT
EXEC dbo.AddOrder '06013007  ','0001',' ',38760.5, 'TTE POLSKA SP Z.O.O', @OrderID OUTPUT
EXEC dbo.AddOrder '06013011  ','0001',' ',38761.5, 'ECLAIRAGE TECHNIQUE', @OrderID OUTPUT
EXEC dbo.AddOrder '06013013  ','0001',' ',38742.5, 'AUTOBAR FLEXIBLE PACKAGI', @OrderID OUTPUT
EXEC dbo.AddOrder '06013017  ','0001',' ',38770.5, 'FREUDENBERG VLIESSTOFFE', @OrderID OUTPUT
EXEC dbo.AddOrder '06013018  ','0001',' ',38770.5, 'FREUDENBERG VLIESSTOFFE', @OrderID OUTPUT
EXEC dbo.AddOrder '06013021  ','0001',' ',38760.5, 'MECANIQUE ET ENVIRONNEME', @OrderID OUTPUT
EXEC dbo.AddOrder '06013023  ','0001',' ',38789.5, 'STE ALSA-CORK', @OrderID OUTPUT
EXEC dbo.AddOrder '06013024  ','0001',' ',38789.5, 'STE ALSA-CORK', @OrderID OUTPUT
EXEC dbo.AddOrder '06013025  ','0001',' ',38756.5, 'STE ALSA-CORK', @OrderID OUTPUT
EXEC dbo.AddOrder '06013027  ','0001',' ',38746.5, 'DOW AGROSCIENCES SWITZEL', @OrderID OUTPUT
EXEC dbo.AddOrder '06013028  ','0001',' ',38746.5, 'DOW AGROSCIENCES SWITZEL', @OrderID OUTPUT
EXEC dbo.AddOrder '06013030  ','0001',' ',38755.5, 'BRASSERIE FISCHER SA', @OrderID OUTPUT
EXEC dbo.AddOrder '06013032  ','0001',' ',38747.5, 'NEUHAUSER', @OrderID OUTPUT
EXEC dbo.AddOrder '06013033  ','0001',' ',38747.5, 'NEUHAUSER', @OrderID OUTPUT
EXEC dbo.AddOrder '06013034  ','0001',' ',38747.5, 'NOVARTIS CONSUMER HEALTH', @OrderID OUTPUT
EXEC dbo.AddOrder '06013035  ','0001',' ',38749.5, 'NOVARTIS CONSUMER HEALTH', @OrderID OUTPUT
EXEC dbo.AddOrder '06013036  ','0001',' ',38749.5, 'NOVARTIS CONSUMER HEALTH', @OrderID OUTPUT
EXEC dbo.AddOrder '06013037  ','0001',' ',38749.5, 'NOVARTIS CONSUMER HEALTH', @OrderID OUTPUT
EXEC dbo.AddOrder '06013041  ','0001',' ',38742.5, 'NESTLE SUISSE S.A.', @OrderID OUTPUT
EXEC dbo.AddOrder '06013043  ','0001',' ',38756.5, 'NESTLE SUISSE S.A.', @OrderID OUTPUT
EXEC dbo.AddOrder '06013045  ','0001',' ',38754.5, 'NESTLE DEUTSCHLAND AG', @OrderID OUTPUT
EXEC dbo.AddOrder '06013047  ','0001',' ',38745.5, 'WELL-PACK AG', @OrderID OUTPUT
EXEC dbo.AddOrder '06013048  ','0001',' ',38748.5, 'DS SMITH KAYPAC', @OrderID OUTPUT
EXEC dbo.AddOrder '06013051  ','0001',' ',38747.5, 'DS SMITH KAYPAC', @OrderID OUTPUT
EXEC dbo.AddOrder '06013052  ','0001',' ',38748.5, 'DS SMITH KAYPAC', @OrderID OUTPUT
EXEC dbo.AddOrder '06013054  ','0001',' ',38741.5, 'B.V.ALVERIMPORT', @OrderID OUTPUT
EXEC dbo.AddOrder '06013054  ','0001','a',38747.5, 'B.V.ALVERIMPORT', @OrderID OUTPUT
EXEC dbo.AddOrder '06013056  ','0001',' ',38749.5, 'NOVARTIS CONSUMER HEALTH', @OrderID OUTPUT
EXEC dbo.AddOrder '06013060  ','0001',' ',38746.5, 'TILLOTTS PHARMA AG', @OrderID OUTPUT
EXEC dbo.AddOrder '06013062  ','0001',' ',38749.5, 'DU PONT DE NEMOURS S.A.', @OrderID OUTPUT
EXEC dbo.AddOrder '06013062  ','0001','a',38749.5, 'DU PONT DE NEMOURS S.A.', @OrderID OUTPUT
EXEC dbo.AddOrder '06013063  ','0001',' ',38787.5, 'DU PONT DE NEMOURS S.A.', @OrderID OUTPUT
EXEC dbo.AddOrder '06013065  ','0001',' ',38789.5, 'DU PONT DE NEMOURS S.A.', @OrderID OUTPUT
EXEC dbo.AddOrder '06013067  ','0001',' ',38748.5, 'DU PONT DE NEMOURS S.A.', @OrderID OUTPUT
EXEC dbo.AddOrder '06013069  ','0001',' ',38762.5, 'DU PONT DE NEMOURS S.A.', @OrderID OUTPUT
EXEC dbo.AddOrder '06013070  ','0001',' ',38787.5, 'DU PONT DE NEMOURS S.A.', @OrderID OUTPUT
EXEC dbo.AddOrder '06013072  ','0001',' ',38754.5, 'DU PONT DE NEMOURS S.A.', @OrderID OUTPUT
EXEC dbo.AddOrder '06013077  ','0001',' ',38745.5, 'CELLIER DES DAUPHINS', @OrderID OUTPUT
EXEC dbo.AddOrder '06013080  ','0001',' ',38748.5, 'DS SMITH KAYPAC', @OrderID OUTPUT
EXEC dbo.AddOrder '06013082  ','0001',' ',38754.5, 'TRISS SPOL.S.R.O.', @OrderID OUTPUT
EXEC dbo.AddOrder '06013094  ','0001',' ',38745.5, 'CDF EMBALLAGE SA', @OrderID OUTPUT
EXEC dbo.AddOrder '06013096  ','0001',' ',38740.5, 'NESTLE WATERS SUPPLY EST', @OrderID OUTPUT
EXEC dbo.AddOrder '06013098  ','0001',' ',38745.5, 'NESTLE WATERS SUPPLY EST', @OrderID OUTPUT
EXEC dbo.AddOrder '06013100  ','0001',' ',38742.5, 'NESTLE WATERS SUPPLY EST', @OrderID OUTPUT
EXEC dbo.AddOrder '06013102  ','0001',' ',38745.5, 'NESTLE WATERS SUPPLY EST', @OrderID OUTPUT
EXEC dbo.AddOrder '06013104  ','0001',' ',38746.5, 'NESTLE WATERS SUPPLY EST', @OrderID OUTPUT
EXEC dbo.AddOrder '06013106  ','0001',' ',38745.5, 'LABORATOIRE ALCON', @OrderID OUTPUT
EXEC dbo.AddOrder '06013109  ','0001',' ',38745.5, 'PEUGEOT CITROEN AUTOMOBI', @OrderID OUTPUT
EXEC dbo.AddOrder '06013109  ','0001','a',38745.5, 'PEUGEOT CITROEN AUTOMOBI', @OrderID OUTPUT
EXEC dbo.AddOrder '06013109  ','0001','b',38745.5, 'PEUGEOT CITROEN AUTOMOBI', @OrderID OUTPUT
EXEC dbo.AddOrder '06013113  ','0001',' ',38752.5, 'PEUGEOT CITROEN AUTOMOBI', @OrderID OUTPUT
EXEC dbo.AddOrder '06013113  ','0001','a',38752.5, 'PEUGEOT CITROEN AUTOMOBI', @OrderID OUTPUT
EXEC dbo.AddOrder '06013119  ','0001',' ',38742.5, 'S.M.A.E. ZI METZ BORNY (', @OrderID OUTPUT
EXEC dbo.AddOrder '06013120  ','0001',' ',38746.5, 'S.M.A.E. ZI METZ BORNY (', @OrderID OUTPUT
EXEC dbo.AddOrder '06013121  ','0001',' ',38749.5, 'S.M.A.E. ZI METZ BORNY (', @OrderID OUTPUT
EXEC dbo.AddOrder '06013122  ','0001',' ',38753.5, 'S.M.A.E. ZI METZ BORNY (', @OrderID OUTPUT
EXEC dbo.AddOrder '06013123  ','0001',' ',38756.5, 'S.M.A.E. ZI METZ BORNY (', @OrderID OUTPUT
EXEC dbo.AddOrder '06013124  ','0001',' ',38760.5, 'S.M.A.E. ZI METZ BORNY (', @OrderID OUTPUT
EXEC dbo.AddOrder '06013125  ','0001',' ',38763.5, 'S.M.A.E. ZI METZ BORNY (', @OrderID OUTPUT
EXEC dbo.AddOrder '06013126  ','0001',' ',38767.5, 'S.M.A.E. ZI METZ BORNY (', @OrderID OUTPUT
EXEC dbo.AddOrder '06013128  ','0001',' ',38746.5, 'S.M.A.E. ZI METZ BORNY (', @OrderID OUTPUT
EXEC dbo.AddOrder '06013129  ','0001',' ',38746.5, 'S.M.A.E. ZI METZ BORNY (', @OrderID OUTPUT
EXEC dbo.AddOrder '06013130  ','0001',' ',38746.5, 'S.M.A.E. ZI METZ BORNY (', @OrderID OUTPUT
EXEC dbo.AddOrder '06013131  ','0001',' ',38746.5, 'S.M.A.E. ZI METZ BORNY (', @OrderID OUTPUT
EXEC dbo.AddOrder '06013132  ','0001',' ',38746.5, 'S.M.A.E. ZI METZ BORNY (', @OrderID OUTPUT
EXEC dbo.AddOrder '06013134  ','0001',' ',38746.5, 'S.M.A.E. ZI METZ BORNY (', @OrderID OUTPUT
EXEC dbo.AddOrder '06013136  ','0001',' ',38746.5, 'S.M.A.E. ZI METZ BORNY (', @OrderID OUTPUT
EXEC dbo.AddOrder '06013137  ','0001',' ',38746.5, 'S.M.A.E. ZI METZ BORNY (', @OrderID OUTPUT
EXEC dbo.AddOrder '06013138  ','0001',' ',38746.5, 'S.M.A.E. ZI METZ BORNY (', @OrderID OUTPUT
EXEC dbo.AddOrder '06013139  ','0001',' ',38746.5, 'S.M.A.E. ZI METZ BORNY (', @OrderID OUTPUT
EXEC dbo.AddOrder '06013140  ','0001',' ',38746.5, 'S.M.A.E. ZI METZ BORNY (', @OrderID OUTPUT
EXEC dbo.AddOrder '06013142  ','0001',' ',38753.5, 'S.M.A.E. ZI METZ BORNY (', @OrderID OUTPUT
EXEC dbo.AddOrder '06013143  ','0001',' ',38753.5, 'S.M.A.E. ZI METZ BORNY (', @OrderID OUTPUT
EXEC dbo.AddOrder '06013144  ','0001',' ',38753.5, 'S.M.A.E. ZI METZ BORNY (', @OrderID OUTPUT
EXEC dbo.AddOrder '06013145  ','0001',' ',38756.5, 'S.M.A.E. ZI METZ BORNY (', @OrderID OUTPUT
EXEC dbo.AddOrder '06013146  ','0001',' ',38756.5, 'S.M.A.E. ZI METZ BORNY (', @OrderID OUTPUT
EXEC dbo.AddOrder '06013147  ','0001',' ',38756.5, 'S.M.A.E. ZI METZ BORNY (', @OrderID OUTPUT
EXEC dbo.AddOrder '06013148  ','0001',' ',38760.5, 'S.M.A.E. ZI METZ BORNY (', @OrderID OUTPUT
EXEC dbo.AddOrder '06013149  ','0001',' ',38760.5, 'S.M.A.E. ZI METZ BORNY (', @OrderID OUTPUT
EXEC dbo.AddOrder '06013150  ','0001',' ',38760.5, 'S.M.A.E. ZI METZ BORNY (', @OrderID OUTPUT
EXEC dbo.AddOrder '06013151  ','0001',' ',38763.5, 'S.M.A.E. ZI METZ BORNY (', @OrderID OUTPUT
EXEC dbo.AddOrder '06013152  ','0001',' ',38763.5, 'S.M.A.E. ZI METZ BORNY (', @OrderID OUTPUT
EXEC dbo.AddOrder '06013153  ','0001',' ',38763.5, 'S.M.A.E. ZI METZ BORNY (', @OrderID OUTPUT
EXEC dbo.AddOrder '06013154  ','0001',' ',38767.5, 'S.M.A.E. ZI METZ BORNY (', @OrderID OUTPUT
EXEC dbo.AddOrder '06013155  ','0001',' ',38767.5, 'S.M.A.E. ZI METZ BORNY (', @OrderID OUTPUT
EXEC dbo.AddOrder '06013156  ','0001',' ',38767.5, 'S.M.A.E. ZI METZ BORNY (', @OrderID OUTPUT
EXEC dbo.AddOrder '06013157  ','0001',' ',38745.5, 'TIMKEN EUROPE', @OrderID OUTPUT
EXEC dbo.AddOrder '06013158  ','0001',' ',38745.5, 'TIMKEN EUROPE', @OrderID OUTPUT
EXEC dbo.AddOrder '06013162  ','0001',' ',38759.5, 'DIAGEO DEUTSCHLAND GMBH', @OrderID OUTPUT
EXEC dbo.AddOrder '06013163  ','0001',' ',38759.5, 'DIAGEO DEUTSCHLAND GMBH', @OrderID OUTPUT
EXEC dbo.AddOrder '06013165  ','0001',' ',38746.5, 'ROBOT COUPE', @OrderID OUTPUT
EXEC dbo.AddOrder '06013167  ','0001',' ',38747.5, 'CART.EMBAL. RHONE ALPES', @OrderID OUTPUT
EXEC dbo.AddOrder '06013172  ','0001',' ',38746.5, 'CARTON PLUS', @OrderID OUTPUT
EXEC dbo.AddOrder '06013173  ','0001',' ',38746.5, 'CARTON PLUS', @OrderID OUTPUT
EXEC dbo.AddOrder '06013178  ','0001',' ',38745.5, 'CARTONNAGES BERTRAND - N', @OrderID OUTPUT
EXEC dbo.AddOrder '06013179  ','0001',' ',38745.5, 'CARTONNAGES BERTRAND - N', @OrderID OUTPUT
EXEC dbo.AddOrder '06013181  ','0001',' ',38742.5, 'BRASSERIE FISCHER SA', @OrderID OUTPUT
EXEC dbo.AddOrder '06013183  ','0001',' ',38747.5, 'SAINT GOBAIN ISOVER', @OrderID OUTPUT
EXEC dbo.AddOrder '06013186  ','0001',' ',38748.5, 'GE-LIGHTING', @OrderID OUTPUT
EXEC dbo.AddOrder '06013187  ','0001',' ',38748.5, 'GE-LIGHTING', @OrderID OUTPUT
EXEC dbo.AddOrder '06013189  ','0001',' ',38747.5, 'VISTEON SYSTEMES INTERIE', @OrderID OUTPUT
EXEC dbo.AddOrder '06013189  ','0001','b',38747.5, 'VISTEON SYSTEMES INTERIE', @OrderID OUTPUT
EXEC dbo.AddOrder '06013194  ','0001',' ',38755.5, 'B.V.ALVERIMPORT', @OrderID OUTPUT
EXEC dbo.AddOrder '06013200  ','0001',' ',38745.5, 'VISTEON SYSTEMES INTERIE', @OrderID OUTPUT
EXEC dbo.AddOrder '06013202  ','0001',' ',38756.5, 'ATELIERS BUSCH & CIE', @OrderID OUTPUT
EXEC dbo.AddOrder '06013203  ','0001',' ',38756.5, 'ATELIERS BUSCH & CIE', @OrderID OUTPUT
EXEC dbo.AddOrder '06013205  ','0001',' ',38752.5, 'DS SMITH KAYPAC', @OrderID OUTPUT
EXEC dbo.AddOrder '06013206  ','0001',' ',38752.5, 'DS SMITH KAYPAC', @OrderID OUTPUT
EXEC dbo.AddOrder '06013208  ','0001',' ',38739.5, 'NESTLE WATERS SUPPLY EST', @OrderID OUTPUT
EXEC dbo.AddOrder '06013209  ','0001',' ',38754.5, 'ATELIERS BUSCH & CIE', @OrderID OUTPUT
EXEC dbo.AddOrder '06013210  ','0001',' ',38745.5, 'ATELIERS BUSCH & CIE', @OrderID OUTPUT
EXEC dbo.AddOrder '06013211  ','0001',' ',38742.5, 'ATELIERS BUSCH & CIE', @OrderID OUTPUT
EXEC dbo.AddOrder '06013213  ','0001',' ',38746.5, 'ATELIERS BUSCH & CIE', @OrderID OUTPUT
EXEC dbo.AddOrder '06013214  ','0001',' ',38746.5, 'ATELIERS BUSCH & CIE', @OrderID OUTPUT
EXEC dbo.AddOrder '06013219  ','0001',' ',38742.5, 'RICOH INDUSTRIE FRANCE', @OrderID OUTPUT
EXEC dbo.AddOrder '06013221  ','0001',' ',38740.5, 'GIKO KARTONAGEN GMBH', @OrderID OUTPUT
EXEC dbo.AddOrder '06013221  ','0001','b',38740.5, 'GIKO KARTONAGEN GMBH', @OrderID OUTPUT
EXEC dbo.AddOrder '06013225  ','0001',' ',38746.5, 'GEFCO SA POUR PMTC', @OrderID OUTPUT
EXEC dbo.AddOrder '06013226  ','0001',' ',38746.5, 'GEFCO SA POUR PMTC', @OrderID OUTPUT
EXEC dbo.AddOrder '06013227  ','0001',' ',38742.5, 'GEFCO SA POUR PMTC', @OrderID OUTPUT
EXEC dbo.AddOrder '06013229  ','0001',' ',38755.5, 'STE MOBOIS', @OrderID OUTPUT
EXEC dbo.AddOrder '06013230  ','0001',' ',38755.5, 'STE MOBOIS', @OrderID OUTPUT
EXEC dbo.AddOrder '06013233  ','0001',' ',38759.5, 'POMPES GRUNDFOS FRANCE', @OrderID OUTPUT
EXEC dbo.AddOrder '06013234  ','0001',' ',38759.5, 'POMPES GRUNDFOS FRANCE', @OrderID OUTPUT
EXEC dbo.AddOrder '06013235  ','0001',' ',38752.5, 'LE FOURNIL DE FREDERIC', @OrderID OUTPUT
EXEC dbo.AddOrder '06013237  ','0001',' ',38756.5, 'LE FOURNIL DE FREDERIC', @OrderID OUTPUT
EXEC dbo.AddOrder '06013239  ','0001',' ',38755.5, 'LE FOURNIL DE FREDERIC', @OrderID OUTPUT
EXEC dbo.AddOrder '06013239  ','0001','a',38759.5, 'LE FOURNIL DE FREDERIC', @OrderID OUTPUT
EXEC dbo.AddOrder '06013241  ','0001',' ',38759.5, 'LE FOURNIL DE FREDERIC', @OrderID OUTPUT
EXEC dbo.AddOrder '06013249  ','0001',' ',38749.5, 'DS SMITH KAYPAC', @OrderID OUTPUT
EXEC dbo.AddOrder '06013252  ','0001',' ',38746.5, 'DS SMITH KAYPAC', @OrderID OUTPUT
EXEC dbo.AddOrder '06013254  ','0001',' ',38742.5, 'NESTLE WATERS SUPPLY EST', @OrderID OUTPUT
EXEC dbo.AddOrder '06013257  ','0001',' ',38749.5, 'DEUFOL GMBH', @OrderID OUTPUT
EXEC dbo.AddOrder '06013259  ','0001',' ',38753.5, 'GEORGIA-PACIFIC FRANCE', @OrderID OUTPUT
EXEC dbo.AddOrder '06013260  ','0001',' ',38753.5, 'GEORGIA-PACIFIC FRANCE', @OrderID OUTPUT
EXEC dbo.AddOrder '06013262  ','0001',' ',38748.5, 'GEORGIA-PACIFIC FRANCE', @OrderID OUTPUT
EXEC dbo.AddOrder '06013262  ','0001','a',38748.5, 'GEORGIA-PACIFIC FRANCE', @OrderID OUTPUT
EXEC dbo.AddOrder '06013266  ','0001',' ',38749.5, 'TRISS SPOL.S.R.O.', @OrderID OUTPUT
EXEC dbo.AddOrder '06013267  ','0001',' ',38749.5, 'TRISS SPOL.S.R.O.', @OrderID OUTPUT
EXEC dbo.AddOrder '06013267  ','0001','a',38760.5, 'TRISS SPOL.S.R.O.', @OrderID OUTPUT
EXEC dbo.AddOrder '06013269  ','0001',' ',38749.5, 'SOMFY', @OrderID OUTPUT
EXEC dbo.AddOrder '06013273  ','0001',' ',38746.5, 'NEUHAUSER', @OrderID OUTPUT
EXEC dbo.AddOrder '06013275  ','0001',' ',38756.5, 'NEUHAUSER', @OrderID OUTPUT
EXEC dbo.AddOrder '06013276  ','0001',' ',38759.5, 'BEKON-KORALLE AG', @OrderID OUTPUT
EXEC dbo.AddOrder '06013280  ','0001',' ',38761.5, 'BRENNER VERPACKUNG GMBH', @OrderID OUTPUT
EXEC dbo.AddOrder '06013286  ','0001',' ',38775.5, 'LABORATOIRES GALDERMA', @OrderID OUTPUT
EXEC dbo.AddOrder '06013287  ','0001',' ',38776.5, 'LABORATOIRES GALDERMA', @OrderID OUTPUT
EXEC dbo.AddOrder '06013288  ','0001',' ',38783.5, 'LABORATOIRES GALDERMA', @OrderID OUTPUT
EXEC dbo.AddOrder '06013290  ','0001',' ',38756.5, 'GEORGIA-PACIFIC FRANCE', @OrderID OUTPUT
EXEC dbo.AddOrder '06013291  ','0001',' ',38756.5, 'SAEP DIFFUSION', @OrderID OUTPUT
EXEC dbo.AddOrder '06013292  ','0001',' ',38755.5, 'SAEP DIFFUSION', @OrderID OUTPUT
EXEC dbo.AddOrder '06013292  ','0001','a',38760.5, 'SAEP DIFFUSION', @OrderID OUTPUT
EXEC dbo.AddOrder '06013295  ','0001',' ',38748.5, 'TECUMSEH EUROPE S.A.', @OrderID OUTPUT
EXEC dbo.AddOrder '06013296  ','0001',' ',38748.5, 'TECUMSEH EUROPE S.A.', @OrderID OUTPUT
EXEC dbo.AddOrder '06013297  ','0001',' ',38763.5, 'NEUHAUSER', @OrderID OUTPUT
EXEC dbo.AddOrder '06013308  ','0001',' ',38745.5, 'NESTLE WATERS SUPPLY EST', @OrderID OUTPUT
EXEC dbo.AddOrder '06013314  ','0001',' ',38746.5, 'BRASSERIES KRONENBOURG 5', @OrderID OUTPUT
EXEC dbo.AddOrder '06013316  ','0001',' ',38746.5, 'BRASSERIES KRONENBOURG 5', @OrderID OUTPUT
EXEC dbo.AddOrder '06013318  ','0001',' ',38742.5, 'BRASSERIES KRONENBOURG 5', @OrderID OUTPUT
EXEC dbo.AddOrder '06013321  ','0001',' ',38745.5, 'NESTLE WATERS SUPPLY EST', @OrderID OUTPUT
EXEC dbo.AddOrder '06013329  ','0001',' ',38742.5, 'NESTLE WATERS SUPPLY EST', @OrderID OUTPUT
EXEC dbo.AddOrder '06013331  ','0001',' ',38746.5, 'NESTLE WATERS SUPPLY EST', @OrderID OUTPUT
EXEC dbo.AddOrder '06013334  ','0001',' ',38749.5, 'NESTLE WATERS SUPPLY EST', @OrderID OUTPUT
EXEC dbo.AddOrder '06013336  ','0001',' ',38742.5, 'NESTLE WATERS SUPPLY EST', @OrderID OUTPUT
EXEC dbo.AddOrder '06013338  ','0001',' ',38745.5, 'NESTLE WATERS SUPPLY EST', @OrderID OUTPUT
EXEC dbo.AddOrder '06013340  ','0001',' ',38775.5, 'STE ALSA-CORK', @OrderID OUTPUT
EXEC dbo.AddOrder '06013341  ','0001',' ',38747.5, 'NESTLE WATERS SUPPLY EST', @OrderID OUTPUT
EXEC dbo.AddOrder '06013343  ','0001',' ',38754.5, 'STE ALSA-CORK', @OrderID OUTPUT
EXEC dbo.AddOrder '06013344  ','0001',' ',38741.5, 'NESTLE WATERS SUPPLY EST', @OrderID OUTPUT
EXEC dbo.AddOrder '06013347  ','0001',' ',38753.5, 'SA. BOULANGERIE NEUHAUSE', @OrderID OUTPUT
EXEC dbo.AddOrder '06013351  ','0001',' ',38745.5, 'TRISS SPOL.S.R.O.', @OrderID OUTPUT
EXEC dbo.AddOrder '06013353  ','0001',' ',38756.5, 'TRISS SPOL.S.R.O.', @OrderID OUTPUT
EXEC dbo.AddOrder '06013358  ','0001',' ',38747.5, 'PEUGEOT CITROEN AUTOMOBI', @OrderID OUTPUT
EXEC dbo.AddOrder '06013360  ','0001',' ',38774.5, 'LILLY FRANCE S.A.', @OrderID OUTPUT
EXEC dbo.AddOrder '06013361  ','0001',' ',38749.5, 'DS SMITH KAYPAC', @OrderID OUTPUT
EXEC dbo.AddOrder '06013363  ','0001',' ',38755.5, 'SESAM SNC', @OrderID OUTPUT
EXEC dbo.AddOrder '06013364  ','0001',' ',38766.5, 'LILLY FRANCE S.A.', @OrderID OUTPUT
EXEC dbo.AddOrder '06013370  ','0001',' ',38784.5, 'MEPHA AG', @OrderID OUTPUT
EXEC dbo.AddOrder '06013371  ','0001',' ',38805.5, 'MEPHA AG', @OrderID OUTPUT
EXEC dbo.AddOrder '06013372  ','0001',' ',38840.5, 'MEPHA AG', @OrderID OUTPUT
EXEC dbo.AddOrder '06013374  ','0001',' ',38746.5, 'NEUHAUSER', @OrderID OUTPUT
EXEC dbo.AddOrder '06013375  ','0001',' ',38747.5, 'THYSSENKRUPP PRESTA FRAN', @OrderID OUTPUT
EXEC dbo.AddOrder '06013376  ','0001',' ',38759.5, 'PEUGEOT CITROEN AUTOMOBI', @OrderID OUTPUT
EXEC dbo.AddOrder '06013385  ','0001',' ',38745.5, 'STE SIMU', @OrderID OUTPUT
EXEC dbo.AddOrder '06013387  ','0001',' ',38745.5, 'STE SIMU', @OrderID OUTPUT
EXEC dbo.AddOrder '06013389  ','0001',' ',38745.5, 'STE SIMU', @OrderID OUTPUT
EXEC dbo.AddOrder '06013392  ','0001',' ',38745.5, 'STE SIMU', @OrderID OUTPUT
EXEC dbo.AddOrder '06013395  ','0001',' ',38745.5, 'STE SIMU', @OrderID OUTPUT
EXEC dbo.AddOrder '06013397  ','0001',' ',38745.5, 'STE SIMU', @OrderID OUTPUT
EXEC dbo.AddOrder '06013401  ','0001',' ',38748.5, 'DS SMITH KAYSERSBERG', @OrderID OUTPUT
EXEC dbo.AddOrder '06013402  ','0001',' ',38761.5, 'MEPHA AG', @OrderID OUTPUT
EXEC dbo.AddOrder '06013406  ','0001',' ',38746.5, 'DS SMITH KAYSERSBERG', @OrderID OUTPUT
EXEC dbo.AddOrder '06013409  ','0001',' ',38748.5, 'DS SMITH KAYSERSBERG', @OrderID OUTPUT
EXEC dbo.AddOrder '06013411  ','0001',' ',38781.5, 'ORIS-FRANCE S.A.R.L', @OrderID OUTPUT
EXEC dbo.AddOrder '06013412  ','0001',' ',38760.5, 'WELL-PACK AG', @OrderID OUTPUT
EXEC dbo.AddOrder '06013418  ','0001',' ',38760.5, 'ALPLAST', @OrderID OUTPUT
EXEC dbo.AddOrder '06013419  ','0001',' ',38752.5, 'TIMKEN EUROPE', @OrderID OUTPUT
EXEC dbo.AddOrder '06013420  ','0001',' ',38742.5, 'TIMKEN EUROPE', @OrderID OUTPUT
EXEC dbo.AddOrder '06013423  ','0001',' ',38752.5, 'SCHWEITZER S.A.', @OrderID OUTPUT
EXEC dbo.AddOrder '06013424  ','0001',' ',38747.5, 'SCHWEITZER S.A.', @OrderID OUTPUT
EXEC dbo.AddOrder '06013426  ','0001',' ',38747.5, 'SCHWEITZER S.A.', @OrderID OUTPUT
EXEC dbo.AddOrder '06013429  ','0001',' ',38748.5, 'SCHWEITZER S.A.', @OrderID OUTPUT
EXEC dbo.AddOrder '06013431  ','0001',' ',38756.5, 'SCHWEITZER S.A.', @OrderID OUTPUT
EXEC dbo.AddOrder '06013433  ','0001',' ',38754.5, 'SCHWEITZER S.A.', @OrderID OUTPUT
EXEC dbo.AddOrder '06013435  ','0001',' ',38752.5, 'SCHWEITZER S.A.', @OrderID OUTPUT
EXEC dbo.AddOrder '06013438  ','0001',' ',38783.5, 'RIVELLA AG', @OrderID OUTPUT
EXEC dbo.AddOrder '06013439  ','0001',' ',38783.5, 'RIVELLA AG', @OrderID OUTPUT
EXEC dbo.AddOrder '06013440  ','0001',' ',38783.5, 'RIVELLA AG', @OrderID OUTPUT
EXEC dbo.AddOrder '06013441  ','0001',' ',38783.5, 'RIVELLA AG', @OrderID OUTPUT
EXEC dbo.AddOrder '06013442  ','0001',' ',38747.5, 'CART.EMBAL. RHONE ALPES', @OrderID OUTPUT
EXEC dbo.AddOrder '06013447  ','0001',' ',38753.5, 'ZF GETRIEBE GMBH', @OrderID OUTPUT
EXEC dbo.AddOrder '06013450  ','0001',' ',38783.5, 'PRODENE KLINT ESPACE LEA', @OrderID OUTPUT
EXEC dbo.AddOrder '06013451  ','0001',' ',38749.5, 'DS SMITH KAYPAC', @OrderID OUTPUT
EXEC dbo.AddOrder '06013453  ','0001',' ',38752.5, 'SCHWEITZER S.A.', @OrderID OUTPUT
EXEC dbo.AddOrder '06013454  ','0001',' ',38752.5, 'SCHWEITZER S.A.', @OrderID OUTPUT
EXEC dbo.AddOrder '06013454  ','0001','a',38756.5, 'SCHWEITZER S.A.', @OrderID OUTPUT
EXEC dbo.AddOrder '06013455  ','0001',' ',38752.5, 'DS SMITH KAYPAC', @OrderID OUTPUT
EXEC dbo.AddOrder '06013456  ','0001',' ',38754.5, 'DS SMITH KAYPAC', @OrderID OUTPUT
EXEC dbo.AddOrder '06013457  ','0001',' ',38754.5, 'DS SMITH KAYPAC', @OrderID OUTPUT
EXEC dbo.AddOrder '06013459  ','0001',' ',38754.5, 'DS SMITH KAYPAC', @OrderID OUTPUT
EXEC dbo.AddOrder '06013460  ','0001',' ',38745.5, 'CART.EMBAL. RHONE ALPES', @OrderID OUTPUT
EXEC dbo.AddOrder '06013460  ','0002',' ',38745.5, 'CART.EMBAL. RHONE ALPES', @OrderID OUTPUT
EXEC dbo.AddOrder '06013461  ','0001',' ',38752.5, 'NEUHAUSER', @OrderID OUTPUT
EXEC dbo.AddOrder '06013462  ','0001',' ',38756.5, 'SARKOS S.A.', @OrderID OUTPUT
EXEC dbo.AddOrder '06013463  ','0001',' ',38756.5, 'SARKOS S.A.', @OrderID OUTPUT
EXEC dbo.AddOrder '06013464  ','0001',' ',38756.5, 'SARKOS S.A.', @OrderID OUTPUT
EXEC dbo.AddOrder '06013466  ','0001',' ',38768.5, 'SARKOS S.A.', @OrderID OUTPUT
EXEC dbo.AddOrder '06013467  ','0001',' ',38768.5, 'SARKOS S.A.', @OrderID OUTPUT
EXEC dbo.AddOrder '06013471  ','0001',' ',38781.5, 'SARKOS S.A.', @OrderID OUTPUT
EXEC dbo.AddOrder '06013472  ','0001',' ',38781.5, 'SARKOS S.A.', @OrderID OUTPUT
EXEC dbo.AddOrder '06013474  ','0001',' ',38748.5, 'BRASSERIE FISCHER SA', @OrderID OUTPUT
EXEC dbo.AddOrder '06013481  ','0001',' ',38752.5, 'NEUHAUSER', @OrderID OUTPUT
EXEC dbo.AddOrder '06013482  ','0001',' ',38752.5, 'R. BOURGEOIS S.R', @OrderID OUTPUT
EXEC dbo.AddOrder '06013486  ','0001',' ',38773.5, 'EGON HUEBLER', @OrderID OUTPUT
EXEC dbo.AddOrder '06013487  ','0001',' ',38756.5, 'STE ALSA-CORK', @OrderID OUTPUT
EXEC dbo.AddOrder '06013491  ','0001',' ',38754.5, 'STE ALSA-CORK', @OrderID OUTPUT
EXEC dbo.AddOrder '06013492  ','0001',' ',38752.5, 'NEUHAUSER', @OrderID OUTPUT
EXEC dbo.AddOrder '06013493  ','0001',' ',38741.5, 'MGI COUTIER', @OrderID OUTPUT
EXEC dbo.AddOrder '06013495  ','0001',' ',38755.5, 'SA. BOULANGERIE NEUHAUSE', @OrderID OUTPUT
EXEC dbo.AddOrder '06013495  ','0001','a',38766.5, 'SA. BOULANGERIE NEUHAUSE', @OrderID OUTPUT
EXEC dbo.AddOrder '06013496  ','0001',' ',38755.5, 'SA. BOULANGERIE NEUHAUSE', @OrderID OUTPUT
EXEC dbo.AddOrder '06013499  ','0001',' ',38748.5, 'COGESAL MIKO-FSEUR 58488', @OrderID OUTPUT
EXEC dbo.AddOrder '06013499  ','0001','a',38748.5, 'COGESAL MIKO-FSEUR 58488', @OrderID OUTPUT
EXEC dbo.AddOrder '06013501  ','0001',' ',38748.5, 'COGESAL MIKO-FSEUR 58488', @OrderID OUTPUT
EXEC dbo.AddOrder '06013503  ','0001',' ',38748.5, 'COGESAL MIKO-FSEUR 58488', @OrderID OUTPUT
EXEC dbo.AddOrder '06013505  ','0001',' ',38748.5, 'COGESAL MIKO-FSEUR 58488', @OrderID OUTPUT
EXEC dbo.AddOrder '06013507  ','0001',' ',38766.5, 'DIEFENBACH VERPACKUNGEN', @OrderID OUTPUT
EXEC dbo.AddOrder '06013508  ','0001',' ',38748.5, 'COGESAL MIKO-FSEUR 58488', @OrderID OUTPUT
EXEC dbo.AddOrder '06013509  ','0001',' ',38755.5, 'SA. BOULANGERIE NEUHAUSE', @OrderID OUTPUT
EXEC dbo.AddOrder '06013510  ','0001',' ',38755.5, 'SA. BOULANGERIE NEUHAUSE', @OrderID OUTPUT
EXEC dbo.AddOrder '06013510  ','0001','a',38755.5, 'SA. BOULANGERIE NEUHAUSE', @OrderID OUTPUT
EXEC dbo.AddOrder '06013514  ','0001',' ',38776.5, 'DIEFENBACH VERPACKUNGEN', @OrderID OUTPUT
EXEC dbo.AddOrder '06013515  ','0001',' ',38752.5, 'DS SMITH KAYSERSBERG', @OrderID OUTPUT
EXEC dbo.AddOrder '06013517  ','0001',' ',38753.5, 'COGESAL MIKO-FSEUR 58488', @OrderID OUTPUT
EXEC dbo.AddOrder '06013518  ','0001',' ',38754.5, 'COGESAL MIKO-FSEUR 58488', @OrderID OUTPUT
EXEC dbo.AddOrder '06013521  ','0001',' ',38752.5, 'COGESAL MIKO-FSEUR 58488', @OrderID OUTPUT
EXEC dbo.AddOrder '06013522  ','0001',' ',38753.5, 'COGESAL MIKO-FSEUR 58488', @OrderID OUTPUT
EXEC dbo.AddOrder '06013523  ','0001',' ',38754.5, 'COGESAL MIKO-FSEUR 58488', @OrderID OUTPUT
EXEC dbo.AddOrder '06013523  ','0001','a',38754.5, 'COGESAL MIKO-FSEUR 58488', @OrderID OUTPUT
EXEC dbo.AddOrder '06013525  ','0001',' ',38753.5, 'COGESAL MIKO-FSEUR 58488', @OrderID OUTPUT
EXEC dbo.AddOrder '06013526  ','0001',' ',38754.5, 'COGESAL MIKO-FSEUR 58488', @OrderID OUTPUT
EXEC dbo.AddOrder '06013527  ','0001',' ',38752.5, 'DU PONT DE NEMOURS (FRAN', @OrderID OUTPUT
EXEC dbo.AddOrder '06013530  ','0001',' ',38749.5, 'COGESAL MIKO-FSEUR 58488', @OrderID OUTPUT
EXEC dbo.AddOrder '06013531  ','0001',' ',38753.5, 'COGESAL MIKO-FSEUR 58488', @OrderID OUTPUT
EXEC dbo.AddOrder '06013533  ','0001',' ',38749.5, 'COGESAL MIKO-FSEUR 58488', @OrderID OUTPUT
EXEC dbo.AddOrder '06013534  ','0001',' ',38752.5, 'COGESAL MIKO-FSEUR 58488', @OrderID OUTPUT
EXEC dbo.AddOrder '06013535  ','0001',' ',38755.5, 'COGESAL MIKO-FSEUR 58488', @OrderID OUTPUT
EXEC dbo.AddOrder '06013537  ','0001',' ',38752.5, 'DU PONT DE NEMOURS (FRAN', @OrderID OUTPUT
EXEC dbo.AddOrder '06013537  ','0001','a',38763.5, 'DU PONT DE NEMOURS (FRAN', @OrderID OUTPUT
EXEC dbo.AddOrder '06013537  ','0001','b',38752.5, 'DU PONT DE NEMOURS (FRAN', @OrderID OUTPUT
EXEC dbo.AddOrder '06013538  ','0001',' ',38754.5, 'COGESAL MIKO-FSEUR 58488', @OrderID OUTPUT
EXEC dbo.AddOrder '06013540  ','0001',' ',38749.5, 'COGESAL MIKO-FSEUR 58488', @OrderID OUTPUT
EXEC dbo.AddOrder '06013541  ','0001',' ',38752.5, 'COGESAL MIKO-FSEUR 58488', @OrderID OUTPUT
EXEC dbo.AddOrder '06013542  ','0001',' ',38753.5, 'COGESAL MIKO-FSEUR 58488', @OrderID OUTPUT
EXEC dbo.AddOrder '06013545  ','0001',' ',38754.5, 'COGESAL MIKO-FSEUR 58488', @OrderID OUTPUT
EXEC dbo.AddOrder '06013549  ','0001',' ',38742.5, 'NESTLE WATERS SUPPLY EST', @OrderID OUTPUT
EXEC dbo.AddOrder '06013551  ','0001',' ',38741.5, 'NESTLE WATERS SUPPLY EST', @OrderID OUTPUT
EXEC dbo.AddOrder '06013553  ','0001',' ',38745.5, 'NESTLE WATERS SUPPLY EST', @OrderID OUTPUT
EXEC dbo.AddOrder '06013557  ','0001',' ',38740.5, 'NESTLE WATERS SUPPLY EST', @OrderID OUTPUT
EXEC dbo.AddOrder '06013557  ','0001','a',38740.5, 'NESTLE WATERS SUPPLY EST', @OrderID OUTPUT
EXEC dbo.AddOrder '06013559  ','0001',' ',38740.5, 'NESTLE WATERS SUPPLY EST', @OrderID OUTPUT
EXEC dbo.AddOrder '06013561  ','0001',' ',38741.5, 'NESTLE WATERS SUPPLY EST', @OrderID OUTPUT
EXEC dbo.AddOrder '06013563  ','0001',' ',38741.5, 'NESTLE WATERS SUPPLY EST', @OrderID OUTPUT
EXEC dbo.AddOrder '06013566  ','0001',' ',38741.5, 'NESTLE WATERS SUPPLY EST', @OrderID OUTPUT
EXEC dbo.AddOrder '06013566  ','0001','b',38745.5, 'NESTLE WATERS SUPPLY EST', @OrderID OUTPUT
EXEC dbo.AddOrder '06013567  ','0001',' ',38759.5, 'P&G INTERNATIONAL OPERAT', @OrderID OUTPUT
EXEC dbo.AddOrder '06013570  ','0001',' ',38756.5, 'P&G INTERNATIONAL OPERAT', @OrderID OUTPUT
EXEC dbo.AddOrder '06013572  ','0001',' ',38756.5, 'DU PONT DE NEMOURS (FRAN', @OrderID OUTPUT
EXEC dbo.AddOrder '06013572  ','0001','a',38763.5, 'DU PONT DE NEMOURS (FRAN', @OrderID OUTPUT
EXEC dbo.AddOrder '06013572  ','0001','b',38756.5, 'DU PONT DE NEMOURS (FRAN', @OrderID OUTPUT
EXEC dbo.AddOrder '06013573  ','0001',' ',38756.5, 'P&G INTERNATIONAL OPERAT', @OrderID OUTPUT
EXEC dbo.AddOrder '06013575  ','0001',' ',38752.5, 'DU PONT DE NEMOURS (FRAN', @OrderID OUTPUT
EXEC dbo.AddOrder '06013578  ','0001',' ',38768.5, 'DU PONT DE NEMOURS (FRAN', @OrderID OUTPUT
EXEC dbo.AddOrder '06013581  ','0001',' ',38745.5, 'CART.EMBAL. RHONE ALPES', @OrderID OUTPUT
EXEC dbo.AddOrder '06013582  ','0001',' ',38756.5, 'P&G INTERNATIONAL OPERAT', @OrderID OUTPUT
EXEC dbo.AddOrder '06013583  ','0001',' ',38747.5, 'DU PONT DE NEMOURS (FRAN', @OrderID OUTPUT
EXEC dbo.AddOrder '06013585  ','0001',' ',38741.5, 'NESTLE WATERS SUPPLY EST', @OrderID OUTPUT
EXEC dbo.AddOrder '06013589  ','0001',' ',38770.5, 'P&G INTERNATIONAL OPERAT', @OrderID OUTPUT
EXEC dbo.AddOrder '06013590  ','0001',' ',38741.5, 'NESTLE WATERS SUPPLY EST', @OrderID OUTPUT
EXEC dbo.AddOrder '06013592  ','0001',' ',38753.5, 'DU PONT DE NEMOURS (FRAN', @OrderID OUTPUT
EXEC dbo.AddOrder '06013593  ','0001',' ',38745.5, 'NESTLE WATERS SUPPLY EST', @OrderID OUTPUT
EXEC dbo.AddOrder '06013595  ','0001',' ',38748.5, 'NESTLE WATERS SUPPLY EST', @OrderID OUTPUT
EXEC dbo.AddOrder '06013597  ','0001',' ',38745.5, 'NESTLE WATERS SUPPLY EST', @OrderID OUTPUT
EXEC dbo.AddOrder '06013599  ','0001',' ',38745.5, 'NESTLE WATERS SUPPLY EST', @OrderID OUTPUT
EXEC dbo.AddOrder '06013601  ','0001',' ',38745.5, 'DOW-AGROSCIENCES ITALIA', @OrderID OUTPUT
EXEC dbo.AddOrder '06013602  ','0001',' ',38745.5, 'DOW-AGROSCIENCES ITALIA', @OrderID OUTPUT
EXEC dbo.AddOrder '06013603  ','0001',' ',38745.5, 'DOW-AGROSCIENCES ITALIA', @OrderID OUTPUT
EXEC dbo.AddOrder '06013604  ','0001',' ',38745.5, 'DOW-AGROSCIENCES ITALIA', @OrderID OUTPUT
EXEC dbo.AddOrder '06013605  ','0001',' ',38745.5, 'DOW-AGROSCIENCES ITALIA', @OrderID OUTPUT
EXEC dbo.AddOrder '06013606  ','0001',' ',38745.5, 'DOW-AGROSCIENCES ITALIA', @OrderID OUTPUT
EXEC dbo.AddOrder '06013609  ','0001',' ',38747.5, 'DU PONT DE NEMOURS (FRAN', @OrderID OUTPUT
EXEC dbo.AddOrder '06013609  ','0001','a',38754.5, 'DU PONT DE NEMOURS (FRAN', @OrderID OUTPUT
EXEC dbo.AddOrder '06013609  ','0001','b',38752.5, 'DU PONT DE NEMOURS (FRAN', @OrderID OUTPUT
EXEC dbo.AddOrder '06013610  ','0001',' ',38746.5, 'NESTLE WATERS SUPPLY EST', @OrderID OUTPUT
EXEC dbo.AddOrder '06013611  ','0001',' ',38754.5, 'DOW AGROSCIENCES SWITZEL', @OrderID OUTPUT
EXEC dbo.AddOrder '06013615  ','0001',' ',38745.5, 'NESTLE WATERS SUPPLY EST', @OrderID OUTPUT
EXEC dbo.AddOrder '06013617  ','0001',' ',38748.5, 'NESTLE WATERS SUPPLY EST', @OrderID OUTPUT
EXEC dbo.AddOrder '06013617  ','0001','a',38748.5, 'NESTLE WATERS SUPPLY EST', @OrderID OUTPUT
EXEC dbo.AddOrder '06013619  ','0001',' ',38753.5, 'DOW AGROSCIENCES SWITZEL', @OrderID OUTPUT
EXEC dbo.AddOrder '06013620  ','0001',' ',38753.5, 'DOW AGROSCIENCES SWITZEL', @OrderID OUTPUT
EXEC dbo.AddOrder '06013621  ','0001',' ',38753.5, 'DOW AGROSCIENCES SWITZEL', @OrderID OUTPUT
EXEC dbo.AddOrder '06013623  ','0001',' ',38747.5, 'DU PONT DE NEMOURS (FRAN', @OrderID OUTPUT
EXEC dbo.AddOrder '06013624  ','0001',' ',38747.5, 'NESTLE WATERS SUPPLY EST', @OrderID OUTPUT
EXEC dbo.AddOrder '06013626  ','0001',' ',38746.5, 'NESTLE WATERS SUPPLY EST', @OrderID OUTPUT
EXEC dbo.AddOrder '06013627  ','0001',' ',38745.5, 'DOW AGROSCIENCES SWITERL', @OrderID OUTPUT
EXEC dbo.AddOrder '06013628  ','0001',' ',38745.5, 'DOW AGROSCIENCES SWITERL', @OrderID OUTPUT
EXEC dbo.AddOrder '06013629  ','0001',' ',38745.5, 'DOW AGROSCIENCES SWITERL', @OrderID OUTPUT
EXEC dbo.AddOrder '06013630  ','0001',' ',38745.5, 'DOW AGROSCIENCES SWITERL', @OrderID OUTPUT
EXEC dbo.AddOrder '06013631  ','0001',' ',38745.5, 'DOW AGROSCIENCES SWITERL', @OrderID OUTPUT
EXEC dbo.AddOrder '06013632  ','0001',' ',38745.5, 'DOW AGROSCIENCES SWITERL', @OrderID OUTPUT
EXEC dbo.AddOrder '06013634  ','0001',' ',38746.5, 'DOW AGROSCIENCES SWITZEL', @OrderID OUTPUT
EXEC dbo.AddOrder '06013635  ','0001',' ',38746.5, 'DOW AGROSCIENCES SWITZEL', @OrderID OUTPUT
EXEC dbo.AddOrder '06013636  ','0001',' ',38746.5, 'DOW AGROSCIENCES SWITZEL', @OrderID OUTPUT
EXEC dbo.AddOrder '06013637  ','0001',' ',38746.5, 'DOW AGROSCIENCES SWITZEL', @OrderID OUTPUT
EXEC dbo.AddOrder '06013638  ','0001',' ',38746.5, 'DOW AGROSCIENCES SWITZEL', @OrderID OUTPUT
EXEC dbo.AddOrder '06013640  ','0001',' ',38742.5, 'DOWELANCO ITALIA S.R.L', @OrderID OUTPUT
EXEC dbo.AddOrder '06013641  ','0001',' ',38745.5, 'DOWELANCO ITALIA S.R.L', @OrderID OUTPUT
EXEC dbo.AddOrder '06013642  ','0001',' ',38745.5, 'DOWELANCO ITALIA S.R.L', @OrderID OUTPUT
EXEC dbo.AddOrder '06013643  ','0001',' ',38745.5, 'DOWELANCO ITALIA S.R.L', @OrderID OUTPUT
EXEC dbo.AddOrder '06013644  ','0001',' ',38745.5, 'DOWELANCO ITALIA S.R.L', @OrderID OUTPUT
EXEC dbo.AddOrder '06013645  ','0001',' ',38745.5, 'DOWELANCO ITALIA S.R.L', @OrderID OUTPUT
EXEC dbo.AddOrder '06013648  ','0001',' ',38756.5, 'L''ALSACIENNE SANS CULOTT', @OrderID OUTPUT
EXEC dbo.AddOrder '06013649  ','0001',' ',38756.5, 'L''ALSACIENNE SANS CULOTT', @OrderID OUTPUT
EXEC dbo.AddOrder '06013650  ','0001',' ',38745.5, 'DOW AGROSCIENCES', @OrderID OUTPUT
EXEC dbo.AddOrder '06013651  ','0001',' ',38745.5, 'DOW AGROSCIENCES', @OrderID OUTPUT
EXEC dbo.AddOrder '06013652  ','0001',' ',38745.5, 'DOW AGROSCIENCES', @OrderID OUTPUT
EXEC dbo.AddOrder '06013653  ','0001',' ',38745.5, 'DOW AGROSCIENCES', @OrderID OUTPUT
EXEC dbo.AddOrder '06013654  ','0001',' ',38745.5, 'DOW AGROSCIENCES', @OrderID OUTPUT
EXEC dbo.AddOrder '06013655  ','0001',' ',38745.5, 'DOW AGROSCIENCES', @OrderID OUTPUT
EXEC dbo.AddOrder '06013656  ','0001',' ',38745.5, 'DOW AGROSCIENCES', @OrderID OUTPUT
EXEC dbo.AddOrder '06013657  ','0001',' ',38745.5, 'DOW AGROSCIENCES', @OrderID OUTPUT
EXEC dbo.AddOrder '06013658  ','0001',' ',38745.5, 'DOW AGROSCIENCES', @OrderID OUTPUT
EXEC dbo.AddOrder '06013659  ','0001',' ',38745.5, 'DOW AGROSCIENCES', @OrderID OUTPUT
EXEC dbo.AddOrder '06013660  ','0001',' ',38745.5, 'DOW AGROSCIENCES', @OrderID OUTPUT
EXEC dbo.AddOrder '06013661  ','0001',' ',38745.5, 'DOW AGROSCIENCES', @OrderID OUTPUT
EXEC dbo.AddOrder '06013662  ','0001',' ',38745.5, 'DOW AGROSCIENCES', @OrderID OUTPUT
EXEC dbo.AddOrder '06013663  ','0001',' ',38745.5, 'DOW AGROSCIENCES', @OrderID OUTPUT
EXEC dbo.AddOrder '06013664  ','0001',' ',38746.5, 'DOW AGROSCIENCES', @OrderID OUTPUT
EXEC dbo.AddOrder '06013665  ','0001',' ',38745.5, 'DOW AGROSCIENCES', @OrderID OUTPUT
EXEC dbo.AddOrder '06013666  ','0001',' ',38745.5, 'DOW AGROSCIENCES', @OrderID OUTPUT
EXEC dbo.AddOrder '06013667  ','0001',' ',38745.5, 'DOW AGROSCIENCES', @OrderID OUTPUT
EXEC dbo.AddOrder '06013668  ','0001',' ',38745.5, 'DOW AGROSCIENCES', @OrderID OUTPUT
EXEC dbo.AddOrder '06013669  ','0001',' ',38745.5, 'DOW AGROSCIENCES', @OrderID OUTPUT
EXEC dbo.AddOrder '06013670  ','0001',' ',38746.5, 'DOW AGROSCIENCES', @OrderID OUTPUT
EXEC dbo.AddOrder '06013671  ','0001',' ',38745.5, 'DOW AGROSCIENCES', @OrderID OUTPUT
EXEC dbo.AddOrder '06013672  ','0001',' ',38745.5, 'DOW AGROSCIENCES', @OrderID OUTPUT
EXEC dbo.AddOrder '06013673  ','0001',' ',38745.5, 'DOW AGROSCIENCES', @OrderID OUTPUT
EXEC dbo.AddOrder '06013674  ','0001',' ',38745.5, 'DOW AGROSCIENCES', @OrderID OUTPUT
EXEC dbo.AddOrder '06013675  ','0001',' ',38745.5, 'DOW AGROSCIENCES', @OrderID OUTPUT
EXEC dbo.AddOrder '06013676  ','0001',' ',38745.5, 'DOW AGROSCIENCES', @OrderID OUTPUT
EXEC dbo.AddOrder '06013677  ','0001',' ',38745.5, 'DOW AGROSCIENCES', @OrderID OUTPUT
EXEC dbo.AddOrder '06013678  ','0001',' ',38746.5, 'DOW AGROSCIENCES', @OrderID OUTPUT
EXEC dbo.AddOrder '06013679  ','0001',' ',38745.5, 'DOW AGROSCIENCES', @OrderID OUTPUT
EXEC dbo.AddOrder '06013682  ','0001',' ',38747.5, 'W. WIRTH GMBH', @OrderID OUTPUT
EXEC dbo.AddOrder '06013686  ','0001',' ',38749.5, 'P&G INTERNATIONAL OPERAT', @OrderID OUTPUT
EXEC dbo.AddOrder '06013688  ','0001',' ',38753.5, 'P&G INTERNATIONAL OPERAT', @OrderID OUTPUT
EXEC dbo.AddOrder '06013690  ','0001',' ',38746.5, 'S.M.A.E.    (EDI)', @OrderID OUTPUT
EXEC dbo.AddOrder '06013691  ','0001',' ',38746.5, 'S.M.A.E.    (EDI)', @OrderID OUTPUT
EXEC dbo.AddOrder '06013692  ','0001',' ',38746.5, 'S.M.A.E.    (EDI)', @OrderID OUTPUT
EXEC dbo.AddOrder '06013694  ','0001',' ',38753.5, 'P&G INTERNATIONAL OPERAT', @OrderID OUTPUT
EXEC dbo.AddOrder '06013695  ','0001',' ',38746.5, 'S.M.A.E.    (EDI)', @OrderID OUTPUT
EXEC dbo.AddOrder '06013697  ','0001',' ',38749.5, 'S.M.A.E. ZI METZ BORNY (', @OrderID OUTPUT
EXEC dbo.AddOrder '06013698  ','0001',' ',38749.5, 'S.M.A.E. ZI METZ BORNY (', @OrderID OUTPUT
EXEC dbo.AddOrder '06013699  ','0001',' ',38749.5, 'S.M.A.E. ZI METZ BORNY (', @OrderID OUTPUT
EXEC dbo.AddOrder '06013700  ','0001',' ',38749.5, 'S.M.A.E. ZI METZ BORNY (', @OrderID OUTPUT
EXEC dbo.AddOrder '06013701  ','0001',' ',38749.5, 'S.M.A.E. ZI METZ BORNY (', @OrderID OUTPUT
EXEC dbo.AddOrder '06013703  ','0001',' ',38749.5, 'S.M.A.E. ZI METZ BORNY (', @OrderID OUTPUT
EXEC dbo.AddOrder '06013705  ','0001',' ',38749.5, 'S.M.A.E. ZI METZ BORNY (', @OrderID OUTPUT
EXEC dbo.AddOrder '06013707  ','0001',' ',38749.5, 'S.M.A.E. ZI METZ BORNY (', @OrderID OUTPUT
EXEC dbo.AddOrder '06013708  ','0001',' ',38749.5, 'S.M.A.E. ZI METZ BORNY (', @OrderID OUTPUT
EXEC dbo.AddOrder '06013709  ','0001',' ',38749.5, 'S.M.A.E. ZI METZ BORNY (', @OrderID OUTPUT
EXEC dbo.AddOrder '06013710  ','0001',' ',38749.5, 'S.M.A.E. ZI METZ BORNY (', @OrderID OUTPUT
EXEC dbo.AddOrder '06013711  ','0001',' ',38749.5, 'S.M.A.E. ZI METZ BORNY (', @OrderID OUTPUT
EXEC dbo.AddOrder '06013713  ','0001',' ',38746.5, 'BRASSERIE FISCHER SA', @OrderID OUTPUT
EXEC dbo.AddOrder '06013715  ','0001',' ',38747.5, 'BRASSERIE FISCHER SA', @OrderID OUTPUT
EXEC dbo.AddOrder '06013716  ','0001',' ',38745.5, 'DOWELANCO ITALIA S.R.L', @OrderID OUTPUT
EXEC dbo.AddOrder '06013718  ','0001',' ',38748.5, 'BRASSERIE FISCHER SA', @OrderID OUTPUT
EXEC dbo.AddOrder '06013721  ','0001',' ',38755.5, 'ADHESIA', @OrderID OUTPUT
EXEC dbo.AddOrder '06013722  ','0001',' ',38753.5, 'CATEM S.A', @OrderID OUTPUT
EXEC dbo.AddOrder '06013723  ','0001',' ',38753.5, 'CATEM S.A', @OrderID OUTPUT
EXEC dbo.AddOrder '06013726  ','0001',' ',38756.5, 'ADHESIA', @OrderID OUTPUT
EXEC dbo.AddOrder '06013727  ','0001',' ',38775.5, 'PRODENE KLINT ESPACE LEA', @OrderID OUTPUT
EXEC dbo.AddOrder '06013728  ','0001',' ',38775.5, 'PRODENE KLINT ESPACE LEA', @OrderID OUTPUT
EXEC dbo.AddOrder '06013731  ','0001',' ',38747.5, 'BRASSERIE FISCHER SA', @OrderID OUTPUT
EXEC dbo.AddOrder '06013732  ','0001',' ',38748.5, 'COGESAL MIKO-FSEUR 58488', @OrderID OUTPUT
EXEC dbo.AddOrder '06013733  ','0001',' ',38749.5, 'COGESAL MIKO-FSEUR 58488', @OrderID OUTPUT
EXEC dbo.AddOrder '06013734  ','0001',' ',38752.5, 'COGESAL MIKO-FSEUR 58488', @OrderID OUTPUT
EXEC dbo.AddOrder '06013735  ','0001',' ',38753.5, 'COGESAL MIKO-FSEUR 58488', @OrderID OUTPUT
EXEC dbo.AddOrder '06013737  ','0001',' ',38754.5, 'COGESAL MIKO-FSEUR 58488', @OrderID OUTPUT
EXEC dbo.AddOrder '06013739  ','0001',' ',38742.5, 'P&G INTERNATIONAL OPERAT', @OrderID OUTPUT
EXEC dbo.AddOrder '06013740  ','0001',' ',38755.5, 'DS SMITH KAYSERSBERG', @OrderID OUTPUT
EXEC dbo.AddOrder '06013741  ','0001',' ',38755.5, 'DS SMITH KAYSERSBERG', @OrderID OUTPUT
EXEC dbo.AddOrder '06013743  ','0001',' ',38753.5, 'BRASSERIE FISCHER SA', @OrderID OUTPUT
EXEC dbo.AddOrder '06013745  ','0001',' ',38748.5, 'BRASSERIE FISCHER SA', @OrderID OUTPUT
EXEC dbo.AddOrder '06013747  ','0001',' ',38753.5, 'BRASSERIE FISCHER SA', @OrderID OUTPUT
EXEC dbo.AddOrder '06013749  ','0001',' ',38753.5, 'BRASSERIE FISCHER SA', @OrderID OUTPUT
EXEC dbo.AddOrder '06013752  ','0001',' ',38748.5, 'BRASSERIE FISCHER SA', @OrderID OUTPUT
EXEC dbo.AddOrder '06013756  ','0001',' ',38746.5, 'STE WRIGLEY FRANCE S.N.C', @OrderID OUTPUT
EXEC dbo.AddOrder '06013758  ','0001',' ',38746.5, 'STE WRIGLEY FRANCE S.N.C', @OrderID OUTPUT
EXEC dbo.AddOrder '06013760  ','0001',' ',38746.5, 'STE WRIGLEY FRANCE S.N.C', @OrderID OUTPUT
EXEC dbo.AddOrder '06013762  ','0001',' ',38746.5, 'STE WRIGLEY FRANCE S.N.C', @OrderID OUTPUT
EXEC dbo.AddOrder '06013765  ','0001',' ',38746.5, 'DOW AGROSCIENCES SWITZEL', @OrderID OUTPUT
EXEC dbo.AddOrder '06013767  ','0001',' ',38773.5, 'MVI MOTORENTEILE GMBH', @OrderID OUTPUT
EXEC dbo.AddOrder '06013770  ','0001',' ',38753.5, 'OTTO RAUHUT GMBH & CO', @OrderID OUTPUT
EXEC dbo.AddOrder '06013771  ','0001',' ',38741.5, 'NESTLE WATERS SUPPLY EST', @OrderID OUTPUT
EXEC dbo.AddOrder '06013773  ','0001',' ',38741.5, 'NESTLE WATERS SUPPLY EST', @OrderID OUTPUT
EXEC dbo.AddOrder '06013775  ','0001',' ',38752.5, 'NESTLE WATERS SUPPLY EST', @OrderID OUTPUT
EXEC dbo.AddOrder '06013775  ','0001','a',38755.5, 'NESTLE WATERS SUPPLY EST', @OrderID OUTPUT
EXEC dbo.AddOrder '06013777  ','0001',' ',38762.5, 'SCHWEITZER S.A.', @OrderID OUTPUT
EXEC dbo.AddOrder '06013779  ','0001',' ',38746.5, 'NESTLE WATERS SUPPLY EST', @OrderID OUTPUT
EXEC dbo.AddOrder '06013781  ','0001',' ',38746.5, 'NESTLE WATERS SUPPLY EST', @OrderID OUTPUT
EXEC dbo.AddOrder '06013783  ','0001',' ',38747.5, 'NESTLE WATERS SUPPLY EST', @OrderID OUTPUT
EXEC dbo.AddOrder '06013785  ','0001',' ',38759.5, 'NESTLE WATERS SUPPLY EST', @OrderID OUTPUT
EXEC dbo.AddOrder '06013787  ','0001',' ',38760.5, 'NESTLE WATERS SUPPLY EST', @OrderID OUTPUT
EXEC dbo.AddOrder '06013791  ','0001',' ',38748.5, 'NESTLE WATERS SUPPLY EST', @OrderID OUTPUT
EXEC dbo.AddOrder '06013793  ','0001',' ',38745.5, 'NESTLE WATERS SUPPLY EST', @OrderID OUTPUT
EXEC dbo.AddOrder '06013796  ','0001',' ',38747.5, 'NESTLE WATERS SUPPLY EST', @OrderID OUTPUT
EXEC dbo.AddOrder '06013800  ','0001',' ',38742.5, 'NESTLE WATERS SUPPLY EST', @OrderID OUTPUT
EXEC dbo.AddOrder '06013802  ','0001',' ',38748.5, 'NESTLE WATERS SUPPLY EST', @OrderID OUTPUT
EXEC dbo.AddOrder '06013806  ','0001',' ',38756.5, 'NESTLE WATERS SUPPLY EST', @OrderID OUTPUT
EXEC dbo.AddOrder '06013808  ','0001',' ',38748.5, 'MONDI PACKAGING', @OrderID OUTPUT
EXEC dbo.AddOrder '06013811  ','0001',' ',38742.5, 'GEORGIA-PACIFIC FRANCE', @OrderID OUTPUT
EXEC dbo.AddOrder '06013812  ','0001',' ',38760.5, 'CRISTALLERIES DE BACCARA', @OrderID OUTPUT
EXEC dbo.AddOrder '06013813  ','0001',' ',38760.5, 'CRISTALLERIES DE BACCARA', @OrderID OUTPUT
EXEC dbo.AddOrder '06013814  ','0001',' ',38759.5, 'CRISTALLERIES DE BACCARA', @OrderID OUTPUT
EXEC dbo.AddOrder '06013815  ','0001',' ',38759.5, 'CRISTALLERIES DE BACCARA', @OrderID OUTPUT
EXEC dbo.AddOrder '06013816  ','0001',' ',38759.5, 'CRISTALLERIES DE BACCARA', @OrderID OUTPUT
EXEC dbo.AddOrder '06013819  ','0001',' ',38748.5, 'DS SMITH KAYPAC', @OrderID OUTPUT
EXEC dbo.AddOrder '06013824  ','0001',' ',38746.5, 'DOW AGROSCIENCES SWITZEL', @OrderID OUTPUT
EXEC dbo.AddOrder '06013826  ','0001',' ',38747.5, 'DU PONT DE NEMOURS (FRAN', @OrderID OUTPUT
EXEC dbo.AddOrder '06013826  ','0001','a',38747.5, 'DU PONT DE NEMOURS (FRAN', @OrderID OUTPUT
EXEC dbo.AddOrder '06013826  ','0001','b',38763.5, 'DU PONT DE NEMOURS (FRAN', @OrderID OUTPUT
EXEC dbo.AddOrder '06013828  ','0001',' ',38760.5, 'DU PONT DE NEMOURS (FRAN', @OrderID OUTPUT
EXEC dbo.AddOrder '06013830  ','0001',' ',38753.5, 'WABCO POLSKA SP.Z.O.O.', @OrderID OUTPUT
EXEC dbo.AddOrder '06013831  ','0001',' ',38746.5, 'DU PONT DE NEMOURS (FRAN', @OrderID OUTPUT
EXEC dbo.AddOrder '06013831  ','0001','a',38746.5, 'DU PONT DE NEMOURS (FRAN', @OrderID OUTPUT
EXEC dbo.AddOrder '06013833  ','0001',' ',38753.5, 'DU PONT DE NEMOURS (FRAN', @OrderID OUTPUT
EXEC dbo.AddOrder '06013835  ','0001',' ',38752.5, 'HEIDE WERKSTAETTEN E.V.', @OrderID OUTPUT
EXEC dbo.AddOrder '06013835  ','0002',' ',38752.5, 'HEIDE WERKSTAETTEN E.V.', @OrderID OUTPUT
EXEC dbo.AddOrder '06013836  ','0001',' ',38761.5, 'DU PONT DE NEMOURS (FRAN', @OrderID OUTPUT
EXEC dbo.AddOrder '06013839  ','0001',' ',38748.5, 'NESTLE WATERS SUPPLY EST', @OrderID OUTPUT
EXEC dbo.AddOrder '06013841  ','0001',' ',38748.5, 'NESTLE WATERS SUPPLY EST', @OrderID OUTPUT
EXEC dbo.AddOrder '06013843  ','0001',' ',38752.5, 'NESTLE WATERS SUPPLY EST', @OrderID OUTPUT
EXEC dbo.AddOrder '06013845  ','0001',' ',38748.5, 'NESTLE WATERS SUPPLY EST', @OrderID OUTPUT
EXEC dbo.AddOrder '06013847  ','0001',' ',38742.5, 'NESTLE WATERS SUPPLY EST', @OrderID OUTPUT
EXEC dbo.AddOrder '06013849  ','0001',' ',38746.5, 'NESTLE WATERS SUPPLY EST', @OrderID OUTPUT
EXEC dbo.AddOrder '06013851  ','0001',' ',38747.5, 'NESTLE WATERS SUPPLY EST', @OrderID OUTPUT
EXEC dbo.AddOrder '06013853  ','0001',' ',38753.5, 'NESTLE WATERS SUPPLY EST', @OrderID OUTPUT
EXEC dbo.AddOrder '06013856  ','0001',' ',38745.5, 'CART.EMBAL. RHONE ALPES', @OrderID OUTPUT
EXEC dbo.AddOrder '06013857  ','0001',' ',38753.5, 'NESTLE WATERS SUPPLY EST', @OrderID OUTPUT
EXEC dbo.AddOrder '06013859  ','0001',' ',38754.5, 'NESTLE WATERS SUPPLY EST', @OrderID OUTPUT
EXEC dbo.AddOrder '06013861  ','0001',' ',38755.5, 'NESTLE WATERS SUPPLY EST', @OrderID OUTPUT
EXEC dbo.AddOrder '06013863  ','0001',' ',38763.5, 'NESTLE WATERS SUPPLY EST', @OrderID OUTPUT
EXEC dbo.AddOrder '06013865  ','0001',' ',38770.5, 'NESTLE WATERS SUPPLY EST', @OrderID OUTPUT
EXEC dbo.AddOrder '06013867  ','0001',' ',38763.5, 'NESTLE WATERS SUPPLY EST', @OrderID OUTPUT
EXEC dbo.AddOrder '06013872  ','0001',' ',38753.5, 'OTTO RAUHUT GMBH & CO', @OrderID OUTPUT
EXEC dbo.AddOrder '06013879  ','0001',' ',38753.5, 'NESTLE WATERS SUPPLY EST', @OrderID OUTPUT
EXEC dbo.AddOrder '06013881  ','0001',' ',38756.5, 'NESTLE WATERS SUPPLY EST', @OrderID OUTPUT
EXEC dbo.AddOrder '06013883  ','0001',' ',38760.5, 'NESTLE WATERS SUPPLY EST', @OrderID OUTPUT
EXEC dbo.AddOrder '06013883  ','0001','a',38763.5, 'NESTLE WATERS SUPPLY EST', @OrderID OUTPUT
EXEC dbo.AddOrder '06013885  ','0001',' ',38756.5, 'NESTLE WATERS SUPPLY EST', @OrderID OUTPUT
EXEC dbo.AddOrder '06013888  ','0001',' ',38749.5, 'ED.FRIEDRICH & CO GMBH', @OrderID OUTPUT
EXEC dbo.AddOrder '06013891  ','0001',' ',38754.5, 'DU PONT DE NEMOURS (FRAN', @OrderID OUTPUT
EXEC dbo.AddOrder '06013896  ','0001',' ',38741.5, 'NESTLE WATERS SUPPLY EST', @OrderID OUTPUT
EXEC dbo.AddOrder '06013898  ','0001',' ',38787.5, 'STE ALSA-CORK', @OrderID OUTPUT
EXEC dbo.AddOrder '06013899  ','0001',' ',38787.5, 'STE ALSA-CORK', @OrderID OUTPUT
EXEC dbo.AddOrder '06013904  ','0001',' ',38753.5, 'GEORGIA-PACIFIC FRANCE', @OrderID OUTPUT
EXEC dbo.AddOrder '06013906  ','0001',' ',38753.5, 'GEORGIA-PACIFIC FRANCE', @OrderID OUTPUT
EXEC dbo.AddOrder '06013908  ','0001',' ',38754.5, 'GEORGIA-PACIFIC FRANCE', @OrderID OUTPUT
EXEC dbo.AddOrder '06013913  ','0001',' ',38754.5, 'DU PONT DE NEMOURS (FRAN', @OrderID OUTPUT
EXEC dbo.AddOrder '06013914  ','0001',' ',38753.5, 'ROBOT COUPE', @OrderID OUTPUT
EXEC dbo.AddOrder '06013916  ','0001',' ',38755.5, 'DU PONT DE NEMOURS (FRAN', @OrderID OUTPUT
EXEC dbo.AddOrder '06013917  ','0001',' ',38753.5, 'DELIPAPIER', @OrderID OUTPUT
EXEC dbo.AddOrder '06013919  ','0001',' ',38760.5, 'DELIPAPIER', @OrderID OUTPUT
EXEC dbo.AddOrder '06013920  ','0001',' ',38760.5, 'DELIPAPIER', @OrderID OUTPUT
EXEC dbo.AddOrder '06013921  ','0001',' ',38767.5, 'DELIPAPIER', @OrderID OUTPUT
EXEC dbo.AddOrder '06013922  ','0001',' ',38755.5, 'DU PONT DE NEMOURS (FRAN', @OrderID OUTPUT
EXEC dbo.AddOrder '06013928  ','0001',' ',38783.5, 'P&G INTERNATIONAL OPERAT', @OrderID OUTPUT
EXEC dbo.AddOrder '06013930  ','0001',' ',38763.5, 'P&G INTERNATIONAL OPERAT', @OrderID OUTPUT
EXEC dbo.AddOrder '06013939  ','0001',' ',38749.5, 'PEUGEOT CITROEN AUTOMOBI', @OrderID OUTPUT
EXEC dbo.AddOrder '06013939  ','0001','a',38749.5, 'PEUGEOT CITROEN AUTOMOBI', @OrderID OUTPUT
EXEC dbo.AddOrder '06013943  ','0001',' ',38748.5, 'P&G INTERNATIONAL OPERAT', @OrderID OUTPUT
EXEC dbo.AddOrder '06013945  ','0001',' ',38747.5, 'P&G INTERNATIONAL OPERAT', @OrderID OUTPUT
EXEC dbo.AddOrder '06013947  ','0001',' ',38753.5, 'P&G INTERNATIONAL OPERAT', @OrderID OUTPUT
EXEC dbo.AddOrder '06013949  ','0001',' ',38753.5, 'P&G INTERNATIONAL OPERAT', @OrderID OUTPUT
EXEC dbo.AddOrder '06013951  ','0001',' ',38742.5, 'P&G INTERNATIONAL OPERAT', @OrderID OUTPUT
EXEC dbo.AddOrder '06013953  ','0001',' ',38749.5, 'P&G INTERNATIONAL OPERAT', @OrderID OUTPUT
EXEC dbo.AddOrder '06013955  ','0001',' ',38754.5, 'P&G INTERNATIONAL OPERAT', @OrderID OUTPUT
EXEC dbo.AddOrder '06013959  ','0001',' ',38742.5, 'P&G INTERNATIONAL OPERAT', @OrderID OUTPUT
EXEC dbo.AddOrder '06013961  ','0001',' ',38745.5, 'P&G INTERNATIONAL OPERAT', @OrderID OUTPUT
EXEC dbo.AddOrder '06013965  ','0001',' ',38756.5, 'P&G INTERNATIONAL OPERAT', @OrderID OUTPUT
EXEC dbo.AddOrder '06013967  ','0001',' ',38749.5, 'P&G INTERNATIONAL OPERAT', @OrderID OUTPUT
EXEC dbo.AddOrder '06013969  ','0001',' ',38753.5, 'P&G INTERNATIONAL OPERAT', @OrderID OUTPUT
EXEC dbo.AddOrder '06013971  ','0001',' ',38756.5, 'P&G INTERNATIONAL OPERAT', @OrderID OUTPUT
EXEC dbo.AddOrder '06013973  ','0001',' ',38759.5, 'P&G INTERNATIONAL OPERAT', @OrderID OUTPUT
EXEC dbo.AddOrder '06013977  ','0001',' ',38749.5, 'P&G INTERNATIONAL OPERAT', @OrderID OUTPUT
EXEC dbo.AddOrder '06013979  ','0001',' ',38749.5, 'P&G INTERNATIONAL OPERAT', @OrderID OUTPUT
EXEC dbo.AddOrder '06013981  ','0001',' ',38741.5, 'P&G INTERNATIONAL OPERAT', @OrderID OUTPUT
EXEC dbo.AddOrder '06013983  ','0001',' ',38756.5, 'P&G INTERNATIONAL OPERAT', @OrderID OUTPUT
EXEC dbo.AddOrder '06013993  ','0001',' ',38776.5, 'P&G INTERNATIONAL OPERAT', @OrderID OUTPUT
EXEC dbo.AddOrder '06013995  ','0001',' ',38748.5, 'P&G INTERNATIONAL OPERAT', @OrderID OUTPUT
EXEC dbo.AddOrder '06013997  ','0001',' ',38752.5, 'P&G INTERNATIONAL OPERAT', @OrderID OUTPUT
EXEC dbo.AddOrder '06013999  ','0001',' ',38761.5, 'P&G INTERNATIONAL OPERAT', @OrderID OUTPUT
EXEC dbo.AddOrder '06014010  ','0001',' ',38755.5, 'P&G INTERNATIONAL OPERAT', @OrderID OUTPUT
EXEC dbo.AddOrder '06014012  ','0001',' ',38755.5, 'P&G INTERNATIONAL OPERAT', @OrderID OUTPUT
EXEC dbo.AddOrder '06014012  ','0001','a',38755.5, 'P&G INTERNATIONAL OPERAT', @OrderID OUTPUT
EXEC dbo.AddOrder '06014014  ','0001',' ',38752.5, 'P&G INTERNATIONAL OPERAT', @OrderID OUTPUT
EXEC dbo.AddOrder '06014016  ','0001',' ',38755.5, 'P&G INTERNATIONAL OPERAT', @OrderID OUTPUT
EXEC dbo.AddOrder '06014018  ','0001',' ',38759.5, 'P&G INTERNATIONAL OPERAT', @OrderID OUTPUT
EXEC dbo.AddOrder '06014020  ','0001',' ',38754.5, 'P&G INTERNATIONAL OPERAT', @OrderID OUTPUT
EXEC dbo.AddOrder '06014025  ','0001',' ',38747.5, 'TIMKEN EUROPE', @OrderID OUTPUT
EXEC dbo.AddOrder '06014026  ','0001',' ',38747.5, 'TIMKEN EUROPE', @OrderID OUTPUT
EXEC dbo.AddOrder '06014027  ','0001',' ',38741.5, 'SA. BOULANGERIE NEUHAUSE', @OrderID OUTPUT
EXEC dbo.AddOrder '06014029  ','0001',' ',38742.5, 'COGESAL MIKO-FSEUR 58488', @OrderID OUTPUT
EXEC dbo.AddOrder '06014033  ','0001',' ',38760.5, 'CAPSUGEL', @OrderID OUTPUT
EXEC dbo.AddOrder '06014034  ','0001',' ',38756.5, 'CAPSUGEL', @OrderID OUTPUT
EXEC dbo.AddOrder '06014039  ','0001',' ',38756.5, 'UTP SCHWEISSMATERIAL GMB', @OrderID OUTPUT
EXEC dbo.AddOrder '06014040  ','0001',' ',38747.5, 'DS SMITH KAYPAC', @OrderID OUTPUT
EXEC dbo.AddOrder '06014041  ','0001',' ',38759.5, 'TECUMSEH EUROPE S.A.', @OrderID OUTPUT
EXEC dbo.AddOrder '06014044  ','0001',' ',38745.5, 'NESTLE WATERS SUPPLY EST', @OrderID OUTPUT
EXEC dbo.AddOrder '06014046  ','0001',' ',38748.5, 'B.V.ALVERIMPORT', @OrderID OUTPUT
EXEC dbo.AddOrder '06014052  ','0001',' ',38738.5, 'CELLIER DES DAUPHINS', @OrderID OUTPUT
EXEC dbo.AddOrder '06014052  ','0001','a',38748.5, 'CELLIER DES DAUPHINS', @OrderID OUTPUT
EXEC dbo.AddOrder '06014054  ','0001',' ',38745.5, 'NESTLE WATERS SUPPLY EST', @OrderID OUTPUT
EXEC dbo.AddOrder '06014057  ','0001',' ',38753.5, 'BRANGS + HEINRICH GMBH', @OrderID OUTPUT
EXEC dbo.AddOrder '06014058  ','0001',' ',38763.5, 'DU PONT DE NEMOURS (FRAN', @OrderID OUTPUT
EXEC dbo.AddOrder '06014060  ','0001',' ',38763.5, 'DU PONT DE NEMOURS (FRAN', @OrderID OUTPUT
EXEC dbo.AddOrder '06014062  ','0001',' ',38763.5, 'DU PONT DE NEMOURS (FRAN', @OrderID OUTPUT
EXEC dbo.AddOrder '06014064  ','0001',' ',38763.5, 'DU PONT DE NEMOURS (FRAN', @OrderID OUTPUT
EXEC dbo.AddOrder '06014066  ','0001',' ',38752.5, 'DS SMITH KAYPAC', @OrderID OUTPUT
EXEC dbo.AddOrder '06014068  ','0001',' ',38755.5, 'DS SMITH KAYPAC', @OrderID OUTPUT
EXEC dbo.AddOrder '06014069  ','0001',' ',38749.5, 'DS SMITH KAYSERSBERG', @OrderID OUTPUT
EXEC dbo.AddOrder '06014080  ','0001',' ',38748.5, 'CART.EMBAL. RHONE ALPES', @OrderID OUTPUT
EXEC dbo.AddOrder '06014080  ','0002',' ',38748.5, 'CART.EMBAL. RHONE ALPES', @OrderID OUTPUT
EXEC dbo.AddOrder '06014080  ','0003',' ',38748.5, 'CART.EMBAL. RHONE ALPES', @OrderID OUTPUT
EXEC dbo.AddOrder '06014082  ','0001',' ',38749.5, 'CART.EMBAL. RHONE ALPES', @OrderID OUTPUT
EXEC dbo.AddOrder '06014083  ','0001',' ',38749.5, 'CART.EMBAL. RHONE ALPES', @OrderID OUTPUT
EXEC dbo.AddOrder '06014089  ','0001',' ',38756.5, 'STE ALSA-CORK', @OrderID OUTPUT
EXEC dbo.AddOrder '06014090  ','0001',' ',38754.5, 'STE ALSA-CORK', @OrderID OUTPUT
EXEC dbo.AddOrder '06014096  ','0001',' ',38755.5, 'WELL-PACK AG', @OrderID OUTPUT
EXEC dbo.AddOrder '06014097  ','0001',' ',38754.5, 'WELL-PACK AG', @OrderID OUTPUT
EXEC dbo.AddOrder '06014099  ','0001',' ',38754.5, 'WELL-PACK AG', @OrderID OUTPUT
EXEC dbo.AddOrder '06014102  ','0001',' ',38754.5, 'WELL-PACK AG', @OrderID OUTPUT
EXEC dbo.AddOrder '06014104  ','0001',' ',38754.5, 'WELL-PACK AG', @OrderID OUTPUT
EXEC dbo.AddOrder '06014109  ','0001',' ',38756.5, 'NESTLE WATERS SUPPLY EST', @OrderID OUTPUT
EXEC dbo.AddOrder '06014111  ','0001',' ',38749.5, 'ROYAL CHAUFFAGE', @OrderID OUTPUT
EXEC dbo.AddOrder '06014112  ','0001',' ',38755.5, 'NESTLE WATERS SUPPLY EST', @OrderID OUTPUT
EXEC dbo.AddOrder '06014116  ','0001',' ',38761.5, 'NESTLE WATERS SUPPLY EST', @OrderID OUTPUT
EXEC dbo.AddOrder '06014118  ','0001',' ',38761.5, 'NESTLE WATERS SUPPLY EST', @OrderID OUTPUT
EXEC dbo.AddOrder '06014120  ','0001',' ',38753.5, 'NESTLE WATERS SUPPLY EST', @OrderID OUTPUT
EXEC dbo.AddOrder '06014122  ','0001',' ',38754.5, 'NESTLE WATERS SUPPLY EST', @OrderID OUTPUT
EXEC dbo.AddOrder '06014124  ','0001',' ',38756.5, 'NESTLE WATERS SUPPLY EST', @OrderID OUTPUT
EXEC dbo.AddOrder '06014126  ','0001',' ',38768.5, 'NESTLE WATERS SUPPLY EST', @OrderID OUTPUT
EXEC dbo.AddOrder '06014128  ','0001',' ',38755.5, 'NESTLE WATERS SUPPLY EST', @OrderID OUTPUT
EXEC dbo.AddOrder '06014130  ','0001',' ',38748.5, 'NESTLE WATERS SUPPLY EST', @OrderID OUTPUT
EXEC dbo.AddOrder '06014135  ','0001',' ',38766.5, 'DU PONT DE NEMOURS S.A.', @OrderID OUTPUT
EXEC dbo.AddOrder '06014138  ','0001',' ',38755.5, 'AXAL SAS', @OrderID OUTPUT
EXEC dbo.AddOrder '06014140  ','0001',' ',38753.5, 'GEORGIA-PACIFIC FRANCE', @OrderID OUTPUT
EXEC dbo.AddOrder '06014143  ','0001',' ',38747.5, 'DS SMITH KAYPAC', @OrderID OUTPUT
EXEC dbo.AddOrder '06014144  ','0001',' ',38754.5, 'DUPONT DE NEMOURS ITALIA', @OrderID OUTPUT
EXEC dbo.AddOrder '06014146  ','0001',' ',38755.5, 'AXAL', @OrderID OUTPUT
EXEC dbo.AddOrder '06014148  ','0001',' ',38754.5, 'STE WRIGLEY FRANCE S.N.C', @OrderID OUTPUT
EXEC dbo.AddOrder '06014153  ','0001',' ',38755.5, 'STE WRIGLEY FRANCE S.N.C', @OrderID OUTPUT
EXEC dbo.AddOrder '06014157  ','0001',' ',38749.5, 'DS SMITH KAYSERSBERG', @OrderID OUTPUT
EXEC dbo.AddOrder '06014159  ','0001',' ',38741.5, 'NESTLE WATERS SUPPLY EST', @OrderID OUTPUT
EXEC dbo.AddOrder '06014160  ','0001',' ',38756.5, 'FRITZ W.A. GEHRKE', @OrderID OUTPUT
EXEC dbo.AddOrder '06014163  ','0001',' ',38759.5, 'MGLAS AG', @OrderID OUTPUT
EXEC dbo.AddOrder '06014164  ','0001',' ',38754.5, 'SCHWEITZER S.A.', @OrderID OUTPUT
EXEC dbo.AddOrder '06014166  ','0001',' ',38754.5, 'SCHWEITZER S.A.', @OrderID OUTPUT
EXEC dbo.AddOrder '06014167  ','0001',' ',38754.5, 'SCHWEITZER S.A.', @OrderID OUTPUT
EXEC dbo.AddOrder '06014169  ','0001',' ',38759.5, 'SCHWEITZER S.A.', @OrderID OUTPUT
EXEC dbo.AddOrder '06014173  ','0001',' ',38756.5, 'B.V.ALVERIMPORT', @OrderID OUTPUT
EXEC dbo.AddOrder '06014175  ','0001',' ',38749.5, 'GEORGIA-PACIFIC FRANCE', @OrderID OUTPUT
EXEC dbo.AddOrder '06014178  ','0001',' ',38753.5, 'CUISINES SCHMIDT SALM SA', @OrderID OUTPUT
EXEC dbo.AddOrder '06014179  ','0001',' ',38752.5, 'COGESAL MIKO-FSEUR 58488', @OrderID OUTPUT
EXEC dbo.AddOrder '06014182  ','0001',' ',38752.5, 'COGESAL MIKO-FSEUR 58488', @OrderID OUTPUT
EXEC dbo.AddOrder '06014184  ','0001',' ',38763.5, 'ATELIERS BUSCH & CIE', @OrderID OUTPUT
EXEC dbo.AddOrder '06014186  ','0001',' ',38754.5, 'GEORGIA-PACIFIC FRANCE', @OrderID OUTPUT
EXEC dbo.AddOrder '06014188  ','0001',' ',38755.5, 'DELIFRANCE SA', @OrderID OUTPUT
EXEC dbo.AddOrder '06014191  ','0001',' ',38747.5, 'ROTO OFFSET IMPRIMERIE', @OrderID OUTPUT
EXEC dbo.AddOrder '06014196  ','0001',' ',38760.5, 'DS SMITH KAYSERSBERG', @OrderID OUTPUT
EXEC dbo.AddOrder '06014199  ','0001',' ',38756.5, 'GEORGIA-PACIFIC FRANCE', @OrderID OUTPUT
EXEC dbo.AddOrder '06014200  ','0001',' ',38747.5, 'NOVARTIS CONSUMER HEALTH', @OrderID OUTPUT
EXEC dbo.AddOrder '06014200  ','0001','a',38747.5, 'NOVARTIS CONSUMER HEALTH', @OrderID OUTPUT
EXEC dbo.AddOrder '06014201  ','0001',' ',38749.5, 'NOVARTIS CONSUMER HEALTH', @OrderID OUTPUT
EXEC dbo.AddOrder '06014202  ','0001',' ',38749.5, 'NOVARTIS CONSUMER HEALTH', @OrderID OUTPUT
EXEC dbo.AddOrder '06014203  ','0001',' ',38748.5, 'NOVARTIS CONSUMER HEALTH', @OrderID OUTPUT
EXEC dbo.AddOrder '06014205  ','0001',' ',38762.5, 'GEORGIA-PACIFIC FRANCE', @OrderID OUTPUT
EXEC dbo.AddOrder '06014206  ','0001',' ',38766.5, 'GEORGIA-PACIFIC FRANCE', @OrderID OUTPUT
EXEC dbo.AddOrder '06014208  ','0001',' ',38749.5, 'S.M.A.E. ZI METZ BORNY (', @OrderID OUTPUT
EXEC dbo.AddOrder '06014210  ','0001',' ',38749.5, 'S.M.A.E. ZI METZ BORNY (', @OrderID OUTPUT
EXEC dbo.AddOrder '06014211  ','0001',' ',38749.5, 'S.M.A.E. ZI METZ BORNY (', @OrderID OUTPUT
EXEC dbo.AddOrder '06014212  ','0001',' ',38749.5, 'S.M.A.E. ZI METZ BORNY (', @OrderID OUTPUT
EXEC dbo.AddOrder '06014213  ','0001',' ',38749.5, 'S.M.A.E. ZI METZ BORNY (', @OrderID OUTPUT
EXEC dbo.AddOrder '06014214  ','0001',' ',38749.5, 'S.M.A.E. ZI METZ BORNY (', @OrderID OUTPUT
EXEC dbo.AddOrder '06014216  ','0001',' ',38749.5, 'S.M.A.E. ZI METZ BORNY (', @OrderID OUTPUT
EXEC dbo.AddOrder '06014217  ','0001',' ',38749.5, 'S.M.A.E. ZI METZ BORNY (', @OrderID OUTPUT
EXEC dbo.AddOrder '06014218  ','0001',' ',38749.5, 'S.M.A.E. ZI METZ BORNY (', @OrderID OUTPUT
EXEC dbo.AddOrder '06014220  ','0001',' ',38749.5, 'S.M.A.E. ZI METZ BORNY (', @OrderID OUTPUT
EXEC dbo.AddOrder '06014221  ','0001',' ',38749.5, 'S.M.A.E. ZI METZ BORNY (', @OrderID OUTPUT
EXEC dbo.AddOrder '06014222  ','0001',' ',38749.5, 'S.M.A.E. ZI METZ BORNY (', @OrderID OUTPUT
EXEC dbo.AddOrder '06014224  ','0001',' ',38755.5, 'SCHWEITZER S.A.', @OrderID OUTPUT
EXEC dbo.AddOrder '06014225  ','0001',' ',38755.5, 'SCHWEITZER S.A.', @OrderID OUTPUT
EXEC dbo.AddOrder '06014226  ','0001',' ',38755.5, 'SCHWEITZER S.A.', @OrderID OUTPUT
EXEC dbo.AddOrder '06014227  ','0001',' ',38755.5, 'SCHWEITZER S.A.', @OrderID OUTPUT
EXEC dbo.AddOrder '06014229  ','0001',' ',38774.5, 'CIMEX AG/LTD', @OrderID OUTPUT
EXEC dbo.AddOrder '06014234  ','0001',' ',38753.5, 'ROBOT COUPE', @OrderID OUTPUT
EXEC dbo.AddOrder '06014235  ','0001',' ',38760.5, 'CUISINES SCHMIDT SALM SA', @OrderID OUTPUT
EXEC dbo.AddOrder '06014236  ','0001',' ',38760.5, 'CUISINES SCHMIDT SALM SA', @OrderID OUTPUT
EXEC dbo.AddOrder '06014238  ','0001',' ',38753.5, 'CARTONNAGES BERTRAND - N', @OrderID OUTPUT
EXEC dbo.AddOrder '06014241  ','0001',' ',38753.5, 'CARTONNAGES BERTRAND - N', @OrderID OUTPUT
EXEC dbo.AddOrder '06014242  ','0001',' ',38753.5, 'CARTONNAGES BERTRAND - N', @OrderID OUTPUT
EXEC dbo.AddOrder '06014249  ','0001',' ',38759.5, 'B.V.ALVERIMPORT', @OrderID OUTPUT
EXEC dbo.AddOrder '06014251  ','0001',' ',38766.5, 'AVERY DENNISON COMPAGNY', @OrderID OUTPUT
EXEC dbo.AddOrder '06014252  ','0001',' ',38763.5, 'AVERY DENNISON COMPAGNY', @OrderID OUTPUT
EXEC dbo.AddOrder '06014254  ','0001',' ',38748.5, 'TRISS SPOL.S.R.O.', @OrderID OUTPUT
EXEC dbo.AddOrder '06014256  ','0001',' ',38753.5, 'CHAPEL', @OrderID OUTPUT
EXEC dbo.AddOrder '06014260  ','0001',' ',38753.5, 'WIRTH VERPACKUNGEN GMBH', @OrderID OUTPUT
EXEC dbo.AddOrder '06014264  ','0001',' ',38745.5, 'NESTLE WATERS SUPPLY EST', @OrderID OUTPUT
EXEC dbo.AddOrder '06014265  ','0001',' ',38752.5, 'PETER O. PURSCH', @OrderID OUTPUT
EXEC dbo.AddOrder '06014266  ','0001',' ',38752.5, 'PETER O. PURSCH', @OrderID OUTPUT
EXEC dbo.AddOrder '06014269  ','0001',' ',38747.5, 'SAINT GOBAIN ISOVER', @OrderID OUTPUT
EXEC dbo.AddOrder '06014270  ','0001',' ',38753.5, 'DOERENTRUP FEUERFESTPROD', @OrderID OUTPUT
EXEC dbo.AddOrder '06014272  ','0001',' ',38748.5, 'DS SMITH KAYSERSBERG', @OrderID OUTPUT
EXEC dbo.AddOrder '06014274  ','0001',' ',38756.5, 'STOEBER ANTRIEBSTECHNIK', @OrderID OUTPUT
EXEC dbo.AddOrder '06014275  ','0001',' ',38756.5, 'STOEBER ANTRIEBSTECHNIK', @OrderID OUTPUT
EXEC dbo.AddOrder '06014277  ','0001',' ',38754.5, 'DITTE GMBH', @OrderID OUTPUT
EXEC dbo.AddOrder '06014278  ','0001',' ',38780.5, 'DITTE GMBH', @OrderID OUTPUT
EXEC dbo.AddOrder '06014279  ','0001',' ',38773.5, 'DITTE GMBH', @OrderID OUTPUT
EXEC dbo.AddOrder '06014282  ','0001',' ',38749.5, 'H T L VERPACKUNG GMBH', @OrderID OUTPUT
EXEC dbo.AddOrder '06014283  ','0001',' ',38752.5, 'DS SMITH KAYPAC', @OrderID OUTPUT
EXEC dbo.AddOrder '06014284  ','0001',' ',38752.5, 'DS SMITH KAYPAC', @OrderID OUTPUT
EXEC dbo.AddOrder '06014287  ','0001',' ',38753.5, 'NESTLE WATERS SUPPLY EST', @OrderID OUTPUT
EXEC dbo.AddOrder '06014290  ','0001',' ',38753.5, 'NESTLE WATERS SUPPLY EST', @OrderID OUTPUT
EXEC dbo.AddOrder '06014292  ','0001',' ',38752.5, 'NESTLE WATERS SUPPLY EST', @OrderID OUTPUT
EXEC dbo.AddOrder '06014293  ','0001',' ',38747.5, 'TECUMSEH EUROPE S.A.', @OrderID OUTPUT
EXEC dbo.AddOrder '06014295  ','0001',' ',38759.5, 'DIEFENBACH VERPACKUNGEN', @OrderID OUTPUT
EXEC dbo.AddOrder '06014296  ','0001',' ',38754.5, 'TECUMSEH EUROPE S.A.', @OrderID OUTPUT
EXEC dbo.AddOrder '06014297  ','0001',' ',38763.5, 'TECUMSEH EUROPE S.A.', @OrderID OUTPUT
EXEC dbo.AddOrder '06014298  ','0001',' ',38767.5, 'TECUMSEH EUROPE S.A.', @OrderID OUTPUT
EXEC dbo.AddOrder '06014300  ','0001',' ',38752.5, 'TECUMSEH EUROPE S.A.', @OrderID OUTPUT
EXEC dbo.AddOrder '06014301  ','0001',' ',38741.5, 'JTEKT AUTOMOBILE', @OrderID OUTPUT
EXEC dbo.AddOrder '06014302  ','0001',' ',38760.5, 'PEUGEOT CITROEN AUTOMOBI', @OrderID OUTPUT
EXEC dbo.AddOrder '06014305  ','0001',' ',38756.5, 'STERLING (STE ELECTRIQUE', @OrderID OUTPUT
EXEC dbo.AddOrder '06014309  ','0001',' ',38752.5, 'DS SMITH KAYSERSBERG', @OrderID OUTPUT
EXEC dbo.AddOrder '06014312  ','0001',' ',38747.5, 'J.LUEBER GMBH', @OrderID OUTPUT
EXEC dbo.AddOrder '06014313  ','0001',' ',38747.5, 'J.LUEBER GMBH', @OrderID OUTPUT
EXEC dbo.AddOrder '06014319  ','0001',' ',38770.5, 'LINDAL-FRANCE', @OrderID OUTPUT
EXEC dbo.AddOrder '06014320  ','0001',' ',38748.5, 'TRISS SPOL.S.R.O.', @OrderID OUTPUT
EXEC dbo.AddOrder '06014321  ','0001',' ',38748.5, 'TRISS SPOL.S.R.O.', @OrderID OUTPUT
EXEC dbo.AddOrder '06014322  ','0001',' ',38748.5, 'TRISS SPOL.S.R.O.', @OrderID OUTPUT
EXEC dbo.AddOrder '06014323  ','0001',' ',38748.5, 'TRISS SPOL.S.R.O.', @OrderID OUTPUT
EXEC dbo.AddOrder '06014324  ','0001',' ',38749.5, 'TRISS SPOL.S.R.O.', @OrderID OUTPUT
EXEC dbo.AddOrder '06014326  ','0001',' ',38754.5, 'NESTLE WATERS SUPPLY EST', @OrderID OUTPUT
EXEC dbo.AddOrder '06014329  ','0001',' ',38746.5, 'NESTLE WATERS SUPPLY EST', @OrderID OUTPUT
EXEC dbo.AddOrder '06014329  ','0001','a',38756.5, 'NESTLE WATERS SUPPLY EST', @OrderID OUTPUT
EXEC dbo.AddOrder '06014331  ','0001',' ',38746.5, 'NESTLE WATERS SUPPLY EST', @OrderID OUTPUT
EXEC dbo.AddOrder '06014333  ','0001',' ',38746.5, 'NESTLE WATERS SUPPLY EST', @OrderID OUTPUT
EXEC dbo.AddOrder '06014335  ','0001',' ',38754.5, 'NESTLE WATERS SUPPLY EST', @OrderID OUTPUT
EXEC dbo.AddOrder '06014337  ','0001',' ',38755.5, 'NESTLE WATERS SUPPLY EST', @OrderID OUTPUT
EXEC dbo.AddOrder '06014339  ','0001',' ',38755.5, 'NESTLE WATERS SUPPLY EST', @OrderID OUTPUT
EXEC dbo.AddOrder '06014341  ','0001',' ',38756.5, 'NESTLE WATERS SUPPLY EST', @OrderID OUTPUT
EXEC dbo.AddOrder '06014343  ','0001',' ',38763.5, 'COGESAL MIKO-FSEUR 58488', @OrderID OUTPUT
EXEC dbo.AddOrder '06014345  ','0001',' ',38756.5, 'NESTLE WATERS SUPPLY EST', @OrderID OUTPUT
EXEC dbo.AddOrder '06014346  ','0001',' ',38763.5, 'COGESAL MIKO-FSEUR 58488', @OrderID OUTPUT
EXEC dbo.AddOrder '06014348  ','0001',' ',38768.5, 'COGESAL MIKO-FSEUR 58488', @OrderID OUTPUT
EXEC dbo.AddOrder '06014350  ','0001',' ',38756.5, 'DU PONT DE NEMOURS (FRAN', @OrderID OUTPUT
EXEC dbo.AddOrder '06014350  ','0001','a',38763.5, 'DU PONT DE NEMOURS (FRAN', @OrderID OUTPUT
EXEC dbo.AddOrder '06014352  ','0001',' ',38756.5, 'DU PONT DE NEMOURS (FRAN', @OrderID OUTPUT
EXEC dbo.AddOrder '06014352  ','0001','a',38763.5, 'DU PONT DE NEMOURS (FRAN', @OrderID OUTPUT
EXEC dbo.AddOrder '06014353  ','0001',' ',38747.5, 'CART.EMBAL. RHONE ALPES', @OrderID OUTPUT
EXEC dbo.AddOrder '06014355  ','0001',' ',38752.5, 'CARTONNAGES BERTRAND - N', @OrderID OUTPUT
EXEC dbo.AddOrder '06014357  ','0001',' ',38753.5, 'S.M.A.E. ZI METZ BORNY (', @OrderID OUTPUT
EXEC dbo.AddOrder '06014358  ','0001',' ',38753.5, 'S.M.A.E. ZI METZ BORNY (', @OrderID OUTPUT
EXEC dbo.AddOrder '06014359  ','0001',' ',38753.5, 'S.M.A.E. ZI METZ BORNY (', @OrderID OUTPUT
EXEC dbo.AddOrder '06014360  ','0001',' ',38753.5, 'S.M.A.E. ZI METZ BORNY (', @OrderID OUTPUT
EXEC dbo.AddOrder '06014361  ','0001',' ',38753.5, 'S.M.A.E. ZI METZ BORNY (', @OrderID OUTPUT
EXEC dbo.AddOrder '06014362  ','0001',' ',38754.5, 'W. WIRTH GMBH', @OrderID OUTPUT
EXEC dbo.AddOrder '06014366  ','0001',' ',38762.5, 'DU PONT DE NEMOURS S.A.', @OrderID OUTPUT
EXEC dbo.AddOrder '06014368  ','0001',' ',38756.5, 'TIMKEN EUROPE', @OrderID OUTPUT
EXEC dbo.AddOrder '06014369  ','0001',' ',38755.5, 'TIMKEN EUROPE', @OrderID OUTPUT
EXEC dbo.AddOrder '06014370  ','0001',' ',38755.5, 'TIMKEN EUROPE', @OrderID OUTPUT
EXEC dbo.AddOrder '06014371  ','0001',' ',38749.5, 'REAL - PACK GMBH', @OrderID OUTPUT
EXEC dbo.AddOrder '06014371  ','0002',' ',38749.5, 'REAL - PACK GMBH', @OrderID OUTPUT
EXEC dbo.AddOrder '06014373  ','0001',' ',38748.5, 'WELL-PACK AG', @OrderID OUTPUT
EXEC dbo.AddOrder '06014375  ','0001',' ',38756.5, 'SARKOS S.A.', @OrderID OUTPUT
EXEC dbo.AddOrder '06014375  ','0001','a',38761.5, 'SARKOS S.A.', @OrderID OUTPUT
EXEC dbo.AddOrder '06014381  ','0001',' ',38760.5, 'TIMKEN EUROPE', @OrderID OUTPUT
EXEC dbo.AddOrder '06014382  ','0001',' ',38747.5, 'CART.EMBAL. RHONE ALPES', @OrderID OUTPUT
EXEC dbo.AddOrder '06014383  ','0001',' ',38763.5, 'PRODINGER VERPACKUNG', @OrderID OUTPUT
EXEC dbo.AddOrder '06014385  ','0001',' ',38760.5, 'PRODINGER VERPACKUNG', @OrderID OUTPUT
EXEC dbo.AddOrder '06014386  ','0001',' ',38760.5, 'PRODINGER VERPACKUNG', @OrderID OUTPUT
EXEC dbo.AddOrder '06014387  ','0001',' ',38754.5, 'CARTONNAGES BERTRAND - N', @OrderID OUTPUT
EXEC dbo.AddOrder '06014388  ','0001',' ',38763.5, 'INTERGESTION', @OrderID OUTPUT
EXEC dbo.AddOrder '06014389  ','0001',' ',38752.5, 'REHAU AG & CO', @OrderID OUTPUT
EXEC dbo.AddOrder '06014390  ','0001',' ',38747.5, 'CART.EMBAL. RHONE ALPES', @OrderID OUTPUT
EXEC dbo.AddOrder '06014393  ','0001',' ',38770.5, 'JDW SPEDITION + LOGISTIK', @OrderID OUTPUT
EXEC dbo.AddOrder '06014396  ','0001',' ',38769.5, 'JDW SPEDITION + LOGISTIK', @OrderID OUTPUT
EXEC dbo.AddOrder '06014397  ','0001',' ',38776.5, 'JDW SPEDITION + LOGISTIK', @OrderID OUTPUT
EXEC dbo.AddOrder '06014399  ','0001',' ',38754.5, 'NOVARTIS CONSUMER HEALTH', @OrderID OUTPUT
EXEC dbo.AddOrder '06014402  ','0001',' ',38767.5, 'TRISS SPOL.S.R.O.', @OrderID OUTPUT
EXEC dbo.AddOrder '06014403  ','0001',' ',38754.5, 'GEPMAN S.A.S', @OrderID OUTPUT
EXEC dbo.AddOrder '06014409  ','0001',' ',38756.5, 'ECLAIRAGE TECHNIQUE', @OrderID OUTPUT
EXEC dbo.AddOrder '06014412  ','0001',' ',38752.5, 'VISTEON SYSTEMES INTERIE', @OrderID OUTPUT
EXEC dbo.AddOrder '06014417  ','0001',' ',38748.5, 'VISTEON SYSTEMES INTERIE', @OrderID OUTPUT
EXEC dbo.AddOrder '06014417  ','0002',' ',38752.5, 'VISTEON SYSTEMES INTERIE', @OrderID OUTPUT
EXEC dbo.AddOrder '06014417  ','0003',' ',38756.5, 'VISTEON SYSTEMES INTERIE', @OrderID OUTPUT
EXEC dbo.AddOrder '06014419  ','0001',' ',38749.5, 'AMERICAN STANDARD EUROPE', @OrderID OUTPUT
EXEC dbo.AddOrder '06014420  ','0001',' ',38754.5, 'AMERICAN STANDARD EUROPE', @OrderID OUTPUT
EXEC dbo.AddOrder '06014421  ','0001',' ',38749.5, 'AMERICAN STANDARD EUROPE', @OrderID OUTPUT
EXEC dbo.AddOrder '06014424  ','0001',' ',38755.5, 'ED.FRIEDRICH & CO GMBH', @OrderID OUTPUT
EXEC dbo.AddOrder '06014427  ','0001',' ',38752.5, 'ED.FRIEDRICH & CO GMBH', @OrderID OUTPUT
EXEC dbo.AddOrder '06014428  ','0001',' ',38749.5, 'AMERICAN STANDARD EUROPE', @OrderID OUTPUT
EXEC dbo.AddOrder '06014429  ','0001',' ',38749.5, 'HEIDE WERKSTAETTEN E.V.', @OrderID OUTPUT
EXEC dbo.AddOrder '06014430  ','0001',' ',38754.5, 'HEIDE WERKSTAETTEN E.V.', @OrderID OUTPUT
EXEC dbo.AddOrder '06014431  ','0001',' ',38747.5, 'CART.EMBAL. RHONE ALPES', @OrderID OUTPUT
EXEC dbo.AddOrder '06014432  ','0001',' ',38767.5, 'WIRTH VERPACKUNGEN GMBH', @OrderID OUTPUT
EXEC dbo.AddOrder '06014434  ','0001',' ',38766.5, 'HERO FRANCE', @OrderID OUTPUT
EXEC dbo.AddOrder '06014435  ','0001',' ',38766.5, 'HERO FRANCE', @OrderID OUTPUT
EXEC dbo.AddOrder '06014436  ','0001',' ',38766.5, 'HERO FRANCE', @OrderID OUTPUT
EXEC dbo.AddOrder '06014437  ','0001',' ',38766.5, 'HERO FRANCE', @OrderID OUTPUT
EXEC dbo.AddOrder '06014439  ','0001',' ',38760.5, 'DS SMITH KAYPAC', @OrderID OUTPUT
EXEC dbo.AddOrder '06014441  ','0001',' ',38755.5, 'SCHWEITZER S.A.', @OrderID OUTPUT
EXEC dbo.AddOrder '06014443  ','0001',' ',38753.5, 'COGESAL MIKO-FSEUR 58488', @OrderID OUTPUT
EXEC dbo.AddOrder '06014445  ','0001',' ',38753.5, 'LORMA', @OrderID OUTPUT
EXEC dbo.AddOrder '06014447  ','0001',' ',38756.5, 'PAPETERIES DES VOSGES', @OrderID OUTPUT
EXEC dbo.AddOrder '06014447  ','0001','a',38756.5, 'PAPETERIES DES VOSGES', @OrderID OUTPUT
EXEC dbo.AddOrder '06014447  ','0001','b',38756.5, 'PAPETERIES DES VOSGES', @OrderID OUTPUT
EXEC dbo.AddOrder '06014451  ','0001',' ',38756.5, 'JTEKT AUTOMOBILE LYON', @OrderID OUTPUT
EXEC dbo.AddOrder '06014453  ','0001',' ',38756.5, 'HORN VERPACKUNG GMBH', @OrderID OUTPUT
EXEC dbo.AddOrder '06014459  ','0001',' ',38747.5, 'BRASSERIES KRONENBOURG 5', @OrderID OUTPUT
EXEC dbo.AddOrder '06014459  ','0001','a',38753.5, 'BRASSERIES KRONENBOURG 5', @OrderID OUTPUT
EXEC dbo.AddOrder '06014462  ','0001',' ',38747.5, 'BRASSERIES KRONENBOURG 5', @OrderID OUTPUT
EXEC dbo.AddOrder '06014466  ','0001',' ',38747.5, 'BRASSERIES KRONENBOURG 5', @OrderID OUTPUT
EXEC dbo.AddOrder '06014468  ','0001',' ',38747.5, 'BRASSERIES KRONENBOURG 5', @OrderID OUTPUT
EXEC dbo.AddOrder '06014470  ','0001',' ',38747.5, 'BRASSERIES KRONENBOURG 5', @OrderID OUTPUT
EXEC dbo.AddOrder '06014472  ','0001',' ',38752.5, 'BRASSERIES KRONENBOURG 5', @OrderID OUTPUT
EXEC dbo.AddOrder '06014474  ','0001',' ',38747.5, 'BRASSERIES KRONENBOURG 5', @OrderID OUTPUT
EXEC dbo.AddOrder '06014476  ','0001',' ',38756.5, 'SOMFY', @OrderID OUTPUT
EXEC dbo.AddOrder '06014478  ','0001',' ',38747.5, 'BRASSERIES KRONENBOURG 5', @OrderID OUTPUT
EXEC dbo.AddOrder '06014480  ','0001',' ',38780.5, 'SOMFY', @OrderID OUTPUT
EXEC dbo.AddOrder '06014481  ','0001',' ',38747.5, 'BRASSERIES KRONENBOURG 5', @OrderID OUTPUT
EXEC dbo.AddOrder '06014485  ','0001',' ',38756.5, 'DS SMITH KAYPAC', @OrderID OUTPUT
EXEC dbo.AddOrder '06014487  ','0001',' ',38756.5, 'DS SMITH KAYPAC', @OrderID OUTPUT
EXEC dbo.AddOrder '06014487  ','0001','a',38756.5, 'DS SMITH KAYPAC', @OrderID OUTPUT
EXEC dbo.AddOrder '06014489  ','0001',' ',38753.5, 'BRASSERIE FISCHER SA', @OrderID OUTPUT
EXEC dbo.AddOrder '06014491  ','0001',' ',38748.5, 'SA. BOULANGERIE NEUHAUSE', @OrderID OUTPUT
EXEC dbo.AddOrder '06014493  ','0001',' ',38748.5, 'SA. BOULANGERIE NEUHAUSE', @OrderID OUTPUT
EXEC dbo.AddOrder '06014500  ','0001',' ',38747.5, 'NESTLE WATERS SUPPLY EST', @OrderID OUTPUT
EXEC dbo.AddOrder '06014502  ','0001',' ',38755.5, 'BUBENDORFF VOLET ROULANT', @OrderID OUTPUT
EXEC dbo.AddOrder '06014503  ','0001',' ',38755.5, 'BUBENDORFF VOLET ROULANT', @OrderID OUTPUT
EXEC dbo.AddOrder '06014504  ','0001',' ',38755.5, 'BUBENDORFF VOLET ROULANT', @OrderID OUTPUT
EXEC dbo.AddOrder '06014506  ','0001',' ',38752.5, 'COGESAL MIKO-FSEUR 58488', @OrderID OUTPUT
EXEC dbo.AddOrder '06014508  ','0001',' ',38753.5, 'STE WRIGLEY FRANCE S.N.C', @OrderID OUTPUT
EXEC dbo.AddOrder '06014508  ','0001','a',38753.5, 'STE WRIGLEY FRANCE S.N.C', @OrderID OUTPUT
EXEC dbo.AddOrder '06014510  ','0001',' ',38753.5, 'STE WRIGLEY FRANCE S.N.C', @OrderID OUTPUT
EXEC dbo.AddOrder '06014512  ','0001',' ',38753.5, 'STE WRIGLEY FRANCE S.N.C', @OrderID OUTPUT
EXEC dbo.AddOrder '06014514  ','0001',' ',38753.5, 'STE WRIGLEY FRANCE S.N.C', @OrderID OUTPUT
EXEC dbo.AddOrder '06014516  ','0001',' ',38753.5, 'STE WRIGLEY FRANCE S.N.C', @OrderID OUTPUT
EXEC dbo.AddOrder '06014518  ','0001',' ',38753.5, 'STE WRIGLEY FRANCE S.N.C', @OrderID OUTPUT
EXEC dbo.AddOrder '06014520  ','0001',' ',38753.5, 'STE WRIGLEY FRANCE S.N.C', @OrderID OUTPUT
EXEC dbo.AddOrder '06014522  ','0001',' ',38753.5, 'STE WRIGLEY FRANCE S.N.C', @OrderID OUTPUT
EXEC dbo.AddOrder '06014524  ','0001',' ',38753.5, 'STE WRIGLEY FRANCE S.N.C', @OrderID OUTPUT
EXEC dbo.AddOrder '06014526  ','0001',' ',38753.5, 'STE WRIGLEY FRANCE S.N.C', @OrderID OUTPUT
EXEC dbo.AddOrder '06014528  ','0001',' ',38753.5, 'STE WRIGLEY FRANCE S.N.C', @OrderID OUTPUT
EXEC dbo.AddOrder '06014530  ','0001',' ',38753.5, 'STE WRIGLEY FRANCE S.N.C', @OrderID OUTPUT
EXEC dbo.AddOrder '06014532  ','0001',' ',38753.5, 'STE WRIGLEY FRANCE S.N.C', @OrderID OUTPUT
EXEC dbo.AddOrder '06014535  ','0001',' ',38762.5, 'TRISS SPOL.S.R.O.', @OrderID OUTPUT
EXEC dbo.AddOrder '06014539  ','0001',' ',38755.5, 'NEXANS SCHWEIZ AG', @OrderID OUTPUT
EXEC dbo.AddOrder '06014541  ','0001',' ',38760.5, 'WALZ VERPACKUNGEN E.K.', @OrderID OUTPUT
EXEC dbo.AddOrder '06014543  ','0001',' ',38753.5, 'GEORGIA-PACIFIC FRANCE', @OrderID OUTPUT
EXEC dbo.AddOrder '06014545  ','0001',' ',38753.5, 'GEORGIA-PACIFIC FRANCE', @OrderID OUTPUT
EXEC dbo.AddOrder '06014547  ','0001',' ',38767.5, 'VON ROLL SUISSE SA', @OrderID OUTPUT
EXEC dbo.AddOrder '06014550  ','0001',' ',38752.5, 'THK MANUFACTURING OF EUR', @OrderID OUTPUT
EXEC dbo.AddOrder '06014554  ','0001',' ',38762.5, 'STE WRIGLEY FRANCE S.N.C', @OrderID OUTPUT
EXEC dbo.AddOrder '06014556  ','0001',' ',38762.5, 'STE WRIGLEY FRANCE S.N.C', @OrderID OUTPUT
EXEC dbo.AddOrder '06014556  ','0001','a',38762.5, 'STE WRIGLEY FRANCE S.N.C', @OrderID OUTPUT
EXEC dbo.AddOrder '06014558  ','0001',' ',38756.5, 'THK MANUFACTURING OF EUR', @OrderID OUTPUT
EXEC dbo.AddOrder '06014559  ','0001',' ',38762.5, 'STE WRIGLEY FRANCE S.N.C', @OrderID OUTPUT
EXEC dbo.AddOrder '06014562  ','0001',' ',38759.5, 'PRODINGER OHG*STEINEN*', @OrderID OUTPUT
EXEC dbo.AddOrder '06014563  ','0001',' ',38762.5, 'STE WRIGLEY FRANCE S.N.C', @OrderID OUTPUT
EXEC dbo.AddOrder '06014566  ','0001',' ',38762.5, 'STE WRIGLEY FRANCE S.N.C', @OrderID OUTPUT
EXEC dbo.AddOrder '06014568  ','0001',' ',38763.5, 'STE SIMU', @OrderID OUTPUT
EXEC dbo.AddOrder '06014570  ','0001',' ',38762.5, 'STE WRIGLEY FRANCE S.N.C', @OrderID OUTPUT
EXEC dbo.AddOrder '06014572  ','0001',' ',38756.5, 'STE SIMU', @OrderID OUTPUT
EXEC dbo.AddOrder '06014574  ','0001',' ',38762.5, 'STE WRIGLEY FRANCE S.N.C', @OrderID OUTPUT
EXEC dbo.AddOrder '06014575  ','0001',' ',38752.5, 'STE SIMU', @OrderID OUTPUT
EXEC dbo.AddOrder '06014577  ','0001',' ',38752.5, 'STE SIMU', @OrderID OUTPUT
EXEC dbo.AddOrder '06014580  ','0001',' ',38756.5, 'W. WIRTH GMBH', @OrderID OUTPUT
EXEC dbo.AddOrder '06014583  ','0001',' ',38761.5, 'K.-J. KOPP GMBH', @OrderID OUTPUT
EXEC dbo.AddOrder '06014584  ','0001',' ',38763.5, 'ROBOT COUPE', @OrderID OUTPUT
EXEC dbo.AddOrder '06014586  ','0001',' ',38752.5, 'GENERAL MOTORS STRASBOUR', @OrderID OUTPUT
EXEC dbo.AddOrder '06014587  ','0001',' ',38748.5, 'DS SMITH KAYPAC', @OrderID OUTPUT
EXEC dbo.AddOrder '06014589  ','0001',' ',38784.5, 'ALUMINIUM-KONSTRUKTIONST', @OrderID OUTPUT
EXEC dbo.AddOrder '06014590  ','0001',' ',38762.5, 'ALUMINIUM-KONSTRUKTIONST', @OrderID OUTPUT
EXEC dbo.AddOrder '06014592  ','0001',' ',38748.5, 'DS SMITH KAYPAC', @OrderID OUTPUT
EXEC dbo.AddOrder '06014592  ','0001','a',38748.5, 'DS SMITH KAYPAC', @OrderID OUTPUT
EXEC dbo.AddOrder '06014594  ','0001',' ',38762.5, 'SA CEDI PACKAGING', @OrderID OUTPUT
EXEC dbo.AddOrder '06014597  ','0001',' ',38770.5, 'S.A. PEUGEOT MOTOCYCLES', @OrderID OUTPUT
EXEC dbo.AddOrder '06014600  ','0001',' ',38755.5, 'NESTLE WATERS SUPPLY EST', @OrderID OUTPUT
EXEC dbo.AddOrder '06014603  ','0001',' ',38748.5, 'ARBORA & AUSONIA', @OrderID OUTPUT
EXEC dbo.AddOrder '06014605  ','0001',' ',38746.5, 'ARBORA & AUSONIA', @OrderID OUTPUT
EXEC dbo.AddOrder '06014608  ','0001',' ',38749.5, 'ARBORA & AUSONIA', @OrderID OUTPUT
EXEC dbo.AddOrder '06014611  ','0001',' ',38753.5, 'ARBORA & AUSONIA', @OrderID OUTPUT
EXEC dbo.AddOrder '06014613  ','0001',' ',38755.5, 'ARBORA & AUSONIA', @OrderID OUTPUT
EXEC dbo.AddOrder '06014615  ','0001',' ',38753.5, 'BRASSERIE FISCHER SA', @OrderID OUTPUT
EXEC dbo.AddOrder '06014616  ','0001',' ',38763.5, 'ERWIN ROTH VERPACKUNGSTE', @OrderID OUTPUT
EXEC dbo.AddOrder '06014616  ','0001','a',38767.5, 'ERWIN ROTH VERPACKUNGSTE', @OrderID OUTPUT
EXEC dbo.AddOrder '06014616  ','0001','b',38763.5, 'ERWIN ROTH VERPACKUNGSTE', @OrderID OUTPUT
EXEC dbo.AddOrder '06014617  ','0001',' ',38763.5, 'ERWIN ROTH VERPACKUNGSTE', @OrderID OUTPUT
EXEC dbo.AddOrder '06014618  ','0001',' ',38756.5, 'ARBORA & AUSONIA', @OrderID OUTPUT
EXEC dbo.AddOrder '06014621  ','0001',' ',38760.5, 'ARBORA & AUSONIA', @OrderID OUTPUT
EXEC dbo.AddOrder '06014626  ','0001',' ',38767.5, 'CART.EMBAL. RHONE ALPES', @OrderID OUTPUT
EXEC dbo.AddOrder '06014633  ','0001',' ',38767.5, 'STE ALSA-CORK', @OrderID OUTPUT
EXEC dbo.AddOrder '06014636  ','0001',' ',38754.5, 'LINDAL-FRANCE', @OrderID OUTPUT
EXEC dbo.AddOrder '06014637  ','0001',' ',38759.5, 'LINDAL-FRANCE', @OrderID OUTPUT
EXEC dbo.AddOrder '06014638  ','0001',' ',38760.5, 'LINDAL-FRANCE', @OrderID OUTPUT
EXEC dbo.AddOrder '06014641  ','0001',' ',38781.5, 'S.A. PEUGEOT MOTOCYCLES', @OrderID OUTPUT
EXEC dbo.AddOrder '06014644  ','0001',' ',38760.5, 'CART.EMBAL. RHONE ALPES', @OrderID OUTPUT
EXEC dbo.AddOrder '06014647  ','0001',' ',38773.5, 'STE ALSA-CORK', @OrderID OUTPUT
EXEC dbo.AddOrder '06014649  ','0001',' ',38752.5, 'DOW AGROSCIENCES', @OrderID OUTPUT
EXEC dbo.AddOrder '06014649  ','0001','a',38754.5, 'DOW AGROSCIENCES', @OrderID OUTPUT
EXEC dbo.AddOrder '06014649  ','0001','b',38752.5, 'DOW AGROSCIENCES', @OrderID OUTPUT
EXEC dbo.AddOrder '06014650  ','0001',' ',38752.5, 'DOW AGROSCIENCES', @OrderID OUTPUT
EXEC dbo.AddOrder '06014651  ','0001',' ',38752.5, 'DOW AGROSCIENCES', @OrderID OUTPUT
EXEC dbo.AddOrder '06014652  ','0001',' ',38752.5, 'DOW AGROSCIENCES', @OrderID OUTPUT
EXEC dbo.AddOrder '06014653  ','0001',' ',38753.5, 'DOW AGROSCIENCES', @OrderID OUTPUT
EXEC dbo.AddOrder '06014654  ','0001',' ',38753.5, 'DOW AGROSCIENCES', @OrderID OUTPUT
EXEC dbo.AddOrder '06014655  ','0001',' ',38753.5, 'DOW AGROSCIENCES', @OrderID OUTPUT
EXEC dbo.AddOrder '06014656  ','0001',' ',38753.5, 'DOW AGROSCIENCES', @OrderID OUTPUT
EXEC dbo.AddOrder '06014657  ','0001',' ',38753.5, 'DOW AGROSCIENCES', @OrderID OUTPUT
EXEC dbo.AddOrder '06014658  ','0001',' ',38753.5, 'DOW AGROSCIENCES', @OrderID OUTPUT
EXEC dbo.AddOrder '06014659  ','0001',' ',38753.5, 'DOW AGROSCIENCES', @OrderID OUTPUT
EXEC dbo.AddOrder '06014661  ','0001',' ',38752.5, 'DOW AGROSCIENCES SWITERL', @OrderID OUTPUT
EXEC dbo.AddOrder '06014662  ','0001',' ',38752.5, 'DOW AGROSCIENCES SWITERL', @OrderID OUTPUT
EXEC dbo.AddOrder '06014663  ','0001',' ',38752.5, 'DOW AGROSCIENCES SWITERL', @OrderID OUTPUT
EXEC dbo.AddOrder '06014664  ','0001',' ',38752.5, 'DOW AGROSCIENCES SWITERL', @OrderID OUTPUT
EXEC dbo.AddOrder '06014665  ','0001',' ',38752.5, 'DOW AGROSCIENCES SWITERL', @OrderID OUTPUT
EXEC dbo.AddOrder '06014666  ','0001',' ',38752.5, 'DOW AGROSCIENCES SWITERL', @OrderID OUTPUT
EXEC dbo.AddOrder '06014667  ','0001',' ',38752.5, 'DOW AGROSCIENCES SWITERL', @OrderID OUTPUT
EXEC dbo.AddOrder '06014668  ','0001',' ',38752.5, 'DOW AGROSCIENCES SWITERL', @OrderID OUTPUT
EXEC dbo.AddOrder '06014669  ','0001',' ',38752.5, 'DOW AGROSCIENCES SWITERL', @OrderID OUTPUT
EXEC dbo.AddOrder '06014670  ','0001',' ',38752.5, 'DOW AGROSCIENCES SWITERL', @OrderID OUTPUT
EXEC dbo.AddOrder '06014672  ','0001',' ',38753.5, 'DOW AGROSCIENCES SWITERL', @OrderID OUTPUT
EXEC dbo.AddOrder '06014674  ','0001',' ',38752.5, 'CART.EMBAL. RHONE ALPES', @OrderID OUTPUT
EXEC dbo.AddOrder '06014674  ','0001','a',38752.5, 'CART.EMBAL. RHONE ALPES', @OrderID OUTPUT
EXEC dbo.AddOrder '06014676  ','0001',' ',38748.5, 'SAEM DE RIBEAUVILLE', @OrderID OUTPUT
EXEC dbo.AddOrder '06014678  ','0001',' ',38774.5, 'DU PONT DE NEMOURS (FRAN', @OrderID OUTPUT
EXEC dbo.AddOrder '06014680  ','0001',' ',38748.5, 'NESTLE WATERS SUPPLY EST', @OrderID OUTPUT
EXEC dbo.AddOrder '06014682  ','0001',' ',38752.5, 'NESTLE WATERS SUPPLY EST', @OrderID OUTPUT
EXEC dbo.AddOrder '06014684  ','0001',' ',38752.5, 'NESTLE WATERS SUPPLY EST', @OrderID OUTPUT
EXEC dbo.AddOrder '06014686  ','0001',' ',38749.5, 'NESTLE WATERS SUPPLY EST', @OrderID OUTPUT
EXEC dbo.AddOrder '06014688  ','0001',' ',38752.5, 'NESTLE WATERS SUPPLY EST', @OrderID OUTPUT
EXEC dbo.AddOrder '06014690  ','0001',' ',38753.5, 'NESTLE WATERS SUPPLY EST', @OrderID OUTPUT
EXEC dbo.AddOrder '06014692  ','0001',' ',38748.5, 'NESTLE WATERS SUPPLY EST', @OrderID OUTPUT
EXEC dbo.AddOrder '06014694  ','0001',' ',38749.5, 'NESTLE WATERS SUPPLY EST', @OrderID OUTPUT
EXEC dbo.AddOrder '06014696  ','0001',' ',38753.5, 'STE WRIGLEY FRANCE S.N.C', @OrderID OUTPUT
EXEC dbo.AddOrder '06014698  ','0001',' ',38753.5, 'STE WRIGLEY FRANCE S.N.C', @OrderID OUTPUT
EXEC dbo.AddOrder '06014700  ','0001',' ',38753.5, 'STE WRIGLEY FRANCE S.N.C', @OrderID OUTPUT
EXEC dbo.AddOrder '06014703  ','0001',' ',38756.5, 'WELL-PACK AG', @OrderID OUTPUT
EXEC dbo.AddOrder '06014706  ','0001',' ',38752.5, 'CDF EMBALLAGE SA', @OrderID OUTPUT
EXEC dbo.AddOrder '06014708  ','0001',' ',38755.5, 'JÜRGEN BECKER RATIOFORM', @OrderID OUTPUT
EXEC dbo.AddOrder '06020010  ','0001',' ',38755.5, 'PEUGEOT CITROEN AUTOMOBI', @OrderID OUTPUT
EXEC dbo.AddOrder '06020013  ','0001',' ',38769.5, 'LSR PRODUCTION', @OrderID OUTPUT
EXEC dbo.AddOrder '06020015  ','0001',' ',38756.5, 'SCHNEIDER ELECTRIC FRANC', @OrderID OUTPUT
EXEC dbo.AddOrder '06020017  ','0001',' ',38753.5, 'S.M.A.E.    (EDI)', @OrderID OUTPUT
EXEC dbo.AddOrder '06020018  ','0001',' ',38753.5, 'S.M.A.E.    (EDI)', @OrderID OUTPUT
EXEC dbo.AddOrder '06020019  ','0001',' ',38753.5, 'S.M.A.E.    (EDI)', @OrderID OUTPUT
EXEC dbo.AddOrder '06020021  ','0001',' ',38753.5, 'S.M.A.E.    (EDI)', @OrderID OUTPUT
EXEC dbo.AddOrder '06020024  ','0001',' ',38756.5, 'S.M.A.E. ZI METZ BORNY (', @OrderID OUTPUT
EXEC dbo.AddOrder '06020025  ','0001',' ',38756.5, 'S.M.A.E. ZI METZ BORNY (', @OrderID OUTPUT
EXEC dbo.AddOrder '06020026  ','0001',' ',38756.5, 'S.M.A.E. ZI METZ BORNY (', @OrderID OUTPUT
EXEC dbo.AddOrder '06020027  ','0001',' ',38756.5, 'S.M.A.E. ZI METZ BORNY (', @OrderID OUTPUT
EXEC dbo.AddOrder '06020028  ','0001',' ',38756.5, 'S.M.A.E. ZI METZ BORNY (', @OrderID OUTPUT
EXEC dbo.AddOrder '06020030  ','0001',' ',38753.5, 'W. WIRTH GMBH', @OrderID OUTPUT
EXEC dbo.AddOrder '06020030  ','0001','a',38753.5, 'W. WIRTH GMBH', @OrderID OUTPUT
EXEC dbo.AddOrder '06020032  ','0001',' ',38752.5, 'DOWELANCO ITALIA S.R.L', @OrderID OUTPUT
EXEC dbo.AddOrder '06020032  ','0001','a',38752.5, 'DOWELANCO ITALIA S.R.L', @OrderID OUTPUT
EXEC dbo.AddOrder '06020034  ','0001',' ',38752.5, 'DOW AGROSCIENCES', @OrderID OUTPUT
EXEC dbo.AddOrder '06020035  ','0001',' ',38752.5, 'DOW AGROSCIENCES', @OrderID OUTPUT
EXEC dbo.AddOrder '06020037  ','0001',' ',38755.5, 'COGESAL MIKO-FSEUR 58488', @OrderID OUTPUT
EXEC dbo.AddOrder '06020038  ','0001',' ',38762.5, 'COGESAL MIKO-FSEUR 58488', @OrderID OUTPUT
EXEC dbo.AddOrder '06020039  ','0001',' ',38763.5, 'COGESAL MIKO-FSEUR 58488', @OrderID OUTPUT
EXEC dbo.AddOrder '06020040  ','0001',' ',38761.5, 'COGESAL MIKO-FSEUR 58488', @OrderID OUTPUT
EXEC dbo.AddOrder '06020042  ','0001',' ',38754.5, 'COGESAL MIKO-FSEUR 58488', @OrderID OUTPUT
EXEC dbo.AddOrder '06020043  ','0001',' ',38756.5, 'COGESAL MIKO-FSEUR 58488', @OrderID OUTPUT
EXEC dbo.AddOrder '06020043  ','0001','a',38756.5, 'COGESAL MIKO-FSEUR 58488', @OrderID OUTPUT
EXEC dbo.AddOrder '06020044  ','0001',' ',38759.5, 'COGESAL MIKO-FSEUR 58488', @OrderID OUTPUT
EXEC dbo.AddOrder '06020045  ','0001',' ',38759.5, 'COGESAL MIKO-FSEUR 58488', @OrderID OUTPUT
EXEC dbo.AddOrder '06020046  ','0001',' ',38760.5, 'COGESAL MIKO-FSEUR 58488', @OrderID OUTPUT
EXEC dbo.AddOrder '06020048  ','0001',' ',38754.5, 'COGESAL MIKO-FSEUR 58488', @OrderID OUTPUT
EXEC dbo.AddOrder '06020049  ','0001',' ',38756.5, 'COGESAL MIKO-FSEUR 58488', @OrderID OUTPUT
EXEC dbo.AddOrder '06020050  ','0001',' ',38759.5, 'COGESAL MIKO-FSEUR 58488', @OrderID OUTPUT
EXEC dbo.AddOrder '06020051  ','0001',' ',38761.5, 'COGESAL MIKO-FSEUR 58488', @OrderID OUTPUT
EXEC dbo.AddOrder '06020053  ','0001',' ',38755.5, 'COGESAL MIKO-FSEUR 58488', @OrderID OUTPUT
EXEC dbo.AddOrder '06020054  ','0001',' ',38756.5, 'COGESAL MIKO-FSEUR 58488', @OrderID OUTPUT
EXEC dbo.AddOrder '06020055  ','0001',' ',38759.5, 'COGESAL MIKO-FSEUR 58488', @OrderID OUTPUT
EXEC dbo.AddOrder '06020056  ','0001',' ',38760.5, 'COGESAL MIKO-FSEUR 58488', @OrderID OUTPUT
EXEC dbo.AddOrder '06020058  ','0001',' ',38756.5, 'COGESAL MIKO-FSEUR 58488', @OrderID OUTPUT
EXEC dbo.AddOrder '06020059  ','0001',' ',38759.5, 'COGESAL MIKO-FSEUR 58488', @OrderID OUTPUT
EXEC dbo.AddOrder '06020061  ','0001',' ',38760.5, 'COGESAL MIKO-FSEUR 58488', @OrderID OUTPUT
EXEC dbo.AddOrder '06020062  ','0001',' ',38761.5, 'COGESAL MIKO-FSEUR 58488', @OrderID OUTPUT
EXEC dbo.AddOrder '06020064  ','0001',' ',38755.5, 'S.M.A.E.    (EDI)', @OrderID OUTPUT
EXEC dbo.AddOrder '06020066  ','0001',' ',38756.5, 'GIKO KARTONAGEN GMBH', @OrderID OUTPUT
EXEC dbo.AddOrder '06020069  ','0001',' ',38756.5, 'PEUGEOT CITROEN AUTOMOBI', @OrderID OUTPUT
EXEC dbo.AddOrder '06020070  ','0001',' ',38770.5, 'DU PONT DE NEMOURS (FRAN', @OrderID OUTPUT
EXEC dbo.AddOrder '06020072  ','0001',' ',38754.5, 'COGESAL MIKO-FSEUR 58488', @OrderID OUTPUT
EXEC dbo.AddOrder '06020075  ','0001',' ',38759.5, 'CELLIER DES DAUPHINS', @OrderID OUTPUT
EXEC dbo.AddOrder '06020075  ','0001','a',38759.5, 'CELLIER DES DAUPHINS', @OrderID OUTPUT
EXEC dbo.AddOrder '06020076  ','0001',' ',38755.5, 'COGESAL MIKO-FSEUR 58488', @OrderID OUTPUT
EXEC dbo.AddOrder '06020077  ','0001',' ',38756.5, 'COGESAL MIKO-FSEUR 58488', @OrderID OUTPUT
EXEC dbo.AddOrder '06020078  ','0001',' ',38759.5, 'COGESAL MIKO-FSEUR 58488', @OrderID OUTPUT
EXEC dbo.AddOrder '06020079  ','0001',' ',38760.5, 'COGESAL MIKO-FSEUR 58488', @OrderID OUTPUT
EXEC dbo.AddOrder '06020081  ','0001',' ',38752.5, 'BRASSERIE FISCHER SA', @OrderID OUTPUT
EXEC dbo.AddOrder '06020083  ','0001',' ',38770.5, 'PEUGEOT CITROEN AUTOMOBI', @OrderID OUTPUT
EXEC dbo.AddOrder '06020085  ','0001',' ',38773.5, 'DSM ELASTOMERS EUROPE', @OrderID OUTPUT
EXEC dbo.AddOrder '06020086  ','0001',' ',38780.5, 'DSM ELASTOMERS EUROPE', @OrderID OUTPUT
EXEC dbo.AddOrder '06020087  ','0001',' ',38787.5, 'DSM ELASTOMERS EUROPE', @OrderID OUTPUT
EXEC dbo.AddOrder '06020089  ','0001',' ',38755.5, 'BRASSERIE FISCHER SA', @OrderID OUTPUT
EXEC dbo.AddOrder '06020091  ','0001',' ',38767.5, 'DELIPAPIER', @OrderID OUTPUT
EXEC dbo.AddOrder '06020091  ','0001','a',38767.5, 'DELIPAPIER', @OrderID OUTPUT
EXEC dbo.AddOrder '06020092  ','0001',' ',38755.5, 'AMERICAN STANDARD EUROPE', @OrderID OUTPUT
EXEC dbo.AddOrder '06020095  ','0001',' ',38754.5, 'DOW AGROSCIENCES SWITZEL', @OrderID OUTPUT
EXEC dbo.AddOrder '06020096  ','0001',' ',38767.5, 'WOLFBERGER', @OrderID OUTPUT
EXEC dbo.AddOrder '06020097  ','0001',' ',38767.5, 'WOLFBERGER', @OrderID OUTPUT
EXEC dbo.AddOrder '06020098  ','0001',' ',38767.5, 'WOLFBERGER', @OrderID OUTPUT
EXEC dbo.AddOrder '06020100  ','0001',' ',38756.5, 'BRASSERIE FISCHER SA', @OrderID OUTPUT
EXEC dbo.AddOrder '06020100  ','0001','a',38759.5, 'BRASSERIE FISCHER SA', @OrderID OUTPUT
EXEC dbo.AddOrder '06020102  ','0001',' ',38752.5, 'CART.EMBAL. RHONE ALPES', @OrderID OUTPUT
EXEC dbo.AddOrder '06020103  ','0001',' ',38752.5, 'DS SMITH KAYPAC', @OrderID OUTPUT
EXEC dbo.AddOrder '06020105  ','0001',' ',38753.5, 'SCHLIERBACHER KARTONAGEN', @OrderID OUTPUT
EXEC dbo.AddOrder '06020105  ','0002',' ',38753.5, 'SCHLIERBACHER KARTONAGEN', @OrderID OUTPUT
EXEC dbo.AddOrder '06020105  ','0004',' ',38753.5, 'SCHLIERBACHER KARTONAGEN', @OrderID OUTPUT
EXEC dbo.AddOrder '06020106  ','0001',' ',38754.5, 'CARTONNAGES ROSET', @OrderID OUTPUT
EXEC dbo.AddOrder '06020108  ','0001',' ',38763.5, 'DS SMITH KAYPAC', @OrderID OUTPUT
EXEC dbo.AddOrder '06020109  ','0001',' ',38766.5, 'RICOH INDUSTRIE FRANCE', @OrderID OUTPUT
EXEC dbo.AddOrder '06020111  ','0001',' ',38766.5, 'RICOH INDUSTRIE FRANCE', @OrderID OUTPUT
EXEC dbo.AddOrder '06020112  ','0001',' ',38768.5, 'WELL-PACK AG', @OrderID OUTPUT
EXEC dbo.AddOrder '06020113  ','0001',' ',38762.5, 'RICOH INDUSTRIE FRANCE', @OrderID OUTPUT
EXEC dbo.AddOrder '06020114  ','0001',' ',38756.5, 'RICOH INDUSTRIE FRANCE', @OrderID OUTPUT
EXEC dbo.AddOrder '06020115  ','0001',' ',38763.5, 'RICOH INDUSTRIE FRANCE', @OrderID OUTPUT
EXEC dbo.AddOrder '06020117  ','0001',' ',38763.5, 'VALFLEURI-PATES ALIMENT.', @OrderID OUTPUT
EXEC dbo.AddOrder '06020121  ','0001',' ',38749.5, 'NESTLE WATERS SUPPLY EST', @OrderID OUTPUT
EXEC dbo.AddOrder '06020123  ','0001',' ',38754.5, 'NESTLE WATERS SUPPLY EST', @OrderID OUTPUT
EXEC dbo.AddOrder '06020125  ','0001',' ',38755.5, 'NESTLE WATERS SUPPLY EST', @OrderID OUTPUT
EXEC dbo.AddOrder '06020127  ','0001',' ',38763.5, 'DICESA SA', @OrderID OUTPUT
EXEC dbo.AddOrder '06020128  ','0001',' ',38754.5, 'NESTLE WATERS SUPPLY EST', @OrderID OUTPUT
EXEC dbo.AddOrder '06020130  ','0001',' ',38760.5, 'NESTLE WATERS SUPPLY EST', @OrderID OUTPUT
EXEC dbo.AddOrder '06020132  ','0001',' ',38753.5, 'NESTLE WATERS SUPPLY EST', @OrderID OUTPUT
EXEC dbo.AddOrder '06020134  ','0001',' ',38759.5, 'BRASSERIE FISCHER SA', @OrderID OUTPUT
EXEC dbo.AddOrder '06020136  ','0001',' ',38756.5, 'NESTLE WATERS SUPPLY EST', @OrderID OUTPUT
EXEC dbo.AddOrder '06020138  ','0001',' ',38756.5, 'DIEFENBACH VERPACKUNGEN', @OrderID OUTPUT
EXEC dbo.AddOrder '06020139  ','0001',' ',38766.5, 'LABORATOIRE ALCON', @OrderID OUTPUT
EXEC dbo.AddOrder '06020141  ','0001',' ',38752.5, 'COGESAL MIKO-FSEUR 58488', @OrderID OUTPUT
EXEC dbo.AddOrder '06020141  ','0001','a',38759.5, 'COGESAL MIKO-FSEUR 58488', @OrderID OUTPUT
EXEC dbo.AddOrder '06020143  ','0001',' ',38753.5, 'COGESAL MIKO-FSEUR 58488', @OrderID OUTPUT
EXEC dbo.AddOrder '06020147  ','0001',' ',38761.5, 'DITTE GMBH', @OrderID OUTPUT
EXEC dbo.AddOrder '06020150  ','0001',' ',38759.5, 'DS SMITH KAYPAC', @OrderID OUTPUT
EXEC dbo.AddOrder '06020152  ','0001',' ',38754.5, 'TOLIX 90 SL', @OrderID OUTPUT
EXEC dbo.AddOrder '06020154  ','0001',' ',38756.5, 'COGESAL MIKO-FSEUR 58488', @OrderID OUTPUT
EXEC dbo.AddOrder '06020157  ','0001',' ',38755.5, 'COGESAL MIKO-FSEUR 58488', @OrderID OUTPUT
EXEC dbo.AddOrder '06020160  ','0001',' ',38747.5, 'STE MECANIQUE AUTOMOB.DE', @OrderID OUTPUT
EXEC dbo.AddOrder '06020161  ','0001',' ',38747.5, 'STE MECANIQUE AUTOMOB.DE', @OrderID OUTPUT
EXEC dbo.AddOrder '06020162  ','0001',' ',38747.5, 'STE MECANIQUE AUTOMOB.DE', @OrderID OUTPUT
EXEC dbo.AddOrder '06020163  ','0001',' ',38760.5, 'COGESAL MIKO-FSEUR 58488', @OrderID OUTPUT
EXEC dbo.AddOrder '06020166  ','0001',' ',38759.5, 'COGESAL MIKO-FSEUR 58488', @OrderID OUTPUT
EXEC dbo.AddOrder '06020167  ','0001',' ',38760.5, 'COGESAL MIKO-FSEUR 58488', @OrderID OUTPUT
EXEC dbo.AddOrder '06020169  ','0001',' ',38755.5, 'COGESAL MIKO-FSEUR 58488', @OrderID OUTPUT
EXEC dbo.AddOrder '06020180  ','0001',' ',38762.5, 'HOCHDORF NUTRITEC AG', @OrderID OUTPUT
EXEC dbo.AddOrder '06020182  ','0001',' ',38780.5, 'CIE FRANCO-SUISSE', @OrderID OUTPUT
EXEC dbo.AddOrder '06020183  ','0001',' ',38770.5, 'CIE FRANCO-SUISSE', @OrderID OUTPUT
EXEC dbo.AddOrder '06020187  ','0001',' ',38753.5, 'CART.EMBAL. RHONE ALPES', @OrderID OUTPUT
EXEC dbo.AddOrder '06020187  ','0003',' ',38753.5, 'CART.EMBAL. RHONE ALPES', @OrderID OUTPUT
EXEC dbo.AddOrder '06020190  ','0001',' ',38760.5, 'POLYVAL CARTONNAGES', @OrderID OUTPUT
EXEC dbo.AddOrder '06020191  ','0001',' ',38756.5, 'S.A. PEUGEOT MOTOCYCLES', @OrderID OUTPUT
EXEC dbo.AddOrder '06020193  ','0001',' ',38763.5, 'S.A. PEUGEOT MOTOCYCLES', @OrderID OUTPUT
EXEC dbo.AddOrder '06020194  ','0001',' ',38770.5, 'S.A. PEUGEOT MOTOCYCLES', @OrderID OUTPUT
EXEC dbo.AddOrder '06020195  ','0001',' ',38777.5, 'S.A. PEUGEOT MOTOCYCLES', @OrderID OUTPUT
EXEC dbo.AddOrder '06020196  ','0001',' ',38782.5, 'S.A. PEUGEOT MOTOCYCLES', @OrderID OUTPUT
EXEC dbo.AddOrder '06020197  ','0001',' ',38776.5, 'S.A. PEUGEOT MOTOCYCLES', @OrderID OUTPUT
EXEC dbo.AddOrder '06020198  ','0001',' ',38763.5, 'S.A. PEUGEOT MOTOCYCLES', @OrderID OUTPUT
EXEC dbo.AddOrder '06020200  ','0001',' ',38760.5, 'POLYVAL CARTONNAGES', @OrderID OUTPUT
EXEC dbo.AddOrder '06020202  ','0001',' ',38749.5, 'NESTLE WATERS SUPPLY EST', @OrderID OUTPUT
EXEC dbo.AddOrder '06020206  ','0001',' ',38755.5, 'ED.FRIEDRICH & CO GMBH', @OrderID OUTPUT
EXEC dbo.AddOrder '06020208  ','0001',' ',38753.5, 'WELL-PACK AG', @OrderID OUTPUT
EXEC dbo.AddOrder '06020210  ','0001',' ',38767.5, 'TRISS SPOL.S.R.O.', @OrderID OUTPUT
EXEC dbo.AddOrder '06020212  ','0001',' ',38756.5, 'TRISS SPOL.S.R.O.', @OrderID OUTPUT
EXEC dbo.AddOrder '06020222  ','0001',' ',38761.5, 'PEUGEOT CITROEN AUTOMOBI', @OrderID OUTPUT
EXEC dbo.AddOrder '06020224  ','0001',' ',38756.5, 'S.A. PEUGEOT MOTOCYCLES', @OrderID OUTPUT
EXEC dbo.AddOrder '06020228  ','0001',' ',38754.5, 'GEORGIA-PACIFIC FRANCE', @OrderID OUTPUT
EXEC dbo.AddOrder '06020232  ','0001',' ',38783.5, 'P&G INTERNATIONAL OPERAT', @OrderID OUTPUT
EXEC dbo.AddOrder '06020236  ','0001',' ',38760.5, 'GEORGIA-PACIFIC FRANCE', @OrderID OUTPUT
EXEC dbo.AddOrder '06020239  ','0001',' ',38762.5, 'BRASSERIE FISCHER SA', @OrderID OUTPUT
EXEC dbo.AddOrder '06020241  ','0001',' ',38746.5, 'JTEKT AUTOMOBILE', @OrderID OUTPUT
EXEC dbo.AddOrder '06020243  ','0001',' ',38770.5, 'DICESA SA', @OrderID OUTPUT
EXEC dbo.AddOrder '06020244  ','0001',' ',38770.5, 'DICESA SA', @OrderID OUTPUT
EXEC dbo.AddOrder '06020245  ','0001',' ',38761.5, 'GUSTAV  SCHRAMM GMBH', @OrderID OUTPUT
EXEC dbo.AddOrder '06020247  ','0001',' ',38759.5, 'STANLEY FRANCE DIVISION', @OrderID OUTPUT
EXEC dbo.AddOrder '06020248  ','0001',' ',38761.5, 'STANLEY FRANCE DIVISION', @OrderID OUTPUT
EXEC dbo.AddOrder '06020249  ','0001',' ',38759.5, 'STANLEY FRANCE DIVISION', @OrderID OUTPUT
EXEC dbo.AddOrder '06020253  ','0001',' ',38770.5, 'P&G INTERNATIONAL OPERAT', @OrderID OUTPUT
EXEC dbo.AddOrder '06020255  ','0001',' ',38774.5, 'P&G INTERNATIONAL OPERAT', @OrderID OUTPUT
EXEC dbo.AddOrder '06020256  ','0001',' ',38769.5, 'DICESA SA', @OrderID OUTPUT
EXEC dbo.AddOrder '06020257  ','0001',' ',38769.5, 'DICESA SA', @OrderID OUTPUT
EXEC dbo.AddOrder '06020257  ','0001','a',38769.5, 'DICESA SA', @OrderID OUTPUT
EXEC dbo.AddOrder '06020258  ','0001',' ',38774.5, 'DICESA SA', @OrderID OUTPUT
EXEC dbo.AddOrder '06020259  ','0001',' ',38802.5, 'DICESA SA', @OrderID OUTPUT
EXEC dbo.AddOrder '06020261  ','0001',' ',38773.5, 'P&G INTERNATIONAL OPERAT', @OrderID OUTPUT
EXEC dbo.AddOrder '06020265  ','0001',' ',38755.5, 'B.V.ALVERIMPORT', @OrderID OUTPUT
EXEC dbo.AddOrder '06020268  ','0001',' ',38762.5, 'PEUGEOT CITROEN AUTOMOBI', @OrderID OUTPUT
EXEC dbo.AddOrder '06020271  ','0001',' ',38770.5, 'TRISS SPOL.S.R.O.', @OrderID OUTPUT
EXEC dbo.AddOrder '06020271  ','0001','a',38775.5, 'TRISS SPOL.S.R.O.', @OrderID OUTPUT
EXEC dbo.AddOrder '06020273  ','0001',' ',38782.5, 'GEORGIA-PACIFIC FRANCE', @OrderID OUTPUT
EXEC dbo.AddOrder '06020275  ','0001',' ',38755.5, 'GEORGIA-PACIFIC FRANCE', @OrderID OUTPUT
EXEC dbo.AddOrder '06020277  ','0001',' ',38770.5, 'TOLIX 90 SL', @OrderID OUTPUT
EXEC dbo.AddOrder '06020279  ','0001',' ',38777.5, 'ROBOT COUPE', @OrderID OUTPUT
EXEC dbo.AddOrder '06020280  ','0001',' ',38808.5, 'GEPMAN S.A.S', @OrderID OUTPUT
EXEC dbo.AddOrder '06020281  ','0001',' ',38752.5, 'DS SMITH KAYPAC', @OrderID OUTPUT
EXEC dbo.AddOrder '06020283  ','0001',' ',38754.5, 'SHARP MANUFACTURING FRAN', @OrderID OUTPUT
EXEC dbo.AddOrder '06020284  ','0001',' ',38747.5, 'THIMM SERVICE', @OrderID OUTPUT
EXEC dbo.AddOrder '06020286  ','0001',' ',38753.5, 'CART.EMBAL. RHONE ALPES', @OrderID OUTPUT
EXEC dbo.AddOrder '06020288  ','0001',' ',38760.5, 'CARTONNAGES BERTRAND - N', @OrderID OUTPUT
EXEC dbo.AddOrder '06020289  ','0001',' ',38770.5, 'CARTONNAGES BERTRAND - N', @OrderID OUTPUT
EXEC dbo.AddOrder '06020290  ','0001',' ',38753.5, 'CART.EMBAL. RHONE ALPES', @OrderID OUTPUT
EXEC dbo.AddOrder '06020293  ','0001',' ',38759.5, 'DUPONT TEIJIN FILMS', @OrderID OUTPUT
EXEC dbo.AddOrder '06020294  ','0001',' ',38760.5, 'HEIDE WERKSTAETTEN E.V.', @OrderID OUTPUT
EXEC dbo.AddOrder '06020296  ','0001',' ',38759.5, 'SAM-STE D''ARCHIVAGE MODE', @OrderID OUTPUT
EXEC dbo.AddOrder '06020297  ','0001',' ',38761.5, 'SAM-STE D''ARCHIVAGE MODE', @OrderID OUTPUT
EXEC dbo.AddOrder '06020297  ','0001','a',38767.5, 'SAM-STE D''ARCHIVAGE MODE', @OrderID OUTPUT
EXEC dbo.AddOrder '06020301  ','0001',' ',38762.5, 'P&G INTERNATIONAL OPERAT', @OrderID OUTPUT
EXEC dbo.AddOrder '06020306  ','0001',' ',38763.5, 'P&G INTERNATIONAL OPERAT', @OrderID OUTPUT
EXEC dbo.AddOrder '06020308  ','0001',' ',38755.5, 'DS SMITH KAYSERSBERG', @OrderID OUTPUT
EXEC dbo.AddOrder '06020309  ','0001',' ',38755.5, 'P&G INTERNATIONAL OPERAT', @OrderID OUTPUT
EXEC dbo.AddOrder '06020311  ','0001',' ',38763.5, 'P&G INTERNATIONAL OPERAT', @OrderID OUTPUT
EXEC dbo.AddOrder '06020315  ','0001',' ',38763.5, 'PEUGEOT CITROEN AUTOMOBI', @OrderID OUTPUT
EXEC dbo.AddOrder '06020316  ','0001',' ',38749.5, 'P&G INTERNATIONAL OPERAT', @OrderID OUTPUT
EXEC dbo.AddOrder '06020318  ','0001',' ',38759.5, 'P&G INTERNATIONAL OPERAT', @OrderID OUTPUT
EXEC dbo.AddOrder '06020320  ','0001',' ',38760.5, 'P&G INTERNATIONAL OPERAT', @OrderID OUTPUT
EXEC dbo.AddOrder '06020322  ','0001',' ',38762.5, 'P&G INTERNATIONAL OPERAT', @OrderID OUTPUT
EXEC dbo.AddOrder '06020324  ','0001',' ',38763.5, 'P&G INTERNATIONAL OPERAT', @OrderID OUTPUT
EXEC dbo.AddOrder '06020328  ','0001',' ',38760.5, 'P&G INTERNATIONAL OPERAT', @OrderID OUTPUT
EXEC dbo.AddOrder '06020330  ','0001',' ',38761.5, 'P&G INTERNATIONAL OPERAT', @OrderID OUTPUT
EXEC dbo.AddOrder '06020332  ','0001',' ',38747.5, 'P&G INTERNATIONAL OPERAT', @OrderID OUTPUT
EXEC dbo.AddOrder '06020334  ','0001',' ',38752.5, 'P&G INTERNATIONAL OPERAT', @OrderID OUTPUT
EXEC dbo.AddOrder '06020337  ','0001',' ',38763.5, 'P&G INTERNATIONAL OPERAT', @OrderID OUTPUT
EXEC dbo.AddOrder '06020339  ','0001',' ',38761.5, 'SCHWEITZER S.A.', @OrderID OUTPUT
EXEC dbo.AddOrder '06020341  ','0001',' ',38763.5, 'P&G INTERNATIONAL OPERAT', @OrderID OUTPUT
EXEC dbo.AddOrder '06020342  ','0001',' ',38755.5, 'SCHWEITZER S.A.', @OrderID OUTPUT
EXEC dbo.AddOrder '06020344  ','0001',' ',38762.5, 'SCHWEITZER S.A.', @OrderID OUTPUT
EXEC dbo.AddOrder '06020346  ','0001',' ',38749.5, 'P&G INTERNATIONAL OPERAT', @OrderID OUTPUT
EXEC dbo.AddOrder '06020348  ','0001',' ',38759.5, 'P&G INTERNATIONAL OPERAT', @OrderID OUTPUT
EXEC dbo.AddOrder '06020350  ','0001',' ',38761.5, 'P&G INTERNATIONAL OPERAT', @OrderID OUTPUT
EXEC dbo.AddOrder '06020354  ','0001',' ',38761.5, 'P&G INTERNATIONAL OPERAT', @OrderID OUTPUT
EXEC dbo.AddOrder '06020356  ','0001',' ',38759.5, 'P&G INTERNATIONAL OPERAT', @OrderID OUTPUT
EXEC dbo.AddOrder '06020358  ','0001',' ',38762.5, 'P&G INTERNATIONAL OPERAT', @OrderID OUTPUT
EXEC dbo.AddOrder '06020361  ','0001',' ',38763.5, 'P&G INTERNATIONAL OPERAT', @OrderID OUTPUT
EXEC dbo.AddOrder '06020363  ','0001',' ',38770.5, 'P&G INTERNATIONAL OPERAT', @OrderID OUTPUT
EXEC dbo.AddOrder '06020365  ','0001',' ',38763.5, 'P&G INTERNATIONAL OPERAT', @OrderID OUTPUT
EXEC dbo.AddOrder '06020366  ','0001',' ',38766.5, 'DS SMITH KAYPAC', @OrderID OUTPUT
EXEC dbo.AddOrder '06020373  ','0001',' ',38760.5, 'P&G INTERNATIONAL OPERAT', @OrderID OUTPUT
EXEC dbo.AddOrder '06020374  ','0001',' ',38753.5, 'COGESAL MIKO-FSEUR 58488', @OrderID OUTPUT
EXEC dbo.AddOrder '06020382  ','0001',' ',38759.5, 'P&G INTERNATIONAL OPERAT', @OrderID OUTPUT
EXEC dbo.AddOrder '06020384  ','0001',' ',38759.5, 'P&G INTERNATIONAL OPERAT', @OrderID OUTPUT
EXEC dbo.AddOrder '06020387  ','0001',' ',38759.5, 'SHARP MANUFACTURING FRAN', @OrderID OUTPUT
EXEC dbo.AddOrder '06020388  ','0001',' ',38762.5, 'CHARTREUSE DIFFUSION', @OrderID OUTPUT
EXEC dbo.AddOrder '06020390  ','0001',' ',38760.5, 'CHARTREUSE DIFFUSION', @OrderID OUTPUT
EXEC dbo.AddOrder '06020390  ','0001','a',38760.5, 'CHARTREUSE DIFFUSION', @OrderID OUTPUT
EXEC dbo.AddOrder '06020393  ','0001',' ',38753.5, 'CART.EMBAL. RHONE ALPES', @OrderID OUTPUT
EXEC dbo.AddOrder '06020395  ','0001',' ',38752.5, 'P&G INTERNATIONAL OPERAT', @OrderID OUTPUT
EXEC dbo.AddOrder '06020397  ','0001',' ',38774.5, 'SHARP MANUFACTURING FRAN', @OrderID OUTPUT
EXEC dbo.AddOrder '06020398  ','0001',' ',38760.5, 'B.V.ALVERIMPORT', @OrderID OUTPUT
EXEC dbo.AddOrder '06020400  ','0001',' ',38766.5, 'AEF ATELIER D''EM. FAULQU', @OrderID OUTPUT
EXEC dbo.AddOrder '06020401  ','0001',' ',38766.5, 'AEF ATELIER D''EM. FAULQU', @OrderID OUTPUT
EXEC dbo.AddOrder '06020404  ','0001',' ',38752.5, 'BRASSERIE FISCHER SA', @OrderID OUTPUT
EXEC dbo.AddOrder '06020405  ','0001',' ',38777.5, 'STERLING (STE ELECTRIQUE', @OrderID OUTPUT
EXEC dbo.AddOrder '06020407  ','0001',' ',38768.5, 'RICOLA AG/LTD', @OrderID OUTPUT
EXEC dbo.AddOrder '06020409  ','0001',' ',38768.5, 'RICOLA EUROPE SA', @OrderID OUTPUT
EXEC dbo.AddOrder '06020411  ','0001',' ',38760.5, 'BRENNER VERPACKUNG GMBH', @OrderID OUTPUT
EXEC dbo.AddOrder '06020413  ','0001',' ',38760.5, 'BRENNER VERPACKUNG GMBH', @OrderID OUTPUT
EXEC dbo.AddOrder '06020417  ','0001',' ',38759.5, 'SCHWEITZER S.A.', @OrderID OUTPUT
EXEC dbo.AddOrder '06020419  ','0001',' ',38754.5, 'ST GOBAIN VETROTEX FRANC', @OrderID OUTPUT
EXEC dbo.AddOrder '06020420  ','0001',' ',38754.5, 'ST GOBAIN VETROTEX FRANC', @OrderID OUTPUT
EXEC dbo.AddOrder '06020421  ','0001',' ',38754.5, 'ST GOBAIN VETROTEX FRANC', @OrderID OUTPUT
EXEC dbo.AddOrder '06020423  ','0001',' ',38755.5, 'ROLF SCHWIERING GMBH', @OrderID OUTPUT
EXEC dbo.AddOrder '06020425  ','0001',' ',38759.5, 'H T L VERPACKUNG GMBH', @OrderID OUTPUT
EXEC dbo.AddOrder '06020427  ','0001',' ',38769.5, 'ST GOBAIN VETROTEX FRANC', @OrderID OUTPUT
EXEC dbo.AddOrder '06020428  ','0001',' ',38769.5, 'ST GOBAIN VETROTEX FRANC', @OrderID OUTPUT
EXEC dbo.AddOrder '06020429  ','0001',' ',38769.5, 'ST GOBAIN VETROTEX FRANC', @OrderID OUTPUT
EXEC dbo.AddOrder '06020431  ','0001',' ',38783.5, 'ST GOBAIN VETROTEX FRANC', @OrderID OUTPUT
EXEC dbo.AddOrder '06020432  ','0001',' ',38783.5, 'ST GOBAIN VETROTEX FRANC', @OrderID OUTPUT
EXEC dbo.AddOrder '06020434  ','0001',' ',38790.5, 'ST GOBAIN VETROTEX FRANC', @OrderID OUTPUT
EXEC dbo.AddOrder '06020435  ','0001',' ',38790.5, 'ST GOBAIN VETROTEX FRANC', @OrderID OUTPUT
EXEC dbo.AddOrder '06020437  ','0001',' ',38754.5, 'WELL-PACK AG', @OrderID OUTPUT
EXEC dbo.AddOrder '06020439  ','0001',' ',38754.5, 'WELL-PACK AG', @OrderID OUTPUT
EXEC dbo.AddOrder '06020442  ','0001',' ',38755.5, 'MEPHISTO', @OrderID OUTPUT
EXEC dbo.AddOrder '06020446  ','0001',' ',38759.5, 'DS SMITH KAYSERSBERG', @OrderID OUTPUT
EXEC dbo.AddOrder '06020447  ','0001',' ',38756.5, 'S.M.A.E. ZI METZ BORNY (', @OrderID OUTPUT
EXEC dbo.AddOrder '06020449  ','0001',' ',38756.5, 'S.M.A.E. ZI METZ BORNY (', @OrderID OUTPUT
EXEC dbo.AddOrder '06020450  ','0001',' ',38756.5, 'S.M.A.E. ZI METZ BORNY (', @OrderID OUTPUT
EXEC dbo.AddOrder '06020451  ','0001',' ',38756.5, 'S.M.A.E. ZI METZ BORNY (', @OrderID OUTPUT
EXEC dbo.AddOrder '06020452  ','0001',' ',38756.5, 'S.M.A.E. ZI METZ BORNY (', @OrderID OUTPUT
EXEC dbo.AddOrder '06020453  ','0001',' ',38756.5, 'S.M.A.E. ZI METZ BORNY (', @OrderID OUTPUT
EXEC dbo.AddOrder '06020455  ','0001',' ',38759.5, 'DS SMITH KAYSERSBERG', @OrderID OUTPUT
EXEC dbo.AddOrder '06020456  ','0001',' ',38760.5, 'S.M.A.E. ZI METZ BORNY (', @OrderID OUTPUT
EXEC dbo.AddOrder '06020462  ','0001',' ',38767.5, 'REICHOLD FEINKOST GMBH', @OrderID OUTPUT
EXEC dbo.AddOrder '06020462  ','0001','a',38768.5, 'REICHOLD FEINKOST GMBH', @OrderID OUTPUT
EXEC dbo.AddOrder '06020464  ','0001',' ',38766.5, 'REICHOLD FEINKOST GMBH', @OrderID OUTPUT
EXEC dbo.AddOrder '06020466  ','0001',' ',38762.5, 'DS SMITH KAYSERSBERG', @OrderID OUTPUT
EXEC dbo.AddOrder '06020467  ','0001',' ',38774.5, 'SHARP MANUFACTURING FRAN', @OrderID OUTPUT
EXEC dbo.AddOrder '06020472  ','0001',' ',38766.5, 'GEPAK W.GERNER GMBH', @OrderID OUTPUT
EXEC dbo.AddOrder '06020474  ','0001',' ',38760.5, 'D.P.F. DIFFUS.PREST.FIAB', @OrderID OUTPUT
EXEC dbo.AddOrder '06020475  ','0001',' ',38773.5, 'SHARP MANUFACTURING FRAN', @OrderID OUTPUT
EXEC dbo.AddOrder '06020477  ','0001',' ',38768.5, 'REGENT BELEUCHTUNGSKOERP', @OrderID OUTPUT
EXEC dbo.AddOrder '06020481  ','0001',' ',38773.5, 'SHARP MANUFACTURING FRAN', @OrderID OUTPUT
EXEC dbo.AddOrder '06020488  ','0001',' ',38773.5, 'STE ALSA-CORK', @OrderID OUTPUT
EXEC dbo.AddOrder '06020490  ','0001',' ',38767.5, 'KNIPP GMBH', @OrderID OUTPUT
EXEC dbo.AddOrder '06020493  ','0001',' ',38762.5, 'FRUITIERE VINICOLE D''ARB', @OrderID OUTPUT
EXEC dbo.AddOrder '06020494  ','0001',' ',38762.5, 'FRUITIERE VINICOLE D''ARB', @OrderID OUTPUT
EXEC dbo.AddOrder '06020495  ','0001',' ',38768.5, 'KNIPP GMBH', @OrderID OUTPUT
EXEC dbo.AddOrder '06020497  ','0001',' ',38762.5, 'HEXCEL FABRICS S.A.', @OrderID OUTPUT
EXEC dbo.AddOrder '06020499  ','0001',' ',38763.5, 'DITTE GMBH', @OrderID OUTPUT
EXEC dbo.AddOrder '06020502  ','0001',' ',38770.5, 'DU PONT DE NEMOURS (FRAN', @OrderID OUTPUT
EXEC dbo.AddOrder '06020504  ','0001',' ',38762.5, 'SCHWARZWAELDER TEXTILWER', @OrderID OUTPUT
EXEC dbo.AddOrder '06020507  ','0001',' ',38763.5, 'GEORGIA-PACIFIC FRANCE', @OrderID OUTPUT
EXEC dbo.AddOrder '06020510  ','0001',' ',38762.5, 'GEORGIA-PACIFIC FRANCE', @OrderID OUTPUT
EXEC dbo.AddOrder '06020513  ','0001',' ',38760.5, 'AMERICAN STANDARD EUROPE', @OrderID OUTPUT
EXEC dbo.AddOrder '06020514  ','0001',' ',38775.5, 'CARTON PLUS', @OrderID OUTPUT
EXEC dbo.AddOrder '06020517  ','0001',' ',38761.5, 'NORD REDUCTEURS', @OrderID OUTPUT
EXEC dbo.AddOrder '06020518  ','0001',' ',38761.5, 'GEORGIA-PACIFIC FRANCE', @OrderID OUTPUT
EXEC dbo.AddOrder '06020522  ','0001',' ',38761.5, 'TECUMSEH EUROPE S.A.', @OrderID OUTPUT
EXEC dbo.AddOrder '06020523  ','0001',' ',38768.5, 'DU PONT DE NEMOURS (FRAN', @OrderID OUTPUT
EXEC dbo.AddOrder '06020524  ','0001',' ',38768.5, 'DU PONT DE NEMOURS (FRAN', @OrderID OUTPUT
EXEC dbo.AddOrder '06020525  ','0001',' ',38761.5, 'MOULAGES PLASTIQUES DE L', @OrderID OUTPUT
EXEC dbo.AddOrder '06020528  ','0001',' ',38770.5, 'STE ALSA-CORK', @OrderID OUTPUT
EXEC dbo.AddOrder '06020532  ','0001',' ',38761.5, 'SCHWEITZER S.A.', @OrderID OUTPUT
EXEC dbo.AddOrder '06020533  ','0001',' ',38761.5, 'SCHWEITZER S.A.', @OrderID OUTPUT
EXEC dbo.AddOrder '06020534  ','0001',' ',38761.5, 'SCHWEITZER S.A.', @OrderID OUTPUT
EXEC dbo.AddOrder '06020536  ','0001',' ',38759.5, 'SCHWEITZER S.A.', @OrderID OUTPUT
EXEC dbo.AddOrder '06020539  ','0001',' ',38756.5, 'DU PONT DE NEMOURS (FRAN', @OrderID OUTPUT
EXEC dbo.AddOrder '06020543  ','0001',' ',38761.5, 'DS SMITH KAYPAC', @OrderID OUTPUT
EXEC dbo.AddOrder '06020547  ','0001',' ',38783.5, 'NOVA INNOVENE INTERNATIO', @OrderID OUTPUT
EXEC dbo.AddOrder '06020548  ','0001',' ',38784.5, 'NOVA INNOVENE INTERNATIO', @OrderID OUTPUT
EXEC dbo.AddOrder '06020549  ','0001',' ',38762.5, 'NESTLE WATERS SUPPLY EST', @OrderID OUTPUT
EXEC dbo.AddOrder '06020552  ','0001',' ',38761.5, 'NESTLE WATERS SUPPLY EST', @OrderID OUTPUT
EXEC dbo.AddOrder '06020554  ','0001',' ',38780.5, 'NOVA INNOVENE INTERNATIO', @OrderID OUTPUT
EXEC dbo.AddOrder '06020555  ','0001',' ',38775.5, 'NOVA INNOVENE INTERNATIO', @OrderID OUTPUT
EXEC dbo.AddOrder '06020556  ','0001',' ',38755.5, 'W. WIRTH GMBH', @OrderID OUTPUT
EXEC dbo.AddOrder '06020559  ','0001',' ',38802.5, 'NOVA INNOVENE INTERNATIO', @OrderID OUTPUT
EXEC dbo.AddOrder '06020560  ','0001',' ',38803.5, 'NOVA INNOVENE INTERNATIO', @OrderID OUTPUT
EXEC dbo.AddOrder '06020562  ','0001',' ',38748.5, 'JTEKT AUTOMOBILE', @OrderID OUTPUT
EXEC dbo.AddOrder '06020565  ','0001',' ',38748.5, 'JTEKT AUTOMOBILE', @OrderID OUTPUT
EXEC dbo.AddOrder '06020566  ','0001',' ',38756.5, 'DUPONT DE NEMOURS ITALIA', @OrderID OUTPUT
EXEC dbo.AddOrder '06020568  ','0001',' ',38760.5, 'DU PONT DE NEMOURS (FRAN', @OrderID OUTPUT
EXEC dbo.AddOrder '06020570  ','0001',' ',38762.5, 'DU PONT DE NEMOURS (FRAN', @OrderID OUTPUT
EXEC dbo.AddOrder '06020571  ','0001',' ',38755.5, 'TILLMANN VERPACKUNGEN GM', @OrderID OUTPUT
EXEC dbo.AddOrder '06020574  ','0001',' ',38767.5, 'DICESA SA', @OrderID OUTPUT
EXEC dbo.AddOrder '06020575  ','0001',' ',38795.5, 'DICESA SA', @OrderID OUTPUT
EXEC dbo.AddOrder '06020576  ','0001',' ',38824.5, 'DICESA SA', @OrderID OUTPUT
EXEC dbo.AddOrder '06020577  ','0001',' ',38858.5, 'DICESA SA', @OrderID OUTPUT
EXEC dbo.AddOrder '06020578  ','0001',' ',38767.5, 'DICESA SA', @OrderID OUTPUT
EXEC dbo.AddOrder '06020579  ','0001',' ',38824.5, 'DICESA SA', @OrderID OUTPUT
EXEC dbo.AddOrder '06020581  ','0001',' ',38761.5, 'DICESA SA', @OrderID OUTPUT
EXEC dbo.AddOrder '06020585  ','0001',' ',38766.5, 'B.V.ALVERIMPORT', @OrderID OUTPUT
EXEC dbo.AddOrder '06020586  ','0001',' ',38760.5, 'THYSSENKRUPP PRESTA FRAN', @OrderID OUTPUT
EXEC dbo.AddOrder '06020589  ','0001',' ',38761.5, 'INTERGESTION', @OrderID OUTPUT
EXEC dbo.AddOrder '06020590  ','0001',' ',38766.5, 'DS SMITH KAYPAC', @OrderID OUTPUT
EXEC dbo.AddOrder '06020592  ','0001',' ',38755.5, 'CART.EMBAL. RHONE ALPES', @OrderID OUTPUT
EXEC dbo.AddOrder '06020593  ','0001',' ',38763.5, 'W O L F  GMBH', @OrderID OUTPUT
EXEC dbo.AddOrder '06020596  ','0001',' ',38762.5, 'WIRTH VERPACKUNGEN GMBH', @OrderID OUTPUT
EXEC dbo.AddOrder '06020598  ','0001',' ',38760.5, 'KODAK INDUSTRIE', @OrderID OUTPUT
EXEC dbo.AddOrder '06020599  ','0001',' ',38760.5, 'KODAK INDUSTRIE', @OrderID OUTPUT
EXEC dbo.AddOrder '06020601  ','0001',' ',38763.5, 'W. WIRTH GMBH', @OrderID OUTPUT
EXEC dbo.AddOrder '06020603  ','0001',' ',38763.5, 'PRODINGER VERPACKUNG AG', @OrderID OUTPUT
EXEC dbo.AddOrder '06020607  ','0001',' ',38756.5, 'WELL-PACK AG', @OrderID OUTPUT
EXEC dbo.AddOrder '06020609  ','0001',' ',38769.5, 'JTEKT AUTOMOBILE LYON', @OrderID OUTPUT
EXEC dbo.AddOrder '06020613  ','0001',' ',38760.5, 'PEUGEOT CITROEN AUTOMOBI', @OrderID OUTPUT
EXEC dbo.AddOrder '06020614  ','0001',' ',38760.5, 'S.M.A.E. ZI METZ BORNY (', @OrderID OUTPUT
EXEC dbo.AddOrder '06020615  ','0001',' ',38760.5, 'S.M.A.E. ZI METZ BORNY (', @OrderID OUTPUT
EXEC dbo.AddOrder '06020616  ','0001',' ',38760.5, 'S.M.A.E. ZI METZ BORNY (', @OrderID OUTPUT
EXEC dbo.AddOrder '06020617  ','0001',' ',38760.5, 'S.M.A.E. ZI METZ BORNY (', @OrderID OUTPUT
EXEC dbo.AddOrder '06020618  ','0001',' ',38760.5, 'S.M.A.E. ZI METZ BORNY (', @OrderID OUTPUT
EXEC dbo.AddOrder '06020621  ','0001',' ',38760.5, 'DS SMITH KAYSERSBERG', @OrderID OUTPUT
EXEC dbo.AddOrder '06020623  ','0001',' ',38774.5, 'DUPONT TEIJIN FILMS', @OrderID OUTPUT
EXEC dbo.AddOrder '06020625  ','0001',' ',38756.5, 'DUPONT TEIJIN FILMS', @OrderID OUTPUT
EXEC dbo.AddOrder '06020627  ','0001',' ',38789.5, 'DUPONT TEIJIN FILMS', @OrderID OUTPUT
EXEC dbo.AddOrder '06020629  ','0001',' ',38773.5, 'DUPONT TEIJIN FILMS', @OrderID OUTPUT
EXEC dbo.AddOrder '06020630  ','0001',' ',38773.5, 'DUPONT TEIJIN FILMS', @OrderID OUTPUT
EXEC dbo.AddOrder '06020631  ','0001',' ',38773.5, 'DUPONT TEIJIN FILMS', @OrderID OUTPUT
EXEC dbo.AddOrder '06020634  ','0001',' ',38773.5, 'DUPONT TEIJIN FILMS', @OrderID OUTPUT
EXEC dbo.AddOrder '06020635  ','0001',' ',38773.5, 'DUPONT TEIJIN FILMS', @OrderID OUTPUT
EXEC dbo.AddOrder '06020636  ','0001',' ',38768.5, 'CLARIANT IBERICA S.A', @OrderID OUTPUT
EXEC dbo.AddOrder '06020640  ','0001',' ',38770.5, 'CHARTREUSE DIFFUSION', @OrderID OUTPUT
EXEC dbo.AddOrder '06020640  ','0001','a',38774.5, 'CHARTREUSE DIFFUSION', @OrderID OUTPUT
EXEC dbo.AddOrder '06020642  ','0001',' ',38770.5, 'BUBENDORFF VOLET ROULANT', @OrderID OUTPUT
EXEC dbo.AddOrder '06020643  ','0001',' ',38763.5, 'BUBENDORFF VOLET ROULANT', @OrderID OUTPUT
EXEC dbo.AddOrder '06020646  ','0001',' ',38766.5, 'LILLY FRANCE S.A.', @OrderID OUTPUT
EXEC dbo.AddOrder '06020648  ','0001',' ',38763.5, 'CART.EMBAL. RHONE ALPES', @OrderID OUTPUT
EXEC dbo.AddOrder '06020650  ','0001',' ',38762.5, 'B.V.ALVERIMPORT', @OrderID OUTPUT
EXEC dbo.AddOrder '06020657  ','0001',' ',38769.5, 'PEUGEOT CITROEN AUTOMOBI', @OrderID OUTPUT
EXEC dbo.AddOrder '06020658  ','0001',' ',38774.5, 'BUBENDORFF VOLET ROULANT', @OrderID OUTPUT
EXEC dbo.AddOrder '06020659  ','0001',' ',38790.5, 'BUBENDORFF VOLET ROULANT', @OrderID OUTPUT
EXEC dbo.AddOrder '06020660  ','0001',' ',38774.5, 'BUBENDORFF VOLET ROULANT', @OrderID OUTPUT
EXEC dbo.AddOrder '06020661  ','0001',' ',38790.5, 'BUBENDORFF VOLET ROULANT', @OrderID OUTPUT
EXEC dbo.AddOrder '06020664  ','0001',' ',38780.5, 'BUBENDORFF VOLET ROULANT', @OrderID OUTPUT
EXEC dbo.AddOrder '06020665  ','0001',' ',38780.5, 'BUBENDORFF VOLET ROULANT', @OrderID OUTPUT
EXEC dbo.AddOrder '06020666  ','0001',' ',38780.5, 'BUBENDORFF VOLET ROULANT', @OrderID OUTPUT
EXEC dbo.AddOrder '06020668  ','0001',' ',38762.5, 'PEUGEOT CITROEN AUTOMOBI', @OrderID OUTPUT
EXEC dbo.AddOrder '06020670  ','0001',' ',38774.5, 'BUBENDORFF VOLET ROULANT', @OrderID OUTPUT
EXEC dbo.AddOrder '06020671  ','0001',' ',38783.5, 'BUBENDORFF VOLET ROULANT', @OrderID OUTPUT
EXEC dbo.AddOrder '06020672  ','0001',' ',38788.5, 'BUBENDORFF VOLET ROULANT', @OrderID OUTPUT
EXEC dbo.AddOrder '06020674  ','0001',' ',38784.5, 'BUBENDORFF VOLET ROULANT', @OrderID OUTPUT
EXEC dbo.AddOrder '06020675  ','0001',' ',38783.5, 'BUBENDORFF VOLET ROULANT', @OrderID OUTPUT
EXEC dbo.AddOrder '06020677  ','0001',' ',38769.5, 'BUBENDORFF VOLET ROULANT', @OrderID OUTPUT
EXEC dbo.AddOrder '06020678  ','0001',' ',38781.5, 'BUBENDORFF VOLET ROULANT', @OrderID OUTPUT
EXEC dbo.AddOrder '06020679  ','0001',' ',38769.5, 'BUBENDORFF VOLET ROULANT', @OrderID OUTPUT
EXEC dbo.AddOrder '06020680  ','0001',' ',38783.5, 'BUBENDORFF VOLET ROULANT', @OrderID OUTPUT
EXEC dbo.AddOrder '06020681  ','0001',' ',38783.5, 'BUBENDORFF VOLET ROULANT', @OrderID OUTPUT
EXEC dbo.AddOrder '06020683  ','0001',' ',38775.5, 'ROCKWOOL FRANCE SAS', @OrderID OUTPUT
EXEC dbo.AddOrder '06020688  ','0001',' ',38760.5, 'UMFORM & FÜGETECHNIK EIS', @OrderID OUTPUT
EXEC dbo.AddOrder '06020690  ','0001',' ',38768.5, 'STOEBER ANTRIEBSTECHNIK', @OrderID OUTPUT
EXEC dbo.AddOrder '06020692  ','0001',' ',38761.5, 'WIRTH VERPACKUNGEN GMBH', @OrderID OUTPUT
EXEC dbo.AddOrder '06020697  ','0001',' ',38770.5, 'TRISS SPOL.S.R.O.', @OrderID OUTPUT
EXEC dbo.AddOrder '06020701  ','0001',' ',38749.5, 'MANZONI BOUCHOT FONDERIE', @OrderID OUTPUT
EXEC dbo.AddOrder '06020704  ','0001',' ',38754.5, 'BRASSERIES KRONENBOURG 5', @OrderID OUTPUT
EXEC dbo.AddOrder '06020706  ','0001',' ',38754.5, 'BRASSERIES KRONENBOURG 5', @OrderID OUTPUT
EXEC dbo.AddOrder '06020708  ','0001',' ',38754.5, 'BRASSERIES KRONENBOURG 5', @OrderID OUTPUT
EXEC dbo.AddOrder '06020710  ','0001',' ',38754.5, 'BRASSERIES KRONENBOURG 5', @OrderID OUTPUT
EXEC dbo.AddOrder '06020713  ','0001',' ',38761.5, 'TRISS SPOL.S.R.O.', @OrderID OUTPUT
EXEC dbo.AddOrder '06020714  ','0001',' ',38761.5, 'TRISS SPOL.S.R.O.', @OrderID OUTPUT
EXEC dbo.AddOrder '06020716  ','0001',' ',38761.5, 'TRISS SPOL.S.R.O.', @OrderID OUTPUT
EXEC dbo.AddOrder '06020717  ','0001',' ',38760.5, 'TRISS SPOL.S.R.O.', @OrderID OUTPUT
EXEC dbo.AddOrder '06020719  ','0001',' ',38754.5, 'DS SMITH KAYSERSBERG', @OrderID OUTPUT
EXEC dbo.AddOrder '06020721  ','0001',' ',38754.5, 'BRASSERIES KRONENBOURG 5', @OrderID OUTPUT
EXEC dbo.AddOrder '06020723  ','0001',' ',38754.5, 'BRASSERIES KRONENBOURG 5', @OrderID OUTPUT
EXEC dbo.AddOrder '06020725  ','0001',' ',38754.5, 'BRASSERIES KRONENBOURG 5', @OrderID OUTPUT
EXEC dbo.AddOrder '06020727  ','0001',' ',38754.5, 'BRASSERIES KRONENBOURG 5', @OrderID OUTPUT
EXEC dbo.AddOrder '06020727  ','0001','a',38754.5, 'BRASSERIES KRONENBOURG 5', @OrderID OUTPUT
EXEC dbo.AddOrder '06020729  ','0001',' ',38754.5, 'BRASSERIES KRONENBOURG 5', @OrderID OUTPUT
EXEC dbo.AddOrder '06020731  ','0001',' ',38754.5, 'BRASSERIES KRONENBOURG 5', @OrderID OUTPUT
EXEC dbo.AddOrder '06020733  ','0001',' ',38754.5, 'BRASSERIES KRONENBOURG 5', @OrderID OUTPUT
EXEC dbo.AddOrder '06020737  ','0001',' ',38754.5, 'BRASSERIES KRONENBOURG 5', @OrderID OUTPUT
EXEC dbo.AddOrder '06020740  ','0001',' ',38756.5, 'BRASSERIES KRONENBOURG 5', @OrderID OUTPUT
EXEC dbo.AddOrder '06020743  ','0001',' ',38760.5, 'BRASSERIES KRONENBOURG 5', @OrderID OUTPUT
EXEC dbo.AddOrder '06020744  ','0001',' ',38755.5, 'NESTLE WATERS SUPPLY EST', @OrderID OUTPUT
EXEC dbo.AddOrder '06020750  ','0001',' ',38761.5, 'NESTLE WATERS SUPPLY EST', @OrderID OUTPUT
EXEC dbo.AddOrder '06020750  ','0001','a',38773.5, 'NESTLE WATERS SUPPLY EST', @OrderID OUTPUT
EXEC dbo.AddOrder '06020756  ','0001',' ',38761.5, 'NESTLE WATERS SUPPLY EST', @OrderID OUTPUT
EXEC dbo.AddOrder '06020758  ','0001',' ',38767.5, 'MME VASSELON MONIQUE', @OrderID OUTPUT
EXEC dbo.AddOrder '06020760  ','0001',' ',38756.5, 'DS SMITH KAYPAC', @OrderID OUTPUT
EXEC dbo.AddOrder '06020763  ','0001',' ',38763.5, 'CUISINES SCHMIDT SALM SA', @OrderID OUTPUT
EXEC dbo.AddOrder '06020767  ','0001',' ',38763.5, 'STE WRIGLEY FRANCE S.N.C', @OrderID OUTPUT
EXEC dbo.AddOrder '06020769  ','0001',' ',38763.5, 'STE WRIGLEY FRANCE S.N.C', @OrderID OUTPUT
EXEC dbo.AddOrder '06020771  ','0001',' ',38763.5, 'STE WRIGLEY FRANCE S.N.C', @OrderID OUTPUT
EXEC dbo.AddOrder '06020773  ','0001',' ',38763.5, 'STE WRIGLEY FRANCE S.N.C', @OrderID OUTPUT
EXEC dbo.AddOrder '06020775  ','0001',' ',38763.5, 'STE WRIGLEY FRANCE S.N.C', @OrderID OUTPUT
EXEC dbo.AddOrder '06020775  ','0001','a',38763.5, 'STE WRIGLEY FRANCE S.N.C', @OrderID OUTPUT
EXEC dbo.AddOrder '06020777  ','0001',' ',38769.5, 'STE WRIGLEY FRANCE S.N.C', @OrderID OUTPUT
EXEC dbo.AddOrder '06020779  ','0001',' ',38769.5, 'STE WRIGLEY FRANCE S.N.C', @OrderID OUTPUT
EXEC dbo.AddOrder '06020782  ','0001',' ',38769.5, 'STE WRIGLEY FRANCE S.N.C', @OrderID OUTPUT
EXEC dbo.AddOrder '06020783  ','0001',' ',38754.5, 'NESTLE WATERS SUPPLY EST', @OrderID OUTPUT
EXEC dbo.AddOrder '06020783  ','0001','a',38761.5, 'NESTLE WATERS SUPPLY EST', @OrderID OUTPUT
EXEC dbo.AddOrder '06020786  ','0001',' ',38760.5, 'W. WIRTH GMBH', @OrderID OUTPUT
EXEC dbo.AddOrder '06020791  ','0001',' ',38762.5, 'SOMFY', @OrderID OUTPUT
EXEC dbo.AddOrder '06020792  ','0001',' ',38777.5, 'AMERICAN STANDARD EUROPE', @OrderID OUTPUT
EXEC dbo.AddOrder '06020794  ','0001',' ',38776.5, 'AMERICAN STANDARD EUROPE', @OrderID OUTPUT
EXEC dbo.AddOrder '06020795  ','0001',' ',38762.5, 'CARTON PLUS', @OrderID OUTPUT
EXEC dbo.AddOrder '06020796  ','0001',' ',38762.5, 'CARTON PLUS', @OrderID OUTPUT
EXEC dbo.AddOrder '06020798  ','0001',' ',38762.5, 'CARTON PLUS', @OrderID OUTPUT
EXEC dbo.AddOrder '06020799  ','0001',' ',38784.5, 'GEORGIA-PACIFIC FRANCE', @OrderID OUTPUT
EXEC dbo.AddOrder '06020802  ','0001',' ',38770.5, 'EXEL NV', @OrderID OUTPUT
EXEC dbo.AddOrder '06020803  ','0001',' ',38770.5, 'EXEL NV', @OrderID OUTPUT
EXEC dbo.AddOrder '06020805  ','0001',' ',38754.5, 'NESTLE WATERS SUPPLY EST', @OrderID OUTPUT
EXEC dbo.AddOrder '06020805  ','0001','a',38756.5, 'NESTLE WATERS SUPPLY EST', @OrderID OUTPUT
EXEC dbo.AddOrder '06020821  ','0001',' ',38766.5, 'NESTLE WATERS SUPPLY EST', @OrderID OUTPUT
EXEC dbo.AddOrder '06020823  ','0001',' ',38762.5, 'NESTLE WATERS SUPPLY EST', @OrderID OUTPUT
EXEC dbo.AddOrder '06020825  ','0001',' ',38790.5, 'DU PONT DE NEMOURS (FRAN', @OrderID OUTPUT
EXEC dbo.AddOrder '06020825  ','0001','a',38790.5, 'DU PONT DE NEMOURS (FRAN', @OrderID OUTPUT
EXEC dbo.AddOrder '06020827  ','0001',' ',38767.5, 'PEUGEOT CITROEN AUTOMOBI', @OrderID OUTPUT
EXEC dbo.AddOrder '06020830  ','0001',' ',38776.5, 'NEUHAUSER', @OrderID OUTPUT
EXEC dbo.AddOrder '06020832  ','0001',' ',38780.5, 'NEUHAUSER', @OrderID OUTPUT
EXEC dbo.AddOrder '06020834  ','0001',' ',38777.5, 'NEUHAUSER', @OrderID OUTPUT
EXEC dbo.AddOrder '06020834  ','0001','b',38777.5, 'NEUHAUSER', @OrderID OUTPUT
EXEC dbo.AddOrder '06020837  ','0001',' ',38777.5, 'SA. BOULANGERIE NEUHAUSE', @OrderID OUTPUT
EXEC dbo.AddOrder '06020839  ','0001',' ',38767.5, 'SA. BOULANGERIE NEUHAUSE', @OrderID OUTPUT
EXEC dbo.AddOrder '06020841  ','0001',' ',38776.5, 'SA. BOULANGERIE NEUHAUSE', @OrderID OUTPUT
EXEC dbo.AddOrder '06020843  ','0001',' ',38782.5, 'SA. BOULANGERIE NEUHAUSE', @OrderID OUTPUT
EXEC dbo.AddOrder '06020843  ','0001','a',38788.5, 'SA. BOULANGERIE NEUHAUSE', @OrderID OUTPUT
EXEC dbo.AddOrder '06020845  ','0001',' ',38782.5, 'SA. BOULANGERIE NEUHAUSE', @OrderID OUTPUT
EXEC dbo.AddOrder '06020845  ','0001','a',38788.5, 'SA. BOULANGERIE NEUHAUSE', @OrderID OUTPUT
EXEC dbo.AddOrder '06020847  ','0001',' ',38776.5, 'SA. BOULANGERIE NEUHAUSE', @OrderID OUTPUT
EXEC dbo.AddOrder '06020849  ','0001',' ',38798.5, 'SA. BOULANGERIE NEUHAUSE', @OrderID OUTPUT
EXEC dbo.AddOrder '06020850  ','0001',' ',38761.5, 'FISCHER SERVICES', @OrderID OUTPUT
EXEC dbo.AddOrder '06020851  ','0001',' ',38760.5, 'WIRTH VERPACKUNGEN GMBH', @OrderID OUTPUT
EXEC dbo.AddOrder '06020853  ','0001',' ',38773.5, 'STE SIMU', @OrderID OUTPUT
EXEC dbo.AddOrder '06020858  ','0001',' ',38754.5, 'MGI COUTIER PLASTIQUE', @OrderID OUTPUT
EXEC dbo.AddOrder '06020861  ','0001',' ',38768.5, 'LABORATOIRES FOURNIER S.', @OrderID OUTPUT
EXEC dbo.AddOrder '06020862  ','0001',' ',38768.5, 'LABORATOIRES FOURNIER S.', @OrderID OUTPUT
EXEC dbo.AddOrder '06020863  ','0001',' ',38766.5, 'CDF EMBALLAGE SA', @OrderID OUTPUT
EXEC dbo.AddOrder '06020865  ','0001',' ',38760.5, 'PEUGEOT CITROEN AUTOMOBI', @OrderID OUTPUT
EXEC dbo.AddOrder '06020867  ','0001',' ',38760.5, 'CDF EMBALLAGE SA', @OrderID OUTPUT
EXEC dbo.AddOrder '06020868  ','0001',' ',38761.5, 'TRISS SPOL.S.R.O.', @OrderID OUTPUT
EXEC dbo.AddOrder '06020869  ','0001',' ',38789.5, 'HORN VERPACKUNG GMBH', @OrderID OUTPUT
EXEC dbo.AddOrder '06020870  ','0001',' ',38767.5, 'HUWALD LIEBSCHNER GMBH', @OrderID OUTPUT
EXEC dbo.AddOrder '06020871  ','0001',' ',38768.5, 'HORN VERPACKUNG GMBH', @OrderID OUTPUT
EXEC dbo.AddOrder '06020873  ','0001',' ',38762.5, 'DS SMITH KAYSERSBERG', @OrderID OUTPUT
EXEC dbo.AddOrder '06020876  ','0001',' ',38756.5, 'DS SMITH KAYPAC', @OrderID OUTPUT
EXEC dbo.AddOrder '06020878  ','0001',' ',38777.5, 'UDO ZIER GMBH', @OrderID OUTPUT
EXEC dbo.AddOrder '06020879  ','0001',' ',38759.5, 'VISTEON SYSTEMES INTERIE', @OrderID OUTPUT
EXEC dbo.AddOrder '06020879  ','0002',' ',38776.5, 'VISTEON SYSTEMES INTERIE', @OrderID OUTPUT
EXEC dbo.AddOrder '06020881  ','0001',' ',38753.5, 'STE SIMU', @OrderID OUTPUT
EXEC dbo.AddOrder '06020882  ','0001',' ',38762.5, 'TECUMSEH EUROPE S.A.', @OrderID OUTPUT
EXEC dbo.AddOrder '06020885  ','0001',' ',38769.5, 'MAAG  TECHNIC AG', @OrderID OUTPUT
EXEC dbo.AddOrder '06020886  ','0001',' ',38769.5, 'MAAG  TECHNIC AG', @OrderID OUTPUT
EXEC dbo.AddOrder '06020887  ','0001',' ',38769.5, 'STE ALSA-CORK', @OrderID OUTPUT
EXEC dbo.AddOrder '06020896  ','0001',' ',38770.5, 'VON ROLL SUISSE SA', @OrderID OUTPUT
EXEC dbo.AddOrder '06020897  ','0001',' ',38770.5, 'VON ROLL SUISSE SA', @OrderID OUTPUT
EXEC dbo.AddOrder '06020898  ','0001',' ',38759.5, 'MEPHISTO', @OrderID OUTPUT
EXEC dbo.AddOrder '06020901  ','0001',' ',38766.5, 'S.A. V 33', @OrderID OUTPUT
EXEC dbo.AddOrder '06020903  ','0001',' ',38763.5, 'SCHNEIDER ELECTRIC FRANC', @OrderID OUTPUT
EXEC dbo.AddOrder '06020905  ','0001',' ',38776.5, 'STE SIMU', @OrderID OUTPUT
EXEC dbo.AddOrder '06020906  ','0001',' ',38770.5, 'HEXCEL COMPOSITES', @OrderID OUTPUT
EXEC dbo.AddOrder '06020907  ','0001',' ',38791.5, 'HEXCEL COMPOSITES', @OrderID OUTPUT
EXEC dbo.AddOrder '06020908  ','0001',' ',38817.5, 'HEXCEL COMPOSITES', @OrderID OUTPUT
EXEC dbo.AddOrder '06020909  ','0001',' ',38847.5, 'HEXCEL COMPOSITES', @OrderID OUTPUT
EXEC dbo.AddOrder '06020911  ','0001',' ',38763.5, 'D.P.F. DIFFUS.PREST.FIAB', @OrderID OUTPUT
EXEC dbo.AddOrder '06020912  ','0001',' ',38756.5, 'CART.EMBAL. RHONE ALPES', @OrderID OUTPUT
EXEC dbo.AddOrder '06020913  ','0001',' ',38755.5, 'CART.EMBAL. RHONE ALPES', @OrderID OUTPUT
EXEC dbo.AddOrder '06020913  ','0002',' ',38755.5, 'CART.EMBAL. RHONE ALPES', @OrderID OUTPUT
EXEC dbo.AddOrder '06020915  ','0001',' ',38774.5, 'COLAS MIDI MEDITERANNEE', @OrderID OUTPUT
EXEC dbo.AddOrder '06020916  ','0001',' ',38774.5, 'COLAS MIDI MEDITERANNEE', @OrderID OUTPUT
EXEC dbo.AddOrder '06020917  ','0001',' ',38759.5, 'CART.EMBAL. RHONE ALPES', @OrderID OUTPUT
EXEC dbo.AddOrder '06020918  ','0001',' ',38805.5, 'STE SIMU', @OrderID OUTPUT
EXEC dbo.AddOrder '06020920  ','0001',' ',38769.5, 'PEUGEOT CITROEN AUTOMOBI', @OrderID OUTPUT
EXEC dbo.AddOrder '06020922  ','0001',' ',38775.5, 'PEUGEOT CITROEN AUTOMOBI', @OrderID OUTPUT
EXEC dbo.AddOrder '06020925  ','0001',' ',38759.5, 'DOW AGROSCIENCES SWITERL', @OrderID OUTPUT
EXEC dbo.AddOrder '06020926  ','0001',' ',38759.5, 'DOW AGROSCIENCES SWITERL', @OrderID OUTPUT
EXEC dbo.AddOrder '06020927  ','0001',' ',38759.5, 'DOW AGROSCIENCES SWITERL', @OrderID OUTPUT
EXEC dbo.AddOrder '06020928  ','0001',' ',38759.5, 'DOW AGROSCIENCES SWITERL', @OrderID OUTPUT
EXEC dbo.AddOrder '06020929  ','0001',' ',38759.5, 'DOW AGROSCIENCES SWITERL', @OrderID OUTPUT
EXEC dbo.AddOrder '06020930  ','0001',' ',38759.5, 'DOW AGROSCIENCES SWITERL', @OrderID OUTPUT
EXEC dbo.AddOrder '06020930  ','0001','a',38759.5, 'DOW AGROSCIENCES SWITERL', @OrderID OUTPUT
EXEC dbo.AddOrder '06020931  ','0001',' ',38759.5, 'DOW AGROSCIENCES SWITERL', @OrderID OUTPUT
EXEC dbo.AddOrder '06020934  ','0001',' ',38759.5, 'DOW-AGROSCIENCES ITALIA', @OrderID OUTPUT
EXEC dbo.AddOrder '06020935  ','0001',' ',38759.5, 'DOW-AGROSCIENCES ITALIA', @OrderID OUTPUT
EXEC dbo.AddOrder '06020936  ','0001',' ',38759.5, 'DOW-AGROSCIENCES ITALIA', @OrderID OUTPUT
EXEC dbo.AddOrder '06020937  ','0001',' ',38759.5, 'DOW-AGROSCIENCES ITALIA', @OrderID OUTPUT
EXEC dbo.AddOrder '06020937  ','0001','a',38760.5, 'DOW-AGROSCIENCES ITALIA', @OrderID OUTPUT
EXEC dbo.AddOrder '06020939  ','0001',' ',38767.5, 'JDW HOLDING GMBH', @OrderID OUTPUT
EXEC dbo.AddOrder '06020940  ','0001',' ',38766.5, 'JDW HOLDING GMBH', @OrderID OUTPUT
EXEC dbo.AddOrder '06020941  ','0001',' ',38760.5, 'DOW AGROSCIENCES', @OrderID OUTPUT
EXEC dbo.AddOrder '06020942  ','0001',' ',38759.5, 'DOW AGROSCIENCES', @OrderID OUTPUT
EXEC dbo.AddOrder '06020943  ','0001',' ',38760.5, 'DOW AGROSCIENCES', @OrderID OUTPUT
EXEC dbo.AddOrder '06020944  ','0001',' ',38759.5, 'DOW AGROSCIENCES', @OrderID OUTPUT
EXEC dbo.AddOrder '06020945  ','0001',' ',38759.5, 'DOW AGROSCIENCES', @OrderID OUTPUT
EXEC dbo.AddOrder '06020946  ','0001',' ',38759.5, 'DOW AGROSCIENCES', @OrderID OUTPUT
EXEC dbo.AddOrder '06020947  ','0001',' ',38759.5, 'DOW AGROSCIENCES', @OrderID OUTPUT
EXEC dbo.AddOrder '06020948  ','0001',' ',38759.5, 'DOW AGROSCIENCES', @OrderID OUTPUT
EXEC dbo.AddOrder '06020949  ','0001',' ',38759.5, 'DOW AGROSCIENCES', @OrderID OUTPUT
EXEC dbo.AddOrder '06020950  ','0001',' ',38759.5, 'DOW AGROSCIENCES', @OrderID OUTPUT
EXEC dbo.AddOrder '06020951  ','0001',' ',38759.5, 'DOW AGROSCIENCES', @OrderID OUTPUT
EXEC dbo.AddOrder '06020952  ','0001',' ',38759.5, 'DOW AGROSCIENCES', @OrderID OUTPUT
EXEC dbo.AddOrder '06020953  ','0001',' ',38759.5, 'DOW AGROSCIENCES', @OrderID OUTPUT
EXEC dbo.AddOrder '06020954  ','0001',' ',38759.5, 'DOW AGROSCIENCES', @OrderID OUTPUT
EXEC dbo.AddOrder '06020955  ','0001',' ',38759.5, 'DOW AGROSCIENCES', @OrderID OUTPUT
EXEC dbo.AddOrder '06020956  ','0001',' ',38759.5, 'DOW AGROSCIENCES', @OrderID OUTPUT
EXEC dbo.AddOrder '06020957  ','0001',' ',38760.5, 'DOW AGROSCIENCES', @OrderID OUTPUT
EXEC dbo.AddOrder '06020958  ','0001',' ',38760.5, 'DOW AGROSCIENCES', @OrderID OUTPUT
EXEC dbo.AddOrder '06020959  ','0001',' ',38759.5, 'DOW AGROSCIENCES', @OrderID OUTPUT
EXEC dbo.AddOrder '06020960  ','0001',' ',38759.5, 'DOW AGROSCIENCES', @OrderID OUTPUT
EXEC dbo.AddOrder '06020961  ','0001',' ',38759.5, 'DOW AGROSCIENCES', @OrderID OUTPUT
EXEC dbo.AddOrder '06020962  ','0001',' ',38759.5, 'DOW AGROSCIENCES', @OrderID OUTPUT
EXEC dbo.AddOrder '06020963  ','0001',' ',38759.5, 'DOW AGROSCIENCES', @OrderID OUTPUT
EXEC dbo.AddOrder '06020964  ','0001',' ',38760.5, 'DOW AGROSCIENCES', @OrderID OUTPUT
EXEC dbo.AddOrder '06020965  ','0001',' ',38760.5, 'DOW AGROSCIENCES', @OrderID OUTPUT
EXEC dbo.AddOrder '06020967  ','0001',' ',38753.5, 'MGI COUTIER VILLIEU', @OrderID OUTPUT
EXEC dbo.AddOrder '06020969  ','0001',' ',38761.5, 'DOW AGROSCIENCES SWITERL', @OrderID OUTPUT
EXEC dbo.AddOrder '06020971  ','0001',' ',38759.5, 'DOW AGROSCIENCES SWITERL', @OrderID OUTPUT
EXEC dbo.AddOrder '06020973  ','0001',' ',38773.5, 'W. WIRTH GMBH', @OrderID OUTPUT
EXEC dbo.AddOrder '06020974  ','0001',' ',38761.5, 'COGESAL MIKO-FSEUR 58488', @OrderID OUTPUT
EXEC dbo.AddOrder '06020975  ','0001',' ',38762.5, 'COGESAL MIKO-FSEUR 58488', @OrderID OUTPUT
EXEC dbo.AddOrder '06020976  ','0001',' ',38761.5, 'COGESAL MIKO-FSEUR 58488', @OrderID OUTPUT
EXEC dbo.AddOrder '06020977  ','0001',' ',38762.5, 'COGESAL MIKO-FSEUR 58488', @OrderID OUTPUT
EXEC dbo.AddOrder '06020983  ','0001',' ',38759.5, 'SCHWEITZER S.A.', @OrderID OUTPUT
EXEC dbo.AddOrder '06020986  ','0001',' ',38769.5, 'RICOH INDUSTRIE FRANCE', @OrderID OUTPUT
EXEC dbo.AddOrder '06020987  ','0001',' ',38760.5, 'CARTON PLUS', @OrderID OUTPUT
EXEC dbo.AddOrder '06020989  ','0001',' ',38760.5, 'CARTON PLUS', @OrderID OUTPUT
EXEC dbo.AddOrder '06020991  ','0001',' ',38769.5, 'RICOH INDUSTRIE FRANCE', @OrderID OUTPUT
EXEC dbo.AddOrder '06020992  ','0001',' ',38760.5, 'CARTON PLUS', @OrderID OUTPUT
EXEC dbo.AddOrder '06020993  ','0001',' ',38769.5, 'RICOH INDUSTRIE FRANCE', @OrderID OUTPUT
EXEC dbo.AddOrder '06020995  ','0001',' ',38769.5, 'RICOH INDUSTRIE FRANCE', @OrderID OUTPUT
EXEC dbo.AddOrder '06020997  ','0001',' ',38769.5, 'RICOH INDUSTRIE FRANCE', @OrderID OUTPUT
EXEC dbo.AddOrder '06021001  ','0001',' ',38759.5, 'P&G INTERNATIONAL OPERAT', @OrderID OUTPUT
EXEC dbo.AddOrder '06021002  ','0001',' ',38763.5, 'ROLF SCHWIERING GMBH', @OrderID OUTPUT
EXEC dbo.AddOrder '06021003  ','0001',' ',38763.5, 'ROLF SCHWIERING GMBH', @OrderID OUTPUT
EXEC dbo.AddOrder '06021006  ','0001',' ',38762.5, 'COGESAL MIKO-FSEUR 58488', @OrderID OUTPUT
EXEC dbo.AddOrder '06021009  ','0001',' ',38769.5, 'P&G INTERNATIONAL OPERAT', @OrderID OUTPUT
EXEC dbo.AddOrder '06021015  ','0001',' ',38766.5, 'MAURER FRERES', @OrderID OUTPUT
EXEC dbo.AddOrder '06021018  ','0001',' ',38763.5, 'CARTONNAGES BERTRAND - N', @OrderID OUTPUT
EXEC dbo.AddOrder '06021020  ','0001',' ',38763.5, 'MAHLE VENTIELTRIEB GMBH', @OrderID OUTPUT
EXEC dbo.AddOrder '06021021  ','0001',' ',38859.5, 'MAHLE VENTIELTRIEB GMBH', @OrderID OUTPUT
EXEC dbo.AddOrder '06021023  ','0001',' ',38762.5, 'COGESAL MIKO-FSEUR 58488', @OrderID OUTPUT
EXEC dbo.AddOrder '06021025  ','0001',' ',38763.5, 'THERMOBILE INDUSTRIE BV', @OrderID OUTPUT
EXEC dbo.AddOrder '06021027  ','0001',' ',38753.5, 'NESTLE WATERS SUPPLY EST', @OrderID OUTPUT
EXEC dbo.AddOrder '06021029  ','0001',' ',38760.5, 'NESTLE WATERS SUPPLY EST', @OrderID OUTPUT
EXEC dbo.AddOrder '06021031  ','0001',' ',38754.5, 'NESTLE WATERS SUPPLY EST', @OrderID OUTPUT
EXEC dbo.AddOrder '06021033  ','0001',' ',38755.5, 'NESTLE WATERS SUPPLY EST', @OrderID OUTPUT
EXEC dbo.AddOrder '06021035  ','0001',' ',38759.5, 'NESTLE WATERS SUPPLY EST', @OrderID OUTPUT
EXEC dbo.AddOrder '06021037  ','0001',' ',38755.5, 'BRASSERIE FISCHER SA', @OrderID OUTPUT
EXEC dbo.AddOrder '06021038  ','0001',' ',38760.5, 'WELL-PACK AG', @OrderID OUTPUT
EXEC dbo.AddOrder '06021040  ','0001',' ',38768.5, 'DELIPAPIER', @OrderID OUTPUT
EXEC dbo.AddOrder '06021040  ','0001','a',38768.5, 'DELIPAPIER', @OrderID OUTPUT
EXEC dbo.AddOrder '06021040  ','0001','b',38768.5, 'DELIPAPIER', @OrderID OUTPUT
EXEC dbo.AddOrder '06021041  ','0001',' ',38774.5, 'DELIPAPIER', @OrderID OUTPUT
EXEC dbo.AddOrder '06021042  ','0001',' ',38808.5, 'DELIPAPIER', @OrderID OUTPUT
EXEC dbo.AddOrder '06021045  ','0001',' ',38760.5, 'S.M.A.E.    (EDI)', @OrderID OUTPUT
EXEC dbo.AddOrder '06021047  ','0001',' ',38760.5, 'S.M.A.E.    (EDI)', @OrderID OUTPUT
EXEC dbo.AddOrder '06021050  ','0001',' ',38763.5, 'BRASSERIE FISCHER SA', @OrderID OUTPUT
EXEC dbo.AddOrder '06021051  ','0001',' ',38763.5, 'S.M.A.E. ZI METZ BORNY (', @OrderID OUTPUT
EXEC dbo.AddOrder '06021052  ','0001',' ',38763.5, 'S.M.A.E. ZI METZ BORNY (', @OrderID OUTPUT
EXEC dbo.AddOrder '06021053  ','0001',' ',38763.5, 'S.M.A.E. ZI METZ BORNY (', @OrderID OUTPUT
EXEC dbo.AddOrder '06021054  ','0001',' ',38763.5, 'S.M.A.E. ZI METZ BORNY (', @OrderID OUTPUT
EXEC dbo.AddOrder '06021055  ','0001',' ',38763.5, 'S.M.A.E. ZI METZ BORNY (', @OrderID OUTPUT
EXEC dbo.AddOrder '06021057  ','0001',' ',38763.5, 'S.M.A.E. ZI METZ BORNY (', @OrderID OUTPUT
EXEC dbo.AddOrder '06021058  ','0001',' ',38763.5, 'S.M.A.E. ZI METZ BORNY (', @OrderID OUTPUT
EXEC dbo.AddOrder '06021059  ','0001',' ',38763.5, 'S.M.A.E. ZI METZ BORNY (', @OrderID OUTPUT
EXEC dbo.AddOrder '06021060  ','0001',' ',38763.5, 'S.M.A.E. ZI METZ BORNY (', @OrderID OUTPUT
EXEC dbo.AddOrder '06021061  ','0001',' ',38763.5, 'S.M.A.E. ZI METZ BORNY (', @OrderID OUTPUT
EXEC dbo.AddOrder '06021062  ','0001',' ',38762.5, 'OTTO RAUHUT GMBH & CO', @OrderID OUTPUT
EXEC dbo.AddOrder '06021064  ','0001',' ',38773.5, 'CONDI RHONE ALPES', @OrderID OUTPUT
EXEC dbo.AddOrder '06021068  ','0001',' ',38777.5, 'PATHEON', @OrderID OUTPUT
EXEC dbo.AddOrder '06021070  ','0001',' ',38773.5, 'CARTONNAGES ROSET', @OrderID OUTPUT
EXEC dbo.AddOrder '06021070  ','0002',' ',38773.5, 'CARTONNAGES ROSET', @OrderID OUTPUT
EXEC dbo.AddOrder '06021070  ','0003',' ',38773.5, 'CARTONNAGES ROSET', @OrderID OUTPUT
EXEC dbo.AddOrder '06021071  ','0001',' ',38762.5, 'DS SMITH KAYSERSBERG', @OrderID OUTPUT
EXEC dbo.AddOrder '06021072  ','0001',' ',38761.5, 'REHAU AG & CO', @OrderID OUTPUT
EXEC dbo.AddOrder '06021073  ','0001',' ',38761.5, 'REHAU AG & CO', @OrderID OUTPUT
EXEC dbo.AddOrder '06021074  ','0001',' ',38769.5, 'REHAU AG & CO', @OrderID OUTPUT
EXEC dbo.AddOrder '06021076  ','0001',' ',38760.5, 'BRASSERIE FISCHER SA', @OrderID OUTPUT
EXEC dbo.AddOrder '06021078  ','0001',' ',38762.5, 'BRASSERIE FISCHER SA', @OrderID OUTPUT
EXEC dbo.AddOrder '06021079  ','0001',' ',38763.5, 'BRASSERIE FISCHER SA', @OrderID OUTPUT
EXEC dbo.AddOrder '06021082  ','0001',' ',38760.5, 'BRASSERIE FISCHER SA', @OrderID OUTPUT
EXEC dbo.AddOrder '06021084  ','0001',' ',38763.5, 'BRASSERIE FISCHER SA', @OrderID OUTPUT
EXEC dbo.AddOrder '06021087  ','0001',' ',38762.5, 'FRISETTA POLYMER GMBH &', @OrderID OUTPUT
EXEC dbo.AddOrder '06021088  ','0001',' ',38762.5, 'FRISETTA POLYMER GMBH &', @OrderID OUTPUT
EXEC dbo.AddOrder '06021089  ','0001',' ',38773.5, 'BRASSERIE FISCHER SA', @OrderID OUTPUT
EXEC dbo.AddOrder '06021090  ','0001',' ',38774.5, 'BRASSERIE FISCHER SA', @OrderID OUTPUT
EXEC dbo.AddOrder '06021092  ','0001',' ',38762.5, 'CHAVANOZ INDUSTRIE', @OrderID OUTPUT
EXEC dbo.AddOrder '06021094  ','0001',' ',38760.5, 'BRASSERIE FISCHER SA', @OrderID OUTPUT
EXEC dbo.AddOrder '06021096  ','0001',' ',38755.5, 'NESTLE WATERS SUPPLY EST', @OrderID OUTPUT
EXEC dbo.AddOrder '06021098  ','0001',' ',38755.5, 'NESTLE WATERS SUPPLY EST', @OrderID OUTPUT
EXEC dbo.AddOrder '06021100  ','0001',' ',38755.5, 'NESTLE WATERS SUPPLY EST', @OrderID OUTPUT
EXEC dbo.AddOrder '06021102  ','0001',' ',38761.5, 'NESTLE WATERS SUPPLY EST', @OrderID OUTPUT
EXEC dbo.AddOrder '06021105  ','0001',' ',38767.5, 'DS SMITH KAYPAC', @OrderID OUTPUT
EXEC dbo.AddOrder '06021107  ','0001',' ',38760.5, 'DOW AGROSCIENCES SWITZEL', @OrderID OUTPUT
EXEC dbo.AddOrder '06021108  ','0001',' ',38760.5, 'DOW AGROSCIENCES SWITZEL', @OrderID OUTPUT
EXEC dbo.AddOrder '06021110  ','0001',' ',38761.5, 'NESTLE WATERS SUPPLY EST', @OrderID OUTPUT
EXEC dbo.AddOrder '06021112  ','0001',' ',38762.5, 'NESTLE WATERS SUPPLY EST', @OrderID OUTPUT
EXEC dbo.AddOrder '06021114  ','0001',' ',38760.5, 'NESTLE WATERS SUPPLY EST', @OrderID OUTPUT
EXEC dbo.AddOrder '06021118  ','0001',' ',38761.5, 'NESTLE WATERS SUPPLY EST', @OrderID OUTPUT
EXEC dbo.AddOrder '06021122  ','0001',' ',38756.5, 'NESTLE WATERS SUPPLY EST', @OrderID OUTPUT
EXEC dbo.AddOrder '06021124  ','0001',' ',38759.5, 'NESTLE WATERS SUPPLY EST', @OrderID OUTPUT
EXEC dbo.AddOrder '06021126  ','0001',' ',38759.5, 'NESTLE WATERS SUPPLY EST', @OrderID OUTPUT
EXEC dbo.AddOrder '06021128  ','0001',' ',38762.5, 'NESTLE WATERS SUPPLY EST', @OrderID OUTPUT
EXEC dbo.AddOrder '06021129  ','0001',' ',38762.5, 'TRISS SPOL.S.R.O.', @OrderID OUTPUT
EXEC dbo.AddOrder '06021131  ','0001',' ',38760.5, 'NESTLE WATERS SUPPLY EST', @OrderID OUTPUT
EXEC dbo.AddOrder '06021132  ','0001',' ',38767.5, 'DS SMITH KAYPAC', @OrderID OUTPUT
EXEC dbo.AddOrder '06021133  ','0001',' ',38767.5, 'DS SMITH KAYPAC', @OrderID OUTPUT
EXEC dbo.AddOrder '06021134  ','0001',' ',38759.5, 'DS SMITH KAYPAC', @OrderID OUTPUT
EXEC dbo.AddOrder '06021138  ','0001',' ',38759.5, 'WELL-PACK AG', @OrderID OUTPUT
EXEC dbo.AddOrder '06021139  ','0001',' ',38760.5, 'WELL-PACK AG', @OrderID OUTPUT
EXEC dbo.AddOrder '06021142  ','0001',' ',38766.5, 'DU PONT DE NEMOURS (FRAN', @OrderID OUTPUT
EXEC dbo.AddOrder '06021144  ','0001',' ',38770.5, 'DU PONT DE NEMOURS (FRAN', @OrderID OUTPUT
EXEC dbo.AddOrder '06021146  ','0001',' ',38773.5, 'DU PONT DE NEMOURS (FRAN', @OrderID OUTPUT
EXEC dbo.AddOrder '06021148  ','0001',' ',38773.5, 'DS SMITH KAYPAC', @OrderID OUTPUT
EXEC dbo.AddOrder '06021149  ','0001',' ',38768.5, 'DU PONT DE NEMOURS (FRAN', @OrderID OUTPUT
EXEC dbo.AddOrder '06021149  ','0001','b',38773.5, 'DU PONT DE NEMOURS (FRAN', @OrderID OUTPUT
EXEC dbo.AddOrder '06021153  ','0001',' ',38760.5, 'BRASSERIE FISCHER SA', @OrderID OUTPUT
EXEC dbo.AddOrder '06021155  ','0001',' ',38773.5, 'BRASSERIE FISCHER SA', @OrderID OUTPUT
EXEC dbo.AddOrder '06021155  ','0001','a',38776.5, 'BRASSERIE FISCHER SA', @OrderID OUTPUT
EXEC dbo.AddOrder '06021157  ','0001',' ',38766.5, 'HEXCEL FABRICS S.A.', @OrderID OUTPUT
EXEC dbo.AddOrder '06021159  ','0001',' ',38761.5, 'CART.EMBAL. RHONE ALPES', @OrderID OUTPUT
EXEC dbo.AddOrder '06021159  ','0001','a',38761.5, 'CART.EMBAL. RHONE ALPES', @OrderID OUTPUT
EXEC dbo.AddOrder '06021162  ','0001',' ',38761.5, 'CART.EMBAL. RHONE ALPES', @OrderID OUTPUT
EXEC dbo.AddOrder '06021167  ','0001',' ',38762.5, 'BRASSERIE FISCHER SA', @OrderID OUTPUT
EXEC dbo.AddOrder '06021170  ','0001',' ',38761.5, 'SAE SERGE CHEVEAU', @OrderID OUTPUT
EXEC dbo.AddOrder '06021170  ','0001','b',38762.5, 'SAE SERGE CHEVEAU', @OrderID OUTPUT
EXEC dbo.AddOrder '06021173  ','0001',' ',38761.5, 'DOW AGROSCIENCES', @OrderID OUTPUT
EXEC dbo.AddOrder '06021174  ','0001',' ',38762.5, 'DHL SOLUTIONS FRANCE SAS', @OrderID OUTPUT
EXEC dbo.AddOrder '06021175  ','0001',' ',38762.5, 'DHL SOLUTIONS FRANCE SAS', @OrderID OUTPUT
EXEC dbo.AddOrder '06021176  ','0001',' ',38762.5, 'DHL SOLUTIONS FRANCE SAS', @OrderID OUTPUT
EXEC dbo.AddOrder '06021177  ','0001',' ',38763.5, 'DHL SOLUTIONS FRANCE SAS', @OrderID OUTPUT
EXEC dbo.AddOrder '06021178  ','0001',' ',38763.5, 'DHL SOLUTIONS FRANCE SAS', @OrderID OUTPUT
EXEC dbo.AddOrder '06021179  ','0001',' ',38763.5, 'DHL SOLUTIONS FRANCE SAS', @OrderID OUTPUT
EXEC dbo.AddOrder '06021182  ','0001',' ',38767.5, 'SAE SERGE CHEVEAU', @OrderID OUTPUT
EXEC dbo.AddOrder '06021183  ','0001',' ',38759.5, 'DIEFENBACH VERPACKUNGEN', @OrderID OUTPUT
EXEC dbo.AddOrder '06021188  ','0001',' ',38753.5, 'JTEKT AUTOMOBILE', @OrderID OUTPUT
EXEC dbo.AddOrder '06021191  ','0001',' ',38753.5, 'JTEKT AUTOMOBILE', @OrderID OUTPUT
EXEC dbo.AddOrder '06021193  ','0001',' ',38762.5, 'PETER O. PURSCH', @OrderID OUTPUT
EXEC dbo.AddOrder '06021196  ','0001',' ',38774.5, 'DAIMLER CHRYSLER AG', @OrderID OUTPUT
EXEC dbo.AddOrder '06021198  ','0001',' ',38780.5, 'PETER O. PURSCH', @OrderID OUTPUT
EXEC dbo.AddOrder '06021199  ','0001',' ',38774.5, 'DAIMLER CHRYSLER AG', @OrderID OUTPUT
EXEC dbo.AddOrder '06021201  ','0001',' ',38763.5, 'B.V.ALVERIMPORT', @OrderID OUTPUT
EXEC dbo.AddOrder '06021204  ','0001',' ',38768.5, 'BRASSERIE FISCHER SA', @OrderID OUTPUT
EXEC dbo.AddOrder '06021206  ','0001',' ',38783.5, 'SODETAL SARL', @OrderID OUTPUT
EXEC dbo.AddOrder '06021207  ','0001',' ',38783.5, 'SODETAL SARL', @OrderID OUTPUT
EXEC dbo.AddOrder '06021208  ','0001',' ',38796.5, 'SODETAL SARL', @OrderID OUTPUT
EXEC dbo.AddOrder '06021211  ','0001',' ',38762.5, 'NESTLE WATERS SUPPLY EST', @OrderID OUTPUT
EXEC dbo.AddOrder '06021215  ','0001',' ',38768.5, 'NESTLE WATERS SUPPLY EST', @OrderID OUTPUT
EXEC dbo.AddOrder '06021217  ','0001',' ',38770.5, 'NESTLE WATERS SUPPLY EST', @OrderID OUTPUT
EXEC dbo.AddOrder '06021219  ','0001',' ',38774.5, 'NESTLE WATERS SUPPLY EST', @OrderID OUTPUT
EXEC dbo.AddOrder '06021223  ','0001',' ',38775.5, 'NESTLE WATERS SUPPLY EST', @OrderID OUTPUT
EXEC dbo.AddOrder '06021225  ','0001',' ',38777.5, 'NESTLE WATERS SUPPLY EST', @OrderID OUTPUT
EXEC dbo.AddOrder '06021227  ','0001',' ',38777.5, 'GEORGIA-PACIFIC FRANCE', @OrderID OUTPUT
EXEC dbo.AddOrder '06021228  ','0001',' ',38794.5, 'LINDAL-FRANCE', @OrderID OUTPUT
EXEC dbo.AddOrder '06021229  ','0001',' ',38787.5, 'LINDAL-FRANCE', @OrderID OUTPUT
EXEC dbo.AddOrder '06021235  ','0001',' ',38766.5, 'SCHWEITZER S.A.', @OrderID OUTPUT
EXEC dbo.AddOrder '06021236  ','0001',' ',38766.5, 'SCHWEITZER S.A.', @OrderID OUTPUT
EXEC dbo.AddOrder '06021238  ','0001',' ',38763.5, 'INNOPAC SARL', @OrderID OUTPUT
EXEC dbo.AddOrder '06021239  ','0001',' ',38762.5, 'SCHWEITZER S.A.', @OrderID OUTPUT
EXEC dbo.AddOrder '06021241  ','0001',' ',38767.5, 'SCHWEITZER S.A.', @OrderID OUTPUT
EXEC dbo.AddOrder '06021242  ','0001',' ',38767.5, 'SCHWEITZER S.A.', @OrderID OUTPUT
EXEC dbo.AddOrder '06021244  ','0001',' ',38769.5, 'CARTONNAGES BERTRAND - N', @OrderID OUTPUT
EXEC dbo.AddOrder '06021245  ','0001',' ',38781.5, 'CARTONNAGES BERTRAND - N', @OrderID OUTPUT
EXEC dbo.AddOrder '06021246  ','0001',' ',38768.5, 'SCHWEITZER S.A.', @OrderID OUTPUT
EXEC dbo.AddOrder '06021247  ','0001',' ',38768.5, 'SCHWEITZER S.A.', @OrderID OUTPUT
EXEC dbo.AddOrder '06021249  ','0001',' ',38769.5, 'SCHWEITZER S.A.', @OrderID OUTPUT
EXEC dbo.AddOrder '06021251  ','0001',' ',38768.5, 'SCHWEITZER S.A.', @OrderID OUTPUT
EXEC dbo.AddOrder '06021254  ','0001',' ',38770.5, 'JTEKT AUTOMOBILE LYON', @OrderID OUTPUT
EXEC dbo.AddOrder '06021259  ','0001',' ',38782.5, 'CAVE COOPERATIVE RIBEAUV', @OrderID OUTPUT
EXEC dbo.AddOrder '06021267  ','0001',' ',38768.5, 'SCHWEITZER S.A.', @OrderID OUTPUT
EXEC dbo.AddOrder '06021268  ','0001',' ',38762.5, 'FREUDENBERG POLITEX S.A.', @OrderID OUTPUT
EXEC dbo.AddOrder '06021270  ','0001',' ',38767.5, 'NORD REDUCTEURS', @OrderID OUTPUT
EXEC dbo.AddOrder '06021273  ','0001',' ',38766.5, 'NESTLE WATERS SUPPLY EST', @OrderID OUTPUT
EXEC dbo.AddOrder '06021284  ','0001',' ',38770.5, 'PEUGEOT CITROEN AUTOMOBI', @OrderID OUTPUT
EXEC dbo.AddOrder '06021285  ','0001',' ',38763.5, 'CUISINES SCHMIDT SALM SA', @OrderID OUTPUT
EXEC dbo.AddOrder '06021289  ','0001',' ',38782.5, 'P&G INTERNATIONAL OPERAT', @OrderID OUTPUT
EXEC dbo.AddOrder '06021291  ','0001',' ',38768.5, 'P&G INTERNATIONAL OPERAT', @OrderID OUTPUT
EXEC dbo.AddOrder '06021295  ','0001',' ',38768.5, 'P&G INTERNATIONAL OPERAT', @OrderID OUTPUT
EXEC dbo.AddOrder '06021297  ','0001',' ',38770.5, 'P&G INTERNATIONAL OPERAT', @OrderID OUTPUT
EXEC dbo.AddOrder '06021299  ','0001',' ',38763.5, 'P&G INTERNATIONAL OPERAT', @OrderID OUTPUT
EXEC dbo.AddOrder '06021301  ','0001',' ',38762.5, 'P&G INTERNATIONAL OPERAT', @OrderID OUTPUT
EXEC dbo.AddOrder '06021303  ','0001',' ',38762.5, 'P&G INTERNATIONAL OPERAT', @OrderID OUTPUT
EXEC dbo.AddOrder '06021305  ','0001',' ',38763.5, 'P&G INTERNATIONAL OPERAT', @OrderID OUTPUT
EXEC dbo.AddOrder '06021307  ','0001',' ',38767.5, 'P&G INTERNATIONAL OPERAT', @OrderID OUTPUT
EXEC dbo.AddOrder '06021309  ','0001',' ',38767.5, 'P&G INTERNATIONAL OPERAT', @OrderID OUTPUT
EXEC dbo.AddOrder '06021311  ','0001',' ',38759.5, 'CART.EMBAL. RHONE ALPES', @OrderID OUTPUT
EXEC dbo.AddOrder '06021311  ','0001','a',38760.5, 'CART.EMBAL. RHONE ALPES', @OrderID OUTPUT
EXEC dbo.AddOrder '06021313  ','0001',' ',38763.5, 'P&G INTERNATIONAL OPERAT', @OrderID OUTPUT
EXEC dbo.AddOrder '06021315  ','0001',' ',38769.5, 'B.V.ALVERIMPORT', @OrderID OUTPUT
EXEC dbo.AddOrder '06021318  ','0001',' ',38770.5, 'P&G INTERNATIONAL OPERAT', @OrderID OUTPUT
EXEC dbo.AddOrder '06021318  ','0001','a',38770.5, 'P&G INTERNATIONAL OPERAT', @OrderID OUTPUT
EXEC dbo.AddOrder '06021320  ','0001',' ',38761.5, 'P&G INTERNATIONAL OPERAT', @OrderID OUTPUT
EXEC dbo.AddOrder '06021322  ','0001',' ',38773.5, 'P&G INTERNATIONAL OPERAT', @OrderID OUTPUT
EXEC dbo.AddOrder '06021326  ','0001',' ',38760.5, 'DS SMITH KAYPAC', @OrderID OUTPUT
EXEC dbo.AddOrder '06021326  ','0001','a',38760.5, 'DS SMITH KAYPAC', @OrderID OUTPUT
EXEC dbo.AddOrder '06021326  ','0001','b',38762.5, 'DS SMITH KAYPAC', @OrderID OUTPUT
EXEC dbo.AddOrder '06021327  ','0001',' ',38760.5, 'DS SMITH KAYPAC', @OrderID OUTPUT
EXEC dbo.AddOrder '06021328  ','0001',' ',38759.5, 'DS SMITH KAYPAC', @OrderID OUTPUT
EXEC dbo.AddOrder '06021331  ','0001',' ',38759.5, 'DS SMITH KAYPAC', @OrderID OUTPUT
EXEC dbo.AddOrder '06021332  ','0001',' ',38760.5, 'DS SMITH KAYPAC', @OrderID OUTPUT
EXEC dbo.AddOrder '06021334  ','0001',' ',38770.5, 'ROLF SCHWIERING GMBH', @OrderID OUTPUT
EXEC dbo.AddOrder '06021335  ','0001',' ',38770.5, 'ROLF SCHWIERING GMBH', @OrderID OUTPUT
EXEC dbo.AddOrder '06021337  ','0001',' ',38769.5, 'P&G INTERNATIONAL OPERAT', @OrderID OUTPUT
EXEC dbo.AddOrder '06021339  ','0001',' ',38761.5, 'ED.FRIEDRICH & CO GMBH', @OrderID OUTPUT
EXEC dbo.AddOrder '06021340  ','0001',' ',38766.5, 'DS SMITH KAYSERSBERG', @OrderID OUTPUT
EXEC dbo.AddOrder '06021342  ','0001',' ',38759.5, 'DS SMITH KAYPAC', @OrderID OUTPUT
EXEC dbo.AddOrder '06021347  ','0001',' ',38761.5, 'CART.EMBAL. RHONE ALPES', @OrderID OUTPUT
EXEC dbo.AddOrder '06021349  ','0001',' ',38766.5, 'WELL-PACK AG', @OrderID OUTPUT
EXEC dbo.AddOrder '06021350  ','0001',' ',38780.5, 'RICOH INDUSTRIE FRANCE', @OrderID OUTPUT
EXEC dbo.AddOrder '06021351  ','0001',' ',38777.5, 'RICOH INDUSTRIE FRANCE', @OrderID OUTPUT
EXEC dbo.AddOrder '06021352  ','0001',' ',38782.5, 'RICOH INDUSTRIE FRANCE', @OrderID OUTPUT
EXEC dbo.AddOrder '06021353  ','0001',' ',38782.5, 'RICOH INDUSTRIE FRANCE', @OrderID OUTPUT
EXEC dbo.AddOrder '06021354  ','0001',' ',38777.5, 'RICOH INDUSTRIE FRANCE', @OrderID OUTPUT
EXEC dbo.AddOrder '06021355  ','0001',' ',38777.5, 'RICOH INDUSTRIE FRANCE', @OrderID OUTPUT
EXEC dbo.AddOrder '06021356  ','0001',' ',38780.5, 'RICOH INDUSTRIE FRANCE', @OrderID OUTPUT
EXEC dbo.AddOrder '06021358  ','0001',' ',38774.5, 'HUSSON INTERNATIONAL', @OrderID OUTPUT
EXEC dbo.AddOrder '06021361  ','0001',' ',38774.5, 'REGENT BELEUCHTUNGSKOERP', @OrderID OUTPUT
EXEC dbo.AddOrder '06021363  ','0001',' ',38766.5, 'FORESCO PACKAGING N.V.', @OrderID OUTPUT
EXEC dbo.AddOrder '06021364  ','0001',' ',38766.5, 'FORESCO PACKAGING N.V.', @OrderID OUTPUT
EXEC dbo.AddOrder '06021365  ','0001',' ',38769.5, 'FORESCO PACKAGING N.V.', @OrderID OUTPUT
EXEC dbo.AddOrder '06021366  ','0001',' ',38761.5, 'CART.EMBAL. RHONE ALPES', @OrderID OUTPUT
EXEC dbo.AddOrder '06021369  ','0001',' ',38774.5, 'JÜRGEN BECKER RATIOFORM', @OrderID OUTPUT
EXEC dbo.AddOrder '06021371  ','0001',' ',38768.5, 'DS SMITH KAYPAC', @OrderID OUTPUT
EXEC dbo.AddOrder '06021373  ','0001',' ',38769.5, 'DS SMITH KAYPAC', @OrderID OUTPUT
EXEC dbo.AddOrder '06021375  ','0001',' ',38768.5, 'CART.EMBAL. RHONE ALPES', @OrderID OUTPUT
EXEC dbo.AddOrder '06021376  ','0001',' ',38770.5, 'P&G INTERNATIONAL OPERAT', @OrderID OUTPUT
EXEC dbo.AddOrder '06021383  ','0001',' ',38760.5, 'CART.EMBAL. RHONE ALPES', @OrderID OUTPUT
EXEC dbo.AddOrder '06021383  ','0002',' ',38760.5, 'CART.EMBAL. RHONE ALPES', @OrderID OUTPUT
EXEC dbo.AddOrder '06021385  ','0001',' ',38789.5, 'JOHNSONDIVERSEY SWITZERL', @OrderID OUTPUT
EXEC dbo.AddOrder '06021387  ','0001',' ',38760.5, 'CART.EMBAL. RHONE ALPES', @OrderID OUTPUT
EXEC dbo.AddOrder '06021389  ','0001',' ',38760.5, 'CART.EMBAL. RHONE ALPES', @OrderID OUTPUT
EXEC dbo.AddOrder '06021391  ','0001',' ',38782.5, 'ALCOOL PETROLE CHIMIE', @OrderID OUTPUT
EXEC dbo.AddOrder '06021393  ','0001',' ',38780.5, 'ALCOOL PETROLE CHIMIE', @OrderID OUTPUT
EXEC dbo.AddOrder '06021395  ','0001',' ',38791.5, 'ALCOOL PETROLE CHIMIE', @OrderID OUTPUT
EXEC dbo.AddOrder '06021396  ','0001',' ',38774.5, 'CARTONNAGES BERTRAND - N', @OrderID OUTPUT
EXEC dbo.AddOrder '06021397  ','0001',' ',38774.5, 'CARTONNAGES BERTRAND - N', @OrderID OUTPUT
EXEC dbo.AddOrder '06021399  ','0001',' ',38762.5, 'CART.EMBAL. RHONE ALPES', @OrderID OUTPUT
EXEC dbo.AddOrder '06021400  ','0001',' ',38768.5, 'DIEFENBACH EMBALLAGE', @OrderID OUTPUT
EXEC dbo.AddOrder '06021402  ','0001',' ',38763.5, 'SNF SAS', @OrderID OUTPUT
EXEC dbo.AddOrder '06021406  ','0001',' ',38797.5, 'LABORATOIRES GALDERMA', @OrderID OUTPUT
EXEC dbo.AddOrder '06021406  ','0001','a',38797.5, 'LABORATOIRES GALDERMA', @OrderID OUTPUT
EXEC dbo.AddOrder '06021408  ','0001',' ',38774.5, 'ATELIERS BUSCH & CIE', @OrderID OUTPUT
EXEC dbo.AddOrder '06021408  ','0001','a',38775.5, 'ATELIERS BUSCH & CIE', @OrderID OUTPUT
EXEC dbo.AddOrder '06021408  ','0001','b',38774.5, 'ATELIERS BUSCH & CIE', @OrderID OUTPUT
EXEC dbo.AddOrder '06021408  ','0001','c',38774.5, 'ATELIERS BUSCH & CIE', @OrderID OUTPUT
EXEC dbo.AddOrder '06021409  ','0001',' ',38788.5, 'ATELIERS BUSCH & CIE', @OrderID OUTPUT
EXEC dbo.AddOrder '06021410  ','0001',' ',38756.5, 'NOVARTIS CONSUMER HEALTH', @OrderID OUTPUT
EXEC dbo.AddOrder '06021411  ','0001',' ',38761.5, 'NOVARTIS CONSUMER HEALTH', @OrderID OUTPUT
EXEC dbo.AddOrder '06021412  ','0001',' ',38761.5, 'NOVARTIS CONSUMER HEALTH', @OrderID OUTPUT
EXEC dbo.AddOrder '06021417  ','0001',' ',38761.5, 'NOVARTIS CONSUMER HEALTH', @OrderID OUTPUT
EXEC dbo.AddOrder '06021418  ','0001',' ',38774.5, 'NOVARTIS CONSUMER HEALTH', @OrderID OUTPUT
EXEC dbo.AddOrder '06021419  ','0001',' ',38768.5, 'NOVARTIS CONSUMER HEALTH', @OrderID OUTPUT
EXEC dbo.AddOrder '06021420  ','0001',' ',38768.5, 'NOVARTIS CONSUMER HEALTH', @OrderID OUTPUT
EXEC dbo.AddOrder '06021421  ','0001',' ',38769.5, 'NOVARTIS CONSUMER HEALTH', @OrderID OUTPUT
EXEC dbo.AddOrder '06021422  ','0001',' ',38770.5, 'NOVARTIS CONSUMER HEALTH', @OrderID OUTPUT
EXEC dbo.AddOrder '06021423  ','0001',' ',38770.5, 'NOVARTIS CONSUMER HEALTH', @OrderID OUTPUT
EXEC dbo.AddOrder '06021424  ','0001',' ',38770.5, 'NOVARTIS CONSUMER HEALTH', @OrderID OUTPUT
EXEC dbo.AddOrder '06021425  ','0001',' ',38770.5, 'NOVARTIS CONSUMER HEALTH', @OrderID OUTPUT
EXEC dbo.AddOrder '06021426  ','0001',' ',38770.5, 'NOVARTIS CONSUMER HEALTH', @OrderID OUTPUT
EXEC dbo.AddOrder '06021427  ','0001',' ',38770.5, 'NOVARTIS CONSUMER HEALTH', @OrderID OUTPUT
EXEC dbo.AddOrder '06021427  ','0001','a',38770.5, 'NOVARTIS CONSUMER HEALTH', @OrderID OUTPUT
EXEC dbo.AddOrder '06021430  ','0001',' ',38791.5, 'STE ALSA-CORK', @OrderID OUTPUT
EXEC dbo.AddOrder '06021432  ','0001',' ',38761.5, 'NESTLE WATERS SUPPLY EST', @OrderID OUTPUT
EXEC dbo.AddOrder '06021434  ','0001',' ',38768.5, 'NESTLE WATERS SUPPLY EST', @OrderID OUTPUT
EXEC dbo.AddOrder '06021437  ','0001',' ',38763.5, 'STE ALSA-CORK', @OrderID OUTPUT
EXEC dbo.AddOrder '06021438  ','0001',' ',38766.5, 'NESTLE WATERS SUPPLY EST', @OrderID OUTPUT
EXEC dbo.AddOrder '06021442  ','0001',' ',38768.5, 'NESTLE WATERS SUPPLY EST', @OrderID OUTPUT
EXEC dbo.AddOrder '06021444  ','0001',' ',38768.5, 'NESTLE WATERS SUPPLY EST', @OrderID OUTPUT
EXEC dbo.AddOrder '06021446  ','0001',' ',38760.5, 'NESTLE WATERS SUPPLY EST', @OrderID OUTPUT
EXEC dbo.AddOrder '06021447  ','0001',' ',38763.5, 'OTTO RAUHUT GMBH & CO', @OrderID OUTPUT
EXEC dbo.AddOrder '06021449  ','0001',' ',38762.5, 'GIKO KARTONAGEN GMBH', @OrderID OUTPUT
EXEC dbo.AddOrder '06021455  ','0001',' ',38766.5, 'GEORGIA-PACIFIC FRANCE', @OrderID OUTPUT
EXEC dbo.AddOrder '06021456  ','0001',' ',38787.5, 'MÄRKISCHE KARTONAGENFABR', @OrderID OUTPUT
EXEC dbo.AddOrder '06021458  ','0001',' ',38769.5, 'SAE SERGE CHEVEAU', @OrderID OUTPUT
EXEC dbo.AddOrder '06021462  ','0001',' ',38768.5, 'WIRTH VERPACKUNGEN GMBH', @OrderID OUTPUT
EXEC dbo.AddOrder '06021463  ','0001',' ',38759.5, 'NESTLE WATERS SUPPLY EST', @OrderID OUTPUT
EXEC dbo.AddOrder '06021465  ','0001',' ',38768.5, 'WIRTH VERPACKUNGEN GMBH', @OrderID OUTPUT
EXEC dbo.AddOrder '06021467  ','0001',' ',38761.5, 'SOMFY', @OrderID OUTPUT
EXEC dbo.AddOrder '06021473  ','0001',' ',38809.5, 'CRISTALLERIES DE BACCARA', @OrderID OUTPUT
EXEC dbo.AddOrder '06021474  ','0001',' ',38823.5, 'CRISTALLERIES DE BACCARA', @OrderID OUTPUT
EXEC dbo.AddOrder '06021476  ','0001',' ',38768.5, 'DU PONT DE NEMOURS S.A.', @OrderID OUTPUT
EXEC dbo.AddOrder '06021478  ','0001',' ',38777.5, 'NOVES S.R.O.', @OrderID OUTPUT
EXEC dbo.AddOrder '06021480  ','0001',' ',38769.5, 'ZF GETRIEBE GMBH', @OrderID OUTPUT
EXEC dbo.AddOrder '06021481  ','0001',' ',38761.5, 'FISCHER SERVICES', @OrderID OUTPUT
EXEC dbo.AddOrder '06021483  ','0001',' ',38767.5, 'DIEFENBACH EMBALLAGE', @OrderID OUTPUT
EXEC dbo.AddOrder '06021485  ','0001',' ',38770.5, 'DS SMITH KAYPAC', @OrderID OUTPUT
EXEC dbo.AddOrder '06021487  ','0001',' ',38763.5, 'GABRIEL GMBH', @OrderID OUTPUT
EXEC dbo.AddOrder '06021488  ','0001',' ',38777.5, 'PEUGEOT CITROEN AUTOMOBI', @OrderID OUTPUT
EXEC dbo.AddOrder '06021491  ','0001',' ',38780.5, 'ED.FRIEDRICH & CO GMBH', @OrderID OUTPUT
EXEC dbo.AddOrder '06021492  ','0001',' ',38767.5, 'HEIDE WERKSTAETTEN E.V.', @OrderID OUTPUT
EXEC dbo.AddOrder '06021494  ','0001',' ',38763.5, 'S.M.A.E. ZI METZ BORNY (', @OrderID OUTPUT
EXEC dbo.AddOrder '06021496  ','0001',' ',38763.5, 'S.M.A.E. ZI METZ BORNY (', @OrderID OUTPUT
EXEC dbo.AddOrder '06021499  ','0001',' ',38763.5, 'S.M.A.E. ZI METZ BORNY (', @OrderID OUTPUT
EXEC dbo.AddOrder '06021500  ','0001',' ',38763.5, 'S.M.A.E. ZI METZ BORNY (', @OrderID OUTPUT
EXEC dbo.AddOrder '06021501  ','0001',' ',38763.5, 'S.M.A.E. ZI METZ BORNY (', @OrderID OUTPUT
EXEC dbo.AddOrder '06021502  ','0001',' ',38763.5, 'S.M.A.E. ZI METZ BORNY (', @OrderID OUTPUT
EXEC dbo.AddOrder '06021503  ','0001',' ',38763.5, 'S.M.A.E. ZI METZ BORNY (', @OrderID OUTPUT
EXEC dbo.AddOrder '06021505  ','0001',' ',38767.5, 'S.M.A.E. ZI METZ BORNY (', @OrderID OUTPUT
EXEC dbo.AddOrder '06021506  ','0001',' ',38767.5, 'S.M.A.E. ZI METZ BORNY (', @OrderID OUTPUT
EXEC dbo.AddOrder '06021507  ','0001',' ',38767.5, 'S.M.A.E. ZI METZ BORNY (', @OrderID OUTPUT
EXEC dbo.AddOrder '06021508  ','0001',' ',38767.5, 'S.M.A.E. ZI METZ BORNY (', @OrderID OUTPUT
EXEC dbo.AddOrder '06021509  ','0001',' ',38767.5, 'S.M.A.E. ZI METZ BORNY (', @OrderID OUTPUT
EXEC dbo.AddOrder '06021511  ','0001',' ',38767.5, 'S.M.A.E. ZI METZ BORNY (', @OrderID OUTPUT
EXEC dbo.AddOrder '06021512  ','0001',' ',38767.5, 'S.M.A.E. ZI METZ BORNY (', @OrderID OUTPUT
EXEC dbo.AddOrder '06021513  ','0001',' ',38767.5, 'S.M.A.E. ZI METZ BORNY (', @OrderID OUTPUT
EXEC dbo.AddOrder '06021514  ','0001',' ',38784.5, 'MAISON SPARR', @OrderID OUTPUT
EXEC dbo.AddOrder '06021515  ','0001',' ',38784.5, 'MAISON SPARR', @OrderID OUTPUT
EXEC dbo.AddOrder '06021518  ','0001',' ',38760.5, 'DS SMITH KAYSERSBERG', @OrderID OUTPUT
EXEC dbo.AddOrder '06021519  ','0001',' ',38762.5, 'GEORGIA-PACIFIC FRANCE', @OrderID OUTPUT
EXEC dbo.AddOrder '06021521  ','0001',' ',38774.5, 'GEORGIA-PACIFIC FRANCE', @OrderID OUTPUT
EXEC dbo.AddOrder '06021523  ','0001',' ',38774.5, 'GEORGIA-PACIFIC FRANCE', @OrderID OUTPUT
EXEC dbo.AddOrder '06021524  ','0001',' ',38777.5, 'LONZA', @OrderID OUTPUT
EXEC dbo.AddOrder '06021529  ','0001',' ',38763.5, 'INTERGESTION', @OrderID OUTPUT
EXEC dbo.AddOrder '06021529  ','0002',' ',38763.5, 'INTERGESTION', @OrderID OUTPUT
EXEC dbo.AddOrder '06021530  ','0001',' ',38777.5, 'LONZA', @OrderID OUTPUT
EXEC dbo.AddOrder '06021533  ','0001',' ',38784.5, 'JTEKT AUTOMOBILE LYON', @OrderID OUTPUT
EXEC dbo.AddOrder '06021536  ','0001',' ',38769.5, 'SOFLOG-SOFEMBAL', @OrderID OUTPUT
EXEC dbo.AddOrder '06021537  ','0001',' ',38760.5, 'MEPHISTO', @OrderID OUTPUT
EXEC dbo.AddOrder '06021539  ','0001',' ',38777.5, 'STE SYRAL', @OrderID OUTPUT
EXEC dbo.AddOrder '06021541  ','0001',' ',38776.5, 'LONZA', @OrderID OUTPUT
EXEC dbo.AddOrder '06021542  ','0001',' ',38846.5, 'LONZA', @OrderID OUTPUT
EXEC dbo.AddOrder '06021543  ','0001',' ',38769.5, 'TECUMSEH EUROPE S.A.', @OrderID OUTPUT
EXEC dbo.AddOrder '06021544  ','0001',' ',38769.5, 'TECUMSEH EUROPE S.A.', @OrderID OUTPUT
EXEC dbo.AddOrder '06021545  ','0001',' ',38791.5, 'STE ALSA-CORK', @OrderID OUTPUT
EXEC dbo.AddOrder '06021548  ','0001',' ',38762.5, 'LONZA', @OrderID OUTPUT
EXEC dbo.AddOrder '06021549  ','0001',' ',38762.5, 'LONZA', @OrderID OUTPUT
EXEC dbo.AddOrder '06021550  ','0001',' ',38767.5, 'DS SMITH KAYSERSBERG', @OrderID OUTPUT
EXEC dbo.AddOrder '06021553  ','0001',' ',38763.5, 'LINDAL-FRANCE', @OrderID OUTPUT
EXEC dbo.AddOrder '06021558  ','0001',' ',38766.5, 'RICOLA EUROPE SA', @OrderID OUTPUT
EXEC dbo.AddOrder '06021559  ','0001',' ',38763.5, 'CART.EMBAL. RHONE ALPES', @OrderID OUTPUT
EXEC dbo.AddOrder '06021560  ','0001',' ',38763.5, 'CART.EMBAL. RHONE ALPES', @OrderID OUTPUT
EXEC dbo.AddOrder '06021562  ','0001',' ',38780.5, 'TECUMSEH EUROPE S.A.', @OrderID OUTPUT
EXEC dbo.AddOrder '06021563  ','0001',' ',38763.5, 'CART.EMBAL. RHONE ALPES', @OrderID OUTPUT
EXEC dbo.AddOrder '06021565  ','0001',' ',38762.5, 'WIRTH VERPACKUNGEN GMBH', @OrderID OUTPUT
EXEC dbo.AddOrder '06021566  ','0001',' ',38762.5, 'WIRTH VERPACKUNGEN GMBH', @OrderID OUTPUT
EXEC dbo.AddOrder '06021567  ','0001',' ',38769.5, 'TRISS SPOL.S.R.O.', @OrderID OUTPUT
EXEC dbo.AddOrder '06021570  ','0001',' ',38773.5, 'JDW HOLDING GMBH', @OrderID OUTPUT
EXEC dbo.AddOrder '06021571  ','0001',' ',38773.5, 'JDW HOLDING GMBH', @OrderID OUTPUT
EXEC dbo.AddOrder '06021571  ','0001','a',38773.5, 'JDW HOLDING GMBH', @OrderID OUTPUT
EXEC dbo.AddOrder '06021572  ','0001',' ',38773.5, 'JDW HOLDING GMBH', @OrderID OUTPUT
EXEC dbo.AddOrder '06021573  ','0001',' ',38763.5, 'JDW HOLDING GMBH', @OrderID OUTPUT
EXEC dbo.AddOrder '06021573  ','0001','a',38763.5, 'JDW HOLDING GMBH', @OrderID OUTPUT
EXEC dbo.AddOrder '06021576  ','0001',' ',38781.5, 'DU PONT DE NEMOURS (FRAN', @OrderID OUTPUT
EXEC dbo.AddOrder '06021578  ','0001',' ',38781.5, 'TRISS SPOL.S.R.O.', @OrderID OUTPUT
EXEC dbo.AddOrder '06021579  ','0001',' ',38782.5, 'TRISS SPOL.S.R.O.', @OrderID OUTPUT
EXEC dbo.AddOrder '06021580  ','0001',' ',38777.5, 'TRISS SPOL.S.R.O.', @OrderID OUTPUT
EXEC dbo.AddOrder '06021581  ','0001',' ',38777.5, 'TRISS SPOL.S.R.O.', @OrderID OUTPUT
EXEC dbo.AddOrder '06021583  ','0001',' ',38789.5, 'TRISS SPOL.S.R.O.', @OrderID OUTPUT
EXEC dbo.AddOrder '06021584  ','0001',' ',38790.5, 'TRISS SPOL.S.R.O.', @OrderID OUTPUT
EXEC dbo.AddOrder '06021585  ','0001',' ',38776.5, 'TRISS SPOL.S.R.O.', @OrderID OUTPUT
EXEC dbo.AddOrder '06021586  ','0001',' ',38776.5, 'TRISS SPOL.S.R.O.', @OrderID OUTPUT
EXEC dbo.AddOrder '06021587  ','0001',' ',38776.5, 'TRISS SPOL.S.R.O.', @OrderID OUTPUT
EXEC dbo.AddOrder '06021588  ','0001',' ',38780.5, 'DU PONT DE NEMOURS (FRAN', @OrderID OUTPUT
EXEC dbo.AddOrder '06021590  ','0001',' ',38763.5, 'CART.EMBAL. RHONE ALPES', @OrderID OUTPUT
EXEC dbo.AddOrder '06021591  ','0001',' ',38777.5, 'DU PONT DE NEMOURS (FRAN', @OrderID OUTPUT
EXEC dbo.AddOrder '06021592  ','0001',' ',38764.5, 'TIMKEN EUROPE', @OrderID OUTPUT
EXEC dbo.AddOrder '06021593  ','0001',' ',38769.5, 'MAAG  TECHNIC AG', @OrderID OUTPUT
EXEC dbo.AddOrder '06021595  ','0001',' ',38768.5, 'OTTO RAUHUT GMBH & CO', @OrderID OUTPUT
EXEC dbo.AddOrder '06021597  ','0001',' ',38769.5, 'GEPAK W.GERNER GMBH', @OrderID OUTPUT
EXEC dbo.AddOrder '06021598  ','0001',' ',38769.5, 'GEPAK W.GERNER GMBH', @OrderID OUTPUT
EXEC dbo.AddOrder '06021599  ','0001',' ',38769.5, 'GEPAK W.GERNER GMBH', @OrderID OUTPUT
EXEC dbo.AddOrder '06021601  ','0001',' ',38767.5, 'RS COMPONENTS GMBH', @OrderID OUTPUT
EXEC dbo.AddOrder '06021602  ','0001',' ',38774.5, 'RS COMPONENTS GMBH', @OrderID OUTPUT
EXEC dbo.AddOrder '06021603  ','0001',' ',38770.5, 'RS COMPONENTS GMBH', @OrderID OUTPUT
EXEC dbo.AddOrder '06021605  ','0001',' ',38780.5, 'CUISINES SCHMIDT SALM SA', @OrderID OUTPUT
EXEC dbo.AddOrder '06021606  ','0001',' ',38780.5, 'CUISINES SCHMIDT SALM SA', @OrderID OUTPUT
EXEC dbo.AddOrder '06021607  ','0001',' ',38760.5, 'MEPHISTO', @OrderID OUTPUT
EXEC dbo.AddOrder '06021609  ','0001',' ',38768.5, 'MC PACK GMBH', @OrderID OUTPUT
EXEC dbo.AddOrder '06021612  ','0001',' ',38767.5, 'BRENNER VERPACKUNG GMBH', @OrderID OUTPUT
EXEC dbo.AddOrder '06021612  ','0001','a',38774.5, 'BRENNER VERPACKUNG GMBH', @OrderID OUTPUT
EXEC dbo.AddOrder '06021613  ','0001',' ',38770.5, 'DS SMITH KAYSERSBERG', @OrderID OUTPUT
EXEC dbo.AddOrder '06021614  ','0001',' ',38755.5, 'JTEKT AUTOMOBILE', @OrderID OUTPUT
EXEC dbo.AddOrder '06021616  ','0001',' ',38755.5, 'JTEKT AUTOMOBILE', @OrderID OUTPUT
EXEC dbo.AddOrder '06021617  ','0001',' ',38763.5, 'DS SMITH KAYSERSBERG', @OrderID OUTPUT
EXEC dbo.AddOrder '06021620  ','0001',' ',38769.5, 'GEFCO SA POUR PMTC', @OrderID OUTPUT
EXEC dbo.AddOrder '06021621  ','0001',' ',38770.5, 'DS SMITH KAYPAC', @OrderID OUTPUT
EXEC dbo.AddOrder '06021622  ','0001',' ',38767.5, 'W. WIRTH GMBH', @OrderID OUTPUT
EXEC dbo.AddOrder '06021623  ','0001',' ',38759.5, 'SEP KUNHEIM', @OrderID OUTPUT
EXEC dbo.AddOrder '06021624  ','0001',' ',38762.5, 'W. WIRTH GMBH', @OrderID OUTPUT
EXEC dbo.AddOrder '06021626  ','0001',' ',38776.5, 'TRISS SPOL.S.R.O.', @OrderID OUTPUT
EXEC dbo.AddOrder '06021627  ','0001',' ',38776.5, 'TRISS SPOL.S.R.O.', @OrderID OUTPUT
EXEC dbo.AddOrder '06021628  ','0001',' ',38763.5, 'W. WIRTH GMBH', @OrderID OUTPUT
EXEC dbo.AddOrder '06021629  ','0001',' ',38776.5, 'PEUGEOT CITROEN AUTOMOBI', @OrderID OUTPUT
EXEC dbo.AddOrder '06021631  ','0001',' ',38767.5, 'R. SCHWINDT VERPACKUNGEN', @OrderID OUTPUT
EXEC dbo.AddOrder '06021634  ','0001',' ',38768.5, 'NESTLE WATERS SUPPLY EST', @OrderID OUTPUT
EXEC dbo.AddOrder '06021637  ','0001',' ',38775.5, 'WALZ VERPACKUNGEN E.K.', @OrderID OUTPUT
EXEC dbo.AddOrder '06021639  ','0001',' ',38760.5, 'CAP LOGISTIC', @OrderID OUTPUT
EXEC dbo.AddOrder '06021641  ','0001',' ',38769.5, 'NESTLE WATERS SUPPLY EST', @OrderID OUTPUT
EXEC dbo.AddOrder '06021643  ','0001',' ',38770.5, 'NESTLE WATERS SUPPLY EST', @OrderID OUTPUT
EXEC dbo.AddOrder '06021645  ','0001',' ',38773.5, 'NESTLE WATERS SUPPLY EST', @OrderID OUTPUT
EXEC dbo.AddOrder '06021647  ','0001',' ',38761.5, 'VISTEON SYSTEMES INTERIE', @OrderID OUTPUT
EXEC dbo.AddOrder '06021648  ','0001',' ',38766.5, 'CELLIER DES DAUPHINS', @OrderID OUTPUT
EXEC dbo.AddOrder '06021648  ','0001','b',38766.5, 'CELLIER DES DAUPHINS', @OrderID OUTPUT
EXEC dbo.AddOrder '06021649  ','0001',' ',38763.5, 'CELLIER DES DAUPHINS', @OrderID OUTPUT
EXEC dbo.AddOrder '06021650  ','0001',' ',38766.5, 'CELLIER DES DAUPHINS', @OrderID OUTPUT
EXEC dbo.AddOrder '06021652  ','0001',' ',38760.5, 'NESTLE WATERS SUPPLY EST', @OrderID OUTPUT
EXEC dbo.AddOrder '06021655  ','0001',' ',38773.5, 'PEUGEOT CITROEN AUTOMOBI', @OrderID OUTPUT
EXEC dbo.AddOrder '06021656  ','0001',' ',38773.5, 'TIMKEN EUROPE', @OrderID OUTPUT
EXEC dbo.AddOrder '06021658  ','0001',' ',38767.5, 'S.M.A.E. ZI METZ BORNY (', @OrderID OUTPUT
EXEC dbo.AddOrder '06021659  ','0001',' ',38767.5, 'S.M.A.E. ZI METZ BORNY (', @OrderID OUTPUT
EXEC dbo.AddOrder '06021660  ','0001',' ',38767.5, 'S.M.A.E. ZI METZ BORNY (', @OrderID OUTPUT
EXEC dbo.AddOrder '06021661  ','0001',' ',38767.5, 'S.M.A.E. ZI METZ BORNY (', @OrderID OUTPUT
EXEC dbo.AddOrder '06021662  ','0001',' ',38767.5, 'S.M.A.E. ZI METZ BORNY (', @OrderID OUTPUT
EXEC dbo.AddOrder '06021664  ','0001',' ',38767.5, 'S.M.A.E. ZI METZ BORNY (', @OrderID OUTPUT
EXEC dbo.AddOrder '06021665  ','0001',' ',38767.5, 'S.M.A.E. ZI METZ BORNY (', @OrderID OUTPUT
EXEC dbo.AddOrder '06021666  ','0001',' ',38767.5, 'S.M.A.E. ZI METZ BORNY (', @OrderID OUTPUT
EXEC dbo.AddOrder '06021670  ','0001',' ',38761.5, 'COGESAL MIKO-FSEUR 58488', @OrderID OUTPUT
EXEC dbo.AddOrder '06021671  ','0001',' ',38762.5, 'NORD REDUCTEURS', @OrderID OUTPUT
EXEC dbo.AddOrder '06021674  ','0001',' ',38769.5, 'DUPONT POWDER COATINGS F', @OrderID OUTPUT
EXEC dbo.AddOrder '06021676  ','0001',' ',38774.5, 'HOCHDORF NUTRITEC AG', @OrderID OUTPUT
EXEC dbo.AddOrder '06021677  ','0001',' ',38777.5, 'GEORGIA-PACIFIC FRANCE', @OrderID OUTPUT
EXEC dbo.AddOrder '06021679  ','0001',' ',38768.5, 'S.A. PEUGEOT MOTOCYCLES', @OrderID OUTPUT
EXEC dbo.AddOrder '06021683  ','0001',' ',38777.5, 'LABORATOIRE WELEDA', @OrderID OUTPUT
EXEC dbo.AddOrder '06021684  ','0001',' ',38782.5, 'WIRTH VERPACKUNGEN GMBH', @OrderID OUTPUT
EXEC dbo.AddOrder '06021685  ','0001',' ',38782.5, 'DS SMITH KAYPAC', @OrderID OUTPUT
EXEC dbo.AddOrder '06021687  ','0001',' ',38767.5, 'DS SMITH KAYPAC', @OrderID OUTPUT
EXEC dbo.AddOrder '06021689  ','0001',' ',38763.5, 'DS SMITH KAYPAC', @OrderID OUTPUT
EXEC dbo.AddOrder '06021691  ','0001',' ',38777.5, 'TRISS SPOL.S.R.O.', @OrderID OUTPUT
EXEC dbo.AddOrder '06021693  ','0001',' ',38789.5, 'TRISS SPOL.S.R.O.', @OrderID OUTPUT
EXEC dbo.AddOrder '06021696  ','0001',' ',38780.5, 'TRISS SPOL.S.R.O.', @OrderID OUTPUT
EXEC dbo.AddOrder '06021697  ','0001',' ',38780.5, 'TRISS SPOL.S.R.O.', @OrderID OUTPUT
EXEC dbo.AddOrder '06021699  ','0001',' ',38780.5, 'TRISS SPOL.S.R.O.', @OrderID OUTPUT
EXEC dbo.AddOrder '06021700  ','0001',' ',38769.5, 'SAE SERGE CHEVEAU', @OrderID OUTPUT
EXEC dbo.AddOrder '06021701  ','0001',' ',38780.5, 'RICOH INDUSTRIE FRANCE', @OrderID OUTPUT
EXEC dbo.AddOrder '06021702  ','0001',' ',38780.5, 'RICOH INDUSTRIE FRANCE', @OrderID OUTPUT
EXEC dbo.AddOrder '06021703  ','0001',' ',38780.5, 'RICOH INDUSTRIE FRANCE', @OrderID OUTPUT
EXEC dbo.AddOrder '06021704  ','0001',' ',38780.5, 'RICOH INDUSTRIE FRANCE', @OrderID OUTPUT
EXEC dbo.AddOrder '06021705  ','0001',' ',38780.5, 'RICOH INDUSTRIE FRANCE', @OrderID OUTPUT
EXEC dbo.AddOrder '06021706  ','0001',' ',38780.5, 'RICOH INDUSTRIE FRANCE', @OrderID OUTPUT
EXEC dbo.AddOrder '06021708  ','0001',' ',38762.5, 'CART.EMBAL. RHONE ALPES', @OrderID OUTPUT
EXEC dbo.AddOrder '06021709  ','0001',' ',38762.5, 'CART.EMBAL. RHONE ALPES', @OrderID OUTPUT
EXEC dbo.AddOrder '06021714  ','0001',' ',38762.5, 'CART.EMBAL. RHONE ALPES', @OrderID OUTPUT
EXEC dbo.AddOrder '06021715  ','0001',' ',38783.5, 'PATHEON', @OrderID OUTPUT
EXEC dbo.AddOrder '06021715  ','0001','a',38783.5, 'PATHEON', @OrderID OUTPUT
EXEC dbo.AddOrder '06021718  ','0001',' ',38763.5, 'FRITZ W.A. GEHRKE', @OrderID OUTPUT
EXEC dbo.AddOrder '06021719  ','0001',' ',38763.5, 'FRITZ W.A. GEHRKE', @OrderID OUTPUT
EXEC dbo.AddOrder '06021720  ','0001',' ',38783.5, 'CUISINES SCHMIDT SALM SA', @OrderID OUTPUT
EXEC dbo.AddOrder '06021722  ','0001',' ',38769.5, 'FORESCO PACKAGING N.V.', @OrderID OUTPUT
EXEC dbo.AddOrder '06021724  ','0001',' ',38795.5, 'THERMOBILE INDUSTRIE BV', @OrderID OUTPUT
EXEC dbo.AddOrder '06021725  ','0001',' ',38762.5, 'HUWALD LIEBSCHNER GMBH', @OrderID OUTPUT
EXEC dbo.AddOrder '06021727  ','0001',' ',38777.5, 'D S SMITH POLSKA', @OrderID OUTPUT
EXEC dbo.AddOrder '06021731  ','0001',' ',38775.5, 'PEUGEOT CITROEN AUTOMOBI', @OrderID OUTPUT
EXEC dbo.AddOrder '06021736  ','0001',' ',38787.5, 'LILLY FRANCE S.A.', @OrderID OUTPUT
EXEC dbo.AddOrder '06021737  ','0001',' ',38787.5, 'LILLY FRANCE S.A.', @OrderID OUTPUT
EXEC dbo.AddOrder '06021738  ','0001',' ',38787.5, 'LILLY FRANCE S.A.', @OrderID OUTPUT
EXEC dbo.AddOrder '06021739  ','0001',' ',38788.5, 'STE ALSA-CORK', @OrderID OUTPUT
EXEC dbo.AddOrder '06021741  ','0001',' ',38767.5, 'TILLOTTS PHARMA AG', @OrderID OUTPUT
EXEC dbo.AddOrder '06021743  ','0001',' ',38781.5, 'BRASSERIES KRONENBOURG 5', @OrderID OUTPUT
EXEC dbo.AddOrder '06021746  ','0001',' ',38783.5, 'BRASSERIES KRONENBOURG 5', @OrderID OUTPUT
EXEC dbo.AddOrder '06021748  ','0001',' ',38770.5, 'KONICA MINOLTA SUP.MANU.', @OrderID OUTPUT
EXEC dbo.AddOrder '06021749  ','0001',' ',38770.5, 'KONICA MINOLTA SUP.MANU.', @OrderID OUTPUT
EXEC dbo.AddOrder '06021750  ','0001',' ',38770.5, 'KONICA MINOLTA SUP.MANU.', @OrderID OUTPUT
EXEC dbo.AddOrder '06021751  ','0001',' ',38791.5, 'BRASSERIES KRONENBOURG 5', @OrderID OUTPUT
EXEC dbo.AddOrder '06021753  ','0001',' ',38783.5, 'BRASSERIES KRONENBOURG 5', @OrderID OUTPUT
EXEC dbo.AddOrder '06021756  ','0001',' ',38784.5, 'BRASSERIES KRONENBOURG 5', @OrderID OUTPUT
EXEC dbo.AddOrder '06021759  ','0001',' ',38760.5, 'DELIPAPIER', @OrderID OUTPUT
EXEC dbo.AddOrder '06021760  ','0001',' ',38791.5, 'BRASSERIES KRONENBOURG 5', @OrderID OUTPUT
EXEC dbo.AddOrder '06021762  ','0001',' ',38784.5, 'BRASSERIES KRONENBOURG 5', @OrderID OUTPUT
EXEC dbo.AddOrder '06021764  ','0001',' ',38791.5, 'BRASSERIES KRONENBOURG 5', @OrderID OUTPUT
EXEC dbo.AddOrder '06021767  ','0001',' ',38781.5, 'GEPAK W.GERNER GMBH', @OrderID OUTPUT
EXEC dbo.AddOrder '06021769  ','0001',' ',38770.5, 'SCHWEITZER S.A.', @OrderID OUTPUT
EXEC dbo.AddOrder '06021770  ','0001',' ',38782.5, 'SCHWEITZER S.A.', @OrderID OUTPUT
EXEC dbo.AddOrder '06021771  ','0001',' ',38782.5, 'SCHWEITZER S.A.', @OrderID OUTPUT
EXEC dbo.AddOrder '06021774  ','0001',' ',38769.5, 'DS SMITH KAYPAC', @OrderID OUTPUT
EXEC dbo.AddOrder '06021776  ','0001',' ',38774.5, 'DS SMITH KAYPAC', @OrderID OUTPUT
EXEC dbo.AddOrder '06021777  ','0001',' ',38763.5, 'MEPHISTO', @OrderID OUTPUT
EXEC dbo.AddOrder '06021780  ','0001',' ',38767.5, 'WELL-PACK AG', @OrderID OUTPUT
EXEC dbo.AddOrder '06021783  ','0001',' ',38761.5, 'SHARP MANUFACTURING FRAN', @OrderID OUTPUT
EXEC dbo.AddOrder '06021787  ','0001',' ',38774.5, 'LEGRAND', @OrderID OUTPUT
EXEC dbo.AddOrder '06021788  ','0001',' ',38775.5, 'LEGRAND', @OrderID OUTPUT
EXEC dbo.AddOrder '06021790  ','0001',' ',38766.5, 'VISTEON SYSTEMES INTERIE', @OrderID OUTPUT
EXEC dbo.AddOrder '06021791  ','0001',' ',38784.5, 'LEGRAND', @OrderID OUTPUT
EXEC dbo.AddOrder '06021793  ','0001',' ',38782.5, 'LEGRAND', @OrderID OUTPUT
EXEC dbo.AddOrder '06021794  ','0001',' ',38770.5, 'CATEM S.A', @OrderID OUTPUT
EXEC dbo.AddOrder '06021795  ','0001',' ',38824.5, 'LEGRAND', @OrderID OUTPUT
EXEC dbo.AddOrder '06021796  ','0001',' ',38774.5, 'CATEM S.A', @OrderID OUTPUT
EXEC dbo.AddOrder '06021796  ','0001','b',38774.5, 'CATEM S.A', @OrderID OUTPUT
EXEC dbo.AddOrder '06021800  ','0001',' ',38817.5, 'LEGRAND', @OrderID OUTPUT
EXEC dbo.AddOrder '06021803  ','0001',' ',38847.5, 'LEGRAND', @OrderID OUTPUT
EXEC dbo.AddOrder '06021804  ','0001',' ',38798.5, 'LEGRAND', @OrderID OUTPUT
EXEC dbo.AddOrder '06021805  ','0001',' ',38775.5, 'DU PONT DE NEMOURS (FRAN', @OrderID OUTPUT
EXEC dbo.AddOrder '06021806  ','0001',' ',38794.5, 'LEGRAND', @OrderID OUTPUT
EXEC dbo.AddOrder '06021808  ','0001',' ',38811.5, 'LEGRAND', @OrderID OUTPUT
EXEC dbo.AddOrder '06021810  ','0001',' ',38811.5, 'LEGRAND', @OrderID OUTPUT
EXEC dbo.AddOrder '06021812  ','0001',' ',38830.5, 'LEGRAND', @OrderID OUTPUT
EXEC dbo.AddOrder '06021814  ','0001',' ',38769.5, 'REHAU AG & CO', @OrderID OUTPUT
EXEC dbo.AddOrder '06021815  ','0001',' ',38795.5, 'LEGRAND', @OrderID OUTPUT
EXEC dbo.AddOrder '06021817  ','0001',' ',38769.5, 'REHAU AG & CO', @OrderID OUTPUT
EXEC dbo.AddOrder '06021818  ','0001',' ',38766.5, 'VISTEON SYSTEMES INTERIE', @OrderID OUTPUT
EXEC dbo.AddOrder '06021819  ','0001',' ',38769.5, 'REHAU AG & CO', @OrderID OUTPUT
EXEC dbo.AddOrder '06021821  ','0001',' ',38770.5, 'ANTALIS AG', @OrderID OUTPUT
EXEC dbo.AddOrder '06021822  ','0001',' ',38774.5, 'DU PONT DE NEMOURS (FRAN', @OrderID OUTPUT
EXEC dbo.AddOrder '06021823  ','0001',' ',38763.5, 'VISTEON SYSTEMES INTERIE', @OrderID OUTPUT
EXEC dbo.AddOrder '06021825  ','0001',' ',38781.5, 'DU PONT DE NEMOURS (FRAN', @OrderID OUTPUT
EXEC dbo.AddOrder '06021825  ','0001','a',38788.5, 'DU PONT DE NEMOURS (FRAN', @OrderID OUTPUT
EXEC dbo.AddOrder '06021828  ','0001',' ',38774.5, 'DU PONT DE NEMOURS (FRAN', @OrderID OUTPUT
EXEC dbo.AddOrder '06021830  ','0001',' ',38763.5, 'CART.EMBAL. RHONE ALPES', @OrderID OUTPUT
EXEC dbo.AddOrder '06021831  ','0001',' ',38776.5, 'DU PONT DE NEMOURS (FRAN', @OrderID OUTPUT
EXEC dbo.AddOrder '06021834  ','0001',' ',38762.5, 'CART.EMBAL. RHONE ALPES', @OrderID OUTPUT
EXEC dbo.AddOrder '06021837  ','0001',' ',38781.5, 'DU PONT DE NEMOURS (FRAN', @OrderID OUTPUT
EXEC dbo.AddOrder '06021839  ','0001',' ',38788.5, 'DU PONT DE NEMOURS (FRAN', @OrderID OUTPUT
EXEC dbo.AddOrder '06021845  ','0001',' ',38770.5, 'VISTEON SYSTEMES INTERIE', @OrderID OUTPUT
EXEC dbo.AddOrder '06021846  ','0001',' ',38763.5, 'CART.EMBAL. RHONE ALPES', @OrderID OUTPUT
EXEC dbo.AddOrder '06021847  ','0001',' ',38766.5, 'CART.EMBAL. RHONE ALPES', @OrderID OUTPUT
EXEC dbo.AddOrder '06021853  ','0001',' ',38777.5, 'DU PONT DE NEMOURS (FRAN', @OrderID OUTPUT
EXEC dbo.AddOrder '06021853  ','0001','a',38781.5, 'DU PONT DE NEMOURS (FRAN', @OrderID OUTPUT
EXEC dbo.AddOrder '06021855  ','0001',' ',38775.5, 'DU PONT DE NEMOURS (FRAN', @OrderID OUTPUT
EXEC dbo.AddOrder '06021857  ','0001',' ',38781.5, 'DU PONT DE NEMOURS (FRAN', @OrderID OUTPUT
EXEC dbo.AddOrder '06021860  ','0001',' ',38784.5, 'DU PONT DE NEMOURS (FRAN', @OrderID OUTPUT
EXEC dbo.AddOrder '06021862  ','0001',' ',38781.5, 'DU PONT DE NEMOURS (FRAN', @OrderID OUTPUT
EXEC dbo.AddOrder '06021864  ','0001',' ',38767.5, 'DU PONT DE NEMOURS (FRAN', @OrderID OUTPUT
EXEC dbo.AddOrder '06021866  ','0001',' ',38775.5, 'DU PONT DE NEMOURS (FRAN', @OrderID OUTPUT
EXEC dbo.AddOrder '06021871  ','0001',' ',38784.5, 'DU PONT DE NEMOURS (FRAN', @OrderID OUTPUT
EXEC dbo.AddOrder '06021873  ','0001',' ',38773.5, 'DU PONT DE NEMOURS (FRAN', @OrderID OUTPUT
EXEC dbo.AddOrder '06021875  ','0001',' ',38797.5, 'DU PONT DE NEMOURS (FRAN', @OrderID OUTPUT
EXEC dbo.AddOrder '06021879  ','0001',' ',38790.5, 'WELL-PACK AG', @OrderID OUTPUT
EXEC dbo.AddOrder '06021879  ','0001','b',38790.5, 'WELL-PACK AG', @OrderID OUTPUT
EXEC dbo.AddOrder '06021880  ','0001',' ',38776.5, 'DUPONT-MEDICAL-FROUARD', @OrderID OUTPUT
EXEC dbo.AddOrder '06021884  ','0001',' ',38776.5, 'NEUHAUSER', @OrderID OUTPUT
EXEC dbo.AddOrder '06021886  ','0001',' ',38794.5, 'NEUHAUSER', @OrderID OUTPUT
EXEC dbo.AddOrder '06021888  ','0001',' ',38790.5, 'WELL-PACK AG', @OrderID OUTPUT
EXEC dbo.AddOrder '06021889  ','0001',' ',38790.5, 'WELL-PACK AG', @OrderID OUTPUT
EXEC dbo.AddOrder '06021890  ','0001',' ',38767.5, 'INTERSTUHL BÜROMÖBEL GMB', @OrderID OUTPUT
EXEC dbo.AddOrder '06021892  ','0001',' ',38769.5, 'BRENNER VERPACKUNG GMBH', @OrderID OUTPUT
EXEC dbo.AddOrder '06021894  ','0001',' ',38770.5, 'LESER GMBH', @OrderID OUTPUT
EXEC dbo.AddOrder '06021896  ','0001',' ',38773.5, 'PRODINGER VERPACKUNG', @OrderID OUTPUT
EXEC dbo.AddOrder '06021898  ','0001',' ',38762.5, 'PRODENE KLINT ESPACE LEA', @OrderID OUTPUT
EXEC dbo.AddOrder '06021899  ','0001',' ',38762.5, 'PRODENE KLINT ESPACE LEA', @OrderID OUTPUT
EXEC dbo.AddOrder '06021902  ','0001',' ',38761.5, 'BRASSERIES KRONENBOURG 5', @OrderID OUTPUT
EXEC dbo.AddOrder '06021904  ','0001',' ',38761.5, 'BRASSERIES KRONENBOURG 5', @OrderID OUTPUT
EXEC dbo.AddOrder '06021906  ','0001',' ',38761.5, 'BRASSERIES KRONENBOURG 5', @OrderID OUTPUT
EXEC dbo.AddOrder '06021908  ','0001',' ',38763.5, 'BRASSERIES KRONENBOURG 5', @OrderID OUTPUT
EXEC dbo.AddOrder '06021911  ','0001',' ',38767.5, 'BRASSERIES KRONENBOURG 5', @OrderID OUTPUT
EXEC dbo.AddOrder '06021914  ','0001',' ',38767.5, 'BRASSERIES KRONENBOURG 5', @OrderID OUTPUT
EXEC dbo.AddOrder '06021917  ','0001',' ',38761.5, 'BRASSERIES KRONENBOURG 5', @OrderID OUTPUT
EXEC dbo.AddOrder '06021919  ','0001',' ',38763.5, 'BRASSERIES KRONENBOURG 5', @OrderID OUTPUT
EXEC dbo.AddOrder '06021923  ','0001',' ',38761.5, 'NESTLE WATERS SUPPLY EST', @OrderID OUTPUT
EXEC dbo.AddOrder '06021925  ','0001',' ',38761.5, 'NESTLE WATERS SUPPLY EST', @OrderID OUTPUT
EXEC dbo.AddOrder '06021925  ','0001','a',38761.5, 'NESTLE WATERS SUPPLY EST', @OrderID OUTPUT
EXEC dbo.AddOrder '06021928  ','0001',' ',38767.5, 'HEIDE WERKSTAETTEN E.V.', @OrderID OUTPUT
EXEC dbo.AddOrder '06021928  ','0002',' ',38767.5, 'HEIDE WERKSTAETTEN E.V.', @OrderID OUTPUT
EXEC dbo.AddOrder '06021929  ','0001',' ',38770.5, 'DICESA SA', @OrderID OUTPUT
EXEC dbo.AddOrder '06021930  ','0001',' ',38766.5, 'SHARP MANUFACTURING FRAN', @OrderID OUTPUT
EXEC dbo.AddOrder '06021934  ','0001',' ',38777.5, 'CHARTREUSE DIFFUSION', @OrderID OUTPUT
EXEC dbo.AddOrder '06021936  ','0001',' ',38775.5, 'CHARTREUSE DIFFUSION', @OrderID OUTPUT
EXEC dbo.AddOrder '06021938  ','0001',' ',38766.5, 'DS SMITH KAYPAC', @OrderID OUTPUT
EXEC dbo.AddOrder '06021940  ','0001',' ',38773.5, 'DS SMITH SPECIALITY PACK', @OrderID OUTPUT
EXEC dbo.AddOrder '06021941  ','0001',' ',38768.5, 'DS SMITH KAYSERSBERG', @OrderID OUTPUT
EXEC dbo.AddOrder '06021942  ','0001',' ',38767.5, 'DS SMITH KAYSERSBERG', @OrderID OUTPUT
EXEC dbo.AddOrder '06021943  ','0001',' ',38767.5, 'DS SMITH KAYSERSBERG', @OrderID OUTPUT
EXEC dbo.AddOrder '06021944  ','0001',' ',38762.5, 'CART.EMBAL. RHONE ALPES', @OrderID OUTPUT
EXEC dbo.AddOrder '06021946  ','0001',' ',38774.5, 'GROUPE GYMA', @OrderID OUTPUT
EXEC dbo.AddOrder '06021947  ','0001',' ',38774.5, 'GROUPE GYMA', @OrderID OUTPUT
EXEC dbo.AddOrder '06021947  ','0001','a',38780.5, 'GROUPE GYMA', @OrderID OUTPUT
EXEC dbo.AddOrder '06021949  ','0001',' ',38775.5, 'LILLY FRANCE S.A.', @OrderID OUTPUT
EXEC dbo.AddOrder '06021951  ','0001',' ',38774.5, 'LILLY FRANCE S.A.', @OrderID OUTPUT
EXEC dbo.AddOrder '06021952  ','0001',' ',38775.5, 'DS SMITH KAYSERSBERG', @OrderID OUTPUT
EXEC dbo.AddOrder '06021953  ','0001',' ',38775.5, 'DS SMITH KAYSERSBERG', @OrderID OUTPUT
EXEC dbo.AddOrder '06021954  ','0001',' ',38776.5, 'DS SMITH KAYSERSBERG', @OrderID OUTPUT
EXEC dbo.AddOrder '06021955  ','0001',' ',38784.5, 'PEUGEOT CITROEN AUTOMOBI', @OrderID OUTPUT
EXEC dbo.AddOrder '06021959  ','0001',' ',38782.5, 'WELL-PACK AG', @OrderID OUTPUT
EXEC dbo.AddOrder '06021962  ','0001',' ',38769.5, 'BRASSERIES HEINEKEN SA', @OrderID OUTPUT
EXEC dbo.AddOrder '06021964  ','0001',' ',38768.5, 'BRASSERIES HEINEKEN SA', @OrderID OUTPUT
EXEC dbo.AddOrder '06021966  ','0001',' ',38767.5, 'BRASSERIES HEINEKEN SA', @OrderID OUTPUT
EXEC dbo.AddOrder '06021969  ','0001',' ',38777.5, 'DUPONT TEIJIN FILMS', @OrderID OUTPUT
EXEC dbo.AddOrder '06021970  ','0001',' ',38777.5, 'DUPONT TEIJIN FILMS', @OrderID OUTPUT
EXEC dbo.AddOrder '06021972  ','0001',' ',38761.5, 'NESTLE WATERS SUPPLY EST', @OrderID OUTPUT
EXEC dbo.AddOrder '06021974  ','0001',' ',38767.5, 'TRISS SPOL.S.R.O.', @OrderID OUTPUT
EXEC dbo.AddOrder '06021975  ','0001',' ',38777.5, 'TECUMSEH EUROPE S.A.', @OrderID OUTPUT
EXEC dbo.AddOrder '06021975  ','0001','a',38777.5, 'TECUMSEH EUROPE S.A.', @OrderID OUTPUT
EXEC dbo.AddOrder '06021976  ','0001',' ',38787.5, 'PEUGEOT CITROEN AUTOMOBI', @OrderID OUTPUT
EXEC dbo.AddOrder '06021977  ','0001',' ',38774.5, 'LINNEMANN-SCHNETZER', @OrderID OUTPUT
EXEC dbo.AddOrder '06021978  ','0001',' ',38774.5, 'LINNEMANN-SCHNETZER', @OrderID OUTPUT
EXEC dbo.AddOrder '06021979  ','0001',' ',38774.5, 'LINNEMANN-SCHNETZER', @OrderID OUTPUT
EXEC dbo.AddOrder '06021981  ','0001',' ',38784.5, 'H.J.LICHTENBERGER GMBH', @OrderID OUTPUT
EXEC dbo.AddOrder '06021982  ','0001',' ',38769.5, 'PEUGEOT CITROEN AUTOMOBI', @OrderID OUTPUT
EXEC dbo.AddOrder '06021984  ','0001',' ',38769.5, 'B.V.ALVERIMPORT', @OrderID OUTPUT
EXEC dbo.AddOrder '06021985  ','0001',' ',38769.5, 'B.V.ALVERIMPORT', @OrderID OUTPUT
EXEC dbo.AddOrder '06021987  ','0001',' ',38768.5, 'SCHLIERBACHER KARTONAGEN', @OrderID OUTPUT
EXEC dbo.AddOrder '06021992  ','0001',' ',38762.5, 'TOUT''EMBALL-ZI. DE CROUP', @OrderID OUTPUT
EXEC dbo.AddOrder '06021996  ','0001',' ',38763.5, 'P&G INTERNATIONAL OPERAT', @OrderID OUTPUT
EXEC dbo.AddOrder '06021997  ','0001',' ',38767.5, 'GIKO KARTONAGEN GMBH', @OrderID OUTPUT
EXEC dbo.AddOrder '06021998  ','0001',' ',38769.5, 'DS SMITH KAYSERSBERG', @OrderID OUTPUT
EXEC dbo.AddOrder '06021999  ','0001',' ',38766.5, 'DS SMITH KAYSERSBERG', @OrderID OUTPUT
EXEC dbo.AddOrder '06022000  ','0001',' ',38768.5, 'VOLANPACK  RT', @OrderID OUTPUT
EXEC dbo.AddOrder '06022000  ','0002',' ',38768.5, 'VOLANPACK  RT', @OrderID OUTPUT
EXEC dbo.AddOrder '06022002  ','0001',' ',38762.5, 'DS SMITH KAYPAC', @OrderID OUTPUT
EXEC dbo.AddOrder '06022003  ','0001',' ',38773.5, 'B.V.ALVERIMPORT', @OrderID OUTPUT
EXEC dbo.AddOrder '06022004  ','0001',' ',38773.5, 'B.V.ALVERIMPORT', @OrderID OUTPUT
EXEC dbo.AddOrder '06022008  ','0001',' ',38774.5, 'GEORGIA-PACIFIC FRANCE', @OrderID OUTPUT
EXEC dbo.AddOrder '06022011  ','0001',' ',38769.5, 'W O L F  GMBH', @OrderID OUTPUT
EXEC dbo.AddOrder '06022013  ','0001',' ',38773.5, 'B.V.ALVERIMPORT', @OrderID OUTPUT
EXEC dbo.AddOrder '06022014  ','0001',' ',38773.5, 'B.V.ALVERIMPORT', @OrderID OUTPUT
EXEC dbo.AddOrder '06022016  ','0001',' ',38775.5, 'GEORGIA-PACIFIC FRANCE', @OrderID OUTPUT
EXEC dbo.AddOrder '06022018  ','0001',' ',38826.5, 'THERMOBILE INDUSTRIE BV', @OrderID OUTPUT
EXEC dbo.AddOrder '06022019  ','0001',' ',38767.5, 'DIEFENBACH VERPACKUNGEN', @OrderID OUTPUT
EXEC dbo.AddOrder '06022022  ','0001',' ',38777.5, 'CONDI RHONE ALPES', @OrderID OUTPUT
EXEC dbo.AddOrder '06022026  ','0001',' ',38776.5, 'DS SMITH KAYPAC', @OrderID OUTPUT
EXEC dbo.AddOrder '06022030  ','0001',' ',38770.5, 'MAISON GUSTAVE LORENTZ S', @OrderID OUTPUT
EXEC dbo.AddOrder '06022031  ','0001',' ',38770.5, 'MAISON GUSTAVE LORENTZ S', @OrderID OUTPUT
EXEC dbo.AddOrder '06022034  ','0001',' ',38770.5, 'MAISON GUSTAVE LORENTZ S', @OrderID OUTPUT
EXEC dbo.AddOrder '06022035  ','0001',' ',38770.5, 'MAISON GUSTAVE LORENTZ S', @OrderID OUTPUT
EXEC dbo.AddOrder '06022036  ','0001',' ',38770.5, 'MAISON GUSTAVE LORENTZ S', @OrderID OUTPUT
EXEC dbo.AddOrder '06022042  ','0001',' ',38774.5, 'GEORGIA-PACIFIC FRANCE', @OrderID OUTPUT
EXEC dbo.AddOrder '06022043  ','0001',' ',38770.5, 'MAISON GUSTAVE LORENTZ S', @OrderID OUTPUT
EXEC dbo.AddOrder '06022046  ','0001',' ',38763.5, 'COGESAL MIKO-FSEUR 58488', @OrderID OUTPUT
EXEC dbo.AddOrder '06022047  ','0001',' ',38769.5, 'COGESAL MIKO-FSEUR 58488', @OrderID OUTPUT
EXEC dbo.AddOrder '06022050  ','0001',' ',38768.5, 'COGESAL MIKO-FSEUR 58488', @OrderID OUTPUT
EXEC dbo.AddOrder '06022050  ','0001','b',38768.5, 'COGESAL MIKO-FSEUR 58488', @OrderID OUTPUT
EXEC dbo.AddOrder '06022053  ','0001',' ',38763.5, 'COGESAL MIKO-FSEUR 58488', @OrderID OUTPUT
EXEC dbo.AddOrder '06022054  ','0001',' ',38766.5, 'COGESAL MIKO-FSEUR 58488', @OrderID OUTPUT
EXEC dbo.AddOrder '06022057  ','0001',' ',38763.5, 'COGESAL MIKO-FSEUR 58488', @OrderID OUTPUT
EXEC dbo.AddOrder '06022058  ','0001',' ',38766.5, 'COGESAL MIKO-FSEUR 58488', @OrderID OUTPUT
EXEC dbo.AddOrder '06022059  ','0001',' ',38768.5, 'COGESAL MIKO-FSEUR 58488', @OrderID OUTPUT
EXEC dbo.AddOrder '06022061  ','0001',' ',38763.5, 'COGESAL MIKO-FSEUR 58488', @OrderID OUTPUT
EXEC dbo.AddOrder '06022062  ','0001',' ',38766.5, 'COGESAL MIKO-FSEUR 58488', @OrderID OUTPUT
EXEC dbo.AddOrder '06022063  ','0001',' ',38767.5, 'COGESAL MIKO-FSEUR 58488', @OrderID OUTPUT
EXEC dbo.AddOrder '06022064  ','0001',' ',38768.5, 'COGESAL MIKO-FSEUR 58488', @OrderID OUTPUT
EXEC dbo.AddOrder '06022066  ','0001',' ',38769.5, 'COGESAL MIKO-FSEUR 58488', @OrderID OUTPUT
EXEC dbo.AddOrder '06022068  ','0001',' ',38763.5, 'COGESAL MIKO-FSEUR 58488', @OrderID OUTPUT
EXEC dbo.AddOrder '06022069  ','0001',' ',38766.5, 'COGESAL MIKO-FSEUR 58488', @OrderID OUTPUT
EXEC dbo.AddOrder '06022070  ','0001',' ',38767.5, 'COGESAL MIKO-FSEUR 58488', @OrderID OUTPUT
EXEC dbo.AddOrder '06022071  ','0001',' ',38767.5, 'COGESAL MIKO-FSEUR 58488', @OrderID OUTPUT
EXEC dbo.AddOrder '06022072  ','0001',' ',38769.5, 'COGESAL MIKO-FSEUR 58488', @OrderID OUTPUT
EXEC dbo.AddOrder '06022075  ','0001',' ',38767.5, 'BRASSERIE FISCHER SA', @OrderID OUTPUT
EXEC dbo.AddOrder '06022076  ','0001',' ',38770.5, 'SHARP MANUFACTURING FRAN', @OrderID OUTPUT
EXEC dbo.AddOrder '06022077  ','0001',' ',38774.5, 'STE SIMU', @OrderID OUTPUT
EXEC dbo.AddOrder '06022079  ','0001',' ',38769.5, 'STE SIMU', @OrderID OUTPUT
EXEC dbo.AddOrder '06022080  ','0001',' ',38769.5, 'STE SIMU', @OrderID OUTPUT
EXEC dbo.AddOrder '06022083  ','0001',' ',38769.5, 'TRANSPACK-KRUMBACH GMBH', @OrderID OUTPUT
EXEC dbo.AddOrder '06022084  ','0001',' ',38789.5, 'TRANSPACK-KRUMBACH GMBH', @OrderID OUTPUT
EXEC dbo.AddOrder '06022087  ','0001',' ',38769.5, 'SCHWEITZER S.A.', @OrderID OUTPUT
EXEC dbo.AddOrder '06022089  ','0001',' ',38773.5, 'SCHWEITZER S.A.', @OrderID OUTPUT
EXEC dbo.AddOrder '06022090  ','0001',' ',38775.5, 'SCHWEITZER S.A.', @OrderID OUTPUT
EXEC dbo.AddOrder '06022092  ','0001',' ',38774.5, 'SCHWEITZER S.A.', @OrderID OUTPUT
EXEC dbo.AddOrder '06022094  ','0001',' ',38791.5, 'ETS HUGEL ET FILS S.A.', @OrderID OUTPUT
EXEC dbo.AddOrder '06022096  ','0001',' ',38774.5, 'SHARP MANUFACTURING FRAN', @OrderID OUTPUT
EXEC dbo.AddOrder '06022101  ','0001',' ',38763.5, 'COGESAL MIKO-FSEUR 58488', @OrderID OUTPUT
EXEC dbo.AddOrder '06022102  ','0001',' ',38763.5, 'COGESAL MIKO-FSEUR 58488', @OrderID OUTPUT
EXEC dbo.AddOrder '06022103  ','0001',' ',38766.5, 'COGESAL MIKO-FSEUR 58488', @OrderID OUTPUT
EXEC dbo.AddOrder '06022104  ','0001',' ',38768.5, 'COGESAL MIKO-FSEUR 58488', @OrderID OUTPUT
EXEC dbo.AddOrder '06022105  ','0001',' ',38768.5, 'COGESAL MIKO-FSEUR 58488', @OrderID OUTPUT
EXEC dbo.AddOrder '06022109  ','0001',' ',38766.5, 'DOWELANCO ITALIA S.R.L', @OrderID OUTPUT
EXEC dbo.AddOrder '06022110  ','0001',' ',38766.5, 'DOWELANCO ITALIA S.R.L', @OrderID OUTPUT
EXEC dbo.AddOrder '06022111  ','0001',' ',38766.5, 'DOWELANCO ITALIA S.R.L', @OrderID OUTPUT
EXEC dbo.AddOrder '06022112  ','0001',' ',38766.5, 'DOWELANCO ITALIA S.R.L', @OrderID OUTPUT
EXEC dbo.AddOrder '06022113  ','0001',' ',38766.5, 'DOWELANCO ITALIA S.R.L', @OrderID OUTPUT
EXEC dbo.AddOrder '06022116  ','0001',' ',38767.5, 'DOW AGROSCIENCES SWITZEL', @OrderID OUTPUT
EXEC dbo.AddOrder '06022117  ','0001',' ',38767.5, 'DOW AGROSCIENCES SWITZEL', @OrderID OUTPUT
EXEC dbo.AddOrder '06022118  ','0001',' ',38767.5, 'DOW AGROSCIENCES SWITZEL', @OrderID OUTPUT
EXEC dbo.AddOrder '06022119  ','0001',' ',38767.5, 'DOW AGROSCIENCES SWITZEL', @OrderID OUTPUT
EXEC dbo.AddOrder '06022120  ','0001',' ',38767.5, 'DOW AGROSCIENCES SWITZEL', @OrderID OUTPUT
EXEC dbo.AddOrder '06022121  ','0001',' ',38767.5, 'DOW AGROSCIENCES SWITZEL', @OrderID OUTPUT
EXEC dbo.AddOrder '06022122  ','0001',' ',38767.5, 'DOW AGROSCIENCES SWITZEL', @OrderID OUTPUT
EXEC dbo.AddOrder '06022123  ','0001',' ',38767.5, 'DOW AGROSCIENCES SWITZEL', @OrderID OUTPUT
EXEC dbo.AddOrder '06022125  ','0001',' ',38766.5, 'DOW-AGROSCIENCES ITALIA', @OrderID OUTPUT
EXEC dbo.AddOrder '06022126  ','0001',' ',38766.5, 'DOW-AGROSCIENCES ITALIA', @OrderID OUTPUT
EXEC dbo.AddOrder '06022127  ','0001',' ',38766.5, 'DOW-AGROSCIENCES ITALIA', @OrderID OUTPUT
EXEC dbo.AddOrder '06022128  ','0001',' ',38766.5, 'DOW-AGROSCIENCES ITALIA', @OrderID OUTPUT
EXEC dbo.AddOrder '06022130  ','0001',' ',38766.5, 'DOW AGROSCIENCES', @OrderID OUTPUT
EXEC dbo.AddOrder '06022133  ','0001',' ',38766.5, 'DOW AGROSCIENCES SWITERL', @OrderID OUTPUT
EXEC dbo.AddOrder '06022134  ','0001',' ',38766.5, 'DOW AGROSCIENCES SWITERL', @OrderID OUTPUT
EXEC dbo.AddOrder '06022135  ','0001',' ',38766.5, 'DOW AGROSCIENCES SWITERL', @OrderID OUTPUT
EXEC dbo.AddOrder '06022136  ','0001',' ',38766.5, 'DOW AGROSCIENCES SWITERL', @OrderID OUTPUT
EXEC dbo.AddOrder '06022138  ','0001',' ',38762.5, 'NESTLE WATERS SUPPLY EST', @OrderID OUTPUT
EXEC dbo.AddOrder '06022140  ','0001',' ',38769.5, 'NESTLE WATERS SUPPLY EST', @OrderID OUTPUT
EXEC dbo.AddOrder '06022142  ','0001',' ',38769.5, 'NESTLE WATERS SUPPLY EST', @OrderID OUTPUT
EXEC dbo.AddOrder '06022144  ','0001',' ',38761.5, 'NESTLE WATERS SUPPLY EST', @OrderID OUTPUT
EXEC dbo.AddOrder '06022146  ','0001',' ',38762.5, 'NESTLE WATERS SUPPLY EST', @OrderID OUTPUT
EXEC dbo.AddOrder '06022148  ','0001',' ',38762.5, 'NESTLE WATERS SUPPLY EST', @OrderID OUTPUT
EXEC dbo.AddOrder '06022150  ','0001',' ',38763.5, 'NESTLE WATERS SUPPLY EST', @OrderID OUTPUT
EXEC dbo.AddOrder '06022152  ','0001',' ',38766.5, 'NESTLE WATERS SUPPLY EST', @OrderID OUTPUT
EXEC dbo.AddOrder '06022154  ','0001',' ',38766.5, 'NESTLE WATERS SUPPLY EST', @OrderID OUTPUT
EXEC dbo.AddOrder '06022156  ','0001',' ',38767.5, 'NESTLE WATERS SUPPLY EST', @OrderID OUTPUT
EXEC dbo.AddOrder '06022158  ','0001',' ',38781.5, 'MGI COUTIER PLASTIQUE', @OrderID OUTPUT
EXEC dbo.AddOrder '06022159  ','0001',' ',38762.5, 'NESTLE WATERS SUPPLY EST', @OrderID OUTPUT
EXEC dbo.AddOrder '06022159  ','0001','a',38762.5, 'NESTLE WATERS SUPPLY EST', @OrderID OUTPUT
EXEC dbo.AddOrder '06022161  ','0001',' ',38762.5, 'NESTLE WATERS SUPPLY EST', @OrderID OUTPUT
EXEC dbo.AddOrder '06022163  ','0001',' ',38766.5, 'NESTLE WATERS SUPPLY EST', @OrderID OUTPUT
EXEC dbo.AddOrder '06022165  ','0001',' ',38766.5, 'DOW AGROSCIENCES', @OrderID OUTPUT
EXEC dbo.AddOrder '06022166  ','0001',' ',38763.5, 'NESTLE WATERS SUPPLY EST', @OrderID OUTPUT
EXEC dbo.AddOrder '06022167  ','0001',' ',38766.5, 'DOW AGROSCIENCES', @OrderID OUTPUT
EXEC dbo.AddOrder '06022168  ','0001',' ',38766.5, 'DOW AGROSCIENCES', @OrderID OUTPUT
EXEC dbo.AddOrder '06022169  ','0001',' ',38766.5, 'DOW AGROSCIENCES', @OrderID OUTPUT
EXEC dbo.AddOrder '06022171  ','0001',' ',38766.5, 'DOW AGROSCIENCES', @OrderID OUTPUT
EXEC dbo.AddOrder '06022172  ','0001',' ',38767.5, 'DOW AGROSCIENCES', @OrderID OUTPUT
EXEC dbo.AddOrder '06022173  ','0001',' ',38766.5, 'DOW AGROSCIENCES', @OrderID OUTPUT
EXEC dbo.AddOrder '06022174  ','0001',' ',38766.5, 'DOW AGROSCIENCES', @OrderID OUTPUT
EXEC dbo.AddOrder '06022175  ','0001',' ',38767.5, 'DOW AGROSCIENCES', @OrderID OUTPUT
EXEC dbo.AddOrder '06022176  ','0001',' ',38766.5, 'DOW AGROSCIENCES', @OrderID OUTPUT
EXEC dbo.AddOrder '06022177  ','0001',' ',38767.5, 'DOW AGROSCIENCES', @OrderID OUTPUT
EXEC dbo.AddOrder '06022178  ','0001',' ',38766.5, 'DOW AGROSCIENCES', @OrderID OUTPUT
EXEC dbo.AddOrder '06022179  ','0001',' ',38766.5, 'DOW AGROSCIENCES', @OrderID OUTPUT
EXEC dbo.AddOrder '06022180  ','0001',' ',38766.5, 'DOW AGROSCIENCES', @OrderID OUTPUT
EXEC dbo.AddOrder '06022181  ','0001',' ',38767.5, 'DOW AGROSCIENCES', @OrderID OUTPUT
EXEC dbo.AddOrder '06022182  ','0001',' ',38766.5, 'DOW AGROSCIENCES', @OrderID OUTPUT
EXEC dbo.AddOrder '06022183  ','0001',' ',38766.5, 'DOW AGROSCIENCES', @OrderID OUTPUT
EXEC dbo.AddOrder '06022184  ','0001',' ',38766.5, 'DOW AGROSCIENCES', @OrderID OUTPUT
EXEC dbo.AddOrder '06022185  ','0001',' ',38766.5, 'DOW AGROSCIENCES', @OrderID OUTPUT
EXEC dbo.AddOrder '06022186  ','0001',' ',38766.5, 'DOW AGROSCIENCES', @OrderID OUTPUT
EXEC dbo.AddOrder '06022187  ','0001',' ',38766.5, 'DOW AGROSCIENCES', @OrderID OUTPUT
EXEC dbo.AddOrder '06022188  ','0001',' ',38766.5, 'DOW AGROSCIENCES', @OrderID OUTPUT
EXEC dbo.AddOrder '06022190  ','0001',' ',38766.5, 'DOW AGROSCIENCES', @OrderID OUTPUT
EXEC dbo.AddOrder '06022191  ','0001',' ',38766.5, 'DOW AGROSCIENCES', @OrderID OUTPUT
EXEC dbo.AddOrder '06022192  ','0001',' ',38766.5, 'DOW AGROSCIENCES', @OrderID OUTPUT
EXEC dbo.AddOrder '06022193  ','0001',' ',38767.5, 'DOW AGROSCIENCES', @OrderID OUTPUT
EXEC dbo.AddOrder '06022193  ','0001','a',38767.5, 'DOW AGROSCIENCES', @OrderID OUTPUT
EXEC dbo.AddOrder '06022194  ','0001',' ',38766.5, 'DOW AGROSCIENCES', @OrderID OUTPUT
EXEC dbo.AddOrder '06022195  ','0001',' ',38766.5, 'DOW AGROSCIENCES', @OrderID OUTPUT
EXEC dbo.AddOrder '06022196  ','0001',' ',38766.5, 'DOW AGROSCIENCES', @OrderID OUTPUT
EXEC dbo.AddOrder '06022197  ','0001',' ',38768.5, 'NESTLE WATERS SUPPLY EST', @OrderID OUTPUT
EXEC dbo.AddOrder '06022200  ','0001',' ',38768.5, 'NESTLE WATERS SUPPLY EST', @OrderID OUTPUT
EXEC dbo.AddOrder '06022202  ','0001',' ',38762.5, 'DOW AGROSCIENCES SWITERL', @OrderID OUTPUT
EXEC dbo.AddOrder '06022203  ','0001',' ',38767.5, 'NESTLE WATERS SUPPLY EST', @OrderID OUTPUT
EXEC dbo.AddOrder '06022205  ','0001',' ',38767.5, 'NESTLE WATERS SUPPLY EST', @OrderID OUTPUT
EXEC dbo.AddOrder '06022207  ','0001',' ',38768.5, 'NESTLE WATERS SUPPLY EST', @OrderID OUTPUT
EXEC dbo.AddOrder '06022209  ','0001',' ',38767.5, 'NESTLE WATERS SUPPLY EST', @OrderID OUTPUT
EXEC dbo.AddOrder '06022211  ','0001',' ',38768.5, 'NESTLE WATERS SUPPLY EST', @OrderID OUTPUT
EXEC dbo.AddOrder '06022213  ','0001',' ',38767.5, 'NESTLE WATERS SUPPLY EST', @OrderID OUTPUT
EXEC dbo.AddOrder '06022215  ','0001',' ',38769.5, 'NESTLE WATERS SUPPLY EST', @OrderID OUTPUT
EXEC dbo.AddOrder '06022217  ','0001',' ',38769.5, 'NESTLE WATERS SUPPLY EST', @OrderID OUTPUT
EXEC dbo.AddOrder '06022219  ','0001',' ',38784.5, 'DU PONT DE NEMOURS (FRAN', @OrderID OUTPUT
EXEC dbo.AddOrder '06022221  ','0001',' ',38775.5, 'DU PONT DE NEMOURS (FRAN', @OrderID OUTPUT
EXEC dbo.AddOrder '06022223  ','0001',' ',38781.5, 'DU PONT DE NEMOURS (FRAN', @OrderID OUTPUT
EXEC dbo.AddOrder '06022225  ','0001',' ',38780.5, 'DU PONT DE NEMOURS (FRAN', @OrderID OUTPUT
EXEC dbo.AddOrder '06022227  ','0001',' ',38774.5, 'DU PONT DE NEMOURS (FRAN', @OrderID OUTPUT
EXEC dbo.AddOrder '06022229  ','0001',' ',38774.5, 'DU PONT DE NEMOURS (FRAN', @OrderID OUTPUT
EXEC dbo.AddOrder '06022230  ','0001',' ',38767.5, 'MEPHISTO', @OrderID OUTPUT
EXEC dbo.AddOrder '06022231  ','0001',' ',38769.5, 'DS SMITH KAYSERSBERG', @OrderID OUTPUT
EXEC dbo.AddOrder '06022234  ','0001',' ',38788.5, 'PEUGEOT CITROEN AUTOMOBI', @OrderID OUTPUT
EXEC dbo.AddOrder '06022236  ','0001',' ',38770.5, 'P&G INTERNATIONAL OPERAT', @OrderID OUTPUT
EXEC dbo.AddOrder '06022238  ','0001',' ',38773.5, 'P&G INTERNATIONAL OPERAT', @OrderID OUTPUT
EXEC dbo.AddOrder '06022242  ','0001',' ',38773.5, 'P&G INTERNATIONAL OPERAT', @OrderID OUTPUT
EXEC dbo.AddOrder '06022246  ','0001',' ',38780.5, 'P&G INTERNATIONAL OPERAT', @OrderID OUTPUT
EXEC dbo.AddOrder '06022248  ','0001',' ',38776.5, 'P&G INTERNATIONAL OPERAT', @OrderID OUTPUT
EXEC dbo.AddOrder '06022251  ','0001',' ',38768.5, 'SNF SAS', @OrderID OUTPUT
EXEC dbo.AddOrder '06022253  ','0001',' ',38775.5, 'CSP', @OrderID OUTPUT
EXEC dbo.AddOrder '06022257  ','0001',' ',38775.5, 'COGESAL MIKO-FSEUR 58488', @OrderID OUTPUT
EXEC dbo.AddOrder '06022258  ','0001',' ',38773.5, 'STE ALSA-CORK', @OrderID OUTPUT
EXEC dbo.AddOrder '06022260  ','0001',' ',38781.5, 'MAISON GUSTAVE LORENTZ S', @OrderID OUTPUT
EXEC dbo.AddOrder '06022263  ','0001',' ',38770.5, 'COGESAL MIKO-FSEUR 58488', @OrderID OUTPUT
EXEC dbo.AddOrder '06022264  ','0001',' ',38773.5, 'COGESAL MIKO-FSEUR 58488', @OrderID OUTPUT
EXEC dbo.AddOrder '06022265  ','0001',' ',38773.5, 'COGESAL MIKO-FSEUR 58488', @OrderID OUTPUT
EXEC dbo.AddOrder '06022266  ','0001',' ',38774.5, 'COGESAL MIKO-FSEUR 58488', @OrderID OUTPUT
EXEC dbo.AddOrder '06022268  ','0001',' ',38769.5, 'ALKO  SA.    MR. MILLIAT', @OrderID OUTPUT
EXEC dbo.AddOrder '06022274  ','0001',' ',38781.5, 'STE SIMU', @OrderID OUTPUT
EXEC dbo.AddOrder '06022274  ','0001','a',38787.5, 'STE SIMU', @OrderID OUTPUT
EXEC dbo.AddOrder '06022276  ','0001',' ',38769.5, 'TIMKEN EUROPE', @OrderID OUTPUT
EXEC dbo.AddOrder '06022277  ','0001',' ',38769.5, 'TIMKEN EUROPE', @OrderID OUTPUT
EXEC dbo.AddOrder '06022282  ','0001',' ',38769.5, 'NORD REDUCTEURS', @OrderID OUTPUT
EXEC dbo.AddOrder '06022283  ','0001',' ',38774.5, 'DS SMITH KAYPAC', @OrderID OUTPUT
EXEC dbo.AddOrder '06022286  ','0001',' ',38769.5, 'MAHLE-PISTONS FRANCE SAR', @OrderID OUTPUT
EXEC dbo.AddOrder '06022287  ','0001',' ',38783.5, 'PEUGEOT CITROEN AUTOMOBI', @OrderID OUTPUT
EXEC dbo.AddOrder '06022289  ','0001',' ',38791.5, 'MAISON F.E. TRIMBACH SA.', @OrderID OUTPUT
EXEC dbo.AddOrder '06022293  ','0001',' ',38766.5, 'STE SIMU', @OrderID OUTPUT
EXEC dbo.AddOrder '06022295  ','0001',' ',38766.5, 'STE SIMU', @OrderID OUTPUT
EXEC dbo.AddOrder '06022297  ','0001',' ',38766.5, 'STE SIMU', @OrderID OUTPUT
EXEC dbo.AddOrder '06022299  ','0001',' ',38766.5, 'STE SIMU', @OrderID OUTPUT
EXEC dbo.AddOrder '06022302  ','0001',' ',38766.5, 'STE SIMU', @OrderID OUTPUT
EXEC dbo.AddOrder '06022304  ','0001',' ',38766.5, 'STE SIMU', @OrderID OUTPUT
EXEC dbo.AddOrder '06022306  ','0001',' ',38788.5, 'TITANITE SA', @OrderID OUTPUT
EXEC dbo.AddOrder '06022309  ','0001',' ',38780.5, 'B.V.ALVERIMPORT', @OrderID OUTPUT
EXEC dbo.AddOrder '06022310  ','0001',' ',38774.5, 'B.V.ALVERIMPORT', @OrderID OUTPUT
EXEC dbo.AddOrder '06022312  ','0001',' ',38777.5, 'DELIPAPIER', @OrderID OUTPUT
EXEC dbo.AddOrder '06022313  ','0001',' ',38774.5, 'DELIPAPIER', @OrderID OUTPUT
EXEC dbo.AddOrder '06022314  ','0001',' ',38781.5, 'DELIPAPIER', @OrderID OUTPUT
EXEC dbo.AddOrder '06022315  ','0001',' ',38781.5, 'DELIPAPIER', @OrderID OUTPUT
EXEC dbo.AddOrder '06022316  ','0001',' ',38781.5, 'DELIPAPIER', @OrderID OUTPUT
EXEC dbo.AddOrder '06022317  ','0001',' ',38769.5, 'DS SMITH KAYSERSBERG', @OrderID OUTPUT
EXEC dbo.AddOrder '06022318  ','0001',' ',38768.5, 'DS SMITH KAYSERSBERG', @OrderID OUTPUT
EXEC dbo.AddOrder '06022319  ','0001',' ',38766.5, 'DS SMITH KAYSERSBERG', @OrderID OUTPUT
EXEC dbo.AddOrder '06022320  ','0001',' ',38767.5, 'DS SMITH KAYSERSBERG', @OrderID OUTPUT
EXEC dbo.AddOrder '06022321  ','0001',' ',38768.5, 'DS SMITH KAYSERSBERG', @OrderID OUTPUT
EXEC dbo.AddOrder '06022324  ','0001',' ',38775.5, 'EGON HUEBLER', @OrderID OUTPUT
EXEC dbo.AddOrder '06022325  ','0001',' ',38774.5, 'EGON HUEBLER', @OrderID OUTPUT
EXEC dbo.AddOrder '06022326  ','0001',' ',38768.5, 'DS SMITH KAYPAC', @OrderID OUTPUT
EXEC dbo.AddOrder '06022329  ','0001',' ',38767.5, 'SEP KUNHEIM', @OrderID OUTPUT
EXEC dbo.AddOrder '06022330  ','0001',' ',38768.5, 'CART.EMBAL. RHONE ALPES', @OrderID OUTPUT
EXEC dbo.AddOrder '06022330  ','0002',' ',38768.5, 'CART.EMBAL. RHONE ALPES', @OrderID OUTPUT
EXEC dbo.AddOrder '06022330  ','0003',' ',38768.5, 'CART.EMBAL. RHONE ALPES', @OrderID OUTPUT
EXEC dbo.AddOrder '06022332  ','0001',' ',38768.5, 'BRASSERIES HEINEKEN SA', @OrderID OUTPUT
EXEC dbo.AddOrder '06022333  ','0001',' ',38768.5, 'CART.EMBAL. RHONE ALPES', @OrderID OUTPUT
EXEC dbo.AddOrder '06022333  ','0001','a',38768.5, 'CART.EMBAL. RHONE ALPES', @OrderID OUTPUT
EXEC dbo.AddOrder '06022335  ','0001',' ',38770.5, 'STERLING (STE ELECTRIQUE', @OrderID OUTPUT
EXEC dbo.AddOrder '06022337  ','0001',' ',38770.5, 'STERLING (STE ELECTRIQUE', @OrderID OUTPUT
EXEC dbo.AddOrder '06022339  ','0001',' ',38773.5, 'BRASSERIES HEINEKEN SA', @OrderID OUTPUT
EXEC dbo.AddOrder '06022341  ','0001',' ',38774.5, 'BRASSERIES HEINEKEN SA', @OrderID OUTPUT
EXEC dbo.AddOrder '06022346  ','0001',' ',38760.5, 'JTEKT AUTOMOBILE', @OrderID OUTPUT
EXEC dbo.AddOrder '06022352  ','0001',' ',38790.5, 'DU PONT DE NEMOURS (FRAN', @OrderID OUTPUT
EXEC dbo.AddOrder '06022352  ','0001','a',38790.5, 'DU PONT DE NEMOURS (FRAN', @OrderID OUTPUT
EXEC dbo.AddOrder '06022354  ','0001',' ',38774.5, 'LABORATOIRE ALCON', @OrderID OUTPUT
EXEC dbo.AddOrder '06022355  ','0001',' ',38776.5, 'LABORATOIRE ALCON', @OrderID OUTPUT
EXEC dbo.AddOrder '06022356  ','0001',' ',38776.5, 'LABORATOIRE ALCON', @OrderID OUTPUT
EXEC dbo.AddOrder '06022357  ','0001',' ',38784.5, 'LABORATOIRE ALCON', @OrderID OUTPUT
EXEC dbo.AddOrder '06022358  ','0001',' ',38790.5, 'LABORATOIRE ALCON', @OrderID OUTPUT
EXEC dbo.AddOrder '06022359  ','0001',' ',38781.5, 'DU PONT DE NEMOURS (FRAN', @OrderID OUTPUT
EXEC dbo.AddOrder '06022359  ','0001','a',38782.5, 'DU PONT DE NEMOURS (FRAN', @OrderID OUTPUT
EXEC dbo.AddOrder '06022362  ','0001',' ',38775.5, 'DU PONT DE NEMOURS (FRAN', @OrderID OUTPUT
EXEC dbo.AddOrder '06022363  ','0001',' ',38774.5, 'PRODENE KLINT ESPACE LEA', @OrderID OUTPUT
EXEC dbo.AddOrder '06022366  ','0001',' ',38776.5, 'PRODENE KLINT ESPACE LEA', @OrderID OUTPUT
EXEC dbo.AddOrder '06022367  ','0001',' ',38787.5, 'DU PONT DE NEMOURS (FRAN', @OrderID OUTPUT
EXEC dbo.AddOrder '06022368  ','0001',' ',38766.5, 'DS SMITH KAYPAC', @OrderID OUTPUT
EXEC dbo.AddOrder '06022370  ','0001',' ',38797.5, 'DS SMITH KAYPAC', @OrderID OUTPUT
EXEC dbo.AddOrder '06022372  ','0001',' ',38775.5, 'DUPONT IBERICA S.L.', @OrderID OUTPUT
EXEC dbo.AddOrder '06022373  ','0001',' ',38773.5, 'DUPONT IBERICA S.L.', @OrderID OUTPUT
EXEC dbo.AddOrder '06022374  ','0001',' ',38774.5, 'DUPONT IBERICA S.L.', @OrderID OUTPUT
EXEC dbo.AddOrder '06022375  ','0001',' ',38769.5, 'NESTLE WATERS SUPPLY EST', @OrderID OUTPUT
EXEC dbo.AddOrder '06022378  ','0001',' ',38768.5, 'DS SMITH KAYPAC', @OrderID OUTPUT
EXEC dbo.AddOrder '06022379  ','0001',' ',38774.5, 'NESTLE WATERS SUPPLY EST', @OrderID OUTPUT
EXEC dbo.AddOrder '06022381  ','0001',' ',38774.5, 'NESTLE WATERS SUPPLY EST', @OrderID OUTPUT
EXEC dbo.AddOrder '06022383  ','0001',' ',38777.5, 'NESTLE WATERS SUPPLY EST', @OrderID OUTPUT
EXEC dbo.AddOrder '06022385  ','0001',' ',38784.5, 'NESTLE WATERS SUPPLY EST', @OrderID OUTPUT
EXEC dbo.AddOrder '06022387  ','0001',' ',38787.5, 'NESTLE WATERS SUPPLY EST', @OrderID OUTPUT
EXEC dbo.AddOrder '06022389  ','0001',' ',38763.5, 'NESTLE WATERS SUPPLY EST', @OrderID OUTPUT
EXEC dbo.AddOrder '06022390  ','0001',' ',38768.5, 'DIEFENBACH VERPACKUNGEN', @OrderID OUTPUT
EXEC dbo.AddOrder '06022391  ','0001',' ',38769.5, 'DIEFENBACH VERPACKUNGEN', @OrderID OUTPUT
EXEC dbo.AddOrder '06022395  ','0001',' ',38775.5, 'SCHWEITZER S.A.', @OrderID OUTPUT
EXEC dbo.AddOrder '06022396  ','0001',' ',38774.5, 'SCHWEITZER S.A.', @OrderID OUTPUT
EXEC dbo.AddOrder '06022399  ','0001',' ',38770.5, 'WORK IN PROGRESS GMBH', @OrderID OUTPUT
EXEC dbo.AddOrder '06022401  ','0001',' ',38770.5, 'S.M.A.E.    (EDI)', @OrderID OUTPUT
EXEC dbo.AddOrder '06022404  ','0001',' ',38768.5, 'CONDI RHONE ALPES', @OrderID OUTPUT
EXEC dbo.AddOrder '06022405  ','0001',' ',38769.5, 'HERMANN KOHLHOF GMBH', @OrderID OUTPUT
EXEC dbo.AddOrder '06022406  ','0001',' ',38770.5, 'HERMANN KOHLHOF GMBH', @OrderID OUTPUT
EXEC dbo.AddOrder '06022408  ','0001',' ',38770.5, 'FRANCE CONDITIONNEMENT', @OrderID OUTPUT
EXEC dbo.AddOrder '06022408  ','0001','a',38780.5, 'FRANCE CONDITIONNEMENT', @OrderID OUTPUT
EXEC dbo.AddOrder '06022409  ','0001',' ',38770.5, 'FRANCE CONDITIONNEMENT', @OrderID OUTPUT
EXEC dbo.AddOrder '06022409  ','0001','a',38780.5, 'FRANCE CONDITIONNEMENT', @OrderID OUTPUT
EXEC dbo.AddOrder '06022410  ','0001',' ',38770.5, 'FRANCE CONDITIONNEMENT', @OrderID OUTPUT
EXEC dbo.AddOrder '06022410  ','0001','a',38780.5, 'FRANCE CONDITIONNEMENT', @OrderID OUTPUT
EXEC dbo.AddOrder '06022411  ','0001',' ',38770.5, 'FRANCE CONDITIONNEMENT', @OrderID OUTPUT
EXEC dbo.AddOrder '06022412  ','0001',' ',38770.5, 'FRANCE CONDITIONNEMENT', @OrderID OUTPUT
EXEC dbo.AddOrder '06022413  ','0001',' ',38768.5, 'HEIDE WERKSTAETTEN E.V.', @OrderID OUTPUT
EXEC dbo.AddOrder '06022413  ','0002',' ',38769.5, 'HEIDE WERKSTAETTEN E.V.', @OrderID OUTPUT
EXEC dbo.AddOrder '06022413  ','0003',' ',38769.5, 'HEIDE WERKSTAETTEN E.V.', @OrderID OUTPUT
EXEC dbo.AddOrder '06022415  ','0001',' ',38781.5, 'H.B. FULLER AUSTRIA GMBH', @OrderID OUTPUT
EXEC dbo.AddOrder '06022416  ','0001',' ',38782.5, 'H.B. FULLER AUSTRIA GMBH', @OrderID OUTPUT
EXEC dbo.AddOrder '06022417  ','0001',' ',38787.5, 'H.B. FULLER AUSTRIA GMBH', @OrderID OUTPUT
EXEC dbo.AddOrder '06022423  ','0001',' ',38769.5, 'NESTLE WATERS SUPPLY EST', @OrderID OUTPUT
EXEC dbo.AddOrder '06022425  ','0001',' ',38762.5, 'NESTLE WATERS SUPPLY EST', @OrderID OUTPUT
EXEC dbo.AddOrder '06022427  ','0001',' ',38769.5, 'NESTLE WATERS SUPPLY EST', @OrderID OUTPUT
EXEC dbo.AddOrder '06022429  ','0001',' ',38770.5, 'NESTLE WATERS SUPPLY EST', @OrderID OUTPUT
EXEC dbo.AddOrder '06022431  ','0001',' ',38776.5, 'NESTLE WATERS SUPPLY EST', @OrderID OUTPUT
EXEC dbo.AddOrder '06022433  ','0001',' ',38776.5, 'NESTLE WATERS SUPPLY EST', @OrderID OUTPUT
EXEC dbo.AddOrder '06022435  ','0001',' ',38760.5, 'P&G INTERNATIONAL OPERAT', @OrderID OUTPUT
EXEC dbo.AddOrder '06022437  ','0001',' ',38791.5, 'P&G INTERNATIONAL OPERAT', @OrderID OUTPUT
EXEC dbo.AddOrder '06022439  ','0001',' ',38791.5, 'P&G INTERNATIONAL OPERAT', @OrderID OUTPUT
EXEC dbo.AddOrder '06022441  ','0001',' ',38787.5, 'P&G INTERNATIONAL OPERAT', @OrderID OUTPUT
EXEC dbo.AddOrder '06022443  ','0001',' ',38794.5, 'P&G INTERNATIONAL OPERAT', @OrderID OUTPUT
EXEC dbo.AddOrder '06022445  ','0001',' ',38780.5, 'P&G INTERNATIONAL OPERAT', @OrderID OUTPUT
EXEC dbo.AddOrder '06022447  ','0001',' ',38777.5, 'P&G INTERNATIONAL OPERAT', @OrderID OUTPUT
EXEC dbo.AddOrder '06022449  ','0001',' ',38787.5, 'P&G INTERNATIONAL OPERAT', @OrderID OUTPUT
EXEC dbo.AddOrder '06022459  ','0001',' ',38776.5, 'RICOH INDUSTRIE FRANCE', @OrderID OUTPUT
EXEC dbo.AddOrder '06022460  ','0001',' ',38755.5, 'P&G INTERNATIONAL OPERAT', @OrderID OUTPUT
EXEC dbo.AddOrder '06022462  ','0001',' ',38781.5, 'P&G INTERNATIONAL OPERAT', @OrderID OUTPUT
EXEC dbo.AddOrder '06022464  ','0001',' ',38783.5, 'P&G INTERNATIONAL OPERAT', @OrderID OUTPUT
EXEC dbo.AddOrder '06022466  ','0001',' ',38775.5, 'P&G INTERNATIONAL OPERAT', @OrderID OUTPUT
EXEC dbo.AddOrder '06022468  ','0001',' ',38775.5, 'P&G INTERNATIONAL OPERAT', @OrderID OUTPUT
EXEC dbo.AddOrder '06022470  ','0001',' ',38787.5, 'P&G INTERNATIONAL OPERAT', @OrderID OUTPUT
EXEC dbo.AddOrder '06022475  ','0001',' ',38775.5, 'GEORGIA-PACIFIC FRANCE', @OrderID OUTPUT
EXEC dbo.AddOrder '06022476  ','0001',' ',38770.5, 'P&G INTERNATIONAL OPERAT', @OrderID OUTPUT
EXEC dbo.AddOrder '06022481  ','0001',' ',38775.5, 'GEORGIA-PACIFIC FRANCE', @OrderID OUTPUT
EXEC dbo.AddOrder '06022486  ','0001',' ',38775.5, 'GEORGIA-PACIFIC FRANCE', @OrderID OUTPUT
EXEC dbo.AddOrder '06022488  ','0001',' ',38784.5, 'DS SMITH KAYPAC', @OrderID OUTPUT
EXEC dbo.AddOrder '06022493  ','0001',' ',38776.5, 'P&G INTERNATIONAL OPERAT', @OrderID OUTPUT
EXEC dbo.AddOrder '06022494  ','0001',' ',38787.5, 'DS SMITH KAYPAC', @OrderID OUTPUT
EXEC dbo.AddOrder '06022496  ','0001',' ',38775.5, 'P&G INTERNATIONAL OPERAT', @OrderID OUTPUT
EXEC dbo.AddOrder '06022498  ','0001',' ',38776.5, 'P&G INTERNATIONAL OPERAT', @OrderID OUTPUT
EXEC dbo.AddOrder '06022500  ','0001',' ',38775.5, 'P&G INTERNATIONAL OPERAT', @OrderID OUTPUT
EXEC dbo.AddOrder '06022503  ','0001',' ',38763.5, 'P&G INTERNATIONAL OPERAT', @OrderID OUTPUT
EXEC dbo.AddOrder '06022505  ','0001',' ',38768.5, 'P&G INTERNATIONAL OPERAT', @OrderID OUTPUT
EXEC dbo.AddOrder '06022508  ','0001',' ',38769.5, 'P&G INTERNATIONAL OPERAT', @OrderID OUTPUT
EXEC dbo.AddOrder '06022510  ','0001',' ',38770.5, 'P&G INTERNATIONAL OPERAT', @OrderID OUTPUT
EXEC dbo.AddOrder '06022513  ','0001',' ',38773.5, 'P&G INTERNATIONAL OPERAT', @OrderID OUTPUT
EXEC dbo.AddOrder '06022517  ','0001',' ',38774.5, 'P&G INTERNATIONAL OPERAT', @OrderID OUTPUT
EXEC dbo.AddOrder '06022519  ','0001',' ',38773.5, 'WELL-PACK AG', @OrderID OUTPUT
EXEC dbo.AddOrder '06022520  ','0001',' ',38763.5, 'P&G INTERNATIONAL OPERAT', @OrderID OUTPUT
EXEC dbo.AddOrder '06022524  ','0001',' ',38787.5, 'P&G INTERNATIONAL OPERAT', @OrderID OUTPUT
EXEC dbo.AddOrder '06022528  ','0001',' ',38777.5, 'P&G INTERNATIONAL OPERAT', @OrderID OUTPUT
EXEC dbo.AddOrder '06022532  ','0001',' ',38777.5, 'P&G INTERNATIONAL OPERAT', @OrderID OUTPUT
EXEC dbo.AddOrder '06022534  ','0001',' ',38773.5, 'P&G INTERNATIONAL OPERAT', @OrderID OUTPUT
EXEC dbo.AddOrder '06022536  ','0001',' ',38774.5, 'BRASSERIES HEINEKEN SA', @OrderID OUTPUT
EXEC dbo.AddOrder '06022538  ','0001',' ',38773.5, 'MEPHISTO', @OrderID OUTPUT
EXEC dbo.AddOrder '06022540  ','0001',' ',38789.5, 'RICOH INDUSTRIE FRANCE', @OrderID OUTPUT
EXEC dbo.AddOrder '06022543  ','0001',' ',38770.5, 'B.V.ALVERIMPORT', @OrderID OUTPUT
EXEC dbo.AddOrder '06022543  ','0001','a',38773.5, 'B.V.ALVERIMPORT', @OrderID OUTPUT
EXEC dbo.AddOrder '06022543  ','0001','b',38770.5, 'B.V.ALVERIMPORT', @OrderID OUTPUT
EXEC dbo.AddOrder '06022544  ','0001',' ',38769.5, 'TIMKEN EUROPE', @OrderID OUTPUT
EXEC dbo.AddOrder '06022544  ','0002',' ',38769.5, 'TIMKEN EUROPE', @OrderID OUTPUT
EXEC dbo.AddOrder '06022544  ','0003',' ',38769.5, 'TIMKEN EUROPE', @OrderID OUTPUT
EXEC dbo.AddOrder '06022545  ','0001',' ',38775.5, 'WELL-PACK AG', @OrderID OUTPUT
EXEC dbo.AddOrder '06022546  ','0001',' ',38775.5, 'WELL-PACK AG', @OrderID OUTPUT
EXEC dbo.AddOrder '06022548  ','0001',' ',38777.5, 'UDO ZIER GMBH', @OrderID OUTPUT
EXEC dbo.AddOrder '06022550  ','0001',' ',38767.5, 'DS SMITH KAYPAC', @OrderID OUTPUT
EXEC dbo.AddOrder '06022552  ','0001',' ',38787.5, 'PEUGEOT CITROEN AUTOMOBI', @OrderID OUTPUT
EXEC dbo.AddOrder '06022553  ','0001',' ',38776.5, 'PEUGEOT CITROEN AUTOMOBI', @OrderID OUTPUT
EXEC dbo.AddOrder '06022554  ','0001',' ',38776.5, 'PEUGEOT CITROEN AUTOMOBI', @OrderID OUTPUT
EXEC dbo.AddOrder '06022555  ','0001',' ',38781.5, 'STE ALSA-CORK', @OrderID OUTPUT
EXEC dbo.AddOrder '06022556  ','0001',' ',38775.5, 'STE ALSA-CORK', @OrderID OUTPUT
EXEC dbo.AddOrder '06022560  ','0001',' ',38766.5, 'STE SIMU', @OrderID OUTPUT
EXEC dbo.AddOrder '06022562  ','0001',' ',38769.5, 'OTTO RAUHUT GMBH & CO', @OrderID OUTPUT
EXEC dbo.AddOrder '06022563  ','0001',' ',38775.5, 'DEKKER PACKAGING B.V.', @OrderID OUTPUT
EXEC dbo.AddOrder '06022564  ','0001',' ',38780.5, 'TECUMSEH EUROPE S.A.', @OrderID OUTPUT
EXEC dbo.AddOrder '06022570  ','0001',' ',38776.5, 'TITANITE SA', @OrderID OUTPUT
EXEC dbo.AddOrder '06022571  ','0001',' ',38776.5, 'TITANITE SA', @OrderID OUTPUT
EXEC dbo.AddOrder '06022573  ','0001',' ',38783.5, 'PERSOON VLEESWARENFABRIE', @OrderID OUTPUT
EXEC dbo.AddOrder '06022575  ','0001',' ',38825.5, 'PERSOON VLEESWARENFABRIE', @OrderID OUTPUT
EXEC dbo.AddOrder '06022576  ','0001',' ',38769.5, 'DS SMITH KAYSERSBERG', @OrderID OUTPUT
EXEC dbo.AddOrder '06022577  ','0001',' ',38770.5, 'DS SMITH KAYSERSBERG', @OrderID OUTPUT
EXEC dbo.AddOrder '06022579  ','0001',' ',38781.5, 'PEUGEOT CITROEN AUTOMOBI', @OrderID OUTPUT
EXEC dbo.AddOrder '06022584  ','0001',' ',38788.5, 'W. WIRTH GMBH', @OrderID OUTPUT
EXEC dbo.AddOrder '06022587  ','0001',' ',38759.5, 'P&G INTERNATIONAL OPERAT', @OrderID OUTPUT
EXEC dbo.AddOrder '06022588  ','0001',' ',38782.5, 'DU PONT DE NEMOURS (FRAN', @OrderID OUTPUT
EXEC dbo.AddOrder '06022590  ','0001',' ',38763.5, 'P&G INTERNATIONAL OPERAT', @OrderID OUTPUT
EXEC dbo.AddOrder '06022591  ','0001',' ',38780.5, 'DU PONT DE NEMOURS (FRAN', @OrderID OUTPUT
EXEC dbo.AddOrder '06022591  ','0001','a',38780.5, 'DU PONT DE NEMOURS (FRAN', @OrderID OUTPUT
EXEC dbo.AddOrder '06022593  ','0001',' ',38768.5, 'DS SMITH KAYPAC', @OrderID OUTPUT
EXEC dbo.AddOrder '06022599  ','0001',' ',38768.5, 'W. WIRTH GMBH', @OrderID OUTPUT
EXEC dbo.AddOrder '06022602  ','0001',' ',38770.5, 'CATEM S.A', @OrderID OUTPUT
EXEC dbo.AddOrder '06022603  ','0001',' ',38770.5, 'CATEM S.A', @OrderID OUTPUT
EXEC dbo.AddOrder '06022605  ','0001',' ',38776.5, 'C.2.P.', @OrderID OUTPUT
EXEC dbo.AddOrder '06022606  ','0001',' ',38776.5, 'C.2.P.', @OrderID OUTPUT
EXEC dbo.AddOrder '06022607  ','0001',' ',38776.5, 'C.2.P.', @OrderID OUTPUT
EXEC dbo.AddOrder '06022608  ','0001',' ',38812.5, 'C.2.P.', @OrderID OUTPUT
EXEC dbo.AddOrder '06022609  ','0001',' ',38812.5, 'C.2.P.', @OrderID OUTPUT
EXEC dbo.AddOrder '06022611  ','0001',' ',38770.5, 'STE INDUST.DE LEVURE FAL', @OrderID OUTPUT
EXEC dbo.AddOrder '06022612  ','0001',' ',38774.5, 'B.V.ALVERIMPORT', @OrderID OUTPUT
EXEC dbo.AddOrder '06022614  ','0001',' ',38777.5, 'GEORGIA-PACIFIC FRANCE', @OrderID OUTPUT
EXEC dbo.AddOrder '06022615  ','0001',' ',38777.5, 'GEORGIA-PACIFIC FRANCE', @OrderID OUTPUT
EXEC dbo.AddOrder '06022617  ','0001',' ',38784.5, 'GEORGIA-PACIFIC FRANCE', @OrderID OUTPUT
EXEC dbo.AddOrder '06022619  ','0001',' ',38773.5, 'HEXCEL FABRICS S.A.', @OrderID OUTPUT
EXEC dbo.AddOrder '06022623  ','0001',' ',38775.5, 'BRASSERIE FISCHER SA', @OrderID OUTPUT
EXEC dbo.AddOrder '06022627  ','0001',' ',38773.5, 'BRASSERIES HEINEKEN SA', @OrderID OUTPUT
EXEC dbo.AddOrder '06022627  ','0001','a',38773.5, 'BRASSERIES HEINEKEN SA', @OrderID OUTPUT
EXEC dbo.AddOrder '06022630  ','0001',' ',38770.5, 'BRASSERIES HEINEKEN SA', @OrderID OUTPUT
EXEC dbo.AddOrder '06022631  ','0001',' ',38769.5, 'PRESTAPLAST INDUSTRIE', @OrderID OUTPUT
EXEC dbo.AddOrder '06022632  ','0001',' ',38773.5, 'PRESTAPLAST INDUSTRIE', @OrderID OUTPUT
EXEC dbo.AddOrder '06022634  ','0001',' ',38773.5, 'BRASSERIES HEINEKEN SA', @OrderID OUTPUT
EXEC dbo.AddOrder '06022636  ','0001',' ',38769.5, 'R. BOURGEOIS S.R', @OrderID OUTPUT
EXEC dbo.AddOrder '06022637  ','0001',' ',38782.5, 'R. BOURGEOIS S.R', @OrderID OUTPUT
EXEC dbo.AddOrder '06022638  ','0001',' ',38787.5, 'R. BOURGEOIS S.R', @OrderID OUTPUT
EXEC dbo.AddOrder '06022641  ','0001',' ',38774.5, 'NESTLE SUISSE S.A.', @OrderID OUTPUT
EXEC dbo.AddOrder '06022643  ','0001',' ',38773.5, 'SCHWEITZER S.A.', @OrderID OUTPUT
EXEC dbo.AddOrder '06022645  ','0001',' ',38781.5, 'SCHWEITZER S.A.', @OrderID OUTPUT
EXEC dbo.AddOrder '06022647  ','0001',' ',38787.5, 'NESTLE WATERS SUPPLY EST', @OrderID OUTPUT
EXEC dbo.AddOrder '06022649  ','0001',' ',38773.5, 'NESTLE WATERS SUPPLY EST', @OrderID OUTPUT
EXEC dbo.AddOrder '06022651  ','0001',' ',38775.5, 'RENOLIT AG', @OrderID OUTPUT
EXEC dbo.AddOrder '06022653  ','0001',' ',38767.5, 'COGESAL MIKO-FSEUR 58488', @OrderID OUTPUT
EXEC dbo.AddOrder '06022654  ','0001',' ',38783.5, 'EXEL NV', @OrderID OUTPUT
EXEC dbo.AddOrder '06022657  ','0001',' ',38789.5, 'SAEM DE RIBEAUVILLE', @OrderID OUTPUT
EXEC dbo.AddOrder '06022658  ','0001',' ',38789.5, 'SAEM DE RIBEAUVILLE', @OrderID OUTPUT
EXEC dbo.AddOrder '06022659  ','0001',' ',38781.5, 'SAEM DE RIBEAUVILLE', @OrderID OUTPUT
EXEC dbo.AddOrder '06022660  ','0001',' ',38773.5, 'RAOUT BOIS USINES', @OrderID OUTPUT
EXEC dbo.AddOrder '06022663  ','0001',' ',38766.5, 'NESTLE WATERS SUPPLY EST', @OrderID OUTPUT
EXEC dbo.AddOrder '06022665  ','0001',' ',38766.5, 'NESTLE WATERS SUPPLY EST', @OrderID OUTPUT
EXEC dbo.AddOrder '06022667  ','0001',' ',38766.5, 'NESTLE WATERS SUPPLY EST', @OrderID OUTPUT
EXEC dbo.AddOrder '06022669  ','0001',' ',38767.5, 'NESTLE WATERS SUPPLY EST', @OrderID OUTPUT
EXEC dbo.AddOrder '06022671  ','0001',' ',38767.5, 'NESTLE WATERS SUPPLY EST', @OrderID OUTPUT
EXEC dbo.AddOrder '06022673  ','0001',' ',38767.5, 'NESTLE WATERS SUPPLY EST', @OrderID OUTPUT
EXEC dbo.AddOrder '06022675  ','0001',' ',38768.5, 'NESTLE WATERS SUPPLY EST', @OrderID OUTPUT
EXEC dbo.AddOrder '06022677  ','0001',' ',38768.5, 'NESTLE WATERS SUPPLY EST', @OrderID OUTPUT
EXEC dbo.AddOrder '06022679  ','0001',' ',38769.5, 'NESTLE WATERS SUPPLY EST', @OrderID OUTPUT
EXEC dbo.AddOrder '06022681  ','0001',' ',38768.5, 'NESTLE WATERS SUPPLY EST', @OrderID OUTPUT
EXEC dbo.AddOrder '06022683  ','0001',' ',38769.5, 'NESTLE WATERS SUPPLY EST', @OrderID OUTPUT
EXEC dbo.AddOrder '06022685  ','0001',' ',38770.5, 'NESTLE WATERS SUPPLY EST', @OrderID OUTPUT
EXEC dbo.AddOrder '06022687  ','0001',' ',38770.5, 'NESTLE WATERS SUPPLY EST', @OrderID OUTPUT
EXEC dbo.AddOrder '06022689  ','0001',' ',38776.5, 'NESTLE WATERS SUPPLY EST', @OrderID OUTPUT
EXEC dbo.AddOrder '06022691  ','0001',' ',38782.5, 'NESTLE WATERS SUPPLY EST', @OrderID OUTPUT
EXEC dbo.AddOrder '06022693  ','0001',' ',38775.5, 'NESTLE WATERS SUPPLY EST', @OrderID OUTPUT
EXEC dbo.AddOrder '06022695  ','0001',' ',38769.5, 'NESTLE WATERS SUPPLY EST', @OrderID OUTPUT
EXEC dbo.AddOrder '06022697  ','0001',' ',38774.5, 'NESTLE WATERS SUPPLY EST', @OrderID OUTPUT
EXEC dbo.AddOrder '06022699  ','0001',' ',38775.5, 'NESTLE WATERS SUPPLY EST', @OrderID OUTPUT
EXEC dbo.AddOrder '06022701  ','0001',' ',38774.5, 'NESTLE WATERS SUPPLY EST', @OrderID OUTPUT
EXEC dbo.AddOrder '06022703  ','0001',' ',38769.5, 'NESTLE WATERS SUPPLY EST', @OrderID OUTPUT
EXEC dbo.AddOrder '06022704  ','0001',' ',38775.5, 'INTERGESTION', @OrderID OUTPUT
EXEC dbo.AddOrder '06022705  ','0001',' ',38773.5, 'PEUGEOT CITROEN AUTOMOBI', @OrderID OUTPUT
EXEC dbo.AddOrder '06022705  ','0001','a',38773.5, 'PEUGEOT CITROEN AUTOMOBI', @OrderID OUTPUT
EXEC dbo.AddOrder '06022705  ','0001','b',38773.5, 'PEUGEOT CITROEN AUTOMOBI', @OrderID OUTPUT
EXEC dbo.AddOrder '06022707  ','0001',' ',38770.5, 'DS SMITH KAYSERSBERG', @OrderID OUTPUT
EXEC dbo.AddOrder '06022709  ','0001',' ',38775.5, 'BRASSERIE FISCHER SA', @OrderID OUTPUT
EXEC dbo.AddOrder '06022712  ','0001',' ',38767.5, 'S.M.A.E.    (EDI)', @OrderID OUTPUT
EXEC dbo.AddOrder '06022714  ','0001',' ',38767.5, 'S.M.A.E.    (EDI)', @OrderID OUTPUT
EXEC dbo.AddOrder '06022716  ','0001',' ',38770.5, 'S.M.A.E. ZI METZ BORNY (', @OrderID OUTPUT
EXEC dbo.AddOrder '06022718  ','0001',' ',38770.5, 'S.M.A.E. ZI METZ BORNY (', @OrderID OUTPUT
EXEC dbo.AddOrder '06022719  ','0001',' ',38770.5, 'S.M.A.E. ZI METZ BORNY (', @OrderID OUTPUT
EXEC dbo.AddOrder '06022720  ','0001',' ',38770.5, 'S.M.A.E. ZI METZ BORNY (', @OrderID OUTPUT
EXEC dbo.AddOrder '06022721  ','0001',' ',38770.5, 'S.M.A.E. ZI METZ BORNY (', @OrderID OUTPUT
EXEC dbo.AddOrder '06022722  ','0001',' ',38770.5, 'S.M.A.E. ZI METZ BORNY (', @OrderID OUTPUT
EXEC dbo.AddOrder '06022724  ','0001',' ',38774.5, 'S.M.A.E. ZI METZ BORNY (', @OrderID OUTPUT
EXEC dbo.AddOrder '06022726  ','0001',' ',38774.5, 'S.M.A.E. ZI METZ BORNY (', @OrderID OUTPUT
EXEC dbo.AddOrder '06022727  ','0001',' ',38774.5, 'S.M.A.E. ZI METZ BORNY (', @OrderID OUTPUT
EXEC dbo.AddOrder '06022728  ','0001',' ',38774.5, 'S.M.A.E. ZI METZ BORNY (', @OrderID OUTPUT
EXEC dbo.AddOrder '06022729  ','0001',' ',38774.5, 'S.M.A.E. ZI METZ BORNY (', @OrderID OUTPUT
EXEC dbo.AddOrder '06022730  ','0001',' ',38774.5, 'S.M.A.E. ZI METZ BORNY (', @OrderID OUTPUT
EXEC dbo.AddOrder '06022731  ','0001',' ',38780.5, 'WELL-PACK AG', @OrderID OUTPUT
EXEC dbo.AddOrder '06022734  ','0001',' ',38788.5, 'STE SANTOS S.A.', @OrderID OUTPUT
EXEC dbo.AddOrder '06022736  ','0001',' ',38773.5, 'DS SMITH KAYPAC', @OrderID OUTPUT
EXEC dbo.AddOrder '06022736  ','0001','a',38789.5, 'DS SMITH KAYPAC', @OrderID OUTPUT
EXEC dbo.AddOrder '06022737  ','0001',' ',38773.5, 'DS SMITH KAYPAC', @OrderID OUTPUT
EXEC dbo.AddOrder '06022738  ','0001',' ',38773.5, 'DS SMITH KAYPAC', @OrderID OUTPUT
EXEC dbo.AddOrder '06022738  ','0001','a',38773.5, 'DS SMITH KAYPAC', @OrderID OUTPUT
EXEC dbo.AddOrder '06022739  ','0001',' ',38784.5, 'SOMFY', @OrderID OUTPUT
EXEC dbo.AddOrder '06022741  ','0001',' ',38788.5, 'WELL-PACK AG', @OrderID OUTPUT
EXEC dbo.AddOrder '06022742  ','0001',' ',38788.5, 'WELL-PACK AG', @OrderID OUTPUT
EXEC dbo.AddOrder '06022743  ','0001',' ',38788.5, 'WELL-PACK AG', @OrderID OUTPUT
EXEC dbo.AddOrder '06022748  ','0001',' ',38774.5, 'VIESSMANN', @OrderID OUTPUT
EXEC dbo.AddOrder '06022749  ','0001',' ',38776.5, 'JDW HOLDING GMBH', @OrderID OUTPUT
EXEC dbo.AddOrder '06022750  ','0001',' ',38782.5, 'JDW HOLDING GMBH', @OrderID OUTPUT
EXEC dbo.AddOrder '06022751  ','0001',' ',38782.5, 'JDW HOLDING GMBH', @OrderID OUTPUT
EXEC dbo.AddOrder '06022753  ','0001',' ',38783.5, 'CARTON PLUS', @OrderID OUTPUT
EXEC dbo.AddOrder '06022756  ','0001',' ',38776.5, 'BRASSERIE FISCHER SA', @OrderID OUTPUT
EXEC dbo.AddOrder '06022758  ','0001',' ',38774.5, 'P&G INTERNATIONAL OPERAT', @OrderID OUTPUT
EXEC dbo.AddOrder '06022759  ','0001',' ',38781.5, 'WELL-PACK AG', @OrderID OUTPUT
EXEC dbo.AddOrder '06022760  ','0001',' ',38769.5, 'PELLAT', @OrderID OUTPUT
EXEC dbo.AddOrder '06022763  ','0001',' ',38784.5, 'JTEKT AUTOMOBILE LYON', @OrderID OUTPUT
EXEC dbo.AddOrder '06022767  ','0001',' ',38775.5, 'JTEKT AUTOMOBILE LYON', @OrderID OUTPUT
EXEC dbo.AddOrder '06022773  ','0001',' ',38775.5, 'BRASSERIE FISCHER SA', @OrderID OUTPUT
EXEC dbo.AddOrder '06022775  ','0001',' ',38794.5, 'STE INDUST.DE LEVURE FAL', @OrderID OUTPUT
EXEC dbo.AddOrder '06022778  ','0001',' ',38803.5, 'STE INDUST.DE LEVURE FAL', @OrderID OUTPUT
EXEC dbo.AddOrder '06022780  ','0001',' ',38761.5, 'PATHEON', @OrderID OUTPUT
EXEC dbo.AddOrder '06022782  ','0001',' ',38782.5, 'STE INDUST.DE LEVURE FAL', @OrderID OUTPUT
EXEC dbo.AddOrder '06022784  ','0001',' ',38782.5, 'STE INDUST.DE LEVURE FAL', @OrderID OUTPUT
EXEC dbo.AddOrder '06022786  ','0001',' ',38782.5, 'STE INDUST.DE LEVURE FAL', @OrderID OUTPUT
EXEC dbo.AddOrder '06022787  ','0001',' ',38774.5, 'GEORGIA-PACIFIC FRANCE', @OrderID OUTPUT
EXEC dbo.AddOrder '06022790  ','0001',' ',38782.5, 'GEORGIA-PACIFIC FRANCE', @OrderID OUTPUT
EXEC dbo.AddOrder '06022791  ','0001',' ',38782.5, 'GEORGIA-PACIFIC FRANCE', @OrderID OUTPUT
EXEC dbo.AddOrder '06022792  ','0001',' ',38782.5, 'STE INDUST.DE LEVURE FAL', @OrderID OUTPUT
EXEC dbo.AddOrder '06022794  ','0001',' ',38802.5, 'STE INDUST.DE LEVURE FAL', @OrderID OUTPUT
EXEC dbo.AddOrder '06022796  ','0001',' ',38802.5, 'STE INDUST.DE LEVURE FAL', @OrderID OUTPUT
EXEC dbo.AddOrder '06022798  ','0001',' ',38802.5, 'STE INDUST.DE LEVURE FAL', @OrderID OUTPUT
EXEC dbo.AddOrder '06022800  ','0001',' ',38787.5, 'STE INDUST.DE LEVURE FAL', @OrderID OUTPUT
EXEC dbo.AddOrder '06022802  ','0001',' ',38787.5, 'STE INDUST.DE LEVURE FAL', @OrderID OUTPUT
EXEC dbo.AddOrder '06022804  ','0001',' ',38795.5, 'STE INDUST.DE LEVURE FAL', @OrderID OUTPUT
EXEC dbo.AddOrder '06022806  ','0001',' ',38776.5, 'STE INDUST.DE LEVURE FAL', @OrderID OUTPUT
EXEC dbo.AddOrder '06022808  ','0001',' ',38787.5, 'STE INDUST.DE LEVURE FAL', @OrderID OUTPUT
EXEC dbo.AddOrder '06022814  ','0001',' ',38776.5, 'SCHWEITZER S.A.', @OrderID OUTPUT
EXEC dbo.AddOrder '06022815  ','0001',' ',38783.5, 'DAIMLER CHRYSLER AG (AG)', @OrderID OUTPUT
EXEC dbo.AddOrder '06022816  ','0001',' ',38783.5, 'DAIMLER CHRYSLER AG (AG)', @OrderID OUTPUT
EXEC dbo.AddOrder '06022817  ','0001',' ',38777.5, 'DAIMLER CHRYSLER AG (AG)', @OrderID OUTPUT
EXEC dbo.AddOrder '06022818  ','0001',' ',38774.5, 'DAIMLER CHRYSLER AG (AG)', @OrderID OUTPUT
EXEC dbo.AddOrder '06022819  ','0001',' ',38782.5, 'DAIMLER CHRYSLER AG (AG)', @OrderID OUTPUT
EXEC dbo.AddOrder '06022823  ','0001',' ',38769.5, 'CART.EMBAL. RHONE ALPES', @OrderID OUTPUT
EXEC dbo.AddOrder '06022826  ','0001',' ',38775.5, 'K O R D E L  ANTRIEBSTEC', @OrderID OUTPUT
EXEC dbo.AddOrder '06022828  ','0001',' ',38775.5, 'SCHWARZWAELDER TEXTILWER', @OrderID OUTPUT
EXEC dbo.AddOrder '06022828  ','0001','a',38775.5, 'SCHWARZWAELDER TEXTILWER', @OrderID OUTPUT
EXEC dbo.AddOrder '06022831  ','0001',' ',38787.5, 'DS SMITH KAYPAC', @OrderID OUTPUT
EXEC dbo.AddOrder '06022834  ','0001',' ',38769.5, 'B.V.ALVERIMPORT', @OrderID OUTPUT
EXEC dbo.AddOrder '06022836  ','0001',' ',38770.5, 'HORN VERPACKUNG GMBH', @OrderID OUTPUT
EXEC dbo.AddOrder '06022838  ','0001',' ',38775.5, 'RENOLIT AG', @OrderID OUTPUT
EXEC dbo.AddOrder '06022841  ','0001',' ',38762.5, 'JTEKT AUTOMOBILE', @OrderID OUTPUT
EXEC dbo.AddOrder '06022842  ','0001',' ',38782.5, 'ED.FRIEDRICH & CO GMBH', @OrderID OUTPUT
EXEC dbo.AddOrder '06022843  ','0001',' ',38769.5, 'SCHLIERBACHER KARTONAGEN', @OrderID OUTPUT
EXEC dbo.AddOrder '06022845  ','0001',' ',38782.5, 'STOEBER ANTRIEBSTECHNIK', @OrderID OUTPUT
EXEC dbo.AddOrder '06022848  ','0001',' ',38769.5, 'CART.EMBAL. RHONE ALPES', @OrderID OUTPUT
EXEC dbo.AddOrder '06022849  ','0001',' ',38769.5, 'CART.EMBAL. RHONE ALPES', @OrderID OUTPUT
EXEC dbo.AddOrder '06022849  ','0002',' ',38769.5, 'CART.EMBAL. RHONE ALPES', @OrderID OUTPUT
EXEC dbo.AddOrder '06022849  ','0003',' ',38770.5, 'CART.EMBAL. RHONE ALPES', @OrderID OUTPUT
EXEC dbo.AddOrder '06022849  ','0004',' ',38770.5, 'CART.EMBAL. RHONE ALPES', @OrderID OUTPUT
EXEC dbo.AddOrder '06022851  ','0001',' ',38776.5, 'DICESA SA', @OrderID OUTPUT
EXEC dbo.AddOrder '06022852  ','0001',' ',38781.5, 'DICESA SA', @OrderID OUTPUT
EXEC dbo.AddOrder '06022853  ','0001',' ',38784.5, 'DICESA SA', @OrderID OUTPUT
EXEC dbo.AddOrder '06022853  ','0001','a',38784.5, 'DICESA SA', @OrderID OUTPUT
EXEC dbo.AddOrder '06022854  ','0001',' ',38788.5, 'DICESA SA', @OrderID OUTPUT
EXEC dbo.AddOrder '06022855  ','0001',' ',38796.5, 'DICESA SA', @OrderID OUTPUT
EXEC dbo.AddOrder '06022856  ','0001',' ',38774.5, 'DS SMITH KAYSERSBERG', @OrderID OUTPUT
EXEC dbo.AddOrder '06022857  ','0001',' ',38780.5, 'REHAU AG & CO', @OrderID OUTPUT
EXEC dbo.AddOrder '06022857  ','0002',' ',38784.5, 'REHAU AG & CO', @OrderID OUTPUT
EXEC dbo.AddOrder '06022857  ','0003',' ',38776.5, 'REHAU AG & CO', @OrderID OUTPUT
EXEC dbo.AddOrder '06022857  ','0004',' ',38777.5, 'REHAU AG & CO', @OrderID OUTPUT
EXEC dbo.AddOrder '06022862  ','0001',' ',38770.5, 'S.M.A.E. ZI METZ BORNY (', @OrderID OUTPUT
EXEC dbo.AddOrder '06022863  ','0001',' ',38774.5, 'S.M.A.E. ZI METZ BORNY (', @OrderID OUTPUT
EXEC dbo.AddOrder '06022864  ','0001',' ',38777.5, 'S.M.A.E. ZI METZ BORNY (', @OrderID OUTPUT
EXEC dbo.AddOrder '06022865  ','0001',' ',38784.5, 'S.M.A.E. ZI METZ BORNY (', @OrderID OUTPUT
EXEC dbo.AddOrder '06022866  ','0001',' ',38788.5, 'S.M.A.E. ZI METZ BORNY (', @OrderID OUTPUT
EXEC dbo.AddOrder '06022867  ','0001',' ',38791.5, 'S.M.A.E. ZI METZ BORNY (', @OrderID OUTPUT
EXEC dbo.AddOrder '06022868  ','0001',' ',38795.5, 'S.M.A.E. ZI METZ BORNY (', @OrderID OUTPUT
EXEC dbo.AddOrder '06022869  ','0001',' ',38798.5, 'S.M.A.E. ZI METZ BORNY (', @OrderID OUTPUT
EXEC dbo.AddOrder '06022871  ','0001',' ',38770.5, 'S.M.A.E. ZI METZ BORNY (', @OrderID OUTPUT
EXEC dbo.AddOrder '06022872  ','0001',' ',38774.5, 'S.M.A.E. ZI METZ BORNY (', @OrderID OUTPUT
EXEC dbo.AddOrder '06022873  ','0001',' ',38777.5, 'S.M.A.E. ZI METZ BORNY (', @OrderID OUTPUT
EXEC dbo.AddOrder '06022874  ','0001',' ',38781.5, 'S.M.A.E. ZI METZ BORNY (', @OrderID OUTPUT
EXEC dbo.AddOrder '06022875  ','0001',' ',38784.5, 'S.M.A.E. ZI METZ BORNY (', @OrderID OUTPUT
EXEC dbo.AddOrder '06022876  ','0001',' ',38788.5, 'S.M.A.E. ZI METZ BORNY (', @OrderID OUTPUT
EXEC dbo.AddOrder '06022877  ','0001',' ',38791.5, 'S.M.A.E. ZI METZ BORNY (', @OrderID OUTPUT
EXEC dbo.AddOrder '06022878  ','0001',' ',38795.5, 'S.M.A.E. ZI METZ BORNY (', @OrderID OUTPUT
EXEC dbo.AddOrder '06022879  ','0001',' ',38802.5, 'S.M.A.E. ZI METZ BORNY (', @OrderID OUTPUT
EXEC dbo.AddOrder '06022881  ','0001',' ',38774.5, 'S.M.A.E. ZI METZ BORNY (', @OrderID OUTPUT
EXEC dbo.AddOrder '06022883  ','0001',' ',38774.5, 'S.M.A.E. ZI METZ BORNY (', @OrderID OUTPUT
EXEC dbo.AddOrder '06022884  ','0001',' ',38774.5, 'S.M.A.E. ZI METZ BORNY (', @OrderID OUTPUT
EXEC dbo.AddOrder '06022885  ','0001',' ',38774.5, 'S.M.A.E. ZI METZ BORNY (', @OrderID OUTPUT
EXEC dbo.AddOrder '06022886  ','0001',' ',38774.5, 'S.M.A.E. ZI METZ BORNY (', @OrderID OUTPUT
EXEC dbo.AddOrder '06022887  ','0001',' ',38774.5, 'S.M.A.E. ZI METZ BORNY (', @OrderID OUTPUT
EXEC dbo.AddOrder '06022889  ','0001',' ',38777.5, 'S.M.A.E. ZI METZ BORNY (', @OrderID OUTPUT
EXEC dbo.AddOrder '06022890  ','0001',' ',38777.5, 'S.M.A.E. ZI METZ BORNY (', @OrderID OUTPUT
EXEC dbo.AddOrder '06022891  ','0001',' ',38777.5, 'S.M.A.E. ZI METZ BORNY (', @OrderID OUTPUT
EXEC dbo.AddOrder '06022892  ','0001',' ',38777.5, 'S.M.A.E. ZI METZ BORNY (', @OrderID OUTPUT
EXEC dbo.AddOrder '06022893  ','0001',' ',38777.5, 'S.M.A.E. ZI METZ BORNY (', @OrderID OUTPUT
EXEC dbo.AddOrder '06022895  ','0001',' ',38777.5, 'S.M.A.E. ZI METZ BORNY (', @OrderID OUTPUT
EXEC dbo.AddOrder '06022896  ','0001',' ',38777.5, 'S.M.A.E. ZI METZ BORNY (', @OrderID OUTPUT
EXEC dbo.AddOrder '06022897  ','0001',' ',38777.5, 'S.M.A.E. ZI METZ BORNY (', @OrderID OUTPUT
EXEC dbo.AddOrder '06022898  ','0001',' ',38777.5, 'S.M.A.E. ZI METZ BORNY (', @OrderID OUTPUT
EXEC dbo.AddOrder '06022899  ','0001',' ',38777.5, 'S.M.A.E. ZI METZ BORNY (', @OrderID OUTPUT
EXEC dbo.AddOrder '06022900  ','0001',' ',38769.5, 'DS SMITH KAYPAC', @OrderID OUTPUT
EXEC dbo.AddOrder '06022901  ','0001',' ',38774.5, 'CDF EMBALLAGE SA', @OrderID OUTPUT
EXEC dbo.AddOrder '06022903  ','0001',' ',38787.5, 'LSR PRODUCTION', @OrderID OUTPUT
EXEC dbo.AddOrder '06022904  ','0002',' ',38770.5, 'NESTLE SUISSE S.A.', @OrderID OUTPUT
EXEC dbo.AddOrder '06022906  ','0001',' ',38781.5, 'DS SMITH KAYPAC', @OrderID OUTPUT
EXEC dbo.AddOrder '06022908  ','0001',' ',38795.5, 'MECANIQUE ET ENVIRONNEME', @OrderID OUTPUT
EXEC dbo.AddOrder '06022909  ','0001',' ',38782.5, 'TECUMSEH EUROPE S.A.', @OrderID OUTPUT
EXEC dbo.AddOrder '06022913  ','0001',' ',38776.5, 'THK MANUFACTURING OF EUR', @OrderID OUTPUT
EXEC dbo.AddOrder '06022914  ','0001',' ',38781.5, 'EGON HUEBLER', @OrderID OUTPUT
EXEC dbo.AddOrder '06022916  ','0001',' ',38788.5, 'KEY PLASTICS', @OrderID OUTPUT
EXEC dbo.AddOrder '06022917  ','0001',' ',38781.5, 'DS SMITH KAYPAC', @OrderID OUTPUT
EXEC dbo.AddOrder '06022918  ','0001',' ',38781.5, 'DS SMITH KAYPAC', @OrderID OUTPUT
EXEC dbo.AddOrder '06022919  ','0001',' ',38774.5, 'DS SMITH KAYPAC', @OrderID OUTPUT
EXEC dbo.AddOrder '06022919  ','0001','a',38775.5, 'DS SMITH KAYPAC', @OrderID OUTPUT
EXEC dbo.AddOrder '06022921  ','0001',' ',38774.5, 'S.M.S. - ALU SYSTEME', @OrderID OUTPUT
EXEC dbo.AddOrder '06022922  ','0001',' ',38770.5, 'SCHLIERBACHER KARTONAGEN', @OrderID OUTPUT
EXEC dbo.AddOrder '06022922  ','0001','a',38770.5, 'SCHLIERBACHER KARTONAGEN', @OrderID OUTPUT
EXEC dbo.AddOrder '06022926  ','0001',' ',38775.5, 'DS SMITH KAYSERSBERG', @OrderID OUTPUT
EXEC dbo.AddOrder '06022927  ','0001',' ',38777.5, 'SYMA-SYSTEM AG', @OrderID OUTPUT
EXEC dbo.AddOrder '06022928  ','0001',' ',38777.5, 'SYMA-SYSTEM AG', @OrderID OUTPUT
EXEC dbo.AddOrder '06022929  ','0001',' ',38776.5, 'DS SMITH KAYSERSBERG', @OrderID OUTPUT
EXEC dbo.AddOrder '06022934  ','0001',' ',38791.5, 'VIESSMANN', @OrderID OUTPUT
EXEC dbo.AddOrder '06022935  ','0001',' ',38784.5, 'PEUGEOT CITROEN AUTOMOBI', @OrderID OUTPUT
EXEC dbo.AddOrder '06022938  ','0001',' ',38769.5, 'CELLIER DES DAUPHINS', @OrderID OUTPUT
EXEC dbo.AddOrder '06022940  ','0001',' ',38782.5, 'ALPACK SA', @OrderID OUTPUT
EXEC dbo.AddOrder '06022941  ','0001',' ',38776.5, 'ALPACK SA', @OrderID OUTPUT
EXEC dbo.AddOrder '06022943  ','0001',' ',38770.5, 'VON ROLL ISOLA FRANCE', @OrderID OUTPUT
EXEC dbo.AddOrder '06022944  ','0001',' ',38769.5, 'HEIDE WERKSTAETTEN E.V.', @OrderID OUTPUT
EXEC dbo.AddOrder '06022947  ','0001',' ',38787.5, 'ATELIERS BUSCH & CIE', @OrderID OUTPUT
EXEC dbo.AddOrder '06022948  ','0001',' ',38776.5, 'ATELIERS BUSCH & CIE', @OrderID OUTPUT
EXEC dbo.AddOrder '06022951  ','0001',' ',38782.5, 'AEF ATELIER D''EM. FAULQU', @OrderID OUTPUT
EXEC dbo.AddOrder '06022952  ','0001',' ',38782.5, 'AEF ATELIER D''EM. FAULQU', @OrderID OUTPUT
EXEC dbo.AddOrder '06022954  ','0001',' ',38783.5, 'AEF ATELIER D''EM. FAULQU', @OrderID OUTPUT
EXEC dbo.AddOrder '06022954  ','0001','b',38783.5, 'AEF ATELIER D''EM. FAULQU', @OrderID OUTPUT
EXEC dbo.AddOrder '06022956  ','0001',' ',38775.5, 'ED.FRIEDRICH & CO GMBH', @OrderID OUTPUT
EXEC dbo.AddOrder '06022957  ','0001',' ',38784.5, 'D.P.F. DIFFUS.PREST.FIAB', @OrderID OUTPUT
EXEC dbo.AddOrder '06022958  ','0001',' ',38788.5, 'D.P.F. DIFFUS.PREST.FIAB', @OrderID OUTPUT
EXEC dbo.AddOrder '06022961  ','0001',' ',38770.5, 'REHAU INDUSTRIE SARL', @OrderID OUTPUT
EXEC dbo.AddOrder '06022964  ','0001',' ',38788.5, 'DIEFENBACH VERPACKUNGEN', @OrderID OUTPUT
EXEC dbo.AddOrder '06022968  ','0001',' ',38773.5, 'CARTONNAGES DREVET', @OrderID OUTPUT
EXEC dbo.AddOrder '06022969  ','0001',' ',38776.5, 'SCHNEIDER GMBH', @OrderID OUTPUT
EXEC dbo.AddOrder '06022971  ','0001',' ',38803.5, 'KONICA MINOLTA SUP.MANU.', @OrderID OUTPUT
EXEC dbo.AddOrder '06022972  ','0001',' ',38783.5, 'SOMFY', @OrderID OUTPUT
EXEC dbo.AddOrder '06022973  ','0001',' ',38775.5, 'COSMETIQUE ACTIVE DEUT.G', @OrderID OUTPUT
EXEC dbo.AddOrder '06022975  ','0001',' ',38773.5, 'NESTLE WATERS SUPPLY EST', @OrderID OUTPUT
EXEC dbo.AddOrder '06022975  ','0001','a',38776.5, 'NESTLE WATERS SUPPLY EST', @OrderID OUTPUT
EXEC dbo.AddOrder '06022977  ','0001',' ',38773.5, 'NESTLE WATERS SUPPLY EST', @OrderID OUTPUT
EXEC dbo.AddOrder '06022980  ','0001',' ',38780.5, 'NESTLE WATERS SUPPLY EST', @OrderID OUTPUT
EXEC dbo.AddOrder '06022980  ','0001','a',38780.5, 'NESTLE WATERS SUPPLY EST', @OrderID OUTPUT
EXEC dbo.AddOrder '06022980  ','0001','b',38787.5, 'NESTLE WATERS SUPPLY EST', @OrderID OUTPUT
EXEC dbo.AddOrder '06022982  ','0001',' ',38783.5, 'DUPONT DE NEMOURS ITALIA', @OrderID OUTPUT
EXEC dbo.AddOrder '06022983  ','0001',' ',38776.5, 'SOMFY', @OrderID OUTPUT
EXEC dbo.AddOrder '06022987  ','0001',' ',38788.5, 'NEUHAUSER', @OrderID OUTPUT
EXEC dbo.AddOrder '06022989  ','0001',' ',38791.5, 'NEUHAUSER', @OrderID OUTPUT
EXEC dbo.AddOrder '06022992  ','0001',' ',38795.5, 'NEUHAUSER', @OrderID OUTPUT
EXEC dbo.AddOrder '06022994  ','0001',' ',38787.5, 'NEUHAUSER', @OrderID OUTPUT
EXEC dbo.AddOrder '06022998  ','0001',' ',38795.5, 'CARTONNAGES DREVET', @OrderID OUTPUT
EXEC dbo.AddOrder '06023001  ','0001',' ',38777.5, 'B.V.ALVERIMPORT', @OrderID OUTPUT
EXEC dbo.AddOrder '06023001  ','0001','a',38777.5, 'B.V.ALVERIMPORT', @OrderID OUTPUT
EXEC dbo.AddOrder '06023001  ','0001','b',38777.5, 'B.V.ALVERIMPORT', @OrderID OUTPUT
EXEC dbo.AddOrder '06023001  ','0001','c',38777.5, 'B.V.ALVERIMPORT', @OrderID OUTPUT
EXEC dbo.AddOrder '06023002  ','0001',' ',38775.5, 'SCHWEITZER S.A.', @OrderID OUTPUT
EXEC dbo.AddOrder '06023004  ','0001',' ',38775.5, 'SCHWEITZER S.A.', @OrderID OUTPUT
EXEC dbo.AddOrder '06023006  ','0001',' ',38776.5, 'SCHWEITZER S.A.', @OrderID OUTPUT
EXEC dbo.AddOrder '06023008  ','0001',' ',38776.5, 'B.V.ALVERIMPORT', @OrderID OUTPUT
EXEC dbo.AddOrder '06023009  ','0001',' ',38776.5, 'SCHWEITZER S.A.', @OrderID OUTPUT
EXEC dbo.AddOrder '06023011  ','0001',' ',38773.5, 'CART.EMBAL. RHONE ALPES', @OrderID OUTPUT
EXEC dbo.AddOrder '06023014  ','0001',' ',38801.5, 'W. WIRTH GMBH', @OrderID OUTPUT
EXEC dbo.AddOrder '06023015  ','0001',' ',38774.5, 'W. WIRTH GMBH', @OrderID OUTPUT
EXEC dbo.AddOrder '06023017  ','0001',' ',38787.5, 'GEORGIA-PACIFIC FRANCE', @OrderID OUTPUT
EXEC dbo.AddOrder '06023019  ','0001',' ',38788.5, 'GEORGIA-PACIFIC FRANCE', @OrderID OUTPUT
EXEC dbo.AddOrder '06023021  ','0001',' ',38775.5, 'THOMPAC GMBH', @OrderID OUTPUT
EXEC dbo.AddOrder '06023024  ','0001',' ',38788.5, 'SA. BOULANGERIE NEUHAUSE', @OrderID OUTPUT
EXEC dbo.AddOrder '06023025  ','0001',' ',38788.5, 'SA. BOULANGERIE NEUHAUSE', @OrderID OUTPUT
EXEC dbo.AddOrder '06023025  ','0001','a',38788.5, 'SA. BOULANGERIE NEUHAUSE', @OrderID OUTPUT
EXEC dbo.AddOrder '06023025  ','0001','b',38788.5, 'SA. BOULANGERIE NEUHAUSE', @OrderID OUTPUT
EXEC dbo.AddOrder '06023026  ','0001',' ',38783.5, 'WELL-PACK AG', @OrderID OUTPUT
EXEC dbo.AddOrder '06023029  ','0001',' ',38770.5, 'BRASSERIES KRONENBOURG 5', @OrderID OUTPUT
EXEC dbo.AddOrder '06023031  ','0001',' ',38770.5, 'BRASSERIES KRONENBOURG 5', @OrderID OUTPUT
EXEC dbo.AddOrder '06023033  ','0001',' ',38769.5, 'BRASSERIES KRONENBOURG 5', @OrderID OUTPUT
EXEC dbo.AddOrder '06023035  ','0001',' ',38770.5, 'NOVARTIS CONSUMER HEALTH', @OrderID OUTPUT
EXEC dbo.AddOrder '06023036  ','0001',' ',38770.5, 'NOVARTIS CONSUMER HEALTH', @OrderID OUTPUT
EXEC dbo.AddOrder '06023037  ','0001',' ',38768.5, 'NOVARTIS CONSUMER HEALTH', @OrderID OUTPUT
EXEC dbo.AddOrder '06023038  ','0001',' ',38768.5, 'NOVARTIS CONSUMER HEALTH', @OrderID OUTPUT
EXEC dbo.AddOrder '06023039  ','0001',' ',38770.5, 'NOVARTIS CONSUMER HEALTH', @OrderID OUTPUT
EXEC dbo.AddOrder '06023041  ','0001',' ',38768.5, 'NOVARTIS CONSUMER HEALTH', @OrderID OUTPUT
EXEC dbo.AddOrder '06023047  ','0001',' ',38776.5, 'WIRTH VERPACKUNGEN GMBH', @OrderID OUTPUT
EXEC dbo.AddOrder '06023047  ','0001','a',38776.5, 'WIRTH VERPACKUNGEN GMBH', @OrderID OUTPUT
EXEC dbo.AddOrder '06023050  ','0001',' ',38788.5, 'STE ALSA-CORK', @OrderID OUTPUT
EXEC dbo.AddOrder '06023053  ','0001',' ',38774.5, 'STE ALSA-CORK', @OrderID OUTPUT
EXEC dbo.AddOrder '06023055  ','0001',' ',38773.5, 'NESTLE WATERS SUPPLY EST', @OrderID OUTPUT
EXEC dbo.AddOrder '06023057  ','0001',' ',38769.5, 'NESTLE WATERS SUPPLY EST', @OrderID OUTPUT
EXEC dbo.AddOrder '06023059  ','0001',' ',38767.5, 'NESTLE WATERS SUPPLY EST', @OrderID OUTPUT
EXEC dbo.AddOrder '06023061  ','0001',' ',38768.5, 'NESTLE WATERS SUPPLY EST', @OrderID OUTPUT
EXEC dbo.AddOrder '06023065  ','0001',' ',38776.5, 'NESTLE WATERS SUPPLY EST', @OrderID OUTPUT
EXEC dbo.AddOrder '06023067  ','0001',' ',38773.5, 'NESTLE WATERS SUPPLY EST', @OrderID OUTPUT
EXEC dbo.AddOrder '06023069  ','0001',' ',38767.5, 'NESTLE WATERS SUPPLY EST', @OrderID OUTPUT
EXEC dbo.AddOrder '06023075  ','0001',' ',38773.5, 'MEPHISTO', @OrderID OUTPUT
EXEC dbo.AddOrder '06023075  ','0002',' ',38773.5, 'MEPHISTO', @OrderID OUTPUT
EXEC dbo.AddOrder '06023078  ','0001',' ',38787.5, 'ALUSOR', @OrderID OUTPUT
EXEC dbo.AddOrder '06023079  ','0001',' ',38788.5, 'ATELIERS BUSCH & CIE', @OrderID OUTPUT
EXEC dbo.AddOrder '06023081  ','0001',' ',38783.5, 'SCHAEFFLER FRANCE', @OrderID OUTPUT
EXEC dbo.AddOrder '06023083  ','0001',' ',38780.5, 'SCHAEFFLER FRANCE', @OrderID OUTPUT
EXEC dbo.AddOrder '06023085  ','0001',' ',38777.5, 'NESTLE WATERS SUPPLY EST', @OrderID OUTPUT
EXEC dbo.AddOrder '06023087  ','0001',' ',38776.5, 'NESTLE WATERS SUPPLY EST', @OrderID OUTPUT
EXEC dbo.AddOrder '06023089  ','0001',' ',38769.5, 'BRASSERIES KRONENBOURG 5', @OrderID OUTPUT
EXEC dbo.AddOrder '06023092  ','0001',' ',38775.5, 'HORN VERPACKUNG GMBH', @OrderID OUTPUT
EXEC dbo.AddOrder '06023097  ','0001',' ',38768.5, 'BRASSERIES KRONENBOURG 5', @OrderID OUTPUT
EXEC dbo.AddOrder '06023099  ','0001',' ',38768.5, 'BRASSERIES KRONENBOURG 5', @OrderID OUTPUT
EXEC dbo.AddOrder '06023101  ','0001',' ',38768.5, 'BRASSERIES KRONENBOURG 5', @OrderID OUTPUT
EXEC dbo.AddOrder '06023103  ','0001',' ',38769.5, 'BRASSERIES KRONENBOURG 5', @OrderID OUTPUT
EXEC dbo.AddOrder '06023103  ','0001','a',38774.5, 'BRASSERIES KRONENBOURG 5', @OrderID OUTPUT
EXEC dbo.AddOrder '06023105  ','0001',' ',38769.5, 'BRASSERIES KRONENBOURG 5', @OrderID OUTPUT
EXEC dbo.AddOrder '06023107  ','0001',' ',38770.5, 'BRASSERIES KRONENBOURG 5', @OrderID OUTPUT
EXEC dbo.AddOrder '06023109  ','0001',' ',38770.5, 'BRASSERIES KRONENBOURG 5', @OrderID OUTPUT
EXEC dbo.AddOrder '06023110  ','0001',' ',38787.5, 'CDF EMBALLAGE SA', @OrderID OUTPUT
EXEC dbo.AddOrder '06023112  ','0001',' ',38783.5, 'CDF EMBALLAGE SA', @OrderID OUTPUT
EXEC dbo.AddOrder '06023115  ','0001',' ',38781.5, 'DS SMITH KAYSERSBERG', @OrderID OUTPUT
EXEC dbo.AddOrder '06023116  ','0001',' ',38777.5, 'DS SMITH KAYSERSBERG', @OrderID OUTPUT
EXEC dbo.AddOrder '06023118  ','0001',' ',38787.5, 'DAIMLER CHRYSLER AG (AG)', @OrderID OUTPUT
EXEC dbo.AddOrder '06023119  ','0001',' ',38787.5, 'DAIMLER CHRYSLER AG (AG)', @OrderID OUTPUT
EXEC dbo.AddOrder '06023120  ','0001',' ',38781.5, 'DAIMLER CHRYSLER AG (AG)', @OrderID OUTPUT
EXEC dbo.AddOrder '06023123  ','0001',' ',38782.5, 'DICESA SA', @OrderID OUTPUT
EXEC dbo.AddOrder '06023126  ','0001',' ',38795.5, 'DICESA SA', @OrderID OUTPUT
EXEC dbo.AddOrder '06023128  ','0001',' ',38787.5, 'S.A. V 33', @OrderID OUTPUT
EXEC dbo.AddOrder '06023129  ','0001',' ',38782.5, 'DICESA SA', @OrderID OUTPUT
EXEC dbo.AddOrder '06023130  ','0001',' ',38795.5, 'DICESA SA', @OrderID OUTPUT
EXEC dbo.AddOrder '06023133  ','0001',' ',38777.5, 'WELL-PACK AG', @OrderID OUTPUT
EXEC dbo.AddOrder '06023134  ','0001',' ',38783.5, 'DICESA SA', @OrderID OUTPUT
EXEC dbo.AddOrder '06023137  ','0001',' ',38775.5, 'WELL-PACK AG', @OrderID OUTPUT
EXEC dbo.AddOrder '06023140  ','0001',' ',38776.5, 'ED.FRIEDRICH & CO GMBH', @OrderID OUTPUT
EXEC dbo.AddOrder '06023145  ','0001',' ',38788.5, 'CIE FRANCO-SUISSE', @OrderID OUTPUT
EXEC dbo.AddOrder '06023152  ','0001',' ',38770.5, 'CART.EMBAL. RHONE ALPES', @OrderID OUTPUT
EXEC dbo.AddOrder '06023154  ','0001',' ',38768.5, 'NESTLE WATERS SUPPLY EST', @OrderID OUTPUT
EXEC dbo.AddOrder '06023156  ','0001',' ',38769.5, 'NESTLE WATERS SUPPLY EST', @OrderID OUTPUT
EXEC dbo.AddOrder '06023159  ','0001',' ',38770.5, 'NESTLE WATERS SUPPLY EST', @OrderID OUTPUT
EXEC dbo.AddOrder '06023161  ','0001',' ',38795.5, 'STE INDUST.DE LEVURE FAL', @OrderID OUTPUT
EXEC dbo.AddOrder '06023163  ','0001',' ',38775.5, 'COGESAL MIKO-FSEUR 58488', @OrderID OUTPUT
EXEC dbo.AddOrder '06023164  ','0001',' ',38776.5, 'COGESAL MIKO-FSEUR 58488', @OrderID OUTPUT
EXEC dbo.AddOrder '06023166  ','0001',' ',38777.5, 'NESTLE WATERS SUPPLY EST', @OrderID OUTPUT
EXEC dbo.AddOrder '06023166  ','0001','a',38783.5, 'NESTLE WATERS SUPPLY EST', @OrderID OUTPUT
EXEC dbo.AddOrder '06023168  ','0001',' ',38773.5, 'COGESAL MIKO-FSEUR 58488', @OrderID OUTPUT
EXEC dbo.AddOrder '06023169  ','0001',' ',38775.5, 'COGESAL MIKO-FSEUR 58488', @OrderID OUTPUT
EXEC dbo.AddOrder '06023170  ','0001',' ',38776.5, 'COGESAL MIKO-FSEUR 58488', @OrderID OUTPUT
EXEC dbo.AddOrder '06023172  ','0001',' ',38781.5, 'NESTLE WATERS SUPPLY EST', @OrderID OUTPUT
EXEC dbo.AddOrder '06023173  ','0001',' ',38770.5, 'COGESAL MIKO-FSEUR 58488', @OrderID OUTPUT
EXEC dbo.AddOrder '06023175  ','0001',' ',38784.5, 'DIAGEO DEUTSCHLAND GMBH', @OrderID OUTPUT
EXEC dbo.AddOrder '06023177  ','0001',' ',38770.5, 'COGESAL MIKO-FSEUR 58488', @OrderID OUTPUT
EXEC dbo.AddOrder '06023178  ','0001',' ',38773.5, 'COGESAL MIKO-FSEUR 58488', @OrderID OUTPUT
EXEC dbo.AddOrder '06023179  ','0001',' ',38775.5, 'COGESAL MIKO-FSEUR 58488', @OrderID OUTPUT
EXEC dbo.AddOrder '06023180  ','0001',' ',38776.5, 'COGESAL MIKO-FSEUR 58488', @OrderID OUTPUT
EXEC dbo.AddOrder '06023182  ','0001',' ',38769.5, 'COGESAL MIKO-FSEUR 58488', @OrderID OUTPUT
EXEC dbo.AddOrder '06023183  ','0001',' ',38773.5, 'COGESAL MIKO-FSEUR 58488', @OrderID OUTPUT
EXEC dbo.AddOrder '06023184  ','0001',' ',38774.5, 'COGESAL MIKO-FSEUR 58488', @OrderID OUTPUT
EXEC dbo.AddOrder '06023185  ','0001',' ',38775.5, 'COGESAL MIKO-FSEUR 58488', @OrderID OUTPUT
EXEC dbo.AddOrder '06023188  ','0001',' ',38774.5, 'COGESAL MIKO-FSEUR 58488', @OrderID OUTPUT
EXEC dbo.AddOrder '06023189  ','0001',' ',38775.5, 'COGESAL MIKO-FSEUR 58488', @OrderID OUTPUT
EXEC dbo.AddOrder '06023191  ','0001',' ',38769.5, 'COGESAL MIKO-FSEUR 58488', @OrderID OUTPUT
EXEC dbo.AddOrder '06023192  ','0001',' ',38770.5, 'COGESAL MIKO-FSEUR 58488', @OrderID OUTPUT
EXEC dbo.AddOrder '06023193  ','0001',' ',38773.5, 'COGESAL MIKO-FSEUR 58488', @OrderID OUTPUT
EXEC dbo.AddOrder '06023194  ','0001',' ',38774.5, 'COGESAL MIKO-FSEUR 58488', @OrderID OUTPUT
EXEC dbo.AddOrder '06023195  ','0001',' ',38774.5, 'COGESAL MIKO-FSEUR 58488', @OrderID OUTPUT
EXEC dbo.AddOrder '06023196  ','0001',' ',38775.5, 'COGESAL MIKO-FSEUR 58488', @OrderID OUTPUT
EXEC dbo.AddOrder '06023198  ','0001',' ',38776.5, 'COGESAL MIKO-FSEUR 58488', @OrderID OUTPUT
EXEC dbo.AddOrder '06023203  ','0001',' ',38768.5, 'BRASSERIES KRONENBOURG 5', @OrderID OUTPUT
EXEC dbo.AddOrder '06023205  ','0001',' ',38770.5, 'STE WRIGLEY FRANCE S.N.C', @OrderID OUTPUT
EXEC dbo.AddOrder '06023205  ','0001','a',38774.5, 'STE WRIGLEY FRANCE S.N.C', @OrderID OUTPUT
EXEC dbo.AddOrder '06023205  ','0001','b',38776.5, 'STE WRIGLEY FRANCE S.N.C', @OrderID OUTPUT
EXEC dbo.AddOrder '06023205  ','0001','c',38780.5, 'STE WRIGLEY FRANCE S.N.C', @OrderID OUTPUT
EXEC dbo.AddOrder '06023207  ','0001',' ',38770.5, 'STE WRIGLEY FRANCE S.N.C', @OrderID OUTPUT
EXEC dbo.AddOrder '06023207  ','0001','a',38774.5, 'STE WRIGLEY FRANCE S.N.C', @OrderID OUTPUT
EXEC dbo.AddOrder '06023211  ','0001',' ',38768.5, 'BOURBON AUTOMOBILE', @OrderID OUTPUT
EXEC dbo.AddOrder '06023213  ','0001',' ',38780.5, 'B.V.ALVERIMPORT', @OrderID OUTPUT
EXEC dbo.AddOrder '06023214  ','0001',' ',38782.5, 'TECUMSEH EUROPE S.A.', @OrderID OUTPUT
EXEC dbo.AddOrder '06023215  ','0001',' ',38784.5, 'DIAGEO DEUTSCHLAND GMBH', @OrderID OUTPUT
EXEC dbo.AddOrder '06023217  ','0001',' ',38774.5, 'STE ALSA-CORK', @OrderID OUTPUT
EXEC dbo.AddOrder '06023218  ','0001',' ',38774.5, 'STE ALSA-CORK', @OrderID OUTPUT
EXEC dbo.AddOrder '06023219  ','0001',' ',38774.5, 'STE ALSA-CORK', @OrderID OUTPUT
EXEC dbo.AddOrder '06023220  ','0001',' ',38774.5, 'STE ALSA-CORK', @OrderID OUTPUT
EXEC dbo.AddOrder '06023221  ','0001',' ',38782.5, 'METIMO GMBH', @OrderID OUTPUT
EXEC dbo.AddOrder '06023222  ','0001',' ',38782.5, 'METIMO GMBH', @OrderID OUTPUT
EXEC dbo.AddOrder '06023223  ','0001',' ',38788.5, 'METIMO GMBH', @OrderID OUTPUT
EXEC dbo.AddOrder '06023224  ','0001',' ',38789.5, 'METIMO GMBH', @OrderID OUTPUT
EXEC dbo.AddOrder '06023225  ','0001',' ',38782.5, 'METIMO GMBH', @OrderID OUTPUT
EXEC dbo.AddOrder '06023227  ','0001',' ',38774.5, 'MLP - MANUFACTURE DE PRE', @OrderID OUTPUT
EXEC dbo.AddOrder '06023230  ','0001',' ',38770.5, 'HEXCEL COMPOSITES', @OrderID OUTPUT
EXEC dbo.AddOrder '06023231  ','0001',' ',38781.5, 'MGI COUTIER PLASTIQUE', @OrderID OUTPUT
EXEC dbo.AddOrder '06023232  ','0001',' ',38775.5, 'LINDAL-FRANCE', @OrderID OUTPUT
EXEC dbo.AddOrder '06023235  ','0001',' ',38789.5, 'SONY FRANCE    US.D''ALSA', @OrderID OUTPUT
EXEC dbo.AddOrder '06023237  ','0001',' ',38788.5, 'B.V.ALVERIMPORT', @OrderID OUTPUT
EXEC dbo.AddOrder '06023239  ','0001',' ',38788.5, 'B.V.ALVERIMPORT', @OrderID OUTPUT
EXEC dbo.AddOrder '06023241  ','0001',' ',38781.5, 'PRODENE KLINT ESPACE LEA', @OrderID OUTPUT
EXEC dbo.AddOrder '06023242  ','0001',' ',38774.5, 'CART.EMBAL. RHONE ALPES', @OrderID OUTPUT
EXEC dbo.AddOrder '06023245  ','0001',' ',38774.5, 'CART.EMBAL. RHONE ALPES', @OrderID OUTPUT
EXEC dbo.AddOrder '06023246  ','0001',' ',38787.5, 'ECOPACK FRANCE', @OrderID OUTPUT
EXEC dbo.AddOrder '06023252  ','0001',' ',38767.5, 'P&G INTERNATIONAL OPERAT', @OrderID OUTPUT
EXEC dbo.AddOrder '06023253  ','0001',' ',38774.5, 'CART.EMBAL. RHONE ALPES', @OrderID OUTPUT
EXEC dbo.AddOrder '06023254  ','0001',' ',38774.5, 'W. WIRTH GMBH', @OrderID OUTPUT
EXEC dbo.AddOrder '06023255  ','0001',' ',38777.5, 'STE SIMU', @OrderID OUTPUT
EXEC dbo.AddOrder '06023258  ','0001',' ',38780.5, 'DOWELANCO ITALIA S.R.L', @OrderID OUTPUT
EXEC dbo.AddOrder '06023260  ','0001',' ',38773.5, 'DOW AGROSCIENCES', @OrderID OUTPUT
EXEC dbo.AddOrder '06023260  ','0001','a',38773.5, 'DOW AGROSCIENCES', @OrderID OUTPUT
EXEC dbo.AddOrder '06023261  ','0001',' ',38773.5, 'DOW AGROSCIENCES', @OrderID OUTPUT
EXEC dbo.AddOrder '06023262  ','0001',' ',38773.5, 'DOW AGROSCIENCES', @OrderID OUTPUT
EXEC dbo.AddOrder '06023263  ','0001',' ',38773.5, 'DOW AGROSCIENCES', @OrderID OUTPUT
EXEC dbo.AddOrder '06023264  ','0001',' ',38773.5, 'DOW AGROSCIENCES', @OrderID OUTPUT
EXEC dbo.AddOrder '06023265  ','0001',' ',38773.5, 'DOW AGROSCIENCES', @OrderID OUTPUT
EXEC dbo.AddOrder '06023266  ','0001',' ',38773.5, 'DOW AGROSCIENCES', @OrderID OUTPUT
EXEC dbo.AddOrder '06023267  ','0001',' ',38773.5, 'DOW AGROSCIENCES', @OrderID OUTPUT
EXEC dbo.AddOrder '06023268  ','0001',' ',38773.5, 'DOW AGROSCIENCES', @OrderID OUTPUT
EXEC dbo.AddOrder '06023269  ','0001',' ',38773.5, 'DOW AGROSCIENCES', @OrderID OUTPUT
EXEC dbo.AddOrder '06023270  ','0001',' ',38773.5, 'DOW AGROSCIENCES', @OrderID OUTPUT
EXEC dbo.AddOrder '06023271  ','0001',' ',38773.5, 'DOW AGROSCIENCES', @OrderID OUTPUT
EXEC dbo.AddOrder '06023272  ','0001',' ',38773.5, 'DOW AGROSCIENCES', @OrderID OUTPUT
EXEC dbo.AddOrder '06023273  ','0001',' ',38773.5, 'DOW AGROSCIENCES', @OrderID OUTPUT
EXEC dbo.AddOrder '06023274  ','0001',' ',38773.5, 'DOW AGROSCIENCES', @OrderID OUTPUT
EXEC dbo.AddOrder '06023275  ','0001',' ',38774.5, 'DOW AGROSCIENCES', @OrderID OUTPUT
EXEC dbo.AddOrder '06023276  ','0001',' ',38774.5, 'DOW AGROSCIENCES', @OrderID OUTPUT
EXEC dbo.AddOrder '06023277  ','0001',' ',38773.5, 'DOW AGROSCIENCES', @OrderID OUTPUT
EXEC dbo.AddOrder '06023278  ','0001',' ',38773.5, 'DOW AGROSCIENCES', @OrderID OUTPUT
EXEC dbo.AddOrder '06023279  ','0001',' ',38773.5, 'DOW AGROSCIENCES', @OrderID OUTPUT
EXEC dbo.AddOrder '06023280  ','0001',' ',38774.5, 'DOW AGROSCIENCES', @OrderID OUTPUT
EXEC dbo.AddOrder '06023281  ','0001',' ',38774.5, 'DOW AGROSCIENCES', @OrderID OUTPUT
EXEC dbo.AddOrder '06023282  ','0001',' ',38774.5, 'DOW AGROSCIENCES', @OrderID OUTPUT
EXEC dbo.AddOrder '06023283  ','0001',' ',38774.5, 'DOW AGROSCIENCES', @OrderID OUTPUT
EXEC dbo.AddOrder '06023284  ','0001',' ',38770.5, 'DOW AGROSCIENCES', @OrderID OUTPUT
EXEC dbo.AddOrder '06023285  ','0001',' ',38774.5, 'DOW AGROSCIENCES', @OrderID OUTPUT
EXEC dbo.AddOrder '06023286  ','0001',' ',38770.5, 'DOW AGROSCIENCES', @OrderID OUTPUT
EXEC dbo.AddOrder '06023287  ','0001',' ',38773.5, 'DOW AGROSCIENCES', @OrderID OUTPUT
EXEC dbo.AddOrder '06023288  ','0001',' ',38773.5, 'DOW AGROSCIENCES', @OrderID OUTPUT
EXEC dbo.AddOrder '06023289  ','0001',' ',38773.5, 'DOW AGROSCIENCES', @OrderID OUTPUT
EXEC dbo.AddOrder '06023290  ','0001',' ',38774.5, 'DOW AGROSCIENCES', @OrderID OUTPUT
EXEC dbo.AddOrder '06023291  ','0001',' ',38774.5, 'DOW AGROSCIENCES', @OrderID OUTPUT
EXEC dbo.AddOrder '06023292  ','0001',' ',38773.5, 'DOW AGROSCIENCES', @OrderID OUTPUT
EXEC dbo.AddOrder '06023293  ','0001',' ',38773.5, 'DOW AGROSCIENCES', @OrderID OUTPUT
EXEC dbo.AddOrder '06023294  ','0001',' ',38773.5, 'DOW AGROSCIENCES', @OrderID OUTPUT
EXEC dbo.AddOrder '06023295  ','0001',' ',38773.5, 'DOW AGROSCIENCES', @OrderID OUTPUT
EXEC dbo.AddOrder '06023296  ','0001',' ',38773.5, 'DOW AGROSCIENCES', @OrderID OUTPUT
EXEC dbo.AddOrder '06023297  ','0001',' ',38773.5, 'DOW AGROSCIENCES', @OrderID OUTPUT
EXEC dbo.AddOrder '06023298  ','0001',' ',38773.5, 'DOW AGROSCIENCES', @OrderID OUTPUT
EXEC dbo.AddOrder '06023298  ','0001','a',38773.5, 'DOW AGROSCIENCES', @OrderID OUTPUT
EXEC dbo.AddOrder '06023298  ','0001','b',38780.5, 'DOW AGROSCIENCES', @OrderID OUTPUT
EXEC dbo.AddOrder '06023299  ','0001',' ',38770.5, 'DOW AGROSCIENCES', @OrderID OUTPUT
EXEC dbo.AddOrder '06023300  ','0001',' ',38773.5, 'DOW AGROSCIENCES', @OrderID OUTPUT
EXEC dbo.AddOrder '06023301  ','0001',' ',38773.5, 'DOW AGROSCIENCES', @OrderID OUTPUT
EXEC dbo.AddOrder '06023303  ','0001',' ',38773.5, 'STE WRIGLEY FRANCE S.N.C', @OrderID OUTPUT
EXEC dbo.AddOrder '06023304  ','0001',' ',38773.5, 'STE WRIGLEY FRANCE S.N.C', @OrderID OUTPUT
EXEC dbo.AddOrder '06023305  ','0001',' ',38773.5, 'STE WRIGLEY FRANCE S.N.C', @OrderID OUTPUT
EXEC dbo.AddOrder '06023305  ','0001','a',38773.5, 'STE WRIGLEY FRANCE S.N.C', @OrderID OUTPUT
EXEC dbo.AddOrder '06023306  ','0001',' ',38773.5, 'STE WRIGLEY FRANCE S.N.C', @OrderID OUTPUT
EXEC dbo.AddOrder '06023308  ','0001',' ',38776.5, 'STE WRIGLEY FRANCE S.N.C', @OrderID OUTPUT
EXEC dbo.AddOrder '06023309  ','0001',' ',38776.5, 'STE WRIGLEY FRANCE S.N.C', @OrderID OUTPUT
EXEC dbo.AddOrder '06023310  ','0001',' ',38776.5, 'STE WRIGLEY FRANCE S.N.C', @OrderID OUTPUT
EXEC dbo.AddOrder '06023311  ','0001',' ',38776.5, 'STE WRIGLEY FRANCE S.N.C', @OrderID OUTPUT
EXEC dbo.AddOrder '06023312  ','0001',' ',38776.5, 'STE WRIGLEY FRANCE S.N.C', @OrderID OUTPUT
EXEC dbo.AddOrder '06023314  ','0001',' ',38777.5, 'STE WRIGLEY FRANCE S.N.C', @OrderID OUTPUT
EXEC dbo.AddOrder '06023315  ','0001',' ',38777.5, 'STE WRIGLEY FRANCE S.N.C', @OrderID OUTPUT
EXEC dbo.AddOrder '06023315  ','0001','a',38781.5, 'STE WRIGLEY FRANCE S.N.C', @OrderID OUTPUT
EXEC dbo.AddOrder '06023321  ','0001',' ',38774.5, 'S.M.A.E.    (EDI)', @OrderID OUTPUT
EXEC dbo.AddOrder '06023323  ','0001',' ',38774.5, 'S.M.A.E.    (EDI)', @OrderID OUTPUT
EXEC dbo.AddOrder '06023325  ','0001',' ',38777.5, 'S.M.A.E. ZI METZ BORNY (', @OrderID OUTPUT
EXEC dbo.AddOrder '06023326  ','0001',' ',38777.5, 'S.M.A.E. ZI METZ BORNY (', @OrderID OUTPUT
EXEC dbo.AddOrder '06023327  ','0001',' ',38777.5, 'S.M.A.E. ZI METZ BORNY (', @OrderID OUTPUT
EXEC dbo.AddOrder '06023328  ','0001',' ',38777.5, 'S.M.A.E. ZI METZ BORNY (', @OrderID OUTPUT
EXEC dbo.AddOrder '06023329  ','0001',' ',38777.5, 'S.M.A.E. ZI METZ BORNY (', @OrderID OUTPUT
EXEC dbo.AddOrder '06023331  ','0001',' ',38781.5, 'DS SMITH KAYSERSBERG', @OrderID OUTPUT
EXEC dbo.AddOrder '06023332  ','0001',' ',38780.5, 'AMERICAN STANDARD EUROPE', @OrderID OUTPUT
EXEC dbo.AddOrder '06023333  ','0001',' ',38789.5, 'DS SMITH KAYSERSBERG', @OrderID OUTPUT
EXEC dbo.AddOrder '06023335  ','0001',' ',38782.5, 'WABCO POLSKA SP.Z.O.O.', @OrderID OUTPUT
EXEC dbo.AddOrder '06023336  ','0001',' ',38773.5, 'DOW AGROSCIENCES', @OrderID OUTPUT
EXEC dbo.AddOrder '06023336  ','0001','a',38775.5, 'DOW AGROSCIENCES', @OrderID OUTPUT
EXEC dbo.AddOrder '06023339  ','0001',' ',38789.5, 'H.B. FULLER AUSTRIA GMBH', @OrderID OUTPUT
EXEC dbo.AddOrder '06023340  ','0001',' ',38775.5, 'NEUHAUSER', @OrderID OUTPUT
EXEC dbo.AddOrder '06023341  ','0001',' ',38773.5, 'DOW-AGROSCIENCES ITALIA', @OrderID OUTPUT
EXEC dbo.AddOrder '06023342  ','0001',' ',38773.5, 'DOW-AGROSCIENCES ITALIA', @OrderID OUTPUT
EXEC dbo.AddOrder '06023343  ','0001',' ',38773.5, 'DOW-AGROSCIENCES ITALIA', @OrderID OUTPUT
EXEC dbo.AddOrder '06023344  ','0001',' ',38773.5, 'DOW-AGROSCIENCES ITALIA', @OrderID OUTPUT
EXEC dbo.AddOrder '06023345  ','0001',' ',38773.5, 'DOW-AGROSCIENCES ITALIA', @OrderID OUTPUT
EXEC dbo.AddOrder '06023346  ','0001',' ',38773.5, 'DOW-AGROSCIENCES ITALIA', @OrderID OUTPUT
EXEC dbo.AddOrder '06023347  ','0001',' ',38773.5, 'DOW-AGROSCIENCES ITALIA', @OrderID OUTPUT
EXEC dbo.AddOrder '06023349  ','0001',' ',38775.5, 'COGESAL MIKO-FSEUR 58488', @OrderID OUTPUT
EXEC dbo.AddOrder '06023350  ','0001',' ',38780.5, 'COGESAL MIKO-FSEUR 58488', @OrderID OUTPUT
EXEC dbo.AddOrder '06023353  ','0001',' ',38776.5, 'COGESAL MIKO-FSEUR 58488', @OrderID OUTPUT
EXEC dbo.AddOrder '06023354  ','0001',' ',38777.5, 'COGESAL MIKO-FSEUR 58488', @OrderID OUTPUT
EXEC dbo.AddOrder '06023354  ','0001','a',38777.5, 'COGESAL MIKO-FSEUR 58488', @OrderID OUTPUT
EXEC dbo.AddOrder '06023355  ','0001',' ',38774.5, 'HEIDE WERKSTAETTEN E.V.', @OrderID OUTPUT
EXEC dbo.AddOrder '06023356  ','0001',' ',38773.5, 'DOW AGROSCIENCES SWITERL', @OrderID OUTPUT
EXEC dbo.AddOrder '06023357  ','0001',' ',38773.5, 'DOW AGROSCIENCES SWITERL', @OrderID OUTPUT
EXEC dbo.AddOrder '06023358  ','0001',' ',38774.5, 'DOW AGROSCIENCES SWITERL', @OrderID OUTPUT
EXEC dbo.AddOrder '06023358  ','0001','a',38775.5, 'DOW AGROSCIENCES SWITERL', @OrderID OUTPUT
EXEC dbo.AddOrder '06023359  ','0001',' ',38773.5, 'DOW AGROSCIENCES SWITERL', @OrderID OUTPUT
EXEC dbo.AddOrder '06023360  ','0001',' ',38774.5, 'DOW AGROSCIENCES SWITERL', @OrderID OUTPUT
EXEC dbo.AddOrder '06023361  ','0001',' ',38773.5, 'DOW AGROSCIENCES SWITERL', @OrderID OUTPUT
EXEC dbo.AddOrder '06023362  ','0001',' ',38773.5, 'DOW AGROSCIENCES SWITERL', @OrderID OUTPUT
EXEC dbo.AddOrder '06023362  ','0001','a',38775.5, 'DOW AGROSCIENCES SWITERL', @OrderID OUTPUT
EXEC dbo.AddOrder '06023363  ','0001',' ',38773.5, 'DOW AGROSCIENCES SWITERL', @OrderID OUTPUT
EXEC dbo.AddOrder '06023364  ','0001',' ',38773.5, 'DOW AGROSCIENCES SWITERL', @OrderID OUTPUT
EXEC dbo.AddOrder '06023365  ','0001',' ',38773.5, 'DOW AGROSCIENCES SWITERL', @OrderID OUTPUT
EXEC dbo.AddOrder '06023366  ','0001',' ',38773.5, 'DOW AGROSCIENCES SWITERL', @OrderID OUTPUT
EXEC dbo.AddOrder '06023367  ','0001',' ',38773.5, 'DOW AGROSCIENCES SWITERL', @OrderID OUTPUT
EXEC dbo.AddOrder '06023368  ','0001',' ',38773.5, 'DOW AGROSCIENCES SWITERL', @OrderID OUTPUT
EXEC dbo.AddOrder '06023370  ','0001',' ',38774.5, 'DOW AGROSCIENCES SWITZEL', @OrderID OUTPUT
EXEC dbo.AddOrder '06023372  ','0001',' ',38776.5, 'DOW AGROSCIENCES SWITZEL', @OrderID OUTPUT
EXEC dbo.AddOrder '06023373  ','0001',' ',38776.5, 'DOW AGROSCIENCES SWITZEL', @OrderID OUTPUT
EXEC dbo.AddOrder '06023375  ','0001',' ',38776.5, 'GEFCO SA POUR PMTC', @OrderID OUTPUT
EXEC dbo.AddOrder '06023376  ','0001',' ',38776.5, 'GEFCO SA POUR PMTC', @OrderID OUTPUT
EXEC dbo.AddOrder '06023378  ','0001',' ',38783.5, 'GEFCO SA POUR PMTC', @OrderID OUTPUT
EXEC dbo.AddOrder '06023382  ','0001',' ',38781.5, 'DELIPAPIER', @OrderID OUTPUT
EXEC dbo.AddOrder '06023383  ','0001',' ',38788.5, 'DELIPAPIER', @OrderID OUTPUT
EXEC dbo.AddOrder '06023384  ','0001',' ',38788.5, 'DELIPAPIER', @OrderID OUTPUT
EXEC dbo.AddOrder '06023385  ','0001',' ',38788.5, 'DELIPAPIER', @OrderID OUTPUT
EXEC dbo.AddOrder '06023387  ','0001',' ',38774.5, 'NESTLE WATERS SUPPLY EST', @OrderID OUTPUT
EXEC dbo.AddOrder '06023389  ','0001',' ',38776.5, 'NESTLE WATERS SUPPLY EST', @OrderID OUTPUT
EXEC dbo.AddOrder '06023391  ','0001',' ',38775.5, 'NESTLE WATERS SUPPLY EST', @OrderID OUTPUT
EXEC dbo.AddOrder '06023393  ','0001',' ',38776.5, 'CARTONNAGES BERTRAND - N', @OrderID OUTPUT
EXEC dbo.AddOrder '06023396  ','0001',' ',38773.5, 'NESTLE WATERS SUPPLY EST', @OrderID OUTPUT
EXEC dbo.AddOrder '06023398  ','0001',' ',38773.5, 'NESTLE WATERS SUPPLY EST', @OrderID OUTPUT
EXEC dbo.AddOrder '06023400  ','0001',' ',38782.5, 'BUBENDORFF VOLET ROULANT', @OrderID OUTPUT
EXEC dbo.AddOrder '06023401  ','0001',' ',38784.5, 'BUBENDORFF VOLET ROULANT', @OrderID OUTPUT
EXEC dbo.AddOrder '06023402  ','0001',' ',38783.5, 'BUBENDORFF VOLET ROULANT', @OrderID OUTPUT
EXEC dbo.AddOrder '06023403  ','0001',' ',38784.5, 'BUBENDORFF VOLET ROULANT', @OrderID OUTPUT
EXEC dbo.AddOrder '06023404  ','0001',' ',38783.5, 'BUBENDORFF VOLET ROULANT', @OrderID OUTPUT
EXEC dbo.AddOrder '06023405  ','0001',' ',38773.5, 'NESTLE WATERS SUPPLY EST', @OrderID OUTPUT
EXEC dbo.AddOrder '06023407  ','0001',' ',38774.5, 'NESTLE WATERS SUPPLY EST', @OrderID OUTPUT
EXEC dbo.AddOrder '06023409  ','0001',' ',38775.5, 'NESTLE WATERS SUPPLY EST', @OrderID OUTPUT
EXEC dbo.AddOrder '06023411  ','0001',' ',38775.5, 'NESTLE WATERS SUPPLY EST', @OrderID OUTPUT
EXEC dbo.AddOrder '06023413  ','0001',' ',38769.5, 'NESTLE WATERS SUPPLY EST', @OrderID OUTPUT
EXEC dbo.AddOrder '06023415  ','0001',' ',38769.5, 'NESTLE WATERS SUPPLY EST', @OrderID OUTPUT
EXEC dbo.AddOrder '06023417  ','0001',' ',38773.5, 'NESTLE WATERS SUPPLY EST', @OrderID OUTPUT
EXEC dbo.AddOrder '06023419  ','0001',' ',38780.5, 'BRASSERIE FISCHER SA', @OrderID OUTPUT
EXEC dbo.AddOrder '06023420  ','0001',' ',38787.5, 'TECUMSEH EUROPE S.A.', @OrderID OUTPUT
EXEC dbo.AddOrder '06023424  ','0001',' ',38773.5, 'STE ALSA-CORK', @OrderID OUTPUT
EXEC dbo.AddOrder '06023430  ','0001',' ',38782.5, 'DU PONT DE NEMOURS (FRAN', @OrderID OUTPUT
EXEC dbo.AddOrder '06023432  ','0001',' ',38788.5, 'PEUGEOT CITROEN AUTOMOBI', @OrderID OUTPUT
EXEC dbo.AddOrder '06023433  ','0001',' ',38789.5, 'DU PONT DE NEMOURS (FRAN', @OrderID OUTPUT
EXEC dbo.AddOrder '06023437  ','0001',' ',38783.5, 'DU PONT DE NEMOURS (FRAN', @OrderID OUTPUT
EXEC dbo.AddOrder '06023437  ','0001','a',38783.5, 'DU PONT DE NEMOURS (FRAN', @OrderID OUTPUT
EXEC dbo.AddOrder '06023440  ','0001',' ',38780.5, 'DU PONT DE NEMOURS (FRAN', @OrderID OUTPUT
EXEC dbo.AddOrder '06023443  ','0001',' ',38774.5, 'DOW AGROSCIENCES SWITZEL', @OrderID OUTPUT
EXEC dbo.AddOrder '06023447  ','0001',' ',38773.5, 'NESTLE WATERS SUPPLY EST', @OrderID OUTPUT
EXEC dbo.AddOrder '06023450  ','0001',' ',38774.5, 'NESTLE WATERS SUPPLY EST', @OrderID OUTPUT
EXEC dbo.AddOrder '06023451  ','0001',' ',38780.5, 'WELL-PACK AG', @OrderID OUTPUT
EXEC dbo.AddOrder '06023454  ','0001',' ',38781.5, 'SNF SAS', @OrderID OUTPUT
EXEC dbo.AddOrder '06023456  ','0001',' ',38782.5, 'ROGER MONDELIN SA', @OrderID OUTPUT
EXEC dbo.AddOrder '06023458  ','0001',' ',38781.5, 'FRANCE CONDITIONNEMENT', @OrderID OUTPUT
EXEC dbo.AddOrder '06023459  ','0001',' ',38781.5, 'FRANCE CONDITIONNEMENT', @OrderID OUTPUT
EXEC dbo.AddOrder '06023460  ','0001',' ',38781.5, 'FRANCE CONDITIONNEMENT', @OrderID OUTPUT
EXEC dbo.AddOrder '06023461  ','0001',' ',38781.5, 'FRANCE CONDITIONNEMENT', @OrderID OUTPUT
EXEC dbo.AddOrder '06023462  ','0001',' ',38781.5, 'FRANCE CONDITIONNEMENT', @OrderID OUTPUT
EXEC dbo.AddOrder '06023465  ','0001',' ',38773.5, 'CARTONNAGES ROSET', @OrderID OUTPUT
EXEC dbo.AddOrder '06023466  ','0001',' ',38777.5, 'GIKO KARTONAGEN GMBH', @OrderID OUTPUT
EXEC dbo.AddOrder '06023467  ','0001',' ',38782.5, 'CART.EMBAL. RHONE ALPES', @OrderID OUTPUT
EXEC dbo.AddOrder '06023469  ','0001',' ',38788.5, 'DU PONT DE NEMOURS S.A.', @OrderID OUTPUT
EXEC dbo.AddOrder '06023470  ','0001',' ',38773.5, 'DS SMITH KAYPAC', @OrderID OUTPUT
EXEC dbo.AddOrder '06023471  ','0001',' ',38773.5, 'DS SMITH KAYPAC', @OrderID OUTPUT
EXEC dbo.AddOrder '06023472  ','0001',' ',38788.5, 'RICOH INDUSTRIE FRANCE', @OrderID OUTPUT
EXEC dbo.AddOrder '06023473  ','0001',' ',38776.5, 'TRISS SPOL.S.R.O.', @OrderID OUTPUT
EXEC dbo.AddOrder '06023475  ','0001',' ',38790.5, 'RICOH INDUSTRIE FRANCE', @OrderID OUTPUT
EXEC dbo.AddOrder '06023477  ','0001',' ',38782.5, 'STE WRIGLEY FRANCE S.N.C', @OrderID OUTPUT
EXEC dbo.AddOrder '06023478  ','0001',' ',38788.5, 'STE WRIGLEY FRANCE S.N.C', @OrderID OUTPUT
EXEC dbo.AddOrder '06023480  ','0001',' ',38783.5, 'STE WRIGLEY FRANCE S.N.C', @OrderID OUTPUT
EXEC dbo.AddOrder '06023481  ','0001',' ',38783.5, 'STE WRIGLEY FRANCE S.N.C', @OrderID OUTPUT
EXEC dbo.AddOrder '06023484  ','0001',' ',38788.5, 'STE WRIGLEY FRANCE S.N.C', @OrderID OUTPUT
EXEC dbo.AddOrder '06023485  ','0001',' ',38788.5, 'STE WRIGLEY FRANCE S.N.C', @OrderID OUTPUT
EXEC dbo.AddOrder '06023487  ','0001',' ',38790.5, 'STE WRIGLEY FRANCE S.N.C', @OrderID OUTPUT
EXEC dbo.AddOrder '06023488  ','0001',' ',38790.5, 'STE WRIGLEY FRANCE S.N.C', @OrderID OUTPUT
EXEC dbo.AddOrder '06023489  ','0001',' ',38790.5, 'STE WRIGLEY FRANCE S.N.C', @OrderID OUTPUT
EXEC dbo.AddOrder '06023490  ','0001',' ',38790.5, 'STE WRIGLEY FRANCE S.N.C', @OrderID OUTPUT
EXEC dbo.AddOrder '06023492  ','0001',' ',38777.5, 'WIRTH VERPACKUNGEN GMBH', @OrderID OUTPUT
EXEC dbo.AddOrder '06023494  ','0001',' ',38776.5, 'WIRTH VERPACKUNGEN GMBH', @OrderID OUTPUT
EXEC dbo.AddOrder '06023496  ','0001',' ',38780.5, 'WIRTH VERPACKUNGEN GMBH', @OrderID OUTPUT
EXEC dbo.AddOrder '06023496  ','0001','a',38784.5, 'WIRTH VERPACKUNGEN GMBH', @OrderID OUTPUT
EXEC dbo.AddOrder '06023497  ','0001',' ',38774.5, 'TRISS SPOL.S.R.O.', @OrderID OUTPUT
EXEC dbo.AddOrder '06023498  ','0001',' ',38774.5, 'TRISS SPOL.S.R.O.', @OrderID OUTPUT
EXEC dbo.AddOrder '06023501  ','0001',' ',38775.5, 'ALCAN SINGEN GMBH', @OrderID OUTPUT
EXEC dbo.AddOrder '06023502  ','0001',' ',38780.5, 'DIEFENBACH EMBALLAGE', @OrderID OUTPUT
EXEC dbo.AddOrder '06023504  ','0001',' ',38795.5, 'P&G INTERNATIONAL OPERAT', @OrderID OUTPUT
EXEC dbo.AddOrder '06023506  ','0001',' ',38791.5, 'P&G INTERNATIONAL OPERAT', @OrderID OUTPUT
EXEC dbo.AddOrder '06023508  ','0001',' ',38797.5, 'P&G INTERNATIONAL OPERAT', @OrderID OUTPUT
EXEC dbo.AddOrder '06023510  ','0001',' ',38795.5, 'P&G INTERNATIONAL OPERAT', @OrderID OUTPUT
EXEC dbo.AddOrder '06023512  ','0001',' ',38776.5, 'NESTLE WATERS SUPPLY EST', @OrderID OUTPUT
EXEC dbo.AddOrder '06023514  ','0001',' ',38783.5, 'NESTLE WATERS SUPPLY EST', @OrderID OUTPUT
EXEC dbo.AddOrder '06023516  ','0001',' ',38768.5, 'NESTLE WATERS SUPPLY EST', @OrderID OUTPUT
EXEC dbo.AddOrder '06023518  ','0001',' ',38770.5, 'NESTLE WATERS SUPPLY EST', @OrderID OUTPUT
EXEC dbo.AddOrder '06023520  ','0001',' ',38774.5, 'NESTLE WATERS SUPPLY EST', @OrderID OUTPUT
EXEC dbo.AddOrder '06023522  ','0001',' ',38775.5, 'NESTLE WATERS SUPPLY EST', @OrderID OUTPUT
EXEC dbo.AddOrder '06023524  ','0001',' ',38777.5, 'NESTLE WATERS SUPPLY EST', @OrderID OUTPUT
EXEC dbo.AddOrder '06023527  ','0001',' ',38774.5, 'CART.EMBAL. RHONE ALPES', @OrderID OUTPUT
EXEC dbo.AddOrder '06023529  ','0001',' ',38768.5, 'DU PONT DE NEMOURS (FRAN', @OrderID OUTPUT
EXEC dbo.AddOrder '06023529  ','0001','a',38789.5, 'DU PONT DE NEMOURS (FRAN', @OrderID OUTPUT
EXEC dbo.AddOrder '06023530  ','0001',' ',38774.5, 'CART.EMBAL. RHONE ALPES', @OrderID OUTPUT
EXEC dbo.AddOrder '06023534  ','0001',' ',38781.5, 'SESAM SNC', @OrderID OUTPUT
EXEC dbo.AddOrder '06023536  ','0001',' ',38774.5, 'STE ALSA-CORK', @OrderID OUTPUT
EXEC dbo.AddOrder '06023538  ','0001',' ',38780.5, 'P-D INTERGLAS TECHNOLOGI', @OrderID OUTPUT
EXEC dbo.AddOrder '06023539  ','0001',' ',38780.5, 'P-D INTERGLAS TECHNOLOGI', @OrderID OUTPUT
EXEC dbo.AddOrder '06023541  ','0001',' ',38780.5, 'P-D INTERGLAS TECHNOLOGI', @OrderID OUTPUT
EXEC dbo.AddOrder '06023542  ','0001',' ',38780.5, 'P-D INTERGLAS TECHNOLOGI', @OrderID OUTPUT
EXEC dbo.AddOrder '06023545  ','0001',' ',38788.5, 'DS SMITH KAYPAC', @OrderID OUTPUT
EXEC dbo.AddOrder '06023547  ','0001',' ',38780.5, 'DS SMITH KAYPAC', @OrderID OUTPUT
EXEC dbo.AddOrder '06023548  ','0001',' ',38775.5, 'DS SMITH KAYPAC', @OrderID OUTPUT
EXEC dbo.AddOrder '06023549  ','0001',' ',38775.5, 'DS SMITH KAYPAC', @OrderID OUTPUT
EXEC dbo.AddOrder '06023551  ','0001',' ',38791.5, 'LES GRANDES SOURCES WATT', @OrderID OUTPUT
EXEC dbo.AddOrder '06023554  ','0001',' ',38774.5, 'DOW AGROSCIENCES SWITZEL', @OrderID OUTPUT
EXEC dbo.AddOrder '06023555  ','0001',' ',38783.5, 'SARL C.F.P. ENVIRONNEMEN', @OrderID OUTPUT
EXEC dbo.AddOrder '06023558  ','0001',' ',38780.5, 'CARTONNAGES BERTRAND - N', @OrderID OUTPUT
EXEC dbo.AddOrder '06023559  ','0001',' ',38789.5, 'CARTONNAGES BERTRAND - N', @OrderID OUTPUT
EXEC dbo.AddOrder '06023564  ','0001',' ',38776.5, 'P&G INTERNATIONAL OPERAT', @OrderID OUTPUT
EXEC dbo.AddOrder '06023567  ','0001',' ',38783.5, 'AMERICAN STANDARD EUROPE', @OrderID OUTPUT
EXEC dbo.AddOrder '06023568  ','0001',' ',38787.5, 'JDW HOLDING GMBH', @OrderID OUTPUT
EXEC dbo.AddOrder '06023569  ','0001',' ',38790.5, 'JDW HOLDING GMBH', @OrderID OUTPUT
EXEC dbo.AddOrder '06023572  ','0001',' ',38787.5, 'NESTLE WATERS SUPPLY EST', @OrderID OUTPUT
EXEC dbo.AddOrder '06023574  ','0001',' ',38781.5, 'NESTLE WATERS SUPPLY EST', @OrderID OUTPUT
EXEC dbo.AddOrder '06023576  ','0001',' ',38781.5, 'NESTLE WATERS SUPPLY EST', @OrderID OUTPUT
EXEC dbo.AddOrder '06023578  ','0001',' ',38783.5, 'NESTLE WATERS SUPPLY EST', @OrderID OUTPUT
EXEC dbo.AddOrder '06023580  ','0001',' ',38781.5, 'NESTLE WATERS SUPPLY EST', @OrderID OUTPUT
EXEC dbo.AddOrder '06023582  ','0001',' ',38776.5, 'NESTLE WATERS SUPPLY EST', @OrderID OUTPUT
EXEC dbo.AddOrder '06023592  ','0001',' ',38775.5, 'ATELIER 16', @OrderID OUTPUT
EXEC dbo.AddOrder '06023594  ','0001',' ',38781.5, 'S.M.A.E. ZI METZ BORNY (', @OrderID OUTPUT
EXEC dbo.AddOrder '06023595  ','0001',' ',38781.5, 'S.M.A.E. ZI METZ BORNY (', @OrderID OUTPUT
EXEC dbo.AddOrder '06023596  ','0001',' ',38781.5, 'S.M.A.E. ZI METZ BORNY (', @OrderID OUTPUT
EXEC dbo.AddOrder '06023597  ','0001',' ',38781.5, 'S.M.A.E. ZI METZ BORNY (', @OrderID OUTPUT
EXEC dbo.AddOrder '06023598  ','0001',' ',38781.5, 'S.M.A.E. ZI METZ BORNY (', @OrderID OUTPUT
EXEC dbo.AddOrder '06023601  ','0001',' ',38803.5, 'DICESA SA', @OrderID OUTPUT
EXEC dbo.AddOrder '06023602  ','0001',' ',38802.5, 'DICESA SA', @OrderID OUTPUT
EXEC dbo.AddOrder '06023603  ','0001',' ',38802.5, 'DICESA SA', @OrderID OUTPUT
EXEC dbo.AddOrder '06023604  ','0001',' ',38802.5, 'DICESA SA', @OrderID OUTPUT
EXEC dbo.AddOrder '06023605  ','0001',' ',38802.5, 'DICESA SA', @OrderID OUTPUT
EXEC dbo.AddOrder '06023606  ','0001',' ',38802.5, 'DICESA SA', @OrderID OUTPUT
EXEC dbo.AddOrder '06023608  ','0001',' ',38773.5, 'BRASSERIE FISCHER SA', @OrderID OUTPUT
EXEC dbo.AddOrder '06023610  ','0001',' ',38780.5, 'BRASSERIE FISCHER SA', @OrderID OUTPUT
EXEC dbo.AddOrder '06023614  ','0001',' ',38780.5, 'NESTLE WATERS SUPPLY EST', @OrderID OUTPUT
EXEC dbo.AddOrder '06023616  ','0001',' ',38782.5, 'NESTLE WATERS SUPPLY EST', @OrderID OUTPUT
EXEC dbo.AddOrder '06023618  ','0001',' ',38776.5, 'NESTLE WATERS SUPPLY EST', @OrderID OUTPUT
EXEC dbo.AddOrder '06023620  ','0001',' ',38784.5, 'NESTLE WATERS SUPPLY EST', @OrderID OUTPUT
EXEC dbo.AddOrder '06023623  ','0001',' ',38775.5, 'BRASSERIE FISCHER SA', @OrderID OUTPUT
EXEC dbo.AddOrder '06023624  ','0001',' ',38787.5, 'NESTLE WATERS SUPPLY EST', @OrderID OUTPUT
EXEC dbo.AddOrder '06023629  ','0001',' ',38777.5, 'P&G INTERNATIONAL OPERAT', @OrderID OUTPUT
EXEC dbo.AddOrder '06023631  ','0001',' ',38777.5, 'P&G INTERNATIONAL OPERAT', @OrderID OUTPUT
EXEC dbo.AddOrder '06023633  ','0001',' ',38780.5, 'P&G INTERNATIONAL OPERAT', @OrderID OUTPUT
EXEC dbo.AddOrder '06023635  ','0001',' ',38777.5, 'P&G INTERNATIONAL OPERAT', @OrderID OUTPUT
EXEC dbo.AddOrder '06023637  ','0001',' ',38781.5, 'P&G INTERNATIONAL OPERAT', @OrderID OUTPUT
EXEC dbo.AddOrder '06023639  ','0001',' ',38782.5, 'P&G INTERNATIONAL OPERAT', @OrderID OUTPUT
EXEC dbo.AddOrder '06023642  ','0001',' ',38776.5, 'NESTLE WATERS SUPPLY EST', @OrderID OUTPUT
EXEC dbo.AddOrder '06023645  ','0001',' ',38768.5, 'P&G INTERNATIONAL OPERAT', @OrderID OUTPUT
EXEC dbo.AddOrder '06023648  ','0001',' ',38830.5, 'SCHUETZ GMBH & CO.KG  AA', @OrderID OUTPUT
EXEC dbo.AddOrder '06023649  ','0001',' ',38830.5, 'SCHUETZ GMBH & CO.KG  AA', @OrderID OUTPUT
EXEC dbo.AddOrder '06023650  ','0001',' ',38776.5, 'P&G INTERNATIONAL OPERAT', @OrderID OUTPUT
EXEC dbo.AddOrder '06023652  ','0001',' ',38781.5, 'P&G INTERNATIONAL OPERAT', @OrderID OUTPUT
EXEC dbo.AddOrder '06023653  ','0001',' ',38781.5, 'NESTLE WATERS SUPPLY EST', @OrderID OUTPUT
EXEC dbo.AddOrder '06023655  ','0001',' ',38770.5, 'NESTLE WATERS SUPPLY EST', @OrderID OUTPUT
EXEC dbo.AddOrder '06023657  ','0001',' ',38787.5, 'NESTLE WATERS SUPPLY EST', @OrderID OUTPUT
EXEC dbo.AddOrder '06023659  ','0001',' ',38780.5, 'NESTLE WATERS SUPPLY EST', @OrderID OUTPUT
EXEC dbo.AddOrder '06023661  ','0001',' ',38782.5, 'NESTLE WATERS SUPPLY EST', @OrderID OUTPUT
EXEC dbo.AddOrder '06023668  ','0001',' ',38789.5, 'EMIL FREI GMBH & CO.', @OrderID OUTPUT
EXEC dbo.AddOrder '06023670  ','0001',' ',38777.5, 'BRASSERIE FISCHER SA', @OrderID OUTPUT
EXEC dbo.AddOrder '06023673  ','0001',' ',38776.5, 'DS SMITH KAYSERSBERG', @OrderID OUTPUT
EXEC dbo.AddOrder '06023678  ','0001',' ',38782.5, 'DOW AGROSCIENCES SWITZEL', @OrderID OUTPUT
EXEC dbo.AddOrder '06023679  ','0001',' ',38776.5, 'DOW AGROSCIENCES SWITZEL', @OrderID OUTPUT
EXEC dbo.AddOrder '06023683  ','0001',' ',38774.5, 'P&G INTERNATIONAL OPERAT', @OrderID OUTPUT
EXEC dbo.AddOrder '06023685  ','0001',' ',38781.5, 'P&G INTERNATIONAL OPERAT', @OrderID OUTPUT
EXEC dbo.AddOrder '06023689  ','0001',' ',38784.5, 'P&G INTERNATIONAL OPERAT', @OrderID OUTPUT
EXEC dbo.AddOrder '06023691  ','0001',' ',38784.5, 'P&G INTERNATIONAL OPERAT', @OrderID OUTPUT
EXEC dbo.AddOrder '06023692  ','0001',' ',38777.5, 'W. WIRTH GMBH', @OrderID OUTPUT
EXEC dbo.AddOrder '06023694  ','0001',' ',38777.5, 'VIESSMANN', @OrderID OUTPUT
EXEC dbo.AddOrder '06023695  ','0001',' ',38777.5, 'VIESSMANN', @OrderID OUTPUT
EXEC dbo.AddOrder '06023696  ','0001',' ',38783.5, 'P&G INTERNATIONAL OPERAT', @OrderID OUTPUT
EXEC dbo.AddOrder '06023698  ','0001',' ',38775.5, 'P&G INTERNATIONAL OPERAT', @OrderID OUTPUT
EXEC dbo.AddOrder '06023702  ','0001',' ',38780.5, 'P&G INTERNATIONAL OPERAT', @OrderID OUTPUT
EXEC dbo.AddOrder '06023705  ','0001',' ',38773.5, 'STE SIMU', @OrderID OUTPUT
EXEC dbo.AddOrder '06023707  ','0001',' ',38773.5, 'STE SIMU', @OrderID OUTPUT
EXEC dbo.AddOrder '06023710  ','0001',' ',38783.5, 'PEUGEOT CITROEN AUTOMOBI', @OrderID OUTPUT
EXEC dbo.AddOrder '06023712  ','0001',' ',38776.5, 'P&G INTERNATIONAL OPERAT', @OrderID OUTPUT
EXEC dbo.AddOrder '06023713  ','0001',' ',38791.5, 'PEUGEOT CITROEN AUTOMOBI', @OrderID OUTPUT
EXEC dbo.AddOrder '06023715  ','0001',' ',38780.5, 'WOLFBERGER', @OrderID OUTPUT
EXEC dbo.AddOrder '06023717  ','0001',' ',38780.5, 'DS SMITH KAYPAC', @OrderID OUTPUT
EXEC dbo.AddOrder '06023719  ','0001',' ',38788.5, 'CHEDDITE FRANCE S.A.', @OrderID OUTPUT
EXEC dbo.AddOrder '06023720  ','0001',' ',38803.5, 'CHEDDITE FRANCE S.A.', @OrderID OUTPUT
EXEC dbo.AddOrder '06023722  ','0001',' ',38767.5, 'JTEKT AUTOMOBILE', @OrderID OUTPUT
EXEC dbo.AddOrder '06023724  ','0001',' ',38767.5, 'JTEKT AUTOMOBILE', @OrderID OUTPUT
EXEC dbo.AddOrder '06023728  ','0001',' ',38784.5, 'BRASSERIES HEINEKEN SA', @OrderID OUTPUT
EXEC dbo.AddOrder '06023732  ','0001',' ',38784.5, 'DS SMITH KAYPAC', @OrderID OUTPUT
EXEC dbo.AddOrder '06023736  ','0001',' ',38784.5, 'DS SMITH KAYPAC', @OrderID OUTPUT
EXEC dbo.AddOrder '06023738  ','0001',' ',38790.5, 'RICOH INDUSTRIE FRANCE', @OrderID OUTPUT
EXEC dbo.AddOrder '06023739  ','0001',' ',38787.5, 'FRISETTA POLYMER GMBH &', @OrderID OUTPUT
EXEC dbo.AddOrder '06023739  ','0001','b',38787.5, 'FRISETTA POLYMER GMBH &', @OrderID OUTPUT
EXEC dbo.AddOrder '06023740  ','0001',' ',38787.5, 'FRISETTA POLYMER GMBH &', @OrderID OUTPUT
EXEC dbo.AddOrder '06023740  ','0001','b',38787.5, 'FRISETTA POLYMER GMBH &', @OrderID OUTPUT
EXEC dbo.AddOrder '06023746  ','0001',' ',38784.5, 'PETER O. PURSCH', @OrderID OUTPUT
EXEC dbo.AddOrder '06023749  ','0001',' ',38789.5, 'PETER O. PURSCH', @OrderID OUTPUT
EXEC dbo.AddOrder '06023751  ','0001',' ',38781.5, 'H T L VERPACKUNG GMBH', @OrderID OUTPUT
EXEC dbo.AddOrder '06023754  ','0001',' ',38774.5, 'PELLAT', @OrderID OUTPUT
EXEC dbo.AddOrder '06023755  ','0001',' ',38781.5, 'ED.FRIEDRICH & CO GMBH', @OrderID OUTPUT
EXEC dbo.AddOrder '06023756  ','0001',' ',38781.5, 'ED.FRIEDRICH & CO GMBH', @OrderID OUTPUT
EXEC dbo.AddOrder '06023757  ','0001',' ',38781.5, 'GEPAK W.GERNER GMBH', @OrderID OUTPUT
EXEC dbo.AddOrder '06023759  ','0001',' ',38784.5, 'DS SMITH KAYPAC', @OrderID OUTPUT
EXEC dbo.AddOrder '06023763  ','0001',' ',38780.5, 'WELL-PACK AG', @OrderID OUTPUT
EXEC dbo.AddOrder '06023771  ','0001',' ',38795.5, 'CUISINES SCHMIDT SALM SA', @OrderID OUTPUT
EXEC dbo.AddOrder '06023772  ','0001',' ',38795.5, 'CUISINES SCHMIDT SALM SA', @OrderID OUTPUT
EXEC dbo.AddOrder '06023773  ','0001',' ',38784.5, 'CUISINES SCHMIDT SALM SA', @OrderID OUTPUT
EXEC dbo.AddOrder '06023774  ','0001',' ',38784.5, 'CUISINES SCHMIDT SALM SA', @OrderID OUTPUT
EXEC dbo.AddOrder '06023776  ','0001',' ',38795.5, 'STE INDUST.DE LEVURE FAL', @OrderID OUTPUT
EXEC dbo.AddOrder '06023778  ','0001',' ',38774.5, 'BRASSERIES KRONENBOURG 5', @OrderID OUTPUT
EXEC dbo.AddOrder '06023780  ','0001',' ',38777.5, 'WELL-PACK AG', @OrderID OUTPUT
EXEC dbo.AddOrder '06023782  ','0001',' ',38780.5, 'WELL-PACK AG', @OrderID OUTPUT
EXEC dbo.AddOrder '06023783  ','0001',' ',38777.5, 'B.V.ALVERIMPORT', @OrderID OUTPUT
EXEC dbo.AddOrder '06023785  ','0001',' ',38790.5, 'VISTEON SYSTEMES INTERIE', @OrderID OUTPUT
EXEC dbo.AddOrder '06023787  ','0001',' ',38787.5, 'LUTZE DESIGN', @OrderID OUTPUT
EXEC dbo.AddOrder '06023788  ','0001',' ',38775.5, 'DS SMITH KAYSERSBERG', @OrderID OUTPUT
EXEC dbo.AddOrder '06023789  ','0001',' ',38774.5, 'DS SMITH KAYSERSBERG', @OrderID OUTPUT
EXEC dbo.AddOrder '06023793  ','0001',' ',38780.5, 'RICOLA EUROPE SA', @OrderID OUTPUT
EXEC dbo.AddOrder '06023794  ','0001',' ',38794.5, 'GRENOBLE PLASTIQUE EMBAL', @OrderID OUTPUT
EXEC dbo.AddOrder '06023795  ','0001',' ',38794.5, 'GRENOBLE PLASTIQUE EMBAL', @OrderID OUTPUT
EXEC dbo.AddOrder '06023796  ','0001',' ',38775.5, 'THYSSENKRUPP PRESTA FRAN', @OrderID OUTPUT
EXEC dbo.AddOrder '06023798  ','0001',' ',38780.5, 'DECOFERM SAS', @OrderID OUTPUT
EXEC dbo.AddOrder '06023799  ','0001',' ',38788.5, 'STE ALSA-CORK', @OrderID OUTPUT
EXEC dbo.AddOrder '06023801  ','0001',' ',38773.5, 'NESTLE WATERS SUPPLY EST', @OrderID OUTPUT
EXEC dbo.AddOrder '06023802  ','0001',' ',38777.5, 'INTERGESTION', @OrderID OUTPUT
EXEC dbo.AddOrder '06023804  ','0001',' ',38777.5, 'INTERGESTION', @OrderID OUTPUT
EXEC dbo.AddOrder '06023807  ','0001',' ',38784.5, 'WINTER & CO', @OrderID OUTPUT
EXEC dbo.AddOrder '06023808  ','0001',' ',38782.5, 'WINTER & CO', @OrderID OUTPUT
EXEC dbo.AddOrder '06023810  ','0001',' ',38788.5, 'WELL-PACK AG', @OrderID OUTPUT
EXEC dbo.AddOrder '06023812  ','0001',' ',38790.5, 'STE MOBOIS', @OrderID OUTPUT
EXEC dbo.AddOrder '06023813  ','0001',' ',38790.5, 'STE MOBOIS', @OrderID OUTPUT
EXEC dbo.AddOrder '06023815  ','0001',' ',38783.5, 'GEORGIA-PACIFIC FRANCE', @OrderID OUTPUT
EXEC dbo.AddOrder '06023818  ','0001',' ',38782.5, 'W. WIRTH GMBH', @OrderID OUTPUT
EXEC dbo.AddOrder '06023819  ','0001',' ',38804.5, 'R. BOURGEOIS S.R', @OrderID OUTPUT
EXEC dbo.AddOrder '06023820  ','0001',' ',38784.5, 'LILLY FRANCE S.A.', @OrderID OUTPUT
EXEC dbo.AddOrder '06023822  ','0001',' ',38774.5, 'WALTER PERSKE GMBH', @OrderID OUTPUT
EXEC dbo.AddOrder '06023823  ','0001',' ',38794.5, 'FRISETTA POLYMER GMBH &', @OrderID OUTPUT
EXEC dbo.AddOrder '06023838  ','0001',' ',38783.5, 'PEUGEOT CITROEN AUTOMOBI', @OrderID OUTPUT
EXEC dbo.AddOrder '06023845  ','0001',' ',38784.5, 'FEUER-VOGEL GMBH & CO. K', @OrderID OUTPUT
EXEC dbo.AddOrder '06023849  ','0001',' ',38791.5, 'MAISON SPARR', @OrderID OUTPUT
EXEC dbo.AddOrder '06023851  ','0001',' ',38775.5, 'P&G INTERNATIONAL OPERAT', @OrderID OUTPUT
EXEC dbo.AddOrder '06023858  ','0001',' ',38780.5, 'SOMFY', @OrderID OUTPUT
EXEC dbo.AddOrder '06023861  ','0001',' ',38788.5, 'REGENT BELEUCHTUNGSKOERP', @OrderID OUTPUT
EXEC dbo.AddOrder '06023867  ','0001',' ',38790.5, 'TECUMSEH EUROPE S.A.', @OrderID OUTPUT
EXEC dbo.AddOrder '06023868  ','0001',' ',38784.5, 'TECUMSEH EUROPE S.A.', @OrderID OUTPUT
EXEC dbo.AddOrder '06023869  ','0001',' ',38780.5, 'TECUMSEH EUROPE S.A.', @OrderID OUTPUT
EXEC dbo.AddOrder '06023871  ','0001',' ',38787.5, 'TECUMSEH EUROPE S.A.', @OrderID OUTPUT
EXEC dbo.AddOrder '06023873  ','0001',' ',38784.5, 'TECUMSEH EUROPE S.A.', @OrderID OUTPUT
EXEC dbo.AddOrder '06023878  ','0001',' ',38781.5, 'NESTLE SUISSE S.A.', @OrderID OUTPUT
EXEC dbo.AddOrder '06023883  ','0001',' ',38776.5, 'GIKO KARTONAGEN GMBH', @OrderID OUTPUT
EXEC dbo.AddOrder '06023886  ','0001',' ',38776.5, 'GIKO KARTONAGEN GMBH', @OrderID OUTPUT
EXEC dbo.AddOrder '06023889  ','0001',' ',38780.5, 'WOLFBERGER', @OrderID OUTPUT
EXEC dbo.AddOrder '06023890  ','0001',' ',38780.5, 'WOLFBERGER', @OrderID OUTPUT
EXEC dbo.AddOrder '06023891  ','0001',' ',38781.5, 'WOLFBERGER', @OrderID OUTPUT
EXEC dbo.AddOrder '06023892  ','0001',' ',38787.5, 'AMERICAN STANDARD EUROPE', @OrderID OUTPUT
EXEC dbo.AddOrder '06023895  ','0001',' ',38777.5, 'AUTOBAR FLEXIBLE PACKAGI', @OrderID OUTPUT
EXEC dbo.AddOrder '06023897  ','0001',' ',38788.5, 'AUTOBAR FLEXIBLE PACKAGI', @OrderID OUTPUT
EXEC dbo.AddOrder '06023898  ','0001',' ',38788.5, 'AUTOBAR FLEXIBLE PACKAGI', @OrderID OUTPUT
EXEC dbo.AddOrder '06023903  ','0001',' ',38775.5, 'STI GREBENHAIN', @OrderID OUTPUT
EXEC dbo.AddOrder '06023904  ','0001',' ',38782.5, 'LINDAL-FRANCE', @OrderID OUTPUT
EXEC dbo.AddOrder '06023906  ','0001',' ',38783.5, 'WIRTH VERPACKUNGEN GMBH', @OrderID OUTPUT
EXEC dbo.AddOrder '06023908  ','0001',' ',38784.5, 'WIRTH VERPACKUNGEN GMBH', @OrderID OUTPUT
EXEC dbo.AddOrder '06023910  ','0001',' ',38790.5, 'PRODINGER VERPACKUNG', @OrderID OUTPUT
EXEC dbo.AddOrder '06023912  ','0001',' ',38776.5, 'W. WIRTH GMBH', @OrderID OUTPUT
EXEC dbo.AddOrder '06023914  ','0001',' ',38769.5, 'JTEKT AUTOMOBILE', @OrderID OUTPUT
EXEC dbo.AddOrder '06023916  ','0001',' ',38787.5, 'H.J.LICHTENBERGER GMBH', @OrderID OUTPUT
EXEC dbo.AddOrder '06023918  ','0001',' ',38787.5, 'CASPARI GMBH U.CO.KG', @OrderID OUTPUT
EXEC dbo.AddOrder '06023920  ','0001',' ',38797.5, 'CASPARI GMBH U.CO.KG', @OrderID OUTPUT
EXEC dbo.AddOrder '06023922  ','0001',' ',38794.5, 'CASPARI GMBH U.CO.KG', @OrderID OUTPUT
EXEC dbo.AddOrder '06023925  ','0001',' ',38777.5, 'TRISS SPOL.S.R.O.', @OrderID OUTPUT
EXEC dbo.AddOrder '06023926  ','0001',' ',38780.5, 'TRISS SPOL.S.R.O.', @OrderID OUTPUT
EXEC dbo.AddOrder '06023926  ','0002',' ',38780.5, 'TRISS SPOL.S.R.O.', @OrderID OUTPUT
EXEC dbo.AddOrder '06023927  ','0001',' ',38777.5, 'TRISS SPOL.S.R.O.', @OrderID OUTPUT
EXEC dbo.AddOrder '06023932  ','0001',' ',38818.5, 'DS SMITH KAYPAC', @OrderID OUTPUT
EXEC dbo.AddOrder '06023938  ','0001',' ',38790.5, 'TRISS SPOL.S.R.O.', @OrderID OUTPUT
EXEC dbo.AddOrder '06023939  ','0001',' ',38790.5, 'TRISS SPOL.S.R.O.', @OrderID OUTPUT
EXEC dbo.AddOrder '06023940  ','0001',' ',38790.5, 'TRISS SPOL.S.R.O.', @OrderID OUTPUT
EXEC dbo.AddOrder '06023941  ','0001',' ',38790.5, 'TRISS SPOL.S.R.O.', @OrderID OUTPUT
EXEC dbo.AddOrder '06023942  ','0001',' ',38790.5, 'TRISS SPOL.S.R.O.', @OrderID OUTPUT
EXEC dbo.AddOrder '06023943  ','0001',' ',38790.5, 'TRISS SPOL.S.R.O.', @OrderID OUTPUT
EXEC dbo.AddOrder '06023944  ','0001',' ',38790.5, 'TRISS SPOL.S.R.O.', @OrderID OUTPUT
EXEC dbo.AddOrder '06023949  ','0001',' ',38781.5, 'DS SMITH KAYPAC', @OrderID OUTPUT
EXEC dbo.AddOrder '06023950  ','0001',' ',38784.5, 'TRISS SPOL.S.R.O.', @OrderID OUTPUT
EXEC dbo.AddOrder '06023952  ','0001',' ',38784.5, 'TRISS SPOL.S.R.O.', @OrderID OUTPUT
EXEC dbo.AddOrder '06023954  ','0001',' ',38784.5, 'NESTLE WATERS SUPPLY EST', @OrderID OUTPUT
EXEC dbo.AddOrder '06023957  ','0001',' ',38784.5, 'NESTLE WATERS SUPPLY EST', @OrderID OUTPUT
EXEC dbo.AddOrder '06023959  ','0001',' ',38784.5, 'NESTLE WATERS SUPPLY EST', @OrderID OUTPUT
EXEC dbo.AddOrder '06023962  ','0001',' ',38787.5, 'NESTLE WATERS SUPPLY EST', @OrderID OUTPUT
EXEC dbo.AddOrder '06023964  ','0001',' ',38787.5, 'NESTLE WATERS SUPPLY EST', @OrderID OUTPUT
EXEC dbo.AddOrder '06023966  ','0001',' ',38787.5, 'NESTLE WATERS SUPPLY EST', @OrderID OUTPUT
EXEC dbo.AddOrder '06023968  ','0001',' ',38788.5, 'NESTLE WATERS SUPPLY EST', @OrderID OUTPUT
EXEC dbo.AddOrder '06023970  ','0001',' ',38788.5, 'NESTLE WATERS SUPPLY EST', @OrderID OUTPUT
EXEC dbo.AddOrder '06023972  ','0001',' ',38788.5, 'NESTLE WATERS SUPPLY EST', @OrderID OUTPUT
EXEC dbo.AddOrder '06023974  ','0001',' ',38788.5, 'NESTLE WATERS SUPPLY EST', @OrderID OUTPUT
EXEC dbo.AddOrder '06023976  ','0001',' ',38789.5, 'NESTLE WATERS SUPPLY EST', @OrderID OUTPUT
EXEC dbo.AddOrder '06023978  ','0001',' ',38789.5, 'NESTLE WATERS SUPPLY EST', @OrderID OUTPUT
EXEC dbo.AddOrder '06023980  ','0001',' ',38789.5, 'NESTLE WATERS SUPPLY EST', @OrderID OUTPUT
EXEC dbo.AddOrder '06023982  ','0001',' ',38789.5, 'NESTLE WATERS SUPPLY EST', @OrderID OUTPUT
EXEC dbo.AddOrder '06023984  ','0001',' ',38791.5, 'NESTLE WATERS SUPPLY EST', @OrderID OUTPUT
EXEC dbo.AddOrder '06023986  ','0001',' ',38791.5, 'NESTLE WATERS SUPPLY EST', @OrderID OUTPUT
EXEC dbo.AddOrder '06023988  ','0001',' ',38791.5, 'NESTLE WATERS SUPPLY EST', @OrderID OUTPUT
EXEC dbo.AddOrder '06023990  ','0001',' ',38791.5, 'NESTLE WATERS SUPPLY EST', @OrderID OUTPUT
EXEC dbo.AddOrder '06023992  ','0001',' ',38794.5, 'NESTLE WATERS SUPPLY EST', @OrderID OUTPUT
EXEC dbo.AddOrder '06023994  ','0001',' ',38794.5, 'NESTLE WATERS SUPPLY EST', @OrderID OUTPUT
EXEC dbo.AddOrder '06023996  ','0001',' ',38789.5, 'NESTLE WATERS SUPPLY EST', @OrderID OUTPUT
EXEC dbo.AddOrder '06023998  ','0001',' ',38773.5, 'NESTLE WATERS SUPPLY EST', @OrderID OUTPUT
EXEC dbo.AddOrder '06024006  ','0001',' ',38781.5, 'S.M.A.E. ZI METZ BORNY (', @OrderID OUTPUT
EXEC dbo.AddOrder '06024008  ','0001',' ',38781.5, 'S.M.A.E. ZI METZ BORNY (', @OrderID OUTPUT
EXEC dbo.AddOrder '06024010  ','0001',' ',38781.5, 'S.M.A.E. ZI METZ BORNY (', @OrderID OUTPUT
EXEC dbo.AddOrder '06024011  ','0001',' ',38781.5, 'S.M.A.E. ZI METZ BORNY (', @OrderID OUTPUT
EXEC dbo.AddOrder '06024012  ','0001',' ',38781.5, 'S.M.A.E. ZI METZ BORNY (', @OrderID OUTPUT
EXEC dbo.AddOrder '06024013  ','0001',' ',38781.5, 'S.M.A.E. ZI METZ BORNY (', @OrderID OUTPUT
EXEC dbo.AddOrder '06024014  ','0001',' ',38781.5, 'S.M.A.E. ZI METZ BORNY (', @OrderID OUTPUT
EXEC dbo.AddOrder '06024018  ','0001',' ',38795.5, 'B.V.ALVERIMPORT', @OrderID OUTPUT
EXEC dbo.AddOrder '06024020  ','0001',' ',38782.5, 'B.V.ALVERIMPORT', @OrderID OUTPUT
EXEC dbo.AddOrder '06024022  ','0001',' ',38781.5, 'CDF EMBALLAGE SA', @OrderID OUTPUT
EXEC dbo.AddOrder '06024023  ','0001',' ',38782.5, 'TRISS SPOL.S.R.O.', @OrderID OUTPUT
EXEC dbo.AddOrder '06024025  ','0001',' ',38777.5, 'ALCAN PACKAGING CAPSULES', @OrderID OUTPUT
EXEC dbo.AddOrder '06024028  ','0001',' ',38794.5, 'GEORGIA-PACIFIC FRANCE', @OrderID OUTPUT
EXEC dbo.AddOrder '06024029  ','0001',' ',38776.5, 'DS SMITH KAYPAC', @OrderID OUTPUT
EXEC dbo.AddOrder '06024031  ','0001',' ',38776.5, 'DS SMITH KAYPAC', @OrderID OUTPUT
EXEC dbo.AddOrder '06024032  ','0001',' ',38791.5, 'GEORGIA-PACIFIC FRANCE', @OrderID OUTPUT
EXEC dbo.AddOrder '06024032  ','0001','a',38791.5, 'GEORGIA-PACIFIC FRANCE', @OrderID OUTPUT
EXEC dbo.AddOrder '06024033  ','0001',' ',38776.5, 'DS SMITH KAYPAC', @OrderID OUTPUT
EXEC dbo.AddOrder '06024035  ','0001',' ',38776.5, 'DS SMITH KAYPAC', @OrderID OUTPUT
EXEC dbo.AddOrder '06024035  ','0001','b',38776.5, 'DS SMITH KAYPAC', @OrderID OUTPUT
EXEC dbo.AddOrder '06024036  ','0001',' ',38783.5, 'GEORGIA-PACIFIC FRANCE', @OrderID OUTPUT
EXEC dbo.AddOrder '06024038  ','0001',' ',38791.5, 'EXEL NV', @OrderID OUTPUT
EXEC dbo.AddOrder '06024039  ','0001',' ',38791.5, 'EXEL NV', @OrderID OUTPUT
EXEC dbo.AddOrder '06024040  ','0001',' ',38780.5, 'SCHWEITZER S.A.', @OrderID OUTPUT
EXEC dbo.AddOrder '06024041  ','0001',' ',38775.5, 'SCHWEITZER S.A.', @OrderID OUTPUT
EXEC dbo.AddOrder '06024042  ','0001',' ',38790.5, 'SCHWEITZER S.A.', @OrderID OUTPUT
EXEC dbo.AddOrder '06024043  ','0001',' ',38780.5, 'SCHWEITZER S.A.', @OrderID OUTPUT
EXEC dbo.AddOrder '06024043  ','0001','b',38780.5, 'SCHWEITZER S.A.', @OrderID OUTPUT
EXEC dbo.AddOrder '06024045  ','0001',' ',38780.5, 'SCHWEITZER S.A.', @OrderID OUTPUT
EXEC dbo.AddOrder '06024047  ','0001',' ',38780.5, 'KAYSERSBERG PACKAGING ST', @OrderID OUTPUT
EXEC dbo.AddOrder '06024048  ','0001',' ',38776.5, 'CARTONNAGES ROSET', @OrderID OUTPUT
EXEC dbo.AddOrder '06024048  ','0001','b',38776.5, 'CARTONNAGES ROSET', @OrderID OUTPUT
EXEC dbo.AddOrder '06024048  ','0002',' ',38776.5, 'CARTONNAGES ROSET', @OrderID OUTPUT
EXEC dbo.AddOrder '06024052  ','0001',' ',38790.5, 'B.V.ALVERIMPORT', @OrderID OUTPUT
EXEC dbo.AddOrder '06024056  ','0001',' ',38797.5, 'B.V.ALVERIMPORT', @OrderID OUTPUT
EXEC dbo.AddOrder '06024058  ','0001',' ',38789.5, 'B.V.ALVERIMPORT', @OrderID OUTPUT
EXEC dbo.AddOrder '06024059  ','0001',' ',38782.5, 'LINNEMANN-SCHNETZER', @OrderID OUTPUT
EXEC dbo.AddOrder '06024060  ','0001',' ',38783.5, 'LINNEMANN-SCHNETZER', @OrderID OUTPUT
EXEC dbo.AddOrder '06024063  ','0001',' ',38781.5, 'ED.FRIEDRICH & CO GMBH', @OrderID OUTPUT
EXEC dbo.AddOrder '06024067  ','0001',' ',38774.5, 'NESTLE WATERS SUPPLY EST', @OrderID OUTPUT
EXEC dbo.AddOrder '06024071  ','0001',' ',38788.5, 'DS SMITH SPECIALITY PACK', @OrderID OUTPUT
EXEC dbo.AddOrder '06024075  ','0001',' ',38774.5, 'NESTLE WATERS SUPPLY EST', @OrderID OUTPUT
EXEC dbo.AddOrder '06024077  ','0001',' ',38788.5, 'DS SMITH SPECIALITY PACK', @OrderID OUTPUT
EXEC dbo.AddOrder '06024078  ','0001',' ',38796.5, 'DS SMITH SPECIALITY PACK', @OrderID OUTPUT
EXEC dbo.AddOrder '06024080  ','0001',' ',38803.5, 'DS SMITH SPECIALITY PACK', @OrderID OUTPUT
EXEC dbo.AddOrder '06024081  ','0001',' ',38781.5, 'HEIDE WERKSTAETTEN E.V.', @OrderID OUTPUT
EXEC dbo.AddOrder '06024081  ','0001','b',38781.5, 'HEIDE WERKSTAETTEN E.V.', @OrderID OUTPUT
EXEC dbo.AddOrder '06024082  ','0001',' ',38795.5, 'JDW SPEDITION + LOGISTIK', @OrderID OUTPUT
EXEC dbo.AddOrder '06024083  ','0001',' ',38795.5, 'JDW SPEDITION + LOGISTIK', @OrderID OUTPUT
EXEC dbo.AddOrder '06024084  ','0001',' ',38794.5, 'JDW SPEDITION + LOGISTIK', @OrderID OUTPUT
EXEC dbo.AddOrder '06024086  ','0001',' ',38783.5, 'SOMFY', @OrderID OUTPUT
EXEC dbo.AddOrder '06024089  ','0001',' ',38781.5, 'OTTO RAUHUT GMBH & CO', @OrderID OUTPUT
EXEC dbo.AddOrder '06024090  ','0001',' ',38784.5, 'SOMFY', @OrderID OUTPUT
EXEC dbo.AddOrder '06024090  ','0001','b',38784.5, 'SOMFY', @OrderID OUTPUT
EXEC dbo.AddOrder '06024092  ','0001',' ',38790.5, 'SOMFY', @OrderID OUTPUT
EXEC dbo.AddOrder '06024094  ','0001',' ',38787.5, 'LILLY FRANCE S.A.', @OrderID OUTPUT
EXEC dbo.AddOrder '06024096  ','0001',' ',38798.5, 'MVI MOTORENTEILE GMBH', @OrderID OUTPUT
EXEC dbo.AddOrder '06024097  ','0001',' ',38783.5, 'SOMFY', @OrderID OUTPUT
EXEC dbo.AddOrder '06024102  ','0001',' ',38780.5, 'SOMFY', @OrderID OUTPUT
EXEC dbo.AddOrder '06024103  ','0001',' ',38784.5, 'DS SMITH KAYPAC', @OrderID OUTPUT
EXEC dbo.AddOrder '06024105  ','0001',' ',38790.5, 'SOMFY', @OrderID OUTPUT
EXEC dbo.AddOrder '06024108  ','0001',' ',38787.5, 'SOMFY', @OrderID OUTPUT
EXEC dbo.AddOrder '06024109  ','0001',' ',38797.5, 'DS SMITH KAYPAC', @OrderID OUTPUT
EXEC dbo.AddOrder '06024112  ','0001',' ',38797.5, 'DS SMITH KAYPAC', @OrderID OUTPUT
EXEC dbo.AddOrder '06024113  ','0001',' ',38784.5, 'NESTLE WATERS SUPPLY EST', @OrderID OUTPUT
EXEC dbo.AddOrder '06024115  ','0001',' ',38780.5, 'NESTLE WATERS SUPPLY EST', @OrderID OUTPUT
EXEC dbo.AddOrder '06024115  ','0001','b',38780.5, 'NESTLE WATERS SUPPLY EST', @OrderID OUTPUT
EXEC dbo.AddOrder '06024115  ','0001','c',38780.5, 'NESTLE WATERS SUPPLY EST', @OrderID OUTPUT
EXEC dbo.AddOrder '06024117  ','0001',' ',38782.5, 'NESTLE WATERS SUPPLY EST', @OrderID OUTPUT
EXEC dbo.AddOrder '06024119  ','0001',' ',38782.5, 'GEORGIA-PACIFIC FRANCE', @OrderID OUTPUT
EXEC dbo.AddOrder '06024119  ','0001','a',38782.5, 'GEORGIA-PACIFIC FRANCE', @OrderID OUTPUT
EXEC dbo.AddOrder '06024121  ','0001',' ',38780.5, 'GIKO KARTONAGEN GMBH', @OrderID OUTPUT
EXEC dbo.AddOrder '06024122  ','0001',' ',38782.5, 'GEORGIA-PACIFIC FRANCE', @OrderID OUTPUT
EXEC dbo.AddOrder '06024125  ','0001',' ',38788.5, 'NESTLE WATERS SUPPLY EST', @OrderID OUTPUT
EXEC dbo.AddOrder '06024128  ','0001',' ',38788.5, 'NESTLE WATERS SUPPLY EST', @OrderID OUTPUT
EXEC dbo.AddOrder '06024130  ','0001',' ',38783.5, 'NESTLE WATERS SUPPLY EST', @OrderID OUTPUT
EXEC dbo.AddOrder '06024132  ','0001',' ',38781.5, 'DS SMITH KAYPAC', @OrderID OUTPUT
EXEC dbo.AddOrder '06024133  ','0001',' ',38784.5, 'DS SMITH KAYPAC', @OrderID OUTPUT
EXEC dbo.AddOrder '06024137  ','0001',' ',38791.5, 'NEUHAUSER', @OrderID OUTPUT
EXEC dbo.AddOrder '06024140  ','0001',' ',38783.5, 'HEXCEL COMPOSITES', @OrderID OUTPUT
EXEC dbo.AddOrder '06024142  ','0001',' ',38809.5, 'HEXCEL COMPOSITES', @OrderID OUTPUT
EXEC dbo.AddOrder '06024143  ','0001',' ',38811.5, 'HEXCEL COMPOSITES', @OrderID OUTPUT
EXEC dbo.AddOrder '06024144  ','0001',' ',38825.5, 'HEXCEL COMPOSITES', @OrderID OUTPUT
EXEC dbo.AddOrder '06024146  ','0001',' ',38838.5, 'HEXCEL COMPOSITES', @OrderID OUTPUT
EXEC dbo.AddOrder '06024147  ','0001',' ',38853.5, 'HEXCEL COMPOSITES', @OrderID OUTPUT
EXEC dbo.AddOrder '06024148  ','0001',' ',38837.5, 'HEXCEL COMPOSITES', @OrderID OUTPUT
EXEC dbo.AddOrder '06024149  ','0001',' ',38881.5, 'HEXCEL COMPOSITES', @OrderID OUTPUT
EXEC dbo.AddOrder '06024153  ','0001',' ',38788.5, 'DUPONT TEIJIN FILMS', @OrderID OUTPUT
EXEC dbo.AddOrder '06024155  ','0001',' ',38780.5, 'BRASSERIES KRONENBOURG 5', @OrderID OUTPUT
EXEC dbo.AddOrder '06024157  ','0001',' ',38775.5, 'BRASSERIES KRONENBOURG 5', @OrderID OUTPUT
EXEC dbo.AddOrder '06024159  ','0001',' ',38777.5, 'BRASSERIES KRONENBOURG 5', @OrderID OUTPUT
EXEC dbo.AddOrder '06024161  ','0001',' ',38780.5, 'BRASSERIES KRONENBOURG 5', @OrderID OUTPUT
EXEC dbo.AddOrder '06024163  ','0001',' ',38777.5, 'BRASSERIES KRONENBOURG 5', @OrderID OUTPUT
EXEC dbo.AddOrder '06024165  ','0001',' ',38777.5, 'BRASSERIES KRONENBOURG 5', @OrderID OUTPUT
EXEC dbo.AddOrder '06024167  ','0001',' ',38775.5, 'BRASSERIES KRONENBOURG 5', @OrderID OUTPUT
EXEC dbo.AddOrder '06024167  ','0001','a',38775.5, 'BRASSERIES KRONENBOURG 5', @OrderID OUTPUT
EXEC dbo.AddOrder '06024170  ','0001',' ',38780.5, 'VISTEON SYSTEMES INTERIE', @OrderID OUTPUT
EXEC dbo.AddOrder '06024170  ','0001','b',38780.5, 'VISTEON SYSTEMES INTERIE', @OrderID OUTPUT
EXEC dbo.AddOrder '06024171  ','0001',' ',38791.5, 'VISTEON SYSTEMES INTERIE', @OrderID OUTPUT
EXEC dbo.AddOrder '06024174  ','0001',' ',38789.5, 'ECLAIRAGE TECHNIQUE', @OrderID OUTPUT
EXEC dbo.AddOrder '06024176  ','0001',' ',38790.5, 'ECLAIRAGE TECHNIQUE', @OrderID OUTPUT
EXEC dbo.AddOrder '06024181  ','0001',' ',38782.5, 'NESTLE WATERS SUPPLY EST', @OrderID OUTPUT
EXEC dbo.AddOrder '06024183  ','0001',' ',38790.5, 'NESTLE WATERS SUPPLY EST', @OrderID OUTPUT
EXEC dbo.AddOrder '06024185  ','0001',' ',38794.5, 'NESTLE WATERS SUPPLY EST', @OrderID OUTPUT
EXEC dbo.AddOrder '06024187  ','0001',' ',38796.5, 'NESTLE WATERS SUPPLY EST', @OrderID OUTPUT
EXEC dbo.AddOrder '06024189  ','0001',' ',38797.5, 'NESTLE WATERS SUPPLY EST', @OrderID OUTPUT
EXEC dbo.AddOrder '06024191  ','0001',' ',38798.5, 'NESTLE WATERS SUPPLY EST', @OrderID OUTPUT
EXEC dbo.AddOrder '06024193  ','0001',' ',38802.5, 'NESTLE WATERS SUPPLY EST', @OrderID OUTPUT
EXEC dbo.AddOrder '06024195  ','0001',' ',38803.5, 'NESTLE WATERS SUPPLY EST', @OrderID OUTPUT
EXEC dbo.AddOrder '06024199  ','0001',' ',38784.5, 'NESTLE WATERS SUPPLY EST', @OrderID OUTPUT
EXEC dbo.AddOrder '06024201  ','0001',' ',38788.5, 'NESTLE WATERS SUPPLY EST', @OrderID OUTPUT
EXEC dbo.AddOrder '06024203  ','0001',' ',38789.5, 'NESTLE WATERS SUPPLY EST', @OrderID OUTPUT
EXEC dbo.AddOrder '06024205  ','0001',' ',38782.5, 'SAEM DE RIBEAUVILLE', @OrderID OUTPUT
EXEC dbo.AddOrder '06024206  ','0001',' ',38783.5, 'PEUGEOT CITROEN AUTOMOBI', @OrderID OUTPUT
EXEC dbo.AddOrder '06024209  ','0001',' ',38776.5, 'BRASSERIE FISCHER SA', @OrderID OUTPUT
EXEC dbo.AddOrder '06024211  ','0001',' ',38783.5, 'BRASSERIE FISCHER SA', @OrderID OUTPUT
EXEC dbo.AddOrder '06024213  ','0001',' ',38781.5, 'BRASSERIE FISCHER SA', @OrderID OUTPUT
EXEC dbo.AddOrder '06024216  ','0001',' ',38783.5, 'GEORGIA-PACIFIC FRANCE', @OrderID OUTPUT
EXEC dbo.AddOrder '06024217  ','0001',' ',38784.5, 'WELL-PACK AG', @OrderID OUTPUT
EXEC dbo.AddOrder '06024219  ','0001',' ',38776.5, 'BRASSERIES KRONENBOURG 5', @OrderID OUTPUT
EXEC dbo.AddOrder '06024221  ','0001',' ',38775.5, 'BRASSERIES KRONENBOURG 5', @OrderID OUTPUT
EXEC dbo.AddOrder '06024223  ','0001',' ',38776.5, 'BRASSERIES KRONENBOURG 5', @OrderID OUTPUT
EXEC dbo.AddOrder '06024225  ','0001',' ',38776.5, 'BRASSERIES KRONENBOURG 5', @OrderID OUTPUT
EXEC dbo.AddOrder '06024225  ','0001','a',38776.5, 'BRASSERIES KRONENBOURG 5', @OrderID OUTPUT
EXEC dbo.AddOrder '06024225  ','0001','b',38776.5, 'BRASSERIES KRONENBOURG 5', @OrderID OUTPUT
EXEC dbo.AddOrder '06024227  ','0001',' ',38776.5, 'BRASSERIES KRONENBOURG 5', @OrderID OUTPUT
EXEC dbo.AddOrder '06024230  ','0001',' ',38780.5, 'TUCHENHAGEN GMBH', @OrderID OUTPUT
EXEC dbo.AddOrder '06024232  ','0001',' ',38804.5, 'FABI AUTOMOBILE', @OrderID OUTPUT
EXEC dbo.AddOrder '06024233  ','0001',' ',38804.5, 'FABI AUTOMOBILE', @OrderID OUTPUT
EXEC dbo.AddOrder '06024234  ','0001',' ',38804.5, 'FABI AUTOMOBILE', @OrderID OUTPUT
EXEC dbo.AddOrder '06024235  ','0001',' ',38804.5, 'FABI AUTOMOBILE', @OrderID OUTPUT
EXEC dbo.AddOrder '06024236  ','0001',' ',38804.5, 'FABI AUTOMOBILE', @OrderID OUTPUT
EXEC dbo.AddOrder '06024238  ','0001',' ',38825.5, 'FABI AUTOMOBILE', @OrderID OUTPUT
EXEC dbo.AddOrder '06024239  ','0001',' ',38825.5, 'FABI AUTOMOBILE', @OrderID OUTPUT
EXEC dbo.AddOrder '06024240  ','0001',' ',38825.5, 'FABI AUTOMOBILE', @OrderID OUTPUT
EXEC dbo.AddOrder '06024241  ','0001',' ',38825.5, 'FABI AUTOMOBILE', @OrderID OUTPUT
EXEC dbo.AddOrder '06024242  ','0001',' ',38825.5, 'FABI AUTOMOBILE', @OrderID OUTPUT
EXEC dbo.AddOrder '06024244  ','0001',' ',38833.5, 'FABI AUTOMOBILE', @OrderID OUTPUT
EXEC dbo.AddOrder '06024245  ','0001',' ',38833.5, 'FABI AUTOMOBILE', @OrderID OUTPUT
EXEC dbo.AddOrder '06024246  ','0001',' ',38833.5, 'FABI AUTOMOBILE', @OrderID OUTPUT
EXEC dbo.AddOrder '06024247  ','0001',' ',38833.5, 'FABI AUTOMOBILE', @OrderID OUTPUT
EXEC dbo.AddOrder '06024248  ','0001',' ',38833.5, 'FABI AUTOMOBILE', @OrderID OUTPUT
EXEC dbo.AddOrder '06024250  ','0001',' ',38846.5, 'FABI AUTOMOBILE', @OrderID OUTPUT
EXEC dbo.AddOrder '06024251  ','0001',' ',38846.5, 'FABI AUTOMOBILE', @OrderID OUTPUT
EXEC dbo.AddOrder '06024252  ','0001',' ',38846.5, 'FABI AUTOMOBILE', @OrderID OUTPUT
EXEC dbo.AddOrder '06024253  ','0001',' ',38846.5, 'FABI AUTOMOBILE', @OrderID OUTPUT
EXEC dbo.AddOrder '06024254  ','0001',' ',38846.5, 'FABI AUTOMOBILE', @OrderID OUTPUT
EXEC dbo.AddOrder '06024256  ','0001',' ',38781.5, 'BRASSERIE FISCHER SA', @OrderID OUTPUT
EXEC dbo.AddOrder '06024260  ','0001',' ',38780.5, 'WELL-PACK AG', @OrderID OUTPUT
EXEC dbo.AddOrder '06024260  ','0001','a',38780.5, 'WELL-PACK AG', @OrderID OUTPUT
EXEC dbo.AddOrder '06024260  ','0001','b',38780.5, 'WELL-PACK AG', @OrderID OUTPUT
EXEC dbo.AddOrder '06024263  ','0001',' ',38787.5, 'PATHEON', @OrderID OUTPUT
EXEC dbo.AddOrder '06024265  ','0001',' ',38783.5, 'BRASSERIE FISCHER SA', @OrderID OUTPUT
EXEC dbo.AddOrder '06024267  ','0001',' ',38796.5, 'PATHEON', @OrderID OUTPUT
EXEC dbo.AddOrder '06024269  ','0001',' ',38784.5, 'SAINT GOBAIN ISOVER', @OrderID OUTPUT
EXEC dbo.AddOrder '06024272  ','0001',' ',38796.5, 'PATHEON', @OrderID OUTPUT
EXEC dbo.AddOrder '06024277  ','0001',' ',38790.5, 'HEXCEL FABRICS S.A.', @OrderID OUTPUT
EXEC dbo.AddOrder '06024278  ','0001',' ',38776.5, 'NESTLE WATERS SUPPLY EST', @OrderID OUTPUT
EXEC dbo.AddOrder '06024280  ','0001',' ',38789.5, 'DICESA SA', @OrderID OUTPUT
EXEC dbo.AddOrder '06024281  ','0001',' ',38794.5, 'ED.FRIEDRICH & CO GMBH', @OrderID OUTPUT
EXEC dbo.AddOrder '06024282  ','0001',' ',38794.5, 'ED.FRIEDRICH & CO GMBH', @OrderID OUTPUT
EXEC dbo.AddOrder '06024290  ','0001',' ',38791.5, 'ECS', @OrderID OUTPUT
EXEC dbo.AddOrder '06024291  ','0001',' ',38784.5, 'TRISS SPOL.S.R.O.', @OrderID OUTPUT
EXEC dbo.AddOrder '06024294  ','0001',' ',38781.5, 'COGESAL MIKO-FSEUR 58488', @OrderID OUTPUT
EXEC dbo.AddOrder '06024295  ','0001',' ',38782.5, 'COGESAL MIKO-FSEUR 58488', @OrderID OUTPUT
EXEC dbo.AddOrder '06024296  ','0001',' ',38783.5, 'COGESAL MIKO-FSEUR 58488', @OrderID OUTPUT
EXEC dbo.AddOrder '06024297  ','0001',' ',38775.5, 'B.V.ALVERIMPORT', @OrderID OUTPUT
EXEC dbo.AddOrder '06024298  ','0001',' ',38775.5, 'B.V.ALVERIMPORT', @OrderID OUTPUT
EXEC dbo.AddOrder '06024300  ','0001',' ',38790.5, 'SESAM SNC', @OrderID OUTPUT
EXEC dbo.AddOrder '06024302  ','0001',' ',38781.5, 'TIMKEN EUROPE', @OrderID OUTPUT
EXEC dbo.AddOrder '06024304  ','0001',' ',38781.5, 'REHAU AG & CO', @OrderID OUTPUT
EXEC dbo.AddOrder '06024304  ','0001','a',38781.5, 'REHAU AG & CO', @OrderID OUTPUT
EXEC dbo.AddOrder '06024306  ','0001',' ',38780.5, 'STE SIMU', @OrderID OUTPUT
EXEC dbo.AddOrder '06024307  ','0001',' ',38783.5, 'DS SMITH KAYSERSBERG', @OrderID OUTPUT
EXEC dbo.AddOrder '06024308  ','0001',' ',38791.5, 'DS SMITH KAYPAC', @OrderID OUTPUT
EXEC dbo.AddOrder '06024309  ','0001',' ',38782.5, 'WELL-PACK AG', @OrderID OUTPUT
EXEC dbo.AddOrder '06024312  ','0001',' ',38780.5, 'OPTIBELT', @OrderID OUTPUT
EXEC dbo.AddOrder '06024314  ','0001',' ',38776.5, 'NESTLE WATERS SUPPLY EST', @OrderID OUTPUT
EXEC dbo.AddOrder '06024316  ','0001',' ',38783.5, 'NESTLE WATERS SUPPLY EST', @OrderID OUTPUT
EXEC dbo.AddOrder '06024317  ','0001',' ',38782.5, 'W. WIRTH GMBH', @OrderID OUTPUT
EXEC dbo.AddOrder '06024317  ','0001','b',38782.5, 'W. WIRTH GMBH', @OrderID OUTPUT
EXEC dbo.AddOrder '06024318  ','0001',' ',38780.5, 'DIEFENBACH VERPACKUNGEN', @OrderID OUTPUT
EXEC dbo.AddOrder '06024320  ','0001',' ',38784.5, 'BRASSERIES HEINEKEN SA', @OrderID OUTPUT
EXEC dbo.AddOrder '06024322  ','0001',' ',38781.5, 'THK MANUFACTURING OF EUR', @OrderID OUTPUT
EXEC dbo.AddOrder '06024323  ','0001',' ',38781.5, 'THK MANUFACTURING OF EUR', @OrderID OUTPUT
EXEC dbo.AddOrder '06024324  ','0001',' ',38781.5, 'THK MANUFACTURING OF EUR', @OrderID OUTPUT
EXEC dbo.AddOrder '06024326  ','0001',' ',38777.5, 'SCHWEITZER S.A.', @OrderID OUTPUT
EXEC dbo.AddOrder '06024327  ','0001',' ',38781.5, 'TECUMSEH EUROPE S.A.', @OrderID OUTPUT
EXEC dbo.AddOrder '06024331  ','0001',' ',38783.5, 'SCHWEITZER S.A.', @OrderID OUTPUT
EXEC dbo.AddOrder '06024333  ','0001',' ',38789.5, 'SCHWEITZER S.A.', @OrderID OUTPUT
EXEC dbo.AddOrder '06024335  ','0001',' ',38790.5, 'SCHWEITZER S.A.', @OrderID OUTPUT
EXEC dbo.AddOrder '06024338  ','0001',' ',38776.5, 'SCHWEITZER S.A.', @OrderID OUTPUT
EXEC dbo.AddOrder '06024340  ','0001',' ',38798.5, 'SMURFIT PROVENCE,ALPES,', @OrderID OUTPUT
EXEC dbo.AddOrder '06024342  ','0001',' ',38796.5, 'SMURFIT PROVENCE,ALPES,', @OrderID OUTPUT
EXEC dbo.AddOrder '06024343  ','0001',' ',38803.5, 'LINNEMANN-SCHNETZER', @OrderID OUTPUT
EXEC dbo.AddOrder '06024344  ','0001',' ',38803.5, 'LINNEMANN-SCHNETZER', @OrderID OUTPUT
EXEC dbo.AddOrder '06024345  ','0001',' ',38803.5, 'LINNEMANN-SCHNETZER', @OrderID OUTPUT
EXEC dbo.AddOrder '06024347  ','0001',' ',38781.5, 'NESTLE WATERS SUPPLY EST', @OrderID OUTPUT
EXEC dbo.AddOrder '06024349  ','0001',' ',38780.5, 'DOW AGROSCIENCES SWITERL', @OrderID OUTPUT
EXEC dbo.AddOrder '06024352  ','0001',' ',38783.5, 'NESTLE WATERS SUPPLY EST', @OrderID OUTPUT
EXEC dbo.AddOrder '06024354  ','0001',' ',38782.5, 'NESTLE WATERS SUPPLY EST', @OrderID OUTPUT
EXEC dbo.AddOrder '06024355  ','0001',' ',38780.5, 'DOW AGROSCIENCES SWITERL', @OrderID OUTPUT
EXEC dbo.AddOrder '06024356  ','0001',' ',38780.5, 'DOW AGROSCIENCES SWITERL', @OrderID OUTPUT
EXEC dbo.AddOrder '06024357  ','0001',' ',38780.5, 'DOW AGROSCIENCES SWITERL', @OrderID OUTPUT
EXEC dbo.AddOrder '06024358  ','0001',' ',38787.5, 'SMURFIT PROVENCE,ALPES,', @OrderID OUTPUT
EXEC dbo.AddOrder '06024360  ','0001',' ',38780.5, 'DOW-AGROSCIENCES ITALIA', @OrderID OUTPUT
EXEC dbo.AddOrder '06024361  ','0001',' ',38780.5, 'DOW-AGROSCIENCES ITALIA', @OrderID OUTPUT
EXEC dbo.AddOrder '06024362  ','0001',' ',38780.5, 'DOW-AGROSCIENCES ITALIA', @OrderID OUTPUT
EXEC dbo.AddOrder '06024362  ','0001','a',38781.5, 'DOW-AGROSCIENCES ITALIA', @OrderID OUTPUT
EXEC dbo.AddOrder '06024363  ','0001',' ',38780.5, 'DOW-AGROSCIENCES ITALIA', @OrderID OUTPUT
EXEC dbo.AddOrder '06024364  ','0001',' ',38780.5, 'DOW-AGROSCIENCES ITALIA', @OrderID OUTPUT
EXEC dbo.AddOrder '06024366  ','0001',' ',38781.5, 'DOW AGROSCIENCES SWITZEL', @OrderID OUTPUT
EXEC dbo.AddOrder '06024370  ','0001',' ',38808.5, 'STE SIMU', @OrderID OUTPUT
EXEC dbo.AddOrder '06024372  ','0001',' ',38781.5, 'COGESAL MIKO-FSEUR 58488', @OrderID OUTPUT
EXEC dbo.AddOrder '06024373  ','0001',' ',38782.5, 'COGESAL MIKO-FSEUR 58488', @OrderID OUTPUT
EXEC dbo.AddOrder '06024376  ','0001',' ',38780.5, 'COGESAL MIKO-FSEUR 58488', @OrderID OUTPUT
EXEC dbo.AddOrder '06024377  ','0001',' ',38782.5, 'COGESAL MIKO-FSEUR 58488', @OrderID OUTPUT
EXEC dbo.AddOrder '06024377  ','0001','b',38782.5, 'COGESAL MIKO-FSEUR 58488', @OrderID OUTPUT
EXEC dbo.AddOrder '06024378  ','0001',' ',38780.5, 'COGESAL MIKO-FSEUR 58488', @OrderID OUTPUT
EXEC dbo.AddOrder '06024379  ','0001',' ',38780.5, 'COGESAL MIKO-FSEUR 58488', @OrderID OUTPUT
EXEC dbo.AddOrder '06024380  ','0001',' ',38782.5, 'COGESAL MIKO-FSEUR 58488', @OrderID OUTPUT
EXEC dbo.AddOrder '06024381  ','0001',' ',38783.5, 'COGESAL MIKO-FSEUR 58488', @OrderID OUTPUT
EXEC dbo.AddOrder '06024383  ','0001',' ',38777.5, 'COGESAL MIKO-FSEUR 58488', @OrderID OUTPUT
EXEC dbo.AddOrder '06024384  ','0001',' ',38781.5, 'COGESAL MIKO-FSEUR 58488', @OrderID OUTPUT
EXEC dbo.AddOrder '06024385  ','0001',' ',38782.5, 'COGESAL MIKO-FSEUR 58488', @OrderID OUTPUT
EXEC dbo.AddOrder '06024388  ','0001',' ',38777.5, 'COGESAL MIKO-FSEUR 58488', @OrderID OUTPUT
EXEC dbo.AddOrder '06024390  ','0001',' ',38781.5, 'COGESAL MIKO-FSEUR 58488', @OrderID OUTPUT
EXEC dbo.AddOrder '06024391  ','0001',' ',38782.5, 'COGESAL MIKO-FSEUR 58488', @OrderID OUTPUT
EXEC dbo.AddOrder '06024393  ','0001',' ',38777.5, 'COGESAL MIKO-FSEUR 58488', @OrderID OUTPUT
EXEC dbo.AddOrder '06024394  ','0001',' ',38782.5, 'COGESAL MIKO-FSEUR 58488', @OrderID OUTPUT
EXEC dbo.AddOrder '06024396  ','0001',' ',38783.5, 'VERPACKUNGS MACHER GMBH', @OrderID OUTPUT
EXEC dbo.AddOrder '06024397  ','0001',' ',38781.5, 'COGESAL MIKO-FSEUR 58488', @OrderID OUTPUT
EXEC dbo.AddOrder '06024398  ','0001',' ',38782.5, 'COGESAL MIKO-FSEUR 58488', @OrderID OUTPUT
EXEC dbo.AddOrder '06024400  ','0001',' ',38780.5, 'COGESAL MIKO-FSEUR 58488', @OrderID OUTPUT
EXEC dbo.AddOrder '06024401  ','0001',' ',38781.5, 'COGESAL MIKO-FSEUR 58488', @OrderID OUTPUT
EXEC dbo.AddOrder '06024401  ','0001','a',38781.5, 'COGESAL MIKO-FSEUR 58488', @OrderID OUTPUT
EXEC dbo.AddOrder '06024403  ','0001',' ',38780.5, 'COGESAL MIKO-FSEUR 58488', @OrderID OUTPUT
EXEC dbo.AddOrder '06024404  ','0001',' ',38780.5, 'COGESAL MIKO-FSEUR 58488', @OrderID OUTPUT
EXEC dbo.AddOrder '06024405  ','0001',' ',38781.5, 'COGESAL MIKO-FSEUR 58488', @OrderID OUTPUT
EXEC dbo.AddOrder '06024406  ','0001',' ',38782.5, 'COGESAL MIKO-FSEUR 58488', @OrderID OUTPUT
EXEC dbo.AddOrder '06024407  ','0001',' ',38783.5, 'COGESAL MIKO-FSEUR 58488', @OrderID OUTPUT
EXEC dbo.AddOrder '06024407  ','0001','a',38783.5, 'COGESAL MIKO-FSEUR 58488', @OrderID OUTPUT
EXEC dbo.AddOrder '06024408  ','0001',' ',38780.5, 'DOW AGROSCIENCES', @OrderID OUTPUT
EXEC dbo.AddOrder '06024409  ','0001',' ',38780.5, 'DOW AGROSCIENCES', @OrderID OUTPUT
EXEC dbo.AddOrder '06024410  ','0001',' ',38780.5, 'DOW AGROSCIENCES', @OrderID OUTPUT
EXEC dbo.AddOrder '06024411  ','0001',' ',38780.5, 'DOW AGROSCIENCES', @OrderID OUTPUT
EXEC dbo.AddOrder '06024412  ','0001',' ',38781.5, 'DOW AGROSCIENCES', @OrderID OUTPUT
EXEC dbo.AddOrder '06024413  ','0001',' ',38780.5, 'DOW AGROSCIENCES', @OrderID OUTPUT
EXEC dbo.AddOrder '06024414  ','0001',' ',38780.5, 'DOW AGROSCIENCES', @OrderID OUTPUT
EXEC dbo.AddOrder '06024415  ','0001',' ',38780.5, 'DOW AGROSCIENCES', @OrderID OUTPUT
EXEC dbo.AddOrder '06024416  ','0001',' ',38781.5, 'DOW AGROSCIENCES', @OrderID OUTPUT
EXEC dbo.AddOrder '06024417  ','0001',' ',38781.5, 'DOW AGROSCIENCES', @OrderID OUTPUT
EXEC dbo.AddOrder '06024418  ','0001',' ',38781.5, 'DOW AGROSCIENCES', @OrderID OUTPUT
EXEC dbo.AddOrder '06024419  ','0001',' ',38780.5, 'DOW AGROSCIENCES', @OrderID OUTPUT
EXEC dbo.AddOrder '06024420  ','0001',' ',38781.5, 'DOW AGROSCIENCES', @OrderID OUTPUT
EXEC dbo.AddOrder '06024421  ','0001',' ',38780.5, 'DOW AGROSCIENCES', @OrderID OUTPUT
EXEC dbo.AddOrder '06024422  ','0001',' ',38780.5, 'DOW AGROSCIENCES', @OrderID OUTPUT
EXEC dbo.AddOrder '06024423  ','0001',' ',38780.5, 'DOW AGROSCIENCES', @OrderID OUTPUT
EXEC dbo.AddOrder '06024423  ','0001','a',38781.5, 'DOW AGROSCIENCES', @OrderID OUTPUT
EXEC dbo.AddOrder '06024424  ','0001',' ',38781.5, 'DOW AGROSCIENCES', @OrderID OUTPUT
EXEC dbo.AddOrder '06024425  ','0001',' ',38781.5, 'DOW AGROSCIENCES', @OrderID OUTPUT
EXEC dbo.AddOrder '06024428  ','0001',' ',38776.5, 'DOW AGROSCIENCES SWITZEL', @OrderID OUTPUT
EXEC dbo.AddOrder '06024428  ','0001','a',38781.5, 'DOW AGROSCIENCES SWITZEL', @OrderID OUTPUT
EXEC dbo.AddOrder '06024429  ','0001',' ',38783.5, 'SYMA-SYSTEM AG', @OrderID OUTPUT
EXEC dbo.AddOrder '06030004  ','0001',' ',38781.5, 'S.M.A.E.    (EDI)', @OrderID OUTPUT
EXEC dbo.AddOrder '06030006  ','0001',' ',38781.5, 'S.M.A.E.    (EDI)', @OrderID OUTPUT
EXEC dbo.AddOrder '06030008  ','0001',' ',38784.5, 'S.M.A.E. ZI METZ BORNY (', @OrderID OUTPUT
EXEC dbo.AddOrder '06030009  ','0001',' ',38784.5, 'S.M.A.E. ZI METZ BORNY (', @OrderID OUTPUT
EXEC dbo.AddOrder '06030010  ','0001',' ',38784.5, 'S.M.A.E. ZI METZ BORNY (', @OrderID OUTPUT
EXEC dbo.AddOrder '06030011  ','0001',' ',38784.5, 'S.M.A.E. ZI METZ BORNY (', @OrderID OUTPUT
EXEC dbo.AddOrder '06030012  ','0001',' ',38784.5, 'S.M.A.E. ZI METZ BORNY (', @OrderID OUTPUT
EXEC dbo.AddOrder '06030014  ','0001',' ',38784.5, 'S.M.A.E. ZI METZ BORNY (', @OrderID OUTPUT
EXEC dbo.AddOrder '06030016  ','0001',' ',38784.5, 'S.M.A.E. ZI METZ BORNY (', @OrderID OUTPUT
EXEC dbo.AddOrder '06030017  ','0001',' ',38784.5, 'S.M.A.E. ZI METZ BORNY (', @OrderID OUTPUT
EXEC dbo.AddOrder '06030018  ','0001',' ',38784.5, 'S.M.A.E. ZI METZ BORNY (', @OrderID OUTPUT
EXEC dbo.AddOrder '06030019  ','0001',' ',38784.5, 'S.M.A.E. ZI METZ BORNY (', @OrderID OUTPUT
EXEC dbo.AddOrder '06030020  ','0001',' ',38784.5, 'S.M.A.E. ZI METZ BORNY (', @OrderID OUTPUT
EXEC dbo.AddOrder '06030022  ','0001',' ',38788.5, 'BRASSERIE FISCHER SA', @OrderID OUTPUT
EXEC dbo.AddOrder '06030024  ','0001',' ',38788.5, 'SCHWEITZER S.A.', @OrderID OUTPUT
EXEC dbo.AddOrder '06030026  ','0001',' ',38784.5, 'DS SMITH KAYSERSBERG', @OrderID OUTPUT
EXEC dbo.AddOrder '06030029  ','0001',' ',38784.5, 'PRODINGER VERPACKUNG', @OrderID OUTPUT
EXEC dbo.AddOrder '06030031  ','0001',' ',38773.5, 'D.P.F. DIFFUS.PREST.FIAB', @OrderID OUTPUT
EXEC dbo.AddOrder '06030033  ','0001',' ',38805.5, 'BUBENDORFF VOLET ROULANT', @OrderID OUTPUT
EXEC dbo.AddOrder '06030034  ','0001',' ',38812.5, 'BUBENDORFF VOLET ROULANT', @OrderID OUTPUT
EXEC dbo.AddOrder '06030035  ','0001',' ',38817.5, 'BUBENDORFF VOLET ROULANT', @OrderID OUTPUT
EXEC dbo.AddOrder '06030037  ','0001',' ',38805.5, 'BUBENDORFF VOLET ROULANT', @OrderID OUTPUT
EXEC dbo.AddOrder '06030038  ','0001',' ',38805.5, 'BUBENDORFF VOLET ROULANT', @OrderID OUTPUT
EXEC dbo.AddOrder '06030039  ','0001',' ',38805.5, 'BUBENDORFF VOLET ROULANT', @OrderID OUTPUT
EXEC dbo.AddOrder '06030041  ','0001',' ',38791.5, 'BUBENDORFF VOLET ROULANT', @OrderID OUTPUT
EXEC dbo.AddOrder '06030043  ','0001',' ',38791.5, 'BUBENDORFF VOLET ROULANT', @OrderID OUTPUT
EXEC dbo.AddOrder '06030044  ','0001',' ',38805.5, 'BUBENDORFF VOLET ROULANT', @OrderID OUTPUT
EXEC dbo.AddOrder '06030045  ','0001',' ',38791.5, 'BUBENDORFF VOLET ROULANT', @OrderID OUTPUT
EXEC dbo.AddOrder '06030046  ','0001',' ',38805.5, 'BUBENDORFF VOLET ROULANT', @OrderID OUTPUT
EXEC dbo.AddOrder '06030047  ','0001',' ',38791.5, 'BUBENDORFF VOLET ROULANT', @OrderID OUTPUT
EXEC dbo.AddOrder '06030052  ','0001',' ',38791.5, 'BUBENDORFF VOLET ROULANT', @OrderID OUTPUT
EXEC dbo.AddOrder '06030056  ','0001',' ',38782.5, 'THYSSENKRUPP PRESTA FRAN', @OrderID OUTPUT
EXEC dbo.AddOrder '06030057  ','0001',' ',38790.5, 'WELL-PACK AG', @OrderID OUTPUT
EXEC dbo.AddOrder '06030059  ','0001',' ',38791.5, 'BUBENDORFF VOLET ROULANT', @OrderID OUTPUT
EXEC dbo.AddOrder '06030060  ','0001',' ',38781.5, 'PRODENE KLINT ESPACE LEA', @OrderID OUTPUT
EXEC dbo.AddOrder '06030060  ','0001','a',38781.5, 'PRODENE KLINT ESPACE LEA', @OrderID OUTPUT
EXEC dbo.AddOrder '06030061  ','0001',' ',38791.5, 'THYSSENKRUPP PRESTA FRAN', @OrderID OUTPUT
EXEC dbo.AddOrder '06030063  ','0001',' ',38783.5, 'BRASSERIE FISCHER SA', @OrderID OUTPUT
EXEC dbo.AddOrder '06030064  ','0001',' ',38783.5, 'BRASSERIE FISCHER SA', @OrderID OUTPUT
EXEC dbo.AddOrder '06030066  ','0001',' ',38854.5, 'WELL-PACK AG', @OrderID OUTPUT
EXEC dbo.AddOrder '06030069  ','0001',' ',38804.5, 'BUBENDORFF VOLET ROULANT', @OrderID OUTPUT
EXEC dbo.AddOrder '06030070  ','0001',' ',38811.5, 'BUBENDORFF VOLET ROULANT', @OrderID OUTPUT
EXEC dbo.AddOrder '06030071  ','0001',' ',38825.5, 'BUBENDORFF VOLET ROULANT', @OrderID OUTPUT
EXEC dbo.AddOrder '06030073  ','0001',' ',38797.5, 'BUBENDORFF VOLET ROULANT', @OrderID OUTPUT
EXEC dbo.AddOrder '06030074  ','0001',' ',38804.5, 'BUBENDORFF VOLET ROULANT', @OrderID OUTPUT
EXEC dbo.AddOrder '06030075  ','0001',' ',38811.5, 'BUBENDORFF VOLET ROULANT', @OrderID OUTPUT
EXEC dbo.AddOrder '06030076  ','0001',' ',38816.5, 'BUBENDORFF VOLET ROULANT', @OrderID OUTPUT
EXEC dbo.AddOrder '06030078  ','0001',' ',38797.5, 'BUBENDORFF VOLET ROULANT', @OrderID OUTPUT
EXEC dbo.AddOrder '06030079  ','0001',' ',38804.5, 'BUBENDORFF VOLET ROULANT', @OrderID OUTPUT
EXEC dbo.AddOrder '06030080  ','0001',' ',38811.5, 'BUBENDORFF VOLET ROULANT', @OrderID OUTPUT
EXEC dbo.AddOrder '06030081  ','0001',' ',38816.5, 'BUBENDORFF VOLET ROULANT', @OrderID OUTPUT
EXEC dbo.AddOrder '06030085  ','0001',' ',38811.5, 'BUBENDORFF VOLET ROULANT', @OrderID OUTPUT
EXEC dbo.AddOrder '06030086  ','0001',' ',38811.5, 'BUBENDORFF VOLET ROULANT', @OrderID OUTPUT
EXEC dbo.AddOrder '06030087  ','0001',' ',38811.5, 'BUBENDORFF VOLET ROULANT', @OrderID OUTPUT
EXEC dbo.AddOrder '06030089  ','0001',' ',38784.5, 'AMERICAN STANDARD EUROPE', @OrderID OUTPUT
EXEC dbo.AddOrder '06030092  ','0001',' ',38777.5, 'NOVARTIS CONSUMER HEALTH', @OrderID OUTPUT
EXEC dbo.AddOrder '06030093  ','0001',' ',38777.5, 'NOVARTIS CONSUMER HEALTH', @OrderID OUTPUT
EXEC dbo.AddOrder '06030095  ','0001',' ',38781.5, 'BRASSERIE FISCHER SA', @OrderID OUTPUT
EXEC dbo.AddOrder '06030097  ','0001',' ',38781.5, 'BRASSERIE FISCHER SA', @OrderID OUTPUT
EXEC dbo.AddOrder '06030099  ','0001',' ',38787.5, 'REICHOLD FEINKOST GMBH', @OrderID OUTPUT
EXEC dbo.AddOrder '06030101  ','0001',' ',38809.5, 'REICHOLD FEINKOST GMBH', @OrderID OUTPUT
EXEC dbo.AddOrder '06030103  ','0001',' ',38795.5, 'REICHOLD FEINKOST GMBH', @OrderID OUTPUT
EXEC dbo.AddOrder '06030105  ','0001',' ',38784.5, 'SOMFY', @OrderID OUTPUT
EXEC dbo.AddOrder '06030107  ','0001',' ',38776.5, 'NESTLE WATERS SUPPLY EST', @OrderID OUTPUT
EXEC dbo.AddOrder '06030109  ','0001',' ',38776.5, 'NESTLE WATERS SUPPLY EST', @OrderID OUTPUT
EXEC dbo.AddOrder '06030111  ','0001',' ',38776.5, 'NESTLE WATERS SUPPLY EST', @OrderID OUTPUT
EXEC dbo.AddOrder '06030113  ','0001',' ',38777.5, 'NESTLE WATERS SUPPLY EST', @OrderID OUTPUT
EXEC dbo.AddOrder '06030115  ','0001',' ',38777.5, 'NESTLE WATERS SUPPLY EST', @OrderID OUTPUT
EXEC dbo.AddOrder '06030117  ','0001',' ',38781.5, 'NESTLE WATERS SUPPLY EST', @OrderID OUTPUT
EXEC dbo.AddOrder '06030119  ','0001',' ',38780.5, 'NESTLE WATERS SUPPLY EST', @OrderID OUTPUT
EXEC dbo.AddOrder '06030121  ','0001',' ',38780.5, 'NESTLE WATERS SUPPLY EST', @OrderID OUTPUT
EXEC dbo.AddOrder '06030123  ','0001',' ',38781.5, 'NESTLE WATERS SUPPLY EST', @OrderID OUTPUT
EXEC dbo.AddOrder '06030125  ','0001',' ',38782.5, 'NESTLE WATERS SUPPLY EST', @OrderID OUTPUT
EXEC dbo.AddOrder '06030128  ','0001',' ',38783.5, 'NESTLE WATERS SUPPLY EST', @OrderID OUTPUT
EXEC dbo.AddOrder '06030130  ','0001',' ',38787.5, 'NESTLE WATERS SUPPLY EST', @OrderID OUTPUT
EXEC dbo.AddOrder '06030131  ','0001',' ',38781.5, 'PEUGEOT CITROEN AUTOMOBI', @OrderID OUTPUT
EXEC dbo.AddOrder '06030132  ','0001',' ',38791.5, 'RICOH INDUSTRIE FRANCE', @OrderID OUTPUT
EXEC dbo.AddOrder '06030134  ','0001',' ',38780.5, 'WELL-PACK AG', @OrderID OUTPUT
EXEC dbo.AddOrder '06030135  ','0001',' ',38795.5, 'RICOH INDUSTRIE FRANCE', @OrderID OUTPUT
EXEC dbo.AddOrder '06030137  ','0001',' ',38795.5, 'ZEHNDER GMBH', @OrderID OUTPUT
EXEC dbo.AddOrder '06030138  ','0001',' ',38795.5, 'ZEHNDER GMBH', @OrderID OUTPUT
EXEC dbo.AddOrder '06030145  ','0001',' ',38782.5, 'MGI COUTIER', @OrderID OUTPUT
EXEC dbo.AddOrder '06030147  ','0001',' ',38790.5, 'FREUDENBERG POLITEX S.A.', @OrderID OUTPUT
EXEC dbo.AddOrder '06030149  ','0001',' ',38782.5, 'MOEBEL-TRANSPORT AG', @OrderID OUTPUT
EXEC dbo.AddOrder '06030150  ','0001',' ',38781.5, 'MOEBEL-TRANSPORT AG', @OrderID OUTPUT
EXEC dbo.AddOrder '06030151  ','0001',' ',38782.5, 'MOEBEL-TRANSPORT AG', @OrderID OUTPUT
EXEC dbo.AddOrder '06030152  ','0001',' ',38781.5, 'MOEBEL-TRANSPORT AG', @OrderID OUTPUT
EXEC dbo.AddOrder '06030153  ','0001',' ',38783.5, 'BRASSERIE FISCHER SA', @OrderID OUTPUT
EXEC dbo.AddOrder '06030155  ','0001',' ',38783.5, 'BRASSERIE FISCHER SA', @OrderID OUTPUT
EXEC dbo.AddOrder '06030157  ','0001',' ',38780.5, 'FRIEDRICH BOYSEN GMBH &', @OrderID OUTPUT
EXEC dbo.AddOrder '06030158  ','0001',' ',38812.5, 'FRIEDRICH BOYSEN GMBH &', @OrderID OUTPUT
EXEC dbo.AddOrder '06030160  ','0001',' ',38787.5, 'BRASSERIE FISCHER SA', @OrderID OUTPUT
EXEC dbo.AddOrder '06030172  ','0001',' ',38782.5, 'TOUT''EMBALL-ZI. DE CROUP', @OrderID OUTPUT
EXEC dbo.AddOrder '06030175  ','0001',' ',38802.5, 'DELIPAPIER', @OrderID OUTPUT
EXEC dbo.AddOrder '06030176  ','0001',' ',38790.5, 'DELIPAPIER', @OrderID OUTPUT
EXEC dbo.AddOrder '06030177  ','0001',' ',38790.5, 'DELIPAPIER', @OrderID OUTPUT
EXEC dbo.AddOrder '06030178  ','0001',' ',38790.5, 'DELIPAPIER', @OrderID OUTPUT
EXEC dbo.AddOrder '06030180  ','0001',' ',38776.5, 'NESTLE WATERS SUPPLY EST', @OrderID OUTPUT
EXEC dbo.AddOrder '06030182  ','0001',' ',38780.5, 'NESTLE WATERS SUPPLY EST', @OrderID OUTPUT
EXEC dbo.AddOrder '06030184  ','0001',' ',38783.5, 'NESTLE WATERS SUPPLY EST', @OrderID OUTPUT
EXEC dbo.AddOrder '06030186  ','0001',' ',38797.5, 'NESTLE WATERS SUPPLY EST', @OrderID OUTPUT
EXEC dbo.AddOrder '06030189  ','0001',' ',38798.5, 'NESTLE WATERS SUPPLY EST', @OrderID OUTPUT
EXEC dbo.AddOrder '06030191  ','0001',' ',38787.5, 'NESTLE WATERS SUPPLY EST', @OrderID OUTPUT
EXEC dbo.AddOrder '06030194  ','0001',' ',38798.5, 'SA. BOULANGERIE NEUHAUSE', @OrderID OUTPUT
EXEC dbo.AddOrder '06030195  ','0001',' ',38781.5, 'MAAG  TECHNIC AG', @OrderID OUTPUT
EXEC dbo.AddOrder '06030196  ','0001',' ',38789.5, 'NESTLE WATERS SUPPLY EST', @OrderID OUTPUT
EXEC dbo.AddOrder '06030202  ','0001',' ',38790.5, 'DU PONT DE NEMOURS S.A.', @OrderID OUTPUT
EXEC dbo.AddOrder '06030204  ','0001',' ',38804.5, 'DU PONT DE NEMOURS S.A.', @OrderID OUTPUT
EXEC dbo.AddOrder '06030205  ','0001',' ',38831.5, 'DU PONT DE NEMOURS S.A.', @OrderID OUTPUT
EXEC dbo.AddOrder '06030207  ','0001',' ',38796.5, 'DU PONT DE NEMOURS (FRAN', @OrderID OUTPUT
EXEC dbo.AddOrder '06030209  ','0001',' ',38817.5, 'DU PONT DE NEMOURS S.A.', @OrderID OUTPUT
EXEC dbo.AddOrder '06030210  ','0001',' ',38846.5, 'DU PONT DE NEMOURS S.A.', @OrderID OUTPUT
EXEC dbo.AddOrder '06030212  ','0001',' ',38788.5, 'DU PONT DE NEMOURS (FRAN', @OrderID OUTPUT
EXEC dbo.AddOrder '06030215  ','0001',' ',38817.5, 'DU PONT DE NEMOURS S.A.', @OrderID OUTPUT
EXEC dbo.AddOrder '06030217  ','0001',' ',38789.5, 'DU PONT DE NEMOURS (FRAN', @OrderID OUTPUT
EXEC dbo.AddOrder '06030219  ','0001',' ',38846.5, 'DU PONT DE NEMOURS S.A.', @OrderID OUTPUT
EXEC dbo.AddOrder '06030223  ','0001',' ',38833.5, 'DU PONT DE NEMOURS S.A.', @OrderID OUTPUT
EXEC dbo.AddOrder '06030225  ','0001',' ',38817.5, 'DU PONT DE NEMOURS S.A.', @OrderID OUTPUT
EXEC dbo.AddOrder '06030226  ','0001',' ',38851.5, 'DU PONT DE NEMOURS S.A.', @OrderID OUTPUT
EXEC dbo.AddOrder '06030232  ','0001',' ',38789.5, 'DU PONT DE NEMOURS (FRAN', @OrderID OUTPUT
EXEC dbo.AddOrder '06030236  ','0001',' ',38781.5, 'MEPHISTO', @OrderID OUTPUT
EXEC dbo.AddOrder '06030237  ','0001',' ',38781.5, 'MEPHISTO', @OrderID OUTPUT
EXEC dbo.AddOrder '06030238  ','0001',' ',38781.5, 'MEPHISTO', @OrderID OUTPUT
EXEC dbo.AddOrder '06030238  ','0001','a',38791.5, 'MEPHISTO', @OrderID OUTPUT
EXEC dbo.AddOrder '06030245  ','0001',' ',38781.5, 'WELL-PACK AG', @OrderID OUTPUT
EXEC dbo.AddOrder '06030247  ','0001',' ',38788.5, 'DS SMITH KAYPAC', @OrderID OUTPUT
EXEC dbo.AddOrder '06030249  ','0001',' ',38782.5, 'P&G INTERNATIONAL OPERAT', @OrderID OUTPUT
EXEC dbo.AddOrder '06030251  ','0001',' ',38782.5, 'P&G INTERNATIONAL OPERAT', @OrderID OUTPUT
EXEC dbo.AddOrder '06030253  ','0001',' ',38787.5, 'P&G INTERNATIONAL OPERAT', @OrderID OUTPUT
EXEC dbo.AddOrder '06030255  ','0001',' ',38789.5, 'P&G INTERNATIONAL OPERAT', @OrderID OUTPUT
EXEC dbo.AddOrder '06030259  ','0001',' ',38787.5, 'P&G INTERNATIONAL OPERAT', @OrderID OUTPUT
EXEC dbo.AddOrder '06030261  ','0001',' ',38791.5, 'P&G INTERNATIONAL OPERAT', @OrderID OUTPUT
EXEC dbo.AddOrder '06030263  ','0001',' ',38791.5, 'P&G INTERNATIONAL OPERAT', @OrderID OUTPUT
EXEC dbo.AddOrder '06030264  ','0001',' ',38791.5, 'WELL-PACK AG', @OrderID OUTPUT
EXEC dbo.AddOrder '06030266  ','0001',' ',38788.5, 'RICOH INDUSTRIE FRANCE', @OrderID OUTPUT
EXEC dbo.AddOrder '06030271  ','0001',' ',38795.5, 'ROBOT COUPE', @OrderID OUTPUT
EXEC dbo.AddOrder '06030273  ','0001',' ',38788.5, 'P&G INTERNATIONAL OPERAT', @OrderID OUTPUT
EXEC dbo.AddOrder '06030275  ','0001',' ',38787.5, 'P&G INTERNATIONAL OPERAT', @OrderID OUTPUT
EXEC dbo.AddOrder '06030278  ','0001',' ',38791.5, 'P&G INTERNATIONAL OPERAT', @OrderID OUTPUT
EXEC dbo.AddOrder '06030280  ','0001',' ',38796.5, 'PEUGEOT CITROEN AUTOMOBI', @OrderID OUTPUT
EXEC dbo.AddOrder '06030281  ','0001',' ',38790.5, 'P&G INTERNATIONAL OPERAT', @OrderID OUTPUT
EXEC dbo.AddOrder '06030283  ','0001',' ',38796.5, 'PEUGEOT CITROEN AUTOMOBI', @OrderID OUTPUT
EXEC dbo.AddOrder '06030284  ','0001',' ',38791.5, 'P&G INTERNATIONAL OPERAT', @OrderID OUTPUT
EXEC dbo.AddOrder '06030286  ','0001',' ',38791.5, 'P&G INTERNATIONAL OPERAT', @OrderID OUTPUT
EXEC dbo.AddOrder '06030289  ','0001',' ',38790.5, 'P&G INTERNATIONAL OPERAT', @OrderID OUTPUT
EXEC dbo.AddOrder '06030290  ','0001',' ',38774.5, 'JTEKT AUTOMOBILE', @OrderID OUTPUT
EXEC dbo.AddOrder '06030295  ','0001',' ',38782.5, 'P&G INTERNATIONAL OPERAT', @OrderID OUTPUT
EXEC dbo.AddOrder '06030298  ','0001',' ',38789.5, 'P&G INTERNATIONAL OPERAT', @OrderID OUTPUT
EXEC dbo.AddOrder '06030300  ','0001',' ',38787.5, 'SESAM SNC', @OrderID OUTPUT
EXEC dbo.AddOrder '06030301  ','0001',' ',38784.5, 'P&G INTERNATIONAL OPERAT', @OrderID OUTPUT
EXEC dbo.AddOrder '06030303  ','0001',' ',38787.5, 'P&G INTERNATIONAL OPERAT', @OrderID OUTPUT
EXEC dbo.AddOrder '06030305  ','0001',' ',38781.5, 'P&G INTERNATIONAL OPERAT', @OrderID OUTPUT
EXEC dbo.AddOrder '06030307  ','0001',' ',38784.5, 'DS SMITH KAYSERSBERG', @OrderID OUTPUT
EXEC dbo.AddOrder '06030308  ','0001',' ',38784.5, 'P&G INTERNATIONAL OPERAT', @OrderID OUTPUT
EXEC dbo.AddOrder '06030310  ','0001',' ',38784.5, 'SARKOS S.A.', @OrderID OUTPUT
EXEC dbo.AddOrder '06030314  ','0001',' ',38791.5, 'RICOH INDUSTRIE FRANCE', @OrderID OUTPUT
EXEC dbo.AddOrder '06030315  ','0001',' ',38791.5, 'RICOH INDUSTRIE FRANCE', @OrderID OUTPUT
EXEC dbo.AddOrder '06030316  ','0001',' ',38791.5, 'RICOH INDUSTRIE FRANCE', @OrderID OUTPUT
EXEC dbo.AddOrder '06030317  ','0001',' ',38791.5, 'RICOH INDUSTRIE FRANCE', @OrderID OUTPUT
EXEC dbo.AddOrder '06030318  ','0001',' ',38791.5, 'RICOH INDUSTRIE FRANCE', @OrderID OUTPUT
EXEC dbo.AddOrder '06030319  ','0001',' ',38791.5, 'RICOH INDUSTRIE FRANCE', @OrderID OUTPUT
EXEC dbo.AddOrder '06030321  ','0001',' ',38788.5, 'P&G INTERNATIONAL OPERAT', @OrderID OUTPUT
EXEC dbo.AddOrder '06030323  ','0001',' ',38789.5, 'P&G INTERNATIONAL OPERAT', @OrderID OUTPUT
EXEC dbo.AddOrder '06030326  ','0001',' ',38791.5, 'P&G INTERNATIONAL OPERAT', @OrderID OUTPUT
EXEC dbo.AddOrder '06030331  ','0001',' ',38790.5, 'BEHR-HELLA THERMOCONTROL', @OrderID OUTPUT
EXEC dbo.AddOrder '06030334  ','0001',' ',38787.5, 'P&G INTERNATIONAL OPERAT', @OrderID OUTPUT
EXEC dbo.AddOrder '06030341  ','0001',' ',38783.5, 'LINNEMANN-SCHNETZER', @OrderID OUTPUT
EXEC dbo.AddOrder '06030343  ','0001',' ',38781.5, 'DOW AGROSCIENCES SWITZEL', @OrderID OUTPUT
EXEC dbo.AddOrder '06030344  ','0001',' ',38797.5, 'PEUGEOT CITROEN AUTOMOBI', @OrderID OUTPUT
EXEC dbo.AddOrder '06030345  ','0001',' ',38790.5, 'P&G INTERNATIONAL OPERAT', @OrderID OUTPUT
EXEC dbo.AddOrder '06030347  ','0001',' ',38782.5, 'DOW AGROSCIENCES', @OrderID OUTPUT
EXEC dbo.AddOrder '06030349  ','0001',' ',38782.5, 'DOW AGROSCIENCES', @OrderID OUTPUT
EXEC dbo.AddOrder '06030353  ','0001',' ',38804.5, 'HEXCEL COMPOSITES', @OrderID OUTPUT
EXEC dbo.AddOrder '06030354  ','0001',' ',38781.5, 'WIRTH VERPACKUNGEN GMBH', @OrderID OUTPUT
EXEC dbo.AddOrder '06030355  ','0001',' ',38791.5, 'JDW HOLDING GMBH', @OrderID OUTPUT
EXEC dbo.AddOrder '06030362  ','0001',' ',38791.5, 'P&G INTERNATIONAL OPERAT', @OrderID OUTPUT
EXEC dbo.AddOrder '06030368  ','0001',' ',38791.5, 'TRISS SPOL.S.R.O.', @OrderID OUTPUT
EXEC dbo.AddOrder '06030370  ','0001',' ',38789.5, 'TRISS SPOL.S.R.O.', @OrderID OUTPUT
EXEC dbo.AddOrder '06030372  ','0001',' ',38790.5, 'TRISS SPOL.S.R.O.', @OrderID OUTPUT
EXEC dbo.AddOrder '06030374  ','0001',' ',38791.5, 'BONZI  EMBALLAGES', @OrderID OUTPUT
EXEC dbo.AddOrder '06030375  ','0001',' ',38790.5, 'TRISS SPOL.S.R.O.', @OrderID OUTPUT
EXEC dbo.AddOrder '06030377  ','0001',' ',38787.5, 'SAINT GOBAIN ISOVER', @OrderID OUTPUT
EXEC dbo.AddOrder '06030378  ','0001',' ',38787.5, 'SAINT GOBAIN ISOVER', @OrderID OUTPUT
EXEC dbo.AddOrder '06030381  ','0001',' ',38784.5, 'THOMSON SALES EUROPE', @OrderID OUTPUT
EXEC dbo.AddOrder '06030382  ','0001',' ',38795.5, 'THOMSON SALES EUROPE', @OrderID OUTPUT
EXEC dbo.AddOrder '06030383  ','0001',' ',38795.5, 'THOMSON SALES EUROPE', @OrderID OUTPUT
EXEC dbo.AddOrder '06030384  ','0001',' ',38795.5, 'THOMSON SALES EUROPE', @OrderID OUTPUT
EXEC dbo.AddOrder '06030386  ','0001',' ',38797.5, 'P&G INTERNATIONAL OPERAT', @OrderID OUTPUT
EXEC dbo.AddOrder '06030388  ','0001',' ',38787.5, 'GUSTAV WONDRAK UND SOHN', @OrderID OUTPUT
EXEC dbo.AddOrder '06030390  ','0001',' ',38801.5, 'FDT', @OrderID OUTPUT
EXEC dbo.AddOrder '06030392  ','0001',' ',38784.5, 'BRENNER VERPACKUNG GMBH', @OrderID OUTPUT
EXEC dbo.AddOrder '06030395  ','0001',' ',38784.5, 'BRENNER VERPACKUNG GMBH', @OrderID OUTPUT
EXEC dbo.AddOrder '06030397  ','0001',' ',38794.5, 'TILLMANN VERPACKUNGEN GM', @OrderID OUTPUT
EXEC dbo.AddOrder '06030399  ','0001',' ',38809.5, 'GEPAK W.GERNER GMBH', @OrderID OUTPUT
EXEC dbo.AddOrder '06030401  ','0001',' ',38790.5, 'H.J.LICHTENBERGER GMBH', @OrderID OUTPUT
EXEC dbo.AddOrder '06030402  ','0001',' ',38781.5, 'WIRTH VERPACKUNGEN GMBH', @OrderID OUTPUT
EXEC dbo.AddOrder '06030403  ','0001',' ',38784.5, 'TRANSPACK-KRUMBACH GMBH', @OrderID OUTPUT
EXEC dbo.AddOrder '06030404  ','0001',' ',38790.5, 'DU PONT DE NEMOURS S.A.', @OrderID OUTPUT
EXEC dbo.AddOrder '06030406  ','0001',' ',38780.5, 'NESTLE WATERS SUPPLY EST', @OrderID OUTPUT
EXEC dbo.AddOrder '06030408  ','0001',' ',38798.5, 'GEORGIA-PACIFIC FRANCE', @OrderID OUTPUT
EXEC dbo.AddOrder '06030411  ','0001',' ',38791.5, 'GEORGIA-PACIFIC FRANCE', @OrderID OUTPUT
EXEC dbo.AddOrder '06030413  ','0001',' ',38790.5, 'GEORGIA-PACIFIC FRANCE', @OrderID OUTPUT
EXEC dbo.AddOrder '06030414  ','0001',' ',38798.5, 'GEORGIA-PACIFIC FRANCE', @OrderID OUTPUT
EXEC dbo.AddOrder '06030415  ','0001',' ',38789.5, 'DICESA SA', @OrderID OUTPUT
EXEC dbo.AddOrder '06030416  ','0001',' ',38789.5, 'DICESA SA', @OrderID OUTPUT
EXEC dbo.AddOrder '06030418  ','0001',' ',38791.5, 'FONDERIE DE BROUSSEVAL', @OrderID OUTPUT
EXEC dbo.AddOrder '06030420  ','0001',' ',38789.5, 'SCHWEITZER S.A.', @OrderID OUTPUT
EXEC dbo.AddOrder '06030422  ','0001',' ',38787.5, 'SCHWEITZER S.A.', @OrderID OUTPUT
EXEC dbo.AddOrder '06030423  ','0001',' ',38787.5, 'SCHWEITZER S.A.', @OrderID OUTPUT
EXEC dbo.AddOrder '06030425  ','0001',' ',38788.5, 'SCHWEITZER S.A.', @OrderID OUTPUT
EXEC dbo.AddOrder '06030427  ','0001',' ',38790.5, 'SCHWEITZER S.A.', @OrderID OUTPUT
EXEC dbo.AddOrder '06030428  ','0001',' ',38790.5, 'SCHWEITZER S.A.', @OrderID OUTPUT
EXEC dbo.AddOrder '06030430  ','0001',' ',38784.5, 'COGESAL MIKO-FSEUR 58488', @OrderID OUTPUT
EXEC dbo.AddOrder '06030431  ','0001',' ',38795.5, 'DUPONT DE NEMOURS ITALIA', @OrderID OUTPUT
EXEC dbo.AddOrder '06030432  ','0001',' ',38790.5, 'DUPONT DE NEMOURS ITALIA', @OrderID OUTPUT
EXEC dbo.AddOrder '06030433  ','0001',' ',38790.5, 'DUPONT DE NEMOURS ITALIA', @OrderID OUTPUT
EXEC dbo.AddOrder '06030435  ','0001',' ',38801.5, 'B.V.ALVERIMPORT', @OrderID OUTPUT
EXEC dbo.AddOrder '06030437  ','0001',' ',38783.5, 'W. WIRTH GMBH', @OrderID OUTPUT
EXEC dbo.AddOrder '06030439  ','0001',' ',38796.5, 'STE INDUST.DE LEVURE FAL', @OrderID OUTPUT
EXEC dbo.AddOrder '06030443  ','0001',' ',38788.5, 'STE INDUST.DE LEVURE FAL', @OrderID OUTPUT
EXEC dbo.AddOrder '06030446  ','0001',' ',38789.5, 'NESTLE WATERS SUPPLY EST', @OrderID OUTPUT
EXEC dbo.AddOrder '06030448  ','0001',' ',38784.5, 'NESTLE WATERS SUPPLY EST', @OrderID OUTPUT
EXEC dbo.AddOrder '06030450  ','0001',' ',38787.5, 'NESTLE WATERS SUPPLY EST', @OrderID OUTPUT
EXEC dbo.AddOrder '06030452  ','0001',' ',38788.5, 'NESTLE WATERS SUPPLY EST', @OrderID OUTPUT
EXEC dbo.AddOrder '06030455  ','0001',' ',38787.5, 'NESTLE WATERS SUPPLY EST', @OrderID OUTPUT
EXEC dbo.AddOrder '06030462  ','0001',' ',38787.5, 'CELLIER DES DAUPHINS', @OrderID OUTPUT
EXEC dbo.AddOrder '06030463  ','0001',' ',38783.5, 'WELL-PACK AG', @OrderID OUTPUT
EXEC dbo.AddOrder '06030465  ','0001',' ',38788.5, 'S.M.A.E. ZI METZ BORNY (', @OrderID OUTPUT
EXEC dbo.AddOrder '06030466  ','0001',' ',38788.5, 'S.M.A.E. ZI METZ BORNY (', @OrderID OUTPUT
EXEC dbo.AddOrder '06030467  ','0001',' ',38788.5, 'S.M.A.E. ZI METZ BORNY (', @OrderID OUTPUT
EXEC dbo.AddOrder '06030468  ','0001',' ',38788.5, 'S.M.A.E. ZI METZ BORNY (', @OrderID OUTPUT
EXEC dbo.AddOrder '06030469  ','0001',' ',38788.5, 'S.M.A.E. ZI METZ BORNY (', @OrderID OUTPUT
EXEC dbo.AddOrder '06030471  ','0001',' ',38789.5, 'WELL-PACK AG', @OrderID OUTPUT
EXEC dbo.AddOrder '06030472  ','0001',' ',38789.5, 'WELL-PACK AG', @OrderID OUTPUT
EXEC dbo.AddOrder '06030474  ','0001',' ',38784.5, 'ILLBRUCK PRODUCTION S.A', @OrderID OUTPUT
EXEC dbo.AddOrder '06030476  ','0001',' ',38803.5, 'NESTLE DEUTSCHLAND AG', @OrderID OUTPUT
EXEC dbo.AddOrder '06030478  ','0001',' ',38783.5, 'LILLY FRANCE S.A.', @OrderID OUTPUT
EXEC dbo.AddOrder '06030479  ','0001',' ',38788.5, 'SEP KUNHEIM', @OrderID OUTPUT
EXEC dbo.AddOrder '06030479  ','0002',' ',38783.5, 'SEP KUNHEIM', @OrderID OUTPUT
EXEC dbo.AddOrder '06030479  ','0003',' ',38783.5, 'SEP KUNHEIM', @OrderID OUTPUT
EXEC dbo.AddOrder '06030479  ','0004',' ',38787.5, 'SEP KUNHEIM', @OrderID OUTPUT
EXEC dbo.AddOrder '06030480  ','0001',' ',38788.5, 'NESTLE SUISSE S.A.', @OrderID OUTPUT
EXEC dbo.AddOrder '06030481  ','0001',' ',38803.5, 'DSM ELASTOMERS EUROPE', @OrderID OUTPUT
EXEC dbo.AddOrder '06030482  ','0001',' ',38809.5, 'DSM ELASTOMERS EUROPE', @OrderID OUTPUT
EXEC dbo.AddOrder '06030483  ','0001',' ',38788.5, 'DSM ELASTOMERS EUROPE', @OrderID OUTPUT
EXEC dbo.AddOrder '06030484  ','0001',' ',38787.5, 'DSM ELASTOMERS EUROPE', @OrderID OUTPUT
EXEC dbo.AddOrder '06030485  ','0001',' ',38795.5, 'DSM ELASTOMERS EUROPE', @OrderID OUTPUT
EXEC dbo.AddOrder '06030486  ','0001',' ',38795.5, 'DSM ELASTOMERS EUROPE', @OrderID OUTPUT
EXEC dbo.AddOrder '06030490  ','0001',' ',38803.5, 'DSM ELASTOMERS EUROPE', @OrderID OUTPUT
EXEC dbo.AddOrder '06030492  ','0001',' ',38802.5, 'DSM ELASTOMERS EUROPE', @OrderID OUTPUT
EXEC dbo.AddOrder '06030493  ','0001',' ',38795.5, 'DSM ELASTOMERS EUROPE', @OrderID OUTPUT
EXEC dbo.AddOrder '06030494  ','0001',' ',38802.5, 'DSM ELASTOMERS EUROPE', @OrderID OUTPUT
EXEC dbo.AddOrder '06030497  ','0001',' ',38784.5, 'DS SMITH KAYSERSBERG', @OrderID OUTPUT
EXEC dbo.AddOrder '06030500  ','0001',' ',38798.5, 'NESTLE WATERS SUPPLY EST', @OrderID OUTPUT
EXEC dbo.AddOrder '06030501  ','0001',' ',38802.5, 'GIVAUDAN SUISSE SA.', @OrderID OUTPUT
EXEC dbo.AddOrder '06030503  ','0001',' ',38791.5, 'SCHNEIDER ELECTRIC FRANC', @OrderID OUTPUT
EXEC dbo.AddOrder '06030506  ','0001',' ',38788.5, 'AMERICAN STANDARD EUROPE', @OrderID OUTPUT
EXEC dbo.AddOrder '06030511  ','0001',' ',38794.5, 'ANTALIS AG', @OrderID OUTPUT
EXEC dbo.AddOrder '06030512  ','0001',' ',38794.5, 'AMMANN-SANDER SARL', @OrderID OUTPUT
EXEC dbo.AddOrder '06030514  ','0001',' ',38784.5, 'DOW AGROSCIENCES SWITZEL', @OrderID OUTPUT
EXEC dbo.AddOrder '06030515  ','0001',' ',38796.5, 'TECUMSEH EUROPE S.A.', @OrderID OUTPUT
EXEC dbo.AddOrder '06030517  ','0001',' ',38787.5, 'AMERICAN STANDARD EUROPE', @OrderID OUTPUT
EXEC dbo.AddOrder '06030518  ','0001',' ',38787.5, 'AMERICAN STANDARD EUROPE', @OrderID OUTPUT
EXEC dbo.AddOrder '06030519  ','0001',' ',38787.5, 'AMERICAN STANDARD EUROPE', @OrderID OUTPUT
EXEC dbo.AddOrder '06030520  ','0001',' ',38783.5, 'SEP KUNHEIM', @OrderID OUTPUT
EXEC dbo.AddOrder '06030522  ','0001',' ',38784.5, 'NESTLE WATERS SUPPLY EST', @OrderID OUTPUT
EXEC dbo.AddOrder '06030524  ','0001',' ',38783.5, 'MGI COUTIER PLASTIQUE', @OrderID OUTPUT
EXEC dbo.AddOrder '06030526  ','0001',' ',38795.5, 'DU PONT DE NEMOURS (FRAN', @OrderID OUTPUT
EXEC dbo.AddOrder '06030529  ','0001',' ',38784.5, 'MLP - MANUFACTURE DE PRE', @OrderID OUTPUT
EXEC dbo.AddOrder '06030531  ','0001',' ',38790.5, 'GEORGIA-PACIFIC FRANCE', @OrderID OUTPUT
EXEC dbo.AddOrder '06030536  ','0001',' ',38791.5, 'DS SMITH KAYSERSBERG', @OrderID OUTPUT
EXEC dbo.AddOrder '06030537  ','0001',' ',38791.5, 'DS SMITH KAYSERSBERG', @OrderID OUTPUT
EXEC dbo.AddOrder '06030538  ','0001',' ',38791.5, 'DS SMITH KAYSERSBERG', @OrderID OUTPUT
EXEC dbo.AddOrder '06030541  ','0001',' ',38796.5, 'ETOL-WERK', @OrderID OUTPUT
EXEC dbo.AddOrder '06030542  ','0001',' ',38795.5, 'ETOL-WERK', @OrderID OUTPUT
EXEC dbo.AddOrder '06030545  ','0001',' ',38789.5, 'DS SMITH KAYSERSBERG', @OrderID OUTPUT
EXEC dbo.AddOrder '06030548  ','0001',' ',38776.5, 'JTEKT AUTOMOBILE', @OrderID OUTPUT
EXEC dbo.AddOrder '06030550  ','0001',' ',38797.5, 'LE FOURNIL DE FREDERIC', @OrderID OUTPUT
EXEC dbo.AddOrder '06030551  ','0001',' ',38796.5, 'DIEFENBACH VERPACKUNGEN', @OrderID OUTPUT
EXEC dbo.AddOrder '06030553  ','0001',' ',38790.5, 'LE FOURNIL DE FREDERIC', @OrderID OUTPUT
EXEC dbo.AddOrder '06030555  ','0001',' ',38790.5, 'LE FOURNIL DE FREDERIC', @OrderID OUTPUT
EXEC dbo.AddOrder '06030557  ','0001',' ',38788.5, 'MGLAS AG', @OrderID OUTPUT
EXEC dbo.AddOrder '06030558  ','0001',' ',38788.5, 'MGLAS AG', @OrderID OUTPUT
EXEC dbo.AddOrder '06030560  ','0001',' ',38791.5, 'RS COMPONENTS GMBH', @OrderID OUTPUT
EXEC dbo.AddOrder '06030561  ','0001',' ',38791.5, 'RS COMPONENTS GMBH', @OrderID OUTPUT
EXEC dbo.AddOrder '06030562  ','0001',' ',38790.5, 'RS COMPONENTS GMBH', @OrderID OUTPUT
EXEC dbo.AddOrder '06030563  ','0001',' ',38790.5, 'RS COMPONENTS GMBH', @OrderID OUTPUT
EXEC dbo.AddOrder '06030564  ','0001',' ',38790.5, 'RS COMPONENTS GMBH', @OrderID OUTPUT
EXEC dbo.AddOrder '06030565  ','0001',' ',38790.5, 'RS COMPONENTS GMBH', @OrderID OUTPUT
EXEC dbo.AddOrder '06030567  ','0001',' ',38794.5, 'DITTE GMBH', @OrderID OUTPUT
EXEC dbo.AddOrder '06030569  ','0001',' ',38791.5, 'DITTE GMBH', @OrderID OUTPUT
EXEC dbo.AddOrder '06030572  ','0001',' ',38788.5, 'SAE SERGE CHEVEAU', @OrderID OUTPUT
EXEC dbo.AddOrder '06030573  ','0001',' ',38797.5, 'VIESSMANN', @OrderID OUTPUT
EXEC dbo.AddOrder '06030574  ','0001',' ',38818.5, 'VIESSMANN', @OrderID OUTPUT
EXEC dbo.AddOrder '06030576  ','0001',' ',38798.5, 'VIESSMANN', @OrderID OUTPUT
EXEC dbo.AddOrder '06030577  ','0001',' ',38818.5, 'VIESSMANN', @OrderID OUTPUT
EXEC dbo.AddOrder '06030579  ','0001',' ',38791.5, 'H.J.LICHTENBERGER GMBH', @OrderID OUTPUT
EXEC dbo.AddOrder '06030581  ','0001',' ',38788.5, 'DS SMITH KAYPAC', @OrderID OUTPUT
EXEC dbo.AddOrder '06030583  ','0001',' ',38791.5, 'LABORATOIRE ALCON', @OrderID OUTPUT
EXEC dbo.AddOrder '06030585  ','0001',' ',38798.5, 'ECS', @OrderID OUTPUT
EXEC dbo.AddOrder '06030588  ','0001',' ',38790.5, 'FABI AUTOMOBILE', @OrderID OUTPUT
EXEC dbo.AddOrder '06030589  ','0001',' ',38790.5, 'FABI AUTOMOBILE', @OrderID OUTPUT
EXEC dbo.AddOrder '06030590  ','0001',' ',38790.5, 'FABI AUTOMOBILE', @OrderID OUTPUT
EXEC dbo.AddOrder '06030591  ','0001',' ',38790.5, 'FABI AUTOMOBILE', @OrderID OUTPUT
EXEC dbo.AddOrder '06030592  ','0001',' ',38790.5, 'FABI AUTOMOBILE', @OrderID OUTPUT
EXEC dbo.AddOrder '06030593  ','0001',' ',38794.5, 'WELL-PACK AG', @OrderID OUTPUT
EXEC dbo.AddOrder '06030596  ','0001',' ',38790.5, 'CART.EMBAL. RHONE ALPES', @OrderID OUTPUT
EXEC dbo.AddOrder '06030597  ','0001',' ',38790.5, 'CART.EMBAL. RHONE ALPES', @OrderID OUTPUT
EXEC dbo.AddOrder '06030600  ','0001',' ',38783.5, 'STE WRIGLEY FRANCE S.N.C', @OrderID OUTPUT
EXEC dbo.AddOrder '06030601  ','0001',' ',38783.5, 'STE WRIGLEY FRANCE S.N.C', @OrderID OUTPUT
EXEC dbo.AddOrder '06030602  ','0001',' ',38783.5, 'STE WRIGLEY FRANCE S.N.C', @OrderID OUTPUT
EXEC dbo.AddOrder '06030603  ','0001',' ',38784.5, 'B.V.ALVERIMPORT', @OrderID OUTPUT
EXEC dbo.AddOrder '06030603  ','0001','a',38784.5, 'B.V.ALVERIMPORT', @OrderID OUTPUT
EXEC dbo.AddOrder '06030604  ','0001',' ',38787.5, 'STE WRIGLEY FRANCE S.N.C', @OrderID OUTPUT
EXEC dbo.AddOrder '06030605  ','0001',' ',38787.5, 'STE WRIGLEY FRANCE S.N.C', @OrderID OUTPUT
EXEC dbo.AddOrder '06030607  ','0001',' ',38790.5, 'STE WRIGLEY FRANCE S.N.C', @OrderID OUTPUT
EXEC dbo.AddOrder '06030608  ','0001',' ',38790.5, 'STE WRIGLEY FRANCE S.N.C', @OrderID OUTPUT
EXEC dbo.AddOrder '06030609  ','0001',' ',38790.5, 'STE WRIGLEY FRANCE S.N.C', @OrderID OUTPUT
EXEC dbo.AddOrder '06030610  ','0001',' ',38790.5, 'STE WRIGLEY FRANCE S.N.C', @OrderID OUTPUT
EXEC dbo.AddOrder '06030611  ','0001',' ',38790.5, 'STE WRIGLEY FRANCE S.N.C', @OrderID OUTPUT
EXEC dbo.AddOrder '06030612  ','0001',' ',38790.5, 'STE WRIGLEY FRANCE S.N.C', @OrderID OUTPUT
EXEC dbo.AddOrder '06030614  ','0001',' ',38797.5, 'STE WRIGLEY FRANCE S.N.C', @OrderID OUTPUT
EXEC dbo.AddOrder '06030615  ','0001',' ',38797.5, 'STE WRIGLEY FRANCE S.N.C', @OrderID OUTPUT
EXEC dbo.AddOrder '06030616  ','0001',' ',38797.5, 'STE WRIGLEY FRANCE S.N.C', @OrderID OUTPUT
EXEC dbo.AddOrder '06030617  ','0001',' ',38797.5, 'STE WRIGLEY FRANCE S.N.C', @OrderID OUTPUT
EXEC dbo.AddOrder '06030619  ','0001',' ',38789.5, 'ED.FRIEDRICH & CO GMBH', @OrderID OUTPUT
EXEC dbo.AddOrder '06030621  ','0001',' ',38795.5, 'SHARP MANUFACTURING FRAN', @OrderID OUTPUT
EXEC dbo.AddOrder '06030622  ','0001',' ',38795.5, 'SHARP MANUFACTURING FRAN', @OrderID OUTPUT
EXEC dbo.AddOrder '06030624  ','0001',' ',38780.5, 'NESTLE WATERS SUPPLY EST', @OrderID OUTPUT
EXEC dbo.AddOrder '06030625  ','0001',' ',38783.5, 'MEPHISTO', @OrderID OUTPUT
EXEC dbo.AddOrder '06030630  ','0001',' ',38811.5, 'PEUGEOT CITROEN AUTOMOBI', @OrderID OUTPUT
EXEC dbo.AddOrder '06030631  ','0001',' ',38815.5, 'PEUGEOT CITROEN AUTOMOBI', @OrderID OUTPUT
EXEC dbo.AddOrder '06030632  ','0001',' ',38808.5, 'PEUGEOT CITROEN AUTOMOBI', @OrderID OUTPUT
EXEC dbo.AddOrder '06030633  ','0001',' ',38796.5, 'PEUGEOT CITROEN AUTOMOBI', @OrderID OUTPUT
EXEC dbo.AddOrder '06030634  ','0001',' ',38809.5, 'PEUGEOT CITROEN AUTOMOBI', @OrderID OUTPUT
EXEC dbo.AddOrder '06030635  ','0001',' ',38808.5, 'LABORATOIRES GALDERMA', @OrderID OUTPUT
EXEC dbo.AddOrder '06030636  ','0001',' ',38816.5, 'LABORATOIRES GALDERMA', @OrderID OUTPUT
EXEC dbo.AddOrder '06030638  ','0001',' ',38825.5, 'LABORATOIRES GALDERMA', @OrderID OUTPUT
EXEC dbo.AddOrder '06030639  ','0001',' ',38805.5, 'PEUGEOT CITROEN AUTOMOBI', @OrderID OUTPUT
EXEC dbo.AddOrder '06030641  ','0001',' ',38818.5, 'PEUGEOT CITROEN AUTOMOBI', @OrderID OUTPUT
EXEC dbo.AddOrder '06030642  ','0001',' ',38787.5, 'HEIDE WERKSTAETTEN E.V.', @OrderID OUTPUT
EXEC dbo.AddOrder '06030642  ','0002',' ',38787.5, 'HEIDE WERKSTAETTEN E.V.', @OrderID OUTPUT
EXEC dbo.AddOrder '06030642  ','0003',' ',38787.5, 'HEIDE WERKSTAETTEN E.V.', @OrderID OUTPUT
EXEC dbo.AddOrder '06030642  ','0004',' ',38787.5, 'HEIDE WERKSTAETTEN E.V.', @OrderID OUTPUT
EXEC dbo.AddOrder '06030643  ','0001',' ',38788.5, 'DS SMITH KAYPAC', @OrderID OUTPUT
EXEC dbo.AddOrder '06030645  ','0001',' ',38817.5, 'PEUGEOT CITROEN AUTOMOBI', @OrderID OUTPUT
EXEC dbo.AddOrder '06030646  ','0001',' ',38788.5, 'DS SMITH KAYPAC', @OrderID OUTPUT
EXEC dbo.AddOrder '06030647  ','0001',' ',38811.5, 'PEUGEOT CITROEN AUTOMOBI', @OrderID OUTPUT
EXEC dbo.AddOrder '06030648  ','0001',' ',38783.5, 'CART.EMBAL. RHONE ALPES', @OrderID OUTPUT
EXEC dbo.AddOrder '06030648  ','0001','b',38783.5, 'CART.EMBAL. RHONE ALPES', @OrderID OUTPUT
EXEC dbo.AddOrder '06030648  ','0002',' ',38783.5, 'CART.EMBAL. RHONE ALPES', @OrderID OUTPUT
EXEC dbo.AddOrder '06030648  ','0003',' ',38783.5, 'CART.EMBAL. RHONE ALPES', @OrderID OUTPUT
EXEC dbo.AddOrder '06030648  ','0004',' ',38783.5, 'CART.EMBAL. RHONE ALPES', @OrderID OUTPUT
EXEC dbo.AddOrder '06030648  ','0005',' ',38783.5, 'CART.EMBAL. RHONE ALPES', @OrderID OUTPUT
EXEC dbo.AddOrder '06030649  ','0001',' ',38818.5, 'PEUGEOT CITROEN AUTOMOBI', @OrderID OUTPUT
EXEC dbo.AddOrder '06030650  ','0001',' ',38817.5, 'PEUGEOT CITROEN AUTOMOBI', @OrderID OUTPUT
EXEC dbo.AddOrder '06030652  ','0001',' ',38801.5, 'PEUGEOT CITROEN AUTOMOBI', @OrderID OUTPUT
EXEC dbo.AddOrder '06030653  ','0001',' ',38789.5, 'NESTLE WATERS SUPPLY EST', @OrderID OUTPUT
EXEC dbo.AddOrder '06030655  ','0001',' ',38790.5, 'NESTLE WATERS SUPPLY EST', @OrderID OUTPUT
EXEC dbo.AddOrder '06030657  ','0001',' ',38794.5, 'NESTLE WATERS SUPPLY EST', @OrderID OUTPUT
EXEC dbo.AddOrder '06030659  ','0001',' ',38795.5, 'NESTLE WATERS SUPPLY EST', @OrderID OUTPUT
EXEC dbo.AddOrder '06030660  ','0001',' ',38823.5, 'PEUGEOT CITROEN AUTOMOBI', @OrderID OUTPUT
EXEC dbo.AddOrder '06030661  ','0001',' ',38784.5, 'COGESAL MIKO-FSEUR 58488', @OrderID OUTPUT
EXEC dbo.AddOrder '06030663  ','0001',' ',38790.5, 'SAE SERGE CHEVEAU', @OrderID OUTPUT
EXEC dbo.AddOrder '06030664  ','0001',' ',38783.5, 'DS SMITH KAYPAC', @OrderID OUTPUT
EXEC dbo.AddOrder '06030665  ','0001',' ',38783.5, 'DS SMITH KAYPAC', @OrderID OUTPUT
EXEC dbo.AddOrder '06030667  ','0001',' ',38797.5, 'TRISS SPOL.S.R.O.', @OrderID OUTPUT
EXEC dbo.AddOrder '06030668  ','0001',' ',38798.5, 'TRISS SPOL.S.R.O.', @OrderID OUTPUT
EXEC dbo.AddOrder '06030669  ','0001',' ',38798.5, 'TRISS SPOL.S.R.O.', @OrderID OUTPUT
EXEC dbo.AddOrder '06030670  ','0001',' ',38798.5, 'TRISS SPOL.S.R.O.', @OrderID OUTPUT
EXEC dbo.AddOrder '06030671  ','0001',' ',38798.5, 'TRISS SPOL.S.R.O.', @OrderID OUTPUT
EXEC dbo.AddOrder '06030672  ','0001',' ',38788.5, 'DS SMITH KAYPAC', @OrderID OUTPUT
EXEC dbo.AddOrder '06030674  ','0001',' ',38788.5, 'DS SMITH KAYPAC', @OrderID OUTPUT
EXEC dbo.AddOrder '06030676  ','0001',' ',38784.5, 'DS SMITH KAYPAC', @OrderID OUTPUT
EXEC dbo.AddOrder '06030676  ','0002',' ',38784.5, 'DS SMITH KAYPAC', @OrderID OUTPUT
EXEC dbo.AddOrder '06030676  ','0003',' ',38784.5, 'DS SMITH KAYPAC', @OrderID OUTPUT
EXEC dbo.AddOrder '06030676  ','0003','a',38784.5, 'DS SMITH KAYPAC', @OrderID OUTPUT
EXEC dbo.AddOrder '06030677  ','0001',' ',38794.5, 'PEUGEOT CITROEN AUTOMOBI', @OrderID OUTPUT
EXEC dbo.AddOrder '06030678  ','0001',' ',38791.5, 'SAEP DIFFUSION', @OrderID OUTPUT
EXEC dbo.AddOrder '06030681  ','0001',' ',38783.5, 'PRESTAPLAST INDUSTRIE', @OrderID OUTPUT
EXEC dbo.AddOrder '06030682  ','0001',' ',38816.5, 'SODETAL SARL', @OrderID OUTPUT
EXEC dbo.AddOrder '06030683  ','0001',' ',38816.5, 'SODETAL SARL', @OrderID OUTPUT
EXEC dbo.AddOrder '06030684  ','0001',' ',38825.5, 'SODETAL SARL', @OrderID OUTPUT
EXEC dbo.AddOrder '06030685  ','0001',' ',38791.5, 'DS SMITH KAYSERSBERG', @OrderID OUTPUT
EXEC dbo.AddOrder '06030686  ','0001',' ',38789.5, 'DS SMITH KAYSERSBERG', @OrderID OUTPUT
EXEC dbo.AddOrder '06030689  ','0001',' ',38797.5, 'AEF ATELIER D''EM. FAULQU', @OrderID OUTPUT
EXEC dbo.AddOrder '06030691  ','0001',' ',38782.5, 'GIKO KARTONAGEN GMBH', @OrderID OUTPUT
EXEC dbo.AddOrder '06030692  ','0001',' ',38782.5, 'TILLMANN VERPACKUNGEN GM', @OrderID OUTPUT
EXEC dbo.AddOrder '06030693  ','0001',' ',38789.5, 'TIMKEN EUROPE', @OrderID OUTPUT
EXEC dbo.AddOrder '06030695  ','0001',' ',38791.5, 'MAISON GUSTAVE LORENTZ S', @OrderID OUTPUT
EXEC dbo.AddOrder '06030699  ','0001',' ',38784.5, 'B.V.ALVERIMPORT', @OrderID OUTPUT
EXEC dbo.AddOrder '06030700  ','0001',' ',38788.5, 'TIMKEN EUROPE', @OrderID OUTPUT
EXEC dbo.AddOrder '06030703  ','0001',' ',38783.5, 'REHAU INDUSTRIE SARL', @OrderID OUTPUT
EXEC dbo.AddOrder '06030704  ','0001',' ',38783.5, 'CART.EMBAL. RHONE ALPES', @OrderID OUTPUT
EXEC dbo.AddOrder '06030706  ','0001',' ',38783.5, 'CART.EMBAL. RHONE ALPES', @OrderID OUTPUT
EXEC dbo.AddOrder '06030707  ','0001',' ',38783.5, 'CART.EMBAL. RHONE ALPES', @OrderID OUTPUT
EXEC dbo.AddOrder '06030708  ','0001',' ',38783.5, 'CART.EMBAL. RHONE ALPES', @OrderID OUTPUT
EXEC dbo.AddOrder '06030711  ','0001',' ',38804.5, 'ATLANTIC CLIMATISATION E', @OrderID OUTPUT
EXEC dbo.AddOrder '06030714  ','0001',' ',38784.5, 'KLUEBER LUBRICATION MUEN', @OrderID OUTPUT
EXEC dbo.AddOrder '06030716  ','0001',' ',38797.5, 'KLUEBER LUBRICATION MUEN', @OrderID OUTPUT
EXEC dbo.AddOrder '06030717  ','0001',' ',38787.5, 'PROVIMI KLIBA AG', @OrderID OUTPUT
EXEC dbo.AddOrder '06030720  ','0001',' ',38789.5, 'WIRTH VERPACKUNGEN GMBH', @OrderID OUTPUT
EXEC dbo.AddOrder '06030730  ','0001',' ',38802.5, 'JTEKT AUTOMOBILE LYON', @OrderID OUTPUT
EXEC dbo.AddOrder '06030731  ','0001',' ',38782.5, 'GIKO KARTONAGEN GMBH', @OrderID OUTPUT
EXEC dbo.AddOrder '06030732  ','0001',' ',38788.5, 'WELL-PACK AG', @OrderID OUTPUT
EXEC dbo.AddOrder '06030737  ','0001',' ',38790.5, 'SOMFY', @OrderID OUTPUT
EXEC dbo.AddOrder '06030739  ','0001',' ',38803.5, 'D.P.F. DIFFUS.PREST.FIAB', @OrderID OUTPUT
EXEC dbo.AddOrder '06030742  ','0001',' ',38839.5, 'HEXCEL COMPOSITES', @OrderID OUTPUT
EXEC dbo.AddOrder '06030743  ','0001',' ',38867.5, 'HEXCEL COMPOSITES', @OrderID OUTPUT
EXEC dbo.AddOrder '06030745  ','0001',' ',38784.5, 'BRASSERIE FISCHER SA', @OrderID OUTPUT
EXEC dbo.AddOrder '06030747  ','0001',' ',38789.5, 'NESTLE WATERS SUPPLY EST', @OrderID OUTPUT
EXEC dbo.AddOrder '06030750  ','0001',' ',38789.5, 'NESTLE WATERS SUPPLY EST', @OrderID OUTPUT
EXEC dbo.AddOrder '06030752  ','0001',' ',38790.5, 'NESTLE WATERS SUPPLY EST', @OrderID OUTPUT
EXEC dbo.AddOrder '06030754  ','0001',' ',38783.5, 'CART.EMBAL. RHONE ALPES', @OrderID OUTPUT
EXEC dbo.AddOrder '06030756  ','0001',' ',38782.5, 'BRASSERIES KRONENBOURG 5', @OrderID OUTPUT
EXEC dbo.AddOrder '06030756  ','0001','a',38782.5, 'BRASSERIES KRONENBOURG 5', @OrderID OUTPUT
EXEC dbo.AddOrder '06030758  ','0001',' ',38782.5, 'BRASSERIES KRONENBOURG 5', @OrderID OUTPUT
EXEC dbo.AddOrder '06030760  ','0001',' ',38789.5, 'W. WIRTH GMBH', @OrderID OUTPUT
EXEC dbo.AddOrder '06030761  ','0001',' ',38782.5, 'BRASSERIES KRONENBOURG 5', @OrderID OUTPUT
EXEC dbo.AddOrder '06030763  ','0001',' ',38782.5, 'BRASSERIES KRONENBOURG 5', @OrderID OUTPUT
EXEC dbo.AddOrder '06030766  ','0001',' ',38794.5, 'NESTLE WATERS SUPPLY EST', @OrderID OUTPUT
EXEC dbo.AddOrder '06030767  ','0001',' ',38788.5, 'BRASSERIES KRONENBOURG 5', @OrderID OUTPUT
EXEC dbo.AddOrder '06030770  ','0001',' ',38797.5, 'NESTLE WATERS SUPPLY EST', @OrderID OUTPUT
EXEC dbo.AddOrder '06030771  ','0001',' ',38788.5, 'BRASSERIES KRONENBOURG 5', @OrderID OUTPUT
EXEC dbo.AddOrder '06030774  ','0001',' ',38788.5, 'NESTLE WATERS SUPPLY EST', @OrderID OUTPUT
EXEC dbo.AddOrder '06030775  ','0001',' ',38788.5, 'BRASSERIES KRONENBOURG 5', @OrderID OUTPUT
EXEC dbo.AddOrder '06030777  ','0001',' ',38783.5, 'BRASSERIES KRONENBOURG 5', @OrderID OUTPUT
EXEC dbo.AddOrder '06030779  ','0001',' ',38787.5, 'SARKOS S.A.', @OrderID OUTPUT
EXEC dbo.AddOrder '06030780  ','0001',' ',38782.5, 'BRASSERIES KRONENBOURG 5', @OrderID OUTPUT
EXEC dbo.AddOrder '06030782  ','0001',' ',38783.5, 'BRASSERIES KRONENBOURG 5', @OrderID OUTPUT
EXEC dbo.AddOrder '06030784  ','0001',' ',38783.5, 'NESTLE WATERS SUPPLY EST', @OrderID OUTPUT
EXEC dbo.AddOrder '06030789  ','0001',' ',38788.5, 'STE ALSA-CORK', @OrderID OUTPUT
EXEC dbo.AddOrder '06030790  ','0001',' ',38788.5, 'STE ALSA-CORK', @OrderID OUTPUT
EXEC dbo.AddOrder '06030791  ','0001',' ',38788.5, 'STE ALSA-CORK', @OrderID OUTPUT
EXEC dbo.AddOrder '06030792  ','0001',' ',38788.5, 'STE ALSA-CORK', @OrderID OUTPUT
EXEC dbo.AddOrder '06030793  ','0001',' ',38788.5, 'STE ALSA-CORK', @OrderID OUTPUT
EXEC dbo.AddOrder '06030794  ','0001',' ',38784.5, 'BEHR SERVICE SAS', @OrderID OUTPUT
EXEC dbo.AddOrder '06030796  ','0001',' ',38798.5, 'RICOLA EUROPE SA', @OrderID OUTPUT
EXEC dbo.AddOrder '06030797  ','0001',' ',38789.5, 'D.P.F. DIFFUS.PREST.FIAB', @OrderID OUTPUT
EXEC dbo.AddOrder '06030799  ','0001',' ',38789.5, 'STE ALSA-CORK', @OrderID OUTPUT
EXEC dbo.AddOrder '06030801  ','0001',' ',38784.5, 'SCHWEITZER S.A.', @OrderID OUTPUT
EXEC dbo.AddOrder '06030802  ','0001',' ',38787.5, 'SCHWEITZER S.A.', @OrderID OUTPUT
EXEC dbo.AddOrder '06030803  ','0001',' ',38787.5, 'SCHWEITZER S.A.', @OrderID OUTPUT
EXEC dbo.AddOrder '06030805  ','0001',' ',38784.5, 'SCHWEITZER S.A.', @OrderID OUTPUT
EXEC dbo.AddOrder '06030807  ','0001',' ',38784.5, 'NEUHAUSER', @OrderID OUTPUT
EXEC dbo.AddOrder '06030810  ','0001',' ',38790.5, 'W. WIRTH GMBH', @OrderID OUTPUT
EXEC dbo.AddOrder '06030811  ','0001',' ',38795.5, 'NEUHAUSER', @OrderID OUTPUT
EXEC dbo.AddOrder '06030813  ','0001',' ',38784.5, 'CHAVANOZ INDUSTRIE', @OrderID OUTPUT
EXEC dbo.AddOrder '06030815  ','0001',' ',38789.5, 'LILLY FRANCE S.A.', @OrderID OUTPUT
EXEC dbo.AddOrder '06030818  ','0001',' ',38801.5, 'LILLY FRANCE S.A.', @OrderID OUTPUT
EXEC dbo.AddOrder '06030819  ','0001',' ',38790.5, 'SOFLOG-SOFEMBAL', @OrderID OUTPUT
EXEC dbo.AddOrder '06030820  ','0001',' ',38790.5, 'SOFLOG-SOFEMBAL', @OrderID OUTPUT
EXEC dbo.AddOrder '06030824  ','0001',' ',38783.5, 'S.M.A.E. ZI METZ BORNY (', @OrderID OUTPUT
EXEC dbo.AddOrder '06030826  ','0001',' ',38791.5, 'S.M.A.E. ZI METZ BORNY (', @OrderID OUTPUT
EXEC dbo.AddOrder '06030827  ','0001',' ',38791.5, 'S.M.A.E. ZI METZ BORNY (', @OrderID OUTPUT
EXEC dbo.AddOrder '06030828  ','0001',' ',38791.5, 'S.M.A.E. ZI METZ BORNY (', @OrderID OUTPUT
EXEC dbo.AddOrder '06030829  ','0001',' ',38791.5, 'S.M.A.E. ZI METZ BORNY (', @OrderID OUTPUT
EXEC dbo.AddOrder '06030830  ','0001',' ',38791.5, 'S.M.A.E. ZI METZ BORNY (', @OrderID OUTPUT
EXEC dbo.AddOrder '06030831  ','0001',' ',38787.5, 'VISTEON SYSTEMES INTERIE', @OrderID OUTPUT
EXEC dbo.AddOrder '06030832  ','0001',' ',38797.5, 'VISTEON SYSTEMES INTERIE', @OrderID OUTPUT
EXEC dbo.AddOrder '06030836  ','0001',' ',38788.5, 'SCHWEITZER S.A.', @OrderID OUTPUT
EXEC dbo.AddOrder '06030838  ','0001',' ',38784.5, 'BRASSERIES KRONENBOURG 5', @OrderID OUTPUT
EXEC dbo.AddOrder '06030840  ','0001',' ',38783.5, 'SA. BOULANGERIE NEUHAUSE', @OrderID OUTPUT
EXEC dbo.AddOrder '06030841  ','0001',' ',38791.5, 'RICOH INDUSTRIE FRANCE', @OrderID OUTPUT
EXEC dbo.AddOrder '06030842  ','0001',' ',38791.5, 'RICOH INDUSTRIE FRANCE', @OrderID OUTPUT
EXEC dbo.AddOrder '06030843  ','0001',' ',38791.5, 'RICOH INDUSTRIE FRANCE', @OrderID OUTPUT
EXEC dbo.AddOrder '06030844  ','0001',' ',38791.5, 'RICOH INDUSTRIE FRANCE', @OrderID OUTPUT
EXEC dbo.AddOrder '06030846  ','0001',' ',38796.5, 'HAGSFELDER WERKSTAETTEN', @OrderID OUTPUT
EXEC dbo.AddOrder '06030847  ','0001',' ',38796.5, 'HAGSFELDER WERKSTAETTEN', @OrderID OUTPUT
EXEC dbo.AddOrder '06030850  ','0001',' ',38783.5, 'KODAK INDUSTRIE', @OrderID OUTPUT
EXEC dbo.AddOrder '06030850  ','0001','a',38783.5, 'KODAK INDUSTRIE', @OrderID OUTPUT
EXEC dbo.AddOrder '06030850  ','0001','b',38783.5, 'KODAK INDUSTRIE', @OrderID OUTPUT
EXEC dbo.AddOrder '06030850  ','0001','d',38783.5, 'KODAK INDUSTRIE', @OrderID OUTPUT
EXEC dbo.AddOrder '06030851  ','0001',' ',38788.5, 'STE ALSA-CORK', @OrderID OUTPUT
EXEC dbo.AddOrder '06030853  ','0001',' ',38789.5, 'STE ALSA-CORK', @OrderID OUTPUT
EXEC dbo.AddOrder '06030854  ','0001',' ',38810.5, 'NEUHAUSER', @OrderID OUTPUT
EXEC dbo.AddOrder '06030856  ','0001',' ',38812.5, 'NEUHAUSER', @OrderID OUTPUT
EXEC dbo.AddOrder '06030858  ','0001',' ',38816.5, 'NEUHAUSER', @OrderID OUTPUT
EXEC dbo.AddOrder '06030860  ','0001',' ',38817.5, 'NEUHAUSER', @OrderID OUTPUT
EXEC dbo.AddOrder '06030862  ','0001',' ',38808.5, 'NEUHAUSER', @OrderID OUTPUT
EXEC dbo.AddOrder '06030863  ','0001',' ',38808.5, 'NEUHAUSER', @OrderID OUTPUT
EXEC dbo.AddOrder '06030865  ','0001',' ',38809.5, 'NEUHAUSER', @OrderID OUTPUT
EXEC dbo.AddOrder '06030866  ','0001',' ',38794.5, 'STE CONFILAND', @OrderID OUTPUT
EXEC dbo.AddOrder '06030867  ','0001',' ',38794.5, 'STE CONFILAND', @OrderID OUTPUT
EXEC dbo.AddOrder '06030868  ','0001',' ',38794.5, 'STE CONFILAND', @OrderID OUTPUT
EXEC dbo.AddOrder '06030869  ','0001',' ',38794.5, 'STE CONFILAND', @OrderID OUTPUT
EXEC dbo.AddOrder '06030871  ','0001',' ',38784.5, 'NEUHAUSER', @OrderID OUTPUT
EXEC dbo.AddOrder '06030875  ','0001',' ',38798.5, 'BEHR SERVICE SAS', @OrderID OUTPUT
EXEC dbo.AddOrder '06030877  ','0001',' ',38791.5, 'STE ALSA-CORK', @OrderID OUTPUT
EXEC dbo.AddOrder '06030880  ','0001',' ',38810.5, 'DICESA SA', @OrderID OUTPUT
EXEC dbo.AddOrder '06030882  ','0001',' ',38790.5, 'TRISS SPOL.S.R.O.', @OrderID OUTPUT
EXEC dbo.AddOrder '06030884  ','0001',' ',38787.5, 'STE SIMU', @OrderID OUTPUT
EXEC dbo.AddOrder '06030886  ','0001',' ',38787.5, 'STE SIMU', @OrderID OUTPUT
EXEC dbo.AddOrder '06030888  ','0001',' ',38787.5, 'STE SIMU', @OrderID OUTPUT
EXEC dbo.AddOrder '06030890  ','0001',' ',38784.5, 'CDF EMBALLAGE SA', @OrderID OUTPUT
EXEC dbo.AddOrder '06030895  ','0001',' ',38805.5, 'CAP LOGISTIC', @OrderID OUTPUT
EXEC dbo.AddOrder '06030896  ','0001',' ',38812.5, 'CAP LOGISTIC', @OrderID OUTPUT
EXEC dbo.AddOrder '06030899  ','0001',' ',38804.5, 'SHARP MANUFACTURING FRAN', @OrderID OUTPUT
EXEC dbo.AddOrder '06030902  ','0001',' ',38812.5, 'CAP LOGISTIC', @OrderID OUTPUT
EXEC dbo.AddOrder '06030903  ','0001',' ',38803.5, 'SHARP MANUFACTURING FRAN', @OrderID OUTPUT
EXEC dbo.AddOrder '06030906  ','0001',' ',38795.5, 'PEUGEOT CITROEN AUTOMOBI', @OrderID OUTPUT
EXEC dbo.AddOrder '06030908  ','0001',' ',38805.5, 'DICESA SA', @OrderID OUTPUT
EXEC dbo.AddOrder '06030909  ','0001',' ',38824.5, 'DICESA SA', @OrderID OUTPUT
EXEC dbo.AddOrder '06030913  ','0001',' ',38790.5, 'ROULEAUX PACK', @OrderID OUTPUT
EXEC dbo.AddOrder '06030914  ','0001',' ',38790.5, 'COGESAL MIKO-FSEUR 58488', @OrderID OUTPUT
EXEC dbo.AddOrder '06030916  ','0001',' ',38787.5, 'COGESAL MIKO-FSEUR 58488', @OrderID OUTPUT
EXEC dbo.AddOrder '06030917  ','0001',' ',38788.5, 'COGESAL MIKO-FSEUR 58488', @OrderID OUTPUT
EXEC dbo.AddOrder '06030918  ','0001',' ',38789.5, 'COGESAL MIKO-FSEUR 58488', @OrderID OUTPUT
EXEC dbo.AddOrder '06030919  ','0001',' ',38794.5, 'STE SIMU', @OrderID OUTPUT
EXEC dbo.AddOrder '06030920  ','0001',' ',38794.5, 'STE SIMU', @OrderID OUTPUT
EXEC dbo.AddOrder '06030921  ','0001',' ',38794.5, 'STE SIMU', @OrderID OUTPUT
EXEC dbo.AddOrder '06030923  ','0001',' ',38784.5, 'WELL-PACK AG', @OrderID OUTPUT
EXEC dbo.AddOrder '06030925  ','0001',' ',38803.5, 'DS SMITH KAYPAC', @OrderID OUTPUT
EXEC dbo.AddOrder '06030928  ','0001',' ',38803.5, 'DS SMITH KAYPAC', @OrderID OUTPUT
EXEC dbo.AddOrder '06030929  ','0001',' ',38782.5, 'DS SMITH KAYPAC', @OrderID OUTPUT
EXEC dbo.AddOrder '06030930  ','0001',' ',38803.5, 'DU PONT DE NEMOURS (FRAN', @OrderID OUTPUT
EXEC dbo.AddOrder '06030932  ','0001',' ',38782.5, 'DS SMITH KAYPAC', @OrderID OUTPUT
EXEC dbo.AddOrder '06030934  ','0001',' ',38782.5, 'DS SMITH KAYPAC', @OrderID OUTPUT
EXEC dbo.AddOrder '06030935  ','0001',' ',38794.5, 'PEUGEOT CITROEN AUTOMOBI', @OrderID OUTPUT
EXEC dbo.AddOrder '06030937  ','0001',' ',38798.5, 'SA. BOULANGERIE NEUHAUSE', @OrderID OUTPUT
EXEC dbo.AddOrder '06030939  ','0001',' ',38798.5, 'SA. BOULANGERIE NEUHAUSE', @OrderID OUTPUT
EXEC dbo.AddOrder '06030942  ','0001',' ',38802.5, 'SA. BOULANGERIE NEUHAUSE', @OrderID OUTPUT
EXEC dbo.AddOrder '06030944  ','0001',' ',38803.5, 'SA. BOULANGERIE NEUHAUSE', @OrderID OUTPUT
EXEC dbo.AddOrder '06030946  ','0001',' ',38789.5, 'DS SMITH KAYPAC', @OrderID OUTPUT
EXEC dbo.AddOrder '06030947  ','0001',' ',38794.5, 'ROLF SCHWIERING GMBH', @OrderID OUTPUT
EXEC dbo.AddOrder '06030948  ','0001',' ',38797.5, 'SA. BOULANGERIE NEUHAUSE', @OrderID OUTPUT
EXEC dbo.AddOrder '06030949  ','0001',' ',38790.5, 'CART.EMBAL. RHONE ALPES', @OrderID OUTPUT
EXEC dbo.AddOrder '06030951  ','0001',' ',38811.5, 'LE FOURNIL DE FREDERIC', @OrderID OUTPUT
EXEC dbo.AddOrder '06030954  ','0001',' ',38789.5, 'HORN VERPACKUNG GMBH', @OrderID OUTPUT
EXEC dbo.AddOrder '06030958  ','0001',' ',38787.5, 'DOW AGROSCIENCES', @OrderID OUTPUT
EXEC dbo.AddOrder '06030959  ','0001',' ',38787.5, 'SCHLIERBACHER KARTONAGEN', @OrderID OUTPUT
EXEC dbo.AddOrder '06030960  ','0001',' ',38787.5, 'DOW AGROSCIENCES', @OrderID OUTPUT
EXEC dbo.AddOrder '06030961  ','0001',' ',38787.5, 'DOW AGROSCIENCES', @OrderID OUTPUT
EXEC dbo.AddOrder '06030962  ','0001',' ',38787.5, 'DOW AGROSCIENCES', @OrderID OUTPUT
EXEC dbo.AddOrder '06030963  ','0001',' ',38787.5, 'DOW AGROSCIENCES', @OrderID OUTPUT
EXEC dbo.AddOrder '06030964  ','0001',' ',38787.5, 'DOW AGROSCIENCES', @OrderID OUTPUT
EXEC dbo.AddOrder '06030965  ','0001',' ',38787.5, 'DOW AGROSCIENCES', @OrderID OUTPUT
EXEC dbo.AddOrder '06030966  ','0001',' ',38787.5, 'DOW AGROSCIENCES', @OrderID OUTPUT
EXEC dbo.AddOrder '06030967  ','0001',' ',38787.5, 'DOW AGROSCIENCES', @OrderID OUTPUT
EXEC dbo.AddOrder '06030968  ','0001',' ',38787.5, 'DOW AGROSCIENCES', @OrderID OUTPUT
EXEC dbo.AddOrder '06030969  ','0001',' ',38787.5, 'DOW AGROSCIENCES', @OrderID OUTPUT
EXEC dbo.AddOrder '06030970  ','0001',' ',38787.5, 'DOW AGROSCIENCES', @OrderID OUTPUT
EXEC dbo.AddOrder '06030971  ','0001',' ',38787.5, 'DOW AGROSCIENCES', @OrderID OUTPUT
EXEC dbo.AddOrder '06030972  ','0001',' ',38787.5, 'DOW AGROSCIENCES', @OrderID OUTPUT
EXEC dbo.AddOrder '06030973  ','0001',' ',38787.5, 'DOW AGROSCIENCES', @OrderID OUTPUT
EXEC dbo.AddOrder '06030974  ','0001',' ',38787.5, 'DOW AGROSCIENCES', @OrderID OUTPUT
EXEC dbo.AddOrder '06030975  ','0001',' ',38787.5, 'DOW AGROSCIENCES', @OrderID OUTPUT
EXEC dbo.AddOrder '06030976  ','0001',' ',38787.5, 'DOW AGROSCIENCES', @OrderID OUTPUT
EXEC dbo.AddOrder '06030977  ','0001',' ',38787.5, 'DOW AGROSCIENCES', @OrderID OUTPUT
EXEC dbo.AddOrder '06030978  ','0001',' ',38787.5, 'DOW AGROSCIENCES', @OrderID OUTPUT
EXEC dbo.AddOrder '06030979  ','0001',' ',38787.5, 'DOW AGROSCIENCES', @OrderID OUTPUT
EXEC dbo.AddOrder '06030980  ','0001',' ',38787.5, 'DOW AGROSCIENCES', @OrderID OUTPUT
EXEC dbo.AddOrder '06030981  ','0001',' ',38787.5, 'DOW AGROSCIENCES', @OrderID OUTPUT
EXEC dbo.AddOrder '06030982  ','0001',' ',38787.5, 'DOW AGROSCIENCES', @OrderID OUTPUT
EXEC dbo.AddOrder '06030983  ','0001',' ',38788.5, 'DOW AGROSCIENCES', @OrderID OUTPUT
EXEC dbo.AddOrder '06030984  ','0001',' ',38788.5, 'DOW AGROSCIENCES', @OrderID OUTPUT
EXEC dbo.AddOrder '06030985  ','0001',' ',38787.5, 'DOW AGROSCIENCES', @OrderID OUTPUT
EXEC dbo.AddOrder '06030986  ','0001',' ',38787.5, 'DOW AGROSCIENCES', @OrderID OUTPUT
EXEC dbo.AddOrder '06030987  ','0001',' ',38787.5, 'DOW AGROSCIENCES', @OrderID OUTPUT
EXEC dbo.AddOrder '06030988  ','0001',' ',38787.5, 'DOW AGROSCIENCES', @OrderID OUTPUT
EXEC dbo.AddOrder '06030989  ','0001',' ',38787.5, 'DOW AGROSCIENCES', @OrderID OUTPUT
EXEC dbo.AddOrder '06030990  ','0001',' ',38788.5, 'DOW AGROSCIENCES', @OrderID OUTPUT
EXEC dbo.AddOrder '06030991  ','0001',' ',38788.5, 'DOW AGROSCIENCES', @OrderID OUTPUT
EXEC dbo.AddOrder '06030992  ','0001',' ',38788.5, 'DOW AGROSCIENCES', @OrderID OUTPUT
EXEC dbo.AddOrder '06030993  ','0001',' ',38787.5, 'DOW AGROSCIENCES', @OrderID OUTPUT
EXEC dbo.AddOrder '06030994  ','0001',' ',38787.5, 'DOW AGROSCIENCES', @OrderID OUTPUT
EXEC dbo.AddOrder '06030995  ','0001',' ',38787.5, 'DOW AGROSCIENCES', @OrderID OUTPUT
EXEC dbo.AddOrder '06030996  ','0001',' ',38787.5, 'DOW AGROSCIENCES', @OrderID OUTPUT
EXEC dbo.AddOrder '06030997  ','0001',' ',38787.5, 'DOW AGROSCIENCES', @OrderID OUTPUT
EXEC dbo.AddOrder '06030998  ','0001',' ',38787.5, 'DOW AGROSCIENCES', @OrderID OUTPUT
EXEC dbo.AddOrder '06030999  ','0001',' ',38787.5, 'DOW AGROSCIENCES', @OrderID OUTPUT
EXEC dbo.AddOrder '06031000  ','0001',' ',38787.5, 'DOW AGROSCIENCES', @OrderID OUTPUT
EXEC dbo.AddOrder '06031001  ','0001',' ',38787.5, 'DOW AGROSCIENCES', @OrderID OUTPUT
EXEC dbo.AddOrder '06031002  ','0001',' ',38787.5, 'DOW AGROSCIENCES', @OrderID OUTPUT
EXEC dbo.AddOrder '06031003  ','0001',' ',38787.5, 'H.J.LICHTENBERGER GMBH', @OrderID OUTPUT
EXEC dbo.AddOrder '06031005  ','0001',' ',38790.5, 'BPW BERGISCHE ACHSEN KG', @OrderID OUTPUT
EXEC dbo.AddOrder '06031006  ','0001',' ',38790.5, 'BPW BERGISCHE ACHSEN KG', @OrderID OUTPUT
EXEC dbo.AddOrder '06031009  ','0001',' ',38791.5, 'WIRTH VERPACKUNGEN GMBH', @OrderID OUTPUT
EXEC dbo.AddOrder '06031012  ','0001',' ',38795.5, 'DOW AGROSCIENCES SWITZEL', @OrderID OUTPUT
EXEC dbo.AddOrder '06031013  ','0001',' ',38802.5, 'DOW AGROSCIENCES SWITZEL', @OrderID OUTPUT
EXEC dbo.AddOrder '06031014  ','0001',' ',38788.5, 'DOW AGROSCIENCES SWITZEL', @OrderID OUTPUT
EXEC dbo.AddOrder '06031015  ','0001',' ',38788.5, 'DOW AGROSCIENCES SWITZEL', @OrderID OUTPUT
EXEC dbo.AddOrder '06031016  ','0001',' ',38788.5, 'DOW AGROSCIENCES SWITZEL', @OrderID OUTPUT
EXEC dbo.AddOrder '06031018  ','0001',' ',38787.5, 'DOW-AGROSCIENCES ITALIA', @OrderID OUTPUT
EXEC dbo.AddOrder '06031019  ','0001',' ',38787.5, 'DOW-AGROSCIENCES ITALIA', @OrderID OUTPUT
EXEC dbo.AddOrder '06031020  ','0001',' ',38787.5, 'DOW-AGROSCIENCES ITALIA', @OrderID OUTPUT
EXEC dbo.AddOrder '06031022  ','0001',' ',38796.5, 'DU PONT DE NEMOURS (FRAN', @OrderID OUTPUT
EXEC dbo.AddOrder '06031023  ','0001',' ',38804.5, 'DOW AGROSCIENCES GMBH', @OrderID OUTPUT
EXEC dbo.AddOrder '06031025  ','0001',' ',38789.5, 'DOW AGROSCIENCES SWITZEL', @OrderID OUTPUT
EXEC dbo.AddOrder '06031027  ','0001',' ',38788.5, 'DOW AGROSCIENCES SWITZEL', @OrderID OUTPUT
EXEC dbo.AddOrder '06031028  ','0001',' ',38788.5, 'DOW AGROSCIENCES SWITZEL', @OrderID OUTPUT
EXEC dbo.AddOrder '06031029  ','0001',' ',38788.5, 'DOW AGROSCIENCES SWITZEL', @OrderID OUTPUT
EXEC dbo.AddOrder '06031030  ','0001',' ',38788.5, 'DOW AGROSCIENCES SWITZEL', @OrderID OUTPUT
EXEC dbo.AddOrder '06031031  ','0001',' ',38788.5, 'DOW AGROSCIENCES SWITZEL', @OrderID OUTPUT
EXEC dbo.AddOrder '06031032  ','0001',' ',38788.5, 'DOW AGROSCIENCES SWITZEL', @OrderID OUTPUT
EXEC dbo.AddOrder '06031035  ','0001',' ',38787.5, 'DOW AGROSCIENCES SWITERL', @OrderID OUTPUT
EXEC dbo.AddOrder '06031036  ','0001',' ',38787.5, 'DOW AGROSCIENCES SWITERL', @OrderID OUTPUT
EXEC dbo.AddOrder '06031039  ','0001',' ',38787.5, 'DOW AGROSCIENCES', @OrderID OUTPUT
EXEC dbo.AddOrder '06031040  ','0001',' ',38784.5, 'P&G INTERNATIONAL OPERAT', @OrderID OUTPUT
EXEC dbo.AddOrder '06031042  ','0001',' ',38816.5, 'DU PONT DE NEMOURS (FRAN', @OrderID OUTPUT
EXEC dbo.AddOrder '06031043  ','0001',' ',38787.5, 'P&G INTERNATIONAL OPERAT', @OrderID OUTPUT
EXEC dbo.AddOrder '06031045  ','0001',' ',38789.5, 'COGESAL MIKO-FSEUR 58488', @OrderID OUTPUT
EXEC dbo.AddOrder '06031046  ','0001',' ',38790.5, 'COGESAL MIKO-FSEUR 58488', @OrderID OUTPUT
EXEC dbo.AddOrder '06031049  ','0001',' ',38787.5, 'COGESAL MIKO-FSEUR 58488', @OrderID OUTPUT
EXEC dbo.AddOrder '06031050  ','0001',' ',38788.5, 'COGESAL MIKO-FSEUR 58488', @OrderID OUTPUT
EXEC dbo.AddOrder '06031051  ','0001',' ',38789.5, 'COGESAL MIKO-FSEUR 58488', @OrderID OUTPUT
EXEC dbo.AddOrder '06031052  ','0001',' ',38790.5, 'COGESAL MIKO-FSEUR 58488', @OrderID OUTPUT
EXEC dbo.AddOrder '06031054  ','0001',' ',38790.5, 'COGESAL MIKO-FSEUR 58488', @OrderID OUTPUT
EXEC dbo.AddOrder '06031057  ','0001',' ',38788.5, 'COGESAL MIKO-FSEUR 58488', @OrderID OUTPUT
EXEC dbo.AddOrder '06031058  ','0001',' ',38789.5, 'COGESAL MIKO-FSEUR 58488', @OrderID OUTPUT
EXEC dbo.AddOrder '06031060  ','0001',' ',38787.5, 'COGESAL MIKO-FSEUR 58488', @OrderID OUTPUT
EXEC dbo.AddOrder '06031061  ','0001',' ',38788.5, 'COGESAL MIKO-FSEUR 58488', @OrderID OUTPUT
EXEC dbo.AddOrder '06031062  ','0001',' ',38789.5, 'COGESAL MIKO-FSEUR 58488', @OrderID OUTPUT
EXEC dbo.AddOrder '06031064  ','0001',' ',38789.5, 'COGESAL MIKO-FSEUR 58488', @OrderID OUTPUT
EXEC dbo.AddOrder '06031066  ','0001',' ',38784.5, 'COGESAL MIKO-FSEUR 58488', @OrderID OUTPUT
EXEC dbo.AddOrder '06031067  ','0001',' ',38787.5, 'COGESAL MIKO-FSEUR 58488', @OrderID OUTPUT
EXEC dbo.AddOrder '06031069  ','0001',' ',38788.5, 'COGESAL MIKO-FSEUR 58488', @OrderID OUTPUT
EXEC dbo.AddOrder '06031070  ','0001',' ',38789.5, 'COGESAL MIKO-FSEUR 58488', @OrderID OUTPUT
EXEC dbo.AddOrder '06031071  ','0001',' ',38784.5, 'MGI COUTIER PLASTIQUE', @OrderID OUTPUT
EXEC dbo.AddOrder '06031076  ','0001',' ',38794.5, 'SCHWEITZER S.A.', @OrderID OUTPUT
EXEC dbo.AddOrder '06031077  ','0001',' ',38805.5, 'WOLFBERGER', @OrderID OUTPUT
EXEC dbo.AddOrder '06031079  ','0001',' ',38788.5, 'SCHWEITZER S.A.', @OrderID OUTPUT
EXEC dbo.AddOrder '06031080  ','0001',' ',38790.5, 'FISCHER SERVICES', @OrderID OUTPUT
EXEC dbo.AddOrder '06031083  ','0001',' ',38798.5, 'DU PONT DE NEMOURS (FRAN', @OrderID OUTPUT
EXEC dbo.AddOrder '06031085  ','0001',' ',38796.5, 'VON ROLL FRANCE SA', @OrderID OUTPUT
EXEC dbo.AddOrder '06031088  ','0001',' ',38783.5, 'NESTLE WATERS SUPPLY EST', @OrderID OUTPUT
EXEC dbo.AddOrder '06031089  ','0001',' ',38791.5, 'NORD REDUCTEURS', @OrderID OUTPUT
EXEC dbo.AddOrder '06031091  ','0001',' ',38797.5, 'PEUGEOT CITROEN AUTOMOBI', @OrderID OUTPUT
EXEC dbo.AddOrder '06031091  ','0001','a',38797.5, 'PEUGEOT CITROEN AUTOMOBI', @OrderID OUTPUT
EXEC dbo.AddOrder '06031093  ','0001',' ',38788.5, 'S.M.A.E.    (EDI)', @OrderID OUTPUT
EXEC dbo.AddOrder '06031095  ','0001',' ',38788.5, 'S.M.A.E.    (EDI)', @OrderID OUTPUT
EXEC dbo.AddOrder '06031099  ','0001',' ',38789.5, 'BRASSERIE FISCHER SA', @OrderID OUTPUT
EXEC dbo.AddOrder '06031100  ','0001',' ',38794.5, 'BEKON-KORALLE AG', @OrderID OUTPUT
EXEC dbo.AddOrder '06031102  ','0001',' ',38787.5, 'BRASSERIE FISCHER SA', @OrderID OUTPUT
EXEC dbo.AddOrder '06031103  ','0001',' ',38797.5, 'BRASSERIE FISCHER SA', @OrderID OUTPUT
EXEC dbo.AddOrder '06031105  ','0001',' ',38794.5, 'STERLING (STE ELECTRIQUE', @OrderID OUTPUT
EXEC dbo.AddOrder '06031107  ','0001',' ',38796.5, 'SELECTARC INDUSTRIES', @OrderID OUTPUT
EXEC dbo.AddOrder '06031110  ','0001',' ',38816.5, 'NOVA INNOVENE INTERNATIO', @OrderID OUTPUT
EXEC dbo.AddOrder '06031111  ','0001',' ',38817.5, 'NOVA INNOVENE INTERNATIO', @OrderID OUTPUT
EXEC dbo.AddOrder '06031117  ','0001',' ',38797.5, 'S.N.R. ROULEMENTS', @OrderID OUTPUT
EXEC dbo.AddOrder '06031118  ','0001',' ',38797.5, 'S.N.R. ROULEMENTS', @OrderID OUTPUT
EXEC dbo.AddOrder '06031121  ','0001',' ',38831.5, 'NOVA INNOVENE INTERNATIO', @OrderID OUTPUT
EXEC dbo.AddOrder '06031122  ','0001',' ',38832.5, 'NOVA INNOVENE INTERNATIO', @OrderID OUTPUT
EXEC dbo.AddOrder '06031126  ','0001',' ',38789.5, 'CHEDDITE FRANCE S.A.', @OrderID OUTPUT
EXEC dbo.AddOrder '06031127  ','0001',' ',38789.5, 'CHEDDITE FRANCE S.A.', @OrderID OUTPUT
EXEC dbo.AddOrder '06031129  ','0001',' ',38818.5, 'DELACHAUX DIVISION EEM -', @OrderID OUTPUT
EXEC dbo.AddOrder '06031130  ','0001',' ',38797.5, 'ED.FRIEDRICH & CO GMBH', @OrderID OUTPUT
EXEC dbo.AddOrder '06031131  ','0001',' ',38795.5, 'BRASSERIE FISCHER SA', @OrderID OUTPUT
EXEC dbo.AddOrder '06031133  ','0001',' ',38795.5, 'BRASSERIE FISCHER SA', @OrderID OUTPUT
EXEC dbo.AddOrder '06031135  ','0001',' ',38788.5, 'ED.FRIEDRICH & CO GMBH', @OrderID OUTPUT
EXEC dbo.AddOrder '06031137  ','0001',' ',38795.5, 'DELIPAPIER', @OrderID OUTPUT
EXEC dbo.AddOrder '06031139  ','0001',' ',38802.5, 'DELIPAPIER', @OrderID OUTPUT
EXEC dbo.AddOrder '06031142  ','0001',' ',38783.5, 'COGESAL MIKO-FSEUR 58488', @OrderID OUTPUT
EXEC dbo.AddOrder '06031150  ','0001',' ',38788.5, 'GEORGIA-PACIFIC FRANCE', @OrderID OUTPUT
EXEC dbo.AddOrder '06031157  ','0001',' ',38789.5, 'CAREDIS', @OrderID OUTPUT
EXEC dbo.AddOrder '06031160  ','0001',' ',38791.5, 'TECUMSEH EUROPE S.A.', @OrderID OUTPUT
EXEC dbo.AddOrder '06031162  ','0001',' ',38790.5, 'SCHWEITZER S.A.', @OrderID OUTPUT
EXEC dbo.AddOrder '06031169  ','0001',' ',38788.5, 'GEORGIA-PACIFIC FRANCE', @OrderID OUTPUT
EXEC dbo.AddOrder '06031170  ','0001',' ',38804.5, 'KONICA MINOLTA SUP.MANU.', @OrderID OUTPUT
EXEC dbo.AddOrder '06031171  ','0001',' ',38804.5, 'KONICA MINOLTA SUP.MANU.', @OrderID OUTPUT
EXEC dbo.AddOrder '06031172  ','0001',' ',38804.5, 'KONICA MINOLTA SUP.MANU.', @OrderID OUTPUT
EXEC dbo.AddOrder '06031173  ','0001',' ',38809.5, 'KONICA MINOLTA SUP.MANU.', @OrderID OUTPUT
EXEC dbo.AddOrder '06031174  ','0001',' ',38809.5, 'KONICA MINOLTA SUP.MANU.', @OrderID OUTPUT
EXEC dbo.AddOrder '06031175  ','0001',' ',38809.5, 'KONICA MINOLTA SUP.MANU.', @OrderID OUTPUT
EXEC dbo.AddOrder '06031176  ','0001',' ',38809.5, 'KONICA MINOLTA SUP.MANU.', @OrderID OUTPUT
EXEC dbo.AddOrder '06031177  ','0001',' ',38804.5, 'KONICA MINOLTA SUP.MANU.', @OrderID OUTPUT
EXEC dbo.AddOrder '06031178  ','0001',' ',38809.5, 'KONICA MINOLTA SUP.MANU.', @OrderID OUTPUT
EXEC dbo.AddOrder '06031179  ','0001',' ',38809.5, 'KONICA MINOLTA SUP.MANU.', @OrderID OUTPUT
EXEC dbo.AddOrder '06031180  ','0001',' ',38815.5, 'KONICA MINOLTA SUP.MANU.', @OrderID OUTPUT
EXEC dbo.AddOrder '06031181  ','0001',' ',38809.5, 'KONICA MINOLTA SUP.MANU.', @OrderID OUTPUT
EXEC dbo.AddOrder '06031182  ','0001',' ',38804.5, 'KONICA MINOLTA SUP.MANU.', @OrderID OUTPUT
EXEC dbo.AddOrder '06031183  ','0001',' ',38809.5, 'KONICA MINOLTA SUP.MANU.', @OrderID OUTPUT
EXEC dbo.AddOrder '06031185  ','0001',' ',38789.5, 'CONDI RHONE ALPES', @OrderID OUTPUT
EXEC dbo.AddOrder '06031187  ','0001',' ',38795.5, 'DS SMITH KAYPAC', @OrderID OUTPUT
EXEC dbo.AddOrder '06031188  ','0001',' ',38801.5, 'LINDAL-FRANCE', @OrderID OUTPUT
EXEC dbo.AddOrder '06031189  ','0001',' ',38803.5, 'LINDAL-FRANCE', @OrderID OUTPUT
EXEC dbo.AddOrder '06031191  ','0001',' ',38789.5, 'DOW AGROSCIENCES', @OrderID OUTPUT
EXEC dbo.AddOrder '06031192  ','0001',' ',38789.5, 'DOW AGROSCIENCES', @OrderID OUTPUT
EXEC dbo.AddOrder '06031195  ','0001',' ',38783.5, 'NESTLE WATERS SUPPLY EST', @OrderID OUTPUT
EXEC dbo.AddOrder '06031197  ','0001',' ',38787.5, 'NESTLE WATERS SUPPLY EST', @OrderID OUTPUT
EXEC dbo.AddOrder '06031199  ','0001',' ',38788.5, 'NESTLE WATERS SUPPLY EST', @OrderID OUTPUT
EXEC dbo.AddOrder '06031201  ','0001',' ',38790.5, 'NESTLE WATERS SUPPLY EST', @OrderID OUTPUT
EXEC dbo.AddOrder '06031202  ','0001',' ',38809.5, 'RICOH INDUSTRIE FRANCE', @OrderID OUTPUT
EXEC dbo.AddOrder '06031203  ','0001',' ',38801.5, 'RICOH INDUSTRIE FRANCE', @OrderID OUTPUT
EXEC dbo.AddOrder '06031204  ','0001',' ',38805.5, 'RICOH INDUSTRIE FRANCE', @OrderID OUTPUT
EXEC dbo.AddOrder '06031205  ','0001',' ',38801.5, 'RICOH INDUSTRIE FRANCE', @OrderID OUTPUT
EXEC dbo.AddOrder '06031207  ','0001',' ',38804.5, 'RICOH INDUSTRIE FRANCE', @OrderID OUTPUT
EXEC dbo.AddOrder '06031208  ','0001',' ',38794.5, 'TILLOTTS PHARMA AG', @OrderID OUTPUT
EXEC dbo.AddOrder '06031212  ','0001',' ',38797.5, 'WALZ VERPACKUNGEN E.K.', @OrderID OUTPUT
EXEC dbo.AddOrder '06031213  ','0001',' ',38791.5, 'SAE SERGE CHEVEAU', @OrderID OUTPUT
EXEC dbo.AddOrder '06031214  ','0001',' ',38794.5, 'WELL-PACK AG', @OrderID OUTPUT
EXEC dbo.AddOrder '06031215  ','0001',' ',38801.5, 'RICOH INDUSTRIE FRANCE', @OrderID OUTPUT
EXEC dbo.AddOrder '06031216  ','0001',' ',38788.5, 'WELL-PACK AG', @OrderID OUTPUT
EXEC dbo.AddOrder '06031217  ','0001',' ',38801.5, 'RICOH INDUSTRIE FRANCE', @OrderID OUTPUT
EXEC dbo.AddOrder '06031218  ','0001',' ',38801.5, 'RICOH INDUSTRIE FRANCE', @OrderID OUTPUT
EXEC dbo.AddOrder '06031220  ','0001',' ',38788.5, 'CONDI RHONE ALPES', @OrderID OUTPUT
EXEC dbo.AddOrder '06031222  ','0001',' ',38796.5, 'DIEFENBACH VERPACKUNGEN', @OrderID OUTPUT
EXEC dbo.AddOrder '06031230  ','0001',' ',38781.5, 'JTEKT AUTOMOBILE', @OrderID OUTPUT
EXEC dbo.AddOrder '06031232  ','0001',' ',38781.5, 'JTEKT AUTOMOBILE', @OrderID OUTPUT
EXEC dbo.AddOrder '06031235  ','0001',' ',38780.5, 'P&G INTERNATIONAL OPERAT', @OrderID OUTPUT
EXEC dbo.AddOrder '06031236  ','0001',' ',38780.5, 'P&G INTERNATIONAL OPERAT', @OrderID OUTPUT
EXEC dbo.AddOrder '06031237  ','0001',' ',38789.5, 'B.V.ALVERIMPORT', @OrderID OUTPUT
EXEC dbo.AddOrder '06031239  ','0001',' ',38797.5, 'B.V.ALVERIMPORT', @OrderID OUTPUT
EXEC dbo.AddOrder '06031241  ','0001',' ',38797.5, 'KRAFT GMBH', @OrderID OUTPUT
EXEC dbo.AddOrder '06031243  ','0001',' ',38797.5, 'WIRTH VERPACKUNGEN GMBH', @OrderID OUTPUT
EXEC dbo.AddOrder '06031245  ','0001',' ',38797.5, 'WIRTH VERPACKUNGEN GMBH', @OrderID OUTPUT
EXEC dbo.AddOrder '06031247  ','0001',' ',38791.5, 'W. WIRTH GMBH', @OrderID OUTPUT
EXEC dbo.AddOrder '06031249  ','0001',' ',38790.5, 'NESTLE WATERS SUPPLY EST', @OrderID OUTPUT
EXEC dbo.AddOrder '06031251  ','0001',' ',38787.5, 'NESTLE WATERS SUPPLY EST', @OrderID OUTPUT
EXEC dbo.AddOrder '06031253  ','0001',' ',38784.5, 'NESTLE WATERS SUPPLY EST', @OrderID OUTPUT
EXEC dbo.AddOrder '06031255  ','0001',' ',38783.5, 'NESTLE WATERS SUPPLY EST', @OrderID OUTPUT
EXEC dbo.AddOrder '06031258  ','0001',' ',38789.5, 'NESTLE WATERS SUPPLY EST', @OrderID OUTPUT
EXEC dbo.AddOrder '06031260  ','0001',' ',38784.5, 'NESTLE WATERS SUPPLY EST', @OrderID OUTPUT
EXEC dbo.AddOrder '06031262  ','0001',' ',38796.5, 'WIRTH VERPACKUNGEN GMBH', @OrderID OUTPUT
EXEC dbo.AddOrder '06031263  ','0001',' ',38783.5, 'NESTLE WATERS SUPPLY EST', @OrderID OUTPUT
EXEC dbo.AddOrder '06031265  ','0001',' ',38789.5, 'NESTLE WATERS SUPPLY EST', @OrderID OUTPUT
EXEC dbo.AddOrder '06031267  ','0001',' ',38790.5, 'NESTLE WATERS SUPPLY EST', @OrderID OUTPUT
EXEC dbo.AddOrder '06031270  ','0001',' ',38783.5, 'NESTLE WATERS SUPPLY EST', @OrderID OUTPUT
EXEC dbo.AddOrder '06031272  ','0001',' ',38795.5, 'DS SMITH KAYPAC', @OrderID OUTPUT
EXEC dbo.AddOrder '06031273  ','0001',' ',38795.5, 'DS SMITH KAYPAC', @OrderID OUTPUT
EXEC dbo.AddOrder '06031274  ','0001',' ',38810.5, 'MAISON SPARR', @OrderID OUTPUT
EXEC dbo.AddOrder '06031277  ','0001',' ',38784.5, 'ALCOOL PETROLE CHIMIE', @OrderID OUTPUT
EXEC dbo.AddOrder '06031278  ','0001',' ',38797.5, 'T R W FAHRWERKSYS.GMBH &', @OrderID OUTPUT
EXEC dbo.AddOrder '06031279  ','0001',' ',38797.5, 'T R W FAHRWERKSYS.GMBH &', @OrderID OUTPUT
EXEC dbo.AddOrder '06031282  ','0001',' ',38787.5, 'NESTLE WATERS SUPPLY EST', @OrderID OUTPUT
EXEC dbo.AddOrder '06031285  ','0001',' ',38797.5, 'LABORATOIRE ALCON', @OrderID OUTPUT
EXEC dbo.AddOrder '06031286  ','0001',' ',38798.5, 'LABORATOIRE ALCON', @OrderID OUTPUT
EXEC dbo.AddOrder '06031287  ','0001',' ',38812.5, 'LABORATOIRE ALCON', @OrderID OUTPUT
EXEC dbo.AddOrder '06031289  ','0001',' ',38796.5, 'PACKMANN GMBH', @OrderID OUTPUT
EXEC dbo.AddOrder '06031291  ','0001',' ',38783.5, 'NESTLE WATERS SUPPLY EST', @OrderID OUTPUT
EXEC dbo.AddOrder '06031293  ','0001',' ',38783.5, 'NESTLE WATERS SUPPLY EST', @OrderID OUTPUT
EXEC dbo.AddOrder '06031296  ','0001',' ',38795.5, 'DS SMITH KAYPAC', @OrderID OUTPUT
EXEC dbo.AddOrder '06031297  ','0001',' ',38795.5, 'DU PONT DE NEMOURS S.A.', @OrderID OUTPUT
EXEC dbo.AddOrder '06031299  ','0001',' ',38788.5, 'TIMKEN EUROPE', @OrderID OUTPUT
EXEC dbo.AddOrder '06031301  ','0001',' ',38791.5, 'TIMKEN EUROPE', @OrderID OUTPUT
EXEC dbo.AddOrder '06031303  ','0001',' ',38795.5, 'SCHWEITZER S.A.', @OrderID OUTPUT
EXEC dbo.AddOrder '06031304  ','0001',' ',38795.5, 'SCHWEITZER S.A.', @OrderID OUTPUT
EXEC dbo.AddOrder '06031306  ','0001',' ',38796.5, 'SCHWEITZER S.A.', @OrderID OUTPUT
EXEC dbo.AddOrder '06031308  ','0001',' ',38794.5, 'SCHWEITZER S.A.', @OrderID OUTPUT
EXEC dbo.AddOrder '06031309  ','0001',' ',38794.5, 'SCHWEITZER S.A.', @OrderID OUTPUT
EXEC dbo.AddOrder '06031311  ','0001',' ',38787.5, 'DS SMITH KAYPAC', @OrderID OUTPUT
EXEC dbo.AddOrder '06031314  ','0001',' ',38804.5, 'MAGIMIX', @OrderID OUTPUT
EXEC dbo.AddOrder '06031315  ','0001',' ',38817.5, 'ROBOT COUPE', @OrderID OUTPUT
EXEC dbo.AddOrder '06031316  ','0001',' ',38838.5, 'GEPMAN S.A.S', @OrderID OUTPUT
EXEC dbo.AddOrder '06031318  ','0001',' ',38797.5, 'W O L F  GMBH', @OrderID OUTPUT
EXEC dbo.AddOrder '06031319  ','0001',' ',38787.5, 'DS SMITH KAYPAC', @OrderID OUTPUT
EXEC dbo.AddOrder '06031321  ','0001',' ',38789.5, 'GENERAL MOTORS STRASBOUR', @OrderID OUTPUT
EXEC dbo.AddOrder '06031322  ','0001',' ',38789.5, 'OTTO RAUHUT GMBH & CO', @OrderID OUTPUT
EXEC dbo.AddOrder '06031323  ','0001',' ',38789.5, 'W. WIRTH GMBH', @OrderID OUTPUT
EXEC dbo.AddOrder '06031325  ','0001',' ',38802.5, 'BRANGS + HEINRICH GMBH', @OrderID OUTPUT
EXEC dbo.AddOrder '06031326  ','0001',' ',38802.5, 'BRANGS + HEINRICH GMBH', @OrderID OUTPUT
EXEC dbo.AddOrder '06031327  ','0001',' ',38791.5, 'DIEFENBACH VERPACKUNGEN', @OrderID OUTPUT
EXEC dbo.AddOrder '06031331  ','0001',' ',38794.5, 'MAUSER METAL', @OrderID OUTPUT
EXEC dbo.AddOrder '06031334  ','0001',' ',38818.5, 'B.V.ALVERIMPORT', @OrderID OUTPUT
EXEC dbo.AddOrder '06031337  ','0001',' ',38794.5, 'CDF EMBALLAGE SA', @OrderID OUTPUT
EXEC dbo.AddOrder '06031338  ','0001',' ',38801.5, 'B.V.ALVERIMPORT', @OrderID OUTPUT
EXEC dbo.AddOrder '06031341  ','0001',' ',38816.5, 'B.V.ALVERIMPORT', @OrderID OUTPUT
EXEC dbo.AddOrder '06031342  ','0001',' ',38808.5, 'PEUGEOT CITROEN AUTOMOBI', @OrderID OUTPUT
EXEC dbo.AddOrder '06031345  ','0001',' ',38796.5, 'SCHWEITZER S.A.', @OrderID OUTPUT
EXEC dbo.AddOrder '06031346  ','0001',' ',38796.5, 'SCHWEITZER S.A.', @OrderID OUTPUT
EXEC dbo.AddOrder '06031351  ','0001',' ',38788.5, 'STE ALSA-CORK', @OrderID OUTPUT
EXEC dbo.AddOrder '06031352  ','0001',' ',38794.5, 'PEUGEOT CITROEN AUTOMOBI', @OrderID OUTPUT
EXEC dbo.AddOrder '06031353  ','0001',' ',38794.5, 'WELL-PACK AG', @OrderID OUTPUT
EXEC dbo.AddOrder '06031355  ','0001',' ',38797.5, 'WELL-PACK AG', @OrderID OUTPUT
EXEC dbo.AddOrder '06031358  ','0001',' ',38818.5, 'PRODENE KLINT ESPACE LEA', @OrderID OUTPUT
EXEC dbo.AddOrder '06031360  ','0001',' ',38809.5, 'PRODENE KLINT ESPACE LEA', @OrderID OUTPUT
EXEC dbo.AddOrder '06031362  ','0001',' ',38808.5, 'PRODENE KLINT ESPACE LEA', @OrderID OUTPUT
EXEC dbo.AddOrder '06031363  ','0001',' ',38808.5, 'PRODENE KLINT ESPACE LEA', @OrderID OUTPUT
EXEC dbo.AddOrder '06031365  ','0001',' ',38808.5, 'PRODENE KLINT ESPACE LEA', @OrderID OUTPUT
EXEC dbo.AddOrder '06031367  ','0001',' ',38808.5, 'PRODENE KLINT ESPACE LEA', @OrderID OUTPUT
EXEC dbo.AddOrder '06031368  ','0001',' ',38798.5, 'ATELIERS BUSCH & CIE', @OrderID OUTPUT
EXEC dbo.AddOrder '06031369  ','0001',' ',38798.5, 'ATELIERS BUSCH & CIE', @OrderID OUTPUT
EXEC dbo.AddOrder '06031370  ','0001',' ',38798.5, 'ATELIERS BUSCH & CIE', @OrderID OUTPUT
EXEC dbo.AddOrder '06031371  ','0001',' ',38798.5, 'ATELIERS BUSCH & CIE', @OrderID OUTPUT
EXEC dbo.AddOrder '06031372  ','0001',' ',38788.5, 'SCHLIERBACHER KARTONAGEN', @OrderID OUTPUT
EXEC dbo.AddOrder '06031372  ','0002',' ',38788.5, 'SCHLIERBACHER KARTONAGEN', @OrderID OUTPUT
EXEC dbo.AddOrder '06031377  ','0001',' ',38784.5, 'NESTLE WATERS SUPPLY EST', @OrderID OUTPUT
EXEC dbo.AddOrder '06031379  ','0001',' ',38787.5, 'NESTLE WATERS SUPPLY EST', @OrderID OUTPUT
EXEC dbo.AddOrder '06031381  ','0001',' ',38789.5, 'NOVARTIS CONSUMER HEALTH', @OrderID OUTPUT
EXEC dbo.AddOrder '06031382  ','0001',' ',38790.5, 'NESTLE WATERS SUPPLY EST', @OrderID OUTPUT
EXEC dbo.AddOrder '06031384  ','0001',' ',38791.5, 'NESTLE WATERS SUPPLY EST', @OrderID OUTPUT
EXEC dbo.AddOrder '06031386  ','0001',' ',38794.5, 'NESTLE WATERS SUPPLY EST', @OrderID OUTPUT
EXEC dbo.AddOrder '06031388  ','0001',' ',38795.5, 'NESTLE WATERS SUPPLY EST', @OrderID OUTPUT
EXEC dbo.AddOrder '06031390  ','0001',' ',38797.5, 'NESTLE WATERS SUPPLY EST', @OrderID OUTPUT
EXEC dbo.AddOrder '06031392  ','0001',' ',38798.5, 'NESTLE WATERS SUPPLY EST', @OrderID OUTPUT
EXEC dbo.AddOrder '06031394  ','0001',' ',38837.5, 'GEPMAN S.A.S', @OrderID OUTPUT
EXEC dbo.AddOrder '06031395  ','0001',' ',38837.5, 'GEPMAN S.A.S', @OrderID OUTPUT
EXEC dbo.AddOrder '06031397  ','0001',' ',38812.5, 'PATHEON', @OrderID OUTPUT
EXEC dbo.AddOrder '06031399  ','0001',' ',38788.5, 'CART.EMBAL. RHONE ALPES', @OrderID OUTPUT
EXEC dbo.AddOrder '06031400  ','0001',' ',38788.5, 'CART.EMBAL. RHONE ALPES', @OrderID OUTPUT
EXEC dbo.AddOrder '06031401  ','0001',' ',38803.5, 'PATHEON', @OrderID OUTPUT
EXEC dbo.AddOrder '06031402  ','0001',' ',38803.5, 'PATHEON', @OrderID OUTPUT
EXEC dbo.AddOrder '06031404  ','0001',' ',38808.5, 'PATHEON', @OrderID OUTPUT
EXEC dbo.AddOrder '06031405  ','0001',' ',38784.5, 'NESTLE WATERS SUPPLY EST', @OrderID OUTPUT
EXEC dbo.AddOrder '06031407  ','0001',' ',38796.5, 'BPW BERGISCHE ACHSEN KG', @OrderID OUTPUT
EXEC dbo.AddOrder '06031408  ','0001',' ',38788.5, 'CART.EMBAL. RHONE ALPES', @OrderID OUTPUT
EXEC dbo.AddOrder '06031409  ','0001',' ',38788.5, 'CART.EMBAL. RHONE ALPES', @OrderID OUTPUT
EXEC dbo.AddOrder '06031410  ','0001',' ',38798.5, 'DIEFENBACH VERPACKUNGEN', @OrderID OUTPUT
EXEC dbo.AddOrder '06031411  ','0001',' ',38788.5, 'CART.EMBAL. RHONE ALPES', @OrderID OUTPUT
EXEC dbo.AddOrder '06031413  ','0001',' ',38797.5, 'DIEFENBACH VERPACKUNGEN', @OrderID OUTPUT
EXEC dbo.AddOrder '06031415  ','0001',' ',38796.5, 'TECUMSEH EUROPE S.A.', @OrderID OUTPUT
EXEC dbo.AddOrder '06031416  ','0001',' ',38795.5, 'TECUMSEH EUROPE S.A.', @OrderID OUTPUT
EXEC dbo.AddOrder '06031418  ','0001',' ',38795.5, 'NESTLE WATERS SUPPLY EST', @OrderID OUTPUT
EXEC dbo.AddOrder '06031419  ','0001',' ',38788.5, 'CART.EMBAL. RHONE ALPES', @OrderID OUTPUT
EXEC dbo.AddOrder '06031424  ','0001',' ',38784.5, 'P&G INTERNATIONAL OPERAT', @OrderID OUTPUT
EXEC dbo.AddOrder '06031427  ','0001',' ',38784.5, 'P&G INTERNATIONAL OPERAT', @OrderID OUTPUT
EXEC dbo.AddOrder '06031429  ','0001',' ',38797.5, 'P&G INTERNATIONAL OPERAT', @OrderID OUTPUT
EXEC dbo.AddOrder '06031432  ','0001',' ',38788.5, 'P&G INTERNATIONAL OPERAT', @OrderID OUTPUT
EXEC dbo.AddOrder '06031434  ','0001',' ',38801.5, 'DS SMITH KAYSERSBERG', @OrderID OUTPUT
EXEC dbo.AddOrder '06031435  ','0001',' ',38796.5, 'ADHESIA', @OrderID OUTPUT
EXEC dbo.AddOrder '06031437  ','0001',' ',38791.5, 'P&G INTERNATIONAL OPERAT', @OrderID OUTPUT
EXEC dbo.AddOrder '06031439  ','0001',' ',38811.5, 'CIE FRANCO-SUISSE', @OrderID OUTPUT
EXEC dbo.AddOrder '06031440  ','0001',' ',38811.5, 'CIE FRANCO-SUISSE', @OrderID OUTPUT
EXEC dbo.AddOrder '06031442  ','0001',' ',38794.5, 'P&G INTERNATIONAL OPERAT', @OrderID OUTPUT
EXEC dbo.AddOrder '06031444  ','0001',' ',38798.5, 'P&G INTERNATIONAL OPERAT', @OrderID OUTPUT
EXEC dbo.AddOrder '06031446  ','0001',' ',38798.5, 'P&G INTERNATIONAL OPERAT', @OrderID OUTPUT
EXEC dbo.AddOrder '06031448  ','0001',' ',38791.5, 'P&G INTERNATIONAL OPERAT', @OrderID OUTPUT
EXEC dbo.AddOrder '06031450  ','0001',' ',38795.5, 'P&G INTERNATIONAL OPERAT', @OrderID OUTPUT
EXEC dbo.AddOrder '06031453  ','0001',' ',38798.5, 'P&G INTERNATIONAL OPERAT', @OrderID OUTPUT
EXEC dbo.AddOrder '06031456  ','0001',' ',38794.5, 'P&G INTERNATIONAL OPERAT', @OrderID OUTPUT
EXEC dbo.AddOrder '06031459  ','0001',' ',38823.5, 'CRISTALLERIES DE BACCARA', @OrderID OUTPUT
EXEC dbo.AddOrder '06031460  ','0001',' ',38837.5, 'CRISTALLERIES DE BACCARA', @OrderID OUTPUT
EXEC dbo.AddOrder '06031462  ','0001',' ',38795.5, 'P&G INTERNATIONAL OPERAT', @OrderID OUTPUT
EXEC dbo.AddOrder '06031463  ','0001',' ',38801.5, 'CELLIER DES DAUPHINS', @OrderID OUTPUT
EXEC dbo.AddOrder '06031464  ','0001',' ',38801.5, 'CELLIER DES DAUPHINS', @OrderID OUTPUT
EXEC dbo.AddOrder '06031465  ','0001',' ',38794.5, 'CELLIER DES DAUPHINS', @OrderID OUTPUT
EXEC dbo.AddOrder '06031466  ','0001',' ',38796.5, 'CELLIER DES DAUPHINS', @OrderID OUTPUT
EXEC dbo.AddOrder '06031467  ','0001',' ',38797.5, 'CELLIER DES DAUPHINS', @OrderID OUTPUT
EXEC dbo.AddOrder '06031468  ','0001',' ',38798.5, 'CELLIER DES DAUPHINS', @OrderID OUTPUT
EXEC dbo.AddOrder '06031469  ','0001',' ',38801.5, 'CELLIER DES DAUPHINS', @OrderID OUTPUT
EXEC dbo.AddOrder '06031472  ','0001',' ',38789.5, 'P&G INTERNATIONAL OPERAT', @OrderID OUTPUT
EXEC dbo.AddOrder '06031474  ','0001',' ',38930.5, 'WELL-PACK AG', @OrderID OUTPUT
EXEC dbo.AddOrder '06031475  ','0001',' ',38783.5, 'P&G INTERNATIONAL OPERAT', @OrderID OUTPUT
EXEC dbo.AddOrder '06031477  ','0001',' ',38787.5, 'P&G INTERNATIONAL OPERAT', @OrderID OUTPUT
EXEC dbo.AddOrder '06031479  ','0001',' ',38788.5, 'P&G INTERNATIONAL OPERAT', @OrderID OUTPUT
EXEC dbo.AddOrder '06031482  ','0001',' ',38790.5, 'P&G INTERNATIONAL OPERAT', @OrderID OUTPUT
EXEC dbo.AddOrder '06031484  ','0001',' ',38791.5, 'P&G INTERNATIONAL OPERAT', @OrderID OUTPUT
EXEC dbo.AddOrder '06031487  ','0001',' ',38789.5, 'P&G INTERNATIONAL OPERAT', @OrderID OUTPUT
EXEC dbo.AddOrder '06031490  ','0001',' ',38805.5, 'HEXCEL FABRICS S.A.', @OrderID OUTPUT
EXEC dbo.AddOrder '06031491  ','0001',' ',38815.5, 'HEXCEL FABRICS S.A.', @OrderID OUTPUT
EXEC dbo.AddOrder '06031492  ','0001',' ',38798.5, 'P&G INTERNATIONAL OPERAT', @OrderID OUTPUT
EXEC dbo.AddOrder '06031495  ','0001',' ',38794.5, 'STANLEY FRANCE DIVISION', @OrderID OUTPUT
EXEC dbo.AddOrder '06031498  ','0001',' ',38797.5, 'P.B.I.-PORTERET BEAULIEU', @OrderID OUTPUT
EXEC dbo.AddOrder '06031500  ','0001',' ',38797.5, 'P&G INTERNATIONAL OPERAT', @OrderID OUTPUT
EXEC dbo.AddOrder '06031502  ','0001',' ',38796.5, 'P&G INTERNATIONAL OPERAT', @OrderID OUTPUT
EXEC dbo.AddOrder '06031504  ','0001',' ',38788.5, 'P&G INTERNATIONAL OPERAT', @OrderID OUTPUT
EXEC dbo.AddOrder '06031506  ','0001',' ',38790.5, 'CARTONNAGES DU DAUPHINE', @OrderID OUTPUT
EXEC dbo.AddOrder '06031507  ','0001',' ',38804.5, 'BUBENDORFF VOLET ROULANT', @OrderID OUTPUT
EXEC dbo.AddOrder '06031508  ','0001',' ',38816.5, 'BUBENDORFF VOLET ROULANT', @OrderID OUTPUT
EXEC dbo.AddOrder '06031509  ','0001',' ',38804.5, 'BUBENDORFF VOLET ROULANT', @OrderID OUTPUT
EXEC dbo.AddOrder '06031510  ','0001',' ',38816.5, 'BUBENDORFF VOLET ROULANT', @OrderID OUTPUT
EXEC dbo.AddOrder '06031511  ','0001',' ',38804.5, 'BUBENDORFF VOLET ROULANT', @OrderID OUTPUT
EXEC dbo.AddOrder '06031512  ','0001',' ',38804.5, 'BUBENDORFF VOLET ROULANT', @OrderID OUTPUT
EXEC dbo.AddOrder '06031513  ','0001',' ',38804.5, 'BUBENDORFF VOLET ROULANT', @OrderID OUTPUT
EXEC dbo.AddOrder '06031514  ','0001',' ',38816.5, 'BUBENDORFF VOLET ROULANT', @OrderID OUTPUT
EXEC dbo.AddOrder '06031516  ','0001',' ',38788.5, 'NESTLE WATERS SUPPLY EST', @OrderID OUTPUT
EXEC dbo.AddOrder '06031518  ','0001',' ',38789.5, 'NESTLE WATERS SUPPLY EST', @OrderID OUTPUT
EXEC dbo.AddOrder '06031520  ','0001',' ',38795.5, 'NESTLE WATERS SUPPLY EST', @OrderID OUTPUT
EXEC dbo.AddOrder '06031522  ','0001',' ',38804.5, 'NESTLE WATERS SUPPLY EST', @OrderID OUTPUT
EXEC dbo.AddOrder '06031524  ','0001',' ',38796.5, 'NESTLE WATERS SUPPLY EST', @OrderID OUTPUT
EXEC dbo.AddOrder '06031526  ','0001',' ',38797.5, 'NESTLE WATERS SUPPLY EST', @OrderID OUTPUT
EXEC dbo.AddOrder '06031528  ','0001',' ',38797.5, 'NESTLE WATERS SUPPLY EST', @OrderID OUTPUT
EXEC dbo.AddOrder '06031530  ','0001',' ',38794.5, 'NESTLE WATERS SUPPLY EST', @OrderID OUTPUT
EXEC dbo.AddOrder '06031532  ','0001',' ',38790.5, 'NESTLE WATERS SUPPLY EST', @OrderID OUTPUT
EXEC dbo.AddOrder '06031534  ','0001',' ',38794.5, 'NESTLE WATERS SUPPLY EST', @OrderID OUTPUT
EXEC dbo.AddOrder '06031536  ','0001',' ',38796.5, 'NESTLE WATERS SUPPLY EST', @OrderID OUTPUT
EXEC dbo.AddOrder '06031538  ','0001',' ',38789.5, 'NESTLE WATERS SUPPLY EST', @OrderID OUTPUT
EXEC dbo.AddOrder '06031540  ','0001',' ',38791.5, 'NESTLE WATERS SUPPLY EST', @OrderID OUTPUT
EXEC dbo.AddOrder '06031542  ','0001',' ',38796.5, 'NESTLE WATERS SUPPLY EST', @OrderID OUTPUT
EXEC dbo.AddOrder '06031544  ','0001',' ',38797.5, 'NESTLE WATERS SUPPLY EST', @OrderID OUTPUT
EXEC dbo.AddOrder '06031546  ','0001',' ',38791.5, 'NESTLE WATERS SUPPLY EST', @OrderID OUTPUT
EXEC dbo.AddOrder '06031548  ','0001',' ',38795.5, 'NESTLE WATERS SUPPLY EST', @OrderID OUTPUT
EXEC dbo.AddOrder '06031550  ','0001',' ',38796.5, 'NESTLE WATERS SUPPLY EST', @OrderID OUTPUT
EXEC dbo.AddOrder '06031552  ','0001',' ',38791.5, 'NESTLE WATERS SUPPLY EST', @OrderID OUTPUT
EXEC dbo.AddOrder '06031554  ','0001',' ',38795.5, 'NESTLE WATERS SUPPLY EST', @OrderID OUTPUT
EXEC dbo.AddOrder '06031556  ','0001',' ',38796.5, 'NESTLE WATERS SUPPLY EST', @OrderID OUTPUT
EXEC dbo.AddOrder '06031558  ','0001',' ',38797.5, 'NESTLE WATERS SUPPLY EST', @OrderID OUTPUT
EXEC dbo.AddOrder '06031560  ','0001',' ',38804.5, 'NESTLE WATERS SUPPLY EST', @OrderID OUTPUT
EXEC dbo.AddOrder '06031562  ','0001',' ',38811.5, 'NESTLE WATERS SUPPLY EST', @OrderID OUTPUT
EXEC dbo.AddOrder '06031565  ','0001',' ',38789.5, 'GEORGIA-PACIFIC FRANCE', @OrderID OUTPUT
EXEC dbo.AddOrder '06031567  ','0001',' ',38809.5, 'GEORGIA-PACIFIC FRANCE', @OrderID OUTPUT
EXEC dbo.AddOrder '06031570  ','0001',' ',38795.5, 'S.M.A.E. ZI METZ BORNY (', @OrderID OUTPUT
EXEC dbo.AddOrder '06031571  ','0001',' ',38802.5, 'GEORGIA-PACIFIC FRANCE', @OrderID OUTPUT
EXEC dbo.AddOrder '06031572  ','0001',' ',38795.5, 'S.M.A.E. ZI METZ BORNY (', @OrderID OUTPUT
EXEC dbo.AddOrder '06031573  ','0001',' ',38795.5, 'S.M.A.E. ZI METZ BORNY (', @OrderID OUTPUT
EXEC dbo.AddOrder '06031574  ','0001',' ',38795.5, 'S.M.A.E. ZI METZ BORNY (', @OrderID OUTPUT
EXEC dbo.AddOrder '06031575  ','0001',' ',38809.5, 'GEORGIA-PACIFIC FRANCE', @OrderID OUTPUT
EXEC dbo.AddOrder '06031576  ','0001',' ',38795.5, 'S.M.A.E. ZI METZ BORNY (', @OrderID OUTPUT
EXEC dbo.AddOrder '06031578  ','0001',' ',38798.5, 'S.M.A.E. ZI METZ BORNY (', @OrderID OUTPUT
EXEC dbo.AddOrder '06031581  ','0001',' ',38798.5, 'S.M.A.E. ZI METZ BORNY (', @OrderID OUTPUT
EXEC dbo.AddOrder '06031582  ','0001',' ',38798.5, 'S.M.A.E. ZI METZ BORNY (', @OrderID OUTPUT
EXEC dbo.AddOrder '06031583  ','0001',' ',38798.5, 'S.M.A.E. ZI METZ BORNY (', @OrderID OUTPUT
EXEC dbo.AddOrder '06031584  ','0001',' ',38798.5, 'S.M.A.E. ZI METZ BORNY (', @OrderID OUTPUT
EXEC dbo.AddOrder '06031585  ','0001',' ',38798.5, 'S.M.A.E. ZI METZ BORNY (', @OrderID OUTPUT
EXEC dbo.AddOrder '06031587  ','0001',' ',38797.5, 'FRIEDRICH BOYSEN GMBH &', @OrderID OUTPUT
EXEC dbo.AddOrder '06031588  ','0001',' ',38798.5, 'S.M.A.E. ZI METZ BORNY (', @OrderID OUTPUT
EXEC dbo.AddOrder '06031589  ','0001',' ',38798.5, 'S.M.A.E. ZI METZ BORNY (', @OrderID OUTPUT
EXEC dbo.AddOrder '06031590  ','0001',' ',38798.5, 'S.M.A.E. ZI METZ BORNY (', @OrderID OUTPUT
EXEC dbo.AddOrder '06031591  ','0001',' ',38798.5, 'S.M.A.E. ZI METZ BORNY (', @OrderID OUTPUT
EXEC dbo.AddOrder '06031592  ','0001',' ',38798.5, 'S.M.A.E. ZI METZ BORNY (', @OrderID OUTPUT
EXEC dbo.AddOrder '06031594  ','0001',' ',38797.5, 'KRAFT GMBH', @OrderID OUTPUT
EXEC dbo.AddOrder '06031595  ','0001',' ',38794.5, 'CDF EMBALLAGE SA', @OrderID OUTPUT
EXEC dbo.AddOrder '06031597  ','0001',' ',38802.5, 'CDF EMBALLAGE SA', @OrderID OUTPUT
EXEC dbo.AddOrder '06031599  ','0001',' ',38795.5, 'WELL-PACK AG', @OrderID OUTPUT
EXEC dbo.AddOrder '06031600  ','0001',' ',38795.5, 'WELL-PACK AG', @OrderID OUTPUT
EXEC dbo.AddOrder '06031603  ','0001',' ',38795.5, 'ROCKWOOL FRANCE SAS', @OrderID OUTPUT
EXEC dbo.AddOrder '06031604  ','0001',' ',38796.5, 'P.B.I.-PORTERET BEAULIEU', @OrderID OUTPUT
EXEC dbo.AddOrder '06031605  ','0001',' ',38791.5, 'INTERGESTION', @OrderID OUTPUT
EXEC dbo.AddOrder '06031606  ','0001',' ',38791.5, 'INTERGESTION', @OrderID OUTPUT
EXEC dbo.AddOrder '06031607  ','0001',' ',38791.5, 'INTERGESTION', @OrderID OUTPUT
EXEC dbo.AddOrder '06031608  ','0001',' ',38791.5, 'INTERGESTION', @OrderID OUTPUT
EXEC dbo.AddOrder '06031613  ','0001',' ',38804.5, 'MAHLE VENTIELTRIEB GMBH', @OrderID OUTPUT
EXEC dbo.AddOrder '06031619  ','0001',' ',38790.5, 'PEUGEOT CITROEN AUTOMOBI', @OrderID OUTPUT
EXEC dbo.AddOrder '06031620  ','0001',' ',38790.5, 'PEUGEOT CITROEN AUTOMOBI', @OrderID OUTPUT
EXEC dbo.AddOrder '06031621  ','0001',' ',38789.5, 'STE WRIGLEY FRANCE S.N.C', @OrderID OUTPUT
EXEC dbo.AddOrder '06031622  ','0001',' ',38789.5, 'STE WRIGLEY FRANCE S.N.C', @OrderID OUTPUT
EXEC dbo.AddOrder '06031623  ','0001',' ',38789.5, 'STE WRIGLEY FRANCE S.N.C', @OrderID OUTPUT
EXEC dbo.AddOrder '06031626  ','0001',' ',38790.5, 'W. WIRTH GMBH', @OrderID OUTPUT
EXEC dbo.AddOrder '06031628  ','0001',' ',38805.5, 'LABORATOIRE ALCON', @OrderID OUTPUT
EXEC dbo.AddOrder '06031631  ','0001',' ',38791.5, 'STE ALSA-CORK', @OrderID OUTPUT
EXEC dbo.AddOrder '06031633  ','0001',' ',38801.5, 'B.V.ALVERIMPORT', @OrderID OUTPUT
EXEC dbo.AddOrder '06031638  ','0001',' ',38798.5, 'TECUMSEH EUROPE S.A.', @OrderID OUTPUT
EXEC dbo.AddOrder '06031640  ','0001',' ',38796.5, 'SARKOS S.A.', @OrderID OUTPUT
EXEC dbo.AddOrder '06031641  ','0001',' ',38795.5, 'SARKOS S.A.', @OrderID OUTPUT
EXEC dbo.AddOrder '06031642  ','0001',' ',38795.5, 'SARKOS S.A.', @OrderID OUTPUT
EXEC dbo.AddOrder '06031643  ','0001',' ',38791.5, 'DS SMITH KAYSERSBERG', @OrderID OUTPUT
EXEC dbo.AddOrder '06031644  ','0001',' ',38790.5, 'REHAU AG & CO', @OrderID OUTPUT
EXEC dbo.AddOrder '06031645  ','0001',' ',38790.5, 'REHAU AG & CO', @OrderID OUTPUT
EXEC dbo.AddOrder '06031646  ','0001',' ',38790.5, 'REHAU AG & CO', @OrderID OUTPUT
EXEC dbo.AddOrder '06031648  ','0001',' ',38803.5, 'JDW SPEDITION + LOGISTIK', @OrderID OUTPUT
EXEC dbo.AddOrder '06031649  ','0001',' ',38803.5, 'JDW SPEDITION + LOGISTIK', @OrderID OUTPUT
EXEC dbo.AddOrder '06031650  ','0001',' ',38796.5, 'JDW SPEDITION + LOGISTIK', @OrderID OUTPUT
EXEC dbo.AddOrder '06031651  ','0001',' ',38789.5, 'NOVARTIS CONSUMER HEALTH', @OrderID OUTPUT
EXEC dbo.AddOrder '06031652  ','0001',' ',38789.5, 'NOVARTIS CONSUMER HEALTH', @OrderID OUTPUT
EXEC dbo.AddOrder '06031653  ','0001',' ',38784.5, 'NOVARTIS CONSUMER HEALTH', @OrderID OUTPUT
EXEC dbo.AddOrder '06031654  ','0001',' ',38784.5, 'NOVARTIS CONSUMER HEALTH', @OrderID OUTPUT
EXEC dbo.AddOrder '06031655  ','0001',' ',38784.5, 'NOVARTIS CONSUMER HEALTH', @OrderID OUTPUT
EXEC dbo.AddOrder '06031656  ','0001',' ',38784.5, 'NOVARTIS CONSUMER HEALTH', @OrderID OUTPUT
EXEC dbo.AddOrder '06031657  ','0001',' ',38791.5, 'NOVARTIS CONSUMER HEALTH', @OrderID OUTPUT
EXEC dbo.AddOrder '06031658  ','0001',' ',38791.5, 'NOVARTIS CONSUMER HEALTH', @OrderID OUTPUT
EXEC dbo.AddOrder '06031659  ','0001',' ',38791.5, 'NOVARTIS CONSUMER HEALTH', @OrderID OUTPUT
EXEC dbo.AddOrder '06031660  ','0001',' ',38789.5, 'NOVARTIS CONSUMER HEALTH', @OrderID OUTPUT
EXEC dbo.AddOrder '06031661  ','0001',' ',38791.5, 'NOVARTIS CONSUMER HEALTH', @OrderID OUTPUT
EXEC dbo.AddOrder '06031662  ','0001',' ',38791.5, 'NOVARTIS CONSUMER HEALTH', @OrderID OUTPUT
EXEC dbo.AddOrder '06031663  ','0001',' ',38791.5, 'NOVARTIS CONSUMER HEALTH', @OrderID OUTPUT
EXEC dbo.AddOrder '06031664  ','0001',' ',38791.5, 'NOVARTIS CONSUMER HEALTH', @OrderID OUTPUT
EXEC dbo.AddOrder '06031665  ','0001',' ',38791.5, 'NOVARTIS CONSUMER HEALTH', @OrderID OUTPUT
EXEC dbo.AddOrder '06031667  ','0001',' ',38797.5, 'MAGIMIX', @OrderID OUTPUT
EXEC dbo.AddOrder '06031670  ','0001',' ',38798.5, 'SAE SERGE CHEVEAU', @OrderID OUTPUT
EXEC dbo.AddOrder '06031672  ','0001',' ',38798.5, 'SAE SERGE CHEVEAU', @OrderID OUTPUT
EXEC dbo.AddOrder '06031674  ','0001',' ',38802.5, 'B.B.A. ERDEM', @OrderID OUTPUT
EXEC dbo.AddOrder '06031675  ','0001',' ',38802.5, 'B.B.A. ERDEM', @OrderID OUTPUT
EXEC dbo.AddOrder '06031678  ','0001',' ',38797.5, 'PEUGEOT CITROEN AUTOMOBI', @OrderID OUTPUT
EXEC dbo.AddOrder '06031679  ','0001',' ',38791.5, 'DS SMITH KAYPAC', @OrderID OUTPUT
EXEC dbo.AddOrder '06031680  ','0001',' ',38801.5, 'PEUGEOT CITROEN AUTOMOBI', @OrderID OUTPUT
EXEC dbo.AddOrder '06031684  ','0002',' ',38789.5, 'GIKO KARTONAGEN GMBH', @OrderID OUTPUT
EXEC dbo.AddOrder '06031685  ','0001',' ',38795.5, 'SARKOS S.A.', @OrderID OUTPUT
EXEC dbo.AddOrder '06031687  ','0001',' ',38797.5, 'DITTE GMBH', @OrderID OUTPUT
EXEC dbo.AddOrder '06031690  ','0001',' ',38789.5, 'RICARD', @OrderID OUTPUT
EXEC dbo.AddOrder '06031691  ','0001',' ',38795.5, 'PETER O. PURSCH', @OrderID OUTPUT
EXEC dbo.AddOrder '06031695  ','0001',' ',38796.5, 'W. WIRTH GMBH', @OrderID OUTPUT
EXEC dbo.AddOrder '06031701  ','0001',' ',38804.5, 'SHARP MANUFACTURING FRAN', @OrderID OUTPUT
EXEC dbo.AddOrder '06031702  ','0001',' ',38801.5, 'B.V.ALVERIMPORT', @OrderID OUTPUT
EXEC dbo.AddOrder '06031704  ','0001',' ',38801.5, 'SCHAEFFLER FRANCE', @OrderID OUTPUT
EXEC dbo.AddOrder '06031707  ','0001',' ',38794.5, 'TIMKEN EUROPE', @OrderID OUTPUT
EXEC dbo.AddOrder '06031708  ','0001',' ',38794.5, 'TIMKEN EUROPE', @OrderID OUTPUT
EXEC dbo.AddOrder '06031709  ','0001',' ',38791.5, 'B.V.ALVERIMPORT', @OrderID OUTPUT
EXEC dbo.AddOrder '06031712  ','0001',' ',38798.5, 'INTERSTUHL BÜROMÖBEL GMB', @OrderID OUTPUT
EXEC dbo.AddOrder '06031715  ','0001',' ',38783.5, 'JTEKT AUTOMOBILE', @OrderID OUTPUT
EXEC dbo.AddOrder '06031717  ','0001',' ',38783.5, 'JTEKT AUTOMOBILE', @OrderID OUTPUT
EXEC dbo.AddOrder '06031718  ','0001',' ',38791.5, 'BAUR VERPACKUNG E.K.', @OrderID OUTPUT
EXEC dbo.AddOrder '06031720  ','0001',' ',38796.5, 'SCHWEITZER S.A.', @OrderID OUTPUT
EXEC dbo.AddOrder '06031721  ','0001',' ',38796.5, 'SCHWEITZER S.A.', @OrderID OUTPUT
EXEC dbo.AddOrder '06031722  ','0001',' ',38796.5, 'SCHWEITZER S.A.', @OrderID OUTPUT
EXEC dbo.AddOrder '06031725  ','0001',' ',38789.5, 'DS SMITH KAYPAC', @OrderID OUTPUT
EXEC dbo.AddOrder '06031727  ','0001',' ',38796.5, 'GUSTAV  SCHRAMM GMBH', @OrderID OUTPUT
EXEC dbo.AddOrder '06031728  ','0001',' ',38790.5, 'GUSTAV  SCHRAMM GMBH', @OrderID OUTPUT
EXEC dbo.AddOrder '06031729  ','0001',' ',38797.5, 'SCHWEITZER S.A.', @OrderID OUTPUT
EXEC dbo.AddOrder '06031730  ','0001',' ',38797.5, 'SCHWEITZER S.A.', @OrderID OUTPUT
EXEC dbo.AddOrder '06031731  ','0001',' ',38797.5, 'SCHWEITZER S.A.', @OrderID OUTPUT
EXEC dbo.AddOrder '06031734  ','0001',' ',38801.5, 'SCHWEITZER S.A.', @OrderID OUTPUT
EXEC dbo.AddOrder '06031735  ','0001',' ',38801.5, 'SCHWEITZER S.A.', @OrderID OUTPUT
EXEC dbo.AddOrder '06031737  ','0001',' ',38802.5, 'SCHWEITZER S.A.', @OrderID OUTPUT
EXEC dbo.AddOrder '06031738  ','0001',' ',38802.5, 'SCHWEITZER S.A.', @OrderID OUTPUT
EXEC dbo.AddOrder '06031741  ','0001',' ',38797.5, 'ECLAIRAGE TECHNIQUE', @OrderID OUTPUT
EXEC dbo.AddOrder '06031743  ','0001',' ',38790.5, 'GEORGIA-PACIFIC FRANCE', @OrderID OUTPUT
EXEC dbo.AddOrder '06031745  ','0001',' ',38794.5, 'GEORGIA-PACIFIC FRANCE', @OrderID OUTPUT
EXEC dbo.AddOrder '06031747  ','0001',' ',38795.5, 'GEORGIA-PACIFIC FRANCE', @OrderID OUTPUT
EXEC dbo.AddOrder '06031749  ','0001',' ',38790.5, 'GEORGIA-PACIFIC FRANCE', @OrderID OUTPUT
EXEC dbo.AddOrder '06031756  ','0001',' ',38794.5, 'MGI COUTIER PLASTIQUE', @OrderID OUTPUT
EXEC dbo.AddOrder '06031761  ','0001',' ',38803.5, 'ZEHNDER GMBH', @OrderID OUTPUT
EXEC dbo.AddOrder '06031762  ','0001',' ',38803.5, 'ZEHNDER GMBH', @OrderID OUTPUT
EXEC dbo.AddOrder '06031764  ','0001',' ',38789.5, 'WELL-PACK AG', @OrderID OUTPUT
EXEC dbo.AddOrder '06031766  ','0001',' ',38794.5, 'CONDI RHONE ALPES', @OrderID OUTPUT
EXEC dbo.AddOrder '06031769  ','0001',' ',38798.5, 'TRISS SPOL.S.R.O.', @OrderID OUTPUT
EXEC dbo.AddOrder '06031772  ','0001',' ',38795.5, 'MEPHISTO', @OrderID OUTPUT
EXEC dbo.AddOrder '06031779  ','0001',' ',38788.5, 'NESTLE WATERS SUPPLY EST', @OrderID OUTPUT
EXEC dbo.AddOrder '06031780  ','0001',' ',38797.5, 'WELL-PACK AG', @OrderID OUTPUT
EXEC dbo.AddOrder '06031781  ','0001',' ',38797.5, 'WELL-PACK AG', @OrderID OUTPUT
EXEC dbo.AddOrder '06031784  ','0001',' ',38846.5, 'WELL-PACK AG', @OrderID OUTPUT
EXEC dbo.AddOrder '06031785  ','0001',' ',38846.5, 'WELL-PACK AG', @OrderID OUTPUT
EXEC dbo.AddOrder '06031787  ','0001',' ',38789.5, 'POLIMASZ SPOLKA JAWNA', @OrderID OUTPUT
EXEC dbo.AddOrder '06031788  ','0001',' ',38802.5, 'PEUGEOT CITROEN AUTOMOBI', @OrderID OUTPUT
EXEC dbo.AddOrder '06031789  ','0001',' ',38794.5, 'SOMFY', @OrderID OUTPUT
EXEC dbo.AddOrder '06031790  ','0001',' ',38794.5, 'SOMFY', @OrderID OUTPUT
EXEC dbo.AddOrder '06031793  ','0001',' ',38797.5, 'GROUPE GYMA', @OrderID OUTPUT
EXEC dbo.AddOrder '06031794  ','0001',' ',38797.5, 'GROUPE GYMA', @OrderID OUTPUT
EXEC dbo.AddOrder '06031795  ','0001',' ',38797.5, 'SAS MB AUTOMOTIVE FVM', @OrderID OUTPUT
EXEC dbo.AddOrder '06031797  ','0001',' ',38802.5, 'LILLY FRANCE S.A.', @OrderID OUTPUT
EXEC dbo.AddOrder '06031801  ','0001',' ',38796.5, 'LILLY FRANCE S.A.', @OrderID OUTPUT
EXEC dbo.AddOrder '06031803  ','0001',' ',38796.5, 'SCHNEIDER GMBH', @OrderID OUTPUT
EXEC dbo.AddOrder '06031806  ','0001',' ',38797.5, 'STE WRIGLEY FRANCE S.N.C', @OrderID OUTPUT
EXEC dbo.AddOrder '06031807  ','0001',' ',38796.5, 'STE WRIGLEY FRANCE S.N.C', @OrderID OUTPUT
EXEC dbo.AddOrder '06031808  ','0001',' ',38797.5, 'STE WRIGLEY FRANCE S.N.C', @OrderID OUTPUT
EXEC dbo.AddOrder '06031810  ','0001',' ',38797.5, 'NESTLE WATERS SUPPLY EST', @OrderID OUTPUT
EXEC dbo.AddOrder '06031812  ','0001',' ',38802.5, 'NESTLE WATERS SUPPLY EST', @OrderID OUTPUT
EXEC dbo.AddOrder '06031814  ','0001',' ',38804.5, 'NESTLE WATERS SUPPLY EST', @OrderID OUTPUT
EXEC dbo.AddOrder '98111722  ','0001',' ',36115.5, 'S.A. PEUGEOT MOTOCYCLES', @OrderID OUTPUT
EXEC dbo.AddOrder '99050229  ','0001',' ',36288.5, 'KODAK INDUSTRIE', @OrderID OUTPUT
EXEC dbo.AddOrder '99050229  ','0001','a',36299.5, 'KODAK INDUSTRIE', @OrderID OUTPUT
EXEC dbo.AddOrder '99050717  ','0001',' ',36306.5, 'BUBENDORFF SA', @OrderID OUTPUT
EXEC dbo.AddOrder '99050718  ','0001',' ',36306.5, 'BUBENDORFF SA', @OrderID OUTPUT
EXEC dbo.AddOrder '99051237  ','0001',' ',36303.5, 'KODAK INDUSTRIE', @OrderID OUTPUT
EXEC dbo.AddOrder '99052275  ','0001',' ',36303.5, 'KODAK INDUSTRIE', @OrderID OUTPUT
EXEC dbo.AddOrder '99052277  ','0001',' ',36303.5, 'KODAK INDUSTRIE', @OrderID OUTPUT
EXEC dbo.AddOrder '99052379  ','0001',' ',36303.5, 'KODAK INDUSTRIE', @OrderID OUTPUT
EXEC dbo.AddOrder '99052464  ','0001',' ',36299.5, 'DU PONT DE NEMOURS S.A.', @OrderID OUTPUT
EXEC dbo.AddOrder '99123378  ','0001',' ',36544.5, 'HOLZWERK RIEDER AG', @OrderID OUTPUT
GO

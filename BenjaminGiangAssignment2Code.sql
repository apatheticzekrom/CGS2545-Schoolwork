create database renovation;

use renovation;

create table contractor(
  ID int(7) NOT NULL AUTO_INCREMENT,
  lastName varchar(50) NOT NULL,
  firstName varchar(50) NOT NULL,
  address varchar(90) NOT NULL,
  zipCode char(5) NOT NULL,
  phone char(10) NOT NULL,
  email varchar(90) NOT NULL UNIQUE,
  PRIMARY KEY (ID)
);

create table client(
  ID int(7) NOT NULL AUTO_INCREMENT,
  lastName varchar(50) NOT NULL,
  firstName varchar(50) NOT NULL,
  address varchar(90) NOT NULL,
  zipCode char(5) NOT NULL,
  phone char(10) NOT NULL,
  email varchar(90) NOT NULL UNIQUE,
  PRIMARY KEY (ID)
);

create table supplier(
  ID int(7) NOT NULL AUTO_INCREMENT,
  supplierName varchar(50) NOT NULL,
  address varchar(90) NOT NULL,
  zipCode char(5) NOT NULL,
  phone char(10) NOT NULL,
  email varchar(90) NOT NULL UNIQUE,
  PRIMARY KEY (ID)
);

insert into contractor (lastName, firstName, address, zipCode, phone, email) values 
("Prince", "Igor", "12 Creekside St", "92647", "2025550109", "iprince@renovations.com");

insert into contractor (lastName, firstName, address, zipCode, phone, email) values 
("Waters", "Thomas", "411 Shirley St", "24210", "2025550115", "twaters@renovations.com"),
("Clarke", "Avaya", "7771 Border Court", "92078", "2025550119", "aclarke@renovations.com"),
("Kaiser", "Haniya", "6 South Sulphur Springs Street", "70121", "2025550121", "hkaiser@renovations.com"),
("Newman", "Victor", "942 New Saddle Drive", "70433", "2025550122", "vnewman@renovations.com"),
("Guthrie", "Douglas", "9 Wrangler Ave", "91764", "2025550124", "dguthrie@renovations.com"),
("Roberts", "Brian", "7319 S. Greenview Drive", "44223", "2025550125", "broberts@renovations.com"),
("Solis", "Paris", "763 West Mulberry St", "49016", "2025550132", "psolis@renovations.com"),
("Heath", "Umaiza", "545 Ohio Ave", "85260", "2025550135", "uheath@renovations.com");


insert into client (lastName, firstName, address, zipCode, phone, email) values 
("Goodman", "Yvonne", "12 Creekside St", "37205", "2025550109", "ygoodman@isp.com"),
("Mackenzie", "Dante", "137 Wall St", "37205", "2025550112", "dmackenzie@isp.com"),
("Rollins", "Alysha", "411 Shirley St", "37205", "2025550115", "arollins@isp.com"),
("Gonzalez", "Avaya", "7771 Border Court", "37205", "2025550119", "agonzalez@isp.com"),
("Kelly", "Haniya", "6 South Sulphur Springs Street", "37205", "2025550121", "hkelly@isp.com"),
("Chambers", "Nathalie", "942 New Saddle Drive", "29710", "2025550122", "nchambers@isp.com"),
("Rollins", "Daniel", "9 Wrangler Ave", "29710", "2025550124", "drollins@isp.com"),
("Mckee", "Beverley", "7319 S. Greenview Drive", "29710", "2025550125", "bmckee@isp.com"),
("Lindsey", "Paris", "763 West Mulberry St", "29710", "2025550132", "plindsey@isp.com"),
("Melia", "Umaiza", "545 Ohio Ave", "29710", "2025550135", "umelia@isp.com"),
("Prince", "Nico", "20 Middle River Street", "44094", "2025550137", "nprince@isp.com"),
("Rennie", "Javan", "8112 North Country St", "44094", "2025550139", "jrennie@isp.com"),
("Waters", "Ali", "83 Rockland Lane", "44094", "2025550144", "awaters@isp.com"),
("Clarke", "JohnPaul", "1 Riverside Lane", "44094", "2025550153", "jpcClarke@isp.com"),
("Kaiser", "Dane", "694 Wall Road", "44094", "2025550155", "kdaiser@isp.com"),
("Newman", "Hammad", "9970 State Court", "30096", "2025550157", "hnewman@isp.com"),
("Guthrie", "Maha", "54 Woodsman Drive", "30096", "2025550161", "mguthrie@isp.com"),
("Roberts", "Tulisa", "7174 Studebaker Street", "30096", "2025550163", "troberts@isp.com"),
("Solis", "Robin", "8474 Wentworth Street", "30096", "2025550164", "rsolis@isp.com"),
("Heath", "Kavita", "796 Hartford St", "30096", "2025550165", "kheath@isp.com"),
("White", "Meera", "484 Bridge St", "08854", "2025550166", "mwhite@isp.com"),
("Esparza", "Bradlee", "7031 Gainsway St", "08854", "2025550173", "besparza@isp.com"),
("Leonard", "Leilani", "37 Monroe Street", "08854", "2025550175", "lleonard@isp.com"),
("Brook", "Stefanie", "7990 West Surrey St", "08854", "2025550179", "sbrook@isp.com"),
("Squires", "Grover", "7618 Madison Court", "08854", "2025550180", "gsquires@isp.com"),
("Kumar", "Jonathan", "25 Annadale Court", "33458", "2025550182", "jkumar@isp.com"),
("Neville", "Angus", "9841 Smith Drive", "33458", "2025550187", "aneville@isp.com"),
("Sparrow", "Uzair", "7999 Hall Street", "33458", "2025550188", "usparrow@isp.com"),
("Currie", "Amari", "8411 Pleasant St", "33458", "2025550194", "acurrie@isp.com"),
("Wallace", "Imaani", "33 Pierce Rd", "33458", "2025550195", "iwallace@isp.com"),
("House", "Efe", "97 High Point Street", "20706", "2025550196", "ehouse@isp.com"),
("Atkinson", "Atticus", "66 Harrison Dr", "20706", "2025550197", "aatkinson@isp.com"),
("Ramirez", "Michelle", "370 Hill Field Ave", "20706", "2025550198", "mramirez@isp.com"),
("Hassan", "Remy", "249 Devon Lane", "20706", "2025550199", "rhassan@isp.com"),
("Beck", "Jordana", "7911 Carson Lane", "20706", "2025550200", "jbeck@isp.com");


insert into supplier (supplierName, address, zipCode, phone, email) values 
("New Direction Granite", "16321 Gothard St. Suite C-F", "92647", "5626068511", "info@new-direction-granite.com"), 
("Monogram Tile", "530 Oak Court Drive Suite 400", "38117", "9016857167", "info@monogram-tile.com"),  
("Glass Specialties Inc", "1231 Linda Vista Drive", "92078", "7607448220", "info@glass-specialties.com"),  
("Dutt and Wagner Mirrors", "1142 West Main Street", "24210", "8006882116", "info@dutt-wagner-mirrors.com"),  
("John E. Koerner Fixtures", "4820 Jefferson Hwy", "70121", "8003331913", "info@koerner-fixtures.com"),  
("Diversified Paint and Supplies LLC", "1404 Greengate Drive Suite 300", "70433", "8009142382", "info@diversified-paint.com"), 
("Ajinomoto Quartz North America", "4200 Concours Street Suite 100", "91764", "9094774700", "info@ajinomoto-quartz-na.com"), 
("Ascot Valley Sinks and Tubs", "205 Ascot Pkwy", "44223", "3303769411", "info@ascotvalleysinks.com"), 
("Kellogg Shower Inserts", "P.O. Box CAMB", "49016", "8009621413", "info@kelloggs.com");
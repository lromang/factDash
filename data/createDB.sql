/* ---------------------------------------------
 * This code creates all the tables in the
 * database.
 * ---------------------------------------------
 */

/*
 * BANKS
 */
DROP TABLE IF EXISTS banks CASCADE;
CREATE TABLE banks (idBank int, name varchar(100), commercial_name varchar(200), status boolean, code varchar(3));
\copy banks from '/home/luis/Documents/me/factu/data/clean_data/clean_banks.csv' delimiter ',' CSV;


/*
 * CLIENTS
 */
DROP TABLE IF EXISTS clients CASCADE;
CREATE TABLE clients (
        idClient int,  idTaxEntity int, name varchar(250), taxName varchar(250), rfc varchar(100),
        taxStreet varchar(100), taxStreetNumber varchar(100), taxIntNumber varchar(100), taxNeighborhood varchar(150), taxLocation varchar(150),
        taxCity varchar(100),   taxMunicipality varchar(100), taxState varchar(100), taxCountry varchar(50),
        taxZipCode varchar(10), comercialStreet varchar(150), comercialStreetNumber varchar(100), comercialIntNumber varchar(100),
        comercialNeighborhood varchar(100), commercialCity varchar(100), commercialMunicipality varchar(100),
        commercialState varchar(100), commercialCountry varchar(50), commercialZipCode varchar(10), email varchar(100),
        website varchar(500),  tags varchar(50), businessLine varchar(50), sector varchar(50), isActive boolean,
        isNaturalPerson boolean, contPaqAccount varchar(100));
\copy clients from '/home/luis/Documents/me/factu/data/clean_data/clean_clients.csv' delimiter ',' CSV;


/*
 * TAX ENTITIES
 */
DROP TABLE IF EXISTS taxentities CASCADE;
CREATE TABLE taxentities (
        idTaxEntity int, idTaxEntityInVoiceType varchar(100), taxName varchar(250), rfc varchar(100),
        street varchar(100), streetNumber varchar(100), intNumber varchar(100), neighborhood varchar(150), city varchar(150), location varchar(150),
        municipality varchar(100), state varchar(100), country varchar(50), zipCode varchar(10),
        comercialName varchar(150), email varchar(100), website varchar(500),  logo varchar(100),
        digitalCertificate varchar(500), privateKey varchar(150), privateKeyPassword varchar(250), tags varchar(150), businessLine varchar(150),
        sector varchar(100), fiscalRegimen varchar(200), creationDate date, modificationDate date, contactName varchar(150), contactPhone varchar(20),
        contactMail varchar(100), contactCharge varchar(50), observations varchar(200), regServisim varchar(200), facturamaVersion int,
        isNaturalPerson boolean, passwordSat varchar(20), idConekta varchar(30), idOpenPayClient varchar(20), newInvoices varchar(50), lastRecoveryXML varchar(50),
        authorizeRecovery boolean, digitalFiel varchar(100), privateKeyFiel varchar(150), privateKeyPass varchar(200), landing varchar(50),
        isAccount boolean, authorizeAccount varchar(150), showWizardRecovery varchar(200), annualSales money, annualExpenses money);
\copy taxentities from '/home/luis/Documents/me/factu/data/clean_data/clean_taxentities.csv' delimiter ',' CSV;

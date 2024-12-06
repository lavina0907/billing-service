USE keycloak;
-- MySQL dump 10.13  Distrib 8.0.34, for Linux (aarch64)
--
-- Host: localhost    Database: keycloak
-- ------------------------------------------------------
-- Server version	8.0.34

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `ADMIN_EVENT_ENTITY`
--

DROP TABLE IF EXISTS `ADMIN_EVENT_ENTITY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ADMIN_EVENT_ENTITY` (
  `ID` varchar(36) NOT NULL,
  `ADMIN_EVENT_TIME` bigint DEFAULT NULL,
  `REALM_ID` varchar(255) DEFAULT NULL,
  `OPERATION_TYPE` varchar(255) DEFAULT NULL,
  `AUTH_REALM_ID` varchar(255) DEFAULT NULL,
  `AUTH_CLIENT_ID` varchar(255) DEFAULT NULL,
  `AUTH_USER_ID` varchar(255) DEFAULT NULL,
  `IP_ADDRESS` varchar(255) DEFAULT NULL,
  `RESOURCE_PATH` text,
  `REPRESENTATION` text,
  `ERROR` varchar(255) DEFAULT NULL,
  `RESOURCE_TYPE` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_ADMIN_EVENT_TIME` (`REALM_ID`,`ADMIN_EVENT_TIME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ADMIN_EVENT_ENTITY`
--

LOCK TABLES `ADMIN_EVENT_ENTITY` WRITE;
/*!40000 ALTER TABLE `ADMIN_EVENT_ENTITY` DISABLE KEYS */;
/*!40000 ALTER TABLE `ADMIN_EVENT_ENTITY` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ASSOCIATED_POLICY`
--

DROP TABLE IF EXISTS `ASSOCIATED_POLICY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ASSOCIATED_POLICY` (
  `POLICY_ID` varchar(36) NOT NULL,
  `ASSOCIATED_POLICY_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`POLICY_ID`,`ASSOCIATED_POLICY_ID`),
  KEY `IDX_ASSOC_POL_ASSOC_POL_ID` (`ASSOCIATED_POLICY_ID`),
  CONSTRAINT `FK_FRSR5S213XCX4WNKOG82SSRFY` FOREIGN KEY (`ASSOCIATED_POLICY_ID`) REFERENCES `RESOURCE_SERVER_POLICY` (`ID`),
  CONSTRAINT `FK_FRSRPAS14XCX4WNKOG82SSRFY` FOREIGN KEY (`POLICY_ID`) REFERENCES `RESOURCE_SERVER_POLICY` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ASSOCIATED_POLICY`
--

LOCK TABLES `ASSOCIATED_POLICY` WRITE;
/*!40000 ALTER TABLE `ASSOCIATED_POLICY` DISABLE KEYS */;
INSERT INTO `ASSOCIATED_POLICY` VALUES ('308b4cde-d7aa-4957-977e-dfc3ea070622','747bb0ad-7114-46cc-9373-cdaff55e0c32');
/*!40000 ALTER TABLE `ASSOCIATED_POLICY` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AUTHENTICATION_EXECUTION`
--

DROP TABLE IF EXISTS `AUTHENTICATION_EXECUTION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `AUTHENTICATION_EXECUTION` (
  `ID` varchar(36) NOT NULL,
  `ALIAS` varchar(255) DEFAULT NULL,
  `AUTHENTICATOR` varchar(36) DEFAULT NULL,
  `REALM_ID` varchar(36) DEFAULT NULL,
  `FLOW_ID` varchar(36) DEFAULT NULL,
  `REQUIREMENT` int DEFAULT NULL,
  `PRIORITY` int DEFAULT NULL,
  `AUTHENTICATOR_FLOW` bit(1) NOT NULL DEFAULT b'0',
  `AUTH_FLOW_ID` varchar(36) DEFAULT NULL,
  `AUTH_CONFIG` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_AUTH_EXEC_REALM_FLOW` (`REALM_ID`,`FLOW_ID`),
  KEY `IDX_AUTH_EXEC_FLOW` (`FLOW_ID`),
  CONSTRAINT `FK_AUTH_EXEC_FLOW` FOREIGN KEY (`FLOW_ID`) REFERENCES `AUTHENTICATION_FLOW` (`ID`),
  CONSTRAINT `FK_AUTH_EXEC_REALM` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AUTHENTICATION_EXECUTION`
--

LOCK TABLES `AUTHENTICATION_EXECUTION` WRITE;
/*!40000 ALTER TABLE `AUTHENTICATION_EXECUTION` DISABLE KEYS */;
INSERT INTO `AUTHENTICATION_EXECUTION` VALUES ('037056b0-f092-450d-b09f-480cf1aab189',NULL,'conditional-user-configured','c0270858-075b-431d-93d7-153e3204d46f','386758f0-57b6-4910-ba21-2cfbfce72272',0,10,_binary '\0',NULL,NULL),('076a9dcf-8431-4e09-b22f-b67a2143f6fc',NULL,'auth-spnego','60416dc2-4603-4f6b-b014-b0b0fbe038ce','537ee000-5b2f-4487-9e41-bc97c59edff9',3,20,_binary '\0',NULL,NULL),('09e09648-b326-4bc1-ba18-f419cbccbab3',NULL,NULL,'60416dc2-4603-4f6b-b014-b0b0fbe038ce','a71807c1-a02b-4ab1-89b3-489543522e39',0,20,_binary '','65ed1d31-5ba3-4a5f-920c-3f073a4ec9cd',NULL),('0cc161be-4944-478f-b5fe-b53594709eb6',NULL,'registration-user-creation','c0270858-075b-431d-93d7-153e3204d46f','0c4b3c93-8459-413b-b9a4-a1ef39e772a7',0,20,_binary '\0',NULL,NULL),('1231d32a-8b05-440f-b1cf-99626ddec7c8',NULL,'client-secret-jwt','c0270858-075b-431d-93d7-153e3204d46f','0563fed8-ce41-4f93-89a8-54b4dddb0dde',2,30,_binary '\0',NULL,NULL),('12a2afe3-0765-42f9-ba90-d062a6c42926',NULL,NULL,'c0270858-075b-431d-93d7-153e3204d46f','f1856911-4861-453e-801b-d8b76f0f51e5',1,30,_binary '','dfbde065-bd49-46c1-bead-72116f1ef191',NULL),('12d5eef8-55fc-4f01-90cb-ac43faaf5ffa',NULL,'reset-credential-email','c0270858-075b-431d-93d7-153e3204d46f','06f94101-c574-446b-ada9-05b2bdc97a59',0,20,_binary '\0',NULL,NULL),('15bcf12c-4990-4b1a-8ed6-8fd91688a0d5',NULL,'auth-otp-form','c0270858-075b-431d-93d7-153e3204d46f','7090871c-ca2d-4caf-9fde-cf509ac14a7e',0,20,_binary '\0',NULL,NULL),('19a6f1ca-d6d5-4fb1-b2fa-5092c982d604',NULL,'registration-page-form','c0270858-075b-431d-93d7-153e3204d46f','6ae7a261-a41a-4c44-a8bb-43e8b0341db8',0,10,_binary '','0c4b3c93-8459-413b-b9a4-a1ef39e772a7',NULL),('1bb41bb6-7fa7-4e9a-8009-12319109799e',NULL,'idp-review-profile','60416dc2-4603-4f6b-b014-b0b0fbe038ce','f530c802-3351-4968-b3c7-e383037320a0',0,10,_binary '\0',NULL,'3a88ae0b-8a6f-4c70-838c-035f2ddb5749'),('1bda373c-2d8c-497f-b3f9-03658c9fb605',NULL,'conditional-user-configured','60416dc2-4603-4f6b-b014-b0b0fbe038ce','c3518fe4-e5ad-4f1d-b96e-a4a26dd7bd5b',0,10,_binary '\0',NULL,NULL),('1e27054f-4e94-40aa-afb3-f290e75d550e',NULL,'registration-password-action','c0270858-075b-431d-93d7-153e3204d46f','0c4b3c93-8459-413b-b9a4-a1ef39e772a7',0,50,_binary '\0',NULL,NULL),('1f4a3119-491d-4782-9676-84069303b974',NULL,'reset-password','60416dc2-4603-4f6b-b014-b0b0fbe038ce','559d426f-eb90-47fa-8a30-63fbe8dee0aa',0,30,_binary '\0',NULL,NULL),('23ea6be3-18ae-4629-aa82-c4cffc39758c',NULL,NULL,'60416dc2-4603-4f6b-b014-b0b0fbe038ce','9f068558-ca0e-4474-8f84-6d1c64ddafbe',1,20,_binary '','7ccb70ac-5e1c-4a41-8c43-d9879fda5c39',NULL),('265fa2b6-65c7-4f21-b132-c9eec7a244b9',NULL,'registration-password-action','60416dc2-4603-4f6b-b014-b0b0fbe038ce','f518dfcb-bea8-4c5c-afe4-8b1fbf7800f8',0,50,_binary '\0',NULL,NULL),('32fdf5e2-e104-4158-aeaf-ebe49fbbe35b',NULL,'reset-password','c0270858-075b-431d-93d7-153e3204d46f','06f94101-c574-446b-ada9-05b2bdc97a59',0,30,_binary '\0',NULL,NULL),('341e0b0c-dbc1-41d2-bab0-9728e960f525',NULL,'registration-user-creation','60416dc2-4603-4f6b-b014-b0b0fbe038ce','f518dfcb-bea8-4c5c-afe4-8b1fbf7800f8',0,20,_binary '\0',NULL,NULL),('3494848e-3cd0-4567-83cb-70845c748682',NULL,'client-x509','c0270858-075b-431d-93d7-153e3204d46f','0563fed8-ce41-4f93-89a8-54b4dddb0dde',2,40,_binary '\0',NULL,NULL),('34e59e9f-250f-4164-bcf9-4e772c81ca26',NULL,'idp-create-user-if-unique','c0270858-075b-431d-93d7-153e3204d46f','9a0d2be5-00aa-4243-b913-f217b0264935',2,10,_binary '\0',NULL,'f02610b6-7e0e-4fe6-aa1f-16121726151c'),('399b3036-b255-4153-92b7-e252c68f8d38',NULL,NULL,'60416dc2-4603-4f6b-b014-b0b0fbe038ce','65ed1d31-5ba3-4a5f-920c-3f073a4ec9cd',2,20,_binary '','9f068558-ca0e-4474-8f84-6d1c64ddafbe',NULL),('3aee55a2-e24e-454d-8cdd-c25f0b9018c3',NULL,'auth-otp-form','c0270858-075b-431d-93d7-153e3204d46f','386758f0-57b6-4910-ba21-2cfbfce72272',0,20,_binary '\0',NULL,NULL),('3c98936a-dcf6-464f-af56-30029124eafa',NULL,'reset-otp','c0270858-075b-431d-93d7-153e3204d46f','b942c612-d407-4130-9c54-bf9cdf703703',0,20,_binary '\0',NULL,NULL),('42496ae7-7ba7-45ac-a714-f328de4ab613',NULL,'http-basic-authenticator','c0270858-075b-431d-93d7-153e3204d46f','461127ee-7dce-4eeb-878f-1e06c3f406aa',0,10,_binary '\0',NULL,NULL),('4905c5b3-a9f1-4473-8961-2794150f307b',NULL,'client-x509','60416dc2-4603-4f6b-b014-b0b0fbe038ce','c9d80974-87cb-4dba-b26d-0027b4950872',2,40,_binary '\0',NULL,NULL),('4b913bdf-07c6-4193-a4b3-7b6ec715e49e',NULL,'auth-otp-form','60416dc2-4603-4f6b-b014-b0b0fbe038ce','de12a62f-ac31-43d7-a8b4-0e5c24420d15',0,20,_binary '\0',NULL,NULL),('4bfb08f2-d36e-4e53-913d-132bd1964ab4',NULL,'reset-otp','60416dc2-4603-4f6b-b014-b0b0fbe038ce','af7d5e43-9a48-4d41-96cd-7348b04a2a2b',0,20,_binary '\0',NULL,NULL),('4f04f4d6-c98c-4387-a9f1-631d08e34def',NULL,NULL,'c0270858-075b-431d-93d7-153e3204d46f','fcd66a59-471e-43b4-b537-9b7318ac606a',2,20,_binary '','9b53da1e-fd3d-4e5b-a03d-43fe15758c90',NULL),('4f28edd8-c99a-478b-aa0c-59eac6fd77f2',NULL,'docker-http-basic-authenticator','60416dc2-4603-4f6b-b014-b0b0fbe038ce','f5137e14-2857-49c9-a397-85bff02b4bd1',0,10,_binary '\0',NULL,NULL),('4fe12a23-c9cb-49c2-8ef3-d34ffb63669d',NULL,'idp-email-verification','60416dc2-4603-4f6b-b014-b0b0fbe038ce','65ed1d31-5ba3-4a5f-920c-3f073a4ec9cd',2,10,_binary '\0',NULL,NULL),('5737404f-2d61-4be8-bbf8-32b0f078e4bb',NULL,NULL,'c0270858-075b-431d-93d7-153e3204d46f','06f94101-c574-446b-ada9-05b2bdc97a59',1,40,_binary '','b942c612-d407-4130-9c54-bf9cdf703703',NULL),('5754b69b-6db9-4add-b6f1-f258514f306d',NULL,NULL,'60416dc2-4603-4f6b-b014-b0b0fbe038ce','8614f220-38b0-45b3-a45c-ec31bb0560d0',1,20,_binary '','de12a62f-ac31-43d7-a8b4-0e5c24420d15',NULL),('5ba9bc44-5a47-42b8-955b-1439b89ebbd9',NULL,NULL,'c0270858-075b-431d-93d7-153e3204d46f','9b53da1e-fd3d-4e5b-a03d-43fe15758c90',1,20,_binary '','386758f0-57b6-4910-ba21-2cfbfce72272',NULL),('614bea35-6825-49dd-84ed-140a6818ce6f',NULL,NULL,'c0270858-075b-431d-93d7-153e3204d46f','96e0d184-28bc-4a63-b98f-77de45c9c110',0,20,_binary '','fcd66a59-471e-43b4-b537-9b7318ac606a',NULL),('63beaff2-32fe-48ea-b4c2-4ffee73bca10',NULL,'conditional-user-configured','c0270858-075b-431d-93d7-153e3204d46f','dfbde065-bd49-46c1-bead-72116f1ef191',0,10,_binary '\0',NULL,NULL),('65d480ea-cee2-4e86-96ae-d1abd3a63439',NULL,NULL,'60416dc2-4603-4f6b-b014-b0b0fbe038ce','9d1a7a55-b667-4961-8269-51fe6f685459',1,30,_binary '','c3518fe4-e5ad-4f1d-b96e-a4a26dd7bd5b',NULL),('672fb162-baf9-4595-b64e-1fbe00abcd30',NULL,'client-secret','c0270858-075b-431d-93d7-153e3204d46f','0563fed8-ce41-4f93-89a8-54b4dddb0dde',2,10,_binary '\0',NULL,NULL),('706ee63d-abdd-47ef-b75d-40ce05c932ff',NULL,'idp-create-user-if-unique','60416dc2-4603-4f6b-b014-b0b0fbe038ce','cd8ac35f-4ed2-4b7d-8807-0a880358cab5',2,10,_binary '\0',NULL,'cb87fddc-a1b3-48c8-b0df-e5f6003bd7e6'),('70cdb11e-bfad-4586-a7ee-377ef27a1c01',NULL,NULL,'c0270858-075b-431d-93d7-153e3204d46f','8da609db-959a-40bb-a149-143389326cc5',1,20,_binary '','7090871c-ca2d-4caf-9fde-cf509ac14a7e',NULL),('73cb6a2f-0f5e-447e-b546-44cfce6ea8e7',NULL,'auth-cookie','c0270858-075b-431d-93d7-153e3204d46f','5462ded3-3d36-41d9-959b-b2ddc1606aec',2,10,_binary '\0',NULL,NULL),('75e08bcc-8746-47c3-b471-dd08be1038f5',NULL,'idp-username-password-form','c0270858-075b-431d-93d7-153e3204d46f','9b53da1e-fd3d-4e5b-a03d-43fe15758c90',0,10,_binary '\0',NULL,NULL),('7f5ba49d-ad0a-449a-ac74-a6854267f0b3',NULL,'conditional-user-configured','c0270858-075b-431d-93d7-153e3204d46f','7090871c-ca2d-4caf-9fde-cf509ac14a7e',0,10,_binary '\0',NULL,NULL),('86897ddd-9155-4e5e-bd2f-253b4ecccd66',NULL,'client-jwt','60416dc2-4603-4f6b-b014-b0b0fbe038ce','c9d80974-87cb-4dba-b26d-0027b4950872',2,20,_binary '\0',NULL,NULL),('878bf4cb-23e3-4645-9795-6dadd11df1e0',NULL,'identity-provider-redirector','c0270858-075b-431d-93d7-153e3204d46f','5462ded3-3d36-41d9-959b-b2ddc1606aec',2,25,_binary '\0',NULL,NULL),('88f50c75-b7f5-4eaf-8bb1-3dc606cce65e',NULL,'auth-username-password-form','60416dc2-4603-4f6b-b014-b0b0fbe038ce','8614f220-38b0-45b3-a45c-ec31bb0560d0',0,10,_binary '\0',NULL,NULL),('8a2bb0db-94a2-4cb8-874a-010c325604ed',NULL,'auth-spnego','c0270858-075b-431d-93d7-153e3204d46f','5462ded3-3d36-41d9-959b-b2ddc1606aec',3,20,_binary '\0',NULL,NULL),('8aeb51f3-e702-41c1-b169-10678fc8b2d3',NULL,'conditional-user-configured','c0270858-075b-431d-93d7-153e3204d46f','b942c612-d407-4130-9c54-bf9cdf703703',0,10,_binary '\0',NULL,NULL),('8c75fa64-82e5-4f21-b234-67ec3ded3c7e',NULL,'reset-credentials-choose-user','60416dc2-4603-4f6b-b014-b0b0fbe038ce','559d426f-eb90-47fa-8a30-63fbe8dee0aa',0,10,_binary '\0',NULL,NULL),('92c93867-9379-4480-988c-3c7f40a12bf5',NULL,'client-secret-jwt','60416dc2-4603-4f6b-b014-b0b0fbe038ce','c9d80974-87cb-4dba-b26d-0027b4950872',2,30,_binary '\0',NULL,NULL),('94078c94-31e9-42dd-a8f1-f5a2be55ab5c',NULL,NULL,'60416dc2-4603-4f6b-b014-b0b0fbe038ce','f530c802-3351-4968-b3c7-e383037320a0',0,20,_binary '','cd8ac35f-4ed2-4b7d-8807-0a880358cab5',NULL),('955ba117-ce17-42a7-845a-66c888b0e227',NULL,NULL,'c0270858-075b-431d-93d7-153e3204d46f','5462ded3-3d36-41d9-959b-b2ddc1606aec',2,30,_binary '','8da609db-959a-40bb-a149-143389326cc5',NULL),('99843d37-a410-4848-a5b5-33205d31246d',NULL,'idp-confirm-link','60416dc2-4603-4f6b-b014-b0b0fbe038ce','a71807c1-a02b-4ab1-89b3-489543522e39',0,10,_binary '\0',NULL,NULL),('99d36233-3ce3-494d-96f9-11e5f809c8b4',NULL,'reset-credentials-choose-user','c0270858-075b-431d-93d7-153e3204d46f','06f94101-c574-446b-ada9-05b2bdc97a59',0,10,_binary '\0',NULL,NULL),('9a42a097-63cb-47f2-bd0b-41a582d7baee',NULL,NULL,'60416dc2-4603-4f6b-b014-b0b0fbe038ce','cd8ac35f-4ed2-4b7d-8807-0a880358cab5',2,20,_binary '','a71807c1-a02b-4ab1-89b3-489543522e39',NULL),('9c355117-727a-43e5-8ca0-dad01ad1619a',NULL,'registration-page-form','60416dc2-4603-4f6b-b014-b0b0fbe038ce','578b58b9-e7c9-4683-9bf4-7622464bbf3c',0,10,_binary '','f518dfcb-bea8-4c5c-afe4-8b1fbf7800f8',NULL),('9da3ac37-5df8-4a81-9b16-8cb5cf39cc25',NULL,'conditional-user-configured','60416dc2-4603-4f6b-b014-b0b0fbe038ce','7ccb70ac-5e1c-4a41-8c43-d9879fda5c39',0,10,_binary '\0',NULL,NULL),('a54511b1-fd67-41c8-9954-603733464fb6',NULL,'direct-grant-validate-password','60416dc2-4603-4f6b-b014-b0b0fbe038ce','9d1a7a55-b667-4961-8269-51fe6f685459',0,20,_binary '\0',NULL,NULL),('a7174db2-30ba-4e10-a5c5-976e36a59212',NULL,NULL,'c0270858-075b-431d-93d7-153e3204d46f','a99c0497-c70b-493e-90cc-78ac61fb4237',0,20,_binary '','9a0d2be5-00aa-4243-b913-f217b0264935',NULL),('aab0a446-b137-4f52-bb14-80fa66fb2c06',NULL,'direct-grant-validate-username','c0270858-075b-431d-93d7-153e3204d46f','f1856911-4861-453e-801b-d8b76f0f51e5',0,10,_binary '\0',NULL,NULL),('ae4b8683-5cd6-4941-8f9d-4a41c784dd38',NULL,'direct-grant-validate-password','c0270858-075b-431d-93d7-153e3204d46f','f1856911-4861-453e-801b-d8b76f0f51e5',0,20,_binary '\0',NULL,NULL),('aec01e10-3fa3-40df-bae7-be2daccbd9dc',NULL,NULL,'60416dc2-4603-4f6b-b014-b0b0fbe038ce','537ee000-5b2f-4487-9e41-bc97c59edff9',2,30,_binary '','8614f220-38b0-45b3-a45c-ec31bb0560d0',NULL),('b70f3826-3313-46c3-adc0-5746a630552c',NULL,'idp-username-password-form','60416dc2-4603-4f6b-b014-b0b0fbe038ce','9f068558-ca0e-4474-8f84-6d1c64ddafbe',0,10,_binary '\0',NULL,NULL),('bb08e185-ec2b-43a6-bbdb-a93d0519d7cf',NULL,'direct-grant-validate-username','60416dc2-4603-4f6b-b014-b0b0fbe038ce','9d1a7a55-b667-4961-8269-51fe6f685459',0,10,_binary '\0',NULL,NULL),('be765fd8-a668-48a4-9834-778a16eff146',NULL,'registration-profile-action','60416dc2-4603-4f6b-b014-b0b0fbe038ce','f518dfcb-bea8-4c5c-afe4-8b1fbf7800f8',0,40,_binary '\0',NULL,NULL),('be8f9010-0baa-481b-a434-30ddf782560b',NULL,NULL,'60416dc2-4603-4f6b-b014-b0b0fbe038ce','559d426f-eb90-47fa-8a30-63fbe8dee0aa',1,40,_binary '','af7d5e43-9a48-4d41-96cd-7348b04a2a2b',NULL),('bf061e58-7a11-4dfe-a384-9dbd4edbbc2a',NULL,'registration-profile-action','c0270858-075b-431d-93d7-153e3204d46f','0c4b3c93-8459-413b-b9a4-a1ef39e772a7',0,40,_binary '\0',NULL,NULL),('c0f1e79f-7aef-497d-93f6-8f1ef725558d',NULL,'reset-credential-email','60416dc2-4603-4f6b-b014-b0b0fbe038ce','559d426f-eb90-47fa-8a30-63fbe8dee0aa',0,20,_binary '\0',NULL,NULL),('c23c5bca-7e48-4ccf-8e6f-233c16b43068',NULL,'idp-email-verification','c0270858-075b-431d-93d7-153e3204d46f','fcd66a59-471e-43b4-b537-9b7318ac606a',2,10,_binary '\0',NULL,NULL),('c3f9b45d-64f4-4aa5-8c68-cf4803c55343',NULL,'conditional-user-configured','60416dc2-4603-4f6b-b014-b0b0fbe038ce','de12a62f-ac31-43d7-a8b4-0e5c24420d15',0,10,_binary '\0',NULL,NULL),('c84e01f2-ed0e-4d6b-bbff-e71f7cdc7b2f',NULL,'registration-recaptcha-action','c0270858-075b-431d-93d7-153e3204d46f','0c4b3c93-8459-413b-b9a4-a1ef39e772a7',3,60,_binary '\0',NULL,NULL),('cbab4cf7-7340-42c1-8084-d2d1c442040b',NULL,'client-secret','60416dc2-4603-4f6b-b014-b0b0fbe038ce','c9d80974-87cb-4dba-b26d-0027b4950872',2,10,_binary '\0',NULL,NULL),('cf30df7b-a958-4e48-a617-9d4a6fedeed0',NULL,'auth-username-password-form','c0270858-075b-431d-93d7-153e3204d46f','8da609db-959a-40bb-a149-143389326cc5',0,10,_binary '\0',NULL,NULL),('d4b87a2e-fd35-4196-8393-f8209c69a11f',NULL,'registration-terms-and-conditions','60416dc2-4603-4f6b-b014-b0b0fbe038ce','f518dfcb-bea8-4c5c-afe4-8b1fbf7800f8',3,70,_binary '\0',NULL,NULL),('d57f76e5-173f-4666-9b3b-0961e088fcd1',NULL,'direct-grant-validate-otp','60416dc2-4603-4f6b-b014-b0b0fbe038ce','c3518fe4-e5ad-4f1d-b96e-a4a26dd7bd5b',0,20,_binary '\0',NULL,NULL),('d58ffdb1-8ddc-4537-af1b-32bb8464f331',NULL,'docker-http-basic-authenticator','c0270858-075b-431d-93d7-153e3204d46f','b89a8a4b-6a49-4d21-91e8-e5aaa7b56615',0,10,_binary '\0',NULL,NULL),('d6c5a461-9ffa-48c6-a932-4203ebad8eb5',NULL,'http-basic-authenticator','60416dc2-4603-4f6b-b014-b0b0fbe038ce','0651944e-2c80-47ac-9c16-916564be10b5',0,10,_binary '\0',NULL,NULL),('dbdac6c4-5dc2-464f-9b73-fc174fe02d2a',NULL,'auth-otp-form','60416dc2-4603-4f6b-b014-b0b0fbe038ce','7ccb70ac-5e1c-4a41-8c43-d9879fda5c39',0,20,_binary '\0',NULL,NULL),('df3c7cc0-23ab-4b25-90c3-8a08ec3eabb8',NULL,'conditional-user-configured','60416dc2-4603-4f6b-b014-b0b0fbe038ce','af7d5e43-9a48-4d41-96cd-7348b04a2a2b',0,10,_binary '\0',NULL,NULL),('dfce0ac6-0661-43f4-861a-e870aa814376',NULL,'auth-cookie','60416dc2-4603-4f6b-b014-b0b0fbe038ce','537ee000-5b2f-4487-9e41-bc97c59edff9',2,10,_binary '\0',NULL,NULL),('e39d10a5-aa20-4ffb-a1c2-16ffa5036b62',NULL,NULL,'c0270858-075b-431d-93d7-153e3204d46f','9a0d2be5-00aa-4243-b913-f217b0264935',2,20,_binary '','96e0d184-28bc-4a63-b98f-77de45c9c110',NULL),('e5cd3bca-d6a6-4373-b742-7008f8df1dc6',NULL,'direct-grant-validate-otp','c0270858-075b-431d-93d7-153e3204d46f','dfbde065-bd49-46c1-bead-72116f1ef191',0,20,_binary '\0',NULL,NULL),('ea18f9f5-3b47-4832-b0b3-f66e2af18273',NULL,'idp-confirm-link','c0270858-075b-431d-93d7-153e3204d46f','96e0d184-28bc-4a63-b98f-77de45c9c110',0,10,_binary '\0',NULL,NULL),('f2d11126-61f3-4d4e-8245-1559c0263d28',NULL,'client-jwt','c0270858-075b-431d-93d7-153e3204d46f','0563fed8-ce41-4f93-89a8-54b4dddb0dde',2,20,_binary '\0',NULL,NULL),('f338a0f6-825b-4a7f-8f74-c7565037a13c',NULL,'idp-review-profile','c0270858-075b-431d-93d7-153e3204d46f','a99c0497-c70b-493e-90cc-78ac61fb4237',0,10,_binary '\0',NULL,'81f8cd92-f943-4087-8014-f71d1eea119b'),('f5e4defd-ab12-478e-92d4-d4cd2ae4b60e',NULL,'registration-recaptcha-action','60416dc2-4603-4f6b-b014-b0b0fbe038ce','f518dfcb-bea8-4c5c-afe4-8b1fbf7800f8',3,60,_binary '\0',NULL,NULL),('fa7c2d2b-80a0-4823-b4cc-937e85b22b99',NULL,'identity-provider-redirector','60416dc2-4603-4f6b-b014-b0b0fbe038ce','537ee000-5b2f-4487-9e41-bc97c59edff9',2,25,_binary '\0',NULL,NULL);
/*!40000 ALTER TABLE `AUTHENTICATION_EXECUTION` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AUTHENTICATION_FLOW`
--

DROP TABLE IF EXISTS `AUTHENTICATION_FLOW`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `AUTHENTICATION_FLOW` (
  `ID` varchar(36) NOT NULL,
  `ALIAS` varchar(255) DEFAULT NULL,
  `DESCRIPTION` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `REALM_ID` varchar(36) DEFAULT NULL,
  `PROVIDER_ID` varchar(36) NOT NULL DEFAULT 'basic-flow',
  `TOP_LEVEL` bit(1) NOT NULL DEFAULT b'0',
  `BUILT_IN` bit(1) NOT NULL DEFAULT b'0',
  PRIMARY KEY (`ID`),
  KEY `IDX_AUTH_FLOW_REALM` (`REALM_ID`),
  CONSTRAINT `FK_AUTH_FLOW_REALM` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AUTHENTICATION_FLOW`
--

LOCK TABLES `AUTHENTICATION_FLOW` WRITE;
/*!40000 ALTER TABLE `AUTHENTICATION_FLOW` DISABLE KEYS */;
INSERT INTO `AUTHENTICATION_FLOW` VALUES ('0563fed8-ce41-4f93-89a8-54b4dddb0dde','clients','Base authentication for clients','c0270858-075b-431d-93d7-153e3204d46f','client-flow',_binary '',_binary ''),('0651944e-2c80-47ac-9c16-916564be10b5','saml ecp','SAML ECP Profile Authentication Flow','60416dc2-4603-4f6b-b014-b0b0fbe038ce','basic-flow',_binary '',_binary ''),('06f94101-c574-446b-ada9-05b2bdc97a59','reset credentials','Reset credentials for a user if they forgot their password or something','c0270858-075b-431d-93d7-153e3204d46f','basic-flow',_binary '',_binary ''),('0c4b3c93-8459-413b-b9a4-a1ef39e772a7','registration form','registration form','c0270858-075b-431d-93d7-153e3204d46f','form-flow',_binary '\0',_binary ''),('386758f0-57b6-4910-ba21-2cfbfce72272','First broker login - Conditional OTP','Flow to determine if the OTP is required for the authentication','c0270858-075b-431d-93d7-153e3204d46f','basic-flow',_binary '\0',_binary ''),('461127ee-7dce-4eeb-878f-1e06c3f406aa','saml ecp','SAML ECP Profile Authentication Flow','c0270858-075b-431d-93d7-153e3204d46f','basic-flow',_binary '',_binary ''),('537ee000-5b2f-4487-9e41-bc97c59edff9','browser','browser based authentication','60416dc2-4603-4f6b-b014-b0b0fbe038ce','basic-flow',_binary '',_binary ''),('5462ded3-3d36-41d9-959b-b2ddc1606aec','browser','browser based authentication','c0270858-075b-431d-93d7-153e3204d46f','basic-flow',_binary '',_binary ''),('559d426f-eb90-47fa-8a30-63fbe8dee0aa','reset credentials','Reset credentials for a user if they forgot their password or something','60416dc2-4603-4f6b-b014-b0b0fbe038ce','basic-flow',_binary '',_binary ''),('578b58b9-e7c9-4683-9bf4-7622464bbf3c','registration','registration flow','60416dc2-4603-4f6b-b014-b0b0fbe038ce','basic-flow',_binary '',_binary ''),('65ed1d31-5ba3-4a5f-920c-3f073a4ec9cd','Account verification options','Method with which to verity the existing account','60416dc2-4603-4f6b-b014-b0b0fbe038ce','basic-flow',_binary '\0',_binary ''),('6ae7a261-a41a-4c44-a8bb-43e8b0341db8','registration','registration flow','c0270858-075b-431d-93d7-153e3204d46f','basic-flow',_binary '',_binary ''),('7090871c-ca2d-4caf-9fde-cf509ac14a7e','Browser - Conditional OTP','Flow to determine if the OTP is required for the authentication','c0270858-075b-431d-93d7-153e3204d46f','basic-flow',_binary '\0',_binary ''),('7ccb70ac-5e1c-4a41-8c43-d9879fda5c39','First broker login - Conditional OTP','Flow to determine if the OTP is required for the authentication','60416dc2-4603-4f6b-b014-b0b0fbe038ce','basic-flow',_binary '\0',_binary ''),('8614f220-38b0-45b3-a45c-ec31bb0560d0','forms','Username, password, otp and other auth forms.','60416dc2-4603-4f6b-b014-b0b0fbe038ce','basic-flow',_binary '\0',_binary ''),('8da609db-959a-40bb-a149-143389326cc5','forms','Username, password, otp and other auth forms.','c0270858-075b-431d-93d7-153e3204d46f','basic-flow',_binary '\0',_binary ''),('96e0d184-28bc-4a63-b98f-77de45c9c110','Handle Existing Account','Handle what to do if there is existing account with same email/username like authenticated identity provider','c0270858-075b-431d-93d7-153e3204d46f','basic-flow',_binary '\0',_binary ''),('9a0d2be5-00aa-4243-b913-f217b0264935','User creation or linking','Flow for the existing/non-existing user alternatives','c0270858-075b-431d-93d7-153e3204d46f','basic-flow',_binary '\0',_binary ''),('9b53da1e-fd3d-4e5b-a03d-43fe15758c90','Verify Existing Account by Re-authentication','Reauthentication of existing account','c0270858-075b-431d-93d7-153e3204d46f','basic-flow',_binary '\0',_binary ''),('9d1a7a55-b667-4961-8269-51fe6f685459','direct grant','OpenID Connect Resource Owner Grant','60416dc2-4603-4f6b-b014-b0b0fbe038ce','basic-flow',_binary '',_binary ''),('9f068558-ca0e-4474-8f84-6d1c64ddafbe','Verify Existing Account by Re-authentication','Reauthentication of existing account','60416dc2-4603-4f6b-b014-b0b0fbe038ce','basic-flow',_binary '\0',_binary ''),('a71807c1-a02b-4ab1-89b3-489543522e39','Handle Existing Account','Handle what to do if there is existing account with same email/username like authenticated identity provider','60416dc2-4603-4f6b-b014-b0b0fbe038ce','basic-flow',_binary '\0',_binary ''),('a99c0497-c70b-493e-90cc-78ac61fb4237','first broker login','Actions taken after first broker login with identity provider account, which is not yet linked to any Keycloak account','c0270858-075b-431d-93d7-153e3204d46f','basic-flow',_binary '',_binary ''),('af7d5e43-9a48-4d41-96cd-7348b04a2a2b','Reset - Conditional OTP','Flow to determine if the OTP should be reset or not. Set to REQUIRED to force.','60416dc2-4603-4f6b-b014-b0b0fbe038ce','basic-flow',_binary '\0',_binary ''),('b89a8a4b-6a49-4d21-91e8-e5aaa7b56615','docker auth','Used by Docker clients to authenticate against the IDP','c0270858-075b-431d-93d7-153e3204d46f','basic-flow',_binary '',_binary ''),('b942c612-d407-4130-9c54-bf9cdf703703','Reset - Conditional OTP','Flow to determine if the OTP should be reset or not. Set to REQUIRED to force.','c0270858-075b-431d-93d7-153e3204d46f','basic-flow',_binary '\0',_binary ''),('c3518fe4-e5ad-4f1d-b96e-a4a26dd7bd5b','Direct Grant - Conditional OTP','Flow to determine if the OTP is required for the authentication','60416dc2-4603-4f6b-b014-b0b0fbe038ce','basic-flow',_binary '\0',_binary ''),('c9d80974-87cb-4dba-b26d-0027b4950872','clients','Base authentication for clients','60416dc2-4603-4f6b-b014-b0b0fbe038ce','client-flow',_binary '',_binary ''),('cd8ac35f-4ed2-4b7d-8807-0a880358cab5','User creation or linking','Flow for the existing/non-existing user alternatives','60416dc2-4603-4f6b-b014-b0b0fbe038ce','basic-flow',_binary '\0',_binary ''),('de12a62f-ac31-43d7-a8b4-0e5c24420d15','Browser - Conditional OTP','Flow to determine if the OTP is required for the authentication','60416dc2-4603-4f6b-b014-b0b0fbe038ce','basic-flow',_binary '\0',_binary ''),('dfbde065-bd49-46c1-bead-72116f1ef191','Direct Grant - Conditional OTP','Flow to determine if the OTP is required for the authentication','c0270858-075b-431d-93d7-153e3204d46f','basic-flow',_binary '\0',_binary ''),('f1856911-4861-453e-801b-d8b76f0f51e5','direct grant','OpenID Connect Resource Owner Grant','c0270858-075b-431d-93d7-153e3204d46f','basic-flow',_binary '',_binary ''),('f5137e14-2857-49c9-a397-85bff02b4bd1','docker auth','Used by Docker clients to authenticate against the IDP','60416dc2-4603-4f6b-b014-b0b0fbe038ce','basic-flow',_binary '',_binary ''),('f518dfcb-bea8-4c5c-afe4-8b1fbf7800f8','registration form','registration form','60416dc2-4603-4f6b-b014-b0b0fbe038ce','form-flow',_binary '\0',_binary ''),('f530c802-3351-4968-b3c7-e383037320a0','first broker login','Actions taken after first broker login with identity provider account, which is not yet linked to any Keycloak account','60416dc2-4603-4f6b-b014-b0b0fbe038ce','basic-flow',_binary '',_binary ''),('fcd66a59-471e-43b4-b537-9b7318ac606a','Account verification options','Method with which to verity the existing account','c0270858-075b-431d-93d7-153e3204d46f','basic-flow',_binary '\0',_binary '');
/*!40000 ALTER TABLE `AUTHENTICATION_FLOW` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AUTHENTICATOR_CONFIG`
--

DROP TABLE IF EXISTS `AUTHENTICATOR_CONFIG`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `AUTHENTICATOR_CONFIG` (
  `ID` varchar(36) NOT NULL,
  `ALIAS` varchar(255) DEFAULT NULL,
  `REALM_ID` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_AUTH_CONFIG_REALM` (`REALM_ID`),
  CONSTRAINT `FK_AUTH_REALM` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AUTHENTICATOR_CONFIG`
--

LOCK TABLES `AUTHENTICATOR_CONFIG` WRITE;
/*!40000 ALTER TABLE `AUTHENTICATOR_CONFIG` DISABLE KEYS */;
INSERT INTO `AUTHENTICATOR_CONFIG` VALUES ('3a88ae0b-8a6f-4c70-838c-035f2ddb5749','review profile config','60416dc2-4603-4f6b-b014-b0b0fbe038ce'),('81f8cd92-f943-4087-8014-f71d1eea119b','review profile config','c0270858-075b-431d-93d7-153e3204d46f'),('cb87fddc-a1b3-48c8-b0df-e5f6003bd7e6','create unique user config','60416dc2-4603-4f6b-b014-b0b0fbe038ce'),('f02610b6-7e0e-4fe6-aa1f-16121726151c','create unique user config','c0270858-075b-431d-93d7-153e3204d46f');
/*!40000 ALTER TABLE `AUTHENTICATOR_CONFIG` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AUTHENTICATOR_CONFIG_ENTRY`
--

DROP TABLE IF EXISTS `AUTHENTICATOR_CONFIG_ENTRY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `AUTHENTICATOR_CONFIG_ENTRY` (
  `AUTHENTICATOR_ID` varchar(36) NOT NULL,
  `VALUE` longtext,
  `NAME` varchar(255) NOT NULL,
  PRIMARY KEY (`AUTHENTICATOR_ID`,`NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AUTHENTICATOR_CONFIG_ENTRY`
--

LOCK TABLES `AUTHENTICATOR_CONFIG_ENTRY` WRITE;
/*!40000 ALTER TABLE `AUTHENTICATOR_CONFIG_ENTRY` DISABLE KEYS */;
INSERT INTO `AUTHENTICATOR_CONFIG_ENTRY` VALUES ('3a88ae0b-8a6f-4c70-838c-035f2ddb5749','missing','update.profile.on.first.login'),('81f8cd92-f943-4087-8014-f71d1eea119b','missing','update.profile.on.first.login'),('cb87fddc-a1b3-48c8-b0df-e5f6003bd7e6','false','require.password.update.after.registration'),('f02610b6-7e0e-4fe6-aa1f-16121726151c','false','require.password.update.after.registration');
/*!40000 ALTER TABLE `AUTHENTICATOR_CONFIG_ENTRY` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `BROKER_LINK`
--

DROP TABLE IF EXISTS `BROKER_LINK`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `BROKER_LINK` (
  `IDENTITY_PROVIDER` varchar(255) NOT NULL,
  `STORAGE_PROVIDER_ID` varchar(255) DEFAULT NULL,
  `REALM_ID` varchar(36) NOT NULL,
  `BROKER_USER_ID` varchar(255) DEFAULT NULL,
  `BROKER_USERNAME` varchar(255) DEFAULT NULL,
  `TOKEN` text,
  `USER_ID` varchar(255) NOT NULL,
  PRIMARY KEY (`IDENTITY_PROVIDER`,`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `BROKER_LINK`
--

LOCK TABLES `BROKER_LINK` WRITE;
/*!40000 ALTER TABLE `BROKER_LINK` DISABLE KEYS */;
/*!40000 ALTER TABLE `BROKER_LINK` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CLIENT`
--

DROP TABLE IF EXISTS `CLIENT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CLIENT` (
  `ID` varchar(36) NOT NULL,
  `ENABLED` bit(1) NOT NULL DEFAULT b'0',
  `FULL_SCOPE_ALLOWED` bit(1) NOT NULL DEFAULT b'0',
  `CLIENT_ID` varchar(255) DEFAULT NULL,
  `NOT_BEFORE` int DEFAULT NULL,
  `PUBLIC_CLIENT` bit(1) NOT NULL DEFAULT b'0',
  `SECRET` varchar(255) DEFAULT NULL,
  `BASE_URL` varchar(255) DEFAULT NULL,
  `BEARER_ONLY` bit(1) NOT NULL DEFAULT b'0',
  `MANAGEMENT_URL` varchar(255) DEFAULT NULL,
  `SURROGATE_AUTH_REQUIRED` bit(1) NOT NULL DEFAULT b'0',
  `REALM_ID` varchar(36) DEFAULT NULL,
  `PROTOCOL` varchar(255) DEFAULT NULL,
  `NODE_REREG_TIMEOUT` int DEFAULT '0',
  `FRONTCHANNEL_LOGOUT` bit(1) NOT NULL DEFAULT b'0',
  `CONSENT_REQUIRED` bit(1) NOT NULL DEFAULT b'0',
  `NAME` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `SERVICE_ACCOUNTS_ENABLED` bit(1) NOT NULL DEFAULT b'0',
  `CLIENT_AUTHENTICATOR_TYPE` varchar(255) DEFAULT NULL,
  `ROOT_URL` varchar(255) DEFAULT NULL,
  `DESCRIPTION` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `REGISTRATION_TOKEN` varchar(255) DEFAULT NULL,
  `STANDARD_FLOW_ENABLED` bit(1) NOT NULL DEFAULT b'1',
  `IMPLICIT_FLOW_ENABLED` bit(1) NOT NULL DEFAULT b'0',
  `DIRECT_ACCESS_GRANTS_ENABLED` bit(1) NOT NULL DEFAULT b'0',
  `ALWAYS_DISPLAY_IN_CONSOLE` bit(1) NOT NULL DEFAULT b'0',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UK_B71CJLBENV945RB6GCON438AT` (`REALM_ID`,`CLIENT_ID`),
  KEY `IDX_CLIENT_ID` (`CLIENT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENT`
--

LOCK TABLES `CLIENT` WRITE;
/*!40000 ALTER TABLE `CLIENT` DISABLE KEYS */;
INSERT INTO `CLIENT` VALUES ('0aad771c-ec23-411e-9d59-6375f4503ef2',_binary '',_binary '\0','admin-cli',0,_binary '',NULL,NULL,_binary '\0',NULL,_binary '\0','c0270858-075b-431d-93d7-153e3204d46f','openid-connect',0,_binary '\0',_binary '\0','${client_admin-cli}',_binary '\0','client-secret',NULL,NULL,NULL,_binary '\0',_binary '\0',_binary '',_binary '\0'),('163c079e-1355-43cb-a6ec-450a4eabd255',_binary '',_binary '\0','broker',0,_binary '\0',NULL,NULL,_binary '',NULL,_binary '\0','c0270858-075b-431d-93d7-153e3204d46f','openid-connect',0,_binary '\0',_binary '\0','${client_broker}',_binary '\0','client-secret',NULL,NULL,NULL,_binary '',_binary '\0',_binary '\0',_binary '\0'),('23a0d2d8-1531-4d8d-8e88-a87b19de2363',_binary '',_binary '\0','account-console',0,_binary '',NULL,'/realms/billing-service/account/',_binary '\0',NULL,_binary '\0','c0270858-075b-431d-93d7-153e3204d46f','openid-connect',0,_binary '\0',_binary '\0','${client_account-console}',_binary '\0','client-secret','${authBaseUrl}',NULL,NULL,_binary '',_binary '\0',_binary '\0',_binary '\0'),('27b90d93-a3c8-45e5-8a4d-aaed000799c6',_binary '',_binary '\0','account',0,_binary '',NULL,'/realms/billing-service/account/',_binary '\0',NULL,_binary '\0','c0270858-075b-431d-93d7-153e3204d46f','openid-connect',0,_binary '\0',_binary '\0','${client_account}',_binary '\0','client-secret','${authBaseUrl}',NULL,NULL,_binary '',_binary '\0',_binary '\0',_binary '\0'),('3f461ac6-c6b6-4bc6-ad41-37845e946201',_binary '',_binary '\0','account-console',0,_binary '',NULL,'/realms/master/account/',_binary '\0',NULL,_binary '\0','60416dc2-4603-4f6b-b014-b0b0fbe038ce','openid-connect',0,_binary '\0',_binary '\0','${client_account-console}',_binary '\0','client-secret','${authBaseUrl}',NULL,NULL,_binary '',_binary '\0',_binary '\0',_binary '\0'),('68cfaba3-fa14-404f-969b-b6adbad10998',_binary '',_binary '\0','admin-cli',0,_binary '',NULL,NULL,_binary '\0',NULL,_binary '\0','60416dc2-4603-4f6b-b014-b0b0fbe038ce','openid-connect',0,_binary '\0',_binary '\0','${client_admin-cli}',_binary '\0','client-secret',NULL,NULL,NULL,_binary '\0',_binary '\0',_binary '',_binary '\0'),('71b430a1-13aa-445b-b52b-f0b6080a42d1',_binary '',_binary '\0','master-realm',0,_binary '\0',NULL,NULL,_binary '',NULL,_binary '\0','60416dc2-4603-4f6b-b014-b0b0fbe038ce',NULL,0,_binary '\0',_binary '\0','master Realm',_binary '\0','client-secret',NULL,NULL,NULL,_binary '',_binary '\0',_binary '\0',_binary '\0'),('7650bb8c-8665-4a1b-aa6e-4d595db480da',_binary '',_binary '\0','broker',0,_binary '\0',NULL,NULL,_binary '',NULL,_binary '\0','60416dc2-4603-4f6b-b014-b0b0fbe038ce','openid-connect',0,_binary '\0',_binary '\0','${client_broker}',_binary '\0','client-secret',NULL,NULL,NULL,_binary '',_binary '\0',_binary '\0',_binary '\0'),('b29858d1-dc20-4c75-983f-aa249b104e88',_binary '',_binary '\0','security-admin-console',0,_binary '',NULL,'/admin/billing-service/console/',_binary '\0',NULL,_binary '\0','c0270858-075b-431d-93d7-153e3204d46f','openid-connect',0,_binary '\0',_binary '\0','${client_security-admin-console}',_binary '\0','client-secret','${authAdminUrl}',NULL,NULL,_binary '',_binary '\0',_binary '\0',_binary '\0'),('b398c2ec-ba42-40b6-aedd-6fbdd3d475c6',_binary '',_binary '\0','realm-management',0,_binary '\0',NULL,NULL,_binary '',NULL,_binary '\0','c0270858-075b-431d-93d7-153e3204d46f','openid-connect',0,_binary '\0',_binary '\0','${client_realm-management}',_binary '\0','client-secret',NULL,NULL,NULL,_binary '',_binary '\0',_binary '\0',_binary '\0'),('e0e71877-84e1-4787-a07b-7f76b1bccfef',_binary '',_binary '\0','billing-service-realm',0,_binary '\0',NULL,NULL,_binary '',NULL,_binary '\0','60416dc2-4603-4f6b-b014-b0b0fbe038ce',NULL,0,_binary '\0',_binary '\0','billing-service Realm',_binary '\0','client-secret',NULL,NULL,NULL,_binary '',_binary '\0',_binary '\0',_binary '\0'),('e415f27a-40ae-49eb-a2ac-0e6cd4490d2d',_binary '',_binary '','billing-ui-client',0,_binary '',NULL,'http://localhost:4200/',_binary '\0','http://localhost:4200/',_binary '\0','c0270858-075b-431d-93d7-153e3204d46f','openid-connect',-1,_binary '',_binary '\0','',_binary '\0','client-secret','http://localhost:4200/','',NULL,_binary '',_binary '\0',_binary '',_binary '\0'),('e58e3d3a-56e9-4d28-90ce-79e9e7b2b35a',_binary '',_binary '\0','account',0,_binary '',NULL,'/realms/master/account/',_binary '\0',NULL,_binary '\0','60416dc2-4603-4f6b-b014-b0b0fbe038ce','openid-connect',0,_binary '\0',_binary '\0','${client_account}',_binary '\0','client-secret','${authBaseUrl}',NULL,NULL,_binary '',_binary '\0',_binary '\0',_binary '\0'),('e7ceccbe-612c-424a-8550-1566ffb84a52',_binary '',_binary '','billing-service-client',0,_binary '\0','pQ5djyzSh152bu8BfdL0MH5YXHrWE6Fn','http://localhost:8080/',_binary '\0','http://localhost:8080/',_binary '\0','c0270858-075b-431d-93d7-153e3204d46f','openid-connect',-1,_binary '',_binary '\0','',_binary '','client-secret','http://localhost:8080/','',NULL,_binary '',_binary '\0',_binary '',_binary '\0'),('f5a1ace1-bd2f-4b96-914a-0e491b492cdc',_binary '',_binary '\0','security-admin-console',0,_binary '',NULL,'/admin/master/console/',_binary '\0',NULL,_binary '\0','60416dc2-4603-4f6b-b014-b0b0fbe038ce','openid-connect',0,_binary '\0',_binary '\0','${client_security-admin-console}',_binary '\0','client-secret','${authAdminUrl}',NULL,NULL,_binary '',_binary '\0',_binary '\0',_binary '\0');
/*!40000 ALTER TABLE `CLIENT` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CLIENT_ATTRIBUTES`
--

DROP TABLE IF EXISTS `CLIENT_ATTRIBUTES`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CLIENT_ATTRIBUTES` (
  `CLIENT_ID` varchar(36) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  `VALUE` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci,
  PRIMARY KEY (`CLIENT_ID`,`NAME`),
  KEY `IDX_CLIENT_ATT_BY_NAME_VALUE` (`NAME`),
  CONSTRAINT `FK3C47C64BEACCA966` FOREIGN KEY (`CLIENT_ID`) REFERENCES `CLIENT` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENT_ATTRIBUTES`
--

LOCK TABLES `CLIENT_ATTRIBUTES` WRITE;
/*!40000 ALTER TABLE `CLIENT_ATTRIBUTES` DISABLE KEYS */;
INSERT INTO `CLIENT_ATTRIBUTES` VALUES ('23a0d2d8-1531-4d8d-8e88-a87b19de2363','pkce.code.challenge.method','S256'),('23a0d2d8-1531-4d8d-8e88-a87b19de2363','post.logout.redirect.uris','+'),('27b90d93-a3c8-45e5-8a4d-aaed000799c6','post.logout.redirect.uris','+'),('3f461ac6-c6b6-4bc6-ad41-37845e946201','pkce.code.challenge.method','S256'),('3f461ac6-c6b6-4bc6-ad41-37845e946201','post.logout.redirect.uris','+'),('b29858d1-dc20-4c75-983f-aa249b104e88','pkce.code.challenge.method','S256'),('b29858d1-dc20-4c75-983f-aa249b104e88','post.logout.redirect.uris','+'),('e415f27a-40ae-49eb-a2ac-0e6cd4490d2d','acr.loa.map','{}'),('e415f27a-40ae-49eb-a2ac-0e6cd4490d2d','backchannel.logout.revoke.offline.tokens','false'),('e415f27a-40ae-49eb-a2ac-0e6cd4490d2d','backchannel.logout.session.required','true'),('e415f27a-40ae-49eb-a2ac-0e6cd4490d2d','client_credentials.use_refresh_token','false'),('e415f27a-40ae-49eb-a2ac-0e6cd4490d2d','client.secret.creation.time','1697309013'),('e415f27a-40ae-49eb-a2ac-0e6cd4490d2d','display.on.consent.screen','false'),('e415f27a-40ae-49eb-a2ac-0e6cd4490d2d','oauth2.device.authorization.grant.enabled','false'),('e415f27a-40ae-49eb-a2ac-0e6cd4490d2d','oidc.ciba.grant.enabled','false'),('e415f27a-40ae-49eb-a2ac-0e6cd4490d2d','require.pushed.authorization.requests','false'),('e415f27a-40ae-49eb-a2ac-0e6cd4490d2d','tls.client.certificate.bound.access.tokens','false'),('e415f27a-40ae-49eb-a2ac-0e6cd4490d2d','token.response.type.bearer.lower-case','false'),('e415f27a-40ae-49eb-a2ac-0e6cd4490d2d','use.refresh.tokens','true'),('e58e3d3a-56e9-4d28-90ce-79e9e7b2b35a','post.logout.redirect.uris','+'),('e7ceccbe-612c-424a-8550-1566ffb84a52','backchannel.logout.revoke.offline.tokens','false'),('e7ceccbe-612c-424a-8550-1566ffb84a52','backchannel.logout.session.required','true'),('e7ceccbe-612c-424a-8550-1566ffb84a52','client.secret.creation.time','1697308808'),('e7ceccbe-612c-424a-8550-1566ffb84a52','display.on.consent.screen','false'),('e7ceccbe-612c-424a-8550-1566ffb84a52','oauth2.device.authorization.grant.enabled','false'),('e7ceccbe-612c-424a-8550-1566ffb84a52','oidc.ciba.grant.enabled','false'),('f5a1ace1-bd2f-4b96-914a-0e491b492cdc','pkce.code.challenge.method','S256'),('f5a1ace1-bd2f-4b96-914a-0e491b492cdc','post.logout.redirect.uris','+');
/*!40000 ALTER TABLE `CLIENT_ATTRIBUTES` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CLIENT_AUTH_FLOW_BINDINGS`
--

DROP TABLE IF EXISTS `CLIENT_AUTH_FLOW_BINDINGS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CLIENT_AUTH_FLOW_BINDINGS` (
  `CLIENT_ID` varchar(36) NOT NULL,
  `FLOW_ID` varchar(36) DEFAULT NULL,
  `BINDING_NAME` varchar(255) NOT NULL,
  PRIMARY KEY (`CLIENT_ID`,`BINDING_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENT_AUTH_FLOW_BINDINGS`
--

LOCK TABLES `CLIENT_AUTH_FLOW_BINDINGS` WRITE;
/*!40000 ALTER TABLE `CLIENT_AUTH_FLOW_BINDINGS` DISABLE KEYS */;
/*!40000 ALTER TABLE `CLIENT_AUTH_FLOW_BINDINGS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CLIENT_INITIAL_ACCESS`
--

DROP TABLE IF EXISTS `CLIENT_INITIAL_ACCESS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CLIENT_INITIAL_ACCESS` (
  `ID` varchar(36) NOT NULL,
  `REALM_ID` varchar(36) NOT NULL,
  `TIMESTAMP` int DEFAULT NULL,
  `EXPIRATION` int DEFAULT NULL,
  `COUNT` int DEFAULT NULL,
  `REMAINING_COUNT` int DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_CLIENT_INIT_ACC_REALM` (`REALM_ID`),
  CONSTRAINT `FK_CLIENT_INIT_ACC_REALM` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENT_INITIAL_ACCESS`
--

LOCK TABLES `CLIENT_INITIAL_ACCESS` WRITE;
/*!40000 ALTER TABLE `CLIENT_INITIAL_ACCESS` DISABLE KEYS */;
/*!40000 ALTER TABLE `CLIENT_INITIAL_ACCESS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CLIENT_NODE_REGISTRATIONS`
--

DROP TABLE IF EXISTS `CLIENT_NODE_REGISTRATIONS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CLIENT_NODE_REGISTRATIONS` (
  `CLIENT_ID` varchar(36) NOT NULL,
  `VALUE` int DEFAULT NULL,
  `NAME` varchar(255) NOT NULL,
  PRIMARY KEY (`CLIENT_ID`,`NAME`),
  CONSTRAINT `FK4129723BA992F594` FOREIGN KEY (`CLIENT_ID`) REFERENCES `CLIENT` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENT_NODE_REGISTRATIONS`
--

LOCK TABLES `CLIENT_NODE_REGISTRATIONS` WRITE;
/*!40000 ALTER TABLE `CLIENT_NODE_REGISTRATIONS` DISABLE KEYS */;
/*!40000 ALTER TABLE `CLIENT_NODE_REGISTRATIONS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CLIENT_SCOPE`
--

DROP TABLE IF EXISTS `CLIENT_SCOPE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CLIENT_SCOPE` (
  `ID` varchar(36) NOT NULL,
  `NAME` varchar(255) DEFAULT NULL,
  `REALM_ID` varchar(36) DEFAULT NULL,
  `DESCRIPTION` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `PROTOCOL` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UK_CLI_SCOPE` (`REALM_ID`,`NAME`),
  KEY `IDX_REALM_CLSCOPE` (`REALM_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENT_SCOPE`
--

LOCK TABLES `CLIENT_SCOPE` WRITE;
/*!40000 ALTER TABLE `CLIENT_SCOPE` DISABLE KEYS */;
INSERT INTO `CLIENT_SCOPE` VALUES ('12a98ef7-ae4f-4ec3-8900-27ccc54fb8c7','phone','c0270858-075b-431d-93d7-153e3204d46f','OpenID Connect built-in scope: phone','openid-connect'),('15361359-d13e-4f51-9a1d-51b27852d94b','address','c0270858-075b-431d-93d7-153e3204d46f','OpenID Connect built-in scope: address','openid-connect'),('1b049fb0-e99d-47fa-9fbb-f955769cb27c','web-origins','c0270858-075b-431d-93d7-153e3204d46f','OpenID Connect scope for add allowed web origins to the access token','openid-connect'),('224b7450-9c2c-4d9a-866b-505c01ef69a4','role_list','c0270858-075b-431d-93d7-153e3204d46f','SAML role list','saml'),('2db35c81-f2bc-4cf3-8f4d-30905b476c7d','offline_access','60416dc2-4603-4f6b-b014-b0b0fbe038ce','OpenID Connect built-in scope: offline_access','openid-connect'),('2e127e80-d25c-40fc-9832-360fb3a408e9','acr','c0270858-075b-431d-93d7-153e3204d46f','OpenID Connect scope for add acr (authentication context class reference) to the token','openid-connect'),('3b183c0c-fc99-45f5-9dbd-38303176114c','address','60416dc2-4603-4f6b-b014-b0b0fbe038ce','OpenID Connect built-in scope: address','openid-connect'),('433edf47-627c-4f7f-856a-e0c9182c31f1','email','c0270858-075b-431d-93d7-153e3204d46f','OpenID Connect built-in scope: email','openid-connect'),('436391f8-e42a-4b97-a142-77a0c69d4d61','email','60416dc2-4603-4f6b-b014-b0b0fbe038ce','OpenID Connect built-in scope: email','openid-connect'),('49a31f5b-9e62-43bc-96ed-d82701d1bdc6','offline_access','c0270858-075b-431d-93d7-153e3204d46f','OpenID Connect built-in scope: offline_access','openid-connect'),('69f81257-559c-4b1f-b519-793d849ad963','microprofile-jwt','60416dc2-4603-4f6b-b014-b0b0fbe038ce','Microprofile - JWT built-in scope','openid-connect'),('6a8a948f-e623-4951-a513-1e054da6dd63','profile','c0270858-075b-431d-93d7-153e3204d46f','OpenID Connect built-in scope: profile','openid-connect'),('72ad9bdd-c17c-4f7d-ad25-d090d4cca129','phone','60416dc2-4603-4f6b-b014-b0b0fbe038ce','OpenID Connect built-in scope: phone','openid-connect'),('76cea90a-8d2a-40f6-b44c-d00a5e2b0306','roles','60416dc2-4603-4f6b-b014-b0b0fbe038ce','OpenID Connect scope for add user roles to the access token','openid-connect'),('96ee4e31-ef97-4b03-9558-a872c45c4623','acr','60416dc2-4603-4f6b-b014-b0b0fbe038ce','OpenID Connect scope for add acr (authentication context class reference) to the token','openid-connect'),('a94a581f-72c2-4467-8669-c32378847ca1','profile','60416dc2-4603-4f6b-b014-b0b0fbe038ce','OpenID Connect built-in scope: profile','openid-connect'),('b5e3935f-48cf-407a-8da4-4de979a88396','web-origins','60416dc2-4603-4f6b-b014-b0b0fbe038ce','OpenID Connect scope for add allowed web origins to the access token','openid-connect'),('c6f03dea-77eb-4d5b-b55f-0033753a7373','microprofile-jwt','c0270858-075b-431d-93d7-153e3204d46f','Microprofile - JWT built-in scope','openid-connect'),('eb77e8cc-1ddc-45ba-8808-d3be948c246d','roles','c0270858-075b-431d-93d7-153e3204d46f','OpenID Connect scope for add user roles to the access token','openid-connect'),('f27c47ce-6d87-4f94-8a74-cbf2d9ed3d03','role_list','60416dc2-4603-4f6b-b014-b0b0fbe038ce','SAML role list','saml');
/*!40000 ALTER TABLE `CLIENT_SCOPE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CLIENT_SCOPE_ATTRIBUTES`
--

DROP TABLE IF EXISTS `CLIENT_SCOPE_ATTRIBUTES`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CLIENT_SCOPE_ATTRIBUTES` (
  `SCOPE_ID` varchar(36) NOT NULL,
  `VALUE` text,
  `NAME` varchar(255) NOT NULL,
  PRIMARY KEY (`SCOPE_ID`,`NAME`),
  KEY `IDX_CLSCOPE_ATTRS` (`SCOPE_ID`),
  CONSTRAINT `FK_CL_SCOPE_ATTR_SCOPE` FOREIGN KEY (`SCOPE_ID`) REFERENCES `CLIENT_SCOPE` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENT_SCOPE_ATTRIBUTES`
--

LOCK TABLES `CLIENT_SCOPE_ATTRIBUTES` WRITE;
/*!40000 ALTER TABLE `CLIENT_SCOPE_ATTRIBUTES` DISABLE KEYS */;
INSERT INTO `CLIENT_SCOPE_ATTRIBUTES` VALUES ('12a98ef7-ae4f-4ec3-8900-27ccc54fb8c7','${phoneScopeConsentText}','consent.screen.text'),('12a98ef7-ae4f-4ec3-8900-27ccc54fb8c7','true','display.on.consent.screen'),('12a98ef7-ae4f-4ec3-8900-27ccc54fb8c7','true','include.in.token.scope'),('15361359-d13e-4f51-9a1d-51b27852d94b','${addressScopeConsentText}','consent.screen.text'),('15361359-d13e-4f51-9a1d-51b27852d94b','true','display.on.consent.screen'),('15361359-d13e-4f51-9a1d-51b27852d94b','true','include.in.token.scope'),('1b049fb0-e99d-47fa-9fbb-f955769cb27c','','consent.screen.text'),('1b049fb0-e99d-47fa-9fbb-f955769cb27c','false','display.on.consent.screen'),('1b049fb0-e99d-47fa-9fbb-f955769cb27c','false','include.in.token.scope'),('224b7450-9c2c-4d9a-866b-505c01ef69a4','${samlRoleListScopeConsentText}','consent.screen.text'),('224b7450-9c2c-4d9a-866b-505c01ef69a4','true','display.on.consent.screen'),('2db35c81-f2bc-4cf3-8f4d-30905b476c7d','${offlineAccessScopeConsentText}','consent.screen.text'),('2db35c81-f2bc-4cf3-8f4d-30905b476c7d','true','display.on.consent.screen'),('2e127e80-d25c-40fc-9832-360fb3a408e9','false','display.on.consent.screen'),('2e127e80-d25c-40fc-9832-360fb3a408e9','false','include.in.token.scope'),('3b183c0c-fc99-45f5-9dbd-38303176114c','${addressScopeConsentText}','consent.screen.text'),('3b183c0c-fc99-45f5-9dbd-38303176114c','true','display.on.consent.screen'),('3b183c0c-fc99-45f5-9dbd-38303176114c','true','include.in.token.scope'),('433edf47-627c-4f7f-856a-e0c9182c31f1','${emailScopeConsentText}','consent.screen.text'),('433edf47-627c-4f7f-856a-e0c9182c31f1','true','display.on.consent.screen'),('433edf47-627c-4f7f-856a-e0c9182c31f1','true','include.in.token.scope'),('436391f8-e42a-4b97-a142-77a0c69d4d61','${emailScopeConsentText}','consent.screen.text'),('436391f8-e42a-4b97-a142-77a0c69d4d61','true','display.on.consent.screen'),('436391f8-e42a-4b97-a142-77a0c69d4d61','true','include.in.token.scope'),('49a31f5b-9e62-43bc-96ed-d82701d1bdc6','${offlineAccessScopeConsentText}','consent.screen.text'),('49a31f5b-9e62-43bc-96ed-d82701d1bdc6','true','display.on.consent.screen'),('69f81257-559c-4b1f-b519-793d849ad963','false','display.on.consent.screen'),('69f81257-559c-4b1f-b519-793d849ad963','true','include.in.token.scope'),('6a8a948f-e623-4951-a513-1e054da6dd63','${profileScopeConsentText}','consent.screen.text'),('6a8a948f-e623-4951-a513-1e054da6dd63','true','display.on.consent.screen'),('6a8a948f-e623-4951-a513-1e054da6dd63','true','include.in.token.scope'),('72ad9bdd-c17c-4f7d-ad25-d090d4cca129','${phoneScopeConsentText}','consent.screen.text'),('72ad9bdd-c17c-4f7d-ad25-d090d4cca129','true','display.on.consent.screen'),('72ad9bdd-c17c-4f7d-ad25-d090d4cca129','true','include.in.token.scope'),('76cea90a-8d2a-40f6-b44c-d00a5e2b0306','${rolesScopeConsentText}','consent.screen.text'),('76cea90a-8d2a-40f6-b44c-d00a5e2b0306','true','display.on.consent.screen'),('76cea90a-8d2a-40f6-b44c-d00a5e2b0306','false','include.in.token.scope'),('96ee4e31-ef97-4b03-9558-a872c45c4623','false','display.on.consent.screen'),('96ee4e31-ef97-4b03-9558-a872c45c4623','false','include.in.token.scope'),('a94a581f-72c2-4467-8669-c32378847ca1','${profileScopeConsentText}','consent.screen.text'),('a94a581f-72c2-4467-8669-c32378847ca1','true','display.on.consent.screen'),('a94a581f-72c2-4467-8669-c32378847ca1','true','include.in.token.scope'),('b5e3935f-48cf-407a-8da4-4de979a88396','','consent.screen.text'),('b5e3935f-48cf-407a-8da4-4de979a88396','false','display.on.consent.screen'),('b5e3935f-48cf-407a-8da4-4de979a88396','false','include.in.token.scope'),('c6f03dea-77eb-4d5b-b55f-0033753a7373','false','display.on.consent.screen'),('c6f03dea-77eb-4d5b-b55f-0033753a7373','true','include.in.token.scope'),('eb77e8cc-1ddc-45ba-8808-d3be948c246d','${rolesScopeConsentText}','consent.screen.text'),('eb77e8cc-1ddc-45ba-8808-d3be948c246d','true','display.on.consent.screen'),('eb77e8cc-1ddc-45ba-8808-d3be948c246d','false','include.in.token.scope'),('f27c47ce-6d87-4f94-8a74-cbf2d9ed3d03','${samlRoleListScopeConsentText}','consent.screen.text'),('f27c47ce-6d87-4f94-8a74-cbf2d9ed3d03','true','display.on.consent.screen');
/*!40000 ALTER TABLE `CLIENT_SCOPE_ATTRIBUTES` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CLIENT_SCOPE_CLIENT`
--

DROP TABLE IF EXISTS `CLIENT_SCOPE_CLIENT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CLIENT_SCOPE_CLIENT` (
  `CLIENT_ID` varchar(255) NOT NULL,
  `SCOPE_ID` varchar(255) NOT NULL,
  `DEFAULT_SCOPE` bit(1) NOT NULL DEFAULT b'0',
  PRIMARY KEY (`CLIENT_ID`,`SCOPE_ID`),
  KEY `IDX_CLSCOPE_CL` (`CLIENT_ID`),
  KEY `IDX_CL_CLSCOPE` (`SCOPE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENT_SCOPE_CLIENT`
--

LOCK TABLES `CLIENT_SCOPE_CLIENT` WRITE;
/*!40000 ALTER TABLE `CLIENT_SCOPE_CLIENT` DISABLE KEYS */;
INSERT INTO `CLIENT_SCOPE_CLIENT` VALUES ('0aad771c-ec23-411e-9d59-6375f4503ef2','12a98ef7-ae4f-4ec3-8900-27ccc54fb8c7',_binary '\0'),('0aad771c-ec23-411e-9d59-6375f4503ef2','15361359-d13e-4f51-9a1d-51b27852d94b',_binary '\0'),('0aad771c-ec23-411e-9d59-6375f4503ef2','1b049fb0-e99d-47fa-9fbb-f955769cb27c',_binary ''),('0aad771c-ec23-411e-9d59-6375f4503ef2','2e127e80-d25c-40fc-9832-360fb3a408e9',_binary ''),('0aad771c-ec23-411e-9d59-6375f4503ef2','433edf47-627c-4f7f-856a-e0c9182c31f1',_binary ''),('0aad771c-ec23-411e-9d59-6375f4503ef2','49a31f5b-9e62-43bc-96ed-d82701d1bdc6',_binary '\0'),('0aad771c-ec23-411e-9d59-6375f4503ef2','6a8a948f-e623-4951-a513-1e054da6dd63',_binary ''),('0aad771c-ec23-411e-9d59-6375f4503ef2','c6f03dea-77eb-4d5b-b55f-0033753a7373',_binary '\0'),('0aad771c-ec23-411e-9d59-6375f4503ef2','eb77e8cc-1ddc-45ba-8808-d3be948c246d',_binary ''),('163c079e-1355-43cb-a6ec-450a4eabd255','12a98ef7-ae4f-4ec3-8900-27ccc54fb8c7',_binary '\0'),('163c079e-1355-43cb-a6ec-450a4eabd255','15361359-d13e-4f51-9a1d-51b27852d94b',_binary '\0'),('163c079e-1355-43cb-a6ec-450a4eabd255','1b049fb0-e99d-47fa-9fbb-f955769cb27c',_binary ''),('163c079e-1355-43cb-a6ec-450a4eabd255','2e127e80-d25c-40fc-9832-360fb3a408e9',_binary ''),('163c079e-1355-43cb-a6ec-450a4eabd255','433edf47-627c-4f7f-856a-e0c9182c31f1',_binary ''),('163c079e-1355-43cb-a6ec-450a4eabd255','49a31f5b-9e62-43bc-96ed-d82701d1bdc6',_binary '\0'),('163c079e-1355-43cb-a6ec-450a4eabd255','6a8a948f-e623-4951-a513-1e054da6dd63',_binary ''),('163c079e-1355-43cb-a6ec-450a4eabd255','c6f03dea-77eb-4d5b-b55f-0033753a7373',_binary '\0'),('163c079e-1355-43cb-a6ec-450a4eabd255','eb77e8cc-1ddc-45ba-8808-d3be948c246d',_binary ''),('23a0d2d8-1531-4d8d-8e88-a87b19de2363','12a98ef7-ae4f-4ec3-8900-27ccc54fb8c7',_binary '\0'),('23a0d2d8-1531-4d8d-8e88-a87b19de2363','15361359-d13e-4f51-9a1d-51b27852d94b',_binary '\0'),('23a0d2d8-1531-4d8d-8e88-a87b19de2363','1b049fb0-e99d-47fa-9fbb-f955769cb27c',_binary ''),('23a0d2d8-1531-4d8d-8e88-a87b19de2363','2e127e80-d25c-40fc-9832-360fb3a408e9',_binary ''),('23a0d2d8-1531-4d8d-8e88-a87b19de2363','433edf47-627c-4f7f-856a-e0c9182c31f1',_binary ''),('23a0d2d8-1531-4d8d-8e88-a87b19de2363','49a31f5b-9e62-43bc-96ed-d82701d1bdc6',_binary '\0'),('23a0d2d8-1531-4d8d-8e88-a87b19de2363','6a8a948f-e623-4951-a513-1e054da6dd63',_binary ''),('23a0d2d8-1531-4d8d-8e88-a87b19de2363','c6f03dea-77eb-4d5b-b55f-0033753a7373',_binary '\0'),('23a0d2d8-1531-4d8d-8e88-a87b19de2363','eb77e8cc-1ddc-45ba-8808-d3be948c246d',_binary ''),('27b90d93-a3c8-45e5-8a4d-aaed000799c6','12a98ef7-ae4f-4ec3-8900-27ccc54fb8c7',_binary '\0'),('27b90d93-a3c8-45e5-8a4d-aaed000799c6','15361359-d13e-4f51-9a1d-51b27852d94b',_binary '\0'),('27b90d93-a3c8-45e5-8a4d-aaed000799c6','1b049fb0-e99d-47fa-9fbb-f955769cb27c',_binary ''),('27b90d93-a3c8-45e5-8a4d-aaed000799c6','2e127e80-d25c-40fc-9832-360fb3a408e9',_binary ''),('27b90d93-a3c8-45e5-8a4d-aaed000799c6','433edf47-627c-4f7f-856a-e0c9182c31f1',_binary ''),('27b90d93-a3c8-45e5-8a4d-aaed000799c6','49a31f5b-9e62-43bc-96ed-d82701d1bdc6',_binary '\0'),('27b90d93-a3c8-45e5-8a4d-aaed000799c6','6a8a948f-e623-4951-a513-1e054da6dd63',_binary ''),('27b90d93-a3c8-45e5-8a4d-aaed000799c6','c6f03dea-77eb-4d5b-b55f-0033753a7373',_binary '\0'),('27b90d93-a3c8-45e5-8a4d-aaed000799c6','eb77e8cc-1ddc-45ba-8808-d3be948c246d',_binary ''),('3f461ac6-c6b6-4bc6-ad41-37845e946201','2db35c81-f2bc-4cf3-8f4d-30905b476c7d',_binary '\0'),('3f461ac6-c6b6-4bc6-ad41-37845e946201','3b183c0c-fc99-45f5-9dbd-38303176114c',_binary '\0'),('3f461ac6-c6b6-4bc6-ad41-37845e946201','436391f8-e42a-4b97-a142-77a0c69d4d61',_binary ''),('3f461ac6-c6b6-4bc6-ad41-37845e946201','69f81257-559c-4b1f-b519-793d849ad963',_binary '\0'),('3f461ac6-c6b6-4bc6-ad41-37845e946201','72ad9bdd-c17c-4f7d-ad25-d090d4cca129',_binary '\0'),('3f461ac6-c6b6-4bc6-ad41-37845e946201','76cea90a-8d2a-40f6-b44c-d00a5e2b0306',_binary ''),('3f461ac6-c6b6-4bc6-ad41-37845e946201','96ee4e31-ef97-4b03-9558-a872c45c4623',_binary ''),('3f461ac6-c6b6-4bc6-ad41-37845e946201','a94a581f-72c2-4467-8669-c32378847ca1',_binary ''),('3f461ac6-c6b6-4bc6-ad41-37845e946201','b5e3935f-48cf-407a-8da4-4de979a88396',_binary ''),('68cfaba3-fa14-404f-969b-b6adbad10998','2db35c81-f2bc-4cf3-8f4d-30905b476c7d',_binary '\0'),('68cfaba3-fa14-404f-969b-b6adbad10998','3b183c0c-fc99-45f5-9dbd-38303176114c',_binary '\0'),('68cfaba3-fa14-404f-969b-b6adbad10998','436391f8-e42a-4b97-a142-77a0c69d4d61',_binary ''),('68cfaba3-fa14-404f-969b-b6adbad10998','69f81257-559c-4b1f-b519-793d849ad963',_binary '\0'),('68cfaba3-fa14-404f-969b-b6adbad10998','72ad9bdd-c17c-4f7d-ad25-d090d4cca129',_binary '\0'),('68cfaba3-fa14-404f-969b-b6adbad10998','76cea90a-8d2a-40f6-b44c-d00a5e2b0306',_binary ''),('68cfaba3-fa14-404f-969b-b6adbad10998','96ee4e31-ef97-4b03-9558-a872c45c4623',_binary ''),('68cfaba3-fa14-404f-969b-b6adbad10998','a94a581f-72c2-4467-8669-c32378847ca1',_binary ''),('68cfaba3-fa14-404f-969b-b6adbad10998','b5e3935f-48cf-407a-8da4-4de979a88396',_binary ''),('71b430a1-13aa-445b-b52b-f0b6080a42d1','2db35c81-f2bc-4cf3-8f4d-30905b476c7d',_binary '\0'),('71b430a1-13aa-445b-b52b-f0b6080a42d1','3b183c0c-fc99-45f5-9dbd-38303176114c',_binary '\0'),('71b430a1-13aa-445b-b52b-f0b6080a42d1','436391f8-e42a-4b97-a142-77a0c69d4d61',_binary ''),('71b430a1-13aa-445b-b52b-f0b6080a42d1','69f81257-559c-4b1f-b519-793d849ad963',_binary '\0'),('71b430a1-13aa-445b-b52b-f0b6080a42d1','72ad9bdd-c17c-4f7d-ad25-d090d4cca129',_binary '\0'),('71b430a1-13aa-445b-b52b-f0b6080a42d1','76cea90a-8d2a-40f6-b44c-d00a5e2b0306',_binary ''),('71b430a1-13aa-445b-b52b-f0b6080a42d1','96ee4e31-ef97-4b03-9558-a872c45c4623',_binary ''),('71b430a1-13aa-445b-b52b-f0b6080a42d1','a94a581f-72c2-4467-8669-c32378847ca1',_binary ''),('71b430a1-13aa-445b-b52b-f0b6080a42d1','b5e3935f-48cf-407a-8da4-4de979a88396',_binary ''),('7650bb8c-8665-4a1b-aa6e-4d595db480da','2db35c81-f2bc-4cf3-8f4d-30905b476c7d',_binary '\0'),('7650bb8c-8665-4a1b-aa6e-4d595db480da','3b183c0c-fc99-45f5-9dbd-38303176114c',_binary '\0'),('7650bb8c-8665-4a1b-aa6e-4d595db480da','436391f8-e42a-4b97-a142-77a0c69d4d61',_binary ''),('7650bb8c-8665-4a1b-aa6e-4d595db480da','69f81257-559c-4b1f-b519-793d849ad963',_binary '\0'),('7650bb8c-8665-4a1b-aa6e-4d595db480da','72ad9bdd-c17c-4f7d-ad25-d090d4cca129',_binary '\0'),('7650bb8c-8665-4a1b-aa6e-4d595db480da','76cea90a-8d2a-40f6-b44c-d00a5e2b0306',_binary ''),('7650bb8c-8665-4a1b-aa6e-4d595db480da','96ee4e31-ef97-4b03-9558-a872c45c4623',_binary ''),('7650bb8c-8665-4a1b-aa6e-4d595db480da','a94a581f-72c2-4467-8669-c32378847ca1',_binary ''),('7650bb8c-8665-4a1b-aa6e-4d595db480da','b5e3935f-48cf-407a-8da4-4de979a88396',_binary ''),('b29858d1-dc20-4c75-983f-aa249b104e88','12a98ef7-ae4f-4ec3-8900-27ccc54fb8c7',_binary '\0'),('b29858d1-dc20-4c75-983f-aa249b104e88','15361359-d13e-4f51-9a1d-51b27852d94b',_binary '\0'),('b29858d1-dc20-4c75-983f-aa249b104e88','1b049fb0-e99d-47fa-9fbb-f955769cb27c',_binary ''),('b29858d1-dc20-4c75-983f-aa249b104e88','2e127e80-d25c-40fc-9832-360fb3a408e9',_binary ''),('b29858d1-dc20-4c75-983f-aa249b104e88','433edf47-627c-4f7f-856a-e0c9182c31f1',_binary ''),('b29858d1-dc20-4c75-983f-aa249b104e88','49a31f5b-9e62-43bc-96ed-d82701d1bdc6',_binary '\0'),('b29858d1-dc20-4c75-983f-aa249b104e88','6a8a948f-e623-4951-a513-1e054da6dd63',_binary ''),('b29858d1-dc20-4c75-983f-aa249b104e88','c6f03dea-77eb-4d5b-b55f-0033753a7373',_binary '\0'),('b29858d1-dc20-4c75-983f-aa249b104e88','eb77e8cc-1ddc-45ba-8808-d3be948c246d',_binary ''),('b398c2ec-ba42-40b6-aedd-6fbdd3d475c6','12a98ef7-ae4f-4ec3-8900-27ccc54fb8c7',_binary '\0'),('b398c2ec-ba42-40b6-aedd-6fbdd3d475c6','15361359-d13e-4f51-9a1d-51b27852d94b',_binary '\0'),('b398c2ec-ba42-40b6-aedd-6fbdd3d475c6','1b049fb0-e99d-47fa-9fbb-f955769cb27c',_binary ''),('b398c2ec-ba42-40b6-aedd-6fbdd3d475c6','2e127e80-d25c-40fc-9832-360fb3a408e9',_binary ''),('b398c2ec-ba42-40b6-aedd-6fbdd3d475c6','433edf47-627c-4f7f-856a-e0c9182c31f1',_binary ''),('b398c2ec-ba42-40b6-aedd-6fbdd3d475c6','49a31f5b-9e62-43bc-96ed-d82701d1bdc6',_binary '\0'),('b398c2ec-ba42-40b6-aedd-6fbdd3d475c6','6a8a948f-e623-4951-a513-1e054da6dd63',_binary ''),('b398c2ec-ba42-40b6-aedd-6fbdd3d475c6','c6f03dea-77eb-4d5b-b55f-0033753a7373',_binary '\0'),('b398c2ec-ba42-40b6-aedd-6fbdd3d475c6','eb77e8cc-1ddc-45ba-8808-d3be948c246d',_binary ''),('e415f27a-40ae-49eb-a2ac-0e6cd4490d2d','12a98ef7-ae4f-4ec3-8900-27ccc54fb8c7',_binary '\0'),('e415f27a-40ae-49eb-a2ac-0e6cd4490d2d','15361359-d13e-4f51-9a1d-51b27852d94b',_binary '\0'),('e415f27a-40ae-49eb-a2ac-0e6cd4490d2d','1b049fb0-e99d-47fa-9fbb-f955769cb27c',_binary ''),('e415f27a-40ae-49eb-a2ac-0e6cd4490d2d','2e127e80-d25c-40fc-9832-360fb3a408e9',_binary ''),('e415f27a-40ae-49eb-a2ac-0e6cd4490d2d','433edf47-627c-4f7f-856a-e0c9182c31f1',_binary ''),('e415f27a-40ae-49eb-a2ac-0e6cd4490d2d','49a31f5b-9e62-43bc-96ed-d82701d1bdc6',_binary '\0'),('e415f27a-40ae-49eb-a2ac-0e6cd4490d2d','6a8a948f-e623-4951-a513-1e054da6dd63',_binary ''),('e415f27a-40ae-49eb-a2ac-0e6cd4490d2d','c6f03dea-77eb-4d5b-b55f-0033753a7373',_binary '\0'),('e415f27a-40ae-49eb-a2ac-0e6cd4490d2d','eb77e8cc-1ddc-45ba-8808-d3be948c246d',_binary ''),('e58e3d3a-56e9-4d28-90ce-79e9e7b2b35a','2db35c81-f2bc-4cf3-8f4d-30905b476c7d',_binary '\0'),('e58e3d3a-56e9-4d28-90ce-79e9e7b2b35a','3b183c0c-fc99-45f5-9dbd-38303176114c',_binary '\0'),('e58e3d3a-56e9-4d28-90ce-79e9e7b2b35a','436391f8-e42a-4b97-a142-77a0c69d4d61',_binary ''),('e58e3d3a-56e9-4d28-90ce-79e9e7b2b35a','69f81257-559c-4b1f-b519-793d849ad963',_binary '\0'),('e58e3d3a-56e9-4d28-90ce-79e9e7b2b35a','72ad9bdd-c17c-4f7d-ad25-d090d4cca129',_binary '\0'),('e58e3d3a-56e9-4d28-90ce-79e9e7b2b35a','76cea90a-8d2a-40f6-b44c-d00a5e2b0306',_binary ''),('e58e3d3a-56e9-4d28-90ce-79e9e7b2b35a','96ee4e31-ef97-4b03-9558-a872c45c4623',_binary ''),('e58e3d3a-56e9-4d28-90ce-79e9e7b2b35a','a94a581f-72c2-4467-8669-c32378847ca1',_binary ''),('e58e3d3a-56e9-4d28-90ce-79e9e7b2b35a','b5e3935f-48cf-407a-8da4-4de979a88396',_binary ''),('e7ceccbe-612c-424a-8550-1566ffb84a52','12a98ef7-ae4f-4ec3-8900-27ccc54fb8c7',_binary '\0'),('e7ceccbe-612c-424a-8550-1566ffb84a52','15361359-d13e-4f51-9a1d-51b27852d94b',_binary '\0'),('e7ceccbe-612c-424a-8550-1566ffb84a52','1b049fb0-e99d-47fa-9fbb-f955769cb27c',_binary ''),('e7ceccbe-612c-424a-8550-1566ffb84a52','2e127e80-d25c-40fc-9832-360fb3a408e9',_binary ''),('e7ceccbe-612c-424a-8550-1566ffb84a52','433edf47-627c-4f7f-856a-e0c9182c31f1',_binary ''),('e7ceccbe-612c-424a-8550-1566ffb84a52','49a31f5b-9e62-43bc-96ed-d82701d1bdc6',_binary '\0'),('e7ceccbe-612c-424a-8550-1566ffb84a52','6a8a948f-e623-4951-a513-1e054da6dd63',_binary ''),('e7ceccbe-612c-424a-8550-1566ffb84a52','c6f03dea-77eb-4d5b-b55f-0033753a7373',_binary '\0'),('e7ceccbe-612c-424a-8550-1566ffb84a52','eb77e8cc-1ddc-45ba-8808-d3be948c246d',_binary ''),('f5a1ace1-bd2f-4b96-914a-0e491b492cdc','2db35c81-f2bc-4cf3-8f4d-30905b476c7d',_binary '\0'),('f5a1ace1-bd2f-4b96-914a-0e491b492cdc','3b183c0c-fc99-45f5-9dbd-38303176114c',_binary '\0'),('f5a1ace1-bd2f-4b96-914a-0e491b492cdc','436391f8-e42a-4b97-a142-77a0c69d4d61',_binary ''),('f5a1ace1-bd2f-4b96-914a-0e491b492cdc','69f81257-559c-4b1f-b519-793d849ad963',_binary '\0'),('f5a1ace1-bd2f-4b96-914a-0e491b492cdc','72ad9bdd-c17c-4f7d-ad25-d090d4cca129',_binary '\0'),('f5a1ace1-bd2f-4b96-914a-0e491b492cdc','76cea90a-8d2a-40f6-b44c-d00a5e2b0306',_binary ''),('f5a1ace1-bd2f-4b96-914a-0e491b492cdc','96ee4e31-ef97-4b03-9558-a872c45c4623',_binary ''),('f5a1ace1-bd2f-4b96-914a-0e491b492cdc','a94a581f-72c2-4467-8669-c32378847ca1',_binary ''),('f5a1ace1-bd2f-4b96-914a-0e491b492cdc','b5e3935f-48cf-407a-8da4-4de979a88396',_binary '');
/*!40000 ALTER TABLE `CLIENT_SCOPE_CLIENT` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CLIENT_SCOPE_ROLE_MAPPING`
--

DROP TABLE IF EXISTS `CLIENT_SCOPE_ROLE_MAPPING`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CLIENT_SCOPE_ROLE_MAPPING` (
  `SCOPE_ID` varchar(36) NOT NULL,
  `ROLE_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`SCOPE_ID`,`ROLE_ID`),
  KEY `IDX_CLSCOPE_ROLE` (`SCOPE_ID`),
  KEY `IDX_ROLE_CLSCOPE` (`ROLE_ID`),
  CONSTRAINT `FK_CL_SCOPE_RM_SCOPE` FOREIGN KEY (`SCOPE_ID`) REFERENCES `CLIENT_SCOPE` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENT_SCOPE_ROLE_MAPPING`
--

LOCK TABLES `CLIENT_SCOPE_ROLE_MAPPING` WRITE;
/*!40000 ALTER TABLE `CLIENT_SCOPE_ROLE_MAPPING` DISABLE KEYS */;
INSERT INTO `CLIENT_SCOPE_ROLE_MAPPING` VALUES ('2db35c81-f2bc-4cf3-8f4d-30905b476c7d','3cb8422d-5b17-4797-9207-14eb5dfa2705'),('49a31f5b-9e62-43bc-96ed-d82701d1bdc6','44802841-7c2b-48da-9587-432036397679');
/*!40000 ALTER TABLE `CLIENT_SCOPE_ROLE_MAPPING` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CLIENT_SESSION`
--

DROP TABLE IF EXISTS `CLIENT_SESSION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CLIENT_SESSION` (
  `ID` varchar(36) NOT NULL,
  `CLIENT_ID` varchar(36) DEFAULT NULL,
  `REDIRECT_URI` varchar(255) DEFAULT NULL,
  `STATE` varchar(255) DEFAULT NULL,
  `TIMESTAMP` int DEFAULT NULL,
  `SESSION_ID` varchar(36) DEFAULT NULL,
  `AUTH_METHOD` varchar(255) DEFAULT NULL,
  `REALM_ID` varchar(255) DEFAULT NULL,
  `AUTH_USER_ID` varchar(36) DEFAULT NULL,
  `CURRENT_ACTION` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_CLIENT_SESSION_SESSION` (`SESSION_ID`),
  CONSTRAINT `FK_B4AO2VCVAT6UKAU74WBWTFQO1` FOREIGN KEY (`SESSION_ID`) REFERENCES `USER_SESSION` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENT_SESSION`
--

LOCK TABLES `CLIENT_SESSION` WRITE;
/*!40000 ALTER TABLE `CLIENT_SESSION` DISABLE KEYS */;
/*!40000 ALTER TABLE `CLIENT_SESSION` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CLIENT_SESSION_AUTH_STATUS`
--

DROP TABLE IF EXISTS `CLIENT_SESSION_AUTH_STATUS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CLIENT_SESSION_AUTH_STATUS` (
  `AUTHENTICATOR` varchar(36) NOT NULL,
  `STATUS` int DEFAULT NULL,
  `CLIENT_SESSION` varchar(36) NOT NULL,
  PRIMARY KEY (`CLIENT_SESSION`,`AUTHENTICATOR`),
  CONSTRAINT `AUTH_STATUS_CONSTRAINT` FOREIGN KEY (`CLIENT_SESSION`) REFERENCES `CLIENT_SESSION` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENT_SESSION_AUTH_STATUS`
--

LOCK TABLES `CLIENT_SESSION_AUTH_STATUS` WRITE;
/*!40000 ALTER TABLE `CLIENT_SESSION_AUTH_STATUS` DISABLE KEYS */;
/*!40000 ALTER TABLE `CLIENT_SESSION_AUTH_STATUS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CLIENT_SESSION_NOTE`
--

DROP TABLE IF EXISTS `CLIENT_SESSION_NOTE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CLIENT_SESSION_NOTE` (
  `NAME` varchar(255) NOT NULL,
  `VALUE` varchar(255) DEFAULT NULL,
  `CLIENT_SESSION` varchar(36) NOT NULL,
  PRIMARY KEY (`CLIENT_SESSION`,`NAME`),
  CONSTRAINT `FK5EDFB00FF51C2736` FOREIGN KEY (`CLIENT_SESSION`) REFERENCES `CLIENT_SESSION` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENT_SESSION_NOTE`
--

LOCK TABLES `CLIENT_SESSION_NOTE` WRITE;
/*!40000 ALTER TABLE `CLIENT_SESSION_NOTE` DISABLE KEYS */;
/*!40000 ALTER TABLE `CLIENT_SESSION_NOTE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CLIENT_SESSION_PROT_MAPPER`
--

DROP TABLE IF EXISTS `CLIENT_SESSION_PROT_MAPPER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CLIENT_SESSION_PROT_MAPPER` (
  `PROTOCOL_MAPPER_ID` varchar(36) NOT NULL,
  `CLIENT_SESSION` varchar(36) NOT NULL,
  PRIMARY KEY (`CLIENT_SESSION`,`PROTOCOL_MAPPER_ID`),
  CONSTRAINT `FK_33A8SGQW18I532811V7O2DK89` FOREIGN KEY (`CLIENT_SESSION`) REFERENCES `CLIENT_SESSION` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENT_SESSION_PROT_MAPPER`
--

LOCK TABLES `CLIENT_SESSION_PROT_MAPPER` WRITE;
/*!40000 ALTER TABLE `CLIENT_SESSION_PROT_MAPPER` DISABLE KEYS */;
/*!40000 ALTER TABLE `CLIENT_SESSION_PROT_MAPPER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CLIENT_SESSION_ROLE`
--

DROP TABLE IF EXISTS `CLIENT_SESSION_ROLE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CLIENT_SESSION_ROLE` (
  `ROLE_ID` varchar(255) NOT NULL,
  `CLIENT_SESSION` varchar(36) NOT NULL,
  PRIMARY KEY (`CLIENT_SESSION`,`ROLE_ID`),
  CONSTRAINT `FK_11B7SGQW18I532811V7O2DV76` FOREIGN KEY (`CLIENT_SESSION`) REFERENCES `CLIENT_SESSION` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENT_SESSION_ROLE`
--

LOCK TABLES `CLIENT_SESSION_ROLE` WRITE;
/*!40000 ALTER TABLE `CLIENT_SESSION_ROLE` DISABLE KEYS */;
/*!40000 ALTER TABLE `CLIENT_SESSION_ROLE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CLIENT_USER_SESSION_NOTE`
--

DROP TABLE IF EXISTS `CLIENT_USER_SESSION_NOTE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CLIENT_USER_SESSION_NOTE` (
  `NAME` varchar(255) NOT NULL,
  `VALUE` text,
  `CLIENT_SESSION` varchar(36) NOT NULL,
  PRIMARY KEY (`CLIENT_SESSION`,`NAME`),
  CONSTRAINT `FK_CL_USR_SES_NOTE` FOREIGN KEY (`CLIENT_SESSION`) REFERENCES `CLIENT_SESSION` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENT_USER_SESSION_NOTE`
--

LOCK TABLES `CLIENT_USER_SESSION_NOTE` WRITE;
/*!40000 ALTER TABLE `CLIENT_USER_SESSION_NOTE` DISABLE KEYS */;
/*!40000 ALTER TABLE `CLIENT_USER_SESSION_NOTE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `COMPONENT`
--

DROP TABLE IF EXISTS `COMPONENT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `COMPONENT` (
  `ID` varchar(36) NOT NULL,
  `NAME` varchar(255) DEFAULT NULL,
  `PARENT_ID` varchar(36) DEFAULT NULL,
  `PROVIDER_ID` varchar(36) DEFAULT NULL,
  `PROVIDER_TYPE` varchar(255) DEFAULT NULL,
  `REALM_ID` varchar(36) DEFAULT NULL,
  `SUB_TYPE` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_COMPONENT_REALM` (`REALM_ID`),
  KEY `IDX_COMPONENT_PROVIDER_TYPE` (`PROVIDER_TYPE`),
  CONSTRAINT `FK_COMPONENT_REALM` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `COMPONENT`
--

LOCK TABLES `COMPONENT` WRITE;
/*!40000 ALTER TABLE `COMPONENT` DISABLE KEYS */;
INSERT INTO `COMPONENT` VALUES ('02392181-37b1-4585-92e0-36ca38e49e25','Trusted Hosts','c0270858-075b-431d-93d7-153e3204d46f','trusted-hosts','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','c0270858-075b-431d-93d7-153e3204d46f','anonymous'),('165a3054-3dbf-4c3b-a73d-9a718b4e7aa1','rsa-generated','c0270858-075b-431d-93d7-153e3204d46f','rsa-generated','org.keycloak.keys.KeyProvider','c0270858-075b-431d-93d7-153e3204d46f',NULL),('175c7e09-fb75-437d-aa9e-b57431574592','Consent Required','60416dc2-4603-4f6b-b014-b0b0fbe038ce','consent-required','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','60416dc2-4603-4f6b-b014-b0b0fbe038ce','anonymous'),('1c925155-7d98-4bb8-8efe-768d29290baa','rsa-enc-generated','c0270858-075b-431d-93d7-153e3204d46f','rsa-enc-generated','org.keycloak.keys.KeyProvider','c0270858-075b-431d-93d7-153e3204d46f',NULL),('1fbd78f8-9921-47c5-b410-e9d890459150','aes-generated','60416dc2-4603-4f6b-b014-b0b0fbe038ce','aes-generated','org.keycloak.keys.KeyProvider','60416dc2-4603-4f6b-b014-b0b0fbe038ce',NULL),('21660fd8-2757-4fb1-9037-a7e967a883fc','Full Scope Disabled','c0270858-075b-431d-93d7-153e3204d46f','scope','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','c0270858-075b-431d-93d7-153e3204d46f','anonymous'),('2a54bfef-6115-4409-90e3-22cd164b4f70','Full Scope Disabled','60416dc2-4603-4f6b-b014-b0b0fbe038ce','scope','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','60416dc2-4603-4f6b-b014-b0b0fbe038ce','anonymous'),('39788ce2-3993-49ec-905f-9a51ac57955e','hmac-generated','60416dc2-4603-4f6b-b014-b0b0fbe038ce','hmac-generated','org.keycloak.keys.KeyProvider','60416dc2-4603-4f6b-b014-b0b0fbe038ce',NULL),('3efe53a7-9524-4372-87ff-b837bbcfa849','rsa-generated','60416dc2-4603-4f6b-b014-b0b0fbe038ce','rsa-generated','org.keycloak.keys.KeyProvider','60416dc2-4603-4f6b-b014-b0b0fbe038ce',NULL),('47632033-481b-4202-b521-8ba882e8aa4b','Max Clients Limit','60416dc2-4603-4f6b-b014-b0b0fbe038ce','max-clients','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','60416dc2-4603-4f6b-b014-b0b0fbe038ce','anonymous'),('5f58b1ab-38e2-4971-b045-4a9e54f20cf6','Allowed Client Scopes','60416dc2-4603-4f6b-b014-b0b0fbe038ce','allowed-client-templates','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','60416dc2-4603-4f6b-b014-b0b0fbe038ce','anonymous'),('663c411c-46ca-467a-b7df-601839f1f774','Consent Required','c0270858-075b-431d-93d7-153e3204d46f','consent-required','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','c0270858-075b-431d-93d7-153e3204d46f','anonymous'),('7a80c54c-d80e-4bdf-a8c2-24ecea6bad44','aes-generated','c0270858-075b-431d-93d7-153e3204d46f','aes-generated','org.keycloak.keys.KeyProvider','c0270858-075b-431d-93d7-153e3204d46f',NULL),('88e3f8c5-61ef-4145-867d-e5581d38a40c','Allowed Client Scopes','c0270858-075b-431d-93d7-153e3204d46f','allowed-client-templates','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','c0270858-075b-431d-93d7-153e3204d46f','anonymous'),('abe2e50a-1ba1-43ba-96e6-e1169f678dd5','Allowed Protocol Mapper Types','60416dc2-4603-4f6b-b014-b0b0fbe038ce','allowed-protocol-mappers','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','60416dc2-4603-4f6b-b014-b0b0fbe038ce','authenticated'),('b4d08d53-ca4c-4e1a-9af4-8f710523b3e2','hmac-generated','c0270858-075b-431d-93d7-153e3204d46f','hmac-generated','org.keycloak.keys.KeyProvider','c0270858-075b-431d-93d7-153e3204d46f',NULL),('c2830c7c-f9f9-4d9f-a6e7-d2a879bd13ad','rsa-enc-generated','60416dc2-4603-4f6b-b014-b0b0fbe038ce','rsa-enc-generated','org.keycloak.keys.KeyProvider','60416dc2-4603-4f6b-b014-b0b0fbe038ce',NULL),('d4dbdc51-a8b3-4a55-b541-3670f4759ad4','Allowed Client Scopes','c0270858-075b-431d-93d7-153e3204d46f','allowed-client-templates','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','c0270858-075b-431d-93d7-153e3204d46f','authenticated'),('dfe20bdb-2a3d-4b61-be44-199e2055a25c','Allowed Protocol Mapper Types','c0270858-075b-431d-93d7-153e3204d46f','allowed-protocol-mappers','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','c0270858-075b-431d-93d7-153e3204d46f','authenticated'),('e503a7e5-930e-4e58-9d71-f70bd8639ffc','Trusted Hosts','60416dc2-4603-4f6b-b014-b0b0fbe038ce','trusted-hosts','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','60416dc2-4603-4f6b-b014-b0b0fbe038ce','anonymous'),('eae56343-fd6c-4c09-9417-a493a1edeeb9','Allowed Protocol Mapper Types','c0270858-075b-431d-93d7-153e3204d46f','allowed-protocol-mappers','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','c0270858-075b-431d-93d7-153e3204d46f','anonymous'),('f02c0162-670c-458d-944b-89754ffb93ab','Allowed Protocol Mapper Types','60416dc2-4603-4f6b-b014-b0b0fbe038ce','allowed-protocol-mappers','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','60416dc2-4603-4f6b-b014-b0b0fbe038ce','anonymous'),('f2ee2e54-1a2c-4331-a864-09d26f85dd1b','Max Clients Limit','c0270858-075b-431d-93d7-153e3204d46f','max-clients','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','c0270858-075b-431d-93d7-153e3204d46f','anonymous'),('ff50f54c-8922-4c5a-b423-23d5a9f02cf4','Allowed Client Scopes','60416dc2-4603-4f6b-b014-b0b0fbe038ce','allowed-client-templates','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','60416dc2-4603-4f6b-b014-b0b0fbe038ce','authenticated');
/*!40000 ALTER TABLE `COMPONENT` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `COMPONENT_CONFIG`
--

DROP TABLE IF EXISTS `COMPONENT_CONFIG`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `COMPONENT_CONFIG` (
  `ID` varchar(36) NOT NULL,
  `COMPONENT_ID` varchar(36) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  `VALUE` varchar(4000) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_COMPO_CONFIG_COMPO` (`COMPONENT_ID`),
  CONSTRAINT `FK_COMPONENT_CONFIG` FOREIGN KEY (`COMPONENT_ID`) REFERENCES `COMPONENT` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `COMPONENT_CONFIG`
--

LOCK TABLES `COMPONENT_CONFIG` WRITE;
/*!40000 ALTER TABLE `COMPONENT_CONFIG` DISABLE KEYS */;
INSERT INTO `COMPONENT_CONFIG` VALUES ('042d825f-60c3-4935-9c91-b76eaf3fba12','165a3054-3dbf-4c3b-a73d-9a718b4e7aa1','certificate','MIICrTCCAZUCBgGLKyhvIjANBgkqhkiG9w0BAQsFADAaMRgwFgYDVQQDDA9iaWxsaW5nLXNlcnZpY2UwHhcNMjMxMDEzMjIyNzMyWhcNMzMxMDEzMjIyOTEyWjAaMRgwFgYDVQQDDA9iaWxsaW5nLXNlcnZpY2UwggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQCa0pSo8TJakioK6ww7rJ+EkZbr/XGa/77NSPpRoO02boNrXqS8RY1010KdpJjXW1O3JlsIjl39xoUIZiGS/QDgr/TeEMHW0yGnJWGBMJd7I9Q4X1V7bTCeaM3NI8R00EbTTYf5gVpRUqE/ewZt18yi/XLFtXuryUfzmyeMmyt4/NLNnEaEtVgZR3s3RfnZaNgK2AkdzJin2PN1faO8eL68SI+YCKn5eEY8RcNJLR2WWqqLhOu9Om64xFcVWW5ah3JPtQZ581LjMRJeEghMDOxYAhDF5LaDY+4y9SEUfCF3m8cgplPZ40zi1CiALVSU1rbhUUK1nR1qgDOtxbzdKGpPAgMBAAEwDQYJKoZIhvcNAQELBQADggEBABepqhaJUSH2NiQIc0wZD4r46PHVLFnyW5nQFjEVZFrZwlXIJkseZl9L/4S35Zc+e4JXGYpvKoSMr/CKQMMZPhndcnpu+GuscDirlED/piRkOfZyXpFW1tyJxSPOECgnL6TaMGryzTL5SufK+K8m+DIJqTWJ+CqTcsOWKAaVnL2BHf6lHrN8BSAAKbn2LyV8uCcJrfJjvp3uJPPwJldUEuVZjWmmB5iLaVkNXhn0G5O3qA6popbYnWhBbQKWdo72mHkTfxQ4jj9RUnG33nO9VgiT3VNPEsLSR/kF3apW4tduQ1mYd1kni3/JH9+ilVM0cz1RZq6pwA5b+kIJ2ZI0a2U='),('060f6bef-7090-4d54-9406-53478a0e4853','7a80c54c-d80e-4bdf-a8c2-24ecea6bad44','secret','PR8a6DpERmuum6ucUQ59Qg'),('07cd593a-67e9-4737-b191-5d6e0ae02d29','abe2e50a-1ba1-43ba-96e6-e1169f678dd5','allowed-protocol-mapper-types','saml-role-list-mapper'),('092906fd-b420-4358-9721-8ce12b60e51b','1fbd78f8-9921-47c5-b410-e9d890459150','kid','7a50a172-0f63-4508-9751-eccf26576b43'),('0bf16b85-ade2-4c9e-a0ae-e2251ff1962c','3efe53a7-9524-4372-87ff-b837bbcfa849','certificate','MIICmzCCAYMCBgGLKx3evTANBgkqhkiG9w0BAQsFADARMQ8wDQYDVQQDDAZtYXN0ZXIwHhcNMjMxMDEzMjIxNTU5WhcNMzMxMDEzMjIxNzM5WjARMQ8wDQYDVQQDDAZtYXN0ZXIwggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQCu6gYp+lLmgKmt5FOl/sBODl19uQl8b87OqVBTpkYnYnjxGzwsNE86ccG/xctjsyFHanYuFXeDvWfTF5QZhq6rEnp50e3JoWGC5ujN0ejx0Nk0Ohbk6McQVSN48O0X6CZBbkyTXVnbKnt3VdAN2DxwfhpxGnaObDdip5EWRiUSPuEawARQ0kn1OBHKtxC6gPrNVkLIBC7REWz6WTaZGuxmzdJRIrq5l6GJ/MRdzp4pF5mD673Ao7+pNrdIq+7NWGRaPJdTHxB1L8GvmfEiSYRIhtBIgNNoDp6Ajd57W27ht5TOXrapu1ChkJzuWsPr3bO1A8TKkA/PMDCPDtMdf3wDAgMBAAEwDQYJKoZIhvcNAQELBQADggEBAGMYK0nZq2XyWxct/+k+T4TwN52JMzomIe+G23o2uywh+dx57UpHCwwUOyLWoj33CSP0tLFPjacUlWIZ9KxfklpAiXQJaCmRnrui4XCTRd8vY69EnFLOGAQIHox+74RGyaiUFbrfgAWRQnE8hsjYlzGHGIE6wbizLds6ybqtO6S1nqls7VKG9RD3k5aDKZvMnbWFcGglhtoVgQBe4bGjL90wwtoaNM0xzcd/QBfoyQHqsagot1aSYmibK8V4XsLIgs1Z8jpJ3XLSjB89HLdJ7PGjd66SihaPP2YJCjiOuAXaGTxO0MYo2TKYDixrzeMeS3lbDLq7ubxzDeo2d+SPW30='),('0c3c5f74-2afa-4ff2-9300-776fbb2e5e4a','f02c0162-670c-458d-944b-89754ffb93ab','allowed-protocol-mapper-types','saml-user-attribute-mapper'),('193626b0-857c-4a29-9194-41901b35ef45','1c925155-7d98-4bb8-8efe-768d29290baa','privateKey','MIIEowIBAAKCAQEAvSw9Uq2enUiuMXFcK7Ye14IY05iV4MZ0xRri4IHRutupPvtR+sLG4XcKdFXkD3Q0m6ju7G9SIRQrmE5kxrRFHuJhH0qASF2O1aohwl38VDyotqjFakq0Ue9zXWRQda3YD6EzjnZJzzTlrwabdkjX+shDQVHx924e1gX5CZRNOJkkbd1zwWeCXI/CNj8sHy+CdKzD77T65JuH0L9XO0jyWIbsLm8E/4tH/7IZuTlgIWZAUsoqJBsyjuejwaBDgXDTgm1grVUiN2o3d5cA96pOUBTc7n2yel6rT6hTsvCve/e/3TQ6kZhpyqvG9Z5wqeQX9yAwjAr5IsBt2qFJ9YlY+QIDAQABAoIBAA8tAOBkmEBi58KEpxHEovXD9IzpBUEKeqyjSwcaswIMBChOzhVRUdYdkCOkDk8lEeFY7I3gIlUQAq1NwKzmIlNncsYpWmAzzTUb2Gh41LjHQvugT3IG+y9Fh9o6pW/DWf1q/7FSkPpD8pcXbxpOnrD6JtcTJVelqGigAwn/MTC0iRV4N/OToqbcgaV/xmkycpk2un+raZFuCWz13QfJTZjq4g40a5m8r0K6wTFfDG/QlIp+V8XkA2JjCuZq1FeqHRUfjR3mpSnAHtbWxseP8V0WGbyPcOySY73KK0g5OlCr3wn+mxdNI3NJBk+Bt1seXZyzx8xMTHODhsu8rbu63w8CgYEA3sgLtMP5mB2EELM9/ZtQKGl1j/2iR+LQY0sixjpkNL/5+QQ3mCQ8uwusaiS5Sa6Glw9ihzCxwK0O/DD+zRq+2hvtLeIBV0CYnhoD7lN2Gr0hh+yDswhlJQ6gJkM6sbr5qrYltWe0ZRyVghfB6pEwn9YgwwZ7iodQBJibIIjFKZ8CgYEA2WFLYiTEvydZYbRoJWL82EuSLJkXlM0UNmqfOHk4bI+kDkIHOrIl3kYLMR6zqYfVvCb/neAdpE7ZAXoyW7fRnLoyR2rz0S1wEF8ghK/OY64+i8dd3djMM3Gn1hAtEQRAfR4EaY9ByZh4A6RICw8ZDfntaWEJS/793ydRS6j4JmcCgYEAyupw5yQ9ehUgTknEo/NMTpLH9vAxWMK5xkcQlHdpADcAC5WQwa339vKKB2ANuJQTmRH1T2fF79ZxOLmzy8OZpHYdUVZynDOFDzRo8jHo+C/ek7yUtIRoBBnPOyqvEmVYtOoVbKbZw+MGNqlHAk1eeaeCzcBg1GutMZKCcV7CHscCgYBqoOoMS0LjDRcv8QGBDUw/gNpD3BiQGgSHKMfPOM7vmYn8oHDRXt9qZ2tH/epdB09VSr/qHiwME80oh1s6WDGOslrFY3YTrjkhHrhhvab8iFUP1Yx6rMSFm4ObYjXo+e/0L4w0h1va2lpMVwIrwo0kqOrG3R1lVMAM/UlIVqrakwKBgHWb0rC+1cNl7lRXwOo/ctcg0bn1GCEzcFSxXM4m7mMHkqh7l/mWxMciGhJSH9B72k6uGuk0g743q4M1BtbIf7SU4CyZU+jzhWBYfh5bctP+FK0gQ7jxs5Z+BwB/pesbKtwZaDv0T6n9Or8vaXbE68WNs7G1o9ERMc5ULuUsgvN2'),('195ab676-4765-4f5c-905f-ebbe4e2ea00d','7a80c54c-d80e-4bdf-a8c2-24ecea6bad44','priority','100'),('1fd529bf-7758-4774-b089-f170cec93c9c','165a3054-3dbf-4c3b-a73d-9a718b4e7aa1','keyUse','SIG'),('2240ac85-68b5-44a5-b91e-d77abf1361c9','dfe20bdb-2a3d-4b61-be44-199e2055a25c','allowed-protocol-mapper-types','saml-role-list-mapper'),('22c5371a-5f34-4558-9c8d-f0a75427bb1d','39788ce2-3993-49ec-905f-9a51ac57955e','algorithm','HS256'),('24e9d591-4bdb-4424-b732-aac621f6e4ff','e503a7e5-930e-4e58-9d71-f70bd8639ffc','client-uris-must-match','true'),('2653f8ef-1fd4-4218-8d98-da855a26207f','f2ee2e54-1a2c-4331-a864-09d26f85dd1b','max-clients','200'),('2895456d-f27f-4ce3-9363-f65619c3d2d1','dfe20bdb-2a3d-4b61-be44-199e2055a25c','allowed-protocol-mapper-types','oidc-address-mapper'),('2ba24ab8-eb71-4e58-9126-880ab2461da6','39788ce2-3993-49ec-905f-9a51ac57955e','priority','100'),('2ce912e5-7866-4156-9c60-dd717644dd75','3efe53a7-9524-4372-87ff-b837bbcfa849','privateKey','MIIEowIBAAKCAQEAruoGKfpS5oCpreRTpf7ATg5dfbkJfG/OzqlQU6ZGJ2J48Rs8LDRPOnHBv8XLY7MhR2p2LhV3g71n0xeUGYauqxJ6edHtyaFhgubozdHo8dDZNDoW5OjHEFUjePDtF+gmQW5Mk11Z2yp7d1XQDdg8cH4acRp2jmw3YqeRFkYlEj7hGsAEUNJJ9TgRyrcQuoD6zVZCyAQu0RFs+lk2mRrsZs3SUSK6uZehifzEXc6eKReZg+u9wKO/qTa3SKvuzVhkWjyXUx8QdS/Br5nxIkmESIbQSIDTaA6egI3ee1tu4beUzl62qbtQoZCc7lrD692ztQPEypAPzzAwjw7THX98AwIDAQABAoIBAANg/fF9pnBRd/Wl/X+tZiWb3W56TpaaylHvr1+OTLiiDFgMAKOR9x3X6Lg9p+orIa9xfQry2zYuSH0pbXD4yxL+7mLADWnhtjKDJ2gib++L60Y5AQw2+vFz05WYgdv+Xg7RhKUsHno/Xdc2TyiVTsWVigk5S6UArik3t3PIsxqhGByOVTx8VjClYzhcV22PAXslNB/zyq2nElK7tw2aDhOXPms+xB8DVNP5AdOWixJrrQeJRRcvezMHW4c5u19yMNDH5c6ouVebkBp2HhSI6Jj2z6E7wi6wa+9tXM4X+pdQe3+88WyT4Hexd2o0hT/+hzhHx/oU289DYYdx24X255ECgYEA6ggKorwSHZlYjF5rRCI2aXXb9aUZ8vCfqZ+fyd9JNH1DVEgI1BUOMu+CCfgOO5vaE8SYpSVy70Bgnnpwyy6h1Jx/ACT7iRvEUHFzu2ebMCM9bvE8WiLEh3YrR4NtGJfROL2X7VUIhbIwhVWDxrj/SKjOKLIHbQlbPD7GhpaOp/0CgYEAv1VZNvN4264OdhsYeuvrUWmJ0SYq0GmYMC8J8rpna4xBsbPuwXr98CjeqUqUkuM7NQWiPIIANJp3wO2FbprB1RsEpm+MRiuJbZkZkDArEQmAQwAJJEBQbzxFbJ0ugH3ad4WQw1yGGERRTxHGhJOSJBwvFkJswKzr2KVV2oQF8/8CgYBITTmz8vSJznFL1HPBNeyngjD1YA93PZ2mEtmTzXbZT4W4iRSpKOQdGl+LYuZKxiiGiOs7wikS/0maTGuCaiK3A648xjAruLdavuIpWKXaJlj5aG/jzO/4hapzSogu2+BYbkJ8oROj8lwJJVUz1L2Rng0rB21B420bXK2KsQLbpQKBgGZfCwnswRiBC3nDy5hRTCnWFwgRrMywAt6c/GyjsZwIgknLJQ7eeKobo+7eWZox/EbFSeWoBOYgU7ylGURxhw43k4hdnKcaukAqr1PHgfNuqvKuPTXpN2Ac1mRjwTK8o7xZeXgdtB2dyAdPUnEy5/lsHwGA7uE0ZEgZRlNRWkIPAoGBANoXMHh/2yrX+HijS+Voiki6s+JSrbq5x5WcUq5DPgt+kMMHY0GefkzjG+YcRk65VneGTjrza+r86RjhsYWkk269bHJz5kIB5+jmMw6oWDFKu4J6YT4iFLgUyTnSpSZEDPLid2YUMXxlcqcCU+2Wgu7fVA+ttcDpaaFkYmMDMr3M'),('2df3dd58-da07-49fe-893f-1037c4f85ab4','eae56343-fd6c-4c09-9417-a493a1edeeb9','allowed-protocol-mapper-types','oidc-usermodel-property-mapper'),('2f27139f-4b8e-4721-a527-1a30943143e2','1c925155-7d98-4bb8-8efe-768d29290baa','algorithm','RSA-OAEP'),('3122b966-fc26-4356-ae7a-0775509563a0','dfe20bdb-2a3d-4b61-be44-199e2055a25c','allowed-protocol-mapper-types','oidc-full-name-mapper'),('33ca0ac7-f9f0-434f-a7f3-212048594c83','3efe53a7-9524-4372-87ff-b837bbcfa849','priority','100'),('3a6bb45c-f47f-48fc-ac55-19b021da4579','eae56343-fd6c-4c09-9417-a493a1edeeb9','allowed-protocol-mapper-types','oidc-usermodel-attribute-mapper'),('3fe28c16-7e68-4fc7-a3db-3b2144ba08b2','c2830c7c-f9f9-4d9f-a6e7-d2a879bd13ad','priority','100'),('42d2ef11-6ae4-4574-a71a-1d0291add5fa','02392181-37b1-4585-92e0-36ca38e49e25','host-sending-registration-request-must-match','true'),('433dea0d-dfa8-4764-91ec-4c404aefbd7f','165a3054-3dbf-4c3b-a73d-9a718b4e7aa1','privateKey','MIIEpAIBAAKCAQEAmtKUqPEyWpIqCusMO6yfhJGW6/1xmv++zUj6UaDtNm6Da16kvEWNdNdCnaSY11tTtyZbCI5d/caFCGYhkv0A4K/03hDB1tMhpyVhgTCXeyPUOF9Ve20wnmjNzSPEdNBG002H+YFaUVKhP3sGbdfMov1yxbV7q8lH85snjJsrePzSzZxGhLVYGUd7N0X52WjYCtgJHcyYp9jzdX2jvHi+vEiPmAip+XhGPEXDSS0dllqqi4TrvTpuuMRXFVluWodyT7UGefNS4zESXhIITAzsWAIQxeS2g2PuMvUhFHwhd5vHIKZT2eNM4tQogC1UlNa24VFCtZ0daoAzrcW83ShqTwIDAQABAoIBAAKl16lcrVNI4lOFzz5ABrRiNwtkg2phYFaAyS3XNjyy6X15xLsm513tsTPNVQMt39cnM/GyrvSATislcAKPCtJM6r+s2AaACDh5wQVQGu8eCZWd5RzeHQbrMkXatulBMfeQK7ipLS3B34Rx6rC7Ou04r3Cmg23Ih09TwnqQTCSJYOky/cgaPc/Pa4KakvcNosMIADbFS+eR6eRe+FqDQ3F2bQgqHGB0Qkt21FtXL/NJnGn6MrC1+ENSHUFMOkJArKR6WoXAEApCJVG19GFDV+CGW3Nsdpey5Uz2DzWmJVj3VGJlDMvwL74QGdGaXC/csy//NhocdDRkB7xYEZgybRkCgYEAy4KdDI9WFVMgHyQdoAQCLtihcBS/TOb9rZCNHd3p4Ixkli0sPutXOu1hyvfy8nPt91LNGqdtBayFqr9yVehkuvHL+9pL+5l6Nl5ODiOhvxgfTxCdK4szuie/QgJQKwkC5JHNC4aaD33bQs6zC7lVBT0Ic+HZ6Fp5A/R7ZL85mzkCgYEAwsE3kd8iwQe6akSzlX5RpvM6ie/ZaKN46rJ0ys/9Yt/xG88sPC4TBEp8AxbmDOCESyoc4lmtXS5EQG+aEr2F+w2XC5b0eW/QnOq6ZtPIcl8CUddoM1cq/P5gM2rwUAQVZeAsuDTpnM8tOmv29rJElc7UCLq9YxU6SAoJdEOJyccCgYA1X5gYxy7ogNiX0j0CzopUBvSwFIDnhl1Zu+OGxcCk560pxcco6UgDaGaReN36wHTUvJ6WMvrg1hJoabVu2ngwn2HEN8hdwC7RO4J1Ktss5wKvFchitytl0y7R/RFReBeOIr8IGtEk5vkuWE+U75JgwVUKL12bFr9OTjxee9h74QKBgQCxSMXXKfIvGWPenM+FREn72ent6sJT+It3yh97B763JPgMwpiX57Ez9MHS5iNgkXicG6fTfKLN8fH7Xhw49wFhuctHp5DAgsK6NQqd1CfhxQ8NhTK7mZvuVXkpFS3RCQaZiGns/W2zavzW87UKeNjqLi7iC2ufKJG3Rju49EoXvQKBgQCZTryCwR4I9HYnZ/xS4AnOuUGPaOXdtCD0YQMwiEK+4k8uHd7tKQkC3q4IRqRNv5cd1Jt7+tCYt/57YcAJdPz3hkiLRVGgo9rrtO3QQbSit8Y1eH7tsxcT7y+jgkPObzU+Xr0tdOOwRozKssH2qn9dds8SSNN7hXLxUkYM8LJIew=='),('49eb47cd-8809-4f2a-ac61-df51fccb7632','dfe20bdb-2a3d-4b61-be44-199e2055a25c','allowed-protocol-mapper-types','oidc-sha256-pairwise-sub-mapper'),('4c5cc8b1-99fb-4a6e-883d-cfc2b8321602','7a80c54c-d80e-4bdf-a8c2-24ecea6bad44','kid','5d4a0dbc-756f-4339-bebe-ea2461763029'),('5a68aba6-664d-4d0e-aaed-c1a1f7e0d2cc','1c925155-7d98-4bb8-8efe-768d29290baa','priority','100'),('6102fc6e-7de2-454c-aec1-8696c7f8560a','165a3054-3dbf-4c3b-a73d-9a718b4e7aa1','priority','100'),('61f7e9e7-e9ca-43e5-b09e-87762240edcf','f02c0162-670c-458d-944b-89754ffb93ab','allowed-protocol-mapper-types','oidc-address-mapper'),('68877034-0811-4b34-9703-909f6737580b','abe2e50a-1ba1-43ba-96e6-e1169f678dd5','allowed-protocol-mapper-types','oidc-usermodel-property-mapper'),('6a396f62-6ea0-42b9-b06b-a4d390be0a3b','1fbd78f8-9921-47c5-b410-e9d890459150','priority','100'),('6fc2ca6d-2a90-4851-bf96-3f2d169d9db3','abe2e50a-1ba1-43ba-96e6-e1169f678dd5','allowed-protocol-mapper-types','oidc-usermodel-attribute-mapper'),('6ff61b3e-38f7-4100-be47-18f3b595ee68','d4dbdc51-a8b3-4a55-b541-3670f4759ad4','allow-default-scopes','true'),('772cee9c-ac2c-48a1-8156-d9ee263de316','c2830c7c-f9f9-4d9f-a6e7-d2a879bd13ad','certificate','MIICmzCCAYMCBgGLKx3fFzANBgkqhkiG9w0BAQsFADARMQ8wDQYDVQQDDAZtYXN0ZXIwHhcNMjMxMDEzMjIxNTU5WhcNMzMxMDEzMjIxNzM5WjARMQ8wDQYDVQQDDAZtYXN0ZXIwggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQCz0a0LJw9cqy/jNCRgjAFBOid7DxjT9o95Q0DucT3wkVh1NLewKoGf3SE4stuRvRYO2gFM1qafd6wch991JsWt0wUdgom7FrGHYLmC+j0K5KtrClzvUd8R/Ha/ltMCDBZ8F5RuZW7n7IKpmMy6P2J5fbLXxyBsQfpj+KAfJTrLDDSTpE1BBPtqy5YAr4t7m1Xib8a9+Ecm+HlqKMUELhv6HbOchD9+LkHvXIUsLy7AyIhRdIjEXijC1Wn3BOH6KLdV5SyIWKbMp2Yz+cQ8yovpTe80Ig1mJda3QSiIuBErQe15eSOwWY1c7sTQWPZru9WXU+yseuo4XPG28zFCXv7XAgMBAAEwDQYJKoZIhvcNAQELBQADggEBAAastNVJnCi9YI2c93OCwYEVB20cNjVAAMBmHjk/CaOXHdPGt0naQOguqRU5y/91s+IAOPYpbIwYyL58XE/X7NQRN9Q5zuWwTT4v8oMjlEhBQP7kfVMrv0G06ScKB9mUg0WinKy4zi2iQ89VeWpNga9CfD346tavzf52n9yT3bnWTsc2dsLfwmdnpfKHVty/0bZho3yhpGifRnH5mL/mn982zETkN4L69Cldgwhyns8o0qJRwUdpXDpiNMAHb6EY8tOZqUWfAWXwOI/Hx4m9zn2e3wozmAAo57Fn3Z/gaWZ57gjshfO/lxE/z88mHuZSd549Y/FU+Y4pEDG5rsl3guM='),('774bae11-c14e-4bd2-8259-e6ecf43a6291','eae56343-fd6c-4c09-9417-a493a1edeeb9','allowed-protocol-mapper-types','saml-user-property-mapper'),('7de59375-833e-4a0b-8724-fc7813ed7ac9','47632033-481b-4202-b521-8ba882e8aa4b','max-clients','200'),('83c2cb1c-1ac7-4ef6-8f29-357257fb72c6','5f58b1ab-38e2-4971-b045-4a9e54f20cf6','allow-default-scopes','true'),('8571be91-2970-43ea-a525-c60d2f286ea2','3efe53a7-9524-4372-87ff-b837bbcfa849','keyUse','SIG'),('88841c75-d221-470f-b10e-fdd183cc601c','f02c0162-670c-458d-944b-89754ffb93ab','allowed-protocol-mapper-types','oidc-sha256-pairwise-sub-mapper'),('90102e8a-6fbc-45a2-a1f2-9c226e31cdd2','abe2e50a-1ba1-43ba-96e6-e1169f678dd5','allowed-protocol-mapper-types','oidc-address-mapper'),('9de42084-6f41-46f3-8ccd-fea988d3e610','02392181-37b1-4585-92e0-36ca38e49e25','client-uris-must-match','true'),('9f7b8297-d1c7-40f0-92b7-e7316bbeb2c3','b4d08d53-ca4c-4e1a-9af4-8f710523b3e2','priority','100'),('a174b8f4-2579-4159-8469-d6356e509554','ff50f54c-8922-4c5a-b423-23d5a9f02cf4','allow-default-scopes','true'),('a278e1ad-c393-4a4a-b31f-a88f3c5f05bf','39788ce2-3993-49ec-905f-9a51ac57955e','secret','MPK2P2WRkIv0wJXH2-oHbFR0WNtPYrNzlMG9tljzBv1sF5r0ou_LrQryR-5yWhypU3sch1HuFnMcV0iSQiZvUA'),('a47f456f-32e1-457e-b1d9-3dfce75f6887','1fbd78f8-9921-47c5-b410-e9d890459150','secret','7G2Xm2kHIh1ulJn6_PnWhA'),('a531e592-230d-47f6-b560-e02626eedd1c','abe2e50a-1ba1-43ba-96e6-e1169f678dd5','allowed-protocol-mapper-types','oidc-full-name-mapper'),('a8c66865-ba12-4a7c-88b0-24874d1a9245','dfe20bdb-2a3d-4b61-be44-199e2055a25c','allowed-protocol-mapper-types','oidc-usermodel-attribute-mapper'),('aebd6553-7050-48a8-9e9b-83346a0a70af','1c925155-7d98-4bb8-8efe-768d29290baa','certificate','MIICrTCCAZUCBgGLKyhvXjANBgkqhkiG9w0BAQsFADAaMRgwFgYDVQQDDA9iaWxsaW5nLXNlcnZpY2UwHhcNMjMxMDEzMjIyNzMyWhcNMzMxMDEzMjIyOTEyWjAaMRgwFgYDVQQDDA9iaWxsaW5nLXNlcnZpY2UwggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQC9LD1SrZ6dSK4xcVwrth7XghjTmJXgxnTFGuLggdG626k++1H6wsbhdwp0VeQPdDSbqO7sb1IhFCuYTmTGtEUe4mEfSoBIXY7VqiHCXfxUPKi2qMVqSrRR73NdZFB1rdgPoTOOdknPNOWvBpt2SNf6yENBUfH3bh7WBfkJlE04mSRt3XPBZ4Jcj8I2PywfL4J0rMPvtPrkm4fQv1c7SPJYhuwubwT/i0f/shm5OWAhZkBSyiokGzKO56PBoEOBcNOCbWCtVSI3ajd3lwD3qk5QFNzufbJ6XqtPqFOy8K9797/dNDqRmGnKq8b1nnCp5Bf3IDCMCvkiwG3aoUn1iVj5AgMBAAEwDQYJKoZIhvcNAQELBQADggEBABXgQH886KPeFlWGNsByGOHOMb6uj6erYgC3TJyYFM/7N4kEKdVlEFrtKWkp9IWyaAvDBcxQCmRM8SjxIAT72ttVuvkEjfxIIDJuD6AHZYLyEMn0Auy9CLTCm/5qQ78aR8DnvaowgvAIiWMIiOV1MLlVd0BausJriA7mX+Y6vQjlZUIE1Vtpgo3NiCSFksR7zgXrrDE8UpH5MgtnCHrZ2ygqjnqduHR8bBoW9GMfp6O/h6LODXrKc2TQsq0ay48yL9uDzQCNlZ61LWGgeQkmlUn98p3wXPWAG/vX9ynmtPe4uY0UuWzGrRBjwB+dlyyLFkCwgJLe8ZguQ193f7ThS1M='),('b08f15a6-8fb6-4dad-9850-1ade9d7e3be5','e503a7e5-930e-4e58-9d71-f70bd8639ffc','host-sending-registration-request-must-match','true'),('b261a2fc-3a77-4f16-b71c-455befd4ff7a','f02c0162-670c-458d-944b-89754ffb93ab','allowed-protocol-mapper-types','saml-user-property-mapper'),('b276df6c-1810-4bf7-a656-6c6bfa753d47','eae56343-fd6c-4c09-9417-a493a1edeeb9','allowed-protocol-mapper-types','oidc-address-mapper'),('b397b4f9-a0a9-419d-80bc-bd258485ce36','b4d08d53-ca4c-4e1a-9af4-8f710523b3e2','algorithm','HS256'),('b91313ab-d7fe-472d-a306-1063daab5ff1','abe2e50a-1ba1-43ba-96e6-e1169f678dd5','allowed-protocol-mapper-types','saml-user-attribute-mapper'),('bbf587e3-6350-4491-8840-509667ac27ef','c2830c7c-f9f9-4d9f-a6e7-d2a879bd13ad','algorithm','RSA-OAEP'),('c3ec0a32-5f03-4450-b637-0b2268327bf0','eae56343-fd6c-4c09-9417-a493a1edeeb9','allowed-protocol-mapper-types','oidc-sha256-pairwise-sub-mapper'),('c45f3e62-6c17-499c-be9e-7149ed31046b','39788ce2-3993-49ec-905f-9a51ac57955e','kid','c8d5503a-a1a9-4e2f-8e50-f23d8cb011ba'),('ca9f372b-be55-48bc-a2c8-abaf765ab064','dfe20bdb-2a3d-4b61-be44-199e2055a25c','allowed-protocol-mapper-types','saml-user-attribute-mapper'),('d2054e1c-0489-47b8-b6eb-e95c0ec43931','b4d08d53-ca4c-4e1a-9af4-8f710523b3e2','kid','ba2242b6-0e12-4a31-9f24-c13769729ea4'),('d893e4e5-2495-4dd1-8a01-fc38b6566798','abe2e50a-1ba1-43ba-96e6-e1169f678dd5','allowed-protocol-mapper-types','oidc-sha256-pairwise-sub-mapper'),('d9faad01-a748-4bee-b7c8-7838eae83f02','dfe20bdb-2a3d-4b61-be44-199e2055a25c','allowed-protocol-mapper-types','oidc-usermodel-property-mapper'),('df258980-0375-4e37-9f70-1abd2607ac81','c2830c7c-f9f9-4d9f-a6e7-d2a879bd13ad','keyUse','ENC'),('e054e338-db99-4e7b-9ac0-dda3a03295f5','f02c0162-670c-458d-944b-89754ffb93ab','allowed-protocol-mapper-types','oidc-usermodel-property-mapper'),('e0d54418-bcad-4eba-b549-349e01d371ca','dfe20bdb-2a3d-4b61-be44-199e2055a25c','allowed-protocol-mapper-types','saml-user-property-mapper'),('e3ea98aa-8f37-443f-909c-e11a16e3c02b','abe2e50a-1ba1-43ba-96e6-e1169f678dd5','allowed-protocol-mapper-types','saml-user-property-mapper'),('ebe5bf89-dc38-4ef0-a179-b6e359ea808a','88e3f8c5-61ef-4145-867d-e5581d38a40c','allow-default-scopes','true'),('ef626966-49d4-490a-80dc-5c077a5d97aa','c2830c7c-f9f9-4d9f-a6e7-d2a879bd13ad','privateKey','MIIEowIBAAKCAQEAs9GtCycPXKsv4zQkYIwBQTonew8Y0/aPeUNA7nE98JFYdTS3sCqBn90hOLLbkb0WDtoBTNamn3esHIffdSbFrdMFHYKJuxaxh2C5gvo9CuSrawpc71HfEfx2v5bTAgwWfBeUbmVu5+yCqZjMuj9ieX2y18cgbEH6Y/igHyU6yww0k6RNQQT7asuWAK+Le5tV4m/GvfhHJvh5aijFBC4b+h2znIQ/fi5B71yFLC8uwMiIUXSIxF4owtVp9wTh+ii3VeUsiFimzKdmM/nEPMqL6U3vNCINZiXWt0EoiLgRK0HteXkjsFmNXO7E0Fj2a7vVl1PsrHrqOFzxtvMxQl7+1wIDAQABAoIBABH++SlQEpasyovxAyD8cgBepbvdl20DKc8Hft8+IGZL4tqcA4l9v4pJvaeTKCv44f/A1qIjgKUd+3DBh7Ni8CQE0JK9poi9l9fGGNrLA21B1Fv6kLF3c/KKCIevvFS3SVAdpgJkZAnm9BlYDEkpdcgAifOpXzfRDzzjvCv8dFqvUOc0vL/J2bz2oJ+7INeBUYNL4/9DhiEpdfAQaFXOyqAMaHAj/WSiWElx21x489PRfCbhjFvVCiSDeFi51XCRJ7LVCeyH8fsMroYXK4z+e/yiqy+37GL10X+8QN+qj/9q/kljBLBE2CiLH+UAjbTA8DAjXNS2IibfrVA5fcKlNXUCgYEA2o/qTQgJU2ddvlC/v/ENm76geCaJGi9bf+KRXjpPxM5yynrtv32PugMXJYAEjcwhqViRlTPtzNiG+ea4YIagAb/g7KkT+8/t1FleKQfBOhh5rxAqoNpNh/r9++Q2VrId1JZGZf71XxT53ZIzEgTwUIQq6BSI0e1PgruB0z/IPf0CgYEA0p7Z4nx4h42Xm/E7l1GPxop1nv10cUp0IzbSdbj+2zGcsoFE/qknXWgQ9lO95tmn7rhXJRSDCwOldqv84BLZhr4NsQwZz6Gekfkxv29SYxHFa0mboZgqEsL8RrZQZJXk+b7DeQTkHYWBKIYzroATPf7tUHEIaBlVTxWdTdiG/mMCgYEAp39db3V2OC3iYMTffsjMxgv8TLgzoBalB8fp4g3MLiaNQHGfHH6slEBkD8AhPU4wieivgWnPl4plPsU7jfX+T/jt9lDJWNUMDg4DJGyl/9DcCHbaRHWor0qCNPW7Uwuj4tTb1LTk9N5Ncynk661PQlVX0I5UIJW+tpDeuLeLzT0CgYBnYjPfOWvMVdMqZ5Hxp8ZkFUjA/vYuOfah5mIOCP2ISGT7NfrQ6eT5s4BH+TkI3KPSyMd12wir2mFYy/k3X+lIe3erBR6STWnRizlBF3qgSHPYQuxSuKdGSFGewBTcGrunX10BxUXXu9V3N9Ccgh9v2fdQ+fq/Zlf6lsh9EqDIswKBgFzIxZ2lkX4eRTNAWpuVr7IVfHqpED6aTBO7OIhfjrUaKIZ4cLGHntPf7b5UkL6WA8s5TAmotil7GmMLOgyZifwGM21iXyIZvGHiMXyWptVAaGNOlHckrc0FWSajSbiGLbRp8NltJPpWW92/XfKrY2pdKBY7NxqjlyuHvYesrnIL'),('f1e4d0ef-b7d8-4d1f-a066-fb88d68acfb4','1c925155-7d98-4bb8-8efe-768d29290baa','keyUse','ENC'),('f2b87fce-dcb6-4702-9f59-eb628ac8f7e3','eae56343-fd6c-4c09-9417-a493a1edeeb9','allowed-protocol-mapper-types','saml-user-attribute-mapper'),('fb36c122-2cc9-40d1-a7c6-9f9f29099a36','f02c0162-670c-458d-944b-89754ffb93ab','allowed-protocol-mapper-types','oidc-usermodel-attribute-mapper'),('fce4e595-660a-40a9-a3cc-18c4e3f09089','eae56343-fd6c-4c09-9417-a493a1edeeb9','allowed-protocol-mapper-types','saml-role-list-mapper'),('fd614a57-193c-4e80-9d6a-35cab891d2af','eae56343-fd6c-4c09-9417-a493a1edeeb9','allowed-protocol-mapper-types','oidc-full-name-mapper'),('fe4feebb-2926-46b7-88a3-91a24f6c4ef5','f02c0162-670c-458d-944b-89754ffb93ab','allowed-protocol-mapper-types','oidc-full-name-mapper'),('fec6ae59-6d1a-445e-b574-c6da987e6baa','b4d08d53-ca4c-4e1a-9af4-8f710523b3e2','secret','8AkfLyGUN_frRmHsH2dESDIgKxGgWjnGIp6Ytzk4taxMzASlwR8UaFHzmjIslJgS0NAxH529Ql8hy8uCH61vLg'),('ffbea02f-b5e4-4449-8476-d45bc198aed6','f02c0162-670c-458d-944b-89754ffb93ab','allowed-protocol-mapper-types','saml-role-list-mapper');
/*!40000 ALTER TABLE `COMPONENT_CONFIG` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `COMPOSITE_ROLE`
--

DROP TABLE IF EXISTS `COMPOSITE_ROLE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `COMPOSITE_ROLE` (
  `COMPOSITE` varchar(36) NOT NULL,
  `CHILD_ROLE` varchar(36) NOT NULL,
  PRIMARY KEY (`COMPOSITE`,`CHILD_ROLE`),
  KEY `IDX_COMPOSITE` (`COMPOSITE`),
  KEY `IDX_COMPOSITE_CHILD` (`CHILD_ROLE`),
  CONSTRAINT `FK_A63WVEKFTU8JO1PNJ81E7MCE2` FOREIGN KEY (`COMPOSITE`) REFERENCES `KEYCLOAK_ROLE` (`ID`),
  CONSTRAINT `FK_GR7THLLB9LU8Q4VQA4524JJY8` FOREIGN KEY (`CHILD_ROLE`) REFERENCES `KEYCLOAK_ROLE` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `COMPOSITE_ROLE`
--

LOCK TABLES `COMPOSITE_ROLE` WRITE;
/*!40000 ALTER TABLE `COMPOSITE_ROLE` DISABLE KEYS */;
INSERT INTO `COMPOSITE_ROLE` VALUES ('02a52401-7887-43eb-900e-81c5fe6d8a19','e705c105-9ddf-45b4-9778-36139c2b87ad'),('02a52401-7887-43eb-900e-81c5fe6d8a19','f025aed3-349b-4e05-8f09-7c16c00bfaff'),('0e7aaf6e-7ba7-48fa-b683-ac6393559aca','9d1640e8-e2f7-44d3-b888-ed3aad80307e'),('16a07c63-8b66-4f86-866d-ffdc840b5dad','8c78fdc4-2f58-412c-bb2a-5bcf4577691a'),('1aebcecf-8adc-4e69-b485-80f21fc1093c','02a52401-7887-43eb-900e-81c5fe6d8a19'),('1aebcecf-8adc-4e69-b485-80f21fc1093c','08bfc845-6807-4865-ac1c-01059360b513'),('1aebcecf-8adc-4e69-b485-80f21fc1093c','1f419206-0405-4aa9-a36a-aa4dcb5a4315'),('1aebcecf-8adc-4e69-b485-80f21fc1093c','231c6c50-86bb-4b07-af47-c671e0d45ce7'),('1aebcecf-8adc-4e69-b485-80f21fc1093c','27961cb3-7976-42da-b626-e13437575689'),('1aebcecf-8adc-4e69-b485-80f21fc1093c','29d2aa2d-87cc-4764-bfc5-598e62b92455'),('1aebcecf-8adc-4e69-b485-80f21fc1093c','2fc80fec-7f34-4494-936c-dbdb2b575007'),('1aebcecf-8adc-4e69-b485-80f21fc1093c','3377a0ba-bd3a-42d2-aa3b-8a159052b928'),('1aebcecf-8adc-4e69-b485-80f21fc1093c','3cd86926-2dfa-4d9d-8b8c-12d58d567819'),('1aebcecf-8adc-4e69-b485-80f21fc1093c','498a43ea-2981-41ef-a542-b50ee1a33057'),('1aebcecf-8adc-4e69-b485-80f21fc1093c','4d37f56c-202e-4daa-a6ae-84a41e81487d'),('1aebcecf-8adc-4e69-b485-80f21fc1093c','510b6b27-d5d8-4868-9bf4-856f1d3a33db'),('1aebcecf-8adc-4e69-b485-80f21fc1093c','589ded18-9374-4bca-8802-ec091049947f'),('1aebcecf-8adc-4e69-b485-80f21fc1093c','64efea4e-8e9c-443b-a32f-76b4047e81a1'),('1aebcecf-8adc-4e69-b485-80f21fc1093c','70110785-3ff0-4835-8b7f-e05d5f9edef4'),('1aebcecf-8adc-4e69-b485-80f21fc1093c','74600cd0-4706-47f2-bee7-1ecd1111ff01'),('1aebcecf-8adc-4e69-b485-80f21fc1093c','76c45d4b-57b0-432e-a76a-02ff39ec8540'),('1aebcecf-8adc-4e69-b485-80f21fc1093c','76d5f9c5-4c03-48bb-9419-a54229470319'),('1aebcecf-8adc-4e69-b485-80f21fc1093c','8e50fcf0-e2ac-421f-8c05-fa0dbc3ba1fd'),('1aebcecf-8adc-4e69-b485-80f21fc1093c','953db61f-7a2a-4dd9-8f06-06b33c77e162'),('1aebcecf-8adc-4e69-b485-80f21fc1093c','98fd112d-d3ea-4d48-86aa-b325056e853b'),('1aebcecf-8adc-4e69-b485-80f21fc1093c','9e7256ec-fc97-44b2-bba6-b1bd7cc82d1f'),('1aebcecf-8adc-4e69-b485-80f21fc1093c','a3b008f6-db35-4ec6-977d-d7d851eb99a9'),('1aebcecf-8adc-4e69-b485-80f21fc1093c','ad072a87-c1ad-4cc0-ad09-c0227e6decd6'),('1aebcecf-8adc-4e69-b485-80f21fc1093c','ad58efd3-b9e5-4389-9ec3-c764b7a3c2eb'),('1aebcecf-8adc-4e69-b485-80f21fc1093c','afdea75b-0853-49e7-bc05-2e8e54963680'),('1aebcecf-8adc-4e69-b485-80f21fc1093c','b0c8566b-dc6e-4f50-95b1-7eaeb52cacf6'),('1aebcecf-8adc-4e69-b485-80f21fc1093c','ca362fea-4d07-4a1c-8914-a6af3d0ceeed'),('1aebcecf-8adc-4e69-b485-80f21fc1093c','cf02a5de-d478-4b23-835f-dd10fd07f793'),('1aebcecf-8adc-4e69-b485-80f21fc1093c','e024f4ce-6c3c-45c0-bb7a-7ff831a3f268'),('1aebcecf-8adc-4e69-b485-80f21fc1093c','e63bc050-dd07-42be-ab6d-413e109cca92'),('1aebcecf-8adc-4e69-b485-80f21fc1093c','e705c105-9ddf-45b4-9778-36139c2b87ad'),('1aebcecf-8adc-4e69-b485-80f21fc1093c','ea20c9d5-1a63-4691-990e-396e47a048d1'),('1aebcecf-8adc-4e69-b485-80f21fc1093c','f025aed3-349b-4e05-8f09-7c16c00bfaff'),('1aebcecf-8adc-4e69-b485-80f21fc1093c','fa2d3739-63e1-45e8-9316-6b24ade15c0f'),('1aebcecf-8adc-4e69-b485-80f21fc1093c','fe50b5b8-60be-4a4a-8a04-dd9d813a71df'),('1aebcecf-8adc-4e69-b485-80f21fc1093c','feea1873-64e9-4c8d-a97d-7edaaee40604'),('3f568f86-118e-4a41-b7b0-b2e9f08eb369','358962ff-267f-4aa9-ab39-f5bcce8453cd'),('42f7d461-4ddf-4f0b-adc8-2e6d82e5d1c2','4b87c334-1622-4cab-af09-e3652df7258d'),('42f7d461-4ddf-4f0b-adc8-2e6d82e5d1c2','ee411137-dde1-496b-961b-206db2196dc4'),('498a43ea-2981-41ef-a542-b50ee1a33057','3377a0ba-bd3a-42d2-aa3b-8a159052b928'),('498a43ea-2981-41ef-a542-b50ee1a33057','fe50b5b8-60be-4a4a-8a04-dd9d813a71df'),('80f75133-d515-4a55-999d-1be78bc3bdd1','0e7aaf6e-7ba7-48fa-b683-ac6393559aca'),('80f75133-d515-4a55-999d-1be78bc3bdd1','1b848569-d933-4fbf-ab0f-6d497f5c43df'),('80f75133-d515-4a55-999d-1be78bc3bdd1','218a01f9-818e-4b4e-82ae-69fa82663ddf'),('80f75133-d515-4a55-999d-1be78bc3bdd1','29549b30-20b7-4a8b-95a0-3e9725c1a7fd'),('80f75133-d515-4a55-999d-1be78bc3bdd1','2ac21b0a-8867-4b25-858a-a2abc9d74ebc'),('80f75133-d515-4a55-999d-1be78bc3bdd1','3adfd9a9-1bd7-405c-a650-c216f6cecc6c'),('80f75133-d515-4a55-999d-1be78bc3bdd1','42f7d461-4ddf-4f0b-adc8-2e6d82e5d1c2'),('80f75133-d515-4a55-999d-1be78bc3bdd1','4433dc8e-05c5-47c5-a6ac-83b53fbfb750'),('80f75133-d515-4a55-999d-1be78bc3bdd1','4b87c334-1622-4cab-af09-e3652df7258d'),('80f75133-d515-4a55-999d-1be78bc3bdd1','7c7bbe86-4b2b-4ab3-8c9f-c4500f108846'),('80f75133-d515-4a55-999d-1be78bc3bdd1','88666123-5ae1-4ab8-a8f4-1a5b81a779fc'),('80f75133-d515-4a55-999d-1be78bc3bdd1','8c21c63b-350e-4cd4-87b2-af41efd09c0e'),('80f75133-d515-4a55-999d-1be78bc3bdd1','9583c292-b2f9-443b-bc69-3b597c8125f2'),('80f75133-d515-4a55-999d-1be78bc3bdd1','9d1640e8-e2f7-44d3-b888-ed3aad80307e'),('80f75133-d515-4a55-999d-1be78bc3bdd1','b98f1086-8a7b-43c2-93c2-303726f6032a'),('80f75133-d515-4a55-999d-1be78bc3bdd1','c5576523-182e-4024-85a9-a1199c837554'),('80f75133-d515-4a55-999d-1be78bc3bdd1','e2992291-8a66-48c2-86a9-51bed3d7d01f'),('80f75133-d515-4a55-999d-1be78bc3bdd1','ee411137-dde1-496b-961b-206db2196dc4'),('8e50fcf0-e2ac-421f-8c05-fa0dbc3ba1fd','64efea4e-8e9c-443b-a32f-76b4047e81a1'),('9375436b-7e42-4484-a503-a5d355dcec8e','d0182e1b-8dfa-4fd7-9b55-df46c0374912'),('97ce3eee-e496-453f-ad2f-93b8b5f8e5c5','5890f655-0adf-461d-ae9d-63bcfa5531ae'),('9e7256ec-fc97-44b2-bba6-b1bd7cc82d1f','ea20c9d5-1a63-4691-990e-396e47a048d1'),('a3fb3bf9-938e-4ddb-8f63-ecb065153108','139ba057-78c8-4f37-86ee-be2d8d2566a3'),('a3fb3bf9-938e-4ddb-8f63-ecb065153108','16a07c63-8b66-4f86-866d-ffdc840b5dad'),('a3fb3bf9-938e-4ddb-8f63-ecb065153108','44802841-7c2b-48da-9587-432036397679'),('a3fb3bf9-938e-4ddb-8f63-ecb065153108','ce1b5d0c-cc6f-4332-8520-47f82319c708'),('abdf18ec-fb43-4dd4-9048-9a5f31898481','26b3acc0-1f1b-4267-bf16-d9634640b921'),('abdf18ec-fb43-4dd4-9048-9a5f31898481','3cb8422d-5b17-4797-9207-14eb5dfa2705'),('abdf18ec-fb43-4dd4-9048-9a5f31898481','3f568f86-118e-4a41-b7b0-b2e9f08eb369'),('abdf18ec-fb43-4dd4-9048-9a5f31898481','b72d25c0-1c76-4af0-9786-60606b29dde3');
/*!40000 ALTER TABLE `COMPOSITE_ROLE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CREDENTIAL`
--

DROP TABLE IF EXISTS `CREDENTIAL`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CREDENTIAL` (
  `ID` varchar(36) NOT NULL,
  `SALT` tinyblob,
  `TYPE` varchar(255) DEFAULT NULL,
  `USER_ID` varchar(36) DEFAULT NULL,
  `CREATED_DATE` bigint DEFAULT NULL,
  `USER_LABEL` varchar(255) DEFAULT NULL,
  `SECRET_DATA` longtext,
  `CREDENTIAL_DATA` longtext,
  `PRIORITY` int DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_USER_CREDENTIAL` (`USER_ID`),
  CONSTRAINT `FK_PFYR0GLASQYL0DEI3KL69R6V0` FOREIGN KEY (`USER_ID`) REFERENCES `USER_ENTITY` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CREDENTIAL`
--

LOCK TABLES `CREDENTIAL` WRITE;
/*!40000 ALTER TABLE `CREDENTIAL` DISABLE KEYS */;
INSERT INTO `CREDENTIAL` VALUES ('d62daece-a8dd-46ca-b0a5-d0be41232d08',NULL,'password','48ca83ea-b6ac-4048-86d7-f38f4708a617',1697235473332,NULL,'{\"value\":\"RkmabnLP728vaov+HLQFm+QnbVmbn5I1/kelMcwsbdk=\",\"salt\":\"XlEcs48kSL3GDF23RGBYPA==\",\"additionalParameters\":{}}','{\"hashIterations\":27500,\"algorithm\":\"pbkdf2-sha256\",\"additionalParameters\":{}}',10),('dff70dcf-cd2d-449f-99c9-86d0e21a4bea',NULL,'password','77f56787-1ab9-46e6-95fc-d9df794d8e13',1697384901099,NULL,'{\"value\":\"To6+4k4MstYgbrSN2rB9chkvaRHLtca8+URW+c4R0d0=\",\"salt\":\"BlPZ1OqHz7IpgHZR+Rq/MQ==\",\"additionalParameters\":{}}','{\"hashIterations\":27500,\"algorithm\":\"pbkdf2-sha256\",\"additionalParameters\":{}}',10);
/*!40000 ALTER TABLE `CREDENTIAL` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `DATABASECHANGELOG`
--

DROP TABLE IF EXISTS `DATABASECHANGELOG`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `DATABASECHANGELOG` (
  `ID` varchar(255) NOT NULL,
  `AUTHOR` varchar(255) NOT NULL,
  `FILENAME` varchar(255) NOT NULL,
  `DATEEXECUTED` datetime NOT NULL,
  `ORDEREXECUTED` int NOT NULL,
  `EXECTYPE` varchar(10) NOT NULL,
  `MD5SUM` varchar(35) DEFAULT NULL,
  `DESCRIPTION` varchar(255) DEFAULT NULL,
  `COMMENTS` varchar(255) DEFAULT NULL,
  `TAG` varchar(255) DEFAULT NULL,
  `LIQUIBASE` varchar(20) DEFAULT NULL,
  `CONTEXTS` varchar(255) DEFAULT NULL,
  `LABELS` varchar(255) DEFAULT NULL,
  `DEPLOYMENT_ID` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DATABASECHANGELOG`
--

LOCK TABLES `DATABASECHANGELOG` WRITE;
/*!40000 ALTER TABLE `DATABASECHANGELOG` DISABLE KEYS */;
INSERT INTO `DATABASECHANGELOG` VALUES ('1.0.0.Final-KEYCLOAK-5461','sthorger@redhat.com','META-INF/jpa-changelog-1.0.0.Final.xml','2023-10-13 22:17:20',1,'EXECUTED','8:bda77d94bf90182a1e30c24f1c155ec7','createTable tableName=APPLICATION_DEFAULT_ROLES; createTable tableName=CLIENT; createTable tableName=CLIENT_SESSION; createTable tableName=CLIENT_SESSION_ROLE; createTable tableName=COMPOSITE_ROLE; createTable tableName=CREDENTIAL; createTable tab...','',NULL,'4.20.0',NULL,NULL,'7235437661'),('1.0.0.Final-KEYCLOAK-5461','sthorger@redhat.com','META-INF/db2-jpa-changelog-1.0.0.Final.xml','2023-10-13 22:17:20',2,'MARK_RAN','8:1ecb330f30986693d1cba9ab579fa219','createTable tableName=APPLICATION_DEFAULT_ROLES; createTable tableName=CLIENT; createTable tableName=CLIENT_SESSION; createTable tableName=CLIENT_SESSION_ROLE; createTable tableName=COMPOSITE_ROLE; createTable tableName=CREDENTIAL; createTable tab...','',NULL,'4.20.0',NULL,NULL,'7235437661'),('1.1.0.Beta1','sthorger@redhat.com','META-INF/jpa-changelog-1.1.0.Beta1.xml','2023-10-13 22:17:20',3,'EXECUTED','8:cb7ace19bc6d959f305605d255d4c843','delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION; createTable tableName=CLIENT_ATTRIBUTES; createTable tableName=CLIENT_SESSION_NOTE; createTable tableName=APP_NODE_REGISTRATIONS; addColumn table...','',NULL,'4.20.0',NULL,NULL,'7235437661'),('1.1.0.Final','sthorger@redhat.com','META-INF/jpa-changelog-1.1.0.Final.xml','2023-10-13 22:17:20',4,'EXECUTED','8:80230013e961310e6872e871be424a63','renameColumn newColumnName=EVENT_TIME, oldColumnName=TIME, tableName=EVENT_ENTITY','',NULL,'4.20.0',NULL,NULL,'7235437661'),('1.2.0.Beta1','psilva@redhat.com','META-INF/jpa-changelog-1.2.0.Beta1.xml','2023-10-13 22:17:21',5,'EXECUTED','8:67f4c20929126adc0c8e9bf48279d244','delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION; createTable tableName=PROTOCOL_MAPPER; createTable tableName=PROTOCOL_MAPPER_CONFIG; createTable tableName=...','',NULL,'4.20.0',NULL,NULL,'7235437661'),('1.2.0.Beta1','psilva@redhat.com','META-INF/db2-jpa-changelog-1.2.0.Beta1.xml','2023-10-13 22:17:21',6,'MARK_RAN','8:7311018b0b8179ce14628ab412bb6783','delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION; createTable tableName=PROTOCOL_MAPPER; createTable tableName=PROTOCOL_MAPPER_CONFIG; createTable tableName=...','',NULL,'4.20.0',NULL,NULL,'7235437661'),('1.2.0.RC1','bburke@redhat.com','META-INF/jpa-changelog-1.2.0.CR1.xml','2023-10-13 22:17:22',7,'EXECUTED','8:037ba1216c3640f8785ee6b8e7c8e3c1','delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete tableName=USER_SESSION; createTable tableName=MIGRATION_MODEL; createTable tableName=IDENTITY_P...','',NULL,'4.20.0',NULL,NULL,'7235437661'),('1.2.0.RC1','bburke@redhat.com','META-INF/db2-jpa-changelog-1.2.0.CR1.xml','2023-10-13 22:17:22',8,'MARK_RAN','8:7fe6ffe4af4df289b3157de32c624263','delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete tableName=USER_SESSION; createTable tableName=MIGRATION_MODEL; createTable tableName=IDENTITY_P...','',NULL,'4.20.0',NULL,NULL,'7235437661'),('1.2.0.Final','keycloak','META-INF/jpa-changelog-1.2.0.Final.xml','2023-10-13 22:17:22',9,'EXECUTED','8:9c136bc3187083a98745c7d03bc8a303','update tableName=CLIENT; update tableName=CLIENT; update tableName=CLIENT','',NULL,'4.20.0',NULL,NULL,'7235437661'),('1.3.0','bburke@redhat.com','META-INF/jpa-changelog-1.3.0.xml','2023-10-13 22:17:24',10,'EXECUTED','8:b5f09474dca81fb56a97cf5b6553d331','delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_PROT_MAPPER; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete tableName=USER_SESSION; createTable tableName=ADMI...','',NULL,'4.20.0',NULL,NULL,'7235437661'),('1.4.0','bburke@redhat.com','META-INF/jpa-changelog-1.4.0.xml','2023-10-13 22:17:24',11,'EXECUTED','8:ca924f31bd2a3b219fdcfe78c82dacf4','delete tableName=CLIENT_SESSION_AUTH_STATUS; delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_PROT_MAPPER; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete table...','',NULL,'4.20.0',NULL,NULL,'7235437661'),('1.4.0','bburke@redhat.com','META-INF/db2-jpa-changelog-1.4.0.xml','2023-10-13 22:17:24',12,'MARK_RAN','8:8acad7483e106416bcfa6f3b824a16cd','delete tableName=CLIENT_SESSION_AUTH_STATUS; delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_PROT_MAPPER; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete table...','',NULL,'4.20.0',NULL,NULL,'7235437661'),('1.5.0','bburke@redhat.com','META-INF/jpa-changelog-1.5.0.xml','2023-10-13 22:17:24',13,'EXECUTED','8:9b1266d17f4f87c78226f5055408fd5e','delete tableName=CLIENT_SESSION_AUTH_STATUS; delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_PROT_MAPPER; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete table...','',NULL,'4.20.0',NULL,NULL,'7235437661'),('1.6.1_from15','mposolda@redhat.com','META-INF/jpa-changelog-1.6.1.xml','2023-10-13 22:17:24',14,'EXECUTED','8:d80ec4ab6dbfe573550ff72396c7e910','addColumn tableName=REALM; addColumn tableName=KEYCLOAK_ROLE; addColumn tableName=CLIENT; createTable tableName=OFFLINE_USER_SESSION; createTable tableName=OFFLINE_CLIENT_SESSION; addPrimaryKey constraintName=CONSTRAINT_OFFL_US_SES_PK2, tableName=...','',NULL,'4.20.0',NULL,NULL,'7235437661'),('1.6.1_from16-pre','mposolda@redhat.com','META-INF/jpa-changelog-1.6.1.xml','2023-10-13 22:17:24',15,'MARK_RAN','8:d86eb172171e7c20b9c849b584d147b2','delete tableName=OFFLINE_CLIENT_SESSION; delete tableName=OFFLINE_USER_SESSION','',NULL,'4.20.0',NULL,NULL,'7235437661'),('1.6.1_from16','mposolda@redhat.com','META-INF/jpa-changelog-1.6.1.xml','2023-10-13 22:17:24',16,'MARK_RAN','8:5735f46f0fa60689deb0ecdc2a0dea22','dropPrimaryKey constraintName=CONSTRAINT_OFFLINE_US_SES_PK, tableName=OFFLINE_USER_SESSION; dropPrimaryKey constraintName=CONSTRAINT_OFFLINE_CL_SES_PK, tableName=OFFLINE_CLIENT_SESSION; addColumn tableName=OFFLINE_USER_SESSION; update tableName=OF...','',NULL,'4.20.0',NULL,NULL,'7235437661'),('1.6.1','mposolda@redhat.com','META-INF/jpa-changelog-1.6.1.xml','2023-10-13 22:17:24',17,'EXECUTED','8:d41d8cd98f00b204e9800998ecf8427e','empty','',NULL,'4.20.0',NULL,NULL,'7235437661'),('1.7.0','bburke@redhat.com','META-INF/jpa-changelog-1.7.0.xml','2023-10-13 22:17:25',18,'EXECUTED','8:5c1a8fd2014ac7fc43b90a700f117b23','createTable tableName=KEYCLOAK_GROUP; createTable tableName=GROUP_ROLE_MAPPING; createTable tableName=GROUP_ATTRIBUTE; createTable tableName=USER_GROUP_MEMBERSHIP; createTable tableName=REALM_DEFAULT_GROUPS; addColumn tableName=IDENTITY_PROVIDER; ...','',NULL,'4.20.0',NULL,NULL,'7235437661'),('1.8.0','mposolda@redhat.com','META-INF/jpa-changelog-1.8.0.xml','2023-10-13 22:17:26',19,'EXECUTED','8:1f6c2c2dfc362aff4ed75b3f0ef6b331','addColumn tableName=IDENTITY_PROVIDER; createTable tableName=CLIENT_TEMPLATE; createTable tableName=CLIENT_TEMPLATE_ATTRIBUTES; createTable tableName=TEMPLATE_SCOPE_MAPPING; dropNotNullConstraint columnName=CLIENT_ID, tableName=PROTOCOL_MAPPER; ad...','',NULL,'4.20.0',NULL,NULL,'7235437661'),('1.8.0-2','keycloak','META-INF/jpa-changelog-1.8.0.xml','2023-10-13 22:17:26',20,'EXECUTED','8:dee9246280915712591f83a127665107','dropDefaultValue columnName=ALGORITHM, tableName=CREDENTIAL; update tableName=CREDENTIAL','',NULL,'4.20.0',NULL,NULL,'7235437661'),('1.8.0','mposolda@redhat.com','META-INF/db2-jpa-changelog-1.8.0.xml','2023-10-13 22:17:26',21,'MARK_RAN','8:9eb2ee1fa8ad1c5e426421a6f8fdfa6a','addColumn tableName=IDENTITY_PROVIDER; createTable tableName=CLIENT_TEMPLATE; createTable tableName=CLIENT_TEMPLATE_ATTRIBUTES; createTable tableName=TEMPLATE_SCOPE_MAPPING; dropNotNullConstraint columnName=CLIENT_ID, tableName=PROTOCOL_MAPPER; ad...','',NULL,'4.20.0',NULL,NULL,'7235437661'),('1.8.0-2','keycloak','META-INF/db2-jpa-changelog-1.8.0.xml','2023-10-13 22:17:26',22,'MARK_RAN','8:dee9246280915712591f83a127665107','dropDefaultValue columnName=ALGORITHM, tableName=CREDENTIAL; update tableName=CREDENTIAL','',NULL,'4.20.0',NULL,NULL,'7235437661'),('1.9.0','mposolda@redhat.com','META-INF/jpa-changelog-1.9.0.xml','2023-10-13 22:17:26',23,'EXECUTED','8:d9fa18ffa355320395b86270680dd4fe','update tableName=REALM; update tableName=REALM; update tableName=REALM; update tableName=REALM; update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=REALM; update tableName=REALM; customChange; dr...','',NULL,'4.20.0',NULL,NULL,'7235437661'),('1.9.1','keycloak','META-INF/jpa-changelog-1.9.1.xml','2023-10-13 22:17:26',24,'EXECUTED','8:90cff506fedb06141ffc1c71c4a1214c','modifyDataType columnName=PRIVATE_KEY, tableName=REALM; modifyDataType columnName=PUBLIC_KEY, tableName=REALM; modifyDataType columnName=CERTIFICATE, tableName=REALM','',NULL,'4.20.0',NULL,NULL,'7235437661'),('1.9.1','keycloak','META-INF/db2-jpa-changelog-1.9.1.xml','2023-10-13 22:17:26',25,'MARK_RAN','8:11a788aed4961d6d29c427c063af828c','modifyDataType columnName=PRIVATE_KEY, tableName=REALM; modifyDataType columnName=CERTIFICATE, tableName=REALM','',NULL,'4.20.0',NULL,NULL,'7235437661'),('1.9.2','keycloak','META-INF/jpa-changelog-1.9.2.xml','2023-10-13 22:17:26',26,'EXECUTED','8:a4218e51e1faf380518cce2af5d39b43','createIndex indexName=IDX_USER_EMAIL, tableName=USER_ENTITY; createIndex indexName=IDX_USER_ROLE_MAPPING, tableName=USER_ROLE_MAPPING; createIndex indexName=IDX_USER_GROUP_MAPPING, tableName=USER_GROUP_MEMBERSHIP; createIndex indexName=IDX_USER_CO...','',NULL,'4.20.0',NULL,NULL,'7235437661'),('authz-2.0.0','psilva@redhat.com','META-INF/jpa-changelog-authz-2.0.0.xml','2023-10-13 22:17:27',27,'EXECUTED','8:d9e9a1bfaa644da9952456050f07bbdc','createTable tableName=RESOURCE_SERVER; addPrimaryKey constraintName=CONSTRAINT_FARS, tableName=RESOURCE_SERVER; addUniqueConstraint constraintName=UK_AU8TT6T700S9V50BU18WS5HA6, tableName=RESOURCE_SERVER; createTable tableName=RESOURCE_SERVER_RESOU...','',NULL,'4.20.0',NULL,NULL,'7235437661'),('authz-2.5.1','psilva@redhat.com','META-INF/jpa-changelog-authz-2.5.1.xml','2023-10-13 22:17:27',28,'EXECUTED','8:d1bf991a6163c0acbfe664b615314505','update tableName=RESOURCE_SERVER_POLICY','',NULL,'4.20.0',NULL,NULL,'7235437661'),('2.1.0-KEYCLOAK-5461','bburke@redhat.com','META-INF/jpa-changelog-2.1.0.xml','2023-10-13 22:17:28',29,'EXECUTED','8:88a743a1e87ec5e30bf603da68058a8c','createTable tableName=BROKER_LINK; createTable tableName=FED_USER_ATTRIBUTE; createTable tableName=FED_USER_CONSENT; createTable tableName=FED_USER_CONSENT_ROLE; createTable tableName=FED_USER_CONSENT_PROT_MAPPER; createTable tableName=FED_USER_CR...','',NULL,'4.20.0',NULL,NULL,'7235437661'),('2.2.0','bburke@redhat.com','META-INF/jpa-changelog-2.2.0.xml','2023-10-13 22:17:28',30,'EXECUTED','8:c5517863c875d325dea463d00ec26d7a','addColumn tableName=ADMIN_EVENT_ENTITY; createTable tableName=CREDENTIAL_ATTRIBUTE; createTable tableName=FED_CREDENTIAL_ATTRIBUTE; modifyDataType columnName=VALUE, tableName=CREDENTIAL; addForeignKeyConstraint baseTableName=FED_CREDENTIAL_ATTRIBU...','',NULL,'4.20.0',NULL,NULL,'7235437661'),('2.3.0','bburke@redhat.com','META-INF/jpa-changelog-2.3.0.xml','2023-10-13 22:17:28',31,'EXECUTED','8:ada8b4833b74a498f376d7136bc7d327','createTable tableName=FEDERATED_USER; addPrimaryKey constraintName=CONSTR_FEDERATED_USER, tableName=FEDERATED_USER; dropDefaultValue columnName=TOTP, tableName=USER_ENTITY; dropColumn columnName=TOTP, tableName=USER_ENTITY; addColumn tableName=IDE...','',NULL,'4.20.0',NULL,NULL,'7235437661'),('2.4.0','bburke@redhat.com','META-INF/jpa-changelog-2.4.0.xml','2023-10-13 22:17:28',32,'EXECUTED','8:b9b73c8ea7299457f99fcbb825c263ba','customChange','',NULL,'4.20.0',NULL,NULL,'7235437661'),('2.5.0','bburke@redhat.com','META-INF/jpa-changelog-2.5.0.xml','2023-10-13 22:17:28',33,'EXECUTED','8:07724333e625ccfcfc5adc63d57314f3','customChange; modifyDataType columnName=USER_ID, tableName=OFFLINE_USER_SESSION','',NULL,'4.20.0',NULL,NULL,'7235437661'),('2.5.0-unicode-oracle','hmlnarik@redhat.com','META-INF/jpa-changelog-2.5.0.xml','2023-10-13 22:17:28',34,'MARK_RAN','8:8b6fd445958882efe55deb26fc541a7b','modifyDataType columnName=DESCRIPTION, tableName=AUTHENTICATION_FLOW; modifyDataType columnName=DESCRIPTION, tableName=CLIENT_TEMPLATE; modifyDataType columnName=DESCRIPTION, tableName=RESOURCE_SERVER_POLICY; modifyDataType columnName=DESCRIPTION,...','',NULL,'4.20.0',NULL,NULL,'7235437661'),('2.5.0-unicode-other-dbs','hmlnarik@redhat.com','META-INF/jpa-changelog-2.5.0.xml','2023-10-13 22:17:29',35,'EXECUTED','8:29b29cfebfd12600897680147277a9d7','modifyDataType columnName=DESCRIPTION, tableName=AUTHENTICATION_FLOW; modifyDataType columnName=DESCRIPTION, tableName=CLIENT_TEMPLATE; modifyDataType columnName=DESCRIPTION, tableName=RESOURCE_SERVER_POLICY; modifyDataType columnName=DESCRIPTION,...','',NULL,'4.20.0',NULL,NULL,'7235437661'),('2.5.0-duplicate-email-support','slawomir@dabek.name','META-INF/jpa-changelog-2.5.0.xml','2023-10-13 22:17:29',36,'EXECUTED','8:73ad77ca8fd0410c7f9f15a471fa52bc','addColumn tableName=REALM','',NULL,'4.20.0',NULL,NULL,'7235437661'),('2.5.0-unique-group-names','hmlnarik@redhat.com','META-INF/jpa-changelog-2.5.0.xml','2023-10-13 22:17:29',37,'EXECUTED','8:64f27a6fdcad57f6f9153210f2ec1bdb','addUniqueConstraint constraintName=SIBLING_NAMES, tableName=KEYCLOAK_GROUP','',NULL,'4.20.0',NULL,NULL,'7235437661'),('2.5.1','bburke@redhat.com','META-INF/jpa-changelog-2.5.1.xml','2023-10-13 22:17:29',38,'EXECUTED','8:27180251182e6c31846c2ddab4bc5781','addColumn tableName=FED_USER_CONSENT','',NULL,'4.20.0',NULL,NULL,'7235437661'),('3.0.0','bburke@redhat.com','META-INF/jpa-changelog-3.0.0.xml','2023-10-13 22:17:29',39,'EXECUTED','8:d56f201bfcfa7a1413eb3e9bc02978f9','addColumn tableName=IDENTITY_PROVIDER','',NULL,'4.20.0',NULL,NULL,'7235437661'),('3.2.0-fix','keycloak','META-INF/jpa-changelog-3.2.0.xml','2023-10-13 22:17:29',40,'MARK_RAN','8:91f5522bf6afdc2077dfab57fbd3455c','addNotNullConstraint columnName=REALM_ID, tableName=CLIENT_INITIAL_ACCESS','',NULL,'4.20.0',NULL,NULL,'7235437661'),('3.2.0-fix-with-keycloak-5416','keycloak','META-INF/jpa-changelog-3.2.0.xml','2023-10-13 22:17:29',41,'MARK_RAN','8:0f01b554f256c22caeb7d8aee3a1cdc8','dropIndex indexName=IDX_CLIENT_INIT_ACC_REALM, tableName=CLIENT_INITIAL_ACCESS; addNotNullConstraint columnName=REALM_ID, tableName=CLIENT_INITIAL_ACCESS; createIndex indexName=IDX_CLIENT_INIT_ACC_REALM, tableName=CLIENT_INITIAL_ACCESS','',NULL,'4.20.0',NULL,NULL,'7235437661'),('3.2.0-fix-offline-sessions','hmlnarik','META-INF/jpa-changelog-3.2.0.xml','2023-10-13 22:17:29',42,'EXECUTED','8:ab91cf9cee415867ade0e2df9651a947','customChange','',NULL,'4.20.0',NULL,NULL,'7235437661'),('3.2.0-fixed','keycloak','META-INF/jpa-changelog-3.2.0.xml','2023-10-13 22:17:30',43,'EXECUTED','8:ceac9b1889e97d602caf373eadb0d4b7','addColumn tableName=REALM; dropPrimaryKey constraintName=CONSTRAINT_OFFL_CL_SES_PK2, tableName=OFFLINE_CLIENT_SESSION; dropColumn columnName=CLIENT_SESSION_ID, tableName=OFFLINE_CLIENT_SESSION; addPrimaryKey constraintName=CONSTRAINT_OFFL_CL_SES_P...','',NULL,'4.20.0',NULL,NULL,'7235437661'),('3.3.0','keycloak','META-INF/jpa-changelog-3.3.0.xml','2023-10-13 22:17:31',44,'EXECUTED','8:84b986e628fe8f7fd8fd3c275c5259f2','addColumn tableName=USER_ENTITY','',NULL,'4.20.0',NULL,NULL,'7235437661'),('authz-3.4.0.CR1-resource-server-pk-change-part1','glavoie@gmail.com','META-INF/jpa-changelog-authz-3.4.0.CR1.xml','2023-10-13 22:17:31',45,'EXECUTED','8:a164ae073c56ffdbc98a615493609a52','addColumn tableName=RESOURCE_SERVER_POLICY; addColumn tableName=RESOURCE_SERVER_RESOURCE; addColumn tableName=RESOURCE_SERVER_SCOPE','',NULL,'4.20.0',NULL,NULL,'7235437661'),('authz-3.4.0.CR1-resource-server-pk-change-part2-KEYCLOAK-6095','hmlnarik@redhat.com','META-INF/jpa-changelog-authz-3.4.0.CR1.xml','2023-10-13 22:17:31',46,'EXECUTED','8:70a2b4f1f4bd4dbf487114bdb1810e64','customChange','',NULL,'4.20.0',NULL,NULL,'7235437661'),('authz-3.4.0.CR1-resource-server-pk-change-part3-fixed','glavoie@gmail.com','META-INF/jpa-changelog-authz-3.4.0.CR1.xml','2023-10-13 22:17:31',47,'MARK_RAN','8:7be68b71d2f5b94b8df2e824f2860fa2','dropIndex indexName=IDX_RES_SERV_POL_RES_SERV, tableName=RESOURCE_SERVER_POLICY; dropIndex indexName=IDX_RES_SRV_RES_RES_SRV, tableName=RESOURCE_SERVER_RESOURCE; dropIndex indexName=IDX_RES_SRV_SCOPE_RES_SRV, tableName=RESOURCE_SERVER_SCOPE','',NULL,'4.20.0',NULL,NULL,'7235437661'),('authz-3.4.0.CR1-resource-server-pk-change-part3-fixed-nodropindex','glavoie@gmail.com','META-INF/jpa-changelog-authz-3.4.0.CR1.xml','2023-10-13 22:17:31',48,'EXECUTED','8:bab7c631093c3861d6cf6144cd944982','addNotNullConstraint columnName=RESOURCE_SERVER_CLIENT_ID, tableName=RESOURCE_SERVER_POLICY; addNotNullConstraint columnName=RESOURCE_SERVER_CLIENT_ID, tableName=RESOURCE_SERVER_RESOURCE; addNotNullConstraint columnName=RESOURCE_SERVER_CLIENT_ID, ...','',NULL,'4.20.0',NULL,NULL,'7235437661'),('authn-3.4.0.CR1-refresh-token-max-reuse','glavoie@gmail.com','META-INF/jpa-changelog-authz-3.4.0.CR1.xml','2023-10-13 22:17:31',49,'EXECUTED','8:fa809ac11877d74d76fe40869916daad','addColumn tableName=REALM','',NULL,'4.20.0',NULL,NULL,'7235437661'),('3.4.0','keycloak','META-INF/jpa-changelog-3.4.0.xml','2023-10-13 22:17:32',50,'EXECUTED','8:fac23540a40208f5f5e326f6ceb4d291','addPrimaryKey constraintName=CONSTRAINT_REALM_DEFAULT_ROLES, tableName=REALM_DEFAULT_ROLES; addPrimaryKey constraintName=CONSTRAINT_COMPOSITE_ROLE, tableName=COMPOSITE_ROLE; addPrimaryKey constraintName=CONSTR_REALM_DEFAULT_GROUPS, tableName=REALM...','',NULL,'4.20.0',NULL,NULL,'7235437661'),('3.4.0-KEYCLOAK-5230','hmlnarik@redhat.com','META-INF/jpa-changelog-3.4.0.xml','2023-10-13 22:17:32',51,'EXECUTED','8:2612d1b8a97e2b5588c346e817307593','createIndex indexName=IDX_FU_ATTRIBUTE, tableName=FED_USER_ATTRIBUTE; createIndex indexName=IDX_FU_CONSENT, tableName=FED_USER_CONSENT; createIndex indexName=IDX_FU_CONSENT_RU, tableName=FED_USER_CONSENT; createIndex indexName=IDX_FU_CREDENTIAL, t...','',NULL,'4.20.0',NULL,NULL,'7235437661'),('3.4.1','psilva@redhat.com','META-INF/jpa-changelog-3.4.1.xml','2023-10-13 22:17:32',52,'EXECUTED','8:9842f155c5db2206c88bcb5d1046e941','modifyDataType columnName=VALUE, tableName=CLIENT_ATTRIBUTES','',NULL,'4.20.0',NULL,NULL,'7235437661'),('3.4.2','keycloak','META-INF/jpa-changelog-3.4.2.xml','2023-10-13 22:17:32',53,'EXECUTED','8:2e12e06e45498406db72d5b3da5bbc76','update tableName=REALM','',NULL,'4.20.0',NULL,NULL,'7235437661'),('3.4.2-KEYCLOAK-5172','mkanis@redhat.com','META-INF/jpa-changelog-3.4.2.xml','2023-10-13 22:17:32',54,'EXECUTED','8:33560e7c7989250c40da3abdabdc75a4','update tableName=CLIENT','',NULL,'4.20.0',NULL,NULL,'7235437661'),('4.0.0-KEYCLOAK-6335','bburke@redhat.com','META-INF/jpa-changelog-4.0.0.xml','2023-10-13 22:17:32',55,'EXECUTED','8:87a8d8542046817a9107c7eb9cbad1cd','createTable tableName=CLIENT_AUTH_FLOW_BINDINGS; addPrimaryKey constraintName=C_CLI_FLOW_BIND, tableName=CLIENT_AUTH_FLOW_BINDINGS','',NULL,'4.20.0',NULL,NULL,'7235437661'),('4.0.0-CLEANUP-UNUSED-TABLE','bburke@redhat.com','META-INF/jpa-changelog-4.0.0.xml','2023-10-13 22:17:32',56,'EXECUTED','8:3ea08490a70215ed0088c273d776311e','dropTable tableName=CLIENT_IDENTITY_PROV_MAPPING','',NULL,'4.20.0',NULL,NULL,'7235437661'),('4.0.0-KEYCLOAK-6228','bburke@redhat.com','META-INF/jpa-changelog-4.0.0.xml','2023-10-13 22:17:33',57,'EXECUTED','8:2d56697c8723d4592ab608ce14b6ed68','dropUniqueConstraint constraintName=UK_JKUWUVD56ONTGSUHOGM8UEWRT, tableName=USER_CONSENT; dropNotNullConstraint columnName=CLIENT_ID, tableName=USER_CONSENT; addColumn tableName=USER_CONSENT; addUniqueConstraint constraintName=UK_JKUWUVD56ONTGSUHO...','',NULL,'4.20.0',NULL,NULL,'7235437661'),('4.0.0-KEYCLOAK-5579-fixed','mposolda@redhat.com','META-INF/jpa-changelog-4.0.0.xml','2023-10-13 22:17:34',58,'EXECUTED','8:3e423e249f6068ea2bbe48bf907f9d86','dropForeignKeyConstraint baseTableName=CLIENT_TEMPLATE_ATTRIBUTES, constraintName=FK_CL_TEMPL_ATTR_TEMPL; renameTable newTableName=CLIENT_SCOPE_ATTRIBUTES, oldTableName=CLIENT_TEMPLATE_ATTRIBUTES; renameColumn newColumnName=SCOPE_ID, oldColumnName...','',NULL,'4.20.0',NULL,NULL,'7235437661'),('authz-4.0.0.CR1','psilva@redhat.com','META-INF/jpa-changelog-authz-4.0.0.CR1.xml','2023-10-13 22:17:35',59,'EXECUTED','8:15cabee5e5df0ff099510a0fc03e4103','createTable tableName=RESOURCE_SERVER_PERM_TICKET; addPrimaryKey constraintName=CONSTRAINT_FAPMT, tableName=RESOURCE_SERVER_PERM_TICKET; addForeignKeyConstraint baseTableName=RESOURCE_SERVER_PERM_TICKET, constraintName=FK_FRSRHO213XCX4WNKOG82SSPMT...','',NULL,'4.20.0',NULL,NULL,'7235437661'),('authz-4.0.0.Beta3','psilva@redhat.com','META-INF/jpa-changelog-authz-4.0.0.Beta3.xml','2023-10-13 22:17:35',60,'EXECUTED','8:4b80200af916ac54d2ffbfc47918ab0e','addColumn tableName=RESOURCE_SERVER_POLICY; addColumn tableName=RESOURCE_SERVER_PERM_TICKET; addForeignKeyConstraint baseTableName=RESOURCE_SERVER_PERM_TICKET, constraintName=FK_FRSRPO2128CX4WNKOG82SSRFY, referencedTableName=RESOURCE_SERVER_POLICY','',NULL,'4.20.0',NULL,NULL,'7235437661'),('authz-4.2.0.Final','mhajas@redhat.com','META-INF/jpa-changelog-authz-4.2.0.Final.xml','2023-10-13 22:17:35',61,'EXECUTED','8:66564cd5e168045d52252c5027485bbb','createTable tableName=RESOURCE_URIS; addForeignKeyConstraint baseTableName=RESOURCE_URIS, constraintName=FK_RESOURCE_SERVER_URIS, referencedTableName=RESOURCE_SERVER_RESOURCE; customChange; dropColumn columnName=URI, tableName=RESOURCE_SERVER_RESO...','',NULL,'4.20.0',NULL,NULL,'7235437661'),('authz-4.2.0.Final-KEYCLOAK-9944','hmlnarik@redhat.com','META-INF/jpa-changelog-authz-4.2.0.Final.xml','2023-10-13 22:17:35',62,'EXECUTED','8:1c7064fafb030222be2bd16ccf690f6f','addPrimaryKey constraintName=CONSTRAINT_RESOUR_URIS_PK, tableName=RESOURCE_URIS','',NULL,'4.20.0',NULL,NULL,'7235437661'),('4.2.0-KEYCLOAK-6313','wadahiro@gmail.com','META-INF/jpa-changelog-4.2.0.xml','2023-10-13 22:17:35',63,'EXECUTED','8:2de18a0dce10cdda5c7e65c9b719b6e5','addColumn tableName=REQUIRED_ACTION_PROVIDER','',NULL,'4.20.0',NULL,NULL,'7235437661'),('4.3.0-KEYCLOAK-7984','wadahiro@gmail.com','META-INF/jpa-changelog-4.3.0.xml','2023-10-13 22:17:35',64,'EXECUTED','8:03e413dd182dcbd5c57e41c34d0ef682','update tableName=REQUIRED_ACTION_PROVIDER','',NULL,'4.20.0',NULL,NULL,'7235437661'),('4.6.0-KEYCLOAK-7950','psilva@redhat.com','META-INF/jpa-changelog-4.6.0.xml','2023-10-13 22:17:35',65,'EXECUTED','8:d27b42bb2571c18fbe3fe4e4fb7582a7','update tableName=RESOURCE_SERVER_RESOURCE','',NULL,'4.20.0',NULL,NULL,'7235437661'),('4.6.0-KEYCLOAK-8377','keycloak','META-INF/jpa-changelog-4.6.0.xml','2023-10-13 22:17:35',66,'EXECUTED','8:698baf84d9fd0027e9192717c2154fb8','createTable tableName=ROLE_ATTRIBUTE; addPrimaryKey constraintName=CONSTRAINT_ROLE_ATTRIBUTE_PK, tableName=ROLE_ATTRIBUTE; addForeignKeyConstraint baseTableName=ROLE_ATTRIBUTE, constraintName=FK_ROLE_ATTRIBUTE_ID, referencedTableName=KEYCLOAK_ROLE...','',NULL,'4.20.0',NULL,NULL,'7235437661'),('4.6.0-KEYCLOAK-8555','gideonray@gmail.com','META-INF/jpa-changelog-4.6.0.xml','2023-10-13 22:17:35',67,'EXECUTED','8:ced8822edf0f75ef26eb51582f9a821a','createIndex indexName=IDX_COMPONENT_PROVIDER_TYPE, tableName=COMPONENT','',NULL,'4.20.0',NULL,NULL,'7235437661'),('4.7.0-KEYCLOAK-1267','sguilhen@redhat.com','META-INF/jpa-changelog-4.7.0.xml','2023-10-13 22:17:35',68,'EXECUTED','8:f0abba004cf429e8afc43056df06487d','addColumn tableName=REALM','',NULL,'4.20.0',NULL,NULL,'7235437661'),('4.7.0-KEYCLOAK-7275','keycloak','META-INF/jpa-changelog-4.7.0.xml','2023-10-13 22:17:35',69,'EXECUTED','8:6662f8b0b611caa359fcf13bf63b4e24','renameColumn newColumnName=CREATED_ON, oldColumnName=LAST_SESSION_REFRESH, tableName=OFFLINE_USER_SESSION; addNotNullConstraint columnName=CREATED_ON, tableName=OFFLINE_USER_SESSION; addColumn tableName=OFFLINE_USER_SESSION; customChange; createIn...','',NULL,'4.20.0',NULL,NULL,'7235437661'),('4.8.0-KEYCLOAK-8835','sguilhen@redhat.com','META-INF/jpa-changelog-4.8.0.xml','2023-10-13 22:17:35',70,'EXECUTED','8:9e6b8009560f684250bdbdf97670d39e','addNotNullConstraint columnName=SSO_MAX_LIFESPAN_REMEMBER_ME, tableName=REALM; addNotNullConstraint columnName=SSO_IDLE_TIMEOUT_REMEMBER_ME, tableName=REALM','',NULL,'4.20.0',NULL,NULL,'7235437661'),('authz-7.0.0-KEYCLOAK-10443','psilva@redhat.com','META-INF/jpa-changelog-authz-7.0.0.xml','2023-10-13 22:17:35',71,'EXECUTED','8:4223f561f3b8dc655846562b57bb502e','addColumn tableName=RESOURCE_SERVER','',NULL,'4.20.0',NULL,NULL,'7235437661'),('8.0.0-adding-credential-columns','keycloak','META-INF/jpa-changelog-8.0.0.xml','2023-10-13 22:17:35',72,'EXECUTED','8:215a31c398b363ce383a2b301202f29e','addColumn tableName=CREDENTIAL; addColumn tableName=FED_USER_CREDENTIAL','',NULL,'4.20.0',NULL,NULL,'7235437661'),('8.0.0-updating-credential-data-not-oracle-fixed','keycloak','META-INF/jpa-changelog-8.0.0.xml','2023-10-13 22:17:35',73,'EXECUTED','8:83f7a671792ca98b3cbd3a1a34862d3d','update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=FED_USER_CREDENTIAL; update tableName=FED_USER_CREDENTIAL; update tableName=FED_USER_CREDENTIAL','',NULL,'4.20.0',NULL,NULL,'7235437661'),('8.0.0-updating-credential-data-oracle-fixed','keycloak','META-INF/jpa-changelog-8.0.0.xml','2023-10-13 22:17:35',74,'MARK_RAN','8:f58ad148698cf30707a6efbdf8061aa7','update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=FED_USER_CREDENTIAL; update tableName=FED_USER_CREDENTIAL; update tableName=FED_USER_CREDENTIAL','',NULL,'4.20.0',NULL,NULL,'7235437661'),('8.0.0-credential-cleanup-fixed','keycloak','META-INF/jpa-changelog-8.0.0.xml','2023-10-13 22:17:36',75,'EXECUTED','8:79e4fd6c6442980e58d52ffc3ee7b19c','dropDefaultValue columnName=COUNTER, tableName=CREDENTIAL; dropDefaultValue columnName=DIGITS, tableName=CREDENTIAL; dropDefaultValue columnName=PERIOD, tableName=CREDENTIAL; dropDefaultValue columnName=ALGORITHM, tableName=CREDENTIAL; dropColumn ...','',NULL,'4.20.0',NULL,NULL,'7235437661'),('8.0.0-resource-tag-support','keycloak','META-INF/jpa-changelog-8.0.0.xml','2023-10-13 22:17:36',76,'EXECUTED','8:87af6a1e6d241ca4b15801d1f86a297d','addColumn tableName=MIGRATION_MODEL; createIndex indexName=IDX_UPDATE_TIME, tableName=MIGRATION_MODEL','',NULL,'4.20.0',NULL,NULL,'7235437661'),('9.0.0-always-display-client','keycloak','META-INF/jpa-changelog-9.0.0.xml','2023-10-13 22:17:36',77,'EXECUTED','8:b44f8d9b7b6ea455305a6d72a200ed15','addColumn tableName=CLIENT','',NULL,'4.20.0',NULL,NULL,'7235437661'),('9.0.0-drop-constraints-for-column-increase','keycloak','META-INF/jpa-changelog-9.0.0.xml','2023-10-13 22:17:36',78,'MARK_RAN','8:2d8ed5aaaeffd0cb004c046b4a903ac5','dropUniqueConstraint constraintName=UK_FRSR6T700S9V50BU18WS5PMT, tableName=RESOURCE_SERVER_PERM_TICKET; dropUniqueConstraint constraintName=UK_FRSR6T700S9V50BU18WS5HA6, tableName=RESOURCE_SERVER_RESOURCE; dropPrimaryKey constraintName=CONSTRAINT_O...','',NULL,'4.20.0',NULL,NULL,'7235437661'),('9.0.0-increase-column-size-federated-fk','keycloak','META-INF/jpa-changelog-9.0.0.xml','2023-10-13 22:17:36',79,'EXECUTED','8:e290c01fcbc275326c511633f6e2acde','modifyDataType columnName=CLIENT_ID, tableName=FED_USER_CONSENT; modifyDataType columnName=CLIENT_REALM_CONSTRAINT, tableName=KEYCLOAK_ROLE; modifyDataType columnName=OWNER, tableName=RESOURCE_SERVER_POLICY; modifyDataType columnName=CLIENT_ID, ta...','',NULL,'4.20.0',NULL,NULL,'7235437661'),('9.0.0-recreate-constraints-after-column-increase','keycloak','META-INF/jpa-changelog-9.0.0.xml','2023-10-13 22:17:36',80,'MARK_RAN','8:c9db8784c33cea210872ac2d805439f8','addNotNullConstraint columnName=CLIENT_ID, tableName=OFFLINE_CLIENT_SESSION; addNotNullConstraint columnName=OWNER, tableName=RESOURCE_SERVER_PERM_TICKET; addNotNullConstraint columnName=REQUESTER, tableName=RESOURCE_SERVER_PERM_TICKET; addNotNull...','',NULL,'4.20.0',NULL,NULL,'7235437661'),('9.0.1-add-index-to-client.client_id','keycloak','META-INF/jpa-changelog-9.0.1.xml','2023-10-13 22:17:36',81,'EXECUTED','8:95b676ce8fc546a1fcfb4c92fae4add5','createIndex indexName=IDX_CLIENT_ID, tableName=CLIENT','',NULL,'4.20.0',NULL,NULL,'7235437661'),('9.0.1-KEYCLOAK-12579-drop-constraints','keycloak','META-INF/jpa-changelog-9.0.1.xml','2023-10-13 22:17:36',82,'MARK_RAN','8:38a6b2a41f5651018b1aca93a41401e5','dropUniqueConstraint constraintName=SIBLING_NAMES, tableName=KEYCLOAK_GROUP','',NULL,'4.20.0',NULL,NULL,'7235437661'),('9.0.1-KEYCLOAK-12579-add-not-null-constraint','keycloak','META-INF/jpa-changelog-9.0.1.xml','2023-10-13 22:17:36',83,'EXECUTED','8:3fb99bcad86a0229783123ac52f7609c','addNotNullConstraint columnName=PARENT_GROUP, tableName=KEYCLOAK_GROUP','',NULL,'4.20.0',NULL,NULL,'7235437661'),('9.0.1-KEYCLOAK-12579-recreate-constraints','keycloak','META-INF/jpa-changelog-9.0.1.xml','2023-10-13 22:17:36',84,'MARK_RAN','8:64f27a6fdcad57f6f9153210f2ec1bdb','addUniqueConstraint constraintName=SIBLING_NAMES, tableName=KEYCLOAK_GROUP','',NULL,'4.20.0',NULL,NULL,'7235437661'),('9.0.1-add-index-to-events','keycloak','META-INF/jpa-changelog-9.0.1.xml','2023-10-13 22:17:36',85,'EXECUTED','8:ab4f863f39adafd4c862f7ec01890abc','createIndex indexName=IDX_EVENT_TIME, tableName=EVENT_ENTITY','',NULL,'4.20.0',NULL,NULL,'7235437661'),('map-remove-ri','keycloak','META-INF/jpa-changelog-11.0.0.xml','2023-10-13 22:17:36',86,'EXECUTED','8:13c419a0eb336e91ee3a3bf8fda6e2a7','dropForeignKeyConstraint baseTableName=REALM, constraintName=FK_TRAF444KK6QRKMS7N56AIWQ5Y; dropForeignKeyConstraint baseTableName=KEYCLOAK_ROLE, constraintName=FK_KJHO5LE2C0RAL09FL8CM9WFW9','',NULL,'4.20.0',NULL,NULL,'7235437661'),('map-remove-ri','keycloak','META-INF/jpa-changelog-12.0.0.xml','2023-10-13 22:17:36',87,'EXECUTED','8:e3fb1e698e0471487f51af1ed80fe3ac','dropForeignKeyConstraint baseTableName=REALM_DEFAULT_GROUPS, constraintName=FK_DEF_GROUPS_GROUP; dropForeignKeyConstraint baseTableName=REALM_DEFAULT_ROLES, constraintName=FK_H4WPD7W4HSOOLNI3H0SW7BTJE; dropForeignKeyConstraint baseTableName=CLIENT...','',NULL,'4.20.0',NULL,NULL,'7235437661'),('12.1.0-add-realm-localization-table','keycloak','META-INF/jpa-changelog-12.0.0.xml','2023-10-13 22:17:36',88,'EXECUTED','8:babadb686aab7b56562817e60bf0abd0','createTable tableName=REALM_LOCALIZATIONS; addPrimaryKey tableName=REALM_LOCALIZATIONS','',NULL,'4.20.0',NULL,NULL,'7235437661'),('default-roles','keycloak','META-INF/jpa-changelog-13.0.0.xml','2023-10-13 22:17:36',89,'EXECUTED','8:72d03345fda8e2f17093d08801947773','addColumn tableName=REALM; customChange','',NULL,'4.20.0',NULL,NULL,'7235437661'),('default-roles-cleanup','keycloak','META-INF/jpa-changelog-13.0.0.xml','2023-10-13 22:17:36',90,'EXECUTED','8:61c9233951bd96ffecd9ba75f7d978a4','dropTable tableName=REALM_DEFAULT_ROLES; dropTable tableName=CLIENT_DEFAULT_ROLES','',NULL,'4.20.0',NULL,NULL,'7235437661'),('13.0.0-KEYCLOAK-16844','keycloak','META-INF/jpa-changelog-13.0.0.xml','2023-10-13 22:17:36',91,'EXECUTED','8:ea82e6ad945cec250af6372767b25525','createIndex indexName=IDX_OFFLINE_USS_PRELOAD, tableName=OFFLINE_USER_SESSION','',NULL,'4.20.0',NULL,NULL,'7235437661'),('map-remove-ri-13.0.0','keycloak','META-INF/jpa-changelog-13.0.0.xml','2023-10-13 22:17:37',92,'EXECUTED','8:d3f4a33f41d960ddacd7e2ef30d126b3','dropForeignKeyConstraint baseTableName=DEFAULT_CLIENT_SCOPE, constraintName=FK_R_DEF_CLI_SCOPE_SCOPE; dropForeignKeyConstraint baseTableName=CLIENT_SCOPE_CLIENT, constraintName=FK_C_CLI_SCOPE_SCOPE; dropForeignKeyConstraint baseTableName=CLIENT_SC...','',NULL,'4.20.0',NULL,NULL,'7235437661'),('13.0.0-KEYCLOAK-17992-drop-constraints','keycloak','META-INF/jpa-changelog-13.0.0.xml','2023-10-13 22:17:37',93,'MARK_RAN','8:1284a27fbd049d65831cb6fc07c8a783','dropPrimaryKey constraintName=C_CLI_SCOPE_BIND, tableName=CLIENT_SCOPE_CLIENT; dropIndex indexName=IDX_CLSCOPE_CL, tableName=CLIENT_SCOPE_CLIENT; dropIndex indexName=IDX_CL_CLSCOPE, tableName=CLIENT_SCOPE_CLIENT','',NULL,'4.20.0',NULL,NULL,'7235437661'),('13.0.0-increase-column-size-federated','keycloak','META-INF/jpa-changelog-13.0.0.xml','2023-10-13 22:17:37',94,'EXECUTED','8:9d11b619db2ae27c25853b8a37cd0dea','modifyDataType columnName=CLIENT_ID, tableName=CLIENT_SCOPE_CLIENT; modifyDataType columnName=SCOPE_ID, tableName=CLIENT_SCOPE_CLIENT','',NULL,'4.20.0',NULL,NULL,'7235437661'),('13.0.0-KEYCLOAK-17992-recreate-constraints','keycloak','META-INF/jpa-changelog-13.0.0.xml','2023-10-13 22:17:37',95,'MARK_RAN','8:3002bb3997451bb9e8bac5c5cd8d6327','addNotNullConstraint columnName=CLIENT_ID, tableName=CLIENT_SCOPE_CLIENT; addNotNullConstraint columnName=SCOPE_ID, tableName=CLIENT_SCOPE_CLIENT; addPrimaryKey constraintName=C_CLI_SCOPE_BIND, tableName=CLIENT_SCOPE_CLIENT; createIndex indexName=...','',NULL,'4.20.0',NULL,NULL,'7235437661'),('json-string-accomodation-fixed','keycloak','META-INF/jpa-changelog-13.0.0.xml','2023-10-13 22:17:37',96,'EXECUTED','8:dfbee0d6237a23ef4ccbb7a4e063c163','addColumn tableName=REALM_ATTRIBUTE; update tableName=REALM_ATTRIBUTE; dropColumn columnName=VALUE, tableName=REALM_ATTRIBUTE; renameColumn newColumnName=VALUE, oldColumnName=VALUE_NEW, tableName=REALM_ATTRIBUTE','',NULL,'4.20.0',NULL,NULL,'7235437661'),('14.0.0-KEYCLOAK-11019','keycloak','META-INF/jpa-changelog-14.0.0.xml','2023-10-13 22:17:37',97,'EXECUTED','8:75f3e372df18d38c62734eebb986b960','createIndex indexName=IDX_OFFLINE_CSS_PRELOAD, tableName=OFFLINE_CLIENT_SESSION; createIndex indexName=IDX_OFFLINE_USS_BY_USER, tableName=OFFLINE_USER_SESSION; createIndex indexName=IDX_OFFLINE_USS_BY_USERSESS, tableName=OFFLINE_USER_SESSION','',NULL,'4.20.0',NULL,NULL,'7235437661'),('14.0.0-KEYCLOAK-18286','keycloak','META-INF/jpa-changelog-14.0.0.xml','2023-10-13 22:17:37',98,'MARK_RAN','8:7fee73eddf84a6035691512c85637eef','createIndex indexName=IDX_CLIENT_ATT_BY_NAME_VALUE, tableName=CLIENT_ATTRIBUTES','',NULL,'4.20.0',NULL,NULL,'7235437661'),('14.0.0-KEYCLOAK-18286-revert','keycloak','META-INF/jpa-changelog-14.0.0.xml','2023-10-13 22:17:37',99,'MARK_RAN','8:7a11134ab12820f999fbf3bb13c3adc8','dropIndex indexName=IDX_CLIENT_ATT_BY_NAME_VALUE, tableName=CLIENT_ATTRIBUTES','',NULL,'4.20.0',NULL,NULL,'7235437661'),('14.0.0-KEYCLOAK-18286-supported-dbs','keycloak','META-INF/jpa-changelog-14.0.0.xml','2023-10-13 22:17:37',100,'EXECUTED','8:f43dfba07ba249d5d932dc489fd2b886','createIndex indexName=IDX_CLIENT_ATT_BY_NAME_VALUE, tableName=CLIENT_ATTRIBUTES','',NULL,'4.20.0',NULL,NULL,'7235437661'),('14.0.0-KEYCLOAK-18286-unsupported-dbs','keycloak','META-INF/jpa-changelog-14.0.0.xml','2023-10-13 22:17:37',101,'MARK_RAN','8:18186f0008b86e0f0f49b0c4d0e842ac','createIndex indexName=IDX_CLIENT_ATT_BY_NAME_VALUE, tableName=CLIENT_ATTRIBUTES','',NULL,'4.20.0',NULL,NULL,'7235437661'),('KEYCLOAK-17267-add-index-to-user-attributes','keycloak','META-INF/jpa-changelog-14.0.0.xml','2023-10-13 22:17:37',102,'EXECUTED','8:09c2780bcb23b310a7019d217dc7b433','createIndex indexName=IDX_USER_ATTRIBUTE_NAME, tableName=USER_ATTRIBUTE','',NULL,'4.20.0',NULL,NULL,'7235437661'),('KEYCLOAK-18146-add-saml-art-binding-identifier','keycloak','META-INF/jpa-changelog-14.0.0.xml','2023-10-13 22:17:37',103,'EXECUTED','8:276a44955eab693c970a42880197fff2','customChange','',NULL,'4.20.0',NULL,NULL,'7235437661'),('15.0.0-KEYCLOAK-18467','keycloak','META-INF/jpa-changelog-15.0.0.xml','2023-10-13 22:17:37',104,'EXECUTED','8:ba8ee3b694d043f2bfc1a1079d0760d7','addColumn tableName=REALM_LOCALIZATIONS; update tableName=REALM_LOCALIZATIONS; dropColumn columnName=TEXTS, tableName=REALM_LOCALIZATIONS; renameColumn newColumnName=TEXTS, oldColumnName=TEXTS_NEW, tableName=REALM_LOCALIZATIONS; addNotNullConstrai...','',NULL,'4.20.0',NULL,NULL,'7235437661'),('17.0.0-9562','keycloak','META-INF/jpa-changelog-17.0.0.xml','2023-10-13 22:17:37',105,'EXECUTED','8:5e06b1d75f5d17685485e610c2851b17','createIndex indexName=IDX_USER_SERVICE_ACCOUNT, tableName=USER_ENTITY','',NULL,'4.20.0',NULL,NULL,'7235437661'),('18.0.0-10625-IDX_ADMIN_EVENT_TIME','keycloak','META-INF/jpa-changelog-18.0.0.xml','2023-10-13 22:17:37',106,'EXECUTED','8:4b80546c1dc550ac552ee7b24a4ab7c0','createIndex indexName=IDX_ADMIN_EVENT_TIME, tableName=ADMIN_EVENT_ENTITY','',NULL,'4.20.0',NULL,NULL,'7235437661'),('19.0.0-10135','keycloak','META-INF/jpa-changelog-19.0.0.xml','2023-10-13 22:17:37',107,'EXECUTED','8:af510cd1bb2ab6339c45372f3e491696','customChange','',NULL,'4.20.0',NULL,NULL,'7235437661'),('20.0.0-12964-supported-dbs','keycloak','META-INF/jpa-changelog-20.0.0.xml','2023-10-13 22:17:37',108,'EXECUTED','8:d00f99ed899c4d2ae9117e282badbef5','createIndex indexName=IDX_GROUP_ATT_BY_NAME_VALUE, tableName=GROUP_ATTRIBUTE','',NULL,'4.20.0',NULL,NULL,'7235437661'),('20.0.0-12964-unsupported-dbs','keycloak','META-INF/jpa-changelog-20.0.0.xml','2023-10-13 22:17:37',109,'MARK_RAN','8:314e803baf2f1ec315b3464e398b8247','createIndex indexName=IDX_GROUP_ATT_BY_NAME_VALUE, tableName=GROUP_ATTRIBUTE','',NULL,'4.20.0',NULL,NULL,'7235437661'),('client-attributes-string-accomodation-fixed','keycloak','META-INF/jpa-changelog-20.0.0.xml','2023-10-13 22:17:37',110,'EXECUTED','8:56e4677e7e12556f70b604c573840100','addColumn tableName=CLIENT_ATTRIBUTES; update tableName=CLIENT_ATTRIBUTES; dropColumn columnName=VALUE, tableName=CLIENT_ATTRIBUTES; renameColumn newColumnName=VALUE, oldColumnName=VALUE_NEW, tableName=CLIENT_ATTRIBUTES','',NULL,'4.20.0',NULL,NULL,'7235437661'),('21.0.2-17277','keycloak','META-INF/jpa-changelog-21.0.2.xml','2023-10-13 22:17:37',111,'EXECUTED','8:8806cb33d2a546ce770384bf98cf6eac','customChange','',NULL,'4.20.0',NULL,NULL,'7235437661'),('21.1.0-19404','keycloak','META-INF/jpa-changelog-21.1.0.xml','2023-10-13 22:17:37',112,'EXECUTED','8:fdb2924649d30555ab3a1744faba4928','modifyDataType columnName=DECISION_STRATEGY, tableName=RESOURCE_SERVER_POLICY; modifyDataType columnName=LOGIC, tableName=RESOURCE_SERVER_POLICY; modifyDataType columnName=POLICY_ENFORCE_MODE, tableName=RESOURCE_SERVER','',NULL,'4.20.0',NULL,NULL,'7235437661'),('21.1.0-19404-2','keycloak','META-INF/jpa-changelog-21.1.0.xml','2023-10-13 22:17:37',113,'MARK_RAN','8:1c96cc2b10903bd07a03670098d67fd6','addColumn tableName=RESOURCE_SERVER_POLICY; update tableName=RESOURCE_SERVER_POLICY; dropColumn columnName=DECISION_STRATEGY, tableName=RESOURCE_SERVER_POLICY; renameColumn newColumnName=DECISION_STRATEGY, oldColumnName=DECISION_STRATEGY_NEW, tabl...','',NULL,'4.20.0',NULL,NULL,'7235437661'),('22.0.0-17484','keycloak','META-INF/jpa-changelog-22.0.0.xml','2023-10-13 22:17:37',114,'EXECUTED','8:4c3d4e8b142a66fcdf21b89a4dd33301','customChange','',NULL,'4.20.0',NULL,NULL,'7235437661');
/*!40000 ALTER TABLE `DATABASECHANGELOG` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `DATABASECHANGELOGLOCK`
--

DROP TABLE IF EXISTS `DATABASECHANGELOGLOCK`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `DATABASECHANGELOGLOCK` (
  `ID` int NOT NULL,
  `LOCKED` bit(1) NOT NULL,
  `LOCKGRANTED` datetime DEFAULT NULL,
  `LOCKEDBY` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DATABASECHANGELOGLOCK`
--

LOCK TABLES `DATABASECHANGELOGLOCK` WRITE;
/*!40000 ALTER TABLE `DATABASECHANGELOGLOCK` DISABLE KEYS */;
INSERT INTO `DATABASECHANGELOGLOCK` VALUES (1,_binary '\0',NULL,NULL),(1000,_binary '\0',NULL,NULL),(1001,_binary '\0',NULL,NULL);
/*!40000 ALTER TABLE `DATABASECHANGELOGLOCK` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `DEFAULT_CLIENT_SCOPE`
--

DROP TABLE IF EXISTS `DEFAULT_CLIENT_SCOPE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `DEFAULT_CLIENT_SCOPE` (
  `REALM_ID` varchar(36) NOT NULL,
  `SCOPE_ID` varchar(36) NOT NULL,
  `DEFAULT_SCOPE` bit(1) NOT NULL DEFAULT b'0',
  PRIMARY KEY (`REALM_ID`,`SCOPE_ID`),
  KEY `IDX_DEFCLS_REALM` (`REALM_ID`),
  KEY `IDX_DEFCLS_SCOPE` (`SCOPE_ID`),
  CONSTRAINT `FK_R_DEF_CLI_SCOPE_REALM` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DEFAULT_CLIENT_SCOPE`
--

LOCK TABLES `DEFAULT_CLIENT_SCOPE` WRITE;
/*!40000 ALTER TABLE `DEFAULT_CLIENT_SCOPE` DISABLE KEYS */;
INSERT INTO `DEFAULT_CLIENT_SCOPE` VALUES ('60416dc2-4603-4f6b-b014-b0b0fbe038ce','2db35c81-f2bc-4cf3-8f4d-30905b476c7d',_binary '\0'),('60416dc2-4603-4f6b-b014-b0b0fbe038ce','3b183c0c-fc99-45f5-9dbd-38303176114c',_binary '\0'),('60416dc2-4603-4f6b-b014-b0b0fbe038ce','436391f8-e42a-4b97-a142-77a0c69d4d61',_binary ''),('60416dc2-4603-4f6b-b014-b0b0fbe038ce','69f81257-559c-4b1f-b519-793d849ad963',_binary '\0'),('60416dc2-4603-4f6b-b014-b0b0fbe038ce','72ad9bdd-c17c-4f7d-ad25-d090d4cca129',_binary '\0'),('60416dc2-4603-4f6b-b014-b0b0fbe038ce','76cea90a-8d2a-40f6-b44c-d00a5e2b0306',_binary ''),('60416dc2-4603-4f6b-b014-b0b0fbe038ce','96ee4e31-ef97-4b03-9558-a872c45c4623',_binary ''),('60416dc2-4603-4f6b-b014-b0b0fbe038ce','a94a581f-72c2-4467-8669-c32378847ca1',_binary ''),('60416dc2-4603-4f6b-b014-b0b0fbe038ce','b5e3935f-48cf-407a-8da4-4de979a88396',_binary ''),('60416dc2-4603-4f6b-b014-b0b0fbe038ce','f27c47ce-6d87-4f94-8a74-cbf2d9ed3d03',_binary ''),('c0270858-075b-431d-93d7-153e3204d46f','12a98ef7-ae4f-4ec3-8900-27ccc54fb8c7',_binary '\0'),('c0270858-075b-431d-93d7-153e3204d46f','15361359-d13e-4f51-9a1d-51b27852d94b',_binary '\0'),('c0270858-075b-431d-93d7-153e3204d46f','1b049fb0-e99d-47fa-9fbb-f955769cb27c',_binary ''),('c0270858-075b-431d-93d7-153e3204d46f','224b7450-9c2c-4d9a-866b-505c01ef69a4',_binary ''),('c0270858-075b-431d-93d7-153e3204d46f','2e127e80-d25c-40fc-9832-360fb3a408e9',_binary ''),('c0270858-075b-431d-93d7-153e3204d46f','433edf47-627c-4f7f-856a-e0c9182c31f1',_binary ''),('c0270858-075b-431d-93d7-153e3204d46f','49a31f5b-9e62-43bc-96ed-d82701d1bdc6',_binary '\0'),('c0270858-075b-431d-93d7-153e3204d46f','6a8a948f-e623-4951-a513-1e054da6dd63',_binary ''),('c0270858-075b-431d-93d7-153e3204d46f','c6f03dea-77eb-4d5b-b55f-0033753a7373',_binary '\0'),('c0270858-075b-431d-93d7-153e3204d46f','eb77e8cc-1ddc-45ba-8808-d3be948c246d',_binary '');
/*!40000 ALTER TABLE `DEFAULT_CLIENT_SCOPE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `EVENT_ENTITY`
--

DROP TABLE IF EXISTS `EVENT_ENTITY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `EVENT_ENTITY` (
  `ID` varchar(36) NOT NULL,
  `CLIENT_ID` varchar(255) DEFAULT NULL,
  `DETAILS_JSON` text,
  `ERROR` varchar(255) DEFAULT NULL,
  `IP_ADDRESS` varchar(255) DEFAULT NULL,
  `REALM_ID` varchar(255) DEFAULT NULL,
  `SESSION_ID` varchar(255) DEFAULT NULL,
  `EVENT_TIME` bigint DEFAULT NULL,
  `TYPE` varchar(255) DEFAULT NULL,
  `USER_ID` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_EVENT_TIME` (`REALM_ID`,`EVENT_TIME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `EVENT_ENTITY`
--

LOCK TABLES `EVENT_ENTITY` WRITE;
/*!40000 ALTER TABLE `EVENT_ENTITY` DISABLE KEYS */;
/*!40000 ALTER TABLE `EVENT_ENTITY` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FEDERATED_IDENTITY`
--

DROP TABLE IF EXISTS `FEDERATED_IDENTITY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `FEDERATED_IDENTITY` (
  `IDENTITY_PROVIDER` varchar(255) NOT NULL,
  `REALM_ID` varchar(36) DEFAULT NULL,
  `FEDERATED_USER_ID` varchar(255) DEFAULT NULL,
  `FEDERATED_USERNAME` varchar(255) DEFAULT NULL,
  `TOKEN` text,
  `USER_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`IDENTITY_PROVIDER`,`USER_ID`),
  KEY `IDX_FEDIDENTITY_USER` (`USER_ID`),
  KEY `IDX_FEDIDENTITY_FEDUSER` (`FEDERATED_USER_ID`),
  CONSTRAINT `FK404288B92EF007A6` FOREIGN KEY (`USER_ID`) REFERENCES `USER_ENTITY` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FEDERATED_IDENTITY`
--

LOCK TABLES `FEDERATED_IDENTITY` WRITE;
/*!40000 ALTER TABLE `FEDERATED_IDENTITY` DISABLE KEYS */;
/*!40000 ALTER TABLE `FEDERATED_IDENTITY` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FEDERATED_USER`
--

DROP TABLE IF EXISTS `FEDERATED_USER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `FEDERATED_USER` (
  `ID` varchar(255) NOT NULL,
  `STORAGE_PROVIDER_ID` varchar(255) DEFAULT NULL,
  `REALM_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FEDERATED_USER`
--

LOCK TABLES `FEDERATED_USER` WRITE;
/*!40000 ALTER TABLE `FEDERATED_USER` DISABLE KEYS */;
/*!40000 ALTER TABLE `FEDERATED_USER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FED_USER_ATTRIBUTE`
--

DROP TABLE IF EXISTS `FED_USER_ATTRIBUTE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `FED_USER_ATTRIBUTE` (
  `ID` varchar(36) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  `USER_ID` varchar(255) NOT NULL,
  `REALM_ID` varchar(36) NOT NULL,
  `STORAGE_PROVIDER_ID` varchar(36) DEFAULT NULL,
  `VALUE` text,
  PRIMARY KEY (`ID`),
  KEY `IDX_FU_ATTRIBUTE` (`USER_ID`,`REALM_ID`,`NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FED_USER_ATTRIBUTE`
--

LOCK TABLES `FED_USER_ATTRIBUTE` WRITE;
/*!40000 ALTER TABLE `FED_USER_ATTRIBUTE` DISABLE KEYS */;
/*!40000 ALTER TABLE `FED_USER_ATTRIBUTE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FED_USER_CONSENT`
--

DROP TABLE IF EXISTS `FED_USER_CONSENT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `FED_USER_CONSENT` (
  `ID` varchar(36) NOT NULL,
  `CLIENT_ID` varchar(255) DEFAULT NULL,
  `USER_ID` varchar(255) NOT NULL,
  `REALM_ID` varchar(36) NOT NULL,
  `STORAGE_PROVIDER_ID` varchar(36) DEFAULT NULL,
  `CREATED_DATE` bigint DEFAULT NULL,
  `LAST_UPDATED_DATE` bigint DEFAULT NULL,
  `CLIENT_STORAGE_PROVIDER` varchar(36) DEFAULT NULL,
  `EXTERNAL_CLIENT_ID` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_FU_CONSENT` (`USER_ID`,`CLIENT_ID`),
  KEY `IDX_FU_CONSENT_RU` (`REALM_ID`,`USER_ID`),
  KEY `IDX_FU_CNSNT_EXT` (`USER_ID`,`CLIENT_STORAGE_PROVIDER`,`EXTERNAL_CLIENT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FED_USER_CONSENT`
--

LOCK TABLES `FED_USER_CONSENT` WRITE;
/*!40000 ALTER TABLE `FED_USER_CONSENT` DISABLE KEYS */;
/*!40000 ALTER TABLE `FED_USER_CONSENT` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FED_USER_CONSENT_CL_SCOPE`
--

DROP TABLE IF EXISTS `FED_USER_CONSENT_CL_SCOPE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `FED_USER_CONSENT_CL_SCOPE` (
  `USER_CONSENT_ID` varchar(36) NOT NULL,
  `SCOPE_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`USER_CONSENT_ID`,`SCOPE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FED_USER_CONSENT_CL_SCOPE`
--

LOCK TABLES `FED_USER_CONSENT_CL_SCOPE` WRITE;
/*!40000 ALTER TABLE `FED_USER_CONSENT_CL_SCOPE` DISABLE KEYS */;
/*!40000 ALTER TABLE `FED_USER_CONSENT_CL_SCOPE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FED_USER_CREDENTIAL`
--

DROP TABLE IF EXISTS `FED_USER_CREDENTIAL`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `FED_USER_CREDENTIAL` (
  `ID` varchar(36) NOT NULL,
  `SALT` tinyblob,
  `TYPE` varchar(255) DEFAULT NULL,
  `CREATED_DATE` bigint DEFAULT NULL,
  `USER_ID` varchar(255) NOT NULL,
  `REALM_ID` varchar(36) NOT NULL,
  `STORAGE_PROVIDER_ID` varchar(36) DEFAULT NULL,
  `USER_LABEL` varchar(255) DEFAULT NULL,
  `SECRET_DATA` longtext,
  `CREDENTIAL_DATA` longtext,
  `PRIORITY` int DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_FU_CREDENTIAL` (`USER_ID`,`TYPE`),
  KEY `IDX_FU_CREDENTIAL_RU` (`REALM_ID`,`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FED_USER_CREDENTIAL`
--

LOCK TABLES `FED_USER_CREDENTIAL` WRITE;
/*!40000 ALTER TABLE `FED_USER_CREDENTIAL` DISABLE KEYS */;
/*!40000 ALTER TABLE `FED_USER_CREDENTIAL` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FED_USER_GROUP_MEMBERSHIP`
--

DROP TABLE IF EXISTS `FED_USER_GROUP_MEMBERSHIP`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `FED_USER_GROUP_MEMBERSHIP` (
  `GROUP_ID` varchar(36) NOT NULL,
  `USER_ID` varchar(255) NOT NULL,
  `REALM_ID` varchar(36) NOT NULL,
  `STORAGE_PROVIDER_ID` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`GROUP_ID`,`USER_ID`),
  KEY `IDX_FU_GROUP_MEMBERSHIP` (`USER_ID`,`GROUP_ID`),
  KEY `IDX_FU_GROUP_MEMBERSHIP_RU` (`REALM_ID`,`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FED_USER_GROUP_MEMBERSHIP`
--

LOCK TABLES `FED_USER_GROUP_MEMBERSHIP` WRITE;
/*!40000 ALTER TABLE `FED_USER_GROUP_MEMBERSHIP` DISABLE KEYS */;
/*!40000 ALTER TABLE `FED_USER_GROUP_MEMBERSHIP` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FED_USER_REQUIRED_ACTION`
--

DROP TABLE IF EXISTS `FED_USER_REQUIRED_ACTION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `FED_USER_REQUIRED_ACTION` (
  `REQUIRED_ACTION` varchar(255) NOT NULL DEFAULT ' ',
  `USER_ID` varchar(255) NOT NULL,
  `REALM_ID` varchar(36) NOT NULL,
  `STORAGE_PROVIDER_ID` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`REQUIRED_ACTION`,`USER_ID`),
  KEY `IDX_FU_REQUIRED_ACTION` (`USER_ID`,`REQUIRED_ACTION`),
  KEY `IDX_FU_REQUIRED_ACTION_RU` (`REALM_ID`,`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FED_USER_REQUIRED_ACTION`
--

LOCK TABLES `FED_USER_REQUIRED_ACTION` WRITE;
/*!40000 ALTER TABLE `FED_USER_REQUIRED_ACTION` DISABLE KEYS */;
/*!40000 ALTER TABLE `FED_USER_REQUIRED_ACTION` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FED_USER_ROLE_MAPPING`
--

DROP TABLE IF EXISTS `FED_USER_ROLE_MAPPING`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `FED_USER_ROLE_MAPPING` (
  `ROLE_ID` varchar(36) NOT NULL,
  `USER_ID` varchar(255) NOT NULL,
  `REALM_ID` varchar(36) NOT NULL,
  `STORAGE_PROVIDER_ID` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`ROLE_ID`,`USER_ID`),
  KEY `IDX_FU_ROLE_MAPPING` (`USER_ID`,`ROLE_ID`),
  KEY `IDX_FU_ROLE_MAPPING_RU` (`REALM_ID`,`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FED_USER_ROLE_MAPPING`
--

LOCK TABLES `FED_USER_ROLE_MAPPING` WRITE;
/*!40000 ALTER TABLE `FED_USER_ROLE_MAPPING` DISABLE KEYS */;
/*!40000 ALTER TABLE `FED_USER_ROLE_MAPPING` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `GROUP_ATTRIBUTE`
--

DROP TABLE IF EXISTS `GROUP_ATTRIBUTE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `GROUP_ATTRIBUTE` (
  `ID` varchar(36) NOT NULL DEFAULT 'sybase-needs-something-here',
  `NAME` varchar(255) NOT NULL,
  `VALUE` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `GROUP_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_GROUP_ATTR_GROUP` (`GROUP_ID`),
  KEY `IDX_GROUP_ATT_BY_NAME_VALUE` (`NAME`,`VALUE`),
  CONSTRAINT `FK_GROUP_ATTRIBUTE_GROUP` FOREIGN KEY (`GROUP_ID`) REFERENCES `KEYCLOAK_GROUP` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `GROUP_ATTRIBUTE`
--

LOCK TABLES `GROUP_ATTRIBUTE` WRITE;
/*!40000 ALTER TABLE `GROUP_ATTRIBUTE` DISABLE KEYS */;
/*!40000 ALTER TABLE `GROUP_ATTRIBUTE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `GROUP_ROLE_MAPPING`
--

DROP TABLE IF EXISTS `GROUP_ROLE_MAPPING`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `GROUP_ROLE_MAPPING` (
  `ROLE_ID` varchar(36) NOT NULL,
  `GROUP_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`ROLE_ID`,`GROUP_ID`),
  KEY `IDX_GROUP_ROLE_MAPP_GROUP` (`GROUP_ID`),
  CONSTRAINT `FK_GROUP_ROLE_GROUP` FOREIGN KEY (`GROUP_ID`) REFERENCES `KEYCLOAK_GROUP` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `GROUP_ROLE_MAPPING`
--

LOCK TABLES `GROUP_ROLE_MAPPING` WRITE;
/*!40000 ALTER TABLE `GROUP_ROLE_MAPPING` DISABLE KEYS */;
/*!40000 ALTER TABLE `GROUP_ROLE_MAPPING` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `IDENTITY_PROVIDER`
--

DROP TABLE IF EXISTS `IDENTITY_PROVIDER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `IDENTITY_PROVIDER` (
  `INTERNAL_ID` varchar(36) NOT NULL,
  `ENABLED` bit(1) NOT NULL DEFAULT b'0',
  `PROVIDER_ALIAS` varchar(255) DEFAULT NULL,
  `PROVIDER_ID` varchar(255) DEFAULT NULL,
  `STORE_TOKEN` bit(1) NOT NULL DEFAULT b'0',
  `AUTHENTICATE_BY_DEFAULT` bit(1) NOT NULL DEFAULT b'0',
  `REALM_ID` varchar(36) DEFAULT NULL,
  `ADD_TOKEN_ROLE` bit(1) NOT NULL DEFAULT b'1',
  `TRUST_EMAIL` bit(1) NOT NULL DEFAULT b'0',
  `FIRST_BROKER_LOGIN_FLOW_ID` varchar(36) DEFAULT NULL,
  `POST_BROKER_LOGIN_FLOW_ID` varchar(36) DEFAULT NULL,
  `PROVIDER_DISPLAY_NAME` varchar(255) DEFAULT NULL,
  `LINK_ONLY` bit(1) NOT NULL DEFAULT b'0',
  PRIMARY KEY (`INTERNAL_ID`),
  UNIQUE KEY `UK_2DAELWNIBJI49AVXSRTUF6XJ33` (`PROVIDER_ALIAS`,`REALM_ID`),
  KEY `IDX_IDENT_PROV_REALM` (`REALM_ID`),
  CONSTRAINT `FK2B4EBC52AE5C3B34` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `IDENTITY_PROVIDER`
--

LOCK TABLES `IDENTITY_PROVIDER` WRITE;
/*!40000 ALTER TABLE `IDENTITY_PROVIDER` DISABLE KEYS */;
/*!40000 ALTER TABLE `IDENTITY_PROVIDER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `IDENTITY_PROVIDER_CONFIG`
--

DROP TABLE IF EXISTS `IDENTITY_PROVIDER_CONFIG`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `IDENTITY_PROVIDER_CONFIG` (
  `IDENTITY_PROVIDER_ID` varchar(36) NOT NULL,
  `VALUE` longtext,
  `NAME` varchar(255) NOT NULL,
  PRIMARY KEY (`IDENTITY_PROVIDER_ID`,`NAME`),
  CONSTRAINT `FKDC4897CF864C4E43` FOREIGN KEY (`IDENTITY_PROVIDER_ID`) REFERENCES `IDENTITY_PROVIDER` (`INTERNAL_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `IDENTITY_PROVIDER_CONFIG`
--

LOCK TABLES `IDENTITY_PROVIDER_CONFIG` WRITE;
/*!40000 ALTER TABLE `IDENTITY_PROVIDER_CONFIG` DISABLE KEYS */;
/*!40000 ALTER TABLE `IDENTITY_PROVIDER_CONFIG` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `IDENTITY_PROVIDER_MAPPER`
--

DROP TABLE IF EXISTS `IDENTITY_PROVIDER_MAPPER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `IDENTITY_PROVIDER_MAPPER` (
  `ID` varchar(36) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  `IDP_ALIAS` varchar(255) NOT NULL,
  `IDP_MAPPER_NAME` varchar(255) NOT NULL,
  `REALM_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_ID_PROV_MAPP_REALM` (`REALM_ID`),
  CONSTRAINT `FK_IDPM_REALM` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `IDENTITY_PROVIDER_MAPPER`
--

LOCK TABLES `IDENTITY_PROVIDER_MAPPER` WRITE;
/*!40000 ALTER TABLE `IDENTITY_PROVIDER_MAPPER` DISABLE KEYS */;
/*!40000 ALTER TABLE `IDENTITY_PROVIDER_MAPPER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `IDP_MAPPER_CONFIG`
--

DROP TABLE IF EXISTS `IDP_MAPPER_CONFIG`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `IDP_MAPPER_CONFIG` (
  `IDP_MAPPER_ID` varchar(36) NOT NULL,
  `VALUE` longtext,
  `NAME` varchar(255) NOT NULL,
  PRIMARY KEY (`IDP_MAPPER_ID`,`NAME`),
  CONSTRAINT `FK_IDPMCONFIG` FOREIGN KEY (`IDP_MAPPER_ID`) REFERENCES `IDENTITY_PROVIDER_MAPPER` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `IDP_MAPPER_CONFIG`
--

LOCK TABLES `IDP_MAPPER_CONFIG` WRITE;
/*!40000 ALTER TABLE `IDP_MAPPER_CONFIG` DISABLE KEYS */;
/*!40000 ALTER TABLE `IDP_MAPPER_CONFIG` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `KEYCLOAK_GROUP`
--

DROP TABLE IF EXISTS `KEYCLOAK_GROUP`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `KEYCLOAK_GROUP` (
  `ID` varchar(36) NOT NULL,
  `NAME` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `PARENT_GROUP` varchar(36) NOT NULL,
  `REALM_ID` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `SIBLING_NAMES` (`REALM_ID`,`PARENT_GROUP`,`NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `KEYCLOAK_GROUP`
--

LOCK TABLES `KEYCLOAK_GROUP` WRITE;
/*!40000 ALTER TABLE `KEYCLOAK_GROUP` DISABLE KEYS */;
/*!40000 ALTER TABLE `KEYCLOAK_GROUP` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `KEYCLOAK_ROLE`
--

DROP TABLE IF EXISTS `KEYCLOAK_ROLE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `KEYCLOAK_ROLE` (
  `ID` varchar(36) NOT NULL,
  `CLIENT_REALM_CONSTRAINT` varchar(255) DEFAULT NULL,
  `CLIENT_ROLE` bit(1) DEFAULT NULL,
  `DESCRIPTION` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `NAME` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `REALM_ID` varchar(255) DEFAULT NULL,
  `CLIENT` varchar(36) DEFAULT NULL,
  `REALM` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UK_J3RWUVD56ONTGSUHOGM184WW2-2` (`NAME`,`CLIENT_REALM_CONSTRAINT`),
  KEY `IDX_KEYCLOAK_ROLE_CLIENT` (`CLIENT`),
  KEY `IDX_KEYCLOAK_ROLE_REALM` (`REALM`),
  CONSTRAINT `FK_6VYQFE4CN4WLQ8R6KT5VDSJ5C` FOREIGN KEY (`REALM`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `KEYCLOAK_ROLE`
--

LOCK TABLES `KEYCLOAK_ROLE` WRITE;
/*!40000 ALTER TABLE `KEYCLOAK_ROLE` DISABLE KEYS */;
INSERT INTO `KEYCLOAK_ROLE` VALUES ('02a52401-7887-43eb-900e-81c5fe6d8a19','71b430a1-13aa-445b-b52b-f0b6080a42d1',_binary '','${role_view-users}','view-users','60416dc2-4603-4f6b-b014-b0b0fbe038ce','71b430a1-13aa-445b-b52b-f0b6080a42d1',NULL),('08bfc845-6807-4865-ac1c-01059360b513','71b430a1-13aa-445b-b52b-f0b6080a42d1',_binary '','${role_view-authorization}','view-authorization','60416dc2-4603-4f6b-b014-b0b0fbe038ce','71b430a1-13aa-445b-b52b-f0b6080a42d1',NULL),('0e7aaf6e-7ba7-48fa-b683-ac6393559aca','b398c2ec-ba42-40b6-aedd-6fbdd3d475c6',_binary '','${role_view-clients}','view-clients','c0270858-075b-431d-93d7-153e3204d46f','b398c2ec-ba42-40b6-aedd-6fbdd3d475c6',NULL),('133c4c6e-15ef-4490-bf21-020b26792be3','c0270858-075b-431d-93d7-153e3204d46f',_binary '\0','','Admin','c0270858-075b-431d-93d7-153e3204d46f',NULL,NULL),('139ba057-78c8-4f37-86ee-be2d8d2566a3','c0270858-075b-431d-93d7-153e3204d46f',_binary '\0','${role_uma_authorization}','uma_authorization','c0270858-075b-431d-93d7-153e3204d46f',NULL,NULL),('16a07c63-8b66-4f86-866d-ffdc840b5dad','27b90d93-a3c8-45e5-8a4d-aaed000799c6',_binary '','${role_manage-account}','manage-account','c0270858-075b-431d-93d7-153e3204d46f','27b90d93-a3c8-45e5-8a4d-aaed000799c6',NULL),('1aebcecf-8adc-4e69-b485-80f21fc1093c','60416dc2-4603-4f6b-b014-b0b0fbe038ce',_binary '\0','${role_admin}','admin','60416dc2-4603-4f6b-b014-b0b0fbe038ce',NULL,NULL),('1b848569-d933-4fbf-ab0f-6d497f5c43df','b398c2ec-ba42-40b6-aedd-6fbdd3d475c6',_binary '','${role_create-client}','create-client','c0270858-075b-431d-93d7-153e3204d46f','b398c2ec-ba42-40b6-aedd-6fbdd3d475c6',NULL),('1f419206-0405-4aa9-a36a-aa4dcb5a4315','71b430a1-13aa-445b-b52b-f0b6080a42d1',_binary '','${role_view-realm}','view-realm','60416dc2-4603-4f6b-b014-b0b0fbe038ce','71b430a1-13aa-445b-b52b-f0b6080a42d1',NULL),('218a01f9-818e-4b4e-82ae-69fa82663ddf','b398c2ec-ba42-40b6-aedd-6fbdd3d475c6',_binary '','${role_query-realms}','query-realms','c0270858-075b-431d-93d7-153e3204d46f','b398c2ec-ba42-40b6-aedd-6fbdd3d475c6',NULL),('231c6c50-86bb-4b07-af47-c671e0d45ce7','e0e71877-84e1-4787-a07b-7f76b1bccfef',_binary '','${role_manage-events}','manage-events','60416dc2-4603-4f6b-b014-b0b0fbe038ce','e0e71877-84e1-4787-a07b-7f76b1bccfef',NULL),('26b3acc0-1f1b-4267-bf16-d9634640b921','60416dc2-4603-4f6b-b014-b0b0fbe038ce',_binary '\0','${role_uma_authorization}','uma_authorization','60416dc2-4603-4f6b-b014-b0b0fbe038ce',NULL,NULL),('27961cb3-7976-42da-b626-e13437575689','e0e71877-84e1-4787-a07b-7f76b1bccfef',_binary '','${role_query-realms}','query-realms','60416dc2-4603-4f6b-b014-b0b0fbe038ce','e0e71877-84e1-4787-a07b-7f76b1bccfef',NULL),('29549b30-20b7-4a8b-95a0-3e9725c1a7fd','b398c2ec-ba42-40b6-aedd-6fbdd3d475c6',_binary '','${role_manage-authorization}','manage-authorization','c0270858-075b-431d-93d7-153e3204d46f','b398c2ec-ba42-40b6-aedd-6fbdd3d475c6',NULL),('29d2aa2d-87cc-4764-bfc5-598e62b92455','e0e71877-84e1-4787-a07b-7f76b1bccfef',_binary '','${role_manage-authorization}','manage-authorization','60416dc2-4603-4f6b-b014-b0b0fbe038ce','e0e71877-84e1-4787-a07b-7f76b1bccfef',NULL),('2ac21b0a-8867-4b25-858a-a2abc9d74ebc','b398c2ec-ba42-40b6-aedd-6fbdd3d475c6',_binary '','${role_manage-realm}','manage-realm','c0270858-075b-431d-93d7-153e3204d46f','b398c2ec-ba42-40b6-aedd-6fbdd3d475c6',NULL),('2fc80fec-7f34-4494-936c-dbdb2b575007','71b430a1-13aa-445b-b52b-f0b6080a42d1',_binary '','${role_manage-users}','manage-users','60416dc2-4603-4f6b-b014-b0b0fbe038ce','71b430a1-13aa-445b-b52b-f0b6080a42d1',NULL),('3377a0ba-bd3a-42d2-aa3b-8a159052b928','e0e71877-84e1-4787-a07b-7f76b1bccfef',_binary '','${role_query-groups}','query-groups','60416dc2-4603-4f6b-b014-b0b0fbe038ce','e0e71877-84e1-4787-a07b-7f76b1bccfef',NULL),('358962ff-267f-4aa9-ab39-f5bcce8453cd','e58e3d3a-56e9-4d28-90ce-79e9e7b2b35a',_binary '','${role_manage-account-links}','manage-account-links','60416dc2-4603-4f6b-b014-b0b0fbe038ce','e58e3d3a-56e9-4d28-90ce-79e9e7b2b35a',NULL),('381247f7-1fbd-4ef2-ba2c-6ea24c2461fb','e415f27a-40ae-49eb-a2ac-0e6cd4490d2d',_binary '',NULL,'uma_protection','c0270858-075b-431d-93d7-153e3204d46f','e415f27a-40ae-49eb-a2ac-0e6cd4490d2d',NULL),('3adfd9a9-1bd7-405c-a650-c216f6cecc6c','b398c2ec-ba42-40b6-aedd-6fbdd3d475c6',_binary '','${role_manage-events}','manage-events','c0270858-075b-431d-93d7-153e3204d46f','b398c2ec-ba42-40b6-aedd-6fbdd3d475c6',NULL),('3cb8422d-5b17-4797-9207-14eb5dfa2705','60416dc2-4603-4f6b-b014-b0b0fbe038ce',_binary '\0','${role_offline-access}','offline_access','60416dc2-4603-4f6b-b014-b0b0fbe038ce',NULL,NULL),('3cd86926-2dfa-4d9d-8b8c-12d58d567819','e0e71877-84e1-4787-a07b-7f76b1bccfef',_binary '','${role_view-identity-providers}','view-identity-providers','60416dc2-4603-4f6b-b014-b0b0fbe038ce','e0e71877-84e1-4787-a07b-7f76b1bccfef',NULL),('3e7b2373-751a-435f-a4d5-f7964b5f8030','e58e3d3a-56e9-4d28-90ce-79e9e7b2b35a',_binary '','${role_view-groups}','view-groups','60416dc2-4603-4f6b-b014-b0b0fbe038ce','e58e3d3a-56e9-4d28-90ce-79e9e7b2b35a',NULL),('3f568f86-118e-4a41-b7b0-b2e9f08eb369','e58e3d3a-56e9-4d28-90ce-79e9e7b2b35a',_binary '','${role_manage-account}','manage-account','60416dc2-4603-4f6b-b014-b0b0fbe038ce','e58e3d3a-56e9-4d28-90ce-79e9e7b2b35a',NULL),('42f7d461-4ddf-4f0b-adc8-2e6d82e5d1c2','b398c2ec-ba42-40b6-aedd-6fbdd3d475c6',_binary '','${role_view-users}','view-users','c0270858-075b-431d-93d7-153e3204d46f','b398c2ec-ba42-40b6-aedd-6fbdd3d475c6',NULL),('4433dc8e-05c5-47c5-a6ac-83b53fbfb750','b398c2ec-ba42-40b6-aedd-6fbdd3d475c6',_binary '','${role_view-identity-providers}','view-identity-providers','c0270858-075b-431d-93d7-153e3204d46f','b398c2ec-ba42-40b6-aedd-6fbdd3d475c6',NULL),('44802841-7c2b-48da-9587-432036397679','c0270858-075b-431d-93d7-153e3204d46f',_binary '\0','${role_offline-access}','offline_access','c0270858-075b-431d-93d7-153e3204d46f',NULL,NULL),('498a43ea-2981-41ef-a542-b50ee1a33057','e0e71877-84e1-4787-a07b-7f76b1bccfef',_binary '','${role_view-users}','view-users','60416dc2-4603-4f6b-b014-b0b0fbe038ce','e0e71877-84e1-4787-a07b-7f76b1bccfef',NULL),('4b87c334-1622-4cab-af09-e3652df7258d','b398c2ec-ba42-40b6-aedd-6fbdd3d475c6',_binary '','${role_query-users}','query-users','c0270858-075b-431d-93d7-153e3204d46f','b398c2ec-ba42-40b6-aedd-6fbdd3d475c6',NULL),('4d37f56c-202e-4daa-a6ae-84a41e81487d','e0e71877-84e1-4787-a07b-7f76b1bccfef',_binary '','${role_manage-identity-providers}','manage-identity-providers','60416dc2-4603-4f6b-b014-b0b0fbe038ce','e0e71877-84e1-4787-a07b-7f76b1bccfef',NULL),('50a5f68f-b3c5-484b-9b7b-1765acbeab7a','27b90d93-a3c8-45e5-8a4d-aaed000799c6',_binary '','${role_view-groups}','view-groups','c0270858-075b-431d-93d7-153e3204d46f','27b90d93-a3c8-45e5-8a4d-aaed000799c6',NULL),('510b6b27-d5d8-4868-9bf4-856f1d3a33db','e0e71877-84e1-4787-a07b-7f76b1bccfef',_binary '','${role_view-events}','view-events','60416dc2-4603-4f6b-b014-b0b0fbe038ce','e0e71877-84e1-4787-a07b-7f76b1bccfef',NULL),('5890f655-0adf-461d-ae9d-63bcfa5531ae','27b90d93-a3c8-45e5-8a4d-aaed000799c6',_binary '','${role_view-consent}','view-consent','c0270858-075b-431d-93d7-153e3204d46f','27b90d93-a3c8-45e5-8a4d-aaed000799c6',NULL),('589ded18-9374-4bca-8802-ec091049947f','71b430a1-13aa-445b-b52b-f0b6080a42d1',_binary '','${role_impersonation}','impersonation','60416dc2-4603-4f6b-b014-b0b0fbe038ce','71b430a1-13aa-445b-b52b-f0b6080a42d1',NULL),('58aaecbc-9727-4626-9439-f9ea5cb302b1','7650bb8c-8665-4a1b-aa6e-4d595db480da',_binary '','${role_read-token}','read-token','60416dc2-4603-4f6b-b014-b0b0fbe038ce','7650bb8c-8665-4a1b-aa6e-4d595db480da',NULL),('5a0117c6-8c56-4219-9ed4-6b4af7179b4f','e58e3d3a-56e9-4d28-90ce-79e9e7b2b35a',_binary '','${role_view-applications}','view-applications','60416dc2-4603-4f6b-b014-b0b0fbe038ce','e58e3d3a-56e9-4d28-90ce-79e9e7b2b35a',NULL),('64efea4e-8e9c-443b-a32f-76b4047e81a1','71b430a1-13aa-445b-b52b-f0b6080a42d1',_binary '','${role_query-clients}','query-clients','60416dc2-4603-4f6b-b014-b0b0fbe038ce','71b430a1-13aa-445b-b52b-f0b6080a42d1',NULL),('70110785-3ff0-4835-8b7f-e05d5f9edef4','71b430a1-13aa-445b-b52b-f0b6080a42d1',_binary '','${role_query-realms}','query-realms','60416dc2-4603-4f6b-b014-b0b0fbe038ce','71b430a1-13aa-445b-b52b-f0b6080a42d1',NULL),('74600cd0-4706-47f2-bee7-1ecd1111ff01','e0e71877-84e1-4787-a07b-7f76b1bccfef',_binary '','${role_view-authorization}','view-authorization','60416dc2-4603-4f6b-b014-b0b0fbe038ce','e0e71877-84e1-4787-a07b-7f76b1bccfef',NULL),('76c45d4b-57b0-432e-a76a-02ff39ec8540','71b430a1-13aa-445b-b52b-f0b6080a42d1',_binary '','${role_manage-events}','manage-events','60416dc2-4603-4f6b-b014-b0b0fbe038ce','71b430a1-13aa-445b-b52b-f0b6080a42d1',NULL),('76d5f9c5-4c03-48bb-9419-a54229470319','71b430a1-13aa-445b-b52b-f0b6080a42d1',_binary '','${role_manage-clients}','manage-clients','60416dc2-4603-4f6b-b014-b0b0fbe038ce','71b430a1-13aa-445b-b52b-f0b6080a42d1',NULL),('7a220076-f74d-4aec-a06f-9ec4bec9a6d3','163c079e-1355-43cb-a6ec-450a4eabd255',_binary '','${role_read-token}','read-token','c0270858-075b-431d-93d7-153e3204d46f','163c079e-1355-43cb-a6ec-450a4eabd255',NULL),('7c7bbe86-4b2b-4ab3-8c9f-c4500f108846','b398c2ec-ba42-40b6-aedd-6fbdd3d475c6',_binary '','${role_manage-users}','manage-users','c0270858-075b-431d-93d7-153e3204d46f','b398c2ec-ba42-40b6-aedd-6fbdd3d475c6',NULL),('7ce993fb-ce28-442f-b716-f927333332f0','27b90d93-a3c8-45e5-8a4d-aaed000799c6',_binary '','${role_view-applications}','view-applications','c0270858-075b-431d-93d7-153e3204d46f','27b90d93-a3c8-45e5-8a4d-aaed000799c6',NULL),('80f75133-d515-4a55-999d-1be78bc3bdd1','b398c2ec-ba42-40b6-aedd-6fbdd3d475c6',_binary '','${role_realm-admin}','realm-admin','c0270858-075b-431d-93d7-153e3204d46f','b398c2ec-ba42-40b6-aedd-6fbdd3d475c6',NULL),('88666123-5ae1-4ab8-a8f4-1a5b81a779fc','b398c2ec-ba42-40b6-aedd-6fbdd3d475c6',_binary '','${role_manage-identity-providers}','manage-identity-providers','c0270858-075b-431d-93d7-153e3204d46f','b398c2ec-ba42-40b6-aedd-6fbdd3d475c6',NULL),('8b37d242-420b-420c-a6c3-2357dfb663dd','27b90d93-a3c8-45e5-8a4d-aaed000799c6',_binary '','${role_delete-account}','delete-account','c0270858-075b-431d-93d7-153e3204d46f','27b90d93-a3c8-45e5-8a4d-aaed000799c6',NULL),('8c21c63b-350e-4cd4-87b2-af41efd09c0e','b398c2ec-ba42-40b6-aedd-6fbdd3d475c6',_binary '','${role_view-authorization}','view-authorization','c0270858-075b-431d-93d7-153e3204d46f','b398c2ec-ba42-40b6-aedd-6fbdd3d475c6',NULL),('8c78fdc4-2f58-412c-bb2a-5bcf4577691a','27b90d93-a3c8-45e5-8a4d-aaed000799c6',_binary '','${role_manage-account-links}','manage-account-links','c0270858-075b-431d-93d7-153e3204d46f','27b90d93-a3c8-45e5-8a4d-aaed000799c6',NULL),('8e50fcf0-e2ac-421f-8c05-fa0dbc3ba1fd','71b430a1-13aa-445b-b52b-f0b6080a42d1',_binary '','${role_view-clients}','view-clients','60416dc2-4603-4f6b-b014-b0b0fbe038ce','71b430a1-13aa-445b-b52b-f0b6080a42d1',NULL),('9375436b-7e42-4484-a503-a5d355dcec8e','e58e3d3a-56e9-4d28-90ce-79e9e7b2b35a',_binary '','${role_manage-consent}','manage-consent','60416dc2-4603-4f6b-b014-b0b0fbe038ce','e58e3d3a-56e9-4d28-90ce-79e9e7b2b35a',NULL),('94f51e68-7249-42a5-8f65-b17c162611d7','e58e3d3a-56e9-4d28-90ce-79e9e7b2b35a',_binary '','${role_delete-account}','delete-account','60416dc2-4603-4f6b-b014-b0b0fbe038ce','e58e3d3a-56e9-4d28-90ce-79e9e7b2b35a',NULL),('953db61f-7a2a-4dd9-8f06-06b33c77e162','e0e71877-84e1-4787-a07b-7f76b1bccfef',_binary '','${role_create-client}','create-client','60416dc2-4603-4f6b-b014-b0b0fbe038ce','e0e71877-84e1-4787-a07b-7f76b1bccfef',NULL),('9583c292-b2f9-443b-bc69-3b597c8125f2','b398c2ec-ba42-40b6-aedd-6fbdd3d475c6',_binary '','${role_view-events}','view-events','c0270858-075b-431d-93d7-153e3204d46f','b398c2ec-ba42-40b6-aedd-6fbdd3d475c6',NULL),('97ce3eee-e496-453f-ad2f-93b8b5f8e5c5','27b90d93-a3c8-45e5-8a4d-aaed000799c6',_binary '','${role_manage-consent}','manage-consent','c0270858-075b-431d-93d7-153e3204d46f','27b90d93-a3c8-45e5-8a4d-aaed000799c6',NULL),('98fd112d-d3ea-4d48-86aa-b325056e853b','71b430a1-13aa-445b-b52b-f0b6080a42d1',_binary '','${role_view-events}','view-events','60416dc2-4603-4f6b-b014-b0b0fbe038ce','71b430a1-13aa-445b-b52b-f0b6080a42d1',NULL),('9d1640e8-e2f7-44d3-b888-ed3aad80307e','b398c2ec-ba42-40b6-aedd-6fbdd3d475c6',_binary '','${role_query-clients}','query-clients','c0270858-075b-431d-93d7-153e3204d46f','b398c2ec-ba42-40b6-aedd-6fbdd3d475c6',NULL),('9e7256ec-fc97-44b2-bba6-b1bd7cc82d1f','e0e71877-84e1-4787-a07b-7f76b1bccfef',_binary '','${role_view-clients}','view-clients','60416dc2-4603-4f6b-b014-b0b0fbe038ce','e0e71877-84e1-4787-a07b-7f76b1bccfef',NULL),('a3b008f6-db35-4ec6-977d-d7d851eb99a9','71b430a1-13aa-445b-b52b-f0b6080a42d1',_binary '','${role_create-client}','create-client','60416dc2-4603-4f6b-b014-b0b0fbe038ce','71b430a1-13aa-445b-b52b-f0b6080a42d1',NULL),('a3fb3bf9-938e-4ddb-8f63-ecb065153108','c0270858-075b-431d-93d7-153e3204d46f',_binary '\0','${role_default-roles}','default-roles-billing-service','c0270858-075b-431d-93d7-153e3204d46f',NULL,NULL),('abdf18ec-fb43-4dd4-9048-9a5f31898481','60416dc2-4603-4f6b-b014-b0b0fbe038ce',_binary '\0','${role_default-roles}','default-roles-master','60416dc2-4603-4f6b-b014-b0b0fbe038ce',NULL,NULL),('ad072a87-c1ad-4cc0-ad09-c0227e6decd6','71b430a1-13aa-445b-b52b-f0b6080a42d1',_binary '','${role_manage-authorization}','manage-authorization','60416dc2-4603-4f6b-b014-b0b0fbe038ce','71b430a1-13aa-445b-b52b-f0b6080a42d1',NULL),('ad58efd3-b9e5-4389-9ec3-c764b7a3c2eb','e0e71877-84e1-4787-a07b-7f76b1bccfef',_binary '','${role_manage-users}','manage-users','60416dc2-4603-4f6b-b014-b0b0fbe038ce','e0e71877-84e1-4787-a07b-7f76b1bccfef',NULL),('afdea75b-0853-49e7-bc05-2e8e54963680','e0e71877-84e1-4787-a07b-7f76b1bccfef',_binary '','${role_impersonation}','impersonation','60416dc2-4603-4f6b-b014-b0b0fbe038ce','e0e71877-84e1-4787-a07b-7f76b1bccfef',NULL),('b0c8566b-dc6e-4f50-95b1-7eaeb52cacf6','60416dc2-4603-4f6b-b014-b0b0fbe038ce',_binary '\0','${role_create-realm}','create-realm','60416dc2-4603-4f6b-b014-b0b0fbe038ce',NULL,NULL),('b72d25c0-1c76-4af0-9786-60606b29dde3','e58e3d3a-56e9-4d28-90ce-79e9e7b2b35a',_binary '','${role_view-profile}','view-profile','60416dc2-4603-4f6b-b014-b0b0fbe038ce','e58e3d3a-56e9-4d28-90ce-79e9e7b2b35a',NULL),('b98f1086-8a7b-43c2-93c2-303726f6032a','b398c2ec-ba42-40b6-aedd-6fbdd3d475c6',_binary '','${role_impersonation}','impersonation','c0270858-075b-431d-93d7-153e3204d46f','b398c2ec-ba42-40b6-aedd-6fbdd3d475c6',NULL),('c5576523-182e-4024-85a9-a1199c837554','b398c2ec-ba42-40b6-aedd-6fbdd3d475c6',_binary '','${role_manage-clients}','manage-clients','c0270858-075b-431d-93d7-153e3204d46f','b398c2ec-ba42-40b6-aedd-6fbdd3d475c6',NULL),('c74c92e2-391f-4197-b8cf-b6eb0e148af4','e7ceccbe-612c-424a-8550-1566ffb84a52',_binary '',NULL,'uma_protection','c0270858-075b-431d-93d7-153e3204d46f','e7ceccbe-612c-424a-8550-1566ffb84a52',NULL),('ca362fea-4d07-4a1c-8914-a6af3d0ceeed','e0e71877-84e1-4787-a07b-7f76b1bccfef',_binary '','${role_view-realm}','view-realm','60416dc2-4603-4f6b-b014-b0b0fbe038ce','e0e71877-84e1-4787-a07b-7f76b1bccfef',NULL),('ce1b5d0c-cc6f-4332-8520-47f82319c708','27b90d93-a3c8-45e5-8a4d-aaed000799c6',_binary '','${role_view-profile}','view-profile','c0270858-075b-431d-93d7-153e3204d46f','27b90d93-a3c8-45e5-8a4d-aaed000799c6',NULL),('cf02a5de-d478-4b23-835f-dd10fd07f793','e0e71877-84e1-4787-a07b-7f76b1bccfef',_binary '','${role_manage-realm}','manage-realm','60416dc2-4603-4f6b-b014-b0b0fbe038ce','e0e71877-84e1-4787-a07b-7f76b1bccfef',NULL),('d0182e1b-8dfa-4fd7-9b55-df46c0374912','e58e3d3a-56e9-4d28-90ce-79e9e7b2b35a',_binary '','${role_view-consent}','view-consent','60416dc2-4603-4f6b-b014-b0b0fbe038ce','e58e3d3a-56e9-4d28-90ce-79e9e7b2b35a',NULL),('e024f4ce-6c3c-45c0-bb7a-7ff831a3f268','71b430a1-13aa-445b-b52b-f0b6080a42d1',_binary '','${role_view-identity-providers}','view-identity-providers','60416dc2-4603-4f6b-b014-b0b0fbe038ce','71b430a1-13aa-445b-b52b-f0b6080a42d1',NULL),('e2992291-8a66-48c2-86a9-51bed3d7d01f','b398c2ec-ba42-40b6-aedd-6fbdd3d475c6',_binary '','${role_view-realm}','view-realm','c0270858-075b-431d-93d7-153e3204d46f','b398c2ec-ba42-40b6-aedd-6fbdd3d475c6',NULL),('e63bc050-dd07-42be-ab6d-413e109cca92','71b430a1-13aa-445b-b52b-f0b6080a42d1',_binary '','${role_manage-identity-providers}','manage-identity-providers','60416dc2-4603-4f6b-b014-b0b0fbe038ce','71b430a1-13aa-445b-b52b-f0b6080a42d1',NULL),('e705c105-9ddf-45b4-9778-36139c2b87ad','71b430a1-13aa-445b-b52b-f0b6080a42d1',_binary '','${role_query-groups}','query-groups','60416dc2-4603-4f6b-b014-b0b0fbe038ce','71b430a1-13aa-445b-b52b-f0b6080a42d1',NULL),('ea20c9d5-1a63-4691-990e-396e47a048d1','e0e71877-84e1-4787-a07b-7f76b1bccfef',_binary '','${role_query-clients}','query-clients','60416dc2-4603-4f6b-b014-b0b0fbe038ce','e0e71877-84e1-4787-a07b-7f76b1bccfef',NULL),('ee411137-dde1-496b-961b-206db2196dc4','b398c2ec-ba42-40b6-aedd-6fbdd3d475c6',_binary '','${role_query-groups}','query-groups','c0270858-075b-431d-93d7-153e3204d46f','b398c2ec-ba42-40b6-aedd-6fbdd3d475c6',NULL),('f025aed3-349b-4e05-8f09-7c16c00bfaff','71b430a1-13aa-445b-b52b-f0b6080a42d1',_binary '','${role_query-users}','query-users','60416dc2-4603-4f6b-b014-b0b0fbe038ce','71b430a1-13aa-445b-b52b-f0b6080a42d1',NULL),('fa2d3739-63e1-45e8-9316-6b24ade15c0f','71b430a1-13aa-445b-b52b-f0b6080a42d1',_binary '','${role_manage-realm}','manage-realm','60416dc2-4603-4f6b-b014-b0b0fbe038ce','71b430a1-13aa-445b-b52b-f0b6080a42d1',NULL),('fe50b5b8-60be-4a4a-8a04-dd9d813a71df','e0e71877-84e1-4787-a07b-7f76b1bccfef',_binary '','${role_query-users}','query-users','60416dc2-4603-4f6b-b014-b0b0fbe038ce','e0e71877-84e1-4787-a07b-7f76b1bccfef',NULL),('feea1873-64e9-4c8d-a97d-7edaaee40604','e0e71877-84e1-4787-a07b-7f76b1bccfef',_binary '','${role_manage-clients}','manage-clients','60416dc2-4603-4f6b-b014-b0b0fbe038ce','e0e71877-84e1-4787-a07b-7f76b1bccfef',NULL);
/*!40000 ALTER TABLE `KEYCLOAK_ROLE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `MIGRATION_MODEL`
--

DROP TABLE IF EXISTS `MIGRATION_MODEL`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `MIGRATION_MODEL` (
  `ID` varchar(36) NOT NULL,
  `VERSION` varchar(36) DEFAULT NULL,
  `UPDATE_TIME` bigint NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `IDX_UPDATE_TIME` (`UPDATE_TIME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `MIGRATION_MODEL`
--

LOCK TABLES `MIGRATION_MODEL` WRITE;
/*!40000 ALTER TABLE `MIGRATION_MODEL` DISABLE KEYS */;
INSERT INTO `MIGRATION_MODEL` VALUES ('8md0d','22.0.4',1697235458);
/*!40000 ALTER TABLE `MIGRATION_MODEL` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `OFFLINE_CLIENT_SESSION`
--

DROP TABLE IF EXISTS `OFFLINE_CLIENT_SESSION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `OFFLINE_CLIENT_SESSION` (
  `USER_SESSION_ID` varchar(36) NOT NULL,
  `CLIENT_ID` varchar(255) NOT NULL,
  `OFFLINE_FLAG` varchar(4) NOT NULL,
  `TIMESTAMP` int DEFAULT NULL,
  `DATA` longtext,
  `CLIENT_STORAGE_PROVIDER` varchar(36) NOT NULL DEFAULT 'local',
  `EXTERNAL_CLIENT_ID` varchar(255) NOT NULL DEFAULT 'local',
  PRIMARY KEY (`USER_SESSION_ID`,`CLIENT_ID`,`CLIENT_STORAGE_PROVIDER`,`EXTERNAL_CLIENT_ID`,`OFFLINE_FLAG`),
  KEY `IDX_US_SESS_ID_ON_CL_SESS` (`USER_SESSION_ID`),
  KEY `IDX_OFFLINE_CSS_PRELOAD` (`CLIENT_ID`,`OFFLINE_FLAG`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `OFFLINE_CLIENT_SESSION`
--

LOCK TABLES `OFFLINE_CLIENT_SESSION` WRITE;
/*!40000 ALTER TABLE `OFFLINE_CLIENT_SESSION` DISABLE KEYS */;
/*!40000 ALTER TABLE `OFFLINE_CLIENT_SESSION` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `OFFLINE_USER_SESSION`
--

DROP TABLE IF EXISTS `OFFLINE_USER_SESSION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `OFFLINE_USER_SESSION` (
  `USER_SESSION_ID` varchar(36) NOT NULL,
  `USER_ID` varchar(255) DEFAULT NULL,
  `REALM_ID` varchar(36) NOT NULL,
  `CREATED_ON` int NOT NULL,
  `OFFLINE_FLAG` varchar(4) NOT NULL,
  `DATA` longtext,
  `LAST_SESSION_REFRESH` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`USER_SESSION_ID`,`OFFLINE_FLAG`),
  KEY `IDX_OFFLINE_USS_CREATEDON` (`CREATED_ON`),
  KEY `IDX_OFFLINE_USS_PRELOAD` (`OFFLINE_FLAG`,`CREATED_ON`,`USER_SESSION_ID`),
  KEY `IDX_OFFLINE_USS_BY_USER` (`USER_ID`,`REALM_ID`,`OFFLINE_FLAG`),
  KEY `IDX_OFFLINE_USS_BY_USERSESS` (`REALM_ID`,`OFFLINE_FLAG`,`USER_SESSION_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `OFFLINE_USER_SESSION`
--

LOCK TABLES `OFFLINE_USER_SESSION` WRITE;
/*!40000 ALTER TABLE `OFFLINE_USER_SESSION` DISABLE KEYS */;
/*!40000 ALTER TABLE `OFFLINE_USER_SESSION` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `POLICY_CONFIG`
--

DROP TABLE IF EXISTS `POLICY_CONFIG`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `POLICY_CONFIG` (
  `POLICY_ID` varchar(36) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  `VALUE` longtext,
  PRIMARY KEY (`POLICY_ID`,`NAME`),
  CONSTRAINT `FKDC34197CF864C4E43` FOREIGN KEY (`POLICY_ID`) REFERENCES `RESOURCE_SERVER_POLICY` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `POLICY_CONFIG`
--

LOCK TABLES `POLICY_CONFIG` WRITE;
/*!40000 ALTER TABLE `POLICY_CONFIG` DISABLE KEYS */;
INSERT INTO `POLICY_CONFIG` VALUES ('308b4cde-d7aa-4957-977e-dfc3ea070622','defaultResourceType','urn:billing-service-client:resources:default'),('747bb0ad-7114-46cc-9373-cdaff55e0c32','code','// by default, grants any permission associated with this policy\n$evaluation.grant();\n');
/*!40000 ALTER TABLE `POLICY_CONFIG` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PROTOCOL_MAPPER`
--

DROP TABLE IF EXISTS `PROTOCOL_MAPPER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `PROTOCOL_MAPPER` (
  `ID` varchar(36) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  `PROTOCOL` varchar(255) NOT NULL,
  `PROTOCOL_MAPPER_NAME` varchar(255) NOT NULL,
  `CLIENT_ID` varchar(36) DEFAULT NULL,
  `CLIENT_SCOPE_ID` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_PROTOCOL_MAPPER_CLIENT` (`CLIENT_ID`),
  KEY `IDX_CLSCOPE_PROTMAP` (`CLIENT_SCOPE_ID`),
  CONSTRAINT `FK_CLI_SCOPE_MAPPER` FOREIGN KEY (`CLIENT_SCOPE_ID`) REFERENCES `CLIENT_SCOPE` (`ID`),
  CONSTRAINT `FK_PCM_REALM` FOREIGN KEY (`CLIENT_ID`) REFERENCES `CLIENT` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PROTOCOL_MAPPER`
--

LOCK TABLES `PROTOCOL_MAPPER` WRITE;
/*!40000 ALTER TABLE `PROTOCOL_MAPPER` DISABLE KEYS */;
INSERT INTO `PROTOCOL_MAPPER` VALUES ('02c1c6f7-abc0-4018-b94a-0d85db8d882b','Client IP Address','openid-connect','oidc-usersessionmodel-note-mapper','e415f27a-40ae-49eb-a2ac-0e6cd4490d2d',NULL),('09ad72e0-5018-443a-aed1-431a3f241c53','birthdate','openid-connect','oidc-usermodel-attribute-mapper',NULL,'6a8a948f-e623-4951-a513-1e054da6dd63'),('0e65dc38-08a1-489d-8723-700a401022ea','updated at','openid-connect','oidc-usermodel-attribute-mapper',NULL,'6a8a948f-e623-4951-a513-1e054da6dd63'),('1f78e333-ea38-4470-928b-8b612299fa54','Client ID','openid-connect','oidc-usersessionmodel-note-mapper','e7ceccbe-612c-424a-8550-1566ffb84a52',NULL),('2307176b-511e-4094-a2e3-10838c35a2a0','updated at','openid-connect','oidc-usermodel-attribute-mapper',NULL,'a94a581f-72c2-4467-8669-c32378847ca1'),('34b0dc88-fc43-46f3-b7e8-0d166ddf774a','profile','openid-connect','oidc-usermodel-attribute-mapper',NULL,'6a8a948f-e623-4951-a513-1e054da6dd63'),('36378712-56f0-4178-91e3-c4d95f818dfe','allowed web origins','openid-connect','oidc-allowed-origins-mapper',NULL,'1b049fb0-e99d-47fa-9fbb-f955769cb27c'),('3934ae7b-1918-46cc-ac16-2e1634b9d248','client roles','openid-connect','oidc-usermodel-client-role-mapper',NULL,'76cea90a-8d2a-40f6-b44c-d00a5e2b0306'),('3cc86d5e-51c2-4748-93c7-e438b088a9c2','locale','openid-connect','oidc-usermodel-attribute-mapper',NULL,'6a8a948f-e623-4951-a513-1e054da6dd63'),('3d16aca4-887e-49b4-8090-391bc5fad1e4','Client Host','openid-connect','oidc-usersessionmodel-note-mapper','e415f27a-40ae-49eb-a2ac-0e6cd4490d2d',NULL),('50d9564f-b296-46a4-8b72-6644204858b3','middle name','openid-connect','oidc-usermodel-attribute-mapper',NULL,'a94a581f-72c2-4467-8669-c32378847ca1'),('52b24cbd-0db2-46a6-a164-4b342f65d947','gender','openid-connect','oidc-usermodel-attribute-mapper',NULL,'6a8a948f-e623-4951-a513-1e054da6dd63'),('54af5ab7-1e1a-4c2a-9de5-7139f12187aa','username','openid-connect','oidc-usermodel-attribute-mapper',NULL,'a94a581f-72c2-4467-8669-c32378847ca1'),('59927967-3de6-4606-af74-851243cbe927','phone number','openid-connect','oidc-usermodel-attribute-mapper',NULL,'12a98ef7-ae4f-4ec3-8900-27ccc54fb8c7'),('5b4fe537-deea-4685-a1b6-a4506aeb70b1','family name','openid-connect','oidc-usermodel-attribute-mapper',NULL,'6a8a948f-e623-4951-a513-1e054da6dd63'),('6421dfb0-2343-4bee-9083-8c643287012d','username','openid-connect','oidc-usermodel-attribute-mapper',NULL,'6a8a948f-e623-4951-a513-1e054da6dd63'),('64edfb0f-5d07-48f5-aeae-4984ac128721','given name','openid-connect','oidc-usermodel-attribute-mapper',NULL,'a94a581f-72c2-4467-8669-c32378847ca1'),('67ea6da5-cb7e-467d-be1c-aa8646558e44','zoneinfo','openid-connect','oidc-usermodel-attribute-mapper',NULL,'a94a581f-72c2-4467-8669-c32378847ca1'),('6847b834-716f-4688-adee-2e8f8c11ae61','realm roles','openid-connect','oidc-usermodel-realm-role-mapper',NULL,'eb77e8cc-1ddc-45ba-8808-d3be948c246d'),('6c18e078-abe7-4029-b446-b085d4c6f59d','email verified','openid-connect','oidc-usermodel-property-mapper',NULL,'436391f8-e42a-4b97-a142-77a0c69d4d61'),('714d8298-da34-4957-9ef2-44ef313d2e3c','locale','openid-connect','oidc-usermodel-attribute-mapper','b29858d1-dc20-4c75-983f-aa249b104e88',NULL),('73b12191-dc68-4654-9ae3-91c0e49986ab','acr loa level','openid-connect','oidc-acr-mapper',NULL,'2e127e80-d25c-40fc-9832-360fb3a408e9'),('73bf04fd-1670-4461-9023-f88609dea9a9','gender','openid-connect','oidc-usermodel-attribute-mapper',NULL,'a94a581f-72c2-4467-8669-c32378847ca1'),('74fbd4f1-d177-4368-843b-d7f793af91ea','audience resolve','openid-connect','oidc-audience-resolve-mapper','3f461ac6-c6b6-4bc6-ad41-37845e946201',NULL),('7abb8235-6efa-4e9b-9ca8-448b2341599a','upn','openid-connect','oidc-usermodel-attribute-mapper',NULL,'c6f03dea-77eb-4d5b-b55f-0033753a7373'),('7c087415-de93-4bd3-b959-a65e156c45f2','upn','openid-connect','oidc-usermodel-attribute-mapper',NULL,'69f81257-559c-4b1f-b519-793d849ad963'),('7ffc2b89-bd06-4cd6-a5eb-6921e95ac9a1','audience resolve','openid-connect','oidc-audience-resolve-mapper','23a0d2d8-1531-4d8d-8e88-a87b19de2363',NULL),('82d23ab1-9f23-466b-80ae-65ee5d99d6dd','address','openid-connect','oidc-address-mapper',NULL,'15361359-d13e-4f51-9a1d-51b27852d94b'),('8f7afdcd-e877-4f79-bb59-63da071656cb','phone number verified','openid-connect','oidc-usermodel-attribute-mapper',NULL,'12a98ef7-ae4f-4ec3-8900-27ccc54fb8c7'),('90db5e11-1a8a-4226-a7f0-60a59a25ffea','family name','openid-connect','oidc-usermodel-attribute-mapper',NULL,'a94a581f-72c2-4467-8669-c32378847ca1'),('9dc35bd1-af08-4fdc-83d1-922e3fa65bc2','email','openid-connect','oidc-usermodel-attribute-mapper',NULL,'433edf47-627c-4f7f-856a-e0c9182c31f1'),('9fd380f4-0324-466a-acb6-5cbc44b510fb','full name','openid-connect','oidc-full-name-mapper',NULL,'6a8a948f-e623-4951-a513-1e054da6dd63'),('a21d8a1a-9df3-4239-a481-ceaeca0e4690','phone number verified','openid-connect','oidc-usermodel-attribute-mapper',NULL,'72ad9bdd-c17c-4f7d-ad25-d090d4cca129'),('a565db29-496b-43a4-9f8f-44b86893f38f','realm roles','openid-connect','oidc-usermodel-realm-role-mapper',NULL,'76cea90a-8d2a-40f6-b44c-d00a5e2b0306'),('a74bccdb-1ec6-431a-8ebb-9ddc43d62d7d','website','openid-connect','oidc-usermodel-attribute-mapper',NULL,'a94a581f-72c2-4467-8669-c32378847ca1'),('a7ac67ad-e9bd-4188-9fd7-243d230bbcab','Client ID','openid-connect','oidc-usersessionmodel-note-mapper','e415f27a-40ae-49eb-a2ac-0e6cd4490d2d',NULL),('a9eb0bd1-4a79-413d-a44d-4daf97091003','role list','saml','saml-role-list-mapper',NULL,'224b7450-9c2c-4d9a-866b-505c01ef69a4'),('ad9aa49b-1bad-47b8-8abc-056242bd640a','picture','openid-connect','oidc-usermodel-attribute-mapper',NULL,'6a8a948f-e623-4951-a513-1e054da6dd63'),('b6f4b675-0a6e-413e-9a66-7d251fe4ce34','middle name','openid-connect','oidc-usermodel-attribute-mapper',NULL,'6a8a948f-e623-4951-a513-1e054da6dd63'),('b864c50d-6568-457c-a190-6fc78050b261','profile','openid-connect','oidc-usermodel-attribute-mapper',NULL,'a94a581f-72c2-4467-8669-c32378847ca1'),('bba609bc-326c-4cce-bc03-9037cf032cb8','picture','openid-connect','oidc-usermodel-attribute-mapper',NULL,'a94a581f-72c2-4467-8669-c32378847ca1'),('bcd4b9a4-e65a-4bbd-9ea9-97c1b91446b1','birthdate','openid-connect','oidc-usermodel-attribute-mapper',NULL,'a94a581f-72c2-4467-8669-c32378847ca1'),('be6e0c46-82c2-431b-b9cd-60b9c8029ad6','given name','openid-connect','oidc-usermodel-attribute-mapper',NULL,'6a8a948f-e623-4951-a513-1e054da6dd63'),('bf716dbf-462a-4f11-831e-5eca02f2f071','role list','saml','saml-role-list-mapper',NULL,'f27c47ce-6d87-4f94-8a74-cbf2d9ed3d03'),('c08f3790-75c3-4764-8a80-6abf4d3657d6','full name','openid-connect','oidc-full-name-mapper',NULL,'a94a581f-72c2-4467-8669-c32378847ca1'),('c3816dce-0b8c-4118-811b-94eee3223f04','Client Host','openid-connect','oidc-usersessionmodel-note-mapper','e7ceccbe-612c-424a-8550-1566ffb84a52',NULL),('c3fb46a7-7600-4184-95dc-727bd65d7ac2','address','openid-connect','oidc-address-mapper',NULL,'3b183c0c-fc99-45f5-9dbd-38303176114c'),('c4aeb220-5b56-4831-b02e-9151a123e011','email','openid-connect','oidc-usermodel-attribute-mapper',NULL,'436391f8-e42a-4b97-a142-77a0c69d4d61'),('c6d97f3a-67bd-490e-be4e-d33d156dd6d1','phone number','openid-connect','oidc-usermodel-attribute-mapper',NULL,'72ad9bdd-c17c-4f7d-ad25-d090d4cca129'),('cf7b6ec2-3f79-4990-bae9-02571633c7ea','acr loa level','openid-connect','oidc-acr-mapper',NULL,'96ee4e31-ef97-4b03-9558-a872c45c4623'),('d1448011-dfb0-49fa-8129-c6eeb9932ee1','locale','openid-connect','oidc-usermodel-attribute-mapper','f5a1ace1-bd2f-4b96-914a-0e491b492cdc',NULL),('d6f7d3e3-1ee3-4263-a250-af9e0b82bd49','website','openid-connect','oidc-usermodel-attribute-mapper',NULL,'6a8a948f-e623-4951-a513-1e054da6dd63'),('d888c314-0f7a-49db-9076-951e2899c962','audience resolve','openid-connect','oidc-audience-resolve-mapper',NULL,'eb77e8cc-1ddc-45ba-8808-d3be948c246d'),('db2f8a23-f9d9-47c4-ae1d-34755574b170','locale','openid-connect','oidc-usermodel-attribute-mapper',NULL,'a94a581f-72c2-4467-8669-c32378847ca1'),('dd1f54c8-61d7-4755-bfaf-9275db651932','groups','openid-connect','oidc-usermodel-realm-role-mapper',NULL,'69f81257-559c-4b1f-b519-793d849ad963'),('e16a5a4d-8438-4743-86c4-369df7cdf980','Client IP Address','openid-connect','oidc-usersessionmodel-note-mapper','e7ceccbe-612c-424a-8550-1566ffb84a52',NULL),('e1a1d829-bb04-4166-86f3-7c36d2070521','audience resolve','openid-connect','oidc-audience-resolve-mapper',NULL,'76cea90a-8d2a-40f6-b44c-d00a5e2b0306'),('e592c8d0-c231-4feb-b60b-7e70ba17766f','client roles','openid-connect','oidc-usermodel-client-role-mapper',NULL,'eb77e8cc-1ddc-45ba-8808-d3be948c246d'),('e66a8000-3d9c-42dc-970c-cc158043f9db','zoneinfo','openid-connect','oidc-usermodel-attribute-mapper',NULL,'6a8a948f-e623-4951-a513-1e054da6dd63'),('e8fd789b-bdaa-4e93-8b61-637cb297b81a','allowed web origins','openid-connect','oidc-allowed-origins-mapper',NULL,'b5e3935f-48cf-407a-8da4-4de979a88396'),('f15969c0-61e2-40ce-9289-daa0c8f46081','nickname','openid-connect','oidc-usermodel-attribute-mapper',NULL,'6a8a948f-e623-4951-a513-1e054da6dd63'),('f5014c68-0337-4ff8-be91-cbb3334dd003','email verified','openid-connect','oidc-usermodel-property-mapper',NULL,'433edf47-627c-4f7f-856a-e0c9182c31f1'),('fbac4826-fad0-429d-b17c-fc22ac23dbd9','nickname','openid-connect','oidc-usermodel-attribute-mapper',NULL,'a94a581f-72c2-4467-8669-c32378847ca1'),('feefd0aa-3b79-483b-8c67-389f2d4fe05a','groups','openid-connect','oidc-usermodel-realm-role-mapper',NULL,'c6f03dea-77eb-4d5b-b55f-0033753a7373');
/*!40000 ALTER TABLE `PROTOCOL_MAPPER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PROTOCOL_MAPPER_CONFIG`
--

DROP TABLE IF EXISTS `PROTOCOL_MAPPER_CONFIG`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `PROTOCOL_MAPPER_CONFIG` (
  `PROTOCOL_MAPPER_ID` varchar(36) NOT NULL,
  `VALUE` longtext,
  `NAME` varchar(255) NOT NULL,
  PRIMARY KEY (`PROTOCOL_MAPPER_ID`,`NAME`),
  CONSTRAINT `FK_PMCONFIG` FOREIGN KEY (`PROTOCOL_MAPPER_ID`) REFERENCES `PROTOCOL_MAPPER` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PROTOCOL_MAPPER_CONFIG`
--

LOCK TABLES `PROTOCOL_MAPPER_CONFIG` WRITE;
/*!40000 ALTER TABLE `PROTOCOL_MAPPER_CONFIG` DISABLE KEYS */;
INSERT INTO `PROTOCOL_MAPPER_CONFIG` VALUES ('02c1c6f7-abc0-4018-b94a-0d85db8d882b','true','access.token.claim'),('02c1c6f7-abc0-4018-b94a-0d85db8d882b','clientAddress','claim.name'),('02c1c6f7-abc0-4018-b94a-0d85db8d882b','true','id.token.claim'),('02c1c6f7-abc0-4018-b94a-0d85db8d882b','String','jsonType.label'),('02c1c6f7-abc0-4018-b94a-0d85db8d882b','clientAddress','user.session.note'),('09ad72e0-5018-443a-aed1-431a3f241c53','true','access.token.claim'),('09ad72e0-5018-443a-aed1-431a3f241c53','birthdate','claim.name'),('09ad72e0-5018-443a-aed1-431a3f241c53','true','id.token.claim'),('09ad72e0-5018-443a-aed1-431a3f241c53','String','jsonType.label'),('09ad72e0-5018-443a-aed1-431a3f241c53','birthdate','user.attribute'),('09ad72e0-5018-443a-aed1-431a3f241c53','true','userinfo.token.claim'),('0e65dc38-08a1-489d-8723-700a401022ea','true','access.token.claim'),('0e65dc38-08a1-489d-8723-700a401022ea','updated_at','claim.name'),('0e65dc38-08a1-489d-8723-700a401022ea','true','id.token.claim'),('0e65dc38-08a1-489d-8723-700a401022ea','long','jsonType.label'),('0e65dc38-08a1-489d-8723-700a401022ea','updatedAt','user.attribute'),('0e65dc38-08a1-489d-8723-700a401022ea','true','userinfo.token.claim'),('1f78e333-ea38-4470-928b-8b612299fa54','true','access.token.claim'),('1f78e333-ea38-4470-928b-8b612299fa54','client_id','claim.name'),('1f78e333-ea38-4470-928b-8b612299fa54','true','id.token.claim'),('1f78e333-ea38-4470-928b-8b612299fa54','String','jsonType.label'),('1f78e333-ea38-4470-928b-8b612299fa54','client_id','user.session.note'),('2307176b-511e-4094-a2e3-10838c35a2a0','true','access.token.claim'),('2307176b-511e-4094-a2e3-10838c35a2a0','updated_at','claim.name'),('2307176b-511e-4094-a2e3-10838c35a2a0','true','id.token.claim'),('2307176b-511e-4094-a2e3-10838c35a2a0','long','jsonType.label'),('2307176b-511e-4094-a2e3-10838c35a2a0','updatedAt','user.attribute'),('2307176b-511e-4094-a2e3-10838c35a2a0','true','userinfo.token.claim'),('34b0dc88-fc43-46f3-b7e8-0d166ddf774a','true','access.token.claim'),('34b0dc88-fc43-46f3-b7e8-0d166ddf774a','profile','claim.name'),('34b0dc88-fc43-46f3-b7e8-0d166ddf774a','true','id.token.claim'),('34b0dc88-fc43-46f3-b7e8-0d166ddf774a','String','jsonType.label'),('34b0dc88-fc43-46f3-b7e8-0d166ddf774a','profile','user.attribute'),('34b0dc88-fc43-46f3-b7e8-0d166ddf774a','true','userinfo.token.claim'),('3934ae7b-1918-46cc-ac16-2e1634b9d248','true','access.token.claim'),('3934ae7b-1918-46cc-ac16-2e1634b9d248','resource_access.${client_id}.roles','claim.name'),('3934ae7b-1918-46cc-ac16-2e1634b9d248','String','jsonType.label'),('3934ae7b-1918-46cc-ac16-2e1634b9d248','true','multivalued'),('3934ae7b-1918-46cc-ac16-2e1634b9d248','foo','user.attribute'),('3cc86d5e-51c2-4748-93c7-e438b088a9c2','true','access.token.claim'),('3cc86d5e-51c2-4748-93c7-e438b088a9c2','locale','claim.name'),('3cc86d5e-51c2-4748-93c7-e438b088a9c2','true','id.token.claim'),('3cc86d5e-51c2-4748-93c7-e438b088a9c2','String','jsonType.label'),('3cc86d5e-51c2-4748-93c7-e438b088a9c2','locale','user.attribute'),('3cc86d5e-51c2-4748-93c7-e438b088a9c2','true','userinfo.token.claim'),('3d16aca4-887e-49b4-8090-391bc5fad1e4','true','access.token.claim'),('3d16aca4-887e-49b4-8090-391bc5fad1e4','clientHost','claim.name'),('3d16aca4-887e-49b4-8090-391bc5fad1e4','true','id.token.claim'),('3d16aca4-887e-49b4-8090-391bc5fad1e4','String','jsonType.label'),('3d16aca4-887e-49b4-8090-391bc5fad1e4','clientHost','user.session.note'),('50d9564f-b296-46a4-8b72-6644204858b3','true','access.token.claim'),('50d9564f-b296-46a4-8b72-6644204858b3','middle_name','claim.name'),('50d9564f-b296-46a4-8b72-6644204858b3','true','id.token.claim'),('50d9564f-b296-46a4-8b72-6644204858b3','String','jsonType.label'),('50d9564f-b296-46a4-8b72-6644204858b3','middleName','user.attribute'),('50d9564f-b296-46a4-8b72-6644204858b3','true','userinfo.token.claim'),('52b24cbd-0db2-46a6-a164-4b342f65d947','true','access.token.claim'),('52b24cbd-0db2-46a6-a164-4b342f65d947','gender','claim.name'),('52b24cbd-0db2-46a6-a164-4b342f65d947','true','id.token.claim'),('52b24cbd-0db2-46a6-a164-4b342f65d947','String','jsonType.label'),('52b24cbd-0db2-46a6-a164-4b342f65d947','gender','user.attribute'),('52b24cbd-0db2-46a6-a164-4b342f65d947','true','userinfo.token.claim'),('54af5ab7-1e1a-4c2a-9de5-7139f12187aa','true','access.token.claim'),('54af5ab7-1e1a-4c2a-9de5-7139f12187aa','preferred_username','claim.name'),('54af5ab7-1e1a-4c2a-9de5-7139f12187aa','true','id.token.claim'),('54af5ab7-1e1a-4c2a-9de5-7139f12187aa','String','jsonType.label'),('54af5ab7-1e1a-4c2a-9de5-7139f12187aa','username','user.attribute'),('54af5ab7-1e1a-4c2a-9de5-7139f12187aa','true','userinfo.token.claim'),('59927967-3de6-4606-af74-851243cbe927','true','access.token.claim'),('59927967-3de6-4606-af74-851243cbe927','phone_number','claim.name'),('59927967-3de6-4606-af74-851243cbe927','true','id.token.claim'),('59927967-3de6-4606-af74-851243cbe927','String','jsonType.label'),('59927967-3de6-4606-af74-851243cbe927','phoneNumber','user.attribute'),('59927967-3de6-4606-af74-851243cbe927','true','userinfo.token.claim'),('5b4fe537-deea-4685-a1b6-a4506aeb70b1','true','access.token.claim'),('5b4fe537-deea-4685-a1b6-a4506aeb70b1','family_name','claim.name'),('5b4fe537-deea-4685-a1b6-a4506aeb70b1','true','id.token.claim'),('5b4fe537-deea-4685-a1b6-a4506aeb70b1','String','jsonType.label'),('5b4fe537-deea-4685-a1b6-a4506aeb70b1','lastName','user.attribute'),('5b4fe537-deea-4685-a1b6-a4506aeb70b1','true','userinfo.token.claim'),('6421dfb0-2343-4bee-9083-8c643287012d','true','access.token.claim'),('6421dfb0-2343-4bee-9083-8c643287012d','preferred_username','claim.name'),('6421dfb0-2343-4bee-9083-8c643287012d','true','id.token.claim'),('6421dfb0-2343-4bee-9083-8c643287012d','String','jsonType.label'),('6421dfb0-2343-4bee-9083-8c643287012d','username','user.attribute'),('6421dfb0-2343-4bee-9083-8c643287012d','true','userinfo.token.claim'),('64edfb0f-5d07-48f5-aeae-4984ac128721','true','access.token.claim'),('64edfb0f-5d07-48f5-aeae-4984ac128721','given_name','claim.name'),('64edfb0f-5d07-48f5-aeae-4984ac128721','true','id.token.claim'),('64edfb0f-5d07-48f5-aeae-4984ac128721','String','jsonType.label'),('64edfb0f-5d07-48f5-aeae-4984ac128721','firstName','user.attribute'),('64edfb0f-5d07-48f5-aeae-4984ac128721','true','userinfo.token.claim'),('67ea6da5-cb7e-467d-be1c-aa8646558e44','true','access.token.claim'),('67ea6da5-cb7e-467d-be1c-aa8646558e44','zoneinfo','claim.name'),('67ea6da5-cb7e-467d-be1c-aa8646558e44','true','id.token.claim'),('67ea6da5-cb7e-467d-be1c-aa8646558e44','String','jsonType.label'),('67ea6da5-cb7e-467d-be1c-aa8646558e44','zoneinfo','user.attribute'),('67ea6da5-cb7e-467d-be1c-aa8646558e44','true','userinfo.token.claim'),('6847b834-716f-4688-adee-2e8f8c11ae61','true','access.token.claim'),('6847b834-716f-4688-adee-2e8f8c11ae61','realm_access.roles','claim.name'),('6847b834-716f-4688-adee-2e8f8c11ae61','String','jsonType.label'),('6847b834-716f-4688-adee-2e8f8c11ae61','true','multivalued'),('6847b834-716f-4688-adee-2e8f8c11ae61','foo','user.attribute'),('6c18e078-abe7-4029-b446-b085d4c6f59d','true','access.token.claim'),('6c18e078-abe7-4029-b446-b085d4c6f59d','email_verified','claim.name'),('6c18e078-abe7-4029-b446-b085d4c6f59d','true','id.token.claim'),('6c18e078-abe7-4029-b446-b085d4c6f59d','boolean','jsonType.label'),('6c18e078-abe7-4029-b446-b085d4c6f59d','emailVerified','user.attribute'),('6c18e078-abe7-4029-b446-b085d4c6f59d','true','userinfo.token.claim'),('714d8298-da34-4957-9ef2-44ef313d2e3c','true','access.token.claim'),('714d8298-da34-4957-9ef2-44ef313d2e3c','locale','claim.name'),('714d8298-da34-4957-9ef2-44ef313d2e3c','true','id.token.claim'),('714d8298-da34-4957-9ef2-44ef313d2e3c','String','jsonType.label'),('714d8298-da34-4957-9ef2-44ef313d2e3c','locale','user.attribute'),('714d8298-da34-4957-9ef2-44ef313d2e3c','true','userinfo.token.claim'),('73b12191-dc68-4654-9ae3-91c0e49986ab','true','access.token.claim'),('73b12191-dc68-4654-9ae3-91c0e49986ab','true','id.token.claim'),('73bf04fd-1670-4461-9023-f88609dea9a9','true','access.token.claim'),('73bf04fd-1670-4461-9023-f88609dea9a9','gender','claim.name'),('73bf04fd-1670-4461-9023-f88609dea9a9','true','id.token.claim'),('73bf04fd-1670-4461-9023-f88609dea9a9','String','jsonType.label'),('73bf04fd-1670-4461-9023-f88609dea9a9','gender','user.attribute'),('73bf04fd-1670-4461-9023-f88609dea9a9','true','userinfo.token.claim'),('7abb8235-6efa-4e9b-9ca8-448b2341599a','true','access.token.claim'),('7abb8235-6efa-4e9b-9ca8-448b2341599a','upn','claim.name'),('7abb8235-6efa-4e9b-9ca8-448b2341599a','true','id.token.claim'),('7abb8235-6efa-4e9b-9ca8-448b2341599a','String','jsonType.label'),('7abb8235-6efa-4e9b-9ca8-448b2341599a','username','user.attribute'),('7abb8235-6efa-4e9b-9ca8-448b2341599a','true','userinfo.token.claim'),('7c087415-de93-4bd3-b959-a65e156c45f2','true','access.token.claim'),('7c087415-de93-4bd3-b959-a65e156c45f2','upn','claim.name'),('7c087415-de93-4bd3-b959-a65e156c45f2','true','id.token.claim'),('7c087415-de93-4bd3-b959-a65e156c45f2','String','jsonType.label'),('7c087415-de93-4bd3-b959-a65e156c45f2','username','user.attribute'),('7c087415-de93-4bd3-b959-a65e156c45f2','true','userinfo.token.claim'),('82d23ab1-9f23-466b-80ae-65ee5d99d6dd','true','access.token.claim'),('82d23ab1-9f23-466b-80ae-65ee5d99d6dd','true','id.token.claim'),('82d23ab1-9f23-466b-80ae-65ee5d99d6dd','country','user.attribute.country'),('82d23ab1-9f23-466b-80ae-65ee5d99d6dd','formatted','user.attribute.formatted'),('82d23ab1-9f23-466b-80ae-65ee5d99d6dd','locality','user.attribute.locality'),('82d23ab1-9f23-466b-80ae-65ee5d99d6dd','postal_code','user.attribute.postal_code'),('82d23ab1-9f23-466b-80ae-65ee5d99d6dd','region','user.attribute.region'),('82d23ab1-9f23-466b-80ae-65ee5d99d6dd','street','user.attribute.street'),('82d23ab1-9f23-466b-80ae-65ee5d99d6dd','true','userinfo.token.claim'),('8f7afdcd-e877-4f79-bb59-63da071656cb','true','access.token.claim'),('8f7afdcd-e877-4f79-bb59-63da071656cb','phone_number_verified','claim.name'),('8f7afdcd-e877-4f79-bb59-63da071656cb','true','id.token.claim'),('8f7afdcd-e877-4f79-bb59-63da071656cb','boolean','jsonType.label'),('8f7afdcd-e877-4f79-bb59-63da071656cb','phoneNumberVerified','user.attribute'),('8f7afdcd-e877-4f79-bb59-63da071656cb','true','userinfo.token.claim'),('90db5e11-1a8a-4226-a7f0-60a59a25ffea','true','access.token.claim'),('90db5e11-1a8a-4226-a7f0-60a59a25ffea','family_name','claim.name'),('90db5e11-1a8a-4226-a7f0-60a59a25ffea','true','id.token.claim'),('90db5e11-1a8a-4226-a7f0-60a59a25ffea','String','jsonType.label'),('90db5e11-1a8a-4226-a7f0-60a59a25ffea','lastName','user.attribute'),('90db5e11-1a8a-4226-a7f0-60a59a25ffea','true','userinfo.token.claim'),('9dc35bd1-af08-4fdc-83d1-922e3fa65bc2','true','access.token.claim'),('9dc35bd1-af08-4fdc-83d1-922e3fa65bc2','email','claim.name'),('9dc35bd1-af08-4fdc-83d1-922e3fa65bc2','true','id.token.claim'),('9dc35bd1-af08-4fdc-83d1-922e3fa65bc2','String','jsonType.label'),('9dc35bd1-af08-4fdc-83d1-922e3fa65bc2','email','user.attribute'),('9dc35bd1-af08-4fdc-83d1-922e3fa65bc2','true','userinfo.token.claim'),('9fd380f4-0324-466a-acb6-5cbc44b510fb','true','access.token.claim'),('9fd380f4-0324-466a-acb6-5cbc44b510fb','true','id.token.claim'),('9fd380f4-0324-466a-acb6-5cbc44b510fb','true','userinfo.token.claim'),('a21d8a1a-9df3-4239-a481-ceaeca0e4690','true','access.token.claim'),('a21d8a1a-9df3-4239-a481-ceaeca0e4690','phone_number_verified','claim.name'),('a21d8a1a-9df3-4239-a481-ceaeca0e4690','true','id.token.claim'),('a21d8a1a-9df3-4239-a481-ceaeca0e4690','boolean','jsonType.label'),('a21d8a1a-9df3-4239-a481-ceaeca0e4690','phoneNumberVerified','user.attribute'),('a21d8a1a-9df3-4239-a481-ceaeca0e4690','true','userinfo.token.claim'),('a565db29-496b-43a4-9f8f-44b86893f38f','true','access.token.claim'),('a565db29-496b-43a4-9f8f-44b86893f38f','realm_access.roles','claim.name'),('a565db29-496b-43a4-9f8f-44b86893f38f','String','jsonType.label'),('a565db29-496b-43a4-9f8f-44b86893f38f','true','multivalued'),('a565db29-496b-43a4-9f8f-44b86893f38f','foo','user.attribute'),('a74bccdb-1ec6-431a-8ebb-9ddc43d62d7d','true','access.token.claim'),('a74bccdb-1ec6-431a-8ebb-9ddc43d62d7d','website','claim.name'),('a74bccdb-1ec6-431a-8ebb-9ddc43d62d7d','true','id.token.claim'),('a74bccdb-1ec6-431a-8ebb-9ddc43d62d7d','String','jsonType.label'),('a74bccdb-1ec6-431a-8ebb-9ddc43d62d7d','website','user.attribute'),('a74bccdb-1ec6-431a-8ebb-9ddc43d62d7d','true','userinfo.token.claim'),('a7ac67ad-e9bd-4188-9fd7-243d230bbcab','true','access.token.claim'),('a7ac67ad-e9bd-4188-9fd7-243d230bbcab','client_id','claim.name'),('a7ac67ad-e9bd-4188-9fd7-243d230bbcab','true','id.token.claim'),('a7ac67ad-e9bd-4188-9fd7-243d230bbcab','String','jsonType.label'),('a7ac67ad-e9bd-4188-9fd7-243d230bbcab','client_id','user.session.note'),('a9eb0bd1-4a79-413d-a44d-4daf97091003','Role','attribute.name'),('a9eb0bd1-4a79-413d-a44d-4daf97091003','Basic','attribute.nameformat'),('a9eb0bd1-4a79-413d-a44d-4daf97091003','false','single'),('ad9aa49b-1bad-47b8-8abc-056242bd640a','true','access.token.claim'),('ad9aa49b-1bad-47b8-8abc-056242bd640a','picture','claim.name'),('ad9aa49b-1bad-47b8-8abc-056242bd640a','true','id.token.claim'),('ad9aa49b-1bad-47b8-8abc-056242bd640a','String','jsonType.label'),('ad9aa49b-1bad-47b8-8abc-056242bd640a','picture','user.attribute'),('ad9aa49b-1bad-47b8-8abc-056242bd640a','true','userinfo.token.claim'),('b6f4b675-0a6e-413e-9a66-7d251fe4ce34','true','access.token.claim'),('b6f4b675-0a6e-413e-9a66-7d251fe4ce34','middle_name','claim.name'),('b6f4b675-0a6e-413e-9a66-7d251fe4ce34','true','id.token.claim'),('b6f4b675-0a6e-413e-9a66-7d251fe4ce34','String','jsonType.label'),('b6f4b675-0a6e-413e-9a66-7d251fe4ce34','middleName','user.attribute'),('b6f4b675-0a6e-413e-9a66-7d251fe4ce34','true','userinfo.token.claim'),('b864c50d-6568-457c-a190-6fc78050b261','true','access.token.claim'),('b864c50d-6568-457c-a190-6fc78050b261','profile','claim.name'),('b864c50d-6568-457c-a190-6fc78050b261','true','id.token.claim'),('b864c50d-6568-457c-a190-6fc78050b261','String','jsonType.label'),('b864c50d-6568-457c-a190-6fc78050b261','profile','user.attribute'),('b864c50d-6568-457c-a190-6fc78050b261','true','userinfo.token.claim'),('bba609bc-326c-4cce-bc03-9037cf032cb8','true','access.token.claim'),('bba609bc-326c-4cce-bc03-9037cf032cb8','picture','claim.name'),('bba609bc-326c-4cce-bc03-9037cf032cb8','true','id.token.claim'),('bba609bc-326c-4cce-bc03-9037cf032cb8','String','jsonType.label'),('bba609bc-326c-4cce-bc03-9037cf032cb8','picture','user.attribute'),('bba609bc-326c-4cce-bc03-9037cf032cb8','true','userinfo.token.claim'),('bcd4b9a4-e65a-4bbd-9ea9-97c1b91446b1','true','access.token.claim'),('bcd4b9a4-e65a-4bbd-9ea9-97c1b91446b1','birthdate','claim.name'),('bcd4b9a4-e65a-4bbd-9ea9-97c1b91446b1','true','id.token.claim'),('bcd4b9a4-e65a-4bbd-9ea9-97c1b91446b1','String','jsonType.label'),('bcd4b9a4-e65a-4bbd-9ea9-97c1b91446b1','birthdate','user.attribute'),('bcd4b9a4-e65a-4bbd-9ea9-97c1b91446b1','true','userinfo.token.claim'),('be6e0c46-82c2-431b-b9cd-60b9c8029ad6','true','access.token.claim'),('be6e0c46-82c2-431b-b9cd-60b9c8029ad6','given_name','claim.name'),('be6e0c46-82c2-431b-b9cd-60b9c8029ad6','true','id.token.claim'),('be6e0c46-82c2-431b-b9cd-60b9c8029ad6','String','jsonType.label'),('be6e0c46-82c2-431b-b9cd-60b9c8029ad6','firstName','user.attribute'),('be6e0c46-82c2-431b-b9cd-60b9c8029ad6','true','userinfo.token.claim'),('bf716dbf-462a-4f11-831e-5eca02f2f071','Role','attribute.name'),('bf716dbf-462a-4f11-831e-5eca02f2f071','Basic','attribute.nameformat'),('bf716dbf-462a-4f11-831e-5eca02f2f071','false','single'),('c08f3790-75c3-4764-8a80-6abf4d3657d6','true','access.token.claim'),('c08f3790-75c3-4764-8a80-6abf4d3657d6','true','id.token.claim'),('c08f3790-75c3-4764-8a80-6abf4d3657d6','true','userinfo.token.claim'),('c3816dce-0b8c-4118-811b-94eee3223f04','true','access.token.claim'),('c3816dce-0b8c-4118-811b-94eee3223f04','clientHost','claim.name'),('c3816dce-0b8c-4118-811b-94eee3223f04','true','id.token.claim'),('c3816dce-0b8c-4118-811b-94eee3223f04','String','jsonType.label'),('c3816dce-0b8c-4118-811b-94eee3223f04','clientHost','user.session.note'),('c3fb46a7-7600-4184-95dc-727bd65d7ac2','true','access.token.claim'),('c3fb46a7-7600-4184-95dc-727bd65d7ac2','true','id.token.claim'),('c3fb46a7-7600-4184-95dc-727bd65d7ac2','country','user.attribute.country'),('c3fb46a7-7600-4184-95dc-727bd65d7ac2','formatted','user.attribute.formatted'),('c3fb46a7-7600-4184-95dc-727bd65d7ac2','locality','user.attribute.locality'),('c3fb46a7-7600-4184-95dc-727bd65d7ac2','postal_code','user.attribute.postal_code'),('c3fb46a7-7600-4184-95dc-727bd65d7ac2','region','user.attribute.region'),('c3fb46a7-7600-4184-95dc-727bd65d7ac2','street','user.attribute.street'),('c3fb46a7-7600-4184-95dc-727bd65d7ac2','true','userinfo.token.claim'),('c4aeb220-5b56-4831-b02e-9151a123e011','true','access.token.claim'),('c4aeb220-5b56-4831-b02e-9151a123e011','email','claim.name'),('c4aeb220-5b56-4831-b02e-9151a123e011','true','id.token.claim'),('c4aeb220-5b56-4831-b02e-9151a123e011','String','jsonType.label'),('c4aeb220-5b56-4831-b02e-9151a123e011','email','user.attribute'),('c4aeb220-5b56-4831-b02e-9151a123e011','true','userinfo.token.claim'),('c6d97f3a-67bd-490e-be4e-d33d156dd6d1','true','access.token.claim'),('c6d97f3a-67bd-490e-be4e-d33d156dd6d1','phone_number','claim.name'),('c6d97f3a-67bd-490e-be4e-d33d156dd6d1','true','id.token.claim'),('c6d97f3a-67bd-490e-be4e-d33d156dd6d1','String','jsonType.label'),('c6d97f3a-67bd-490e-be4e-d33d156dd6d1','phoneNumber','user.attribute'),('c6d97f3a-67bd-490e-be4e-d33d156dd6d1','true','userinfo.token.claim'),('cf7b6ec2-3f79-4990-bae9-02571633c7ea','true','access.token.claim'),('cf7b6ec2-3f79-4990-bae9-02571633c7ea','true','id.token.claim'),('d1448011-dfb0-49fa-8129-c6eeb9932ee1','true','access.token.claim'),('d1448011-dfb0-49fa-8129-c6eeb9932ee1','locale','claim.name'),('d1448011-dfb0-49fa-8129-c6eeb9932ee1','true','id.token.claim'),('d1448011-dfb0-49fa-8129-c6eeb9932ee1','String','jsonType.label'),('d1448011-dfb0-49fa-8129-c6eeb9932ee1','locale','user.attribute'),('d1448011-dfb0-49fa-8129-c6eeb9932ee1','true','userinfo.token.claim'),('d6f7d3e3-1ee3-4263-a250-af9e0b82bd49','true','access.token.claim'),('d6f7d3e3-1ee3-4263-a250-af9e0b82bd49','website','claim.name'),('d6f7d3e3-1ee3-4263-a250-af9e0b82bd49','true','id.token.claim'),('d6f7d3e3-1ee3-4263-a250-af9e0b82bd49','String','jsonType.label'),('d6f7d3e3-1ee3-4263-a250-af9e0b82bd49','website','user.attribute'),('d6f7d3e3-1ee3-4263-a250-af9e0b82bd49','true','userinfo.token.claim'),('db2f8a23-f9d9-47c4-ae1d-34755574b170','true','access.token.claim'),('db2f8a23-f9d9-47c4-ae1d-34755574b170','locale','claim.name'),('db2f8a23-f9d9-47c4-ae1d-34755574b170','true','id.token.claim'),('db2f8a23-f9d9-47c4-ae1d-34755574b170','String','jsonType.label'),('db2f8a23-f9d9-47c4-ae1d-34755574b170','locale','user.attribute'),('db2f8a23-f9d9-47c4-ae1d-34755574b170','true','userinfo.token.claim'),('dd1f54c8-61d7-4755-bfaf-9275db651932','true','access.token.claim'),('dd1f54c8-61d7-4755-bfaf-9275db651932','groups','claim.name'),('dd1f54c8-61d7-4755-bfaf-9275db651932','true','id.token.claim'),('dd1f54c8-61d7-4755-bfaf-9275db651932','String','jsonType.label'),('dd1f54c8-61d7-4755-bfaf-9275db651932','true','multivalued'),('dd1f54c8-61d7-4755-bfaf-9275db651932','foo','user.attribute'),('e16a5a4d-8438-4743-86c4-369df7cdf980','true','access.token.claim'),('e16a5a4d-8438-4743-86c4-369df7cdf980','clientAddress','claim.name'),('e16a5a4d-8438-4743-86c4-369df7cdf980','true','id.token.claim'),('e16a5a4d-8438-4743-86c4-369df7cdf980','String','jsonType.label'),('e16a5a4d-8438-4743-86c4-369df7cdf980','clientAddress','user.session.note'),('e592c8d0-c231-4feb-b60b-7e70ba17766f','true','access.token.claim'),('e592c8d0-c231-4feb-b60b-7e70ba17766f','resource_access.${client_id}.roles','claim.name'),('e592c8d0-c231-4feb-b60b-7e70ba17766f','String','jsonType.label'),('e592c8d0-c231-4feb-b60b-7e70ba17766f','true','multivalued'),('e592c8d0-c231-4feb-b60b-7e70ba17766f','foo','user.attribute'),('e66a8000-3d9c-42dc-970c-cc158043f9db','true','access.token.claim'),('e66a8000-3d9c-42dc-970c-cc158043f9db','zoneinfo','claim.name'),('e66a8000-3d9c-42dc-970c-cc158043f9db','true','id.token.claim'),('e66a8000-3d9c-42dc-970c-cc158043f9db','String','jsonType.label'),('e66a8000-3d9c-42dc-970c-cc158043f9db','zoneinfo','user.attribute'),('e66a8000-3d9c-42dc-970c-cc158043f9db','true','userinfo.token.claim'),('f15969c0-61e2-40ce-9289-daa0c8f46081','true','access.token.claim'),('f15969c0-61e2-40ce-9289-daa0c8f46081','nickname','claim.name'),('f15969c0-61e2-40ce-9289-daa0c8f46081','true','id.token.claim'),('f15969c0-61e2-40ce-9289-daa0c8f46081','String','jsonType.label'),('f15969c0-61e2-40ce-9289-daa0c8f46081','nickname','user.attribute'),('f15969c0-61e2-40ce-9289-daa0c8f46081','true','userinfo.token.claim'),('f5014c68-0337-4ff8-be91-cbb3334dd003','true','access.token.claim'),('f5014c68-0337-4ff8-be91-cbb3334dd003','email_verified','claim.name'),('f5014c68-0337-4ff8-be91-cbb3334dd003','true','id.token.claim'),('f5014c68-0337-4ff8-be91-cbb3334dd003','boolean','jsonType.label'),('f5014c68-0337-4ff8-be91-cbb3334dd003','emailVerified','user.attribute'),('f5014c68-0337-4ff8-be91-cbb3334dd003','true','userinfo.token.claim'),('fbac4826-fad0-429d-b17c-fc22ac23dbd9','true','access.token.claim'),('fbac4826-fad0-429d-b17c-fc22ac23dbd9','nickname','claim.name'),('fbac4826-fad0-429d-b17c-fc22ac23dbd9','true','id.token.claim'),('fbac4826-fad0-429d-b17c-fc22ac23dbd9','String','jsonType.label'),('fbac4826-fad0-429d-b17c-fc22ac23dbd9','nickname','user.attribute'),('fbac4826-fad0-429d-b17c-fc22ac23dbd9','true','userinfo.token.claim'),('feefd0aa-3b79-483b-8c67-389f2d4fe05a','true','access.token.claim'),('feefd0aa-3b79-483b-8c67-389f2d4fe05a','groups','claim.name'),('feefd0aa-3b79-483b-8c67-389f2d4fe05a','true','id.token.claim'),('feefd0aa-3b79-483b-8c67-389f2d4fe05a','String','jsonType.label'),('feefd0aa-3b79-483b-8c67-389f2d4fe05a','true','multivalued'),('feefd0aa-3b79-483b-8c67-389f2d4fe05a','foo','user.attribute');
/*!40000 ALTER TABLE `PROTOCOL_MAPPER_CONFIG` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `REALM`
--

DROP TABLE IF EXISTS `REALM`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `REALM` (
  `ID` varchar(36) NOT NULL,
  `ACCESS_CODE_LIFESPAN` int DEFAULT NULL,
  `USER_ACTION_LIFESPAN` int DEFAULT NULL,
  `ACCESS_TOKEN_LIFESPAN` int DEFAULT NULL,
  `ACCOUNT_THEME` varchar(255) DEFAULT NULL,
  `ADMIN_THEME` varchar(255) DEFAULT NULL,
  `EMAIL_THEME` varchar(255) DEFAULT NULL,
  `ENABLED` bit(1) NOT NULL DEFAULT b'0',
  `EVENTS_ENABLED` bit(1) NOT NULL DEFAULT b'0',
  `EVENTS_EXPIRATION` bigint DEFAULT NULL,
  `LOGIN_THEME` varchar(255) DEFAULT NULL,
  `NAME` varchar(255) DEFAULT NULL,
  `NOT_BEFORE` int DEFAULT NULL,
  `PASSWORD_POLICY` text,
  `REGISTRATION_ALLOWED` bit(1) NOT NULL DEFAULT b'0',
  `REMEMBER_ME` bit(1) NOT NULL DEFAULT b'0',
  `RESET_PASSWORD_ALLOWED` bit(1) NOT NULL DEFAULT b'0',
  `SOCIAL` bit(1) NOT NULL DEFAULT b'0',
  `SSL_REQUIRED` varchar(255) DEFAULT NULL,
  `SSO_IDLE_TIMEOUT` int DEFAULT NULL,
  `SSO_MAX_LIFESPAN` int DEFAULT NULL,
  `UPDATE_PROFILE_ON_SOC_LOGIN` bit(1) NOT NULL DEFAULT b'0',
  `VERIFY_EMAIL` bit(1) NOT NULL DEFAULT b'0',
  `MASTER_ADMIN_CLIENT` varchar(36) DEFAULT NULL,
  `LOGIN_LIFESPAN` int DEFAULT NULL,
  `INTERNATIONALIZATION_ENABLED` bit(1) NOT NULL DEFAULT b'0',
  `DEFAULT_LOCALE` varchar(255) DEFAULT NULL,
  `REG_EMAIL_AS_USERNAME` bit(1) NOT NULL DEFAULT b'0',
  `ADMIN_EVENTS_ENABLED` bit(1) NOT NULL DEFAULT b'0',
  `ADMIN_EVENTS_DETAILS_ENABLED` bit(1) NOT NULL DEFAULT b'0',
  `EDIT_USERNAME_ALLOWED` bit(1) NOT NULL DEFAULT b'0',
  `OTP_POLICY_COUNTER` int DEFAULT '0',
  `OTP_POLICY_WINDOW` int DEFAULT '1',
  `OTP_POLICY_PERIOD` int DEFAULT '30',
  `OTP_POLICY_DIGITS` int DEFAULT '6',
  `OTP_POLICY_ALG` varchar(36) DEFAULT 'HmacSHA1',
  `OTP_POLICY_TYPE` varchar(36) DEFAULT 'totp',
  `BROWSER_FLOW` varchar(36) DEFAULT NULL,
  `REGISTRATION_FLOW` varchar(36) DEFAULT NULL,
  `DIRECT_GRANT_FLOW` varchar(36) DEFAULT NULL,
  `RESET_CREDENTIALS_FLOW` varchar(36) DEFAULT NULL,
  `CLIENT_AUTH_FLOW` varchar(36) DEFAULT NULL,
  `OFFLINE_SESSION_IDLE_TIMEOUT` int DEFAULT '0',
  `REVOKE_REFRESH_TOKEN` bit(1) NOT NULL DEFAULT b'0',
  `ACCESS_TOKEN_LIFE_IMPLICIT` int DEFAULT '0',
  `LOGIN_WITH_EMAIL_ALLOWED` bit(1) NOT NULL DEFAULT b'1',
  `DUPLICATE_EMAILS_ALLOWED` bit(1) NOT NULL DEFAULT b'0',
  `DOCKER_AUTH_FLOW` varchar(36) DEFAULT NULL,
  `REFRESH_TOKEN_MAX_REUSE` int DEFAULT '0',
  `ALLOW_USER_MANAGED_ACCESS` bit(1) NOT NULL DEFAULT b'0',
  `SSO_MAX_LIFESPAN_REMEMBER_ME` int NOT NULL,
  `SSO_IDLE_TIMEOUT_REMEMBER_ME` int NOT NULL,
  `DEFAULT_ROLE` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UK_ORVSDMLA56612EAEFIQ6WL5OI` (`NAME`),
  KEY `IDX_REALM_MASTER_ADM_CLI` (`MASTER_ADMIN_CLIENT`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REALM`
--

LOCK TABLES `REALM` WRITE;
/*!40000 ALTER TABLE `REALM` DISABLE KEYS */;
INSERT INTO `REALM` VALUES ('60416dc2-4603-4f6b-b014-b0b0fbe038ce',60,300,60,NULL,NULL,NULL,_binary '',_binary '\0',0,NULL,'master',0,NULL,_binary '\0',_binary '\0',_binary '\0',_binary '\0','EXTERNAL',1800,36000,_binary '\0',_binary '\0','71b430a1-13aa-445b-b52b-f0b6080a42d1',1800,_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0',_binary '\0',0,1,30,6,'HmacSHA1','totp','537ee000-5b2f-4487-9e41-bc97c59edff9','578b58b9-e7c9-4683-9bf4-7622464bbf3c','9d1a7a55-b667-4961-8269-51fe6f685459','559d426f-eb90-47fa-8a30-63fbe8dee0aa','c9d80974-87cb-4dba-b26d-0027b4950872',2592000,_binary '\0',900,_binary '',_binary '\0','f5137e14-2857-49c9-a397-85bff02b4bd1',0,_binary '\0',0,0,'abdf18ec-fb43-4dd4-9048-9a5f31898481'),('c0270858-075b-431d-93d7-153e3204d46f',60,300,300,NULL,NULL,NULL,_binary '',_binary '\0',0,NULL,'billing-service',0,NULL,_binary '\0',_binary '\0',_binary '\0',_binary '\0','EXTERNAL',1800,36000,_binary '\0',_binary '\0','e0e71877-84e1-4787-a07b-7f76b1bccfef',1800,_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0',_binary '\0',0,1,30,6,'HmacSHA1','totp','5462ded3-3d36-41d9-959b-b2ddc1606aec','6ae7a261-a41a-4c44-a8bb-43e8b0341db8','f1856911-4861-453e-801b-d8b76f0f51e5','06f94101-c574-446b-ada9-05b2bdc97a59','0563fed8-ce41-4f93-89a8-54b4dddb0dde',2592000,_binary '\0',900,_binary '',_binary '\0','b89a8a4b-6a49-4d21-91e8-e5aaa7b56615',0,_binary '\0',0,0,'a3fb3bf9-938e-4ddb-8f63-ecb065153108');
/*!40000 ALTER TABLE `REALM` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `REALM_ATTRIBUTE`
--

DROP TABLE IF EXISTS `REALM_ATTRIBUTE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `REALM_ATTRIBUTE` (
  `NAME` varchar(255) NOT NULL,
  `REALM_ID` varchar(36) NOT NULL,
  `VALUE` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci,
  PRIMARY KEY (`NAME`,`REALM_ID`),
  KEY `IDX_REALM_ATTR_REALM` (`REALM_ID`),
  CONSTRAINT `FK_8SHXD6L3E9ATQUKACXGPFFPTW` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REALM_ATTRIBUTE`
--

LOCK TABLES `REALM_ATTRIBUTE` WRITE;
/*!40000 ALTER TABLE `REALM_ATTRIBUTE` DISABLE KEYS */;
INSERT INTO `REALM_ATTRIBUTE` VALUES ('_browser_header.contentSecurityPolicy','60416dc2-4603-4f6b-b014-b0b0fbe038ce','frame-src \'self\'; frame-ancestors \'self\'; object-src \'none\';'),('_browser_header.contentSecurityPolicy','c0270858-075b-431d-93d7-153e3204d46f','frame-src \'self\'; frame-ancestors \'self\'; object-src \'none\';'),('_browser_header.contentSecurityPolicyReportOnly','60416dc2-4603-4f6b-b014-b0b0fbe038ce',''),('_browser_header.contentSecurityPolicyReportOnly','c0270858-075b-431d-93d7-153e3204d46f',''),('_browser_header.referrerPolicy','60416dc2-4603-4f6b-b014-b0b0fbe038ce','no-referrer'),('_browser_header.referrerPolicy','c0270858-075b-431d-93d7-153e3204d46f','no-referrer'),('_browser_header.strictTransportSecurity','60416dc2-4603-4f6b-b014-b0b0fbe038ce','max-age=31536000; includeSubDomains'),('_browser_header.strictTransportSecurity','c0270858-075b-431d-93d7-153e3204d46f','max-age=31536000; includeSubDomains'),('_browser_header.xContentTypeOptions','60416dc2-4603-4f6b-b014-b0b0fbe038ce','nosniff'),('_browser_header.xContentTypeOptions','c0270858-075b-431d-93d7-153e3204d46f','nosniff'),('_browser_header.xFrameOptions','60416dc2-4603-4f6b-b014-b0b0fbe038ce','SAMEORIGIN'),('_browser_header.xFrameOptions','c0270858-075b-431d-93d7-153e3204d46f','SAMEORIGIN'),('_browser_header.xRobotsTag','60416dc2-4603-4f6b-b014-b0b0fbe038ce','none'),('_browser_header.xRobotsTag','c0270858-075b-431d-93d7-153e3204d46f','none'),('_browser_header.xXSSProtection','60416dc2-4603-4f6b-b014-b0b0fbe038ce','1; mode=block'),('_browser_header.xXSSProtection','c0270858-075b-431d-93d7-153e3204d46f','1; mode=block'),('actionTokenGeneratedByAdminLifespan','c0270858-075b-431d-93d7-153e3204d46f','43200'),('actionTokenGeneratedByUserLifespan','c0270858-075b-431d-93d7-153e3204d46f','300'),('bruteForceProtected','60416dc2-4603-4f6b-b014-b0b0fbe038ce','false'),('bruteForceProtected','c0270858-075b-431d-93d7-153e3204d46f','false'),('cibaAuthRequestedUserHint','c0270858-075b-431d-93d7-153e3204d46f','login_hint'),('cibaBackchannelTokenDeliveryMode','c0270858-075b-431d-93d7-153e3204d46f','poll'),('cibaExpiresIn','c0270858-075b-431d-93d7-153e3204d46f','120'),('cibaInterval','c0270858-075b-431d-93d7-153e3204d46f','5'),('defaultSignatureAlgorithm','60416dc2-4603-4f6b-b014-b0b0fbe038ce','RS256'),('defaultSignatureAlgorithm','c0270858-075b-431d-93d7-153e3204d46f','RS256'),('displayName','60416dc2-4603-4f6b-b014-b0b0fbe038ce','Keycloak'),('displayNameHtml','60416dc2-4603-4f6b-b014-b0b0fbe038ce','<div class=\"kc-logo-text\"><span>Keycloak</span></div>'),('failureFactor','60416dc2-4603-4f6b-b014-b0b0fbe038ce','30'),('failureFactor','c0270858-075b-431d-93d7-153e3204d46f','30'),('maxDeltaTimeSeconds','60416dc2-4603-4f6b-b014-b0b0fbe038ce','43200'),('maxDeltaTimeSeconds','c0270858-075b-431d-93d7-153e3204d46f','43200'),('maxFailureWaitSeconds','60416dc2-4603-4f6b-b014-b0b0fbe038ce','900'),('maxFailureWaitSeconds','c0270858-075b-431d-93d7-153e3204d46f','900'),('minimumQuickLoginWaitSeconds','60416dc2-4603-4f6b-b014-b0b0fbe038ce','60'),('minimumQuickLoginWaitSeconds','c0270858-075b-431d-93d7-153e3204d46f','60'),('oauth2DeviceCodeLifespan','c0270858-075b-431d-93d7-153e3204d46f','600'),('oauth2DevicePollingInterval','c0270858-075b-431d-93d7-153e3204d46f','5'),('offlineSessionMaxLifespan','60416dc2-4603-4f6b-b014-b0b0fbe038ce','5184000'),('offlineSessionMaxLifespan','c0270858-075b-431d-93d7-153e3204d46f','5184000'),('offlineSessionMaxLifespanEnabled','60416dc2-4603-4f6b-b014-b0b0fbe038ce','false'),('offlineSessionMaxLifespanEnabled','c0270858-075b-431d-93d7-153e3204d46f','false'),('parRequestUriLifespan','c0270858-075b-431d-93d7-153e3204d46f','60'),('permanentLockout','60416dc2-4603-4f6b-b014-b0b0fbe038ce','false'),('permanentLockout','c0270858-075b-431d-93d7-153e3204d46f','false'),('quickLoginCheckMilliSeconds','60416dc2-4603-4f6b-b014-b0b0fbe038ce','1000'),('quickLoginCheckMilliSeconds','c0270858-075b-431d-93d7-153e3204d46f','1000'),('realmReusableOtpCode','60416dc2-4603-4f6b-b014-b0b0fbe038ce','false'),('realmReusableOtpCode','c0270858-075b-431d-93d7-153e3204d46f','false'),('waitIncrementSeconds','60416dc2-4603-4f6b-b014-b0b0fbe038ce','60'),('waitIncrementSeconds','c0270858-075b-431d-93d7-153e3204d46f','60'),('webAuthnPolicyAttestationConveyancePreference','c0270858-075b-431d-93d7-153e3204d46f','not specified'),('webAuthnPolicyAttestationConveyancePreferencePasswordless','c0270858-075b-431d-93d7-153e3204d46f','not specified'),('webAuthnPolicyAuthenticatorAttachment','c0270858-075b-431d-93d7-153e3204d46f','not specified'),('webAuthnPolicyAuthenticatorAttachmentPasswordless','c0270858-075b-431d-93d7-153e3204d46f','not specified'),('webAuthnPolicyAvoidSameAuthenticatorRegister','c0270858-075b-431d-93d7-153e3204d46f','false'),('webAuthnPolicyAvoidSameAuthenticatorRegisterPasswordless','c0270858-075b-431d-93d7-153e3204d46f','false'),('webAuthnPolicyCreateTimeout','c0270858-075b-431d-93d7-153e3204d46f','0'),('webAuthnPolicyCreateTimeoutPasswordless','c0270858-075b-431d-93d7-153e3204d46f','0'),('webAuthnPolicyRequireResidentKey','c0270858-075b-431d-93d7-153e3204d46f','not specified'),('webAuthnPolicyRequireResidentKeyPasswordless','c0270858-075b-431d-93d7-153e3204d46f','not specified'),('webAuthnPolicyRpEntityName','c0270858-075b-431d-93d7-153e3204d46f','keycloak'),('webAuthnPolicyRpEntityNamePasswordless','c0270858-075b-431d-93d7-153e3204d46f','keycloak'),('webAuthnPolicyRpId','c0270858-075b-431d-93d7-153e3204d46f',''),('webAuthnPolicyRpIdPasswordless','c0270858-075b-431d-93d7-153e3204d46f',''),('webAuthnPolicySignatureAlgorithms','c0270858-075b-431d-93d7-153e3204d46f','ES256'),('webAuthnPolicySignatureAlgorithmsPasswordless','c0270858-075b-431d-93d7-153e3204d46f','ES256'),('webAuthnPolicyUserVerificationRequirement','c0270858-075b-431d-93d7-153e3204d46f','not specified'),('webAuthnPolicyUserVerificationRequirementPasswordless','c0270858-075b-431d-93d7-153e3204d46f','not specified');
/*!40000 ALTER TABLE `REALM_ATTRIBUTE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `REALM_DEFAULT_GROUPS`
--

DROP TABLE IF EXISTS `REALM_DEFAULT_GROUPS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `REALM_DEFAULT_GROUPS` (
  `REALM_ID` varchar(36) NOT NULL,
  `GROUP_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`REALM_ID`,`GROUP_ID`),
  UNIQUE KEY `CON_GROUP_ID_DEF_GROUPS` (`GROUP_ID`),
  KEY `IDX_REALM_DEF_GRP_REALM` (`REALM_ID`),
  CONSTRAINT `FK_DEF_GROUPS_REALM` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REALM_DEFAULT_GROUPS`
--

LOCK TABLES `REALM_DEFAULT_GROUPS` WRITE;
/*!40000 ALTER TABLE `REALM_DEFAULT_GROUPS` DISABLE KEYS */;
/*!40000 ALTER TABLE `REALM_DEFAULT_GROUPS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `REALM_ENABLED_EVENT_TYPES`
--

DROP TABLE IF EXISTS `REALM_ENABLED_EVENT_TYPES`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `REALM_ENABLED_EVENT_TYPES` (
  `REALM_ID` varchar(36) NOT NULL,
  `VALUE` varchar(255) NOT NULL,
  PRIMARY KEY (`REALM_ID`,`VALUE`),
  KEY `IDX_REALM_EVT_TYPES_REALM` (`REALM_ID`),
  CONSTRAINT `FK_H846O4H0W8EPX5NWEDRF5Y69J` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REALM_ENABLED_EVENT_TYPES`
--

LOCK TABLES `REALM_ENABLED_EVENT_TYPES` WRITE;
/*!40000 ALTER TABLE `REALM_ENABLED_EVENT_TYPES` DISABLE KEYS */;
/*!40000 ALTER TABLE `REALM_ENABLED_EVENT_TYPES` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `REALM_EVENTS_LISTENERS`
--

DROP TABLE IF EXISTS `REALM_EVENTS_LISTENERS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `REALM_EVENTS_LISTENERS` (
  `REALM_ID` varchar(36) NOT NULL,
  `VALUE` varchar(255) NOT NULL,
  PRIMARY KEY (`REALM_ID`,`VALUE`),
  KEY `IDX_REALM_EVT_LIST_REALM` (`REALM_ID`),
  CONSTRAINT `FK_H846O4H0W8EPX5NXEV9F5Y69J` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REALM_EVENTS_LISTENERS`
--

LOCK TABLES `REALM_EVENTS_LISTENERS` WRITE;
/*!40000 ALTER TABLE `REALM_EVENTS_LISTENERS` DISABLE KEYS */;
INSERT INTO `REALM_EVENTS_LISTENERS` VALUES ('60416dc2-4603-4f6b-b014-b0b0fbe038ce','jboss-logging'),('c0270858-075b-431d-93d7-153e3204d46f','jboss-logging');
/*!40000 ALTER TABLE `REALM_EVENTS_LISTENERS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `REALM_LOCALIZATIONS`
--

DROP TABLE IF EXISTS `REALM_LOCALIZATIONS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `REALM_LOCALIZATIONS` (
  `REALM_ID` varchar(255) NOT NULL,
  `LOCALE` varchar(255) NOT NULL,
  `TEXTS` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  PRIMARY KEY (`REALM_ID`,`LOCALE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REALM_LOCALIZATIONS`
--

LOCK TABLES `REALM_LOCALIZATIONS` WRITE;
/*!40000 ALTER TABLE `REALM_LOCALIZATIONS` DISABLE KEYS */;
/*!40000 ALTER TABLE `REALM_LOCALIZATIONS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `REALM_REQUIRED_CREDENTIAL`
--

DROP TABLE IF EXISTS `REALM_REQUIRED_CREDENTIAL`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `REALM_REQUIRED_CREDENTIAL` (
  `TYPE` varchar(255) NOT NULL,
  `FORM_LABEL` varchar(255) DEFAULT NULL,
  `INPUT` bit(1) NOT NULL DEFAULT b'0',
  `SECRET` bit(1) NOT NULL DEFAULT b'0',
  `REALM_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`REALM_ID`,`TYPE`),
  CONSTRAINT `FK_5HG65LYBEVAVKQFKI3KPONH9V` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REALM_REQUIRED_CREDENTIAL`
--

LOCK TABLES `REALM_REQUIRED_CREDENTIAL` WRITE;
/*!40000 ALTER TABLE `REALM_REQUIRED_CREDENTIAL` DISABLE KEYS */;
INSERT INTO `REALM_REQUIRED_CREDENTIAL` VALUES ('password','password',_binary '',_binary '','60416dc2-4603-4f6b-b014-b0b0fbe038ce'),('password','password',_binary '',_binary '','c0270858-075b-431d-93d7-153e3204d46f');
/*!40000 ALTER TABLE `REALM_REQUIRED_CREDENTIAL` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `REALM_SMTP_CONFIG`
--

DROP TABLE IF EXISTS `REALM_SMTP_CONFIG`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `REALM_SMTP_CONFIG` (
  `REALM_ID` varchar(36) NOT NULL,
  `VALUE` varchar(255) DEFAULT NULL,
  `NAME` varchar(255) NOT NULL,
  PRIMARY KEY (`REALM_ID`,`NAME`),
  CONSTRAINT `FK_70EJ8XDXGXD0B9HH6180IRR0O` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REALM_SMTP_CONFIG`
--

LOCK TABLES `REALM_SMTP_CONFIG` WRITE;
/*!40000 ALTER TABLE `REALM_SMTP_CONFIG` DISABLE KEYS */;
/*!40000 ALTER TABLE `REALM_SMTP_CONFIG` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `REALM_SUPPORTED_LOCALES`
--

DROP TABLE IF EXISTS `REALM_SUPPORTED_LOCALES`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `REALM_SUPPORTED_LOCALES` (
  `REALM_ID` varchar(36) NOT NULL,
  `VALUE` varchar(255) NOT NULL,
  PRIMARY KEY (`REALM_ID`,`VALUE`),
  KEY `IDX_REALM_SUPP_LOCAL_REALM` (`REALM_ID`),
  CONSTRAINT `FK_SUPPORTED_LOCALES_REALM` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REALM_SUPPORTED_LOCALES`
--

LOCK TABLES `REALM_SUPPORTED_LOCALES` WRITE;
/*!40000 ALTER TABLE `REALM_SUPPORTED_LOCALES` DISABLE KEYS */;
/*!40000 ALTER TABLE `REALM_SUPPORTED_LOCALES` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `REDIRECT_URIS`
--

DROP TABLE IF EXISTS `REDIRECT_URIS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `REDIRECT_URIS` (
  `CLIENT_ID` varchar(36) NOT NULL,
  `VALUE` varchar(255) NOT NULL,
  PRIMARY KEY (`CLIENT_ID`,`VALUE`),
  KEY `IDX_REDIR_URI_CLIENT` (`CLIENT_ID`),
  CONSTRAINT `FK_1BURS8PB4OUJ97H5WUPPAHV9F` FOREIGN KEY (`CLIENT_ID`) REFERENCES `CLIENT` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REDIRECT_URIS`
--

LOCK TABLES `REDIRECT_URIS` WRITE;
/*!40000 ALTER TABLE `REDIRECT_URIS` DISABLE KEYS */;
INSERT INTO `REDIRECT_URIS` VALUES ('23a0d2d8-1531-4d8d-8e88-a87b19de2363','/realms/billing-service/account/*'),('27b90d93-a3c8-45e5-8a4d-aaed000799c6','/realms/billing-service/account/*'),('3f461ac6-c6b6-4bc6-ad41-37845e946201','/realms/master/account/*'),('b29858d1-dc20-4c75-983f-aa249b104e88','/admin/billing-service/console/*'),('e415f27a-40ae-49eb-a2ac-0e6cd4490d2d','http://localhost:4200/*'),('e58e3d3a-56e9-4d28-90ce-79e9e7b2b35a','/realms/master/account/*'),('e7ceccbe-612c-424a-8550-1566ffb84a52','http://localhost:8080/*'),('f5a1ace1-bd2f-4b96-914a-0e491b492cdc','/admin/master/console/*');
/*!40000 ALTER TABLE `REDIRECT_URIS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `REQUIRED_ACTION_CONFIG`
--

DROP TABLE IF EXISTS `REQUIRED_ACTION_CONFIG`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `REQUIRED_ACTION_CONFIG` (
  `REQUIRED_ACTION_ID` varchar(36) NOT NULL,
  `VALUE` longtext,
  `NAME` varchar(255) NOT NULL,
  PRIMARY KEY (`REQUIRED_ACTION_ID`,`NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REQUIRED_ACTION_CONFIG`
--

LOCK TABLES `REQUIRED_ACTION_CONFIG` WRITE;
/*!40000 ALTER TABLE `REQUIRED_ACTION_CONFIG` DISABLE KEYS */;
/*!40000 ALTER TABLE `REQUIRED_ACTION_CONFIG` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `REQUIRED_ACTION_PROVIDER`
--

DROP TABLE IF EXISTS `REQUIRED_ACTION_PROVIDER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `REQUIRED_ACTION_PROVIDER` (
  `ID` varchar(36) NOT NULL,
  `ALIAS` varchar(255) DEFAULT NULL,
  `NAME` varchar(255) DEFAULT NULL,
  `REALM_ID` varchar(36) DEFAULT NULL,
  `ENABLED` bit(1) NOT NULL DEFAULT b'0',
  `DEFAULT_ACTION` bit(1) NOT NULL DEFAULT b'0',
  `PROVIDER_ID` varchar(255) DEFAULT NULL,
  `PRIORITY` int DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_REQ_ACT_PROV_REALM` (`REALM_ID`),
  CONSTRAINT `FK_REQ_ACT_REALM` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REQUIRED_ACTION_PROVIDER`
--

LOCK TABLES `REQUIRED_ACTION_PROVIDER` WRITE;
/*!40000 ALTER TABLE `REQUIRED_ACTION_PROVIDER` DISABLE KEYS */;
INSERT INTO `REQUIRED_ACTION_PROVIDER` VALUES ('0f695f01-5a2b-4975-ab12-145dd349243f','delete_account','Delete Account','c0270858-075b-431d-93d7-153e3204d46f',_binary '\0',_binary '\0','delete_account',60),('32874daa-bd17-4bda-aae8-d75dcbf48d81','UPDATE_PASSWORD','Update Password','60416dc2-4603-4f6b-b014-b0b0fbe038ce',_binary '',_binary '\0','UPDATE_PASSWORD',30),('3918fdf0-14f7-4767-b6ce-b27a9d18ea43','UPDATE_PASSWORD','Update Password','c0270858-075b-431d-93d7-153e3204d46f',_binary '',_binary '\0','UPDATE_PASSWORD',30),('3d333192-dec5-42e6-909a-102fb4847a57','UPDATE_PROFILE','Update Profile','c0270858-075b-431d-93d7-153e3204d46f',_binary '',_binary '\0','UPDATE_PROFILE',40),('4f7ee43a-8f32-476b-bd6a-d5d422ad758e','VERIFY_EMAIL','Verify Email','60416dc2-4603-4f6b-b014-b0b0fbe038ce',_binary '',_binary '\0','VERIFY_EMAIL',50),('51eab121-05dc-4cf2-b0d5-2a383008a4d6','VERIFY_EMAIL','Verify Email','c0270858-075b-431d-93d7-153e3204d46f',_binary '',_binary '\0','VERIFY_EMAIL',50),('5db15625-5256-4bf4-86e2-f13b93f76a7d','TERMS_AND_CONDITIONS','Terms and Conditions','c0270858-075b-431d-93d7-153e3204d46f',_binary '\0',_binary '\0','TERMS_AND_CONDITIONS',20),('651787a5-5390-4041-8fac-bdc183ce8865','UPDATE_PROFILE','Update Profile','60416dc2-4603-4f6b-b014-b0b0fbe038ce',_binary '',_binary '\0','UPDATE_PROFILE',40),('98ed542c-2d72-4d86-8463-3d3d30b2f849','update_user_locale','Update User Locale','60416dc2-4603-4f6b-b014-b0b0fbe038ce',_binary '',_binary '\0','update_user_locale',1000),('9cc092d9-9e80-412a-895a-383a11c52f0b','CONFIGURE_TOTP','Configure OTP','c0270858-075b-431d-93d7-153e3204d46f',_binary '',_binary '\0','CONFIGURE_TOTP',10),('9d5f833b-199a-4646-95fa-9ddbd3bc2b55','CONFIGURE_TOTP','Configure OTP','60416dc2-4603-4f6b-b014-b0b0fbe038ce',_binary '',_binary '\0','CONFIGURE_TOTP',10),('a6e4928d-b8bc-402f-bbe2-a5a040c95f25','webauthn-register','Webauthn Register','60416dc2-4603-4f6b-b014-b0b0fbe038ce',_binary '',_binary '\0','webauthn-register',70),('ae18a1d0-4599-4838-ade6-1d7f27fd80ae','webauthn-register','Webauthn Register','c0270858-075b-431d-93d7-153e3204d46f',_binary '',_binary '\0','webauthn-register',70),('c118bb37-96c8-4252-93a5-d180456946ef','TERMS_AND_CONDITIONS','Terms and Conditions','60416dc2-4603-4f6b-b014-b0b0fbe038ce',_binary '\0',_binary '\0','TERMS_AND_CONDITIONS',20),('d16f7f6b-fa24-4845-9968-2ae3a662a320','delete_account','Delete Account','60416dc2-4603-4f6b-b014-b0b0fbe038ce',_binary '\0',_binary '\0','delete_account',60),('dec59ba9-eef9-4248-bef7-330f0c36b775','webauthn-register-passwordless','Webauthn Register Passwordless','c0270858-075b-431d-93d7-153e3204d46f',_binary '',_binary '\0','webauthn-register-passwordless',80),('ece181f4-8315-4421-ab57-f5ee7d6745fd','webauthn-register-passwordless','Webauthn Register Passwordless','60416dc2-4603-4f6b-b014-b0b0fbe038ce',_binary '',_binary '\0','webauthn-register-passwordless',80),('eef96089-8c5a-465f-85dd-48251b407285','update_user_locale','Update User Locale','c0270858-075b-431d-93d7-153e3204d46f',_binary '',_binary '\0','update_user_locale',1000);
/*!40000 ALTER TABLE `REQUIRED_ACTION_PROVIDER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RESOURCE_ATTRIBUTE`
--

DROP TABLE IF EXISTS `RESOURCE_ATTRIBUTE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `RESOURCE_ATTRIBUTE` (
  `ID` varchar(36) NOT NULL DEFAULT 'sybase-needs-something-here',
  `NAME` varchar(255) NOT NULL,
  `VALUE` varchar(255) DEFAULT NULL,
  `RESOURCE_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_5HRM2VLF9QL5FU022KQEPOVBR` (`RESOURCE_ID`),
  CONSTRAINT `FK_5HRM2VLF9QL5FU022KQEPOVBR` FOREIGN KEY (`RESOURCE_ID`) REFERENCES `RESOURCE_SERVER_RESOURCE` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RESOURCE_ATTRIBUTE`
--

LOCK TABLES `RESOURCE_ATTRIBUTE` WRITE;
/*!40000 ALTER TABLE `RESOURCE_ATTRIBUTE` DISABLE KEYS */;
/*!40000 ALTER TABLE `RESOURCE_ATTRIBUTE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RESOURCE_POLICY`
--

DROP TABLE IF EXISTS `RESOURCE_POLICY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `RESOURCE_POLICY` (
  `RESOURCE_ID` varchar(36) NOT NULL,
  `POLICY_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`RESOURCE_ID`,`POLICY_ID`),
  KEY `IDX_RES_POLICY_POLICY` (`POLICY_ID`),
  CONSTRAINT `FK_FRSRPOS53XCX4WNKOG82SSRFY` FOREIGN KEY (`RESOURCE_ID`) REFERENCES `RESOURCE_SERVER_RESOURCE` (`ID`),
  CONSTRAINT `FK_FRSRPP213XCX4WNKOG82SSRFY` FOREIGN KEY (`POLICY_ID`) REFERENCES `RESOURCE_SERVER_POLICY` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RESOURCE_POLICY`
--

LOCK TABLES `RESOURCE_POLICY` WRITE;
/*!40000 ALTER TABLE `RESOURCE_POLICY` DISABLE KEYS */;
/*!40000 ALTER TABLE `RESOURCE_POLICY` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RESOURCE_SCOPE`
--

DROP TABLE IF EXISTS `RESOURCE_SCOPE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `RESOURCE_SCOPE` (
  `RESOURCE_ID` varchar(36) NOT NULL,
  `SCOPE_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`RESOURCE_ID`,`SCOPE_ID`),
  KEY `IDX_RES_SCOPE_SCOPE` (`SCOPE_ID`),
  CONSTRAINT `FK_FRSRPOS13XCX4WNKOG82SSRFY` FOREIGN KEY (`RESOURCE_ID`) REFERENCES `RESOURCE_SERVER_RESOURCE` (`ID`),
  CONSTRAINT `FK_FRSRPS213XCX4WNKOG82SSRFY` FOREIGN KEY (`SCOPE_ID`) REFERENCES `RESOURCE_SERVER_SCOPE` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RESOURCE_SCOPE`
--

LOCK TABLES `RESOURCE_SCOPE` WRITE;
/*!40000 ALTER TABLE `RESOURCE_SCOPE` DISABLE KEYS */;
/*!40000 ALTER TABLE `RESOURCE_SCOPE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RESOURCE_SERVER`
--

DROP TABLE IF EXISTS `RESOURCE_SERVER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `RESOURCE_SERVER` (
  `ID` varchar(36) NOT NULL,
  `ALLOW_RS_REMOTE_MGMT` bit(1) NOT NULL DEFAULT b'0',
  `POLICY_ENFORCE_MODE` tinyint DEFAULT NULL,
  `DECISION_STRATEGY` tinyint NOT NULL DEFAULT '1',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RESOURCE_SERVER`
--

LOCK TABLES `RESOURCE_SERVER` WRITE;
/*!40000 ALTER TABLE `RESOURCE_SERVER` DISABLE KEYS */;
INSERT INTO `RESOURCE_SERVER` VALUES ('e7ceccbe-612c-424a-8550-1566ffb84a52',_binary '',0,1);
/*!40000 ALTER TABLE `RESOURCE_SERVER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RESOURCE_SERVER_PERM_TICKET`
--

DROP TABLE IF EXISTS `RESOURCE_SERVER_PERM_TICKET`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `RESOURCE_SERVER_PERM_TICKET` (
  `ID` varchar(36) NOT NULL,
  `OWNER` varchar(255) DEFAULT NULL,
  `REQUESTER` varchar(255) DEFAULT NULL,
  `CREATED_TIMESTAMP` bigint NOT NULL,
  `GRANTED_TIMESTAMP` bigint DEFAULT NULL,
  `RESOURCE_ID` varchar(36) NOT NULL,
  `SCOPE_ID` varchar(36) DEFAULT NULL,
  `RESOURCE_SERVER_ID` varchar(36) NOT NULL,
  `POLICY_ID` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UK_FRSR6T700S9V50BU18WS5PMT` (`OWNER`,`REQUESTER`,`RESOURCE_SERVER_ID`,`RESOURCE_ID`,`SCOPE_ID`),
  KEY `FK_FRSRHO213XCX4WNKOG82SSPMT` (`RESOURCE_SERVER_ID`),
  KEY `FK_FRSRHO213XCX4WNKOG83SSPMT` (`RESOURCE_ID`),
  KEY `FK_FRSRHO213XCX4WNKOG84SSPMT` (`SCOPE_ID`),
  KEY `FK_FRSRPO2128CX4WNKOG82SSRFY` (`POLICY_ID`),
  CONSTRAINT `FK_FRSRHO213XCX4WNKOG82SSPMT` FOREIGN KEY (`RESOURCE_SERVER_ID`) REFERENCES `RESOURCE_SERVER` (`ID`),
  CONSTRAINT `FK_FRSRHO213XCX4WNKOG83SSPMT` FOREIGN KEY (`RESOURCE_ID`) REFERENCES `RESOURCE_SERVER_RESOURCE` (`ID`),
  CONSTRAINT `FK_FRSRHO213XCX4WNKOG84SSPMT` FOREIGN KEY (`SCOPE_ID`) REFERENCES `RESOURCE_SERVER_SCOPE` (`ID`),
  CONSTRAINT `FK_FRSRPO2128CX4WNKOG82SSRFY` FOREIGN KEY (`POLICY_ID`) REFERENCES `RESOURCE_SERVER_POLICY` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RESOURCE_SERVER_PERM_TICKET`
--

LOCK TABLES `RESOURCE_SERVER_PERM_TICKET` WRITE;
/*!40000 ALTER TABLE `RESOURCE_SERVER_PERM_TICKET` DISABLE KEYS */;
/*!40000 ALTER TABLE `RESOURCE_SERVER_PERM_TICKET` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RESOURCE_SERVER_POLICY`
--

DROP TABLE IF EXISTS `RESOURCE_SERVER_POLICY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `RESOURCE_SERVER_POLICY` (
  `ID` varchar(36) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  `DESCRIPTION` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `TYPE` varchar(255) NOT NULL,
  `DECISION_STRATEGY` tinyint DEFAULT NULL,
  `LOGIC` tinyint DEFAULT NULL,
  `RESOURCE_SERVER_ID` varchar(36) DEFAULT NULL,
  `OWNER` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UK_FRSRPT700S9V50BU18WS5HA6` (`NAME`,`RESOURCE_SERVER_ID`),
  KEY `IDX_RES_SERV_POL_RES_SERV` (`RESOURCE_SERVER_ID`),
  CONSTRAINT `FK_FRSRPO213XCX4WNKOG82SSRFY` FOREIGN KEY (`RESOURCE_SERVER_ID`) REFERENCES `RESOURCE_SERVER` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RESOURCE_SERVER_POLICY`
--

LOCK TABLES `RESOURCE_SERVER_POLICY` WRITE;
/*!40000 ALTER TABLE `RESOURCE_SERVER_POLICY` DISABLE KEYS */;
INSERT INTO `RESOURCE_SERVER_POLICY` VALUES ('308b4cde-d7aa-4957-977e-dfc3ea070622','Default Permission','A permission that applies to the default resource type','resource',1,0,'e7ceccbe-612c-424a-8550-1566ffb84a52',NULL),('747bb0ad-7114-46cc-9373-cdaff55e0c32','Default Policy','A policy that grants access only for users within this realm','js',0,0,'e7ceccbe-612c-424a-8550-1566ffb84a52',NULL);
/*!40000 ALTER TABLE `RESOURCE_SERVER_POLICY` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RESOURCE_SERVER_RESOURCE`
--

DROP TABLE IF EXISTS `RESOURCE_SERVER_RESOURCE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `RESOURCE_SERVER_RESOURCE` (
  `ID` varchar(36) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  `TYPE` varchar(255) DEFAULT NULL,
  `ICON_URI` varchar(255) DEFAULT NULL,
  `OWNER` varchar(255) DEFAULT NULL,
  `RESOURCE_SERVER_ID` varchar(36) DEFAULT NULL,
  `OWNER_MANAGED_ACCESS` bit(1) NOT NULL DEFAULT b'0',
  `DISPLAY_NAME` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UK_FRSR6T700S9V50BU18WS5HA6` (`NAME`,`OWNER`,`RESOURCE_SERVER_ID`),
  KEY `IDX_RES_SRV_RES_RES_SRV` (`RESOURCE_SERVER_ID`),
  CONSTRAINT `FK_FRSRHO213XCX4WNKOG82SSRFY` FOREIGN KEY (`RESOURCE_SERVER_ID`) REFERENCES `RESOURCE_SERVER` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RESOURCE_SERVER_RESOURCE`
--

LOCK TABLES `RESOURCE_SERVER_RESOURCE` WRITE;
/*!40000 ALTER TABLE `RESOURCE_SERVER_RESOURCE` DISABLE KEYS */;
INSERT INTO `RESOURCE_SERVER_RESOURCE` VALUES ('34325711-b219-4ca7-bfda-90d9ea6e1459','Default Resource','urn:billing-service-client:resources:default',NULL,'e7ceccbe-612c-424a-8550-1566ffb84a52','e7ceccbe-612c-424a-8550-1566ffb84a52',_binary '\0',NULL);
/*!40000 ALTER TABLE `RESOURCE_SERVER_RESOURCE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RESOURCE_SERVER_SCOPE`
--

DROP TABLE IF EXISTS `RESOURCE_SERVER_SCOPE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `RESOURCE_SERVER_SCOPE` (
  `ID` varchar(36) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  `ICON_URI` varchar(255) DEFAULT NULL,
  `RESOURCE_SERVER_ID` varchar(36) DEFAULT NULL,
  `DISPLAY_NAME` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UK_FRSRST700S9V50BU18WS5HA6` (`NAME`,`RESOURCE_SERVER_ID`),
  KEY `IDX_RES_SRV_SCOPE_RES_SRV` (`RESOURCE_SERVER_ID`),
  CONSTRAINT `FK_FRSRSO213XCX4WNKOG82SSRFY` FOREIGN KEY (`RESOURCE_SERVER_ID`) REFERENCES `RESOURCE_SERVER` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RESOURCE_SERVER_SCOPE`
--

LOCK TABLES `RESOURCE_SERVER_SCOPE` WRITE;
/*!40000 ALTER TABLE `RESOURCE_SERVER_SCOPE` DISABLE KEYS */;
/*!40000 ALTER TABLE `RESOURCE_SERVER_SCOPE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RESOURCE_URIS`
--

DROP TABLE IF EXISTS `RESOURCE_URIS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `RESOURCE_URIS` (
  `RESOURCE_ID` varchar(36) NOT NULL,
  `VALUE` varchar(255) NOT NULL,
  PRIMARY KEY (`RESOURCE_ID`,`VALUE`),
  CONSTRAINT `FK_RESOURCE_SERVER_URIS` FOREIGN KEY (`RESOURCE_ID`) REFERENCES `RESOURCE_SERVER_RESOURCE` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RESOURCE_URIS`
--

LOCK TABLES `RESOURCE_URIS` WRITE;
/*!40000 ALTER TABLE `RESOURCE_URIS` DISABLE KEYS */;
INSERT INTO `RESOURCE_URIS` VALUES ('34325711-b219-4ca7-bfda-90d9ea6e1459','/*');
/*!40000 ALTER TABLE `RESOURCE_URIS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ROLE_ATTRIBUTE`
--

DROP TABLE IF EXISTS `ROLE_ATTRIBUTE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ROLE_ATTRIBUTE` (
  `ID` varchar(36) NOT NULL,
  `ROLE_ID` varchar(36) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  `VALUE` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_ROLE_ATTRIBUTE` (`ROLE_ID`),
  CONSTRAINT `FK_ROLE_ATTRIBUTE_ID` FOREIGN KEY (`ROLE_ID`) REFERENCES `KEYCLOAK_ROLE` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ROLE_ATTRIBUTE`
--

LOCK TABLES `ROLE_ATTRIBUTE` WRITE;
/*!40000 ALTER TABLE `ROLE_ATTRIBUTE` DISABLE KEYS */;
/*!40000 ALTER TABLE `ROLE_ATTRIBUTE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SCOPE_MAPPING`
--

DROP TABLE IF EXISTS `SCOPE_MAPPING`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `SCOPE_MAPPING` (
  `CLIENT_ID` varchar(36) NOT NULL,
  `ROLE_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`CLIENT_ID`,`ROLE_ID`),
  KEY `IDX_SCOPE_MAPPING_ROLE` (`ROLE_ID`),
  CONSTRAINT `FK_OUSE064PLMLR732LXJCN1Q5F1` FOREIGN KEY (`CLIENT_ID`) REFERENCES `CLIENT` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SCOPE_MAPPING`
--

LOCK TABLES `SCOPE_MAPPING` WRITE;
/*!40000 ALTER TABLE `SCOPE_MAPPING` DISABLE KEYS */;
INSERT INTO `SCOPE_MAPPING` VALUES ('23a0d2d8-1531-4d8d-8e88-a87b19de2363','16a07c63-8b66-4f86-866d-ffdc840b5dad'),('3f461ac6-c6b6-4bc6-ad41-37845e946201','3e7b2373-751a-435f-a4d5-f7964b5f8030'),('3f461ac6-c6b6-4bc6-ad41-37845e946201','3f568f86-118e-4a41-b7b0-b2e9f08eb369'),('23a0d2d8-1531-4d8d-8e88-a87b19de2363','50a5f68f-b3c5-484b-9b7b-1765acbeab7a');
/*!40000 ALTER TABLE `SCOPE_MAPPING` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SCOPE_POLICY`
--

DROP TABLE IF EXISTS `SCOPE_POLICY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `SCOPE_POLICY` (
  `SCOPE_ID` varchar(36) NOT NULL,
  `POLICY_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`SCOPE_ID`,`POLICY_ID`),
  KEY `IDX_SCOPE_POLICY_POLICY` (`POLICY_ID`),
  CONSTRAINT `FK_FRSRASP13XCX4WNKOG82SSRFY` FOREIGN KEY (`POLICY_ID`) REFERENCES `RESOURCE_SERVER_POLICY` (`ID`),
  CONSTRAINT `FK_FRSRPASS3XCX4WNKOG82SSRFY` FOREIGN KEY (`SCOPE_ID`) REFERENCES `RESOURCE_SERVER_SCOPE` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SCOPE_POLICY`
--

LOCK TABLES `SCOPE_POLICY` WRITE;
/*!40000 ALTER TABLE `SCOPE_POLICY` DISABLE KEYS */;
/*!40000 ALTER TABLE `SCOPE_POLICY` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USERNAME_LOGIN_FAILURE`
--

DROP TABLE IF EXISTS `USERNAME_LOGIN_FAILURE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `USERNAME_LOGIN_FAILURE` (
  `REALM_ID` varchar(36) NOT NULL,
  `USERNAME` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `FAILED_LOGIN_NOT_BEFORE` int DEFAULT NULL,
  `LAST_FAILURE` bigint DEFAULT NULL,
  `LAST_IP_FAILURE` varchar(255) DEFAULT NULL,
  `NUM_FAILURES` int DEFAULT NULL,
  PRIMARY KEY (`REALM_ID`,`USERNAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USERNAME_LOGIN_FAILURE`
--

LOCK TABLES `USERNAME_LOGIN_FAILURE` WRITE;
/*!40000 ALTER TABLE `USERNAME_LOGIN_FAILURE` DISABLE KEYS */;
/*!40000 ALTER TABLE `USERNAME_LOGIN_FAILURE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USER_ATTRIBUTE`
--

DROP TABLE IF EXISTS `USER_ATTRIBUTE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `USER_ATTRIBUTE` (
  `NAME` varchar(255) NOT NULL,
  `VALUE` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `USER_ID` varchar(36) NOT NULL,
  `ID` varchar(36) NOT NULL DEFAULT 'sybase-needs-something-here',
  PRIMARY KEY (`ID`),
  KEY `IDX_USER_ATTRIBUTE` (`USER_ID`),
  KEY `IDX_USER_ATTRIBUTE_NAME` (`NAME`,`VALUE`),
  CONSTRAINT `FK_5HRM2VLF9QL5FU043KQEPOVBR` FOREIGN KEY (`USER_ID`) REFERENCES `USER_ENTITY` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER_ATTRIBUTE`
--

LOCK TABLES `USER_ATTRIBUTE` WRITE;
/*!40000 ALTER TABLE `USER_ATTRIBUTE` DISABLE KEYS */;
/*!40000 ALTER TABLE `USER_ATTRIBUTE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USER_CONSENT`
--

DROP TABLE IF EXISTS `USER_CONSENT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `USER_CONSENT` (
  `ID` varchar(36) NOT NULL,
  `CLIENT_ID` varchar(255) DEFAULT NULL,
  `USER_ID` varchar(36) NOT NULL,
  `CREATED_DATE` bigint DEFAULT NULL,
  `LAST_UPDATED_DATE` bigint DEFAULT NULL,
  `CLIENT_STORAGE_PROVIDER` varchar(36) DEFAULT NULL,
  `EXTERNAL_CLIENT_ID` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UK_JKUWUVD56ONTGSUHOGM8UEWRT` (`CLIENT_ID`,`CLIENT_STORAGE_PROVIDER`,`EXTERNAL_CLIENT_ID`,`USER_ID`),
  KEY `IDX_USER_CONSENT` (`USER_ID`),
  CONSTRAINT `FK_GRNTCSNT_USER` FOREIGN KEY (`USER_ID`) REFERENCES `USER_ENTITY` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER_CONSENT`
--

LOCK TABLES `USER_CONSENT` WRITE;
/*!40000 ALTER TABLE `USER_CONSENT` DISABLE KEYS */;
/*!40000 ALTER TABLE `USER_CONSENT` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USER_CONSENT_CLIENT_SCOPE`
--

DROP TABLE IF EXISTS `USER_CONSENT_CLIENT_SCOPE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `USER_CONSENT_CLIENT_SCOPE` (
  `USER_CONSENT_ID` varchar(36) NOT NULL,
  `SCOPE_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`USER_CONSENT_ID`,`SCOPE_ID`),
  KEY `IDX_USCONSENT_CLSCOPE` (`USER_CONSENT_ID`),
  CONSTRAINT `FK_GRNTCSNT_CLSC_USC` FOREIGN KEY (`USER_CONSENT_ID`) REFERENCES `USER_CONSENT` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER_CONSENT_CLIENT_SCOPE`
--

LOCK TABLES `USER_CONSENT_CLIENT_SCOPE` WRITE;
/*!40000 ALTER TABLE `USER_CONSENT_CLIENT_SCOPE` DISABLE KEYS */;
/*!40000 ALTER TABLE `USER_CONSENT_CLIENT_SCOPE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USER_ENTITY`
--

DROP TABLE IF EXISTS `USER_ENTITY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `USER_ENTITY` (
  `ID` varchar(36) NOT NULL,
  `EMAIL` varchar(255) DEFAULT NULL,
  `EMAIL_CONSTRAINT` varchar(255) DEFAULT NULL,
  `EMAIL_VERIFIED` bit(1) NOT NULL DEFAULT b'0',
  `ENABLED` bit(1) NOT NULL DEFAULT b'0',
  `FEDERATION_LINK` varchar(255) DEFAULT NULL,
  `FIRST_NAME` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `LAST_NAME` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `REALM_ID` varchar(255) DEFAULT NULL,
  `USERNAME` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `CREATED_TIMESTAMP` bigint DEFAULT NULL,
  `SERVICE_ACCOUNT_CLIENT_LINK` varchar(255) DEFAULT NULL,
  `NOT_BEFORE` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UK_DYKN684SL8UP1CRFEI6ECKHD7` (`REALM_ID`,`EMAIL_CONSTRAINT`),
  UNIQUE KEY `UK_RU8TT6T700S9V50BU18WS5HA6` (`REALM_ID`,`USERNAME`),
  KEY `IDX_USER_EMAIL` (`EMAIL`),
  KEY `IDX_USER_SERVICE_ACCOUNT` (`REALM_ID`,`SERVICE_ACCOUNT_CLIENT_LINK`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER_ENTITY`
--

LOCK TABLES `USER_ENTITY` WRITE;
/*!40000 ALTER TABLE `USER_ENTITY` DISABLE KEYS */;
INSERT INTO `USER_ENTITY` VALUES ('48ca83ea-b6ac-4048-86d7-f38f4708a617',NULL,'a38f667e-e268-4e07-9e99-0db783586ed7',_binary '\0',_binary '',NULL,NULL,NULL,'60416dc2-4603-4f6b-b014-b0b0fbe038ce','admin',1697235473165,NULL,0),('77f56787-1ab9-46e6-95fc-d9df794d8e13',NULL,'068d25e1-fb20-4e09-a69e-88dc0be45f63',_binary '\0',_binary '',NULL,'','','c0270858-075b-431d-93d7-153e3204d46f','rishabh',1697307881225,NULL,0),('a3fda63b-804e-4375-8a8c-c3466c1dcddd',NULL,'e2140aa9-b644-4a91-ac46-7d9fc930156c',_binary '\0',_binary '',NULL,NULL,NULL,'c0270858-075b-431d-93d7-153e3204d46f','service-account-billing-service-client',1697308808293,'e7ceccbe-612c-424a-8550-1566ffb84a52',0);
/*!40000 ALTER TABLE `USER_ENTITY` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USER_FEDERATION_CONFIG`
--

DROP TABLE IF EXISTS `USER_FEDERATION_CONFIG`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `USER_FEDERATION_CONFIG` (
  `USER_FEDERATION_PROVIDER_ID` varchar(36) NOT NULL,
  `VALUE` varchar(255) DEFAULT NULL,
  `NAME` varchar(255) NOT NULL,
  PRIMARY KEY (`USER_FEDERATION_PROVIDER_ID`,`NAME`),
  CONSTRAINT `FK_T13HPU1J94R2EBPEKR39X5EU5` FOREIGN KEY (`USER_FEDERATION_PROVIDER_ID`) REFERENCES `USER_FEDERATION_PROVIDER` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER_FEDERATION_CONFIG`
--

LOCK TABLES `USER_FEDERATION_CONFIG` WRITE;
/*!40000 ALTER TABLE `USER_FEDERATION_CONFIG` DISABLE KEYS */;
/*!40000 ALTER TABLE `USER_FEDERATION_CONFIG` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USER_FEDERATION_MAPPER`
--

DROP TABLE IF EXISTS `USER_FEDERATION_MAPPER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `USER_FEDERATION_MAPPER` (
  `ID` varchar(36) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  `FEDERATION_PROVIDER_ID` varchar(36) NOT NULL,
  `FEDERATION_MAPPER_TYPE` varchar(255) NOT NULL,
  `REALM_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_USR_FED_MAP_FED_PRV` (`FEDERATION_PROVIDER_ID`),
  KEY `IDX_USR_FED_MAP_REALM` (`REALM_ID`),
  CONSTRAINT `FK_FEDMAPPERPM_FEDPRV` FOREIGN KEY (`FEDERATION_PROVIDER_ID`) REFERENCES `USER_FEDERATION_PROVIDER` (`ID`),
  CONSTRAINT `FK_FEDMAPPERPM_REALM` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER_FEDERATION_MAPPER`
--

LOCK TABLES `USER_FEDERATION_MAPPER` WRITE;
/*!40000 ALTER TABLE `USER_FEDERATION_MAPPER` DISABLE KEYS */;
/*!40000 ALTER TABLE `USER_FEDERATION_MAPPER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USER_FEDERATION_MAPPER_CONFIG`
--

DROP TABLE IF EXISTS `USER_FEDERATION_MAPPER_CONFIG`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `USER_FEDERATION_MAPPER_CONFIG` (
  `USER_FEDERATION_MAPPER_ID` varchar(36) NOT NULL,
  `VALUE` varchar(255) DEFAULT NULL,
  `NAME` varchar(255) NOT NULL,
  PRIMARY KEY (`USER_FEDERATION_MAPPER_ID`,`NAME`),
  CONSTRAINT `FK_FEDMAPPER_CFG` FOREIGN KEY (`USER_FEDERATION_MAPPER_ID`) REFERENCES `USER_FEDERATION_MAPPER` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER_FEDERATION_MAPPER_CONFIG`
--

LOCK TABLES `USER_FEDERATION_MAPPER_CONFIG` WRITE;
/*!40000 ALTER TABLE `USER_FEDERATION_MAPPER_CONFIG` DISABLE KEYS */;
/*!40000 ALTER TABLE `USER_FEDERATION_MAPPER_CONFIG` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USER_FEDERATION_PROVIDER`
--

DROP TABLE IF EXISTS `USER_FEDERATION_PROVIDER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `USER_FEDERATION_PROVIDER` (
  `ID` varchar(36) NOT NULL,
  `CHANGED_SYNC_PERIOD` int DEFAULT NULL,
  `DISPLAY_NAME` varchar(255) DEFAULT NULL,
  `FULL_SYNC_PERIOD` int DEFAULT NULL,
  `LAST_SYNC` int DEFAULT NULL,
  `PRIORITY` int DEFAULT NULL,
  `PROVIDER_NAME` varchar(255) DEFAULT NULL,
  `REALM_ID` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_USR_FED_PRV_REALM` (`REALM_ID`),
  CONSTRAINT `FK_1FJ32F6PTOLW2QY60CD8N01E8` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER_FEDERATION_PROVIDER`
--

LOCK TABLES `USER_FEDERATION_PROVIDER` WRITE;
/*!40000 ALTER TABLE `USER_FEDERATION_PROVIDER` DISABLE KEYS */;
/*!40000 ALTER TABLE `USER_FEDERATION_PROVIDER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USER_GROUP_MEMBERSHIP`
--

DROP TABLE IF EXISTS `USER_GROUP_MEMBERSHIP`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `USER_GROUP_MEMBERSHIP` (
  `GROUP_ID` varchar(36) NOT NULL,
  `USER_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`GROUP_ID`,`USER_ID`),
  KEY `IDX_USER_GROUP_MAPPING` (`USER_ID`),
  CONSTRAINT `FK_USER_GROUP_USER` FOREIGN KEY (`USER_ID`) REFERENCES `USER_ENTITY` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER_GROUP_MEMBERSHIP`
--

LOCK TABLES `USER_GROUP_MEMBERSHIP` WRITE;
/*!40000 ALTER TABLE `USER_GROUP_MEMBERSHIP` DISABLE KEYS */;
/*!40000 ALTER TABLE `USER_GROUP_MEMBERSHIP` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USER_REQUIRED_ACTION`
--

DROP TABLE IF EXISTS `USER_REQUIRED_ACTION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `USER_REQUIRED_ACTION` (
  `USER_ID` varchar(36) NOT NULL,
  `REQUIRED_ACTION` varchar(255) NOT NULL DEFAULT ' ',
  PRIMARY KEY (`REQUIRED_ACTION`,`USER_ID`),
  KEY `IDX_USER_REQACTIONS` (`USER_ID`),
  CONSTRAINT `FK_6QJ3W1JW9CVAFHE19BWSIUVMD` FOREIGN KEY (`USER_ID`) REFERENCES `USER_ENTITY` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER_REQUIRED_ACTION`
--

LOCK TABLES `USER_REQUIRED_ACTION` WRITE;
/*!40000 ALTER TABLE `USER_REQUIRED_ACTION` DISABLE KEYS */;
/*!40000 ALTER TABLE `USER_REQUIRED_ACTION` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USER_ROLE_MAPPING`
--

DROP TABLE IF EXISTS `USER_ROLE_MAPPING`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `USER_ROLE_MAPPING` (
  `ROLE_ID` varchar(255) NOT NULL,
  `USER_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`ROLE_ID`,`USER_ID`),
  KEY `IDX_USER_ROLE_MAPPING` (`USER_ID`),
  CONSTRAINT `FK_C4FQV34P1MBYLLOXANG7B1Q3L` FOREIGN KEY (`USER_ID`) REFERENCES `USER_ENTITY` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER_ROLE_MAPPING`
--

LOCK TABLES `USER_ROLE_MAPPING` WRITE;
/*!40000 ALTER TABLE `USER_ROLE_MAPPING` DISABLE KEYS */;
INSERT INTO `USER_ROLE_MAPPING` VALUES ('1aebcecf-8adc-4e69-b485-80f21fc1093c','48ca83ea-b6ac-4048-86d7-f38f4708a617'),('231c6c50-86bb-4b07-af47-c671e0d45ce7','48ca83ea-b6ac-4048-86d7-f38f4708a617'),('27961cb3-7976-42da-b626-e13437575689','48ca83ea-b6ac-4048-86d7-f38f4708a617'),('29d2aa2d-87cc-4764-bfc5-598e62b92455','48ca83ea-b6ac-4048-86d7-f38f4708a617'),('3377a0ba-bd3a-42d2-aa3b-8a159052b928','48ca83ea-b6ac-4048-86d7-f38f4708a617'),('3cd86926-2dfa-4d9d-8b8c-12d58d567819','48ca83ea-b6ac-4048-86d7-f38f4708a617'),('498a43ea-2981-41ef-a542-b50ee1a33057','48ca83ea-b6ac-4048-86d7-f38f4708a617'),('4d37f56c-202e-4daa-a6ae-84a41e81487d','48ca83ea-b6ac-4048-86d7-f38f4708a617'),('510b6b27-d5d8-4868-9bf4-856f1d3a33db','48ca83ea-b6ac-4048-86d7-f38f4708a617'),('74600cd0-4706-47f2-bee7-1ecd1111ff01','48ca83ea-b6ac-4048-86d7-f38f4708a617'),('953db61f-7a2a-4dd9-8f06-06b33c77e162','48ca83ea-b6ac-4048-86d7-f38f4708a617'),('9e7256ec-fc97-44b2-bba6-b1bd7cc82d1f','48ca83ea-b6ac-4048-86d7-f38f4708a617'),('abdf18ec-fb43-4dd4-9048-9a5f31898481','48ca83ea-b6ac-4048-86d7-f38f4708a617'),('ad58efd3-b9e5-4389-9ec3-c764b7a3c2eb','48ca83ea-b6ac-4048-86d7-f38f4708a617'),('ca362fea-4d07-4a1c-8914-a6af3d0ceeed','48ca83ea-b6ac-4048-86d7-f38f4708a617'),('cf02a5de-d478-4b23-835f-dd10fd07f793','48ca83ea-b6ac-4048-86d7-f38f4708a617'),('ea20c9d5-1a63-4691-990e-396e47a048d1','48ca83ea-b6ac-4048-86d7-f38f4708a617'),('fe50b5b8-60be-4a4a-8a04-dd9d813a71df','48ca83ea-b6ac-4048-86d7-f38f4708a617'),('feea1873-64e9-4c8d-a97d-7edaaee40604','48ca83ea-b6ac-4048-86d7-f38f4708a617'),('133c4c6e-15ef-4490-bf21-020b26792be3','77f56787-1ab9-46e6-95fc-d9df794d8e13'),('a3fb3bf9-938e-4ddb-8f63-ecb065153108','77f56787-1ab9-46e6-95fc-d9df794d8e13'),('a3fb3bf9-938e-4ddb-8f63-ecb065153108','a3fda63b-804e-4375-8a8c-c3466c1dcddd'),('c74c92e2-391f-4197-b8cf-b6eb0e148af4','a3fda63b-804e-4375-8a8c-c3466c1dcddd');
/*!40000 ALTER TABLE `USER_ROLE_MAPPING` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USER_SESSION`
--

DROP TABLE IF EXISTS `USER_SESSION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `USER_SESSION` (
  `ID` varchar(36) NOT NULL,
  `AUTH_METHOD` varchar(255) DEFAULT NULL,
  `IP_ADDRESS` varchar(255) DEFAULT NULL,
  `LAST_SESSION_REFRESH` int DEFAULT NULL,
  `LOGIN_USERNAME` varchar(255) DEFAULT NULL,
  `REALM_ID` varchar(255) DEFAULT NULL,
  `REMEMBER_ME` bit(1) NOT NULL DEFAULT b'0',
  `STARTED` int DEFAULT NULL,
  `USER_ID` varchar(255) DEFAULT NULL,
  `USER_SESSION_STATE` int DEFAULT NULL,
  `BROKER_SESSION_ID` varchar(255) DEFAULT NULL,
  `BROKER_USER_ID` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER_SESSION`
--

LOCK TABLES `USER_SESSION` WRITE;
/*!40000 ALTER TABLE `USER_SESSION` DISABLE KEYS */;
/*!40000 ALTER TABLE `USER_SESSION` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USER_SESSION_NOTE`
--

DROP TABLE IF EXISTS `USER_SESSION_NOTE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `USER_SESSION_NOTE` (
  `USER_SESSION` varchar(36) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  `VALUE` text,
  PRIMARY KEY (`USER_SESSION`,`NAME`),
  CONSTRAINT `FK5EDFB00FF51D3472` FOREIGN KEY (`USER_SESSION`) REFERENCES `USER_SESSION` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER_SESSION_NOTE`
--

LOCK TABLES `USER_SESSION_NOTE` WRITE;
/*!40000 ALTER TABLE `USER_SESSION_NOTE` DISABLE KEYS */;
/*!40000 ALTER TABLE `USER_SESSION_NOTE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `WEB_ORIGINS`
--

DROP TABLE IF EXISTS `WEB_ORIGINS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `WEB_ORIGINS` (
  `CLIENT_ID` varchar(36) NOT NULL,
  `VALUE` varchar(255) NOT NULL,
  PRIMARY KEY (`CLIENT_ID`,`VALUE`),
  KEY `IDX_WEB_ORIG_CLIENT` (`CLIENT_ID`),
  CONSTRAINT `FK_LOJPHO213XCX4WNKOG82SSRFY` FOREIGN KEY (`CLIENT_ID`) REFERENCES `CLIENT` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `WEB_ORIGINS`
--

LOCK TABLES `WEB_ORIGINS` WRITE;
/*!40000 ALTER TABLE `WEB_ORIGINS` DISABLE KEYS */;
INSERT INTO `WEB_ORIGINS` VALUES ('b29858d1-dc20-4c75-983f-aa249b104e88','+'),('e415f27a-40ae-49eb-a2ac-0e6cd4490d2d','http://localhost:4200'),('e7ceccbe-612c-424a-8550-1566ffb84a52','http://localhost:8080'),('f5a1ace1-bd2f-4b96-914a-0e491b492cdc','+');
/*!40000 ALTER TABLE `WEB_ORIGINS` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-10-15 20:23:29

/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;;
/*!40103 SET TIME_ZONE='+00:00' */;;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;;

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `prodlims` /*!40100 DEFAULT CHARACTER SET latin1 */;;

USE `prodlims`;;
SET @saved_cs_client     = @@character_set_client;;
SET character_set_client = utf8;;
/*!50001 CREATE TABLE `_contactinfolatestterritory` (
  `contactinfo_id` tinyint NOT NULL,
  `territory_id` tinyint NOT NULL
) ENGINE=MyISAM */;;
SET character_set_client = @saved_cs_client;;
SET @saved_cs_client     = @@character_set_client;;
SET character_set_client = utf8;;
/*!50001 CREATE TABLE `_contactinfoterritorymaxvalidfrom` (
  `contactinfo_id` tinyint NOT NULL,
  `maxvalidfrom` tinyint NOT NULL
) ENGINE=MyISAM */;;
SET character_set_client = @saved_cs_client;;
SET @saved_cs_client     = @@character_set_client;;
SET character_set_client = utf8;;
/*!50001 CREATE TABLE `_contactlog` (
  `casefile_id` tinyint NOT NULL,
  `body` tinyint NOT NULL,
  `email` tinyint NOT NULL,
  `created` tinyint NOT NULL
) ENGINE=MyISAM */;;
SET character_set_client = @saved_cs_client;;
/*!40101 SET @saved_cs_client     = @@character_set_client */;;
/*!40101 SET character_set_client = utf8 */;;
CREATE TABLE `_history` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `_date` datetime DEFAULT NULL,
  `_from` int(11) DEFAULT NULL,
  `_to` int(11) DEFAULT NULL,
  `template_id` bigint(20) DEFAULT NULL,
  `signed` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKC3CF8B55505F1078` (`template_id`),
  CONSTRAINT `FKC3CF8B55505F1078` FOREIGN KEY (`template_id`) REFERENCES `labeltemplate` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=89 DEFAULT CHARSET=latin1;;
/*!40101 SET character_set_client = @saved_cs_client */;;
SET @saved_cs_client     = @@character_set_client;;
SET character_set_client = utf8;;
/*!50001 CREATE TABLE `_npt_reportsummary_sub1` (
  `kit_id` tinyint NOT NULL,
  `case_id` tinyint NOT NULL,
  `min_rpt_id` tinyint NOT NULL,
  `max_rpt_id` tinyint NOT NULL,
  `kit_received` tinyint NOT NULL,
  `kit_barcode` tinyint NOT NULL,
  `delivered_date` tinyint NOT NULL,
  `maternal_weight` tinyint NOT NULL,
  `sentby` tinyint NOT NULL
) ENGINE=MyISAM */;;
SET character_set_client = @saved_cs_client;;
SET @saved_cs_client     = @@character_set_client;;
SET character_set_client = utf8;;
/*!50001 CREATE TABLE `_orglatestorgpricingplan` (
  `org_id` tinyint NOT NULL,
  `opp_id` tinyint NOT NULL,
  `testtype` tinyint NOT NULL,
  `name` tinyint NOT NULL,
  `validfrom` tinyint NOT NULL,
  `billtotype` tinyint NOT NULL
) ENGINE=MyISAM */;;
SET character_set_client = @saved_cs_client;;
SET @saved_cs_client     = @@character_set_client;;
SET character_set_client = utf8;;
/*!50001 CREATE TABLE `_orglatestterritory` (
  `org_id` tinyint NOT NULL,
  `territory_id` tinyint NOT NULL
) ENGINE=MyISAM */;;
SET character_set_client = @saved_cs_client;;
SET @saved_cs_client     = @@character_set_client;;
SET character_set_client = utf8;;
/*!50001 CREATE TABLE `_orgppmaxvalidfrom` (
  `org_id` tinyint NOT NULL,
  `testtype` tinyint NOT NULL,
  `maxvalidfrom` tinyint NOT NULL
) ENGINE=MyISAM */;;
SET character_set_client = @saved_cs_client;;
SET @saved_cs_client     = @@character_set_client;;
SET character_set_client = utf8;;
/*!50001 CREATE TABLE `_orgterritorymaxvalidfrom` (
  `org_id` tinyint NOT NULL,
  `maxvalidfrom` tinyint NOT NULL
) ENGINE=MyISAM */;;
SET character_set_client = @saved_cs_client;;
SET @saved_cs_client     = @@character_set_client;;
SET character_set_client = utf8;;
/*!50001 CREATE TABLE `_sequencingsample_qc_statistics` (
  `sequencingsample_id` tinyint NOT NULL,
  `id` tinyint NOT NULL,
  `value` tinyint NOT NULL,
  `result_id` tinyint NOT NULL,
  `type_id` tinyint NOT NULL,
  `name` tinyint NOT NULL,
  `description` tinyint NOT NULL,
  `applicability` tinyint NOT NULL
) ENGINE=MyISAM */;;
SET character_set_client = @saved_cs_client;;
SET @saved_cs_client     = @@character_set_client;;
SET character_set_client = utf8;;
/*!50001 CREATE TABLE `_territorydirectormaxvalidfrom` (
  `terr_id` tinyint NOT NULL,
  `maxvalidfrom` tinyint NOT NULL
) ENGINE=MyISAM */;;
SET character_set_client = @saved_cs_client;;
SET @saved_cs_client     = @@character_set_client;;
SET character_set_client = utf8;;
/*!50001 CREATE TABLE `_territorylatestdirector` (
  `terr_id` tinyint NOT NULL,
  `director_id` tinyint NOT NULL
) ENGINE=MyISAM */;;
SET character_set_client = @saved_cs_client;;
/*!40101 SET @saved_cs_client     = @@character_set_client */;;
/*!40101 SET character_set_client = utf8 */;;
CREATE TABLE `accessioning_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `log_message` varchar(512) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `logged_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `user_link` (`user_id`),
  CONSTRAINT `user_link` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;;
/*!40101 SET character_set_client = @saved_cs_client */;;
/*!40101 SET @saved_cs_client     = @@character_set_client */;;
/*!40101 SET character_set_client = utf8 */;;
CREATE TABLE `alg_algorithmplot` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `type` varchar(255) DEFAULT NULL,
  `algorithmresult_id` bigint(20) DEFAULT NULL,
  `plot_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK76C3BC6D5F679D7C` (`algorithmresult_id`),
  KEY `FK76C3BC6D7AE00C45` (`plot_id`),
  CONSTRAINT `FK76C3BC6D5F679D7C` FOREIGN KEY (`algorithmresult_id`) REFERENCES `alg_algorithmresult` (`id`),
  CONSTRAINT `FK76C3BC6D7AE00C45` FOREIGN KEY (`plot_id`) REFERENCES `documentinfo` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11130877 DEFAULT CHARSET=latin1;;
/*!40101 SET character_set_client = @saved_cs_client */;;
/*!40101 SET @saved_cs_client     = @@character_set_client */;;
/*!40101 SET character_set_client = utf8 */;;
CREATE TABLE `alg_algorithmresult` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `phred` int(11) NOT NULL,
  `state` varchar(255) NOT NULL,
  `sequencinginitfile_id` bigint(20) DEFAULT NULL,
  `version_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FKD7CF44A9D5BC5F58` (`sequencinginitfile_id`),
  KEY `FKD7CF44A920092EFA` (`version_id`),
  CONSTRAINT `FKD7CF44A920092EFA` FOREIGN KEY (`version_id`) REFERENCES `hts`.`code_version` (`id`),
  CONSTRAINT `FKD7CF44A9D5BC5F58` FOREIGN KEY (`sequencinginitfile_id`) REFERENCES `alg_sequencinginitfile` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1267857 DEFAULT CHARSET=latin1;;
/*!40101 SET character_set_client = @saved_cs_client */;;
/*!40101 SET @saved_cs_client     = @@character_set_client */;;
/*!40101 SET character_set_client = utf8 */;;
CREATE TABLE `alg_algorithmresult_combinations` (
  `combinedresult_id` bigint(20) NOT NULL,
  `algorithmresult_id` bigint(20) NOT NULL,
  `algorithmorder` int(11) NOT NULL,
  PRIMARY KEY (`algorithmresult_id`,`combinedresult_id`),
  KEY `FK68DFDF5A430F4B38` (`combinedresult_id`),
  KEY `FK68DFDF5A5F679D7C` (`algorithmresult_id`),
  CONSTRAINT `FK68DFDF5A430F4B38` FOREIGN KEY (`combinedresult_id`) REFERENCES `alg_combinedresult` (`id`),
  CONSTRAINT `FK68DFDF5A5F679D7C` FOREIGN KEY (`algorithmresult_id`) REFERENCES `alg_algorithmresult` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;;
/*!40101 SET character_set_client = @saved_cs_client */;;
/*!40101 SET @saved_cs_client     = @@character_set_client */;;
/*!40101 SET character_set_client = utf8 */;;
CREATE TABLE `alg_binaryresult` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `serializedresult` longblob,
  `algorithmresult_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_bc874ecdd56045a2af85ae968aa` (`algorithmresult_id`),
  KEY `FKF8627D215F679D7C` (`algorithmresult_id`),
  CONSTRAINT `FKF8627D215F679D7C` FOREIGN KEY (`algorithmresult_id`) REFERENCES `alg_algorithmresult` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1267780 DEFAULT CHARSET=latin1;;
/*!40101 SET character_set_client = @saved_cs_client */;;
/*!40101 SET @saved_cs_client     = @@character_set_client */;;
/*!40101 SET character_set_client = utf8 */;;
CREATE TABLE `alg_combinedresult` (
  `id` bigint(20) NOT NULL,
  `priors_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKFC6C6465DF015BB8` (`priors_id`),
  KEY `FKFC6C6465F05A1673` (`id`),
  CONSTRAINT `FKFC6C6465DF015BB8` FOREIGN KEY (`priors_id`) REFERENCES `alg_priors` (`id`),
  CONSTRAINT `FKFC6C6465F05A1673` FOREIGN KEY (`id`) REFERENCES `alg_probabilityofdata` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;;
/*!40101 SET character_set_client = @saved_cs_client */;;
/*!40101 SET @saved_cs_client     = @@character_set_client */;;
/*!40101 SET character_set_client = utf8 */;;
CREATE TABLE `alg_hypothesislikelihoods` (
  `ProbabilityOfData_id` bigint(20) NOT NULL,
  `hypothesislikelihoods` double DEFAULT NULL,
  `hypothesisLikelihoods_KEY` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`ProbabilityOfData_id`,`hypothesisLikelihoods_KEY`),
  KEY `FK6037DA84346F48DC` (`ProbabilityOfData_id`),
  CONSTRAINT `FK6037DA84346F48DC` FOREIGN KEY (`ProbabilityOfData_id`) REFERENCES `alg_probabilityofdata` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;;
/*!40101 SET character_set_client = @saved_cs_client */;;
/*!40101 SET @saved_cs_client     = @@character_set_client */;;
/*!40101 SET character_set_client = utf8 */;;
CREATE TABLE `alg_microdelhetrateresult` (
  `childfraction` double DEFAULT NULL,
  `chr1trainconf` double NOT NULL,
  `chr2trainconf` double NOT NULL,
  `noiseparameter` double NOT NULL,
  `id` bigint(20) NOT NULL,
  `biasmodelversion_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FKMICRODEHETRATERESULT` (`id`),
  KEY `FKMICRODELBIASMODELVER` (`biasmodelversion_id`),
  CONSTRAINT `FKMICRODEHETRATERESULT` FOREIGN KEY (`id`) REFERENCES `alg_algorithmresult` (`id`),
  CONSTRAINT `FKMICRODELBIASMODELVER` FOREIGN KEY (`biasmodelversion_id`) REFERENCES `hts`.`code_version` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;;
/*!40101 SET character_set_client = @saved_cs_client */;;
/*!40101 SET @saved_cs_client     = @@character_set_client */;;
/*!40101 SET character_set_client = utf8 */;;
CREATE TABLE `alg_microdelregionresult` (
  `name` varchar(255) NOT NULL,
  `start` varchar(255) DEFAULT NULL,
  `end` varchar(255) DEFAULT NULL,
  `num_informative_snps` int(11) DEFAULT NULL,
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `microdelhetrateresult_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FKMICRODELREGIONRESULT` (`id`),
  KEY `FKMICRODELHETRATERESULT` (`microdelhetrateresult_id`),
  CONSTRAINT `alg_microdelregionresult_ibfk_1` FOREIGN KEY (`microdelhetrateresult_id`) REFERENCES `alg_microdelhetrateresult` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;;
/*!40101 SET character_set_client = @saved_cs_client */;;
/*!40101 SET @saved_cs_client     = @@character_set_client */;;
/*!40101 SET character_set_client = utf8 */;;
CREATE TABLE `alg_nptcountingresult` (
  `nocall` bit(1) NOT NULL,
  `validmodel` bit(1) NOT NULL,
  `id` bigint(20) NOT NULL,
  `chi2fitpval` double DEFAULT NULL,
  `log10snpfitpval` double DEFAULT NULL,
  `dropoutrate` double DEFAULT NULL,
  `model_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKB73A2DDF2BE9F9A9` (`id`),
  KEY `FKHTSCOUNTINGMODEL01` (`model_id`),
  CONSTRAINT `FKB73A2DDF2BE9F9A9` FOREIGN KEY (`id`) REFERENCES `alg_algorithmresult` (`id`),
  CONSTRAINT `FKHTSCOUNTINGMODEL01` FOREIGN KEY (`model_id`) REFERENCES `hts`.`counting_model` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;;
/*!40101 SET character_set_client = @saved_cs_client */;;
/*!40101 SET @saved_cs_client     = @@character_set_client */;;
/*!40101 SET character_set_client = utf8 */;;
CREATE TABLE `alg_npthetrateresult` (
  `childfraction` double DEFAULT NULL,
  `chr1trainconf` double NOT NULL,
  `chr2trainconf` double NOT NULL,
  `noiseparameter` double NOT NULL,
  `id` bigint(20) NOT NULL,
  `biasmodelversion_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK38D9D1E52BE9F9A9` (`id`),
  KEY `FK38D9D1E59652FF0A` (`biasmodelversion_id`),
  CONSTRAINT `FK38D9D1E52BE9F9A9` FOREIGN KEY (`id`) REFERENCES `alg_algorithmresult` (`id`),
  CONSTRAINT `FK38D9D1E59652FF0A` FOREIGN KEY (`biasmodelversion_id`) REFERENCES `hts`.`code_version` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;;
/*!40101 SET character_set_client = @saved_cs_client */;;
/*!40101 SET @saved_cs_client     = @@character_set_client */;;
/*!40101 SET character_set_client = utf8 */;;
CREATE TABLE `alg_nptyresult` (
  `nocall` bit(1) NOT NULL,
  `id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK3E4F4D272BE9F9A9` (`id`),
  CONSTRAINT `FK3E4F4D272BE9F9A9` FOREIGN KEY (`id`) REFERENCES `alg_algorithmresult` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;;
/*!40101 SET character_set_client = @saved_cs_client */;;
/*!40101 SET @saved_cs_client     = @@character_set_client */;;
/*!40101 SET character_set_client = utf8 */;;
CREATE TABLE `alg_overrideresult` (
  `overriddenon` datetime DEFAULT NULL,
  `state` varchar(255) NOT NULL,
  `id` bigint(20) NOT NULL,
  `overriddenby_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKA768E3ECF05A1673` (`id`),
  KEY `FKA768E3EC5D58FA3D` (`overriddenby_id`),
  CONSTRAINT `FKA768E3EC5D58FA3D` FOREIGN KEY (`overriddenby_id`) REFERENCES `user` (`id`),
  CONSTRAINT `FKA768E3ECF05A1673` FOREIGN KEY (`id`) REFERENCES `alg_probabilityofdata` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;;
/*!40101 SET character_set_client = @saved_cs_client */;;
/*!40101 SET @saved_cs_client     = @@character_set_client */;;
/*!40101 SET character_set_client = utf8 */;;
CREATE TABLE `alg_overrideresultmicrodel` (
  `overriddenby_id` bigint(20) DEFAULT NULL,
  `overriddenon` datetime DEFAULT NULL,
  `state` varchar(255) NOT NULL,
  `id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `overriddenby_id` (`overriddenby_id`),
  CONSTRAINT `alg_overrideresultmicrodel_ibfk_1` FOREIGN KEY (`overriddenby_id`) REFERENCES `user` (`id`),
  CONSTRAINT `alg_overrideresultmicrodel_ibfk_2` FOREIGN KEY (`id`) REFERENCES `alg_probabilityofdata` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;;
/*!40101 SET character_set_client = @saved_cs_client */;;
/*!40101 SET @saved_cs_client     = @@character_set_client */;;
/*!40101 SET character_set_client = utf8 */;;
CREATE TABLE `alg_priors` (
  `uniform` bit(1) NOT NULL,
  `id` bigint(20) NOT NULL,
  `gestationalage_high` int(11) DEFAULT NULL,
  `gestationalage_low` int(11) DEFAULT NULL,
  `maternalage_high` int(11) DEFAULT NULL,
  `maternalage_low` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK4F5262ECF05A1673` (`id`),
  CONSTRAINT `FK4F5262ECF05A1673` FOREIGN KEY (`id`) REFERENCES `alg_probabilityofdata` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;;
/*!40101 SET character_set_client = @saved_cs_client */;;
/*!40101 SET @saved_cs_client     = @@character_set_client */;;
/*!40101 SET character_set_client = utf8 */;;
CREATE TABLE `alg_probabilityofdata` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `chromosome` varchar(255) DEFAULT NULL,
  `agebasedriskscore` double DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18307905 DEFAULT CHARSET=latin1;;
/*!40101 SET character_set_client = @saved_cs_client */;;
/*!40101 SET @saved_cs_client     = @@character_set_client */;;
/*!40101 SET character_set_client = utf8 */;;
CREATE TABLE `alg_samplemetadatasnapshot` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `datapath` varchar(255) DEFAULT NULL,
  `familyid` varchar(255) DEFAULT NULL,
  `matlabfamilyposition` varchar(255) DEFAULT NULL,
  `gender` varchar(255) DEFAULT NULL,
  `genotypetruth` bit(1) DEFAULT NULL,
  `gestationalage` int(11) DEFAULT NULL,
  `prepnotes` varchar(255) DEFAULT NULL,
  `prepprocedure` varchar(255) DEFAULT NULL,
  `project` varchar(255) DEFAULT NULL,
  `rundate` varchar(255) DEFAULT NULL,
  `runid` bigint(20) DEFAULT NULL,
  `samplebarcode` varchar(255) DEFAULT NULL,
  `sampleid` varchar(255) DEFAULT NULL,
  `samplescale` varchar(255) DEFAULT NULL,
  `sequencingfailed` bit(1) DEFAULT NULL,
  `spiketargetset` varchar(255) DEFAULT NULL,
  `spiketargetsetid` bigint(20) DEFAULT NULL,
  `star1plateid` bigint(20) DEFAULT NULL,
  `state` varchar(255) DEFAULT NULL,
  `targetset` varchar(255) DEFAULT NULL,
  `targetsetid` bigint(20) DEFAULT NULL,
  `tissuetype` varchar(255) DEFAULT NULL,
  `sequencinginitfile_id` bigint(20) DEFAULT NULL,
  `sequencingsample_id` bigint(20) DEFAULT NULL,
  `familyPosition` varchar(255) NOT NULL DEFAULT '',
  `positionId` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `FK86D9E9A0AA155A0D` (`sequencingsample_id`),
  KEY `FK86D9E9A0D5BC5F58` (`sequencinginitfile_id`),
  CONSTRAINT `FK86D9E9A0AA155A0D` FOREIGN KEY (`sequencingsample_id`) REFERENCES `hts`.`sequencingsample` (`id`),
  CONSTRAINT `FK86D9E9A0D5BC5F58` FOREIGN KEY (`sequencinginitfile_id`) REFERENCES `alg_sequencinginitfile` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2779724 DEFAULT CHARSET=latin1;;
/*!40101 SET character_set_client = @saved_cs_client */;;
/*!40101 SET @saved_cs_client     = @@character_set_client */;;
/*!40101 SET character_set_client = utf8 */;;
CREATE TABLE `alg_sequencinginitfile` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `digest` varchar(255) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `lastaccessed` datetime DEFAULT NULL,
  `casefile_id` bigint(20) DEFAULT NULL,
  `state` varchar(45) DEFAULT NULL,
  `laststatechangetime` datetime DEFAULT NULL,
  `hetandy_job_id` bigint(20) DEFAULT NULL,
  `hetandy_job_create_date` datetime DEFAULT NULL,
  `hetandy_moabjob_id` varchar(45) DEFAULT NULL,
  `training_job_id` bigint(20) DEFAULT NULL,
  `training_job_create_date` datetime DEFAULT NULL,
  `training_moabjob_id` varchar(45) DEFAULT NULL,
  `counting_job_id` bigint(20) DEFAULT NULL,
  `counting_job_create_date` datetime DEFAULT NULL,
  `counting_moabjob_id` varchar(45) DEFAULT NULL,
  `reflexed` bit(1) DEFAULT NULL,
  `sequencingInitFileType` varchar(255) DEFAULT 'NPT',
  `rollupfailuretime` datetime DEFAULT NULL,
  `cloudJobID` varchar(255) DEFAULT NULL,
  `cloudContQCJobID` varchar(255) DEFAULT NULL,
  `cloudMicrodelJobID` varchar(255) DEFAULT NULL,
  `isCloud` bit(1) NOT NULL DEFAULT b'0',
  `numOfAlgsJobRetry` int(11) NOT NULL DEFAULT '0',
  `microdelTestNoCallFailedQC` bit(1) DEFAULT b'0',
  `errorState` varchar(255) DEFAULT NULL,
  `numOfContextualJobRetry` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `digest` (`digest`),
  KEY `FKE42FAC4D4F9FCF70` (`casefile_id`),
  KEY `IDXSTATEE424324470` (`state`),
  CONSTRAINT `FKE42FAC4D4F9FCF70` FOREIGN KEY (`casefile_id`) REFERENCES `casefile` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1538405 DEFAULT CHARSET=latin1;;
/*!40101 SET character_set_client = @saved_cs_client */;;
/*!40101 SET @saved_cs_client     = @@character_set_client */;;
/*!40101 SET character_set_client = utf8 */;;
CREATE TABLE `alg_snpexclusion` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `chromosome` varchar(255) NOT NULL,
  `fractionexcluded` double NOT NULL,
  `algorithmresult_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK776CC1BC5F679D7C` (`algorithmresult_id`),
  CONSTRAINT `FK776CC1BC5F679D7C` FOREIGN KEY (`algorithmresult_id`) REFERENCES `alg_algorithmresult` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1875771 DEFAULT CHARSET=latin1;;
/*!40101 SET character_set_client = @saved_cs_client */;;
/*!40101 SET @saved_cs_client     = @@character_set_client */;;
/*!40101 SET character_set_client = utf8 */;;
CREATE TABLE `alg_snpexclusionbyorigin` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `originreason` varchar(255) NOT NULL,
  `snpexclusion_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK4E4423F9E571B318` (`snpexclusion_id`),
  CONSTRAINT `FK4E4423F9E571B318` FOREIGN KEY (`snpexclusion_id`) REFERENCES `alg_snpexclusion` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2377681 DEFAULT CHARSET=latin1;;
/*!40101 SET character_set_client = @saved_cs_client */;;
/*!40101 SET @saved_cs_client     = @@character_set_client */;;
/*!40101 SET character_set_client = utf8 */;;
CREATE TABLE `alg_snpexclusionrange` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `leftlocation` int(11) DEFAULT NULL,
  `leftname` varchar(255) DEFAULT NULL,
  `rightlocation` int(11) DEFAULT NULL,
  `rightname` varchar(255) DEFAULT NULL,
  `snpexclusionbyorigin_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FKEAA72D01747C038` (`snpexclusionbyorigin_id`),
  CONSTRAINT `FKEAA72D01747C038` FOREIGN KEY (`snpexclusionbyorigin_id`) REFERENCES `alg_snpexclusionbyorigin` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8934032 DEFAULT CHARSET=latin1;;
/*!40101 SET character_set_client = @saved_cs_client */;;
/*!40101 SET @saved_cs_client     = @@character_set_client */;;
/*!40101 SET character_set_client = utf8 */;;
CREATE TABLE `aliquot` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `barcode` varchar(255) DEFAULT NULL,
  `state` varchar(255) DEFAULT NULL,
  `semensample_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK2CBD3587689E3D11` (`semensample_id`),
  KEY `FK_b94bd040b4824a8787f847c15c1` (`semensample_id`),
  CONSTRAINT `FK_b94bd040b4824a8787f847c15c1` FOREIGN KEY (`semensample_id`) REFERENCES `sample` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1181 DEFAULT CHARSET=latin1;;
/*!40101 SET character_set_client = @saved_cs_client */;;
SET @saved_cs_client     = @@character_set_client;;
SET character_set_client = utf8;;
/*!50001 CREATE TABLE `allreport_paternity` (
  `clinic_name` tinyint NOT NULL,
  `casefile_id` tinyint NOT NULL,
  `report_id` tinyint NOT NULL,
  `sample_id` tinyint NOT NULL,
  `mother_sample_received` tinyint NOT NULL,
  `mother_sample_collected` tinyint NOT NULL,
  `mother_redraw_sample_received` tinyint NOT NULL,
  `mother_redraw_sample_collected` tinyint NOT NULL,
  `af_sample_received` tinyint NOT NULL,
  `af_sample_collected` tinyint NOT NULL,
  `af_redraw_sample_received` tinyint NOT NULL,
  `af_redraw_sample_collected` tinyint NOT NULL,
  `af_sample_id` tinyint NOT NULL,
  `reported_call` tinyint NOT NULL,
  `algorithm_call` tinyint NOT NULL,
  `reported_plot` tinyint NOT NULL,
  `algorithm_plot` tinyint NOT NULL,
  `p_value` tinyint NOT NULL,
  `fetal_fraction_context_none` tinyint NOT NULL,
  `fetal_fraction_context_af` tinyint NOT NULL,
  `drop_out_rate` tinyint NOT NULL,
  `gestationalage` tinyint NOT NULL,
  `mother_race` tinyint NOT NULL,
  `alleged_father_race` tinyint NOT NULL,
  `report_senton` tinyint NOT NULL,
  `published` tinyint NOT NULL,
  `amended` tinyint NOT NULL
) ENGINE=MyISAM */;;
SET character_set_client = @saved_cs_client;;
/*!40101 SET @saved_cs_client     = @@character_set_client */;;
/*!40101 SET character_set_client = utf8 */;;
CREATE TABLE `amp2plate` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `barcode` varchar(255) NOT NULL,
  `state` varchar(255) DEFAULT NULL,
  `denaturationend` datetime DEFAULT NULL,
  `denaturationstart` datetime DEFAULT NULL,
  `drypelletend` datetime DEFAULT NULL,
  `drypelletstart` datetime DEFAULT NULL,
  `fragmentamp2_incubationendtime` datetime DEFAULT NULL,
  `fragmentamp2_incubationstarttime` datetime DEFAULT NULL,
  `illuminaarraytype` varchar(255) DEFAULT NULL,
  `makeamp2_ovenendtime` datetime DEFAULT NULL,
  `makeamp2_ovenstarttime` datetime DEFAULT NULL,
  `precipitateamp2_incubationendtime` datetime DEFAULT NULL,
  `precipitateamp2_incubationstarttime` datetime DEFAULT NULL,
  `resuspendamp2_incubationendtime` datetime DEFAULT NULL,
  `resuspendamp2_incubationstarttime` datetime DEFAULT NULL,
  `experiment` varchar(255) DEFAULT NULL,
  `experimentdate` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `barcode` (`barcode`)
) ENGINE=InnoDB AUTO_INCREMENT=4591 DEFAULT CHARSET=latin1;;
/*!40101 SET character_set_client = @saved_cs_client */;;
/*!40101 SET @saved_cs_client     = @@character_set_client */;;
/*!40101 SET character_set_client = utf8 */;;
CREATE TABLE `amp2plate_inventorieditem` (
  `Amp2Plate_id` bigint(20) NOT NULL,
  `reagents_id` bigint(20) NOT NULL,
  PRIMARY KEY (`Amp2Plate_id`,`reagents_id`),
  KEY `FKAE4B2E7E71F8F2B` (`reagents_id`),
  KEY `FKAE4B2E77F6526FA` (`Amp2Plate_id`),
  CONSTRAINT `FKAE4B2E77F6526FA` FOREIGN KEY (`Amp2Plate_id`) REFERENCES `amp2plate` (`id`),
  CONSTRAINT `FKAE4B2E7E71F8F2B` FOREIGN KEY (`reagents_id`) REFERENCES `inventorieditem` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;;
/*!40101 SET character_set_client = @saved_cs_client */;;
/*!40101 SET @saved_cs_client     = @@character_set_client */;;
/*!40101 SET character_set_client = utf8 */;;
CREATE TABLE `amp2plate_sample` (
  `amp2plates_id` bigint(20) NOT NULL,
  `samplelist_id` bigint(20) NOT NULL,
  `idx` int(11) NOT NULL,
  PRIMARY KEY (`amp2plates_id`,`idx`),
  KEY `FK165D61417AEFF4C5` (`samplelist_id`),
  KEY `FK165D6141F30BC477` (`amp2plates_id`),
  CONSTRAINT `FK165D61417AEFF4C5` FOREIGN KEY (`samplelist_id`) REFERENCES `sample` (`id`),
  CONSTRAINT `FK165D6141F30BC477` FOREIGN KEY (`amp2plates_id`) REFERENCES `amp2plate` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;;
/*!40101 SET character_set_client = @saved_cs_client */;;
SET @saved_cs_client     = @@character_set_client;;
SET character_set_client = utf8;;
/*!50001 CREATE TABLE `arraysummary` (
  `Case id` tinyint NOT NULL,
  `Product` tinyint NOT NULL,
  `Array id` tinyint NOT NULL,
  `Chip type` tinyint NOT NULL,
  `Date consumed` tinyint NOT NULL,
  `billable` tinyint NOT NULL,
  `non-billable` tinyint NOT NULL,
  `Sample barcode` tinyint NOT NULL,
  `Sample type` tinyint NOT NULL,
  `MSA1 barcode` tinyint NOT NULL
) ENGINE=MyISAM */;;
SET character_set_client = @saved_cs_client;;
SET @saved_cs_client     = @@character_set_client;;
SET character_set_client = utf8;;
/*!50001 CREATE TABLE `arraysummaryforblastkits` (
  `Case id` tinyint NOT NULL,
  `Product` tinyint NOT NULL,
  `Array id` tinyint NOT NULL,
  `Chip type` tinyint NOT NULL,
  `Date consumed` tinyint NOT NULL,
  `billable` tinyint NOT NULL,
  `non-billable` tinyint NOT NULL,
  `Sample barcode` tinyint NOT NULL,
  `Sample type` tinyint NOT NULL,
  `MSA1 barcode` tinyint NOT NULL,
  `Territory Name` tinyint NOT NULL
) ENGINE=MyISAM */;;
SET character_set_client = @saved_cs_client;;
SET @saved_cs_client     = @@character_set_client;;
SET character_set_client = utf8;;
/*!50001 CREATE TABLE `arraysummaryforcontrolsamples` (
  `Case id` tinyint NOT NULL,
  `Product` tinyint NOT NULL,
  `Array id` tinyint NOT NULL,
  `Chip type` tinyint NOT NULL,
  `Date consumed` tinyint NOT NULL,
  `billable` tinyint NOT NULL,
  `non-billable` tinyint NOT NULL,
  `Sample barcode` tinyint NOT NULL,
  `Sample type` tinyint NOT NULL,
  `MSA1 barcode` tinyint NOT NULL,
  `Territory Name` tinyint NOT NULL
) ENGINE=MyISAM */;;
SET character_set_client = @saved_cs_client;;
SET @saved_cs_client     = @@character_set_client;;
SET character_set_client = utf8;;
/*!50001 CREATE TABLE `arraysummaryforparentsamples` (
  `Case id` tinyint NOT NULL,
  `Product` tinyint NOT NULL,
  `Array id` tinyint NOT NULL,
  `Chip type` tinyint NOT NULL,
  `Date consumed` tinyint NOT NULL,
  `billable` tinyint NOT NULL,
  `non-billable` tinyint NOT NULL,
  `Sample barcode` tinyint NOT NULL,
  `Sample type` tinyint NOT NULL,
  `MSA1 barcode` tinyint NOT NULL,
  `Territory Name` tinyint NOT NULL
) ENGINE=MyISAM */;;
SET character_set_client = @saved_cs_client;;
SET @saved_cs_client     = @@character_set_client;;
SET character_set_client = utf8;;
/*!50001 CREATE TABLE `arraysummaryforresearchsamples` (
  `Case id` tinyint NOT NULL,
  `Product` tinyint NOT NULL,
  `Array id` tinyint NOT NULL,
  `Chip type` tinyint NOT NULL,
  `Date consumed` tinyint NOT NULL,
  `billable` tinyint NOT NULL,
  `non-billable` tinyint NOT NULL,
  `Sample barcode` tinyint NOT NULL,
  `Sample type` tinyint NOT NULL,
  `MSA1 barcode` tinyint NOT NULL,
  `Territory Name` tinyint NOT NULL
) ENGINE=MyISAM */;;
SET character_set_client = @saved_cs_client;;
SET @saved_cs_client     = @@character_set_client;;
SET character_set_client = utf8;;
/*!50001 CREATE TABLE `arraysummaryforspermsamples` (
  `Case id` tinyint NOT NULL,
  `Product` tinyint NOT NULL,
  `Array id` tinyint NOT NULL,
  `Chip type` tinyint NOT NULL,
  `Date consumed` tinyint NOT NULL,
  `billable` tinyint NOT NULL,
  `non-billable` tinyint NOT NULL,
  `Sample barcode` tinyint NOT NULL,
  `Sample type` tinyint NOT NULL,
  `MSA1 barcode` tinyint NOT NULL,
  `Territory Name` tinyint NOT NULL
) ENGINE=MyISAM */;;
SET character_set_client = @saved_cs_client;;
/*!40101 SET @saved_cs_client     = @@character_set_client */;;
/*!40101 SET character_set_client = utf8 */;;
CREATE TABLE `blastomereplate` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `barcode` varchar(255) NOT NULL,
  `state` varchar(255) DEFAULT NULL,
  `alblotnumber` varchar(255) DEFAULT NULL,
  `received` datetime DEFAULT NULL,
  `templatecontrolspresent` bit(1) DEFAULT NULL,
  `casefile_id` bigint(20) DEFAULT NULL,
  `receivedby_id` bigint(20) DEFAULT NULL,
  `biopsyperformedby` varchar(255) DEFAULT NULL,
  `highestquality` varchar(255) DEFAULT NULL,
  `lowestquality` varchar(255) DEFAULT NULL,
  `mii` varchar(255) DEFAULT NULL,
  `biopsydate` datetime DEFAULT NULL,
  `fertilized` varchar(255) DEFAULT NULL,
  `plannedtime` varchar(255) DEFAULT NULL,
  `notes` longtext,
  `disposed` bit(1) DEFAULT b'0',
  `gestationalage` int(11) DEFAULT NULL,
  `villiseen` bit(1) DEFAULT NULL,
  `shippingtrackingnumber` varchar(255) DEFAULT NULL,
  `cycletext` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `barcode` (`barcode`),
  KEY `FK881FC54CB9103C3` (`casefile_id`),
  KEY `FK881FC54D39E5084` (`receivedby_id`),
  CONSTRAINT `FK881FC54CB9103C3` FOREIGN KEY (`casefile_id`) REFERENCES `casefile` (`id`),
  CONSTRAINT `FK881FC54D39E5084` FOREIGN KEY (`receivedby_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=36355 DEFAULT CHARSET=latin1;;

/*!40101 SET @saved_cs_client     = @@character_set_client */;;
/*!40101 SET character_set_client = utf8 */;;
CREATE TABLE `blastomereplate_inventorieditem` (
  `BlastomerePlate_id` bigint(20) NOT NULL,
  `reagents_id` bigint(20) NOT NULL,
  PRIMARY KEY (`BlastomerePlate_id`,`reagents_id`),
  KEY `FK8C2B6693E71F8F2B` (`reagents_id`),
  KEY `FK8C2B66931262F7A` (`BlastomerePlate_id`),
  CONSTRAINT `FK8C2B66931262F7A` FOREIGN KEY (`BlastomerePlate_id`) REFERENCES `blastomereplate` (`id`),
  CONSTRAINT `FK8C2B6693E71F8F2B` FOREIGN KEY (`reagents_id`) REFERENCES `inventorieditem` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;;
/*!40101 SET character_set_client = @saved_cs_client */;;
/*!40101 SET @saved_cs_client     = @@character_set_client */;;
/*!40101 SET character_set_client = utf8 */;;
CREATE TABLE `blastomereplate_sample` (
  `blastomereplates_id` bigint(20) NOT NULL,
  `samplelist_id` bigint(20) NOT NULL,
  `idx` int(11) NOT NULL,
  PRIMARY KEY (`blastomereplates_id`,`idx`),
  KEY `FK87099C156603ADCF` (`blastomereplates_id`),
  KEY `FK87099C1547A0B25D` (`samplelist_id`),
  KEY `FK87099C157AEFF4C5` (`samplelist_id`),
  CONSTRAINT `FK87099C1547A0B25D` FOREIGN KEY (`samplelist_id`) REFERENCES `sample` (`id`),
  CONSTRAINT `FK87099C156603ADCF` FOREIGN KEY (`blastomereplates_id`) REFERENCES `blastomereplate` (`id`),
  CONSTRAINT `FK87099C157AEFF4C5` FOREIGN KEY (`samplelist_id`) REFERENCES `sample` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;;
/*!40101 SET character_set_client = @saved_cs_client */;;
SET @saved_cs_client     = @@character_set_client;;
SET character_set_client = utf8;;
/*!50001 CREATE TABLE `blastomereplaterun` (
  `barcode` tinyint NOT NULL,
  `gestationalage` tinyint NOT NULL,
  `run_date` tinyint NOT NULL,
  `run_status` tinyint NOT NULL,
  `casefile_id` tinyint NOT NULL,
  `clinic_name` tinyint NOT NULL
) ENGINE=MyISAM */;;
SET character_set_client = @saved_cs_client;;
/*!40101 SET @saved_cs_client     = @@character_set_client */;;
/*!40101 SET character_set_client = utf8 */;;
CREATE TABLE `calendarevent` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `digest` tinyblob,
  `event_id` varchar(255) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `casefile_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `casefile_id` (`casefile_id`),
  UNIQUE KEY `UK_a1805d5647bf4439acae23c0659` (`casefile_id`),
  KEY `FK7558CE1CCB9103C3` (`casefile_id`),
  CONSTRAINT `FK7558CE1CCB9103C3` FOREIGN KEY (`casefile_id`) REFERENCES `casefile` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=33486 DEFAULT CHARSET=latin1;;
/*!40101 SET character_set_client = @saved_cs_client */;;
SET @saved_cs_client     = @@character_set_client;;
SET character_set_client = utf8;;
/*!50001 CREATE TABLE `casecategorysummary` (
  `id` tinyint NOT NULL,
  `clinic` tinyint NOT NULL,
  `referred` tinyint NOT NULL,
  `referred month` tinyint NOT NULL,
  `ER` tinyint NOT NULL,
  `ER month` tinyint NOT NULL,
  `category` tinyint NOT NULL,
  `category_id` tinyint NOT NULL
) ENGINE=MyISAM */;;
SET character_set_client = @saved_cs_client;;
/*!40101 SET @saved_cs_client     = @@character_set_client */;;
/*!40101 SET character_set_client = utf8 */;;
CREATE TABLE `casefile` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `thirdpartyid` varchar(255) DEFAULT NULL,
  `closed` datetime DEFAULT NULL,
  `closingnotes` text,
  `expectedretrievaldate` datetime DEFAULT NULL,
  `opened` datetime DEFAULT NULL,
  `paymentprocessed` bit(1) NOT NULL,
  `referralreason` varchar(255) DEFAULT NULL,
  `version` bigint(20) NOT NULL,
  `satelliteaddress_id` bigint(20) DEFAULT NULL,
  `owner_id` bigint(20) DEFAULT NULL,
  `patientcontactinfo_id` bigint(20) DEFAULT NULL,
  `clinic_id` bigint(20) DEFAULT NULL,
  `aneureport_id` bigint(20) DEFAULT NULL,
  `clinicalhistory_id` bigint(20) DEFAULT NULL,
  `physician_id` bigint(20) DEFAULT NULL,
  `testtype` varchar(255) DEFAULT NULL,
  `labnote` text,
  `amendedNote` text,
  `lastAmendedNoteChange` datetime DEFAULT NULL,
  `parentsourcereport_id` bigint(20) DEFAULT NULL,
  `residualrisksreport_id` bigint(20) DEFAULT NULL,
  `referralsource` varchar(750) DEFAULT NULL,
  `family_id` bigint(20) DEFAULT NULL,
  `deliveryinstructions` longtext,
  `expectedtransferdate` datetime DEFAULT NULL,
  `targetdate` datetime DEFAULT NULL,
  `reviewed` tinyint(1) DEFAULT NULL,
  `greenlightoverridden` tinyint(1) DEFAULT NULL,
  `insuranceclaimed` bit(1) DEFAULT NULL,
  `skipxifin` bit(1) NOT NULL DEFAULT b'0',
  `historicterritory_id` bigint(20) DEFAULT NULL,
  `historicdirector_id` bigint(20) DEFAULT NULL,
  `historicpricingplan_id` bigint(20) DEFAULT NULL,
  `overridebillto` varchar(255) DEFAULT NULL,
  `deliverydate` datetime DEFAULT NULL,
  `deliverystatus` varchar(255) DEFAULT NULL,
  `poc_collectiondate` datetime DEFAULT NULL,
  `poc_lossdate` datetime DEFAULT NULL,
  `paternity_fields_id` bigint(20) DEFAULT NULL,
  `expectedduedate` datetime DEFAULT NULL,
  `submissioncode` varchar(255) DEFAULT NULL,
  `submissiondate` datetime DEFAULT NULL,
  `reportduedate` datetime DEFAULT NULL,
  `whitegloved` bit(1) DEFAULT b'0',
  `closingreason_id` bigint(20) DEFAULT NULL,
  `patientpregnancystatus` varchar(255) DEFAULT NULL,
  `state` varchar(255) DEFAULT NULL,
  `pocState` varchar(255) DEFAULT NULL,
  `dashboardnote` varchar(255) DEFAULT NULL,
  `forceCFInternalResults` bit(1) DEFAULT NULL,
  `csReferralVersion` varchar(255) DEFAULT NULL,
  `reportTriploidy` bit(1) DEFAULT b'0',
  `reportMicrodeletions` bit(1) DEFAULT b'0',
  `microdelpanel` varchar(255) DEFAULT 'NONE',
  `billingcode` varchar(50) DEFAULT NULL,
  `momRequired` bit(1) NOT NULL DEFAULT b'1',
  `gcAppointmentMade` bit(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK51930EC28811DD8` (`satelliteaddress_id`),
  KEY `FK51930ECE0BBF469` (`aneureport_id`),
  KEY `FK51930EC1FAE31FC` (`clinic_id`),
  KEY `FK51930EC46C3DCB8` (`physician_id`),
  KEY `FK51930ECB2DBDD88` (`patientcontactinfo_id`),
  KEY `FK51930ECC0F261E9` (`owner_id`),
  KEY `FK51930EC2B322955` (`clinicalhistory_id`),
  KEY `FK51930EC88EDADC6` (`family_id`),
  KEY `FK51930ECC9DB09C1` (`parentsourcereport_id`),
  KEY `FK51930EC34575052` (`paternity_fields_id`),
  KEY `FK51930EC93BD15B` (`closingreason_id`),
  KEY `FK51930EC257D5996` (`historicterritory_id`),
  KEY `FK51930ECBC3C0E5D` (`historicdirector_id`),
  KEY `FK51930EC925223E3` (`historicpricingplan_id`),
  KEY `tpidindex` (`thirdpartyid`),
  KEY `closedindex` (`closed`),
  KEY `FK_6d3ebeebbcf6418dbab2898269e` (`residualrisksreport_id`),
  CONSTRAINT `casefile_ibfk_1` FOREIGN KEY (`closingreason_id`) REFERENCES `reasoncode` (`id`),
  CONSTRAINT `FK51930EC1FAE31FC` FOREIGN KEY (`clinic_id`) REFERENCES `organization` (`id`),
  CONSTRAINT `FK51930EC257D5996` FOREIGN KEY (`historicterritory_id`) REFERENCES `territory` (`id`),
  CONSTRAINT `FK51930EC28811DD8` FOREIGN KEY (`satelliteaddress_id`) REFERENCES `contactinfo` (`id`),
  CONSTRAINT `FK51930EC2B322955` FOREIGN KEY (`clinicalhistory_id`) REFERENCES `clinicalhistoryform` (`id`),
  CONSTRAINT `FK51930EC34575052` FOREIGN KEY (`paternity_fields_id`) REFERENCES `paternity_fields` (`id`),
  CONSTRAINT `FK51930EC46C3DCB8` FOREIGN KEY (`physician_id`) REFERENCES `provider` (`id`),
  CONSTRAINT `FK51930EC88EDADC6` FOREIGN KEY (`family_id`) REFERENCES `family` (`id`),
  CONSTRAINT `FK51930EC925223E3` FOREIGN KEY (`historicpricingplan_id`) REFERENCES `organizationpricingplan` (`id`),
  CONSTRAINT `FK51930ECB2DBDD88` FOREIGN KEY (`patientcontactinfo_id`) REFERENCES `contactinfo` (`id`),
  CONSTRAINT `FK51930ECBC3C0E5D` FOREIGN KEY (`historicdirector_id`) REFERENCES `user` (`id`),
  CONSTRAINT `FK51930ECC0F261E9` FOREIGN KEY (`owner_id`) REFERENCES `user` (`id`),
  CONSTRAINT `FK51930ECC9DB09C1` FOREIGN KEY (`parentsourcereport_id`) REFERENCES `documentinfo` (`id`),
  CONSTRAINT `FK51930ECE0BBF469` FOREIGN KEY (`aneureport_id`) REFERENCES `documentinfo` (`id`),
  CONSTRAINT `FK_6d3ebeebbcf6418dbab2898269e` FOREIGN KEY (`residualrisksreport_id`) REFERENCES `documentinfo` (`id`),
  CONSTRAINT `FK_casefile_parentsourcereport` FOREIGN KEY (`parentsourcereport_id`) REFERENCES `documentinfo` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=967106 DEFAULT CHARSET=latin1;;
/*!40101 SET character_set_client = @saved_cs_client */;;
/*!40101 SET @saved_cs_client     = @@character_set_client */;;
/*!40101 SET character_set_client = utf8 */;;
CREATE TABLE `casefile_blastomerekitcode` (
  `CaseFile_id` bigint(20) NOT NULL,
  `blastomerekitcode_element` varchar(255) NOT NULL,
  PRIMARY KEY (`CaseFile_id`,`blastomerekitcode_element`),
  UNIQUE KEY `blastomerekitcode_element` (`blastomerekitcode_element`),
  KEY `FK63C01B2ECB9103C3` (`CaseFile_id`),
  CONSTRAINT `FK63C01B2ECB9103C3` FOREIGN KEY (`CaseFile_id`) REFERENCES `casefile` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;;
/*!40101 SET character_set_client = @saved_cs_client */;;
/*!40101 SET @saved_cs_client     = @@character_set_client */;;
/*!40101 SET character_set_client = utf8 */;;
CREATE TABLE `casefile_category` (
  `CaseFile_id` bigint(20) NOT NULL,
  `categories_id` bigint(20) NOT NULL,
  PRIMARY KEY (`CaseFile_id`,`categories_id`),
  KEY `FKAC336B11CB9103C3` (`CaseFile_id`) USING BTREE,
  KEY `FKAC336B113EAAD085` (`categories_id`) USING BTREE,
  CONSTRAINT `FKAC336B113EAAD085` FOREIGN KEY (`categories_id`) REFERENCES `category` (`id`),
  CONSTRAINT `FKAC336B11CB9103C3` FOREIGN KEY (`CaseFile_id`) REFERENCES `casefile` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;;
/*!40101 SET character_set_client = @saved_cs_client */;;
/*!40101 SET @saved_cs_client     = @@character_set_client */;;
/*!40101 SET character_set_client = utf8 */;;
CREATE TABLE `casefile_cncreportshipmentrecord` (
  `CaseFile_id` bigint(20) NOT NULL,
  `cncreportshipmentrecords_id` bigint(20) NOT NULL,
  UNIQUE KEY `cncreportshipmentrecords_id` (`cncreportshipmentrecords_id`),
  UNIQUE KEY `UK_6fcbe990ce044f29afc49077554` (`cncreportshipmentrecords_id`),
  KEY `FK426343E4CB9103C3` (`CaseFile_id`),
  KEY `FK426343E4660F3429` (`cncreportshipmentrecords_id`),
  CONSTRAINT `FK426343E4660F3429` FOREIGN KEY (`cncreportshipmentrecords_id`) REFERENCES `cncreportshipmentrecord` (`id`),
  CONSTRAINT `FK426343E4CB9103C3` FOREIGN KEY (`CaseFile_id`) REFERENCES `casefile` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;;

/*!40101 SET @saved_cs_client     = @@character_set_client */;;
/*!40101 SET character_set_client = utf8 */;;
CREATE TABLE `casefile_diagnosis` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `casefile_id` bigint(20) NOT NULL,
  `set_id` int(1) NOT NULL,
  `diagnosis_code_method` varchar(10) DEFAULT NULL,
  `diagnosis_code` varchar(60) DEFAULT NULL,
  `diagnosis_code_description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKscasefilediagnosis_casefile` (`casefile_id`),
  CONSTRAINT `FKscasefilediagnosis_casefile` FOREIGN KEY (`casefile_id`) REFERENCES `casefile` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=244598 DEFAULT CHARSET=latin1;;
/*!40101 SET character_set_client = @saved_cs_client */;;
/*!40101 SET @saved_cs_client     = @@character_set_client */;;
/*!40101 SET character_set_client = utf8 */;;
CREATE TABLE `casefile_insurance` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `casefile_id` bigint(20) NOT NULL,
  `set_id` int(1) NOT NULL,
  `plan_id` varchar(255) DEFAULT NULL,
  `company_id` varchar(255) DEFAULT NULL,
  `company_name` varchar(255) DEFAULT NULL,
  `insurance_address_id` bigint(20) DEFAULT NULL,
  `group_number` varchar(255) DEFAULT NULL,
  `group_name` varchar(255) DEFAULT NULL,
  `plan_effective_date` datetime DEFAULT NULL,
  `insured_first_name` varchar(255) DEFAULT NULL,
  `insured_last_name` varchar(255) DEFAULT NULL,
  `insured_middle_name` varchar(255) DEFAULT NULL,
  `insured_relationship` varchar(255) DEFAULT NULL,
  `insured_address_id` bigint(20) DEFAULT NULL,
  `policy_number` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKcasefileinsurance_casefile` (`casefile_id`),
  KEY `FKcasefileinsurance_contactinfo1` (`insurance_address_id`),
  KEY `FKcasefileinsurance_contactinfo2` (`insured_address_id`),
  CONSTRAINT `FKcasefileinsurance_casefile` FOREIGN KEY (`casefile_id`) REFERENCES `casefile` (`id`),
  CONSTRAINT `FKcasefileinsurance_contactinfo1` FOREIGN KEY (`insurance_address_id`) REFERENCES `contactinfo` (`id`),
  CONSTRAINT `FKcasefileinsurance_contactinfo2` FOREIGN KEY (`insured_address_id`) REFERENCES `contactinfo` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=146759 DEFAULT CHARSET=latin1;;
/*!40101 SET character_set_client = @saved_cs_client */;;
/*!40101 SET @saved_cs_client     = @@character_set_client */;;
/*!40101 SET character_set_client = utf8 */;;
CREATE TABLE `casefile_insurance_authorize` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `caseFileId` bigint(20) DEFAULT NULL,
  `statusCode` varchar(255) DEFAULT NULL,
  `referenceCode` varchar(255) DEFAULT NULL,
  `deleted` bit(1) DEFAULT b'0',
  `submissionDate` datetime DEFAULT NULL,
  `authorizationId` varchar(255) DEFAULT NULL,
  `creationtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `FKCIACASEID_idx` (`caseFileId`),
  CONSTRAINT `FKCIACASEID` FOREIGN KEY (`caseFileId`) REFERENCES `casefile` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17392 DEFAULT CHARSET=latin1;;
/*!40101 SET character_set_client = @saved_cs_client */;;
/*!40101 SET @saved_cs_client     = @@character_set_client */;;
/*!40101 SET character_set_client = utf8 */;;
CREATE TABLE `casefile_note` (
  `CaseFile_id` bigint(20) NOT NULL,
  `notes_id` bigint(20) NOT NULL,
  UNIQUE KEY `notes_id` (`notes_id`),
  UNIQUE KEY `UK_ac6d0553e6c74512a9b80aa2b45` (`notes_id`),
  KEY `FKC33C5F85CB9103C3` (`CaseFile_id`),
  KEY `FKC33C5F85BC19A742` (`notes_id`),
  CONSTRAINT `FKC33C5F85BC19A742` FOREIGN KEY (`notes_id`) REFERENCES `note` (`id`),
  CONSTRAINT `FKC33C5F85CB9103C3` FOREIGN KEY (`CaseFile_id`) REFERENCES `casefile` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;;
/*!40101 SET character_set_client = @saved_cs_client */;;
/*!40101 SET @saved_cs_client     = @@character_set_client */;;
/*!40101 SET character_set_client = utf8 */;;
CREATE TABLE `casefile_panel` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `casefile_id` bigint(20) DEFAULT NULL,
  `panel_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK1CFPCASEFILEID_idx` (`casefile_id`),
  KEY `FK1CFPPANELID_idx` (`panel_id`),
  CONSTRAINT `FK1CFPCASEFILEID` FOREIGN KEY (`casefile_id`) REFERENCES `casefile` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK1CFPPANELID` FOREIGN KEY (`panel_id`) REFERENCES `horizonpanel` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=242124 DEFAULT CHARSET=latin1;;
/*!40101 SET character_set_client = @saved_cs_client */;;
/*!40101 SET @saved_cs_client     = @@character_set_client */;;
/*!40101 SET character_set_client = utf8 */;;
CREATE TABLE `casefile_referralreason` (
  `CaseFile_id` bigint(20) NOT NULL,
  `referralreasons_id` bigint(20) NOT NULL,
  PRIMARY KEY (`CaseFile_id`,`referralreasons_id`),
  KEY `FKFA4FA414CB9103C3` (`CaseFile_id`),
  KEY `FK68234C14EE270D82` (`referralreasons_id`),
  CONSTRAINT `casefile_referralreason_ibfk_1` FOREIGN KEY (`referralreasons_id`) REFERENCES `reasoncode` (`id`),
  CONSTRAINT `FKFA4FA414CB9103C3` FOREIGN KEY (`CaseFile_id`) REFERENCES `casefile` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;;
/*!40101 SET character_set_client = @saved_cs_client */;;
/*!40101 SET @saved_cs_client     = @@character_set_client */;;
/*!40101 SET character_set_client = utf8 */;;
CREATE TABLE `casefile_reportshipmentrecord` (
  `CaseFile_id` bigint(20) NOT NULL,
  `gcreportshipmentrecords_id` bigint(20) NOT NULL,
  UNIQUE KEY `gcreportshipmentrecords_id` (`gcreportshipmentrecords_id`),
  UNIQUE KEY `UK_b08d21fd700c4905b5b0a266565` (`gcreportshipmentrecords_id`),
  KEY `FKAC8CCE72CB9103C3` (`CaseFile_id`),
  KEY `FKAC8CCE7294465CCD` (`gcreportshipmentrecords_id`),
  CONSTRAINT `FKAC8CCE7294465CCD` FOREIGN KEY (`gcreportshipmentrecords_id`) REFERENCES `reportshipmentrecord` (`id`),
  CONSTRAINT `FKAC8CCE72CB9103C3` FOREIGN KEY (`CaseFile_id`) REFERENCES `casefile` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;;
/*!40101 SET character_set_client = @saved_cs_client */;;
/*!40101 SET @saved_cs_client     = @@character_set_client */;;
/*!40101 SET character_set_client = utf8 */;;
CREATE TABLE `casefile_task` (
  `CaseFile_id` bigint(20) NOT NULL,
  `tasks_id` bigint(20) NOT NULL,
  UNIQUE KEY `tasks_id` (`tasks_id`),
  UNIQUE KEY `UK_644eb3b889f04460b3e3f4b8e2e` (`tasks_id`),
  KEY `FKC33EE518456BB0E8` (`tasks_id`),
  KEY `FKC33EE518CB9103C3` (`CaseFile_id`),
  CONSTRAINT `FKC33EE518456BB0E8` FOREIGN KEY (`tasks_id`) REFERENCES `task` (`id`),
  CONSTRAINT `FKC33EE518CB9103C3` FOREIGN KEY (`CaseFile_id`) REFERENCES `casefile` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;;
/*!40101 SET character_set_client = @saved_cs_client */;;
SET @saved_cs_client     = @@character_set_client;;
SET character_set_client = utf8;;
/*!50001 CREATE TABLE `casefile_territory` (
  `casefile_id` tinyint NOT NULL,
  `territory_id` tinyint NOT NULL,
  `satellite_override` tinyint NOT NULL
) ENGINE=MyISAM */;;
SET character_set_client = @saved_cs_client;;
/*!40101 SET @saved_cs_client     = @@character_set_client */;;
/*!40101 SET character_set_client = utf8 */;;
CREATE TABLE `category` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `deleted` bit(1) NOT NULL DEFAULT b'0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=292 DEFAULT CHARSET=latin1;;
/*!40101 SET character_set_client = @saved_cs_client */;;
/*!40101 SET @saved_cs_client     = @@character_set_client */;;
/*!40101 SET character_set_client = utf8 */;;
CREATE TABLE `categorygroup` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `fordisplay` bit(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=latin1;;
/*!40101 SET character_set_client = @saved_cs_client */;;
/*!40101 SET @saved_cs_client     = @@character_set_client */;;
/*!40101 SET character_set_client = utf8 */;;
CREATE TABLE `categorygroup_category` (
  `categorygroup_id` bigint(20) NOT NULL,
  `category_id` bigint(20) NOT NULL,
  PRIMARY KEY (`categorygroup_id`,`category_id`),
  KEY `FK42E7FF3CA11A5663` (`category_id`),
  KEY `FK42E7FF3CA1851A31` (`categorygroup_id`),
  CONSTRAINT `FK42E7FF3CA11A5663` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`),
  CONSTRAINT `FK42E7FF3CA1851A31` FOREIGN KEY (`categorygroup_id`) REFERENCES `categorygroup` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;;
/*!40101 SET character_set_client = @saved_cs_client */;;
/*!40101 SET @saved_cs_client     = @@character_set_client */;;
/*!40101 SET character_set_client = utf8 */;;
CREATE TABLE `cellline` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `familyid` varchar(255) DEFAULT NULL,
  `relationship` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;;
/*!40101 SET character_set_client = @saved_cs_client */;;
/*!40101 SET @saved_cs_client     = @@character_set_client */;;
/*!40101 SET character_set_client = utf8 */;;
CREATE TABLE `clarity_etl_run` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `etl_time` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9224 DEFAULT CHARSET=latin1;;
/*!40101 SET character_set_client = @saved_cs_client */;;
/*!40101 SET @saved_cs_client     = @@character_set_client */;;
/*!40101 SET character_set_client = utf8 */;;
CREATE TABLE `clinicalhistoryform` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `created` datetime DEFAULT NULL,
  `discussionwithpartnerpermitted` bit(1) NOT NULL,
  `feedbackpermitted` bit(1) DEFAULT NULL,
  `gravida` varchar(255) DEFAULT NULL,
  `note` text,
  `para` varchar(255) DEFAULT NULL,
  `sabs` bigint(20) DEFAULT NULL,
  `sbs` bigint(20) DEFAULT NULL,
  `successfulpregnancies` bigint(20) DEFAULT NULL,
  `unsuccessfulpregnancies` bigint(20) DEFAULT NULL,
  `original_id` bigint(20) DEFAULT NULL,
  `createdby_id` bigint(20) DEFAULT NULL,
  `outcomedata_chemicalpregnancy` bit(1) DEFAULT NULL,
  `outcomedata_numberofeuploidembryos` int(10) DEFAULT NULL,
  `outcomedata_fetalheartbeat` bit(1) DEFAULT NULL,
  `outcomedata_livebirths` int(11) DEFAULT NULL,
  `outcomedata_numberofnoresultembryos` int(10) DEFAULT NULL,
  `outcomedata_numberofrankedembryos` int(10) DEFAULT NULL,
  `outcomedata_sab` bit(1) DEFAULT NULL,
  `lastmodified` datetime DEFAULT NULL,
  `lastmodifiedby_id` bigint(20) DEFAULT NULL,
  `outcomedata_notpregnant` bit(1) DEFAULT NULL,
  `outcomedata_numberoffetalheartbeats` int(11) DEFAULT NULL,
  `outcomedata_euploidembryostransferred` varchar(1024) DEFAULT NULL,
  `outcomedata_noresultembryostransferred` varchar(1024) DEFAULT NULL,
  `outcomedata_rankedembryostransferred` varchar(1024) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKE35CA45D562C7DD` (`createdby_id`),
  KEY `FKE35CA454B3ADFA9` (`original_id`),
  KEY `FKE35CA4510CC59C6` (`lastmodifiedby_id`),
  CONSTRAINT `FKE35CA4510CC59C6` FOREIGN KEY (`lastmodifiedby_id`) REFERENCES `user` (`id`),
  CONSTRAINT `FKE35CA454B3ADFA9` FOREIGN KEY (`original_id`) REFERENCES `documentinfo` (`id`),
  CONSTRAINT `FKE35CA45D562C7DD` FOREIGN KEY (`createdby_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=967163 DEFAULT CHARSET=latin1;;
/*!40101 SET character_set_client = @saved_cs_client */;;
SET @saved_cs_client     = @@character_set_client;;
SET character_set_client = utf8;;
/*!50001 CREATE TABLE `clinicinforeport` (
  `id` tinyint NOT NULL,
  `name` tinyint NOT NULL,
  `street1` tinyint NOT NULL,
  `street2` tinyint NOT NULL,
  `city` tinyint NOT NULL,
  `state` tinyint NOT NULL,
  `postcode` tinyint NOT NULL,
  `country` tinyint NOT NULL,
  `phonenumber` tinyint NOT NULL,
  `emergencycontactinformationnotes` tinyint NOT NULL,
  `territory id` tinyint NOT NULL,
  `territory name` tinyint NOT NULL,
  `director cfs id` tinyint NOT NULL,
  `director cfs email` tinyint NOT NULL
) ENGINE=MyISAM */;;
SET character_set_client = @saved_cs_client;;
/*!40101 SET @saved_cs_client     = @@character_set_client */;;
/*!40101 SET character_set_client = utf8 */;;
CREATE TABLE `cloudpanoramareport` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `lisReference` varchar(255) DEFAULT NULL,
  `testreport_reportdate` datetime DEFAULT NULL,
  `testreport_fetalfraction` double DEFAULT NULL,
  `testreport_fetusgender` varchar(255) DEFAULT NULL,
  `testreport_result` varchar(255) DEFAULT NULL,
  `testreport_resultmessage` varchar(255) DEFAULT NULL,
  `testreport_note` varchar(255) DEFAULT NULL,
  `testreport_trisomy13_risk` varchar(255) DEFAULT NULL,
  `testreport_trisomy13_agebasedriskscore` double DEFAULT NULL,
  `testreport_trisomy13_panoramariskscore` double DEFAULT NULL,
  `testreport_trisomy18_risk` varchar(255) DEFAULT NULL,
  `testreport_trisomy18_agebasedriskscore` double DEFAULT NULL,
  `testreport_trisomy18_panoramariskscore` double DEFAULT NULL,
  `testreport_trisomy21_risk` varchar(255) DEFAULT NULL,
  `testreport_trisomy21_agebasedriskscore` double DEFAULT NULL,
  `testreport_trisomy21_panoramariskscore` double DEFAULT NULL,
  `testreport_monosomyx_risk` varchar(255) DEFAULT NULL,
  `testreport_monosomyx_agebasedriskscore` double DEFAULT NULL,
  `testreport_monosomyx_panoramariskscore` double DEFAULT NULL,
  `testreport_digeorge_result` varchar(255) DEFAULT NULL,
  `testreport_digeorge_microdeletionScore` double DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=469110 DEFAULT CHARSET=latin1;;
/*!40101 SET character_set_client = @saved_cs_client */;;
/*!40101 SET @saved_cs_client     = @@character_set_client */;;
/*!40101 SET character_set_client = utf8 */;;
CREATE TABLE `cloudproject` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `apitoken` varchar(255) DEFAULT NULL,
  `projectId` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=latin1;;
/*!40101 SET character_set_client = @saved_cs_client */;;
/*!40101 SET @saved_cs_client     = @@character_set_client */;;
/*!40101 SET character_set_client = utf8 */;;
CREATE TABLE `cncreportshipmentrecord` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `published` bit(1) NOT NULL,
  `senton` datetime DEFAULT NULL,
  `sentto` varchar(1024) DEFAULT NULL,
  `jobdir` varchar(255) DEFAULT NULL,
  `amended` bit(1) NOT NULL DEFAULT b'0',
  `report_id` bigint(20) DEFAULT NULL,
  `paternity_report_id` bigint(20) DEFAULT NULL,
  `reviewed` bit(1) NOT NULL DEFAULT b'0',
  `defunct` bit(1) NOT NULL DEFAULT b'0',
  `partial` bit(1) NOT NULL DEFAULT b'0',
  `sentby` varchar(1024) DEFAULT NULL,
  `npt_report_id` bigint(20) DEFAULT NULL,
  `cs_report_id` bigint(20) DEFAULT NULL,
  `horizon_report_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK48BF1237CA97B517` (`report_id`),
  KEY `FK48BF1237EDEBAECF` (`paternity_report_id`),
  KEY `fk_cncrsr_npt_report_id` (`npt_report_id`),
  KEY `FK48BF1237BA867FB1` (`cs_report_id`),
  KEY `FK48BF1237E5EC9B16` (`horizon_report_id`),
  KEY `FK_b73f16e4c9ce4b39941b6df1547` (`paternity_report_id`),
  KEY `FK_c427acdccdd0447cb6bda44e47a` (`report_id`),
  CONSTRAINT `FK48BF1237BA867FB1` FOREIGN KEY (`cs_report_id`) REFERENCES `cs_report` (`id`),
  CONSTRAINT `FK48BF1237E5EC9B16` FOREIGN KEY (`horizon_report_id`) REFERENCES `horizon_report` (`id`),
  CONSTRAINT `FK_b73f16e4c9ce4b39941b6df1547` FOREIGN KEY (`paternity_report_id`) REFERENCES `paternity_report` (`id`),
  CONSTRAINT `FK_c427acdccdd0447cb6bda44e47a` FOREIGN KEY (`report_id`) REFERENCES `report_report` (`id`),
  CONSTRAINT `fk_cncrsr_npt_report_id` FOREIGN KEY (`npt_report_id`) REFERENCES `npt_report` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2294478 DEFAULT CHARSET=latin1;;
/*!40101 SET character_set_client = @saved_cs_client */;;
/*!40101 SET @saved_cs_client     = @@character_set_client */;;
/*!40101 SET character_set_client = utf8 */;;
CREATE TABLE `cncreportshipmentrecord_documentinfo` (
  `CNCReportShipmentRecord_id` bigint(20) NOT NULL,
  `documentinfos_id` bigint(20) NOT NULL,
  KEY `FK790AE19187E23190` (`documentinfos_id`),
  KEY `FK790AE191C586C5AE` (`CNCReportShipmentRecord_id`),
  CONSTRAINT `FK790AE19187E23190` FOREIGN KEY (`documentinfos_id`) REFERENCES `documentinfo` (`id`),
  CONSTRAINT `FK790AE191C586C5AE` FOREIGN KEY (`CNCReportShipmentRecord_id`) REFERENCES `cncreportshipmentrecord` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;;
/*!40101 SET character_set_client = @saved_cs_client */;;
/*!40101 SET @saved_cs_client     = @@character_set_client */;;
/*!40101 SET character_set_client = utf8 */;;
CREATE TABLE `consolidationplate` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `barcode` varchar(255) NOT NULL,
  `state` varchar(255) DEFAULT NULL,
  `cleanupthemda_qiampkitbarcode` varchar(255) DEFAULT NULL,
  `mastermix` varchar(255) DEFAULT NULL,
  `dilutionstate` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `barcode` (`barcode`),
  KEY `consolidationBarcode_IDX` (`barcode`)
) ENGINE=InnoDB AUTO_INCREMENT=12676 DEFAULT CHARSET=latin1;;
/*!40101 SET character_set_client = @saved_cs_client */;;
/*!40101 SET @saved_cs_client     = @@character_set_client */;;
/*!40101 SET character_set_client = utf8 */;;
CREATE TABLE `consolidationplate_inventorieditem` (
  `ConsolidationPlate_id` bigint(20) NOT NULL,
  `reagents_id` bigint(20) NOT NULL,
  PRIMARY KEY (`ConsolidationPlate_id`,`reagents_id`),
  KEY `FKBC1E12A9E71F8F2B` (`reagents_id`),
  KEY `FKBC1E12A9C592AEFA` (`ConsolidationPlate_id`),
  CONSTRAINT `FKBC1E12A9C592AEFA` FOREIGN KEY (`ConsolidationPlate_id`) REFERENCES `consolidationplate` (`id`),
  CONSTRAINT `FKBC1E12A9E71F8F2B` FOREIGN KEY (`reagents_id`) REFERENCES `inventorieditem` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;;
/*!40101 SET character_set_client = @saved_cs_client */;;
/*!40101 SET @saved_cs_client     = @@character_set_client */;;
/*!40101 SET character_set_client = utf8 */;;
CREATE TABLE `consolidationplate_sample` (
  `consolidationplates_id` bigint(20) NOT NULL,
  `samplelist_id` bigint(20) NOT NULL,
  `idx` int(11) NOT NULL,
  PRIMARY KEY (`consolidationplates_id`,`idx`),
  KEY `FKB35EDF3FBA3311BB` (`consolidationplates_id`),
  KEY `FKB35EDF3F7AEFF4C5` (`samplelist_id`),
  CONSTRAINT `FKB35EDF3F7AEFF4C5` FOREIGN KEY (`samplelist_id`) REFERENCES `sample` (`id`),
  CONSTRAINT `FKB35EDF3FBA3311BB` FOREIGN KEY (`consolidationplates_id`) REFERENCES `consolidationplate` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;;
/*!40101 SET character_set_client = @saved_cs_client */;;
/*!40101 SET @saved_cs_client     = @@character_set_client */;;
/*!40101 SET character_set_client = utf8 */;;
CREATE TABLE `consolidationplate_source_samplelist` (
  `ConsolidationPlate_id` bigint(20) NOT NULL,
  `sourcewells_id` bigint(20) NOT NULL,
  `idx` int(11) NOT NULL,
  PRIMARY KEY (`ConsolidationPlate_id`,`idx`),
  KEY `FK7C563F777740DB90` (`sourcewells_id`),
  KEY `FK7C563F7742B86F0` (`ConsolidationPlate_id`),
  CONSTRAINT `FK7C563F7742B86F0` FOREIGN KEY (`ConsolidationPlate_id`) REFERENCES `consolidationplate` (`id`),
  CONSTRAINT `FK7C563F777740DB90` FOREIGN KEY (`sourcewells_id`) REFERENCES `sample` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;;
/*!40101 SET character_set_client = @saved_cs_client */;;
/*!40101 SET @saved_cs_client     = @@character_set_client */;;
/*!40101 SET character_set_client = utf8 */;;
CREATE TABLE `constellationarchivejob` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `DTYPE` varchar(255) NOT NULL,
  `apitoken` varchar(255) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `jobid` varchar(255) DEFAULT NULL,
  `starttime` datetime DEFAULT NULL,
  `completetime` datetime DEFAULT NULL,
  `archivaltime` datetime DEFAULT NULL,
  `status` varchar(255) NOT NULL DEFAULT 'CREATED',
  `resultcode` int(11) DEFAULT NULL,
  `resultmessage` longtext,
  `manifest` longtext,
  `sequencinginitfile_id` bigint(20) DEFAULT NULL,
  `npthandcallresult_id` bigint(20) DEFAULT NULL,
  `sequencingrun_id` bigint(20) DEFAULT NULL,
  `sequencingsample_id` bigint(20) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `partial` bit(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `sequencinginitfile_id` (`sequencinginitfile_id`),
  KEY `npthandcallresult_id` (`npthandcallresult_id`),
  KEY `sequencingrun_id` (`sequencingrun_id`),
  KEY `sequencingsample_id` (`sequencingsample_id`),
  CONSTRAINT `constellationarchivejob_ibfk_1` FOREIGN KEY (`sequencinginitfile_id`) REFERENCES `alg_sequencinginitfile` (`id`) ON DELETE SET NULL ON UPDATE SET NULL,
  CONSTRAINT `constellationarchivejob_ibfk_2` FOREIGN KEY (`npthandcallresult_id`) REFERENCES `npt_handcall_result` (`id`) ON DELETE SET NULL ON UPDATE SET NULL,
  CONSTRAINT `constellationarchivejob_ibfk_3` FOREIGN KEY (`sequencingrun_id`) REFERENCES `hts`.`sequencingrun` (`id`) ON DELETE SET NULL ON UPDATE SET NULL,
  CONSTRAINT `constellationarchivejob_ibfk_4` FOREIGN KEY (`sequencingsample_id`) REFERENCES `hts`.`sequencingsample` (`id`) ON DELETE SET NULL ON UPDATE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=1262310 DEFAULT CHARSET=latin1;;
/*!40101 SET character_set_client = @saved_cs_client */;;
/*!40101 SET @saved_cs_client     = @@character_set_client */;;
/*!40101 SET character_set_client = utf8 */;;
CREATE TABLE `constellationjob` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `DTYPE` varchar(255) NOT NULL,
  `apitoken` varchar(255) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `jobid` varchar(255) DEFAULT NULL,
  `starttime` datetime DEFAULT NULL,
  `completetime` datetime DEFAULT NULL,
  `archivaltime` datetime DEFAULT NULL,
  `status` varchar(255) NOT NULL DEFAULT 'CREATED',
  `resultcode` int(11) DEFAULT NULL,
  `resultmessage` longtext,
  `manifest` longtext,
  `sequencinginitfile_id` bigint(20) DEFAULT NULL,
  `npthandcallresult_id` bigint(20) DEFAULT NULL,
  `sequencingrun_id` bigint(20) DEFAULT NULL,
  `sequencingsample_id` bigint(20) DEFAULT NULL,
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `partial` bit(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `sequencinginitfile_id` (`sequencinginitfile_id`),
  KEY `npthandcallresult_id` (`npthandcallresult_id`),
  KEY `sequencingrun_id` (`sequencingrun_id`),
  KEY `sequencingsample_id` (`sequencingsample_id`),
  CONSTRAINT `constellationjob_ibfk_1` FOREIGN KEY (`sequencinginitfile_id`) REFERENCES `alg_sequencinginitfile` (`id`) ON DELETE SET NULL ON UPDATE SET NULL,
  CONSTRAINT `constellationjob_ibfk_2` FOREIGN KEY (`npthandcallresult_id`) REFERENCES `npt_handcall_result` (`id`) ON DELETE SET NULL ON UPDATE SET NULL,
  CONSTRAINT `constellationjob_ibfk_3` FOREIGN KEY (`sequencingrun_id`) REFERENCES `hts`.`sequencingrun` (`id`) ON DELETE SET NULL ON UPDATE SET NULL,
  CONSTRAINT `constellationjob_ibfk_4` FOREIGN KEY (`sequencingsample_id`) REFERENCES `hts`.`sequencingsample` (`id`) ON DELETE SET NULL ON UPDATE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;;
/*!40101 SET character_set_client = @saved_cs_client */;;
/*!40101 SET @saved_cs_client     = @@character_set_client */;;
/*!40101 SET character_set_client = utf8 */;;
CREATE TABLE `contactinfo` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `biopsiesperformedhere` bit(1) DEFAULT NULL,
  `blastomerecollectionkitstowhom` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `deleted` bit(1) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `emergencycontactinformationnotes` text,
  `fax` varchar(255) DEFAULT NULL,
  `officehours` text,
  `phonenumber` varchar(255) DEFAULT NULL,
  `postcode` varchar(255) DEFAULT NULL,
  `primarycontact` varchar(255) DEFAULT NULL,
  `secondphonenumber` varchar(255) DEFAULT NULL,
  `state` varchar(255) DEFAULT NULL,
  `street1` varchar(255) DEFAULT NULL,
  `street2` varchar(255) DEFAULT NULL,
  `country` varchar(255) DEFAULT NULL,
  `micontact` varchar(255) DEFAULT NULL,
  `miphonenumber` varchar(255) DEFAULT NULL,
  `miemail` varchar(255) DEFAULT NULL,
  `billingcontact` varchar(255) DEFAULT NULL,
  `billingphonenumber` varchar(255) DEFAULT NULL,
  `billingemail` varchar(255) DEFAULT NULL,
  `receiveEmails` bit(1) NOT NULL DEFAULT b'0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1024785 DEFAULT CHARSET=latin1;;
/*!40101 SET character_set_client = @saved_cs_client */;;
/*!40101 SET @saved_cs_client     = @@character_set_client */;;
/*!40101 SET character_set_client = utf8 */;;
CREATE TABLE `contactinfo_deliverydestination` (
  `ContactInfo_id` bigint(20) NOT NULL,
  `deliverydestinations_id` bigint(20) NOT NULL,
  UNIQUE KEY `deliverydestinations_id` (`deliverydestinations_id`),
  UNIQUE KEY `UK_d76c414370194882b5b8db8c39f` (`deliverydestinations_id`),
  KEY `FKE458066923761F43` (`ContactInfo_id`),
  KEY `FKE45806697CD02DA4` (`deliverydestinations_id`),
  CONSTRAINT `FKE458066923761F43` FOREIGN KEY (`ContactInfo_id`) REFERENCES `contactinfo` (`id`),
  CONSTRAINT `FKE45806697CD02DA4` FOREIGN KEY (`deliverydestinations_id`) REFERENCES `deliverydestination` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;;
/*!40101 SET character_set_client = @saved_cs_client */;;
/*!40101 SET @saved_cs_client     = @@character_set_client */;;
/*!40101 SET character_set_client = utf8 */;;
CREATE TABLE `contactinfo_organizationterritory` (
  `contactinfo_id` bigint(20) NOT NULL,
  `organizationterritories_id` bigint(20) NOT NULL,
  `organizationTerritories_ORDER` int(11) NOT NULL,
  PRIMARY KEY (`contactinfo_id`,`organizationTerritories_ORDER`),
  UNIQUE KEY `organizationterritories_id` (`organizationterritories_id`),
  UNIQUE KEY `UK_7d562f63d4cf41b3a84866b9b19` (`organizationterritories_id`),
  KEY `FK6FC7BB5623761F43` (`contactinfo_id`),
  KEY `FK6FC7BB56A4D85D85` (`organizationterritories_id`),
  CONSTRAINT `FK6FC7BB5623761F43` FOREIGN KEY (`contactinfo_id`) REFERENCES `contactinfo` (`id`),
  CONSTRAINT `FK6FC7BB56A4D85D85` FOREIGN KEY (`organizationterritories_id`) REFERENCES `organizationterritory` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;;
/*!40101 SET character_set_client = @saved_cs_client */;;
/*!40101 SET @saved_cs_client     = @@character_set_client */;;
/*!40101 SET character_set_client = utf8 */;;
CREATE TABLE `containertype` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `displayname` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;;
/*!40101 SET character_set_client = @saved_cs_client */;;
/*!40101 SET @saved_cs_client     = @@character_set_client */;;
/*!40101 SET character_set_client = utf8 */;;
CREATE TABLE `cs_disease_result` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `diseaseid` bigint(20) NOT NULL,
  `diseasedisplayname` varchar(255) DEFAULT NULL,
  `resulttype` varchar(255) DEFAULT NULL,
  `resulttext` longtext,
  `resultnotetext` longtext,
  `ruleclass` varchar(255) DEFAULT NULL,
  `showrisktable` bit(1) DEFAULT NULL,
  `rulesenginerun_id` bigint(20) DEFAULT NULL,
  `showrisktable2` bit(1) DEFAULT b'0',
  PRIMARY KEY (`id`),
  KEY `FKB03263EFB0F2CF8C` (`rulesenginerun_id`),
  CONSTRAINT `FKB03263EFB0F2CF8C` FOREIGN KEY (`rulesenginerun_id`) REFERENCES `cs_rules_engine_run` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=353357 DEFAULT CHARSET=latin1;;
/*!40101 SET character_set_client = @saved_cs_client */;;
/*!40101 SET @saved_cs_client     = @@character_set_client */;;
/*!40101 SET character_set_client = utf8 */;;
CREATE TABLE `cs_hl7result` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `accessionId` varchar(255) NOT NULL,
  `internalDiseaseName` varchar(255) DEFAULT NULL,
  `technicalResultText` varchar(255) DEFAULT NULL,
  `technicalResult` varchar(255) DEFAULT NULL,
  `subject_id` bigint(20) DEFAULT NULL,
  `generationDate` datetime DEFAULT NULL,
  `resultdocument_id` bigint(20) DEFAULT NULL,
  `dateOfBirth` varchar(255) DEFAULT NULL,
  `patientFirstName` varchar(255) DEFAULT NULL,
  `patientLastName` varchar(255) DEFAULT NULL,
  `sendingFacility` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKCSHL7RESULTSUB` (`subject_id`),
  KEY `FKB840C48153A0998E` (`resultdocument_id`),
  CONSTRAINT `FKB840C48153A0998E` FOREIGN KEY (`resultdocument_id`) REFERENCES `documentinfo` (`id`),
  CONSTRAINT `FKCSHL7RESULTSUB` FOREIGN KEY (`subject_id`) REFERENCES `subject` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31023 DEFAULT CHARSET=latin1;;
/*!40101 SET character_set_client = @saved_cs_client */;;
/*!40101 SET @saved_cs_client     = @@character_set_client */;;
/*!40101 SET character_set_client = utf8 */;;
CREATE TABLE `cs_normalizationblock` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `barcode` varchar(255) NOT NULL,
  `state` varchar(255) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `createdby_id` bigint(20) DEFAULT NULL,
  `experiment` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `barcode` (`barcode`),
  KEY `FKNORMBLOCKUSERFK` (`createdby_id`),
  CONSTRAINT `FKNORMBLOCKUSERFK` FOREIGN KEY (`createdby_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;;
/*!40101 SET character_set_client = @saved_cs_client */;;
/*!40101 SET @saved_cs_client     = @@character_set_client */;;
/*!40101 SET character_set_client = utf8 */;;
CREATE TABLE `cs_normalizationblock_inventorieditem` (
  `cs_normalizationblock_id` bigint(20) NOT NULL,
  `reagents_id` bigint(20) NOT NULL,
  PRIMARY KEY (`cs_normalizationblock_id`,`reagents_id`),
  KEY `FKCSNBIIREAGENT` (`reagents_id`),
  KEY `FKCSNBIINORMBLOCK` (`cs_normalizationblock_id`),
  CONSTRAINT `FKCSNBIINORMBLOCK` FOREIGN KEY (`cs_normalizationblock_id`) REFERENCES `cs_normalizationblock` (`id`),
  CONSTRAINT `FKCSNBIIREAGENT` FOREIGN KEY (`reagents_id`) REFERENCES `inventorieditem` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;;
/*!40101 SET character_set_client = @saved_cs_client */;;
/*!40101 SET @saved_cs_client     = @@character_set_client */;;
/*!40101 SET character_set_client = utf8 */;;
CREATE TABLE `cs_normalizationblock_sample` (
  `cs_normalizationblock_id` bigint(20) NOT NULL,
  `samplelist_id` bigint(20) NOT NULL,
  `idx` int(11) NOT NULL,
  PRIMARY KEY (`cs_normalizationblock_id`,`idx`),
  KEY `FKCSNBSMPNORMBLOCK` (`cs_normalizationblock_id`),
  KEY `FKCSNBSMPSAMPLE` (`samplelist_id`),
  CONSTRAINT `FKCSNBSMPNORMBLOCK` FOREIGN KEY (`cs_normalizationblock_id`) REFERENCES `cs_normalizationblock` (`id`),
  CONSTRAINT `FKCSNBSMPSAMPLE` FOREIGN KEY (`samplelist_id`) REFERENCES `sample` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;;
/*!40101 SET character_set_client = @saved_cs_client */;;
/*!40101 SET @saved_cs_client     = @@character_set_client */;;
/*!40101 SET character_set_client = utf8 */;;
CREATE TABLE `cs_plate` (
  `DTYPE` varchar(31) NOT NULL,
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `barcode` varchar(255) NOT NULL,
  `state` varchar(255) DEFAULT NULL,
  `receiveDate` datetime NOT NULL,
  `used` bit(1) NOT NULL,
  `samplelinkdate` datetime DEFAULT NULL,
  `pcrplatelinkdate` datetime DEFAULT NULL,
  `receivedBy_id` bigint(20) NOT NULL,
  `pcrplate_id` bigint(20) DEFAULT NULL,
  `platetemplate_id` bigint(20) DEFAULT NULL,
  `defunct` bit(1) NOT NULL,
  `lotnumber` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `barcode` (`barcode`),
  KEY `FK97FA3687FCD13F63` (`receivedBy_id`),
  KEY `FK97FA3687BC334188` (`pcrplate_id`),
  KEY `FK97FA3687FBEB2DEC` (`platetemplate_id`),
  CONSTRAINT `FK97FA3687BC334188` FOREIGN KEY (`pcrplate_id`) REFERENCES `cs_plate` (`id`),
  CONSTRAINT `FK97FA3687FBEB2DEC` FOREIGN KEY (`platetemplate_id`) REFERENCES `cs_platetemplate` (`id`),
  CONSTRAINT `FK97FA3687FCD13F63` FOREIGN KEY (`receivedBy_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=155050 DEFAULT CHARSET=latin1;;
/*!40101 SET character_set_client = @saved_cs_client */;;
/*!40101 SET @saved_cs_client     = @@character_set_client */;;
/*!40101 SET character_set_client = utf8 */;;
CREATE TABLE `cs_plate_cs_plate` (
  `cs_plate_id` bigint(20) NOT NULL,
  `csseqplates_id` bigint(20) NOT NULL,
  UNIQUE KEY `csseqplates_id` (`csseqplates_id`),
  UNIQUE KEY `UK_ebaf668187e04ff88a227eb0e5c` (`csseqplates_id`),
  KEY `FKAF3C993F299C84B3` (`csseqplates_id`),
  KEY `FKAF3C993F70190298` (`cs_plate_id`),
  CONSTRAINT `FKAF3C993F299C84B3` FOREIGN KEY (`csseqplates_id`) REFERENCES `cs_plate` (`id`),
  CONSTRAINT `FKAF3C993F70190298` FOREIGN KEY (`cs_plate_id`) REFERENCES `cs_plate` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;;
/*!40101 SET character_set_client = @saved_cs_client */;;
/*!40101 SET @saved_cs_client     = @@character_set_client */;;
/*!40101 SET character_set_client = utf8 */;;
CREATE TABLE `cs_plate_csreaction` (
  `cs_plate_id` bigint(20) NOT NULL,
  `wells_id` bigint(20) NOT NULL,
  `position` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`cs_plate_id`,`position`),
  KEY `FK21C26B7152B08B0A` (`cs_plate_id`),
  KEY `FK21C26B71817AD3AC` (`wells_id`),
  CONSTRAINT `FK21C26B7152B08B0A` FOREIGN KEY (`cs_plate_id`) REFERENCES `cs_plate` (`id`),
  CONSTRAINT `FK21C26B71817AD3AC` FOREIGN KEY (`wells_id`) REFERENCES `csreaction` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;;
/*!40101 SET character_set_client = @saved_cs_client */;;
/*!40101 SET @saved_cs_client     = @@character_set_client */;;
/*!40101 SET character_set_client = utf8 */;;
CREATE TABLE `cs_plate_inventorieditem` (
  `cs_plate_id` bigint(20) NOT NULL,
  `reagents_id` bigint(20) NOT NULL,
  PRIMARY KEY (`cs_plate_id`,`reagents_id`),
  KEY `FKB9C6DAC6E71F8F2B` (`reagents_id`),
  KEY `FKB9C6DAC652B08B0A` (`cs_plate_id`),
  CONSTRAINT `FKB9C6DAC652B08B0A` FOREIGN KEY (`cs_plate_id`) REFERENCES `cs_plate` (`id`),
  CONSTRAINT `FKB9C6DAC6E71F8F2B` FOREIGN KEY (`reagents_id`) REFERENCES `inventorieditem` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;;
/*!40101 SET character_set_client = @saved_cs_client */;;
/*!40101 SET @saved_cs_client     = @@character_set_client */;;
/*!40101 SET character_set_client = utf8 */;;
CREATE TABLE `cs_platetemplate` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `barcode` varchar(255) NOT NULL,
  `state` varchar(255) DEFAULT NULL,
  `version` varchar(255) NOT NULL,
  `groupkey` varchar(255) NOT NULL,
  `type` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `barcode` (`barcode`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;;
/*!40101 SET character_set_client = @saved_cs_client */;;
/*!40101 SET @saved_cs_client     = @@character_set_client */;;
/*!40101 SET character_set_client = utf8 */;;
CREATE TABLE `cs_platetemplate_cs_templateprimer` (
  `cs_platetemplate_id` bigint(20) NOT NULL,
  `wells_id` bigint(20) NOT NULL,
  `position` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`cs_platetemplate_id`,`position`),
  KEY `FKFF44E475C160F1DB` (`cs_platetemplate_id`),
  KEY `FKFF44E475291659F0` (`wells_id`),
  CONSTRAINT `FKFF44E475291659F0` FOREIGN KEY (`wells_id`) REFERENCES `cs_templateprimer` (`id`),
  CONSTRAINT `FKFF44E475C160F1DB` FOREIGN KEY (`cs_platetemplate_id`) REFERENCES `cs_platetemplate` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;;
/*!40101 SET character_set_client = @saved_cs_client */;;
/*!40101 SET @saved_cs_client     = @@character_set_client */;;
/*!40101 SET character_set_client = utf8 */;;
CREATE TABLE `cs_received_disease_result` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `cshl7result_id` bigint(20) DEFAULT NULL,
  `diseaseresulttype` varchar(255) DEFAULT NULL,
  `internaldiseasename` varchar(255) DEFAULT NULL,
  `technicalresulttext` longtext,
  PRIMARY KEY (`id`),
  KEY `FKC45978FF6E34548` (`cshl7result_id`),
  CONSTRAINT `FKC45978FF6E34548` FOREIGN KEY (`cshl7result_id`) REFERENCES `cs_hl7result` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8511 DEFAULT CHARSET=latin1;;
/*!40101 SET character_set_client = @saved_cs_client */;;
/*!40101 SET @saved_cs_client     = @@character_set_client */;;
/*!40101 SET character_set_client = utf8 */;;
CREATE TABLE `cs_report` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `case_id` varchar(255) DEFAULT NULL,
  `published` varchar(255) DEFAULT NULL,
  `amends_previous` bit(1) NOT NULL DEFAULT b'0',
  `patient_name` varchar(255) DEFAULT NULL,
  `patient_ethnicities` varchar(255) DEFAULT NULL,
  `patient_dob` varchar(255) DEFAULT NULL,
  `ordering_physician` varchar(255) DEFAULT NULL,
  `physician_id` bigint(20) DEFAULT NULL,
  `clinic_name` varchar(255) DEFAULT NULL,
  `clinic_street_1` varchar(255) DEFAULT NULL,
  `clinic_street_2` varchar(255) DEFAULT NULL,
  `clinic_city` varchar(255) DEFAULT NULL,
  `clinic_state` varchar(255) DEFAULT NULL,
  `clinic_postcode` varchar(255) DEFAULT NULL,
  `clinic_phone_number` varchar(255) DEFAULT NULL,
  `sample_barcode` varchar(255) DEFAULT NULL,
  `sample_received` varchar(255) DEFAULT NULL,
  `sample_collected` varchar(255) DEFAULT NULL,
  `4medica_id` varchar(255) DEFAULT NULL,
  `accessioning_id` varchar(255) DEFAULT NULL,
  `clinic_id` varchar(255) DEFAULT NULL,
  `hl7_accessioning_id` varchar(255) DEFAULT NULL,
  `medical_record_id` varchar(255) DEFAULT NULL,
  `patient_4medica_chart_id` varchar(255) DEFAULT NULL,
  `patient_firstname` varchar(255) DEFAULT NULL,
  `patient_gender` varchar(255) DEFAULT NULL,
  `patient_id` varchar(255) DEFAULT NULL,
  `patient_lastname` varchar(255) DEFAULT NULL,
  `report_id` varchar(255) DEFAULT NULL,
  `collection_kit` varchar(255) DEFAULT NULL,
  `newyork_case` bit(1) DEFAULT NULL,
  `patient_weight` varchar(255) DEFAULT NULL,
  `sample_has_father` bit(1) NOT NULL DEFAULT b'0',
  `sample_has_mother` bit(1) NOT NULL DEFAULT b'0',
  `third_party_draw_id_dad` varchar(255) DEFAULT NULL,
  `third_party_draw_id_mom` varchar(255) DEFAULT NULL,
  `third_party_kit_id` varchar(255) DEFAULT NULL,
  `original_kit_barcode` varchar(255) DEFAULT NULL,
  `patient_street1` varchar(255) DEFAULT NULL,
  `patient_street2` varchar(255) DEFAULT NULL,
  `patient_city` varchar(255) DEFAULT NULL,
  `patient_state` varchar(255) DEFAULT NULL,
  `patient_postcode` varchar(255) DEFAULT NULL,
  `patient_country` varchar(255) DEFAULT NULL,
  `patient_phone` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_cs_report_provider` (`physician_id`),
  CONSTRAINT `fk_cs_report_provider` FOREIGN KEY (`physician_id`) REFERENCES `provider` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=40266 DEFAULT CHARSET=latin1;;
/*!40101 SET character_set_client = @saved_cs_client */;;
/*!40101 SET @saved_cs_client     = @@character_set_client */;;
/*!40101 SET character_set_client = utf8 */;;
CREATE TABLE `cs_report_cs_rules_engine_run` (
  `cs_report_id` bigint(20) NOT NULL,
  `rulesengineruns_id` bigint(20) NOT NULL,
  KEY `FK1D4B78E924A726FB` (`cs_report_id`),
  KEY `FK1D4B78E92628A65D` (`rulesengineruns_id`),
  CONSTRAINT `FK1D4B78E924A726FB` FOREIGN KEY (`cs_report_id`) REFERENCES `cs_report` (`id`),
  CONSTRAINT `FK1D4B78E92628A65D` FOREIGN KEY (`rulesengineruns_id`) REFERENCES `cs_rules_engine_run` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;;
/*!40101 SET character_set_client = @saved_cs_client */;;
/*!40101 SET @saved_cs_client     = @@character_set_client */;;
/*!40101 SET character_set_client = utf8 */;;
CREATE TABLE `cs_report_disease_result` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `disease_name` varchar(255) DEFAULT NULL,
  `result_type` varchar(255) DEFAULT NULL,
  `result_text` longtext,
  `result_note_text` longtext,
  `risk_table_id` bigint(20) DEFAULT NULL,
  `report_id` bigint(20) DEFAULT NULL,
  `risk_table_secondary_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK34FD541CA0F6EC0A` (`report_id`),
  KEY `FK34FD541C6F3EA649` (`risk_table_id`),
  KEY `risk_table_secondary_id` (`risk_table_secondary_id`),
  CONSTRAINT `cs_report_disease_result_ibfk_1` FOREIGN KEY (`risk_table_secondary_id`) REFERENCES `cs_report_risk_table` (`id`),
  CONSTRAINT `FK34FD541C6F3EA649` FOREIGN KEY (`risk_table_id`) REFERENCES `cs_report_risk_table` (`id`),
  CONSTRAINT `FK34FD541CA0F6EC0A` FOREIGN KEY (`report_id`) REFERENCES `cs_report` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=364026 DEFAULT CHARSET=latin1;;
/*!40101 SET character_set_client = @saved_cs_client */;;
/*!40101 SET @saved_cs_client     = @@character_set_client */;;
/*!40101 SET character_set_client = utf8 */;;
CREATE TABLE `cs_report_lab_note` (
  `lab_note` longtext,
  `report_id` bigint(20) NOT NULL,
  KEY `FK54D2B040A0F6EC0A` (`report_id`),
  CONSTRAINT `FK54D2B040A0F6EC0A` FOREIGN KEY (`report_id`) REFERENCES `cs_report` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;;
/*!40101 SET character_set_client = @saved_cs_client */;;
/*!40101 SET @saved_cs_client     = @@character_set_client */;;
/*!40101 SET character_set_client = utf8 */;;
CREATE TABLE `cs_report_risk_table` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=336946 DEFAULT CHARSET=latin1;;
/*!40101 SET character_set_client = @saved_cs_client */;;
/*!40101 SET @saved_cs_client     = @@character_set_client */;;
/*!40101 SET character_set_client = utf8 */;;
CREATE TABLE `cs_report_risk_table_row` (
  `ethnicity` varchar(255) DEFAULT NULL,
  `before_risk` varchar(255) DEFAULT NULL,
  `after_risk` varchar(255) DEFAULT NULL,
  `bold` bit(1) DEFAULT NULL,
  `risk_table_id` bigint(20) NOT NULL,
  KEY `FKAD13E0556F3EA649` (`risk_table_id`),
  CONSTRAINT `FKAD13E0556F3EA649` FOREIGN KEY (`risk_table_id`) REFERENCES `cs_report_risk_table` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;;
/*!40101 SET character_set_client = @saved_cs_client */;;
/*!40101 SET @saved_cs_client     = @@character_set_client */;;
/*!40101 SET character_set_client = utf8 */;;
CREATE TABLE `cs_result_template` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `resultnotetexttemplate` text,
  `resulttexttemplate` text,
  `resulttype` varchar(255) DEFAULT NULL,
  `showrisktable` bit(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=latin1;;
/*!40101 SET character_set_client = @saved_cs_client */;;
/*!40101 SET @saved_cs_client     = @@character_set_client */;;
/*!40101 SET character_set_client = utf8 */;;
CREATE TABLE `cs_rules_engine_run` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `subtesttype` varchar(255) DEFAULT NULL,
  `subject_id` bigint(20) DEFAULT NULL,
  `rundate` datetime DEFAULT NULL,
  `sequencingplatesrun_id` bigint(20) DEFAULT NULL,
  `fraxsamplerun_id` bigint(20) DEFAULT NULL,
  `cshl7result_id` bigint(20) DEFAULT NULL,
  `billable` bit(1) DEFAULT b'1',
  `createdBy_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKB87A5345142D7D2E` (`subject_id`),
  KEY `FKB87A5345F9E32A5C` (`sequencingplatesrun_id`),
  KEY `FKB87A53454CE84CAD` (`fraxsamplerun_id`),
  KEY `createdBy_id` (`createdBy_id`),
  CONSTRAINT `cs_rules_engine_run_ibfk_1` FOREIGN KEY (`createdBy_id`) REFERENCES `user` (`id`),
  CONSTRAINT `FKB87A5345142D7D2E` FOREIGN KEY (`subject_id`) REFERENCES `subject` (`id`),
  CONSTRAINT `FKB87A53454CE84CAD` FOREIGN KEY (`fraxsamplerun_id`) REFERENCES `frax_sample_run` (`id`),
  CONSTRAINT `FKB87A5345F9E32A5C` FOREIGN KEY (`sequencingplatesrun_id`) REFERENCES `cs_sequencing_plate_run` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=122793 DEFAULT CHARSET=latin1;;
/*!40101 SET character_set_client = @saved_cs_client */;;
/*!40101 SET @saved_cs_client     = @@character_set_client */;;
/*!40101 SET character_set_client = utf8 */;;
CREATE TABLE `cs_sequencing_plate_run` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `forwardplate_id` bigint(20) DEFAULT NULL,
  `reverseplate_id` bigint(20) DEFAULT NULL,
  `subject_id` bigint(20) NOT NULL,
  `aggregationcallsdate` datetime DEFAULT NULL,
  `plate_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKCCC26B90142D7D2E` (`subject_id`),
  KEY `FKCCC26B902FE8D10B` (`reverseplate_id`),
  KEY `FKCCC26B9030FD7DEE` (`forwardplate_id`),
  KEY `FKCSSEQPLATERUNPLATEFKEY` (`plate_id`),
  CONSTRAINT `FKCCC26B90142D7D2E` FOREIGN KEY (`subject_id`) REFERENCES `subject` (`id`),
  CONSTRAINT `FKCCC26B902FE8D10B` FOREIGN KEY (`reverseplate_id`) REFERENCES `cs_plate` (`id`),
  CONSTRAINT `FKCCC26B9030FD7DEE` FOREIGN KEY (`forwardplate_id`) REFERENCES `cs_plate` (`id`),
  CONSTRAINT `FKCSSEQPLATERUNPLATEFKEY` FOREIGN KEY (`plate_id`) REFERENCES `cs_plate` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=144141 DEFAULT CHARSET=latin1;;
/*!40101 SET character_set_client = @saved_cs_client */;;
/*!40101 SET @saved_cs_client     = @@character_set_client */;;
/*!40101 SET character_set_client = utf8 */;;
CREATE TABLE `cs_subtesttype_category_to_enum` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category_id` bigint(20) DEFAULT NULL,
  `enum` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `cs_subtesttype_category_idx` (`category_id`),
  CONSTRAINT `cs_subtesttype_category` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;;
/*!40101 SET character_set_client = @saved_cs_client */;;
/*!40101 SET @saved_cs_client     = @@character_set_client */;;
/*!40101 SET character_set_client = utf8 */;;
CREATE TABLE `cs_templateprimer` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `isnegativecontrol` bit(1) NOT NULL,
  `ispositivecontrol` bit(1) NOT NULL,
  `fwdprimer_id` bigint(20) DEFAULT NULL,
  `primerpair_id` bigint(20) DEFAULT NULL,
  `revprimer_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKAEE49A7C3C046E0C` (`revprimer_id`),
  KEY `FKAEE49A7C1C4A9AAF` (`primerpair_id`),
  KEY `FKAEE49A7C2A9B4AFC` (`fwdprimer_id`),
  CONSTRAINT `FKAEE49A7C1C4A9AAF` FOREIGN KEY (`primerpair_id`) REFERENCES `diseaseassociations`.`primerpair` (`id`),
  CONSTRAINT `FKAEE49A7C2A9B4AFC` FOREIGN KEY (`fwdprimer_id`) REFERENCES `diseaseassociations`.`primer` (`id`),
  CONSTRAINT `FKAEE49A7C3C046E0C` FOREIGN KEY (`revprimer_id`) REFERENCES `diseaseassociations`.`primer` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1000 DEFAULT CHARSET=latin1;;
/*!40101 SET character_set_client = @saved_cs_client */;;
/*!40101 SET @saved_cs_client     = @@character_set_client */;;
/*!40101 SET character_set_client = utf8 */;;
CREATE TABLE `cs_variation_calls` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `variation_id` bigint(20) NOT NULL,
  `disease_id` bigint(20) NOT NULL,
  `forwardrawcall` varchar(255) DEFAULT NULL,
  `reverserawcall` varchar(255) DEFAULT NULL,
  `combinedcall` varchar(255) DEFAULT NULL,
  `handcall` varchar(255) DEFAULT NULL,
  `handcallcomment` varchar(255) DEFAULT NULL,
  `forwardsplitalignment_id` bigint(20) DEFAULT NULL,
  `reversesplitalignment_id` bigint(20) DEFAULT NULL,
  `seqplatesrun_id` bigint(20) NOT NULL,
  `vus` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKAD8A3EDABCCE245` (`variation_id`),
  KEY `FKAD8A3EDAF1BB764A` (`forwardsplitalignment_id`),
  KEY `FKAD8A3EDAC71914FD` (`seqplatesrun_id`),
  KEY `FKAD8A3EDA72F53CD` (`reversesplitalignment_id`),
  KEY `FKAD8A3EDA91109C65` (`disease_id`),
  CONSTRAINT `FKAD8A3EDA72F53CD` FOREIGN KEY (`reversesplitalignment_id`) REFERENCES `diseaseassociations`.`split_alignment` (`id`),
  CONSTRAINT `FKAD8A3EDA91109C65` FOREIGN KEY (`disease_id`) REFERENCES `diseaseassociations`.`disease` (`id`),
  CONSTRAINT `FKAD8A3EDABCCE245` FOREIGN KEY (`variation_id`) REFERENCES `diseaseassociations`.`variation` (`id`),
  CONSTRAINT `FKAD8A3EDAC71914FD` FOREIGN KEY (`seqplatesrun_id`) REFERENCES `cs_sequencing_plate_run` (`id`),
  CONSTRAINT `FKAD8A3EDAF1BB764A` FOREIGN KEY (`forwardsplitalignment_id`) REFERENCES `diseaseassociations`.`split_alignment` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23164857 DEFAULT CHARSET=latin1;;
/*!40101 SET character_set_client = @saved_cs_client */;;
/*!40101 SET @saved_cs_client     = @@character_set_client */;;
/*!40101 SET character_set_client = utf8 */;;
CREATE TABLE `cs_variation_well` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `variation_id` bigint(20) NOT NULL,
  `forwardwell` varchar(255) NOT NULL,
  `forwardplatetype` varchar(255) NOT NULL,
  `reversewell` varchar(255) NOT NULL,
  `reverseplatetype` varchar(255) NOT NULL,
  `groupkey` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FKE499FF29BCCE245` (`variation_id`),
  CONSTRAINT `FKE499FF29BCCE245` FOREIGN KEY (`variation_id`) REFERENCES `diseaseassociations`.`variation` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=387 DEFAULT CHARSET=latin1;;
/*!40101 SET character_set_client = @saved_cs_client */;;
/*!40101 SET @saved_cs_client     = @@character_set_client */;;
/*!40101 SET character_set_client = utf8 */;;
CREATE TABLE `cs_well_analysisprotocol` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `protocolname` varchar(255) DEFAULT NULL,
  `wellname` varchar(255) DEFAULT NULL,
  `version` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=193 DEFAULT CHARSET=latin1;;
/*!40101 SET character_set_client = @saved_cs_client */;;
SET @saved_cs_client     = @@character_set_client;;
SET character_set_client = utf8;;
/*!50001 CREATE TABLE `csfraxplatesummary` (
  `Plate Type` tinyint NOT NULL,
  `Plate Barcode` tinyint NOT NULL,
  `Plate Position` tinyint NOT NULL,
  `Plate Use Date` tinyint NOT NULL,
  `Sample Barcode` tinyint NOT NULL,
  `Root Sample Barcode` tinyint NOT NULL,
  `Root Sample Type` tinyint NOT NULL,
  `Casefile` tinyint NOT NULL,
  `Test Type` tinyint NOT NULL,
  `Root Sample Receive Date` tinyint NOT NULL,
  `Family Position` tinyint NOT NULL,
  `Territory Name` tinyint NOT NULL
) ENGINE=MyISAM */;;
SET character_set_client = @saved_cs_client;;
SET @saved_cs_client     = @@character_set_client;;
SET character_set_client = utf8;;
/*!50001 CREATE TABLE `cspcrplatesummary` (
  `Plate Barcode` tinyint NOT NULL,
  `Plate Type` tinyint NOT NULL,
  `Sample Barcode` tinyint NOT NULL,
  `Casefile` tinyint NOT NULL,
  `Test Type` tinyint NOT NULL,
  `Root Sample Barcode` tinyint NOT NULL,
  `Root Sample Type` tinyint NOT NULL,
  `Date Received` tinyint NOT NULL,
  `Earliest TAQ 2X Date` tinyint NOT NULL,
  `Earliest EXOSAP Date` tinyint NOT NULL,
  `Territory Name` tinyint NOT NULL
) ENGINE=MyISAM */;;
SET character_set_client = @saved_cs_client;;
/*!40101 SET @saved_cs_client     = @@character_set_client */;;
/*!40101 SET character_set_client = utf8 */;;
CREATE TABLE `csreaction` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `sample_id` bigint(20) DEFAULT NULL,
  `templateprimer_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKD18DD6B9D50BCD23` (`sample_id`),
  KEY `FKD18DD6B9D5B65388` (`templateprimer_id`),
  CONSTRAINT `FKD18DD6B9D50BCD23` FOREIGN KEY (`sample_id`) REFERENCES `sample` (`id`),
  CONSTRAINT `FKD18DD6B9D5B65388` FOREIGN KEY (`templateprimer_id`) REFERENCES `cs_templateprimer` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11440412 DEFAULT CHARSET=latin1;;
/*!40101 SET character_set_client = @saved_cs_client */;;
SET @saved_cs_client     = @@character_set_client;;
SET character_set_client = utf8;;
/*!50001 CREATE TABLE `csseqplatesummary` (
  `Plate Barcode` tinyint NOT NULL,
  `Sample Barcode` tinyint NOT NULL,
  `Casefile` tinyint NOT NULL,
  `Test Type` tinyint NOT NULL,
  `Root Sample Barcode` tinyint NOT NULL,
  `Root Sample Type` tinyint NOT NULL,
  `Date Received` tinyint NOT NULL,
  `Earliest BDT Date` tinyint NOT NULL,
  `Earliest CLEANSEQ Date` tinyint NOT NULL,
  `Territory Name` tinyint NOT NULL
) ENGINE=MyISAM */;;
SET character_set_client = @saved_cs_client;;
SET @saved_cs_client     = @@character_set_client;;
SET character_set_client = utf8;;
/*!50001 CREATE TABLE `current_month_scale` (
  `current_date()` tinyint NOT NULL,
  `scale` tinyint NOT NULL
) ENGINE=MyISAM */;;
SET character_set_client = @saved_cs_client;;
/*!40101 SET @saved_cs_client     = @@character_set_client */;;
/*!40101 SET character_set_client = utf8 */;;
CREATE TABLE `database_version` (
  `version` int(11) NOT NULL,
  `script_name` varchar(1000) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;;
/*!40101 SET character_set_client = @saved_cs_client */;;
/*!40101 SET @saved_cs_client     = @@character_set_client */;;
/*!40101 SET character_set_client = utf8 */;;
CREATE TABLE `databasechangelog` (
  `ID` varchar(255) NOT NULL,
  `AUTHOR` varchar(255) NOT NULL,
  `FILENAME` varchar(255) NOT NULL,
  `DATEEXECUTED` datetime NOT NULL,
  `ORDEREXECUTED` int(11) NOT NULL,
  `EXECTYPE` varchar(10) NOT NULL,
  `MD5SUM` varchar(35) DEFAULT NULL,
  `DESCRIPTION` varchar(255) DEFAULT NULL,
  `COMMENTS` varchar(255) DEFAULT NULL,
  `TAG` varchar(255) DEFAULT NULL,
  `LIQUIBASE` varchar(20) DEFAULT NULL,
  `CONTEXTS` varchar(255) DEFAULT NULL,
  `LABELS` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;;
/*!40101 SET character_set_client = @saved_cs_client */;;
/*!40101 SET @saved_cs_client     = @@character_set_client */;;
/*!40101 SET character_set_client = utf8 */;;
CREATE TABLE `databasechangeloglock` (
  `ID` int(11) NOT NULL,
  `LOCKED` bit(1) NOT NULL,
  `LOCKGRANTED` datetime DEFAULT NULL,
  `LOCKEDBY` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;;
/*!40101 SET character_set_client = @saved_cs_client */;;
/*!40101 SET @saved_cs_client     = @@character_set_client */;;
/*!40101 SET character_set_client = utf8 */;;
CREATE TABLE `deliverydestination` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `address` varchar(1024) DEFAULT NULL,
  `deliverymethod` varchar(255) DEFAULT NULL,
  `gc` bit(1) NOT NULL,
  `mi` bit(1) NOT NULL DEFAULT b'0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18721 DEFAULT CHARSET=latin1;;
/*!40101 SET character_set_client = @saved_cs_client */;;
/*!40101 SET @saved_cs_client     = @@character_set_client */;;
/*!40101 SET character_set_client = utf8 */;;
CREATE TABLE `deliverydestination_testtypes` (
  `DeliveryDestination_id` bigint(20) NOT NULL,
  `testtypes` varchar(255) DEFAULT NULL,
  KEY `FK46B8882CA2E1683` (`DeliveryDestination_id`),
  CONSTRAINT `FK46B8882CA2E1683` FOREIGN KEY (`DeliveryDestination_id`) REFERENCES `deliverydestination` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;;
/*!40101 SET character_set_client = @saved_cs_client */;;
/*!40101 SET @saved_cs_client     = @@character_set_client */;;
/*!40101 SET character_set_client = utf8 */;;
CREATE TABLE `dilutionplate` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `barcode` varchar(255) NOT NULL,
  `state` varchar(255) DEFAULT NULL,
  `experiment` varchar(255) DEFAULT NULL,
  `experimentdate` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `barcode` (`barcode`)
) ENGINE=InnoDB AUTO_INCREMENT=1284 DEFAULT CHARSET=latin1;;
/*!40101 SET character_set_client = @saved_cs_client */;;
/*!40101 SET @saved_cs_client     = @@character_set_client */;;
/*!40101 SET character_set_client = utf8 */;;
CREATE TABLE `dilutionplate_primerpair` (
  `DilutionPlate_id` bigint(20) NOT NULL,
  `primerpairs_id` bigint(20) DEFAULT NULL,
  KEY `FK9FA2AD58AC53DB7A` (`DilutionPlate_id`),
  KEY `FK9FA2AD58E2C12C56` (`primerpairs_id`),
  CONSTRAINT `FK9FA2AD58AC53DB7A` FOREIGN KEY (`DilutionPlate_id`) REFERENCES `dilutionplate` (`id`),
  CONSTRAINT `FK9FA2AD58E2C12C56` FOREIGN KEY (`primerpairs_id`) REFERENCES `diseaseassociations`.`primerpair` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;;
/*!40101 SET character_set_client = @saved_cs_client */;;
/*!40101 SET @saved_cs_client     = @@character_set_client */;;
/*!40101 SET character_set_client = utf8 */;;
CREATE TABLE `dilutionplate_sample` (
  `DilutionPlates_id` bigint(20) NOT NULL,
  `wells_id` bigint(20) NOT NULL,
  `position` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`DilutionPlates_id`,`position`) USING BTREE,
  KEY `FK50E38D3579A8EB88` (`wells_id`),
  KEY `FK50E38D35AC53DB7A` (`DilutionPlates_id`) USING BTREE,
  KEY `FK50E38D353D928B8F` (`DilutionPlates_id`),
  CONSTRAINT `FK50E38D353D928B8F` FOREIGN KEY (`DilutionPlates_id`) REFERENCES `dilutionplate` (`id`),
  CONSTRAINT `FK50E38D3579A8EB88` FOREIGN KEY (`wells_id`) REFERENCES `sample` (`id`),
  CONSTRAINT `FK50E38D35AC53DB7A` FOREIGN KEY (`DilutionPlates_id`) REFERENCES `dilutionplate` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;;
/*!40101 SET character_set_client = @saved_cs_client */;;
/*!40101 SET @saved_cs_client     = @@character_set_client */;;
/*!40101 SET character_set_client = utf8 */;;
CREATE TABLE `disease_variation` (
  `variation_id` bigint(20) NOT NULL,
  `disease_id` bigint(20) NOT NULL,
  PRIMARY KEY (`variation_id`,`disease_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;;
/*!40101 SET character_set_client = @saved_cs_client */;;
/*!40101 SET @saved_cs_client     = @@character_set_client */;;
/*!40101 SET character_set_client = utf8 */;;
CREATE TABLE `diseasecode` (
  `code` varchar(255) NOT NULL,
  `disease_id` bigint(20) DEFAULT NULL,
  `resulttexttemplatename` text,
  `diseaseresulttype` varchar(255) DEFAULT NULL,
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`),
  KEY `FK2A9C9D693BDD2456` (`disease_id`),
  CONSTRAINT `FK2A9C9D693BDD2456` FOREIGN KEY (`disease_id`) REFERENCES `diseaseassociations`.`disease` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;;
/*!40101 SET character_set_client = @saved_cs_client */;;
/*!40101 SET @saved_cs_client     = @@character_set_client */;;
/*!40101 SET character_set_client = utf8 */;;
CREATE TABLE `document` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `_key` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18840095 DEFAULT CHARSET=latin1;;
/*!40101 SET character_set_client = @saved_cs_client */;;
/*!40101 SET @saved_cs_client     = @@character_set_client */;;
/*!40101 SET character_set_client = utf8 */;;
CREATE TABLE `documentinfo` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `created` datetime DEFAULT NULL,
  `extension` varchar(255) DEFAULT NULL,
  `mimetype` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `version` bigint(20) NOT NULL,
  `document_id` bigint(20) DEFAULT NULL,
  `author_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKB1F6F8891DFF1C51` (`document_id`),
  KEY `FKB1F6F889B5C4A411` (`author_id`),
  CONSTRAINT `FKB1F6F8891DFF1C51` FOREIGN KEY (`document_id`) REFERENCES `document` (`id`),
  CONSTRAINT `FKB1F6F889B5C4A411` FOREIGN KEY (`author_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18870966 DEFAULT CHARSET=latin1;;
/*!40101 SET character_set_client = @saved_cs_client */;;
/*!40101 SET @saved_cs_client     = @@character_set_client */;;
/*!40101 SET character_set_client = utf8 */;;
CREATE TABLE `embryo_report` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `amendsprevious` tinyint(1) NOT NULL,
  `clinic_fax_number` varchar(255) DEFAULT NULL,
  `clinic_satelliteId` varchar(255) DEFAULT NULL,
  `clinic_city` varchar(255) DEFAULT NULL,
  `clinic_id` varchar(255) DEFAULT NULL,
  `clinic_name` varchar(255) DEFAULT NULL,
  `clinic_phone_number` varchar(255) DEFAULT NULL,
  `clinic_postcode` varchar(255) DEFAULT NULL,
  `clinic_state` varchar(255) DEFAULT NULL,
  `clinic_street_1` varchar(255) DEFAULT NULL,
  `clinic_street_2` varchar(255) DEFAULT NULL,
  `patient_4medica_chart_id` varchar(255) DEFAULT NULL,
  `patient_dob` varchar(255) DEFAULT NULL,
  `patient_firstname` varchar(255) DEFAULT NULL,
  `patient_gender` varchar(255) DEFAULT NULL,
  `patient_lastname` varchar(255) DEFAULT NULL,
  `patient_name` varchar(255) DEFAULT NULL,
  `patient_city` varchar(255) DEFAULT NULL,
  `patient_country` varchar(255) DEFAULT NULL,
  `patient_id` varchar(255) DEFAULT NULL,
  `patient_phone` varchar(255) DEFAULT NULL,
  `patient_postcode` varchar(255) DEFAULT NULL,
  `patient_state` varchar(255) DEFAULT NULL,
  `patient_street1` varchar(255) DEFAULT NULL,
  `patient_street2` varchar(255) DEFAULT NULL,
  `patient_weight` varchar(255) DEFAULT NULL,
  `sample_barcode` varchar(255) DEFAULT NULL,
  `sample_collected` varchar(255) DEFAULT NULL,
  `sample_received` varchar(255) DEFAULT NULL,
  `sample_has_father` tinyint(1) DEFAULT NULL,
  `sample_has_mother` tinyint(1) DEFAULT NULL,
  `4medica_id` varchar(255) DEFAULT NULL,
  `accessioning_id` varchar(255) DEFAULT NULL,
  `case_id` varchar(255) DEFAULT NULL,
  `collection_kit` varchar(255) DEFAULT NULL,
  `third_party_draw_id_dad` varchar(255) DEFAULT NULL,
  `hl7_accessioning_id` varchar(255) DEFAULT NULL,
  `medical_record_id` varchar(255) DEFAULT NULL,
  `third_party_draw_id_mom` varchar(255) DEFAULT NULL,
  `newyork_case` tinyint(1) DEFAULT NULL,
  `ordering_physician` varchar(255) DEFAULT NULL,
  `original_kit_barcode` varchar(255) DEFAULT NULL,
  `third_party_kit_id` varchar(255) DEFAULT NULL,
  `clinicalnotes` varchar(600) DEFAULT NULL,
  `published` varchar(255) DEFAULT NULL,
  `report_id` varchar(255) DEFAULT NULL,
  `physician_id` bigint(20) DEFAULT NULL,
  `result_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;;
/*!40101 SET character_set_client = @saved_cs_client */;;
/*!40101 SET @saved_cs_client     = @@character_set_client */;;
/*!40101 SET character_set_client = utf8 */;;
CREATE TABLE `extractionplate` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `barcode` varchar(255) NOT NULL,
  `state` varchar(255) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `createdby_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `barcode` (`barcode`),
  KEY `FKCEXTPLATECREATEDBY` (`createdby_id`),
  CONSTRAINT `FKCEXTPLATECREATEDBY` FOREIGN KEY (`createdby_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;;
/*!40101 SET character_set_client = @saved_cs_client */;;
/*!40101 SET @saved_cs_client     = @@character_set_client */;;
/*!40101 SET character_set_client = utf8 */;;
CREATE TABLE `extractionplate_sample` (
  `extractionplate_id` bigint(20) NOT NULL,
  `wells_id` bigint(20) NOT NULL,
  `position` int(11) NOT NULL,
  PRIMARY KEY (`extractionplate_id`,`position`),
  KEY `FKEXTPLATESMPEXTPLATEID` (`extractionplate_id`),
  KEY `FKEXTPLATESMPSMPID` (`wells_id`),
  CONSTRAINT `FKEXTPLATESMPEXTPLATEID` FOREIGN KEY (`extractionplate_id`) REFERENCES `extractionplate` (`id`),
  CONSTRAINT `FKEXTPLATESMPSMPID` FOREIGN KEY (`wells_id`) REFERENCES `sample` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;;
/*!40101 SET character_set_client = @saved_cs_client */;;
/*!40101 SET @saved_cs_client     = @@character_set_client */;;
/*!40101 SET character_set_client = utf8 */;;
CREATE TABLE `family` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `useeggdonor` bit(1) DEFAULT NULL,
  `usespermdonor` bit(1) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `useSurrogate` bit(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=967113 DEFAULT CHARSET=latin1;;
/*!40101 SET character_set_client = @saved_cs_client */;;
/*!40101 SET @saved_cs_client     = @@character_set_client */;;
/*!40101 SET character_set_client = utf8 */;;
CREATE TABLE `family_subject` (
  `families_id` bigint(20) NOT NULL,
  `members_id` bigint(20) NOT NULL,
  `familyPosition` varchar(255) NOT NULL DEFAULT '',
  `positionId` varchar(255) NOT NULL DEFAULT '',
  UNIQUE KEY `family_member` (`families_id`,`members_id`),
  KEY `FK1E821751E67BE621` (`members_id`),
  KEY `FK1E821751837D9968` (`families_id`),
  CONSTRAINT `FK1E821751837D9968` FOREIGN KEY (`families_id`) REFERENCES `family` (`id`),
  CONSTRAINT `FK1E821751E67BE621` FOREIGN KEY (`members_id`) REFERENCES `subject` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;;
/*!40101 SET character_set_client = @saved_cs_client */;;
/*!40101 SET @saved_cs_client     = @@character_set_client */;;
/*!40101 SET character_set_client = utf8 */;;
CREATE TABLE `frax_plate` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `barcode` varchar(255) NOT NULL,
  `state` varchar(255) DEFAULT NULL,
  `DTYPE` varchar(31) NOT NULL,
  `experiment` varchar(255) DEFAULT NULL,
  `experimentdate` datetime DEFAULT NULL,
  `transferredfromplate_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `barcode` (`barcode`),
  KEY `FK2C7385DAA429CC8C` (`transferredfromplate_id`),
  CONSTRAINT `FK2C7385DAA429CC8C` FOREIGN KEY (`transferredfromplate_id`) REFERENCES `frax_plate` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3027 DEFAULT CHARSET=latin1;;
/*!40101 SET character_set_client = @saved_cs_client */;;
/*!40101 SET @saved_cs_client     = @@character_set_client */;;
/*!40101 SET character_set_client = utf8 */;;
CREATE TABLE `frax_plate_inventorieditem` (
  `frax_plate_id` bigint(20) NOT NULL,
  `reagents_id` bigint(20) NOT NULL,
  PRIMARY KEY (`frax_plate_id`,`reagents_id`),
  KEY `FKCED52419E71F8F2B` (`reagents_id`),
  KEY `FKCED5241985CBB1D8` (`frax_plate_id`),
  CONSTRAINT `FKCED5241985CBB1D8` FOREIGN KEY (`frax_plate_id`) REFERENCES `frax_plate` (`id`),
  CONSTRAINT `FKCED52419E71F8F2B` FOREIGN KEY (`reagents_id`) REFERENCES `inventorieditem` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;;
/*!40101 SET character_set_client = @saved_cs_client */;;
/*!40101 SET @saved_cs_client     = @@character_set_client */;;
/*!40101 SET character_set_client = utf8 */;;
CREATE TABLE `frax_plate_sample` (
  `frax_plate_id` bigint(20) NOT NULL,
  `wells_id` bigint(20) NOT NULL,
  `position` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`frax_plate_id`,`position`),
  KEY `FK22D96FCF85CBB1D8` (`frax_plate_id`),
  KEY `FK22D96FCF79A8EB88` (`wells_id`),
  CONSTRAINT `FK22D96FCF79A8EB88` FOREIGN KEY (`wells_id`) REFERENCES `sample` (`id`),
  CONSTRAINT `FK22D96FCF85CBB1D8` FOREIGN KEY (`frax_plate_id`) REFERENCES `frax_plate` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;;
/*!40101 SET character_set_client = @saved_cs_client */;;
/*!40101 SET @saved_cs_client     = @@character_set_client */;;
/*!40101 SET character_set_client = utf8 */;;
CREATE TABLE `frax_sample_run` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `aggregatedallelecounts_a10count` double DEFAULT NULL,
  `aggregatedallelecounts_a1count` double DEFAULT NULL,
  `aggregatedallelecounts_a2count` double DEFAULT NULL,
  `aggregatedallelecounts_a3count` double DEFAULT NULL,
  `aggregatedallelecounts_a4count` double DEFAULT NULL,
  `aggregatedallelecounts_a5count` double DEFAULT NULL,
  `aggregatedallelecounts_a6count` double DEFAULT NULL,
  `aggregatedallelecounts_a7count` double DEFAULT NULL,
  `aggregatedallelecounts_a8count` double DEFAULT NULL,
  `aggregatedallelecounts_a9count` double DEFAULT NULL,
  `rawallelecounts_a10count` double DEFAULT NULL,
  `rawallelecounts_a1count` double DEFAULT NULL,
  `rawallelecounts_a2count` double DEFAULT NULL,
  `rawallelecounts_a3count` double DEFAULT NULL,
  `rawallelecounts_a4count` double DEFAULT NULL,
  `rawallelecounts_a5count` double DEFAULT NULL,
  `rawallelecounts_a6count` double DEFAULT NULL,
  `rawallelecounts_a7count` double DEFAULT NULL,
  `rawallelecounts_a8count` double DEFAULT NULL,
  `rawallelecounts_a9count` double DEFAULT NULL,
  `samplefilename` varchar(255) DEFAULT NULL,
  `fraxUpload_id` bigint(20) DEFAULT NULL,
  `prepsample_id` bigint(20) DEFAULT NULL,
  `sourcesample_id` bigint(20) DEFAULT NULL,
  `aggregatedallelecounts_aggregationerror` varchar(255) DEFAULT NULL,
  `rawallelecounts_analysiswarning` varchar(255) DEFAULT NULL,
  `subject_id` bigint(20) DEFAULT NULL,
  `resolvedallelecall_a1count` double DEFAULT NULL,
  `resolvedallelecall_a2count` double DEFAULT NULL,
  `resolvedallelecall_vus` bit(1) DEFAULT NULL,
  `note` varchar(255) DEFAULT NULL,
  `holdresult` bit(1) DEFAULT NULL,
  `rawpeakheights_a1peakheight` double DEFAULT NULL,
  `rawpeakheights_a2peakheight` double DEFAULT NULL,
  `rawpeakheights_a3peakheight` double DEFAULT NULL,
  `rawpeakheights_a4peakheight` double DEFAULT NULL,
  `rawpeakheights_a5peakheight` double DEFAULT NULL,
  `rawpeakheights_a6peakheight` double DEFAULT NULL,
  `rawpeakheights_a7peakheight` double DEFAULT NULL,
  `rawpeakheights_a8peakheight` double DEFAULT NULL,
  `rawpeakheights_a9peakheight` double DEFAULT NULL,
  `rawpeakheights_a10peakheight` double DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK66862366184CB847` (`fraxUpload_id`),
  KEY `FK6686236639D64D96` (`prepsample_id`),
  KEY `FK66862366862F5368` (`sourcesample_id`),
  KEY `FK66862366142D7D2E` (`subject_id`),
  CONSTRAINT `FK66862366142D7D2E` FOREIGN KEY (`subject_id`) REFERENCES `subject` (`id`),
  CONSTRAINT `FK66862366184CB847` FOREIGN KEY (`fraxUpload_id`) REFERENCES `frax_upload` (`id`),
  CONSTRAINT `FK6686236639D64D96` FOREIGN KEY (`prepsample_id`) REFERENCES `sample` (`id`),
  CONSTRAINT `FK66862366862F5368` FOREIGN KEY (`sourcesample_id`) REFERENCES `sample` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=32252 DEFAULT CHARSET=latin1;;
/*!40101 SET character_set_client = @saved_cs_client */;;
/*!40101 SET @saved_cs_client     = @@character_set_client */;;
/*!40101 SET character_set_client = utf8 */;;
CREATE TABLE `frax_upload` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `experiment` varchar(255) DEFAULT NULL,
  `uploaddate` datetime DEFAULT NULL,
  `seqplate_id` bigint(20) DEFAULT NULL,
  `uploadedby_id` bigint(20) DEFAULT NULL,
  `uploadedfile_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK6AC2BBBD72F9C5BE` (`uploadedfile_id`),
  KEY `FK6AC2BBBDCAB99365` (`uploadedby_id`),
  KEY `FK6AC2BBBDC7886E67` (`seqplate_id`),
  CONSTRAINT `FK6AC2BBBD72F9C5BE` FOREIGN KEY (`uploadedfile_id`) REFERENCES `documentinfo` (`id`),
  CONSTRAINT `FK6AC2BBBDC7886E67` FOREIGN KEY (`seqplate_id`) REFERENCES `frax_plate` (`id`),
  CONSTRAINT `FK6AC2BBBDCAB99365` FOREIGN KEY (`uploadedby_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1005 DEFAULT CHARSET=latin1;;
/*!40101 SET character_set_client = @saved_cs_client */;;
/*!40101 SET @saved_cs_client     = @@character_set_client */;;
/*!40101 SET character_set_client = utf8 */;;
CREATE TABLE `gcreport` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `created` datetime DEFAULT NULL,
  `notes` text,
  `original_id` bigint(20) DEFAULT NULL,
  `createdby_id` bigint(20) DEFAULT NULL,
  `lastmodified` datetime DEFAULT NULL,
  `lastmodifiedby_id` bigint(20) DEFAULT NULL,
  `casefile_id` bigint(20) DEFAULT NULL,
  `gctemplate_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK39663530D562C7DD` (`createdby_id`),
  KEY `FK396635304B3ADFA9` (`original_id`),
  KEY `FK39663530CB9103C3` (`casefile_id`),
  KEY `FK3966353088D92523` (`gctemplate_id`),
  KEY `FK3966353010CC59C6` (`lastmodifiedby_id`),
  KEY `FK_d8d9e1c419564edcb02f60c9ad4` (`original_id`),
  CONSTRAINT `FK3966353010CC59C6` FOREIGN KEY (`lastmodifiedby_id`) REFERENCES `user` (`id`),
  CONSTRAINT `FK3966353088D92523` FOREIGN KEY (`gctemplate_id`) REFERENCES `gctemplate` (`id`),
  CONSTRAINT `FK39663530CB9103C3` FOREIGN KEY (`casefile_id`) REFERENCES `casefile` (`id`),
  CONSTRAINT `FK39663530D562C7DD` FOREIGN KEY (`createdby_id`) REFERENCES `user` (`id`),
  CONSTRAINT `FK_d8d9e1c419564edcb02f60c9ad4` FOREIGN KEY (`original_id`) REFERENCES `documentinfo` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16963 DEFAULT CHARSET=latin1;;
/*!40101 SET character_set_client = @saved_cs_client */;;
/*!40101 SET @saved_cs_client     = @@character_set_client */;;
/*!40101 SET character_set_client = utf8 */;;
CREATE TABLE `gctemplate` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `text` text,
  `archived` bit(1) DEFAULT b'0',
  `delayednote` bit(1) DEFAULT b'0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=69 DEFAULT CHARSET=latin1;;
/*!40101 SET character_set_client = @saved_cs_client */;;
/*!40101 SET @saved_cs_client     = @@character_set_client */;;
/*!40101 SET character_set_client = utf8 */;;
CREATE TABLE `genomicprepprocedure` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `dfault` bit(1) NOT NULL,
  `pocdefault` bit(1) NOT NULL,
  `paternitydefault` bit(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=latin1;;
/*!40101 SET character_set_client = @saved_cs_client */;;
/*!40101 SET @saved_cs_client     = @@character_set_client */;;
/*!40101 SET character_set_client = utf8 */;;
CREATE TABLE `gpclinic` (
  `id` bigint(20) NOT NULL DEFAULT '0',
  `gpclinicid` varchar(1024) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MEMORY DEFAULT CHARSET=latin1;;
/*!40101 SET character_set_client = @saved_cs_client */;;
/*!40101 SET @saved_cs_client     = @@character_set_client */;;
/*!40101 SET character_set_client = utf8 */;;
CREATE TABLE `hl7sendoutorder` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `firstname` varchar(255) DEFAULT NULL,
  `lastname` varchar(255) DEFAULT NULL,
  `ordersent` datetime DEFAULT NULL,
  `order_id` bigint(20) DEFAULT NULL,
  `ordercontroltype` varchar(125) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKORDERID` (`order_id`),
  CONSTRAINT `FKORDERID` FOREIGN KEY (`order_id`) REFERENCES `documentinfo` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=225033 DEFAULT CHARSET=latin1;;
/*!40101 SET character_set_client = @saved_cs_client */;;
/*!40101 SET @saved_cs_client     = @@character_set_client */;;
/*!40101 SET character_set_client = utf8 */;;
CREATE TABLE `hl7sendoutorder_documentinfo` (
  `HL7SendOutOrder_id` bigint(20) NOT NULL,
  `results_id` bigint(20) NOT NULL,
  KEY `FKBA4D6AADC4232B3B` (`HL7SendOutOrder_id`),
  KEY `FKBA4D6AAD75808910` (`results_id`),
  CONSTRAINT `FKBA4D6AAD75808910` FOREIGN KEY (`results_id`) REFERENCES `documentinfo` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FKBA4D6AADC4232B3B` FOREIGN KEY (`HL7SendOutOrder_id`) REFERENCES `hl7sendoutorder` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;;
/*!40101 SET character_set_client = @saved_cs_client */;;
/*!40101 SET @saved_cs_client     = @@character_set_client */;;
/*!40101 SET character_set_client = utf8 */;;
CREATE TABLE `hl7sendoutorder_pdfs` (
  `HL7SendOutOrder_id` bigint(20) NOT NULL,
  `result_pdf_id` bigint(20) NOT NULL,
  KEY `HL7SendOutOrder_id` (`HL7SendOutOrder_id`),
  KEY `result_pdf_id` (`result_pdf_id`),
  CONSTRAINT `hl7sendoutorder_pdfs_ibfk_1` FOREIGN KEY (`result_pdf_id`) REFERENCES `documentinfo` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `hl7sendoutorder_pdfs_ibfk_2` FOREIGN KEY (`HL7SendOutOrder_id`) REFERENCES `hl7sendoutorder` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;;
/*!40101 SET character_set_client = @saved_cs_client */;;
/*!40101 SET @saved_cs_client     = @@character_set_client */;;
/*!40101 SET character_set_client = utf8 */;;
CREATE TABLE `holiday` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `day` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uc_holiday` (`day`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=latin1;;
/*!40101 SET character_set_client = @saved_cs_client */;;
/*!40101 SET @saved_cs_client     = @@character_set_client */;;
/*!40101 SET character_set_client = utf8 */;;
CREATE TABLE `horizon_disease_hl7_code` (
  `disease_id` bigint(20) NOT NULL,
  `hl7diseaseidentifier` varchar(255) DEFAULT NULL,
  UNIQUE KEY `HHL7UIDX1DIDHL7ID` (`disease_id`,`hl7diseaseidentifier`),
  KEY `disease_id` (`disease_id`),
  CONSTRAINT `horizon_disease_hl7_code_ibfk_1` FOREIGN KEY (`disease_id`) REFERENCES `horizondisease` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;;
/*!40101 SET character_set_client = @saved_cs_client */;;
/*!40101 SET @saved_cs_client     = @@character_set_client */;;
/*!40101 SET character_set_client = utf8 */;;
CREATE TABLE `horizon_disease_risk` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `ethnicity` varchar(10) DEFAULT NULL,
  `riskafter` decimal(35,30) DEFAULT NULL,
  `riskbefore` decimal(35,30) DEFAULT NULL,
  `diseaseTemplate_id` bigint(20) DEFAULT NULL,
  `provider` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `diseaseTemplate_id` (`diseaseTemplate_id`,`provider`,`ethnicity`),
  KEY `FKhorizondiseasetemplate` (`diseaseTemplate_id`),
  CONSTRAINT `horizon_disease_risk_horizondiseasetemplate_fk1` FOREIGN KEY (`diseaseTemplate_id`) REFERENCES `horizondiseasetemplate` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=714 DEFAULT CHARSET=latin1;;
/*!40101 SET character_set_client = @saved_cs_client */;;
/*!40101 SET @saved_cs_client     = @@character_set_client */;;
/*!40101 SET character_set_client = utf8 */;;
CREATE TABLE `horizon_disease_variation` (
  `disease_id` bigint(20) NOT NULL,
  `variations` varchar(255) DEFAULT NULL,
  KEY `FKdisease_variation` (`disease_id`),
  CONSTRAINT `FKhorizondisease_variation` FOREIGN KEY (`disease_id`) REFERENCES `horizondisease` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;;
/*!40101 SET character_set_client = @saved_cs_client */;;
/*!40101 SET @saved_cs_client     = @@character_set_client */;;
/*!40101 SET character_set_client = utf8 */;;
CREATE TABLE `horizon_report` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `case_id` varchar(255) DEFAULT NULL,
  `patient_id` varchar(255) DEFAULT NULL,
  `clinic_id` varchar(255) DEFAULT NULL,
  `result_id` bigint(20) DEFAULT NULL,
  `physician_id` bigint(20) DEFAULT NULL,
  `horizonpanel_id` bigint(20) DEFAULT NULL,
  `hl7_accessioning_id` varchar(255) DEFAULT NULL,
  `4medica_id` varchar(255) DEFAULT NULL,
  `accessioning_id` varchar(255) DEFAULT NULL,
  `patient_firstname` varchar(255) DEFAULT NULL,
  `patient_lastname` varchar(255) DEFAULT NULL,
  `patient_name` varchar(255) DEFAULT NULL,
  `patient_dob` varchar(255) DEFAULT NULL,
  `patient_gender` varchar(255) DEFAULT NULL,
  `patient_ethnicities` varchar(255) DEFAULT NULL,
  `patient_weight` varchar(255) DEFAULT NULL,
  `patient_4medica_chart_id` varchar(255) DEFAULT NULL,
  `medical_record_id` varchar(255) DEFAULT NULL,
  `third_party_draw_id_mom` varchar(255) DEFAULT NULL,
  `third_party_draw_id_dad` varchar(255) DEFAULT NULL,
  `ordering_physician` varchar(255) DEFAULT NULL,
  `ordering_physician_npi` varchar(255) DEFAULT NULL,
  `clinic_name` varchar(255) DEFAULT NULL,
  `clinic_satelliteId` varchar(255) DEFAULT NULL,
  `clinic_street_1` varchar(255) DEFAULT NULL,
  `clinic_street_2` varchar(255) DEFAULT NULL,
  `clinic_city` varchar(255) DEFAULT NULL,
  `clinic_state` varchar(255) DEFAULT NULL,
  `clinic_postcode` varchar(255) DEFAULT NULL,
  `clinic_phone_number` varchar(255) DEFAULT NULL,
  `clinic_fax_number` varchar(255) DEFAULT NULL,
  `sample_barcode` varchar(255) DEFAULT NULL,
  `sample_collected` varchar(255) DEFAULT NULL,
  `sample_received` varchar(255) DEFAULT NULL,
  `sample_type` varchar(255) DEFAULT NULL,
  `sample_has_father` bit(1) DEFAULT NULL,
  `sample_has_mother` bit(1) DEFAULT NULL,
  `collection_kit` varchar(255) DEFAULT NULL,
  `third_party_kit_id` varchar(255) DEFAULT NULL,
  `amendsprevious` bit(1) NOT NULL,
  `revisedReport` bit(1) NOT NULL DEFAULT b'0',
  `newyork_case` bit(1) DEFAULT NULL,
  `original_kit_barcode` varchar(255) DEFAULT NULL,
  `published` varchar(255) DEFAULT NULL,
  `horizonpaneldescription` varchar(255) DEFAULT NULL,
  `clinicalnotes` varchar(600) DEFAULT NULL,
  `report_id` varchar(255) DEFAULT NULL,
  `amendednote` text,
  `patient_street1` varchar(255) DEFAULT NULL,
  `patient_street2` varchar(255) DEFAULT NULL,
  `patient_city` varchar(255) DEFAULT NULL,
  `patient_state` varchar(255) DEFAULT NULL,
  `patient_postcode` varchar(255) DEFAULT NULL,
  `patient_country` varchar(255) DEFAULT NULL,
  `patient_phone` varchar(255) DEFAULT NULL,
  `gc_negative_results_count` varchar(5) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK6CFC5458D9CC3179` (`horizonpanel_id`),
  KEY `FK6CFC545874265C64` (`physician_id`),
  KEY `FK6CFC5458B19D481A` (`result_id`),
  CONSTRAINT `FK6CFC545874265C64` FOREIGN KEY (`physician_id`) REFERENCES `provider` (`id`),
  CONSTRAINT `FK6CFC5458B19D481A` FOREIGN KEY (`result_id`) REFERENCES `horizon_report_result` (`id`),
  CONSTRAINT `FK6CFC5458D9CC3179` FOREIGN KEY (`horizonpanel_id`) REFERENCES `horizonpanel` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=91317 DEFAULT CHARSET=latin1;;
/*!40101 SET character_set_client = @saved_cs_client */;;
/*!40101 SET @saved_cs_client     = @@character_set_client */;;
/*!40101 SET character_set_client = utf8 */;;
CREATE TABLE `horizon_report_disease_result_template_variables` (
  `HorizonReportDiseaseResult_id` bigint(20) NOT NULL,
  `variablesmap` varchar(255) DEFAULT NULL,
  `variablesMap_KEY` bigint(20) NOT NULL,
  PRIMARY KEY (`HorizonReportDiseaseResult_id`,`variablesMap_KEY`),
  KEY `variablesMap_KEY` (`variablesMap_KEY`),
  KEY `HorizonReportDiseaseResult_id` (`HorizonReportDiseaseResult_id`),
  CONSTRAINT `horizon_report_disease_result_template_variables_ibfk_1` FOREIGN KEY (`variablesMap_KEY`) REFERENCES `horizontemplatevariable` (`id`),
  CONSTRAINT `horizon_report_disease_result_template_variables_ibfk_2` FOREIGN KEY (`HorizonReportDiseaseResult_id`) REFERENCES `horizon_report_disease_results` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;;
/*!40101 SET character_set_client = @saved_cs_client */;;
/*!40101 SET @saved_cs_client     = @@character_set_client */;;
/*!40101 SET character_set_client = utf8 */;;
CREATE TABLE `horizon_report_disease_results` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `diseasename` varchar(200) DEFAULT NULL,
  `gene` varchar(50) DEFAULT NULL,
  `resulttype` varchar(255) DEFAULT NULL,
  `carrierStatus` varchar(1000) DEFAULT NULL,
  `mutationnote` varchar(1000) DEFAULT NULL,
  `resultnote` varchar(1000) DEFAULT NULL,
  `recommendation` varchar(8000) DEFAULT NULL,
  `risks_aftertesting` varchar(20) DEFAULT NULL,
  `risks_beforetesting` varchar(20) DEFAULT NULL,
  `risks_ethnicity` varchar(10) DEFAULT NULL,
  `templatechoice_id` bigint(20) DEFAULT NULL,
  `casefile_id` bigint(20) DEFAULT NULL,
  `state` varchar(255) DEFAULT NULL,
  `escalated` bit(1) NOT NULL DEFAULT b'0',
  `review_notes` varchar(255) DEFAULT NULL,
  `changed_by` varchar(255) DEFAULT NULL,
  `acceptedOver` bigint(20) DEFAULT NULL,
  `amended` bit(1) DEFAULT b'0',
  `requiresResultBox` bit(1) DEFAULT b'0',
  PRIMARY KEY (`id`),
  KEY `templatechoice_id` (`templatechoice_id`),
  KEY `FK9199924A3317FHRR_idx_2` (`casefile_id`),
  KEY `acceptedOver` (`acceptedOver`),
  CONSTRAINT `horizon_report_disease_results_ibfk_1` FOREIGN KEY (`templatechoice_id`) REFERENCES `horizondiseasetemplate` (`id`),
  CONSTRAINT `horizon_report_disease_results_ibfk_2` FOREIGN KEY (`acceptedOver`) REFERENCES `horizon_report_disease_results` (`id`),
  CONSTRAINT `horizon_report_disease_results_idfk_2` FOREIGN KEY (`casefile_id`) REFERENCES `casefile` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3975716 DEFAULT CHARSET=latin1;;
/*!40101 SET character_set_client = @saved_cs_client */;;
/*!40101 SET @saved_cs_client     = @@character_set_client */;;
/*!40101 SET character_set_client = utf8 */;;
CREATE TABLE `horizon_report_result` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `requisitionPanel` varchar(20) DEFAULT NULL,
  `riskURL` varchar(50) DEFAULT NULL,
  `negative_summary` varchar(75) DEFAULT NULL,
  `nextsteps` varchar(255) DEFAULT NULL,
  `shorttnp` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=91344 DEFAULT CHARSET=latin1;;
/*!40101 SET character_set_client = @saved_cs_client */;;
/*!40101 SET @saved_cs_client     = @@character_set_client */;;
/*!40101 SET character_set_client = utf8 */;;
CREATE TABLE `horizon_risk_data` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `disease_id` bigint(20) DEFAULT NULL,
  `displayOrder` int(11) DEFAULT NULL,
  `ethnicity` varchar(150) DEFAULT NULL,
  `riskafter` varchar(100) DEFAULT NULL,
  `riskbefore` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_risk` (`disease_id`,`ethnicity`),
  KEY `FKhorizondisease` (`disease_id`),
  CONSTRAINT `horizon_disease_risk_horizondisease_fk1` FOREIGN KEY (`disease_id`) REFERENCES `horizondisease` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=719 DEFAULT CHARSET=latin1;;
/*!40101 SET character_set_client = @saved_cs_client */;;
/*!40101 SET @saved_cs_client     = @@character_set_client */;;
/*!40101 SET character_set_client = utf8 */;;
CREATE TABLE `horizoncustompanel` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `ce_id` varchar(20) NOT NULL,
  `ce_text` varchar(260) NOT NULL,
  `ce_system` varchar(20) DEFAULT 'L',
  PRIMARY KEY (`id`),
  UNIQUE KEY `ce_id` (`ce_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;;
/*!40101 SET character_set_client = @saved_cs_client */;;
/*!40101 SET @saved_cs_client     = @@character_set_client */;;
/*!40101 SET character_set_client = utf8 */;;
CREATE TABLE `horizoncustompanel_panels` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `horizoncustompanel_id` bigint(20) NOT NULL,
  `horizonpanel_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `horizoncustompanel_id` (`horizoncustompanel_id`,`horizonpanel_id`),
  KEY `FKhorizoncustompanel_panel2` (`horizonpanel_id`),
  CONSTRAINT `FKhorizoncustompanel_panel1` FOREIGN KEY (`horizoncustompanel_id`) REFERENCES `horizoncustompanel` (`id`),
  CONSTRAINT `FKhorizoncustompanel_panel2` FOREIGN KEY (`horizonpanel_id`) REFERENCES `horizonpanel` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=latin1;;
/*!40101 SET character_set_client = @saved_cs_client */;;
/*!40101 SET @saved_cs_client     = @@character_set_client */;;
/*!40101 SET character_set_client = utf8 */;;
CREATE TABLE `horizondisease` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `mutation` varchar(255) DEFAULT NULL,
  `refSeqNumber` varchar(50) DEFAULT NULL,
  `provider` varchar(20) DEFAULT NULL,
  `inheritancePattern` varchar(255) DEFAULT NULL,
  `variationsAndExons` varchar(3000) DEFAULT NULL,
  `ce_id` varchar(10) NOT NULL,
  `ce_text` varchar(270) NOT NULL,
  `ce_system` varchar(255) DEFAULT 'L',
  `exonsSequenced` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `HDUIDXNAMEMUT1` (`mutation`,`name`,`provider`)
) ENGINE=InnoDB AUTO_INCREMENT=303 DEFAULT CHARSET=latin1;;
/*!40101 SET character_set_client = @saved_cs_client */;;
/*!40101 SET @saved_cs_client     = @@character_set_client */;;
/*!40101 SET character_set_client = utf8 */;;
CREATE TABLE `horizondisease_backup_eng5408` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `mutation` varchar(255) DEFAULT NULL,
  `refSeqNumber` varchar(50) DEFAULT NULL,
  `provider` varchar(20) DEFAULT NULL,
  `inheritancePattern` varchar(255) DEFAULT NULL,
  `variationsAndExons` varchar(3000) DEFAULT NULL,
  `ce_id` varchar(10) NOT NULL,
  `ce_text` varchar(270) NOT NULL,
  `ce_system` varchar(255) DEFAULT 'L',
  `exonsSequenced` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `HDUIDXNAMEMUT1` (`mutation`,`name`,`provider`)
) ENGINE=InnoDB AUTO_INCREMENT=303 DEFAULT CHARSET=latin1;;
/*!40101 SET character_set_client = @saved_cs_client */;;
/*!40101 SET @saved_cs_client     = @@character_set_client */;;
/*!40101 SET character_set_client = utf8 */;;
CREATE TABLE `horizondiseaseresult` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `disease_id` bigint(20) DEFAULT NULL,
  `panelorder_id` bigint(20) DEFAULT NULL,
  `resultCode` varchar(125) DEFAULT NULL,
  `additionalnotes` varchar(1020) DEFAULT NULL,
  `resultnotetext` varchar(755) DEFAULT NULL,
  `resulttext` varchar(755) DEFAULT NULL,
  `resultdocument_id` bigint(20) DEFAULT NULL,
  `providerFinalResult` bit(1) DEFAULT b'0',
  `amends` bit(1) DEFAULT b'0',
  `resulttype` varchar(25) DEFAULT NULL,
  `variation` varchar(755) DEFAULT NULL,
  `status` varchar(125) DEFAULT NULL,
  `acceptedOver` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKHDRDISEASEID_idx` (`disease_id`),
  KEY `FKHDRPANELORDERID_idx` (`panelorder_id`),
  KEY `acceptedOver` (`acceptedOver`),
  CONSTRAINT `FKHDRDISEASEID` FOREIGN KEY (`disease_id`) REFERENCES `horizondisease` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FKHDRPANELORDERID` FOREIGN KEY (`panelorder_id`) REFERENCES `horizonpanelorder` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `horizondiseaseresult_ibfk_1` FOREIGN KEY (`acceptedOver`) REFERENCES `horizondiseaseresult` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4067535 DEFAULT CHARSET=latin1;;
/*!40101 SET character_set_client = @saved_cs_client */;;
/*!40101 SET @saved_cs_client     = @@character_set_client */;;
/*!40101 SET character_set_client = utf8 */;;
CREATE TABLE `horizondiseaseresult_pdfs` (
  `horizondiseaseresult_id` bigint(20) NOT NULL,
  `resultpdfs_id` bigint(20) NOT NULL,
  KEY `horizondiseaseresult_id` (`horizondiseaseresult_id`),
  KEY `resultpdfs_id` (`resultpdfs_id`),
  CONSTRAINT `horizondiseaseresult_pdfs_ibfk_1` FOREIGN KEY (`resultpdfs_id`) REFERENCES `documentinfo` (`id`),
  CONSTRAINT `horizondiseaseresult_pdfs_ibfk_2` FOREIGN KEY (`horizondiseaseresult_id`) REFERENCES `horizondiseaseresult` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;;
/*!40101 SET character_set_client = @saved_cs_client */;;
/*!40101 SET @saved_cs_client     = @@character_set_client */;;
/*!40101 SET character_set_client = utf8 */;;
CREATE TABLE `horizondiseasetemplate` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `diseasename` varchar(255) DEFAULT NULL,
  `gene` varchar(45) DEFAULT NULL,
  `templatecode` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `variant` varchar(1000) DEFAULT NULL,
  `resultnotetext` varchar(1000) DEFAULT NULL,
  `resulttype` varchar(30) DEFAULT NULL,
  `templatename` varchar(1000) DEFAULT NULL,
  `additionalSteps` varchar(1000) DEFAULT NULL,
  `supplementPath` varchar(755) DEFAULT NULL,
  `gc_review_required` bit(1) NOT NULL DEFAULT b'0',
  `fraxReflexScenario` bit(1) DEFAULT b'0',
  `requiresResultBox` bit(1) DEFAULT b'0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1439 DEFAULT CHARSET=latin1;;
/*!40101 SET character_set_client = @saved_cs_client */;;
/*!40101 SET @saved_cs_client     = @@character_set_client */;;
/*!40101 SET character_set_client = utf8 */;;
CREATE TABLE `horizondiseasetemplate_backup_eng5408` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `diseasename` varchar(255) DEFAULT NULL,
  `gene` varchar(45) DEFAULT NULL,
  `templatecode` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `variant` varchar(1000) DEFAULT NULL,
  `resultnotetext` varchar(1000) DEFAULT NULL,
  `resulttype` varchar(30) DEFAULT NULL,
  `templatename` varchar(1000) DEFAULT NULL,
  `additionalSteps` varchar(1000) DEFAULT NULL,
  `supplementPath` varchar(755) DEFAULT NULL,
  `gc_review_required` bit(1) NOT NULL DEFAULT b'0',
  `fraxReflexScenario` bit(1) DEFAULT b'0',
  `requiresResultBox` bit(1) DEFAULT b'0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1439 DEFAULT CHARSET=latin1;;
/*!40101 SET character_set_client = @saved_cs_client */;;
/*!40101 SET @saved_cs_client     = @@character_set_client */;;
/*!40101 SET character_set_client = utf8 */;;
CREATE TABLE `horizonpanel` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `shipDestinationType` varchar(45) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `hl7Code` varchar(64) DEFAULT NULL,
  `hl7Name` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `ce_id` varchar(20) NOT NULL,
  `ce_text` varchar(260) NOT NULL,
  `ce_system` varchar(255) DEFAULT 'L',
  `single_option` bit(1) NOT NULL DEFAULT b'0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=latin1;;
/*!40101 SET character_set_client = @saved_cs_client */;;
/*!40101 SET @saved_cs_client     = @@character_set_client */;;
/*!40101 SET character_set_client = utf8 */;;
CREATE TABLE `horizonpanelorder` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `panel_id` bigint(20) NOT NULL,
  `casefile_id` bigint(20) DEFAULT NULL,
  `status` varchar(125) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKHPANELORDERPID_idx` (`panel_id`),
  KEY `FKHPOCASEID_idx` (`casefile_id`),
  CONSTRAINT `FKHPOCASEID` FOREIGN KEY (`casefile_id`) REFERENCES `casefile` (`id`),
  CONSTRAINT `FKHPOPANELID` FOREIGN KEY (`panel_id`) REFERENCES `horizonpanel` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=215847 DEFAULT CHARSET=latin1;;
/*!40101 SET character_set_client = @saved_cs_client */;;
/*!40101 SET @saved_cs_client     = @@character_set_client */;;
/*!40101 SET character_set_client = utf8 */;;
CREATE TABLE `horizonpanelorder_hl7sendoutorder` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `panelorder_id` bigint(20) DEFAULT NULL,
  `hl7sendoutorder_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK1HPOHL7PANELORDERID_idx` (`panelorder_id`),
  KEY `FK1HPOHL7SENDOUTORDERID_idx` (`hl7sendoutorder_id`),
  CONSTRAINT `FK1HPOHL7PANELORDERID` FOREIGN KEY (`panelorder_id`) REFERENCES `horizonpanelorder` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK1HPOHL7SENDOUTORDERID` FOREIGN KEY (`hl7sendoutorder_id`) REFERENCES `hl7sendoutorder` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=223218 DEFAULT CHARSET=latin1;;
/*!40101 SET character_set_client = @saved_cs_client */;;
/*!40101 SET @saved_cs_client     = @@character_set_client */;;
/*!40101 SET character_set_client = utf8 */;;
CREATE TABLE `horizonreport_horizonpanelorders` (
  `horizon_report_id` bigint(20) NOT NULL,
  `horizonpanelorders_id` bigint(20) NOT NULL,
  PRIMARY KEY (`horizon_report_id`,`horizonpanelorders_id`),
  KEY `FKhreport_hpo_orders_idx` (`horizonpanelorders_id`),
  KEY `FKhreport_hpo_report_idx` (`horizon_report_id`),
  CONSTRAINT `FKhreport_hpo_orders` FOREIGN KEY (`horizonpanelorders_id`) REFERENCES `horizonpanelorder` (`id`),
  CONSTRAINT `FKhreport_hpo_report` FOREIGN KEY (`horizon_report_id`) REFERENCES `horizon_report` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;;
/*!40101 SET character_set_client = @saved_cs_client */;;
/*!40101 SET @saved_cs_client     = @@character_set_client */;;
/*!40101 SET character_set_client = utf8 */;;
CREATE TABLE `horizonreportresult_diseaseresult` (
  `horizonresult_id` bigint(20) NOT NULL,
  `diseaseresult_id` bigint(20) NOT NULL,
  KEY `FKhrr_dr_horizonresult_idx` (`horizonresult_id`),
  KEY `FKhrr_dr_diseaseresult_idx` (`diseaseresult_id`),
  CONSTRAINT `FKhrr_dr_diseaseresult` FOREIGN KEY (`diseaseresult_id`) REFERENCES `horizon_report_disease_results` (`id`),
  CONSTRAINT `FKhrr_dr_horizonresult` FOREIGN KEY (`horizonresult_id`) REFERENCES `horizon_report_result` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;;
/*!40101 SET character_set_client = @saved_cs_client */;;
/*!40101 SET @saved_cs_client     = @@character_set_client */;;
/*!40101 SET character_set_client = utf8 */;;
CREATE TABLE `horizonresult_recommendations` (
  `result_id` bigint(20) NOT NULL,
  `recommendation` varchar(2048) DEFAULT NULL,
  `idx` int(11) NOT NULL,
  KEY `FKhr_recommendations_idx` (`result_id`),
  CONSTRAINT `FKhr_recommendations` FOREIGN KEY (`result_id`) REFERENCES `horizon_report_result` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;;
/*!40101 SET character_set_client = @saved_cs_client */;;
/*!40101 SET @saved_cs_client     = @@character_set_client */;;
/*!40101 SET character_set_client = utf8 */;;
CREATE TABLE `horizontemplatevariable` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `code` varchar(255) NOT NULL,
  `displayname` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `code` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=2865 DEFAULT CHARSET=latin1;;
/*!40101 SET character_set_client = @saved_cs_client */;;
SET @saved_cs_client     = @@character_set_client;;
SET character_set_client = utf8;;
/*!50001 CREATE TABLE `hs_tracking` (
  `run_id` tinyint NOT NULL,
  `intendeddepthofread` tinyint NOT NULL,
  `rundate` tinyint NOT NULL,
  `phixsamplebarcode` tinyint NOT NULL,
  `truSeqSRClusterKitBarcode` tinyint NOT NULL,
  `truSeqSBSKitBarcode` tinyint NOT NULL,
  `NPT_barcode` tinyint NOT NULL,
  `concentration` tinyint NOT NULL,
  `Clus_Den` tinyint NOT NULL,
  `PF` tinyint NOT NULL
) ENGINE=MyISAM */;;
SET character_set_client = @saved_cs_client;;
/*!40101 SET @saved_cs_client     = @@character_set_client */;;
/*!40101 SET character_set_client = utf8 */;;
CREATE TABLE `illuminaarray` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `rerun` bit(1) DEFAULT NULL,
  `validated` bit(1) DEFAULT NULL,
  `illuminaChip_id` bigint(20) DEFAULT NULL,
  `sample_id` bigint(20) DEFAULT NULL,
  `idx` int(11) DEFAULT NULL,
  `labnote` text,
  `errormessage` varchar(1024) DEFAULT NULL,
  `warningmessage` varchar(1024) DEFAULT NULL,
  `controlsamplejobdir` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKD91672BEEC1EA1A` (`illuminaChip_id`),
  KEY `FKD91672BED50BCD23` (`sample_id`),
  CONSTRAINT `FKD91672BED50BCD23` FOREIGN KEY (`sample_id`) REFERENCES `sample` (`id`),
  CONSTRAINT `FKD91672BEEC1EA1A` FOREIGN KEY (`illuminaChip_id`) REFERENCES `inventorieditem` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=296692 DEFAULT CHARSET=latin1;;
/*!40101 SET character_set_client = @saved_cs_client */;;
/*!40101 SET @saved_cs_client     = @@character_set_client */;;
/*!40101 SET character_set_client = utf8 */;;
CREATE TABLE `illuminascannerread` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `bdirname` varchar(255) DEFAULT NULL,
  `controlsdirname` varchar(255) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `gtdirname` varchar(255) DEFAULT NULL,
  `imagedirname` varchar(255) DEFAULT NULL,
  `scannerversion` varchar(255) DEFAULT NULL,
  `statsdirname` varchar(255) DEFAULT NULL,
  `xydirname` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `created` (`created`)
) ENGINE=InnoDB AUTO_INCREMENT=26348 DEFAULT CHARSET=latin1;;
/*!40101 SET character_set_client = @saved_cs_client */;;
/*!40101 SET @saved_cs_client     = @@character_set_client */;;
/*!40101 SET character_set_client = utf8 */;;
CREATE TABLE `illuminascannerread_arraybarcode` (
  `illuminascannerread_id` bigint(20) NOT NULL,
  `arraybarcode` varchar(255) DEFAULT NULL,
  KEY `FK2A36150DC89CF246` (`illuminascannerread_id`),
  KEY `illuminascannerread_arraybarcode_arraybarcode` (`arraybarcode`),
  CONSTRAINT `FK2A36150DC89CF246` FOREIGN KEY (`illuminascannerread_id`) REFERENCES `illuminascannerread` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;;
/*!40101 SET character_set_client = @saved_cs_client */;;
/*!40101 SET @saved_cs_client     = @@character_set_client */;;
/*!40101 SET character_set_client = utf8 */;;
CREATE TABLE `insurance_company` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `payor_id` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `address_line_1` varchar(255) DEFAULT NULL,
  `address_line_2` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `state` varchar(2) DEFAULT NULL,
  `country_code` varchar(2) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_insurance_company__payor_id` (`payor_id`)
) ENGINE=InnoDB AUTO_INCREMENT=429907 DEFAULT CHARSET=latin1;;
/*!40101 SET character_set_client = @saved_cs_client */;;
SET @saved_cs_client     = @@character_set_client;;
SET character_set_client = utf8;;
/*!50001 CREATE TABLE `insuranceoverridecases` (
  `Case` tinyint NOT NULL,
  `First Name` tinyint NOT NULL,
  `Last Name` tinyint NOT NULL,
  `Address Line 1` tinyint NOT NULL,
  `Address Line 2` tinyint NOT NULL,
  `City` tinyint NOT NULL,
  `State` tinyint NOT NULL,
  `Zip Code` tinyint NOT NULL,
  `Phone Number` tinyint NOT NULL,
  `Email` tinyint NOT NULL,
  `Referring Clinic` tinyint NOT NULL,
  `Physician Name` tinyint NOT NULL,
  `Physician NPI Number` tinyint NOT NULL,
  `Test Type` tinyint NOT NULL,
  `Blastomere Collection Date` tinyint NOT NULL,
  `No ICD9` tinyint NOT NULL,
  `Free Special Billing` tinyint NOT NULL,
  `Insurance Claimed` tinyint NOT NULL,
  `Payment Processed` tinyint NOT NULL,
  `Closed` tinyint NOT NULL,
  `Closing Reason` tinyint NOT NULL,
  `Closing Notes` tinyint NOT NULL
) ENGINE=MyISAM */;;
SET character_set_client = @saved_cs_client;;
/*!40101 SET @saved_cs_client     = @@character_set_client */;;
/*!40101 SET character_set_client = utf8 */;;
CREATE TABLE `insuranceproviderdetail` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `insuranceprovider_name` varchar(255) NOT NULL,
  `insuranceprovider_states` varchar(255) DEFAULT NULL,
  `validfromdate` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=latin1;;
/*!40101 SET character_set_client = @saved_cs_client */;;
/*!40101 SET @saved_cs_client     = @@character_set_client */;;
/*!40101 SET character_set_client = utf8 */;;
CREATE TABLE `inventorieditem` (
  `DTYPE` varchar(31) NOT NULL,
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `barcode` varchar(255) DEFAULT NULL,
  `received` datetime DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `dryendtime` datetime DEFAULT NULL,
  `drystarttime` datetime DEFAULT NULL,
  `hybendtime` datetime DEFAULT NULL,
  `hybstarttime` datetime DEFAULT NULL,
  `illuminaarraytype` varchar(255) DEFAULT NULL,
  `sopversion` varchar(255) DEFAULT NULL,
  `state` varchar(255) DEFAULT NULL,
  `xstainendtime` datetime DEFAULT NULL,
  `xstainstarttime` datetime DEFAULT NULL,
  `receivedby_id` bigint(20) DEFAULT NULL,
  `amp2plate_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK42433C7ED39E5084` (`receivedby_id`),
  KEY `FK42433C7E7F6526FA` (`amp2plate_id`),
  KEY `barcode_IDX` (`barcode`),
  CONSTRAINT `FK42433C7E7F6526FA` FOREIGN KEY (`amp2plate_id`) REFERENCES `amp2plate` (`id`),
  CONSTRAINT `FK42433C7ED39E5084` FOREIGN KEY (`receivedby_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=608101 DEFAULT CHARSET=latin1;;
/*!40101 SET character_set_client = @saved_cs_client */;;
/*!40101 SET @saved_cs_client     = @@character_set_client */;;
/*!40101 SET character_set_client = utf8 */;;
CREATE TABLE `inventorieditem_inventorieditem` (
  `InventoriedItem_id` bigint(20) NOT NULL,
  `reagents_id` bigint(20) NOT NULL,
  PRIMARY KEY (`InventoriedItem_id`,`reagents_id`),
  KEY `FKD74B12BDE71F8F2B` (`reagents_id`),
  KEY `FKD74B12BD2E667D43` (`InventoriedItem_id`),
  CONSTRAINT `FKD74B12BD2E667D43` FOREIGN KEY (`InventoriedItem_id`) REFERENCES `inventorieditem` (`id`),
  CONSTRAINT `FKD74B12BDE71F8F2B` FOREIGN KEY (`reagents_id`) REFERENCES `inventorieditem` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;;
/*!40101 SET character_set_client = @saved_cs_client */;;
/*!40101 SET @saved_cs_client     = @@character_set_client */;;
/*!40101 SET character_set_client = utf8 */;;
CREATE TABLE `jbpm_action` (
  `ID_` bigint(20) NOT NULL AUTO_INCREMENT,
  `class` char(1) NOT NULL,
  `NAME_` varchar(255) DEFAULT NULL,
  `ISPROPAGATIONALLOWED_` bit(1) DEFAULT NULL,
  `ACTIONEXPRESSION_` varchar(255) DEFAULT NULL,
  `ISASYNC_` bit(1) DEFAULT NULL,
  `REFERENCEDACTION_` bigint(20) DEFAULT NULL,
  `ACTIONDELEGATION_` bigint(20) DEFAULT NULL,
  `EVENT_` bigint(20) DEFAULT NULL,
  `PROCESSDEFINITION_` bigint(20) DEFAULT NULL,
  `TIMERNAME_` varchar(255) DEFAULT NULL,
  `DUEDATE_` varchar(255) DEFAULT NULL,
  `REPEAT_` varchar(255) DEFAULT NULL,
  `TRANSITIONNAME_` varchar(255) DEFAULT NULL,
  `TIMERACTION_` bigint(20) DEFAULT NULL,
  `EXPRESSION_` text,
  `EVENTINDEX_` int(11) DEFAULT NULL,
  `EXCEPTIONHANDLER_` bigint(20) DEFAULT NULL,
  `EXCEPTIONHANDLERINDEX_` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `FK_ACTION_REFACT` (`REFERENCEDACTION_`),
  KEY `FK_CRTETIMERACT_TA` (`TIMERACTION_`),
  KEY `FK_ACTION_PROCDEF` (`PROCESSDEFINITION_`),
  KEY `FK_ACTION_EVENT` (`EVENT_`),
  KEY `FK_ACTION_ACTNDEL` (`ACTIONDELEGATION_`),
  KEY `FK_ACTION_EXPTHDL` (`EXCEPTIONHANDLER_`),
  CONSTRAINT `FK_ACTION_ACTNDEL` FOREIGN KEY (`ACTIONDELEGATION_`) REFERENCES `jbpm_delegation` (`ID_`),
  CONSTRAINT `FK_ACTION_EVENT` FOREIGN KEY (`EVENT_`) REFERENCES `jbpm_event` (`ID_`),
  CONSTRAINT `FK_ACTION_EXPTHDL` FOREIGN KEY (`EXCEPTIONHANDLER_`) REFERENCES `jbpm_exceptionhandler` (`ID_`),
  CONSTRAINT `FK_ACTION_PROCDEF` FOREIGN KEY (`PROCESSDEFINITION_`) REFERENCES `jbpm_processdefinition` (`ID_`),
  CONSTRAINT `FK_ACTION_REFACT` FOREIGN KEY (`REFERENCEDACTION_`) REFERENCES `jbpm_action` (`ID_`),
  CONSTRAINT `FK_CRTETIMERACT_TA` FOREIGN KEY (`TIMERACTION_`) REFERENCES `jbpm_action` (`ID_`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;;
/*!40101 SET character_set_client = @saved_cs_client */;;
/*!40101 SET @saved_cs_client     = @@character_set_client */;;
/*!40101 SET character_set_client = utf8 */;;
CREATE TABLE `jbpm_bytearray` (
  `ID_` bigint(20) NOT NULL AUTO_INCREMENT,
  `NAME_` varchar(255) DEFAULT NULL,
  `FILEDEFINITION_` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `FK_BYTEARR_FILDEF` (`FILEDEFINITION_`),
  CONSTRAINT `FK_BYTEARR_FILDEF` FOREIGN KEY (`FILEDEFINITION_`) REFERENCES `jbpm_moduledefinition` (`ID_`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;;
/*!40101 SET character_set_client = @saved_cs_client */;;
/*!40101 SET @saved_cs_client     = @@character_set_client */;;
/*!40101 SET character_set_client = utf8 */;;
CREATE TABLE `jbpm_byteblock` (
  `PROCESSFILE_` bigint(20) NOT NULL,
  `BYTES_` blob,
  `INDEX_` int(11) NOT NULL,
  PRIMARY KEY (`PROCESSFILE_`,`INDEX_`),
  KEY `FK_BYTEBLOCK_FILE` (`PROCESSFILE_`),
  CONSTRAINT `FK_BYTEBLOCK_FILE` FOREIGN KEY (`PROCESSFILE_`) REFERENCES `jbpm_bytearray` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;;
/*!40101 SET character_set_client = @saved_cs_client */;;
/*!40101 SET @saved_cs_client     = @@character_set_client */;;
/*!40101 SET character_set_client = utf8 */;;
CREATE TABLE `jbpm_comment` (
  `ID_` bigint(20) NOT NULL AUTO_INCREMENT,
  `VERSION_` int(11) NOT NULL,
  `ACTORID_` varchar(255) DEFAULT NULL,
  `TIME_` datetime DEFAULT NULL,
  `MESSAGE_` text,
  `TOKEN_` bigint(20) DEFAULT NULL,
  `TASKINSTANCE_` bigint(20) DEFAULT NULL,
  `TOKENINDEX_` int(11) DEFAULT NULL,
  `TASKINSTANCEINDEX_` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `FK_COMMENT_TOKEN` (`TOKEN_`),
  KEY `FK_COMMENT_TSK` (`TASKINSTANCE_`),
  CONSTRAINT `FK_COMMENT_TOKEN` FOREIGN KEY (`TOKEN_`) REFERENCES `jbpm_token` (`ID_`),
  CONSTRAINT `FK_COMMENT_TSK` FOREIGN KEY (`TASKINSTANCE_`) REFERENCES `jbpm_taskinstance` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;;
/*!40101 SET character_set_client = @saved_cs_client */;;
/*!40101 SET @saved_cs_client     = @@character_set_client */;;
/*!40101 SET character_set_client = utf8 */;;
CREATE TABLE `jbpm_decisionconditions` (
  `DECISION_` bigint(20) NOT NULL,
  `TRANSITIONNAME_` varchar(255) DEFAULT NULL,
  `EXPRESSION_` varchar(255) DEFAULT NULL,
  `INDEX_` int(11) NOT NULL,
  PRIMARY KEY (`DECISION_`,`INDEX_`),
  KEY `FK_DECCOND_DEC` (`DECISION_`),
  CONSTRAINT `FK_DECCOND_DEC` FOREIGN KEY (`DECISION_`) REFERENCES `jbpm_node` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;;
/*!40101 SET character_set_client = @saved_cs_client */;;
/*!40101 SET @saved_cs_client     = @@character_set_client */;;
/*!40101 SET character_set_client = utf8 */;;
CREATE TABLE `jbpm_delegation` (
  `ID_` bigint(20) NOT NULL AUTO_INCREMENT,
  `CLASSNAME_` text,
  `CONFIGURATION_` text,
  `CONFIGTYPE_` varchar(255) DEFAULT NULL,
  `PROCESSDEFINITION_` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `FK_DELEGATION_PRCD` (`PROCESSDEFINITION_`),
  CONSTRAINT `FK_DELEGATION_PRCD` FOREIGN KEY (`PROCESSDEFINITION_`) REFERENCES `jbpm_processdefinition` (`ID_`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;;
/*!40101 SET character_set_client = @saved_cs_client */;;
/*!40101 SET @saved_cs_client     = @@character_set_client */;;
/*!40101 SET character_set_client = utf8 */;;
CREATE TABLE `jbpm_event` (
  `ID_` bigint(20) NOT NULL AUTO_INCREMENT,
  `EVENTTYPE_` varchar(255) DEFAULT NULL,
  `TYPE_` char(1) DEFAULT NULL,
  `GRAPHELEMENT_` bigint(20) DEFAULT NULL,
  `PROCESSDEFINITION_` bigint(20) DEFAULT NULL,
  `NODE_` bigint(20) DEFAULT NULL,
  `TRANSITION_` bigint(20) DEFAULT NULL,
  `TASK_` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `FK_EVENT_PROCDEF` (`PROCESSDEFINITION_`),
  KEY `FK_EVENT_TRANS` (`TRANSITION_`),
  KEY `FK_EVENT_NODE` (`NODE_`),
  KEY `FK_EVENT_TASK` (`TASK_`),
  CONSTRAINT `FK_EVENT_NODE` FOREIGN KEY (`NODE_`) REFERENCES `jbpm_node` (`ID_`),
  CONSTRAINT `FK_EVENT_PROCDEF` FOREIGN KEY (`PROCESSDEFINITION_`) REFERENCES `jbpm_processdefinition` (`ID_`),
  CONSTRAINT `FK_EVENT_TASK` FOREIGN KEY (`TASK_`) REFERENCES `jbpm_task` (`ID_`),
  CONSTRAINT `FK_EVENT_TRANS` FOREIGN KEY (`TRANSITION_`) REFERENCES `jbpm_transition` (`ID_`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;;
/*!40101 SET character_set_client = @saved_cs_client */;;
/*!40101 SET @saved_cs_client     = @@character_set_client */;;
/*!40101 SET character_set_client = utf8 */;;
CREATE TABLE `jbpm_exceptionhandler` (
  `ID_` bigint(20) NOT NULL AUTO_INCREMENT,
  `EXCEPTIONCLASSNAME_` text,
  `TYPE_` char(1) DEFAULT NULL,
  `GRAPHELEMENT_` bigint(20) DEFAULT NULL,
  `PROCESSDEFINITION_` bigint(20) DEFAULT NULL,
  `GRAPHELEMENTINDEX_` int(11) DEFAULT NULL,
  `NODE_` bigint(20) DEFAULT NULL,
  `TRANSITION_` bigint(20) DEFAULT NULL,
  `TASK_` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;;
/*!40101 SET character_set_client = @saved_cs_client */;;
/*!40101 SET @saved_cs_client     = @@character_set_client */;;
/*!40101 SET character_set_client = utf8 */;;
CREATE TABLE `jbpm_job` (
  `ID_` bigint(20) NOT NULL AUTO_INCREMENT,
  `CLASS_` char(1) NOT NULL,
  `VERSION_` int(11) NOT NULL,
  `DUEDATE_` datetime DEFAULT NULL,
  `PROCESSINSTANCE_` bigint(20) DEFAULT NULL,
  `TOKEN_` bigint(20) DEFAULT NULL,
  `TASKINSTANCE_` bigint(20) DEFAULT NULL,
  `ISSUSPENDED_` bit(1) DEFAULT NULL,
  `ISEXCLUSIVE_` bit(1) DEFAULT NULL,
  `LOCKOWNER_` varchar(255) DEFAULT NULL,
  `LOCKTIME_` datetime DEFAULT NULL,
  `EXCEPTION_` text,
  `RETRIES_` int(11) DEFAULT NULL,
  `NAME_` varchar(255) DEFAULT NULL,
  `REPEAT_` varchar(255) DEFAULT NULL,
  `TRANSITIONNAME_` varchar(255) DEFAULT NULL,
  `ACTION_` bigint(20) DEFAULT NULL,
  `GRAPHELEMENTTYPE_` varchar(255) DEFAULT NULL,
  `GRAPHELEMENT_` bigint(20) DEFAULT NULL,
  `NODE_` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `FK_JOB_PRINST` (`PROCESSINSTANCE_`),
  KEY `FK_JOB_ACTION` (`ACTION_`),
  KEY `FK_JOB_TOKEN` (`TOKEN_`),
  KEY `FK_JOB_NODE` (`NODE_`),
  KEY `FK_JOB_TSKINST` (`TASKINSTANCE_`),
  CONSTRAINT `FK_JOB_ACTION` FOREIGN KEY (`ACTION_`) REFERENCES `jbpm_action` (`ID_`),
  CONSTRAINT `FK_JOB_NODE` FOREIGN KEY (`NODE_`) REFERENCES `jbpm_node` (`ID_`),
  CONSTRAINT `FK_JOB_PRINST` FOREIGN KEY (`PROCESSINSTANCE_`) REFERENCES `jbpm_processinstance` (`ID_`),
  CONSTRAINT `FK_JOB_TOKEN` FOREIGN KEY (`TOKEN_`) REFERENCES `jbpm_token` (`ID_`),
  CONSTRAINT `FK_JOB_TSKINST` FOREIGN KEY (`TASKINSTANCE_`) REFERENCES `jbpm_taskinstance` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;;
/*!40101 SET character_set_client = @saved_cs_client */;;
/*!40101 SET @saved_cs_client     = @@character_set_client */;;
/*!40101 SET character_set_client = utf8 */;;
CREATE TABLE `jbpm_log` (
  `ID_` bigint(20) NOT NULL AUTO_INCREMENT,
  `CLASS_` char(1) NOT NULL,
  `INDEX_` int(11) DEFAULT NULL,
  `DATE_` datetime DEFAULT NULL,
  `TOKEN_` bigint(20) DEFAULT NULL,
  `PARENT_` bigint(20) DEFAULT NULL,
  `MESSAGE_` text,
  `EXCEPTION_` text,
  `ACTION_` bigint(20) DEFAULT NULL,
  `NODE_` bigint(20) DEFAULT NULL,
  `ENTER_` datetime DEFAULT NULL,
  `LEAVE_` datetime DEFAULT NULL,
  `DURATION_` bigint(20) DEFAULT NULL,
  `NEWLONGVALUE_` bigint(20) DEFAULT NULL,
  `TRANSITION_` bigint(20) DEFAULT NULL,
  `CHILD_` bigint(20) DEFAULT NULL,
  `SOURCENODE_` bigint(20) DEFAULT NULL,
  `DESTINATIONNODE_` bigint(20) DEFAULT NULL,
  `VARIABLEINSTANCE_` bigint(20) DEFAULT NULL,
  `OLDBYTEARRAY_` bigint(20) DEFAULT NULL,
  `NEWBYTEARRAY_` bigint(20) DEFAULT NULL,
  `OLDDATEVALUE_` datetime DEFAULT NULL,
  `NEWDATEVALUE_` datetime DEFAULT NULL,
  `OLDDOUBLEVALUE_` double DEFAULT NULL,
  `NEWDOUBLEVALUE_` double DEFAULT NULL,
  `OLDLONGIDCLASS_` varchar(255) DEFAULT NULL,
  `OLDLONGIDVALUE_` bigint(20) DEFAULT NULL,
  `NEWLONGIDCLASS_` varchar(255) DEFAULT NULL,
  `NEWLONGIDVALUE_` bigint(20) DEFAULT NULL,
  `OLDSTRINGIDCLASS_` varchar(255) DEFAULT NULL,
  `OLDSTRINGIDVALUE_` varchar(255) DEFAULT NULL,
  `NEWSTRINGIDCLASS_` varchar(255) DEFAULT NULL,
  `NEWSTRINGIDVALUE_` varchar(255) DEFAULT NULL,
  `OLDLONGVALUE_` bigint(20) DEFAULT NULL,
  `OLDSTRINGVALUE_` text,
  `NEWSTRINGVALUE_` text,
  `TASKINSTANCE_` bigint(20) DEFAULT NULL,
  `TASKACTORID_` varchar(255) DEFAULT NULL,
  `TASKOLDACTORID_` varchar(255) DEFAULT NULL,
  `SWIMLANEINSTANCE_` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `FK_LOG_SOURCENODE` (`SOURCENODE_`),
  KEY `FK_LOG_DESTNODE` (`DESTINATIONNODE_`),
  KEY `FK_LOG_TOKEN` (`TOKEN_`),
  KEY `FK_LOG_TRANSITION` (`TRANSITION_`),
  KEY `FK_LOG_TASKINST` (`TASKINSTANCE_`),
  KEY `FK_LOG_CHILDTOKEN` (`CHILD_`),
  KEY `FK_LOG_OLDBYTES` (`OLDBYTEARRAY_`),
  KEY `FK_LOG_SWIMINST` (`SWIMLANEINSTANCE_`),
  KEY `FK_LOG_NEWBYTES` (`NEWBYTEARRAY_`),
  KEY `FK_LOG_ACTION` (`ACTION_`),
  KEY `FK_LOG_VARINST` (`VARIABLEINSTANCE_`),
  KEY `FK_LOG_NODE` (`NODE_`),
  KEY `FK_LOG_PARENT` (`PARENT_`),
  CONSTRAINT `FK_LOG_ACTION` FOREIGN KEY (`ACTION_`) REFERENCES `jbpm_action` (`ID_`),
  CONSTRAINT `FK_LOG_CHILDTOKEN` FOREIGN KEY (`CHILD_`) REFERENCES `jbpm_token` (`ID_`),
  CONSTRAINT `FK_LOG_DESTNODE` FOREIGN KEY (`DESTINATIONNODE_`) REFERENCES `jbpm_node` (`ID_`),
  CONSTRAINT `FK_LOG_NEWBYTES` FOREIGN KEY (`NEWBYTEARRAY_`) REFERENCES `jbpm_bytearray` (`ID_`),
  CONSTRAINT `FK_LOG_NODE` FOREIGN KEY (`NODE_`) REFERENCES `jbpm_node` (`ID_`),
  CONSTRAINT `FK_LOG_OLDBYTES` FOREIGN KEY (`OLDBYTEARRAY_`) REFERENCES `jbpm_bytearray` (`ID_`),
  CONSTRAINT `FK_LOG_PARENT` FOREIGN KEY (`PARENT_`) REFERENCES `jbpm_log` (`ID_`),
  CONSTRAINT `FK_LOG_SOURCENODE` FOREIGN KEY (`SOURCENODE_`) REFERENCES `jbpm_node` (`ID_`),
  CONSTRAINT `FK_LOG_SWIMINST` FOREIGN KEY (`SWIMLANEINSTANCE_`) REFERENCES `jbpm_swimlaneinstance` (`ID_`),
  CONSTRAINT `FK_LOG_TASKINST` FOREIGN KEY (`TASKINSTANCE_`) REFERENCES `jbpm_taskinstance` (`ID_`),
  CONSTRAINT `FK_LOG_TOKEN` FOREIGN KEY (`TOKEN_`) REFERENCES `jbpm_token` (`ID_`),
  CONSTRAINT `FK_LOG_TRANSITION` FOREIGN KEY (`TRANSITION_`) REFERENCES `jbpm_transition` (`ID_`),
  CONSTRAINT `FK_LOG_VARINST` FOREIGN KEY (`VARIABLEINSTANCE_`) REFERENCES `jbpm_variableinstance` (`ID_`)
) ENGINE=InnoDB AUTO_INCREMENT=5815932 DEFAULT CHARSET=latin1;;
/*!40101 SET character_set_client = @saved_cs_client */;;
/*!40101 SET @saved_cs_client     = @@character_set_client */;;
/*!40101 SET character_set_client = utf8 */;;
CREATE TABLE `jbpm_moduledefinition` (
  `ID_` bigint(20) NOT NULL AUTO_INCREMENT,
  `CLASS_` char(1) NOT NULL,
  `NAME_` text,
  `PROCESSDEFINITION_` bigint(20) DEFAULT NULL,
  `STARTTASK_` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `FK_MODDEF_PROCDEF` (`PROCESSDEFINITION_`),
  KEY `FK_TSKDEF_START` (`STARTTASK_`),
  CONSTRAINT `FK_MODDEF_PROCDEF` FOREIGN KEY (`PROCESSDEFINITION_`) REFERENCES `jbpm_processdefinition` (`ID_`),
  CONSTRAINT `FK_TSKDEF_START` FOREIGN KEY (`STARTTASK_`) REFERENCES `jbpm_task` (`ID_`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;;
/*!40101 SET character_set_client = @saved_cs_client */;;
/*!40101 SET @saved_cs_client     = @@character_set_client */;;
/*!40101 SET character_set_client = utf8 */;;
CREATE TABLE `jbpm_moduleinstance` (
  `ID_` bigint(20) NOT NULL AUTO_INCREMENT,
  `CLASS_` char(1) NOT NULL,
  `VERSION_` int(11) NOT NULL,
  `PROCESSINSTANCE_` bigint(20) DEFAULT NULL,
  `TASKMGMTDEFINITION_` bigint(20) DEFAULT NULL,
  `NAME_` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `FK_MODINST_PRCINST` (`PROCESSINSTANCE_`),
  KEY `FK_TASKMGTINST_TMD` (`TASKMGMTDEFINITION_`),
  CONSTRAINT `FK_MODINST_PRCINST` FOREIGN KEY (`PROCESSINSTANCE_`) REFERENCES `jbpm_processinstance` (`ID_`),
  CONSTRAINT `FK_TASKMGTINST_TMD` FOREIGN KEY (`TASKMGMTDEFINITION_`) REFERENCES `jbpm_moduledefinition` (`ID_`)
) ENGINE=InnoDB AUTO_INCREMENT=1805169 DEFAULT CHARSET=latin1;;
/*!40101 SET character_set_client = @saved_cs_client */;;
/*!40101 SET @saved_cs_client     = @@character_set_client */;;
/*!40101 SET character_set_client = utf8 */;;
CREATE TABLE `jbpm_node` (
  `ID_` bigint(20) NOT NULL AUTO_INCREMENT,
  `CLASS_` char(1) NOT NULL,
  `NAME_` varchar(255) DEFAULT NULL,
  `DESCRIPTION_` text,
  `PROCESSDEFINITION_` bigint(20) DEFAULT NULL,
  `ISASYNC_` bit(1) DEFAULT NULL,
  `ISASYNCEXCL_` bit(1) DEFAULT NULL,
  `ACTION_` bigint(20) DEFAULT NULL,
  `SUPERSTATE_` bigint(20) DEFAULT NULL,
  `SUBPROCNAME_` varchar(255) DEFAULT NULL,
  `SUBPROCESSDEFINITION_` bigint(20) DEFAULT NULL,
  `DECISIONEXPRESSION_` varchar(255) DEFAULT NULL,
  `DECISIONDELEGATION` bigint(20) DEFAULT NULL,
  `SCRIPT_` bigint(20) DEFAULT NULL,
  `SIGNAL_` int(11) DEFAULT NULL,
  `CREATETASKS_` bit(1) DEFAULT NULL,
  `ENDTASKS_` bit(1) DEFAULT NULL,
  `NODECOLLECTIONINDEX_` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `FK_DECISION_DELEG` (`DECISIONDELEGATION`),
  KEY `FK_NODE_PROCDEF` (`PROCESSDEFINITION_`),
  KEY `FK_NODE_ACTION` (`ACTION_`),
  KEY `FK_PROCST_SBPRCDEF` (`SUBPROCESSDEFINITION_`),
  KEY `FK_NODE_SCRIPT` (`SCRIPT_`),
  KEY `FK_NODE_SUPERSTATE` (`SUPERSTATE_`),
  CONSTRAINT `FK_DECISION_DELEG` FOREIGN KEY (`DECISIONDELEGATION`) REFERENCES `jbpm_delegation` (`ID_`),
  CONSTRAINT `FK_NODE_ACTION` FOREIGN KEY (`ACTION_`) REFERENCES `jbpm_action` (`ID_`),
  CONSTRAINT `FK_NODE_PROCDEF` FOREIGN KEY (`PROCESSDEFINITION_`) REFERENCES `jbpm_processdefinition` (`ID_`),
  CONSTRAINT `FK_NODE_SCRIPT` FOREIGN KEY (`SCRIPT_`) REFERENCES `jbpm_action` (`ID_`),
  CONSTRAINT `FK_NODE_SUPERSTATE` FOREIGN KEY (`SUPERSTATE_`) REFERENCES `jbpm_node` (`ID_`),
  CONSTRAINT `FK_PROCST_SBPRCDEF` FOREIGN KEY (`SUBPROCESSDEFINITION_`) REFERENCES `jbpm_processdefinition` (`ID_`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;;
/*!40101 SET character_set_client = @saved_cs_client */;;
/*!40101 SET @saved_cs_client     = @@character_set_client */;;
/*!40101 SET character_set_client = utf8 */;;
CREATE TABLE `jbpm_pooledactor` (
  `ID_` bigint(20) NOT NULL AUTO_INCREMENT,
  `VERSION_` int(11) NOT NULL,
  `ACTORID_` varchar(255) DEFAULT NULL,
  `SWIMLANEINSTANCE_` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `FK_POOLEDACTOR_SLI` (`SWIMLANEINSTANCE_`),
  CONSTRAINT `FK_POOLEDACTOR_SLI` FOREIGN KEY (`SWIMLANEINSTANCE_`) REFERENCES `jbpm_swimlaneinstance` (`ID_`)
) ENGINE=InnoDB AUTO_INCREMENT=956795 DEFAULT CHARSET=latin1;;
/*!40101 SET character_set_client = @saved_cs_client */;;
/*!40101 SET @saved_cs_client     = @@character_set_client */;;
/*!40101 SET character_set_client = utf8 */;;
CREATE TABLE `jbpm_processdefinition` (
  `ID_` bigint(20) NOT NULL AUTO_INCREMENT,
  `CLASS_` char(1) NOT NULL,
  `NAME_` varchar(255) DEFAULT NULL,
  `DESCRIPTION_` text,
  `VERSION_` int(11) DEFAULT NULL,
  `ISTERMINATIONIMPLICIT_` bit(1) DEFAULT NULL,
  `STARTSTATE_` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `FK_PROCDEF_STRTSTA` (`STARTSTATE_`),
  CONSTRAINT `FK_PROCDEF_STRTSTA` FOREIGN KEY (`STARTSTATE_`) REFERENCES `jbpm_node` (`ID_`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;;
/*!40101 SET character_set_client = @saved_cs_client */;;
/*!40101 SET @saved_cs_client     = @@character_set_client */;;
/*!40101 SET character_set_client = utf8 */;;
CREATE TABLE `jbpm_processinstance` (
  `ID_` bigint(20) NOT NULL AUTO_INCREMENT,
  `VERSION_` int(11) NOT NULL,
  `KEY_` varchar(255) DEFAULT NULL,
  `START_` datetime DEFAULT NULL,
  `END_` datetime DEFAULT NULL,
  `ISSUSPENDED_` bit(1) DEFAULT NULL,
  `PROCESSDEFINITION_` bigint(20) DEFAULT NULL,
  `ROOTTOKEN_` bigint(20) DEFAULT NULL,
  `SUPERPROCESSTOKEN_` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `FK_PROCIN_PROCDEF` (`PROCESSDEFINITION_`),
  KEY `FK_PROCIN_ROOTTKN` (`ROOTTOKEN_`),
  KEY `FK_PROCIN_SPROCTKN` (`SUPERPROCESSTOKEN_`),
  CONSTRAINT `FK_PROCIN_PROCDEF` FOREIGN KEY (`PROCESSDEFINITION_`) REFERENCES `jbpm_processdefinition` (`ID_`),
  CONSTRAINT `FK_PROCIN_ROOTTKN` FOREIGN KEY (`ROOTTOKEN_`) REFERENCES `jbpm_token` (`ID_`),
  CONSTRAINT `FK_PROCIN_SPROCTKN` FOREIGN KEY (`SUPERPROCESSTOKEN_`) REFERENCES `jbpm_token` (`ID_`)
) ENGINE=InnoDB AUTO_INCREMENT=902587 DEFAULT CHARSET=latin1;;
/*!40101 SET character_set_client = @saved_cs_client */;;
/*!40101 SET @saved_cs_client     = @@character_set_client */;;
/*!40101 SET character_set_client = utf8 */;;
CREATE TABLE `jbpm_runtimeaction` (
  `ID_` bigint(20) NOT NULL AUTO_INCREMENT,
  `VERSION_` int(11) NOT NULL,
  `EVENTTYPE_` varchar(255) DEFAULT NULL,
  `TYPE_` char(1) DEFAULT NULL,
  `GRAPHELEMENT_` bigint(20) DEFAULT NULL,
  `PROCESSINSTANCE_` bigint(20) DEFAULT NULL,
  `ACTION_` bigint(20) DEFAULT NULL,
  `PROCESSINSTANCEINDEX_` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `FK_RTACTN_PROCINST` (`PROCESSINSTANCE_`),
  KEY `FK_RTACTN_ACTION` (`ACTION_`),
  CONSTRAINT `FK_RTACTN_ACTION` FOREIGN KEY (`ACTION_`) REFERENCES `jbpm_action` (`ID_`),
  CONSTRAINT `FK_RTACTN_PROCINST` FOREIGN KEY (`PROCESSINSTANCE_`) REFERENCES `jbpm_processinstance` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;;
/*!40101 SET character_set_client = @saved_cs_client */;;
/*!40101 SET @saved_cs_client     = @@character_set_client */;;
/*!40101 SET character_set_client = utf8 */;;
CREATE TABLE `jbpm_swimlane` (
  `ID_` bigint(20) NOT NULL AUTO_INCREMENT,
  `NAME_` varchar(255) DEFAULT NULL,
  `ACTORIDEXPRESSION_` varchar(255) DEFAULT NULL,
  `POOLEDACTORSEXPRESSION_` varchar(255) DEFAULT NULL,
  `ASSIGNMENTDELEGATION_` bigint(20) DEFAULT NULL,
  `TASKMGMTDEFINITION_` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `FK_SWL_ASSDEL` (`ASSIGNMENTDELEGATION_`),
  KEY `FK_SWL_TSKMGMTDEF` (`TASKMGMTDEFINITION_`),
  CONSTRAINT `FK_SWL_ASSDEL` FOREIGN KEY (`ASSIGNMENTDELEGATION_`) REFERENCES `jbpm_delegation` (`ID_`),
  CONSTRAINT `FK_SWL_TSKMGMTDEF` FOREIGN KEY (`TASKMGMTDEFINITION_`) REFERENCES `jbpm_moduledefinition` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;;
/*!40101 SET character_set_client = @saved_cs_client */;;
/*!40101 SET @saved_cs_client     = @@character_set_client */;;
/*!40101 SET character_set_client = utf8 */;;
CREATE TABLE `jbpm_swimlaneinstance` (
  `ID_` bigint(20) NOT NULL AUTO_INCREMENT,
  `VERSION_` int(11) NOT NULL,
  `NAME_` varchar(255) DEFAULT NULL,
  `ACTORID_` varchar(255) DEFAULT NULL,
  `SWIMLANE_` bigint(20) DEFAULT NULL,
  `TASKMGMTINSTANCE_` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `FK_SWIMLANEINST_TM` (`TASKMGMTINSTANCE_`),
  KEY `FK_SWIMLANEINST_SL` (`SWIMLANE_`),
  CONSTRAINT `FK_SWIMLANEINST_SL` FOREIGN KEY (`SWIMLANE_`) REFERENCES `jbpm_swimlane` (`ID_`),
  CONSTRAINT `FK_SWIMLANEINST_TM` FOREIGN KEY (`TASKMGMTINSTANCE_`) REFERENCES `jbpm_moduleinstance` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;;
/*!40101 SET character_set_client = @saved_cs_client */;;
/*!40101 SET @saved_cs_client     = @@character_set_client */;;
/*!40101 SET character_set_client = utf8 */;;
CREATE TABLE `jbpm_task` (
  `ID_` bigint(20) NOT NULL AUTO_INCREMENT,
  `NAME_` varchar(255) DEFAULT NULL,
  `DESCRIPTION_` text,
  `PROCESSDEFINITION_` bigint(20) DEFAULT NULL,
  `ISBLOCKING_` bit(1) DEFAULT NULL,
  `ISSIGNALLING_` bit(1) DEFAULT NULL,
  `CONDITION_` varchar(255) DEFAULT NULL,
  `DUEDATE_` varchar(255) DEFAULT NULL,
  `PRIORITY_` int(11) DEFAULT NULL,
  `ACTORIDEXPRESSION_` varchar(255) DEFAULT NULL,
  `POOLEDACTORSEXPRESSION_` varchar(255) DEFAULT NULL,
  `TASKMGMTDEFINITION_` bigint(20) DEFAULT NULL,
  `TASKNODE_` bigint(20) DEFAULT NULL,
  `STARTSTATE_` bigint(20) DEFAULT NULL,
  `ASSIGNMENTDELEGATION_` bigint(20) DEFAULT NULL,
  `SWIMLANE_` bigint(20) DEFAULT NULL,
  `TASKCONTROLLER_` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `FK_TASK_STARTST` (`STARTSTATE_`),
  KEY `FK_TASK_PROCDEF` (`PROCESSDEFINITION_`),
  KEY `FK_TASK_ASSDEL` (`ASSIGNMENTDELEGATION_`),
  KEY `FK_TASK_SWIMLANE` (`SWIMLANE_`),
  KEY `FK_TASK_TASKNODE` (`TASKNODE_`),
  KEY `FK_TASK_TASKMGTDEF` (`TASKMGMTDEFINITION_`),
  KEY `FK_TSK_TSKCTRL` (`TASKCONTROLLER_`),
  CONSTRAINT `FK_TASK_ASSDEL` FOREIGN KEY (`ASSIGNMENTDELEGATION_`) REFERENCES `jbpm_delegation` (`ID_`),
  CONSTRAINT `FK_TASK_PROCDEF` FOREIGN KEY (`PROCESSDEFINITION_`) REFERENCES `jbpm_processdefinition` (`ID_`),
  CONSTRAINT `FK_TASK_STARTST` FOREIGN KEY (`STARTSTATE_`) REFERENCES `jbpm_node` (`ID_`),
  CONSTRAINT `FK_TASK_SWIMLANE` FOREIGN KEY (`SWIMLANE_`) REFERENCES `jbpm_swimlane` (`ID_`),
  CONSTRAINT `FK_TASK_TASKMGTDEF` FOREIGN KEY (`TASKMGMTDEFINITION_`) REFERENCES `jbpm_moduledefinition` (`ID_`),
  CONSTRAINT `FK_TASK_TASKNODE` FOREIGN KEY (`TASKNODE_`) REFERENCES `jbpm_node` (`ID_`),
  CONSTRAINT `FK_TSK_TSKCTRL` FOREIGN KEY (`TASKCONTROLLER_`) REFERENCES `jbpm_taskcontroller` (`ID_`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;;
/*!40101 SET character_set_client = @saved_cs_client */;;
/*!40101 SET @saved_cs_client     = @@character_set_client */;;
/*!40101 SET character_set_client = utf8 */;;
CREATE TABLE `jbpm_taskactorpool` (
  `TASKINSTANCE_` bigint(20) NOT NULL,
  `POOLEDACTOR_` bigint(20) NOT NULL,
  PRIMARY KEY (`TASKINSTANCE_`,`POOLEDACTOR_`),
  KEY `FK_TASKACTPL_TSKI` (`TASKINSTANCE_`),
  KEY `FK_TSKACTPOL_PLACT` (`POOLEDACTOR_`),
  CONSTRAINT `FK_TASKACTPL_TSKI` FOREIGN KEY (`TASKINSTANCE_`) REFERENCES `jbpm_taskinstance` (`ID_`),
  CONSTRAINT `FK_TSKACTPOL_PLACT` FOREIGN KEY (`POOLEDACTOR_`) REFERENCES `jbpm_pooledactor` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;;
/*!40101 SET character_set_client = @saved_cs_client */;;
/*!40101 SET @saved_cs_client     = @@character_set_client */;;
/*!40101 SET character_set_client = utf8 */;;
CREATE TABLE `jbpm_taskcontroller` (
  `ID_` bigint(20) NOT NULL AUTO_INCREMENT,
  `TASKCONTROLLERDELEGATION_` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `FK_TSKCTRL_DELEG` (`TASKCONTROLLERDELEGATION_`),
  CONSTRAINT `FK_TSKCTRL_DELEG` FOREIGN KEY (`TASKCONTROLLERDELEGATION_`) REFERENCES `jbpm_delegation` (`ID_`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;;
/*!40101 SET character_set_client = @saved_cs_client */;;
/*!40101 SET @saved_cs_client     = @@character_set_client */;;
/*!40101 SET character_set_client = utf8 */;;
CREATE TABLE `jbpm_taskinstance` (
  `ID_` bigint(20) NOT NULL AUTO_INCREMENT,
  `CLASS_` char(1) NOT NULL,
  `VERSION_` int(11) NOT NULL,
  `NAME_` varchar(255) DEFAULT NULL,
  `DESCRIPTION_` text,
  `ACTORID_` varchar(255) DEFAULT NULL,
  `CREATE_` datetime DEFAULT NULL,
  `START_` datetime DEFAULT NULL,
  `END_` datetime DEFAULT NULL,
  `DUEDATE_` datetime DEFAULT NULL,
  `PRIORITY_` int(11) DEFAULT NULL,
  `ISCANCELLED_` bit(1) DEFAULT NULL,
  `ISSUSPENDED_` bit(1) DEFAULT NULL,
  `ISOPEN_` bit(1) DEFAULT NULL,
  `ISSIGNALLING_` bit(1) DEFAULT NULL,
  `ISBLOCKING_` bit(1) DEFAULT NULL,
  `TASK_` bigint(20) DEFAULT NULL,
  `TOKEN_` bigint(20) DEFAULT NULL,
  `PROCINST_` bigint(20) DEFAULT NULL,
  `SWIMLANINSTANCE_` bigint(20) DEFAULT NULL,
  `TASKMGMTINSTANCE_` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `FK_TSKINS_PRCINS` (`PROCINST_`),
  KEY `FK_TASKINST_TMINST` (`TASKMGMTINSTANCE_`),
  KEY `FK_TASKINST_TOKEN` (`TOKEN_`),
  KEY `FK_TASKINST_SLINST` (`SWIMLANINSTANCE_`),
  KEY `FK_TASKINST_TASK` (`TASK_`),
  CONSTRAINT `FK_TASKINST_SLINST` FOREIGN KEY (`SWIMLANINSTANCE_`) REFERENCES `jbpm_swimlaneinstance` (`ID_`),
  CONSTRAINT `FK_TASKINST_TASK` FOREIGN KEY (`TASK_`) REFERENCES `jbpm_task` (`ID_`),
  CONSTRAINT `FK_TASKINST_TMINST` FOREIGN KEY (`TASKMGMTINSTANCE_`) REFERENCES `jbpm_moduleinstance` (`ID_`),
  CONSTRAINT `FK_TASKINST_TOKEN` FOREIGN KEY (`TOKEN_`) REFERENCES `jbpm_token` (`ID_`),
  CONSTRAINT `FK_TSKINS_PRCINS` FOREIGN KEY (`PROCINST_`) REFERENCES `jbpm_processinstance` (`ID_`)
) ENGINE=InnoDB AUTO_INCREMENT=956796 DEFAULT CHARSET=latin1;;
/*!40101 SET character_set_client = @saved_cs_client */;;
/*!40101 SET @saved_cs_client     = @@character_set_client */;;
/*!40101 SET character_set_client = utf8 */;;
CREATE TABLE `jbpm_token` (
  `ID_` bigint(20) NOT NULL AUTO_INCREMENT,
  `VERSION_` int(11) NOT NULL,
  `NAME_` varchar(255) DEFAULT NULL,
  `START_` datetime DEFAULT NULL,
  `END_` datetime DEFAULT NULL,
  `NODEENTER_` datetime DEFAULT NULL,
  `NEXTLOGINDEX_` int(11) DEFAULT NULL,
  `ISABLETOREACTIVATEPARENT_` bit(1) DEFAULT NULL,
  `ISTERMINATIONIMPLICIT_` bit(1) DEFAULT NULL,
  `ISSUSPENDED_` bit(1) DEFAULT NULL,
  `LOCK_` varchar(255) DEFAULT NULL,
  `NODE_` bigint(20) DEFAULT NULL,
  `PROCESSINSTANCE_` bigint(20) DEFAULT NULL,
  `PARENT_` bigint(20) DEFAULT NULL,
  `SUBPROCESSINSTANCE_` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `FK_TOKEN_SUBPI` (`SUBPROCESSINSTANCE_`),
  KEY `FK_TOKEN_PROCINST` (`PROCESSINSTANCE_`),
  KEY `FK_TOKEN_NODE` (`NODE_`),
  KEY `FK_TOKEN_PARENT` (`PARENT_`),
  CONSTRAINT `FK_TOKEN_NODE` FOREIGN KEY (`NODE_`) REFERENCES `jbpm_node` (`ID_`),
  CONSTRAINT `FK_TOKEN_PARENT` FOREIGN KEY (`PARENT_`) REFERENCES `jbpm_token` (`ID_`),
  CONSTRAINT `FK_TOKEN_PROCINST` FOREIGN KEY (`PROCESSINSTANCE_`) REFERENCES `jbpm_processinstance` (`ID_`),
  CONSTRAINT `FK_TOKEN_SUBPI` FOREIGN KEY (`SUBPROCESSINSTANCE_`) REFERENCES `jbpm_processinstance` (`ID_`)
) ENGINE=InnoDB AUTO_INCREMENT=975610 DEFAULT CHARSET=latin1;;
/*!40101 SET character_set_client = @saved_cs_client */;;
/*!40101 SET @saved_cs_client     = @@character_set_client */;;
/*!40101 SET character_set_client = utf8 */;;
CREATE TABLE `jbpm_tokenvariablemap` (
  `ID_` bigint(20) NOT NULL AUTO_INCREMENT,
  `VERSION_` int(11) NOT NULL,
  `TOKEN_` bigint(20) DEFAULT NULL,
  `CONTEXTINSTANCE_` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `FK_TKVARMAP_TOKEN` (`TOKEN_`),
  KEY `FK_TKVARMAP_CTXT` (`CONTEXTINSTANCE_`),
  CONSTRAINT `FK_TKVARMAP_CTXT` FOREIGN KEY (`CONTEXTINSTANCE_`) REFERENCES `jbpm_moduleinstance` (`ID_`),
  CONSTRAINT `FK_TKVARMAP_TOKEN` FOREIGN KEY (`TOKEN_`) REFERENCES `jbpm_token` (`ID_`)
) ENGINE=InnoDB AUTO_INCREMENT=902585 DEFAULT CHARSET=latin1;;
/*!40101 SET character_set_client = @saved_cs_client */;;
/*!40101 SET @saved_cs_client     = @@character_set_client */;;
/*!40101 SET character_set_client = utf8 */;;
CREATE TABLE `jbpm_transition` (
  `ID_` bigint(20) NOT NULL AUTO_INCREMENT,
  `NAME_` varchar(255) DEFAULT NULL,
  `DESCRIPTION_` text,
  `PROCESSDEFINITION_` bigint(20) DEFAULT NULL,
  `FROM_` bigint(20) DEFAULT NULL,
  `TO_` bigint(20) DEFAULT NULL,
  `CONDITION_` varchar(255) DEFAULT NULL,
  `FROMINDEX_` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `FK_TRANSITION_FROM` (`FROM_`),
  KEY `FK_TRANS_PROCDEF` (`PROCESSDEFINITION_`),
  KEY `FK_TRANSITION_TO` (`TO_`),
  CONSTRAINT `FK_TRANSITION_FROM` FOREIGN KEY (`FROM_`) REFERENCES `jbpm_node` (`ID_`),
  CONSTRAINT `FK_TRANSITION_TO` FOREIGN KEY (`TO_`) REFERENCES `jbpm_node` (`ID_`),
  CONSTRAINT `FK_TRANS_PROCDEF` FOREIGN KEY (`PROCESSDEFINITION_`) REFERENCES `jbpm_processdefinition` (`ID_`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=latin1;;
/*!40101 SET character_set_client = @saved_cs_client */;;
/*!40101 SET @saved_cs_client     = @@character_set_client */;;
/*!40101 SET character_set_client = utf8 */;;
CREATE TABLE `jbpm_variableaccess` (
  `ID_` bigint(20) NOT NULL AUTO_INCREMENT,
  `VARIABLENAME_` varchar(255) DEFAULT NULL,
  `ACCESS_` varchar(255) DEFAULT NULL,
  `MAPPEDNAME_` varchar(255) DEFAULT NULL,
  `PROCESSSTATE_` bigint(20) DEFAULT NULL,
  `TASKCONTROLLER_` bigint(20) DEFAULT NULL,
  `INDEX_` int(11) DEFAULT NULL,
  `SCRIPT_` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `FK_VARACC_PROCST` (`PROCESSSTATE_`),
  KEY `FK_VARACC_SCRIPT` (`SCRIPT_`),
  KEY `FK_VARACC_TSKCTRL` (`TASKCONTROLLER_`),
  CONSTRAINT `FK_VARACC_PROCST` FOREIGN KEY (`PROCESSSTATE_`) REFERENCES `jbpm_node` (`ID_`),
  CONSTRAINT `FK_VARACC_SCRIPT` FOREIGN KEY (`SCRIPT_`) REFERENCES `jbpm_action` (`ID_`),
  CONSTRAINT `FK_VARACC_TSKCTRL` FOREIGN KEY (`TASKCONTROLLER_`) REFERENCES `jbpm_taskcontroller` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;;
/*!40101 SET character_set_client = @saved_cs_client */;;
/*!40101 SET @saved_cs_client     = @@character_set_client */;;
/*!40101 SET character_set_client = utf8 */;;
CREATE TABLE `jbpm_variableinstance` (
  `ID_` bigint(20) NOT NULL AUTO_INCREMENT,
  `CLASS_` char(1) NOT NULL,
  `VERSION_` int(11) NOT NULL,
  `NAME_` varchar(255) DEFAULT NULL,
  `CONVERTER_` char(1) DEFAULT NULL,
  `TOKEN_` bigint(20) DEFAULT NULL,
  `TOKENVARIABLEMAP_` bigint(20) DEFAULT NULL,
  `PROCESSINSTANCE_` bigint(20) DEFAULT NULL,
  `BYTEARRAYVALUE_` bigint(20) DEFAULT NULL,
  `DATEVALUE_` datetime DEFAULT NULL,
  `DOUBLEVALUE_` double DEFAULT NULL,
  `LONGIDCLASS_` varchar(255) DEFAULT NULL,
  `LONGVALUE_` bigint(20) DEFAULT NULL,
  `STRINGIDCLASS_` varchar(255) DEFAULT NULL,
  `STRINGVALUE_` varchar(255) DEFAULT NULL,
  `TASKINSTANCE_` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `FK_VARINST_PRCINST` (`PROCESSINSTANCE_`),
  KEY `FK_VARINST_TKVARMP` (`TOKENVARIABLEMAP_`),
  KEY `FK_VARINST_TK` (`TOKEN_`),
  KEY `FK_BYTEINST_ARRAY` (`BYTEARRAYVALUE_`),
  KEY `FK_VAR_TSKINST` (`TASKINSTANCE_`),
  CONSTRAINT `FK_BYTEINST_ARRAY` FOREIGN KEY (`BYTEARRAYVALUE_`) REFERENCES `jbpm_bytearray` (`ID_`),
  CONSTRAINT `FK_VARINST_PRCINST` FOREIGN KEY (`PROCESSINSTANCE_`) REFERENCES `jbpm_processinstance` (`ID_`),
  CONSTRAINT `FK_VARINST_TK` FOREIGN KEY (`TOKEN_`) REFERENCES `jbpm_token` (`ID_`),
  CONSTRAINT `FK_VARINST_TKVARMP` FOREIGN KEY (`TOKENVARIABLEMAP_`) REFERENCES `jbpm_tokenvariablemap` (`ID_`),
  CONSTRAINT `FK_VAR_TSKINST` FOREIGN KEY (`TASKINSTANCE_`) REFERENCES `jbpm_taskinstance` (`ID_`)
) ENGINE=InnoDB AUTO_INCREMENT=902586 DEFAULT CHARSET=latin1;;
/*!40101 SET character_set_client = @saved_cs_client */;;
/*!40101 SET @saved_cs_client     = @@character_set_client */;;
/*!40101 SET character_set_client = utf8 */;;
CREATE TABLE `karyotype` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `ploidyType` varchar(45) DEFAULT NULL,
  `notes` varchar(255) DEFAULT NULL,
  `source` varchar(255) DEFAULT NULL,
  `sexchromosomestring` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6645 DEFAULT CHARSET=latin1;;
/*!40101 SET character_set_client = @saved_cs_client */;;
/*!40101 SET @saved_cs_client     = @@character_set_client */;;
/*!40101 SET character_set_client = utf8 */;;
CREATE TABLE `karyotypeentry` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `chromosome` int(11) DEFAULT NULL,
  `chromosomecount` int(11) NOT NULL,
  `notes` varchar(255) DEFAULT NULL,
  `entries_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK622FB3C633908F0D` (`entries_id`),
  CONSTRAINT `FK622FB3C633908F0D` FOREIGN KEY (`entries_id`) REFERENCES `karyotype` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5483 DEFAULT CHARSET=latin1;;
/*!40101 SET character_set_client = @saved_cs_client */;;
SET @saved_cs_client     = @@character_set_client;;
SET character_set_client = utf8;;
/*!50001 CREATE TABLE `karyotypesummary` (
  `casefile` tinyint NOT NULL,
  `familyPosition` tinyint NOT NULL,
  `sample_id` tinyint NOT NULL,
  `samplebarcode` tinyint NOT NULL,
  `samplednabarcode` tinyint NOT NULL,
  `subject_id` tinyint NOT NULL,
  `isnormal` tinyint NOT NULL,
  `notes` tinyint NOT NULL,
  `source` tinyint NOT NULL,
  `sexchromosomestring` tinyint NOT NULL,
  `chr1_copynumber` tinyint NOT NULL,
  `chr2_copynumber` tinyint NOT NULL,
  `chr13_copynumber` tinyint NOT NULL,
  `chr18_copynumber` tinyint NOT NULL,
  `chr21_copynumber` tinyint NOT NULL,
  `chr1_notes` tinyint NOT NULL,
  `chr2_notes` tinyint NOT NULL,
  `chr13_notes` tinyint NOT NULL,
  `chr18_notes` tinyint NOT NULL,
  `chr21_notes` tinyint NOT NULL
) ENGINE=MyISAM */;;
SET character_set_client = @saved_cs_client;;
SET @saved_cs_client     = @@character_set_client;;
SET character_set_client = utf8;;
/*!50001 CREATE TABLE `karyotypesummary_persubject` (
  `casefiles` tinyint NOT NULL,
  `samplebarcodes` tinyint NOT NULL,
  `samplednabarcodes` tinyint NOT NULL,
  `subject_id` tinyint NOT NULL,
  `isnormal` tinyint NOT NULL,
  `notes` tinyint NOT NULL,
  `source` tinyint NOT NULL,
  `sexchromosomestring` tinyint NOT NULL,
  `chr1_copynumber` tinyint NOT NULL,
  `chr2_copynumber` tinyint NOT NULL,
  `chr13_copynumber` tinyint NOT NULL,
  `chr18_copynumber` tinyint NOT NULL,
  `chr21_copynumber` tinyint NOT NULL,
  `chr1_notes` tinyint NOT NULL,
  `chr2_notes` tinyint NOT NULL,
  `chr13_notes` tinyint NOT NULL,
  `chr18_notes` tinyint NOT NULL,
  `chr21_notes` tinyint NOT NULL
) ENGINE=MyISAM */;;
SET character_set_client = @saved_cs_client;;
/*!40101 SET @saved_cs_client     = @@character_set_client */;;
/*!40101 SET character_set_client = utf8 */;;
CREATE TABLE `kitreceipt` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `received` datetime DEFAULT NULL,
  `redrawn` datetime DEFAULT NULL,
  `redrawreason_id` bigint(20) DEFAULT NULL,
  `thirdpartyaccessionid` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK3D4E96A216D90E59` (`redrawreason_id`),
  CONSTRAINT `FK3D4E96A216D90E59` FOREIGN KEY (`redrawreason_id`) REFERENCES `reasoncode` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1132341 DEFAULT CHARSET=latin1;;
/*!40101 SET character_set_client = @saved_cs_client */;;
SET @saved_cs_client     = @@character_set_client;;
SET character_set_client = utf8;;
/*!50001 CREATE TABLE `kitsreceived` (
  `casefile_id` tinyint NOT NULL,
  `barcode` tinyint NOT NULL,
  `is_parentkit` tinyint NOT NULL,
  `received` tinyint NOT NULL
) ENGINE=MyISAM */;;
SET character_set_client = @saved_cs_client;;
SET @saved_cs_client     = @@character_set_client;;
SET character_set_client = utf8;;
/*!50001 CREATE TABLE `kitsummary` (
  `casefile_id` tinyint NOT NULL,
  `clinic id` tinyint NOT NULL,
  `clinic name` tinyint NOT NULL,
  `satellite id` tinyint NOT NULL,
  `satellite address` tinyint NOT NULL,
  `cfs id` tinyint NOT NULL,
  `cfs email` tinyint NOT NULL,
  `Product` tinyint NOT NULL,
  `kit barcode` tinyint NOT NULL,
  `received` tinyint NOT NULL,
  `parent kit?` tinyint NOT NULL
) ENGINE=MyISAM */;;
SET character_set_client = @saved_cs_client;;
/*!40101 SET @saved_cs_client     = @@character_set_client */;;
/*!40101 SET character_set_client = utf8 */;;
CREATE TABLE `lab` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `resultmode` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;;
/*!40101 SET character_set_client = @saved_cs_client */;;
/*!40101 SET @saved_cs_client     = @@character_set_client */;;
/*!40101 SET character_set_client = utf8 */;;
CREATE TABLE `labchipqc_lib2plate_map` (
  `l2plate_position` int(11) DEFAULT NULL,
  `labchipqcrun_position` int(11) DEFAULT NULL,
  `libplates_key` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;;
/*!40101 SET character_set_client = @saved_cs_client */;;
/*!40101 SET @saved_cs_client     = @@character_set_client */;;
/*!40101 SET character_set_client = utf8 */;;
CREATE TABLE `labchipqcrun` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `barcode` varchar(255) NOT NULL,
  `timestamp` datetime DEFAULT NULL,
  `receivedby_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `barcode` (`barcode`)
) ENGINE=InnoDB AUTO_INCREMENT=512 DEFAULT CHARSET=latin1;;
/*!40101 SET character_set_client = @saved_cs_client */;;
/*!40101 SET @saved_cs_client     = @@character_set_client */;;
/*!40101 SET character_set_client = utf8 */;;
CREATE TABLE `labchipqcrun_concentrations` (
  `LabChipQCRun_id` bigint(20) NOT NULL,
  `concentrations` double DEFAULT NULL,
  `concentrations_KEY` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`LabChipQCRun_id`,`concentrations_KEY`),
  KEY `FK_ff3f042db40342e9a53faa5be50` (`LabChipQCRun_id`),
  CONSTRAINT `FK_ff3f042db40342e9a53faa5be50` FOREIGN KEY (`LabChipQCRun_id`) REFERENCES `labchipqcrun` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;;
/*!40101 SET character_set_client = @saved_cs_client */;;
/*!40101 SET @saved_cs_client     = @@character_set_client */;;
/*!40101 SET character_set_client = utf8 */;;
CREATE TABLE `labchipqcrun_documentinfo` (
  `labChipQCRun_id` bigint(20) NOT NULL,
  `documentinfos_id` bigint(20) NOT NULL,
  PRIMARY KEY (`labChipQCRun_id`,`documentinfos_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;;
/*!40101 SET character_set_client = @saved_cs_client */;;
/*!40101 SET @saved_cs_client     = @@character_set_client */;;
/*!40101 SET character_set_client = utf8 */;;
CREATE TABLE `labchipqcrun_inventorieditem` (
  `labChipQCRun_id` bigint(20) NOT NULL,
  `reagents_id` bigint(20) NOT NULL,
  PRIMARY KEY (`labChipQCRun_id`,`reagents_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;;
/*!40101 SET character_set_client = @saved_cs_client */;;
/*!40101 SET @saved_cs_client     = @@character_set_client */;;
/*!40101 SET character_set_client = utf8 */;;
CREATE TABLE `labchipqcrun_libplates` (
  `LabChipQCRun_id` bigint(20) NOT NULL,
  `libplates` bigint(20) DEFAULT NULL,
  `libPlates_KEY` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`LabChipQCRun_id`,`libPlates_KEY`),
  KEY `FK_561e3c22f53346d082a295fa8e3` (`LabChipQCRun_id`),
  CONSTRAINT `FK_561e3c22f53346d082a295fa8e3` FOREIGN KEY (`LabChipQCRun_id`) REFERENCES `labchipqcrun` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;;
/*!40101 SET character_set_client = @saved_cs_client */;;
/*!40101 SET @saved_cs_client     = @@character_set_client */;;
/*!40101 SET character_set_client = utf8 */;;
CREATE TABLE `labeltemplate` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `suffix` varchar(255) DEFAULT NULL,
  `sequence_id` bigint(20) DEFAULT NULL,
  `labeltype` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK5BAFAB6EA54FC9F0` (`sequence_id`),
  CONSTRAINT `FK5BAFAB6EA54FC9F0` FOREIGN KEY (`sequence_id`) REFERENCES `sequence` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=latin1;;
/*!40101 SET character_set_client = @saved_cs_client */;;
/*!40101 SET @saved_cs_client     = @@character_set_client */;;
/*!40101 SET character_set_client = utf8 */;;
CREATE TABLE `labtest_diseasevariation` (
  `variation_id` bigint(20) NOT NULL,
  `disease_id` bigint(20) NOT NULL,
  PRIMARY KEY (`variation_id`,`disease_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;;
/*!40101 SET character_set_client = @saved_cs_client */;;
/*!40101 SET @saved_cs_client     = @@character_set_client */;;
/*!40101 SET character_set_client = utf8 */;;
CREATE TABLE `limstask` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `type` varchar(45) NOT NULL,
  `start` datetime DEFAULT NULL,
  `complete` datetime DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `createdby_id` bigint(20) DEFAULT NULL,
  `cancelled` bit(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `LIMSTASKUSERIDFKEY1_idx` (`user_id`),
  KEY `LIMSTASK_TYPE_INDEX` (`type`),
  CONSTRAINT `LIMSTASKUSERIDFKEY1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=215216 DEFAULT CHARSET=latin1;;
/*!40101 SET character_set_client = @saved_cs_client */;;
/*!40101 SET @saved_cs_client     = @@character_set_client */;;
/*!40101 SET character_set_client = utf8 */;;
CREATE TABLE `limstask_variables` (
  `limstask_id` bigint(20) NOT NULL,
  `name` varchar(255) NOT NULL,
  `value` varchar(255) NOT NULL,
  KEY `LIMSTASKVARTASKIDFK1_idx` (`limstask_id`),
  CONSTRAINT `LIMSTASKVARTASKIDFK1` FOREIGN KEY (`limstask_id`) REFERENCES `limstask` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;;
/*!40101 SET character_set_client = @saved_cs_client */;;
/*!40101 SET @saved_cs_client     = @@character_set_client */;;
/*!40101 SET character_set_client = utf8 */;;
CREATE TABLE `liquibase_test_table1` (
  `id` int(11) DEFAULT NULL,
  `column1` varchar(100) DEFAULT NULL,
  `column2` varchar(100) DEFAULT NULL,
  `column3` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;;
/*!40101 SET character_set_client = @saved_cs_client */;;
/*!40101 SET @saved_cs_client     = @@character_set_client */;;
/*!40101 SET character_set_client = utf8 */;;
CREATE TABLE `mi_report` (
  `REPORT_DATE` date DEFAULT NULL,
  `CASE_FILE_ID` bigint(20) DEFAULT NULL,
  `Clinic Case ID` varchar(255) DEFAULT NULL,
  `White Gloved` varchar(255) DEFAULT NULL,
  `Clinic Name` varchar(255) DEFAULT NULL,
  `Clinic ID` int(11) DEFAULT NULL,
  `Test Type` varchar(255) DEFAULT NULL,
  `Missing Info` text,
  `Dashboard Note` varchar(255) DEFAULT NULL,
  `Case Category` text,
  `Case Opened` datetime DEFAULT NULL,
  `Kit Barcode` varchar(255) DEFAULT NULL,
  `Kit State` varchar(255) DEFAULT NULL,
  `Kit TAT` varchar(255) DEFAULT NULL,
  `Kit Received Date` varchar(255) DEFAULT NULL,
  `Patient First Name Missing` varchar(255) DEFAULT NULL,
  `Patient Last Name Missing` varchar(255) DEFAULT NULL,
  `Kit marked for Redraw` varchar(255) DEFAULT NULL,
  `Delivery destination missing` varchar(255) DEFAULT NULL,
  `Review Required` varchar(255) DEFAULT NULL,
  `Case on Hold` varchar(255) DEFAULT NULL,
  `Clinic missing or not valid` varchar(255) DEFAULT NULL,
  `Historic pricing plan not defined` varchar(255) DEFAULT NULL,
  `Bill-to type is not defined for pricing plan` varchar(255) DEFAULT NULL,
  `Microdel Ordered but clinic not enabled` varchar(255) DEFAULT NULL,
  `Egg donor used` varchar(255) DEFAULT NULL,
  `Missing Insurance` varchar(255) DEFAULT NULL,
  `Missing payment Information` varchar(255) DEFAULT NULL,
  `Mother Microdeletion Carrier` varchar(255) DEFAULT NULL,
  `Multiple Pregnancy` varchar(255) DEFAULT NULL,
  `Patient not pregnant / Pregnancy not answered` varchar(255) DEFAULT NULL,
  `Missing Canadian Waiver` varchar(255) DEFAULT NULL,
  `Report Gender Issue(Case says report Gender, clinic says No)` varchar(255) DEFAULT NULL,
  `Surrogate Used` varchar(255) DEFAULT NULL,
  `Patient Date of Birth missing/has issues` varchar(255) DEFAULT NULL,
  `Patient address (or component) missing` varchar(255) DEFAULT NULL,
  `Physician or Signature missing` varchar(255) DEFAULT NULL,
  `Physician last name missing` varchar(255) DEFAULT NULL,
  `Gestational Age Invalid/Missing` varchar(255) DEFAULT NULL,
  `No ICD Code` varchar(255) DEFAULT NULL,
  `Referral handwritten` varchar(255) DEFAULT NULL,
  `Parent kit has null receive date` varchar(255) DEFAULT NULL,
  `Patient sample collection date issue` varchar(255) DEFAULT NULL,
  `Child sample collection date issue` varchar(255) DEFAULT NULL,
  `Verify test order` varchar(255) DEFAULT NULL,
  `Identifier discrepancy` varchar(255) DEFAULT NULL,
  `Sample discrepancy` varchar(255) DEFAULT NULL,
  `Missing father sample` varchar(255) DEFAULT NULL,
  `Non-readable` varchar(255) DEFAULT NULL,
  `No HL7 case - creating HL7` varchar(255) DEFAULT NULL,
  `Other hold reason` varchar(255) DEFAULT NULL,
  `LIMS link` varchar(255) DEFAULT NULL,
  `Orders link` varchar(255) DEFAULT NULL,
  `Generic Hold` varchar(255) DEFAULT NULL,
  KEY `Clinic ID` (`Clinic ID`),
  KEY `IDX_CaseID` (`CASE_FILE_ID`),
  KEY `IDX_Date` (`REPORT_DATE`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;;
/*!40101 SET character_set_client = @saved_cs_client */;;
/*!40101 SET @saved_cs_client     = @@character_set_client */;;
/*!40101 SET character_set_client = utf8 */;;
CREATE TABLE `microdelevaluatedsubdel` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `oanr` double DEFAULT NULL,
  `oapr` double DEFAULT NULL,
  `endpoint` double DEFAULT NULL,
  `evaluatedsource` int(11) DEFAULT NULL,
  `reportdeletion` bit(1) NOT NULL,
  `startpoint` double DEFAULT NULL,
  `version` int(11) NOT NULL,
  `combinedresult_id` bigint(20) DEFAULT NULL,
  `subdeletion_id` bigint(20) DEFAULT NULL,
  `microdelhetrateresult_id` bigint(20) NOT NULL,
  `overrideresult_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK6DC07EAF430F4B38` (`combinedresult_id`),
  KEY `FK6DC07EAFCF95D7D5` (`subdeletion_id`),
  KEY `FKMICRODELHETRATERESULT` (`microdelhetrateresult_id`),
  KEY `FKMICRODELOVERRIDERESULT` (`overrideresult_id`),
  CONSTRAINT `FK6DC07EAF430F4B38` FOREIGN KEY (`combinedresult_id`) REFERENCES `alg_combinedresult` (`id`),
  CONSTRAINT `FK6DC07EAFCF95D7D5` FOREIGN KEY (`subdeletion_id`) REFERENCES `microdelsubdeletion` (`id`),
  CONSTRAINT `microdelevaluatedsubdel_ibfk_1` FOREIGN KEY (`microdelhetrateresult_id`) REFERENCES `alg_microdelhetrateresult` (`id`),
  CONSTRAINT `microdelevaluatedsubdel_ibfk_2` FOREIGN KEY (`overrideresult_id`) REFERENCES `alg_overrideresultmicrodel` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;;
/*!40101 SET character_set_client = @saved_cs_client */;;
/*!40101 SET @saved_cs_client     = @@character_set_client */;;
/*!40101 SET character_set_client = utf8 */;;
CREATE TABLE `microdelsubdeletion` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `chromosomeregion` varchar(255) NOT NULL,
  `clinicalpositive` bit(1) NOT NULL,
  `detectionrate` double NOT NULL,
  `endrangeend` double NOT NULL,
  `endrangestart` double NOT NULL,
  `falsepositiverate` double NOT NULL,
  `incidencerate` double NOT NULL,
  `isactive` bit(1) NOT NULL,
  `minsize` double NOT NULL,
  `source` varchar(255) NOT NULL,
  `startrangeend` double NOT NULL,
  `startrangestart` double NOT NULL,
  `subsyndromename` varchar(255) NOT NULL,
  `version` int(11) NOT NULL,
  `cfestart` double NOT NULL,
  `cfeend` double NOT NULL,
  `OAPR` double NOT NULL,
  `isReportable` bit(1) DEFAULT b'1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;;
/*!40101 SET character_set_client = @saved_cs_client */;;
/*!40101 SET @saved_cs_client     = @@character_set_client */;;
/*!40101 SET character_set_client = utf8 */;;
CREATE TABLE `note` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `body` longtext,
  `subject` varchar(255) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK252412550BB1D1` (`user_id`),
  CONSTRAINT `FK252412550BB1D1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4612566 DEFAULT CHARSET=latin1;;
/*!40101 SET character_set_client = @saved_cs_client */;;
/*!40101 SET @saved_cs_client     = @@character_set_client */;;
/*!40101 SET character_set_client = utf8 */;;
CREATE TABLE `note_documentinfo` (
  `Note_id` bigint(20) NOT NULL,
  `attachments_id` bigint(20) NOT NULL,
  UNIQUE KEY `attachments_id` (`attachments_id`),
  UNIQUE KEY `UK_e6d2c196571542b68562bde291e` (`attachments_id`),
  KEY `FK6A83EB96DCB6EC71` (`Note_id`),
  KEY `FK6A83EB963CB5D6A` (`attachments_id`),
  CONSTRAINT `FK6A83EB963CB5D6A` FOREIGN KEY (`attachments_id`) REFERENCES `documentinfo` (`id`),
  CONSTRAINT `FK6A83EB96DCB6EC71` FOREIGN KEY (`Note_id`) REFERENCES `note` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;;
/*!40101 SET character_set_client = @saved_cs_client */;;
/*!40101 SET @saved_cs_client     = @@character_set_client */;;
/*!40101 SET character_set_client = utf8 */;;
CREATE TABLE `npd_barcodedplate` (
  `DTYPE` varchar(31) NOT NULL,
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `barcode` varchar(255) NOT NULL,
  `state` varchar(255) DEFAULT NULL,
  `transferredfromplate_id` bigint(20) DEFAULT NULL,
  `bluntendrepairstarttime` datetime DEFAULT NULL,
  `bluntendrepairendtime` datetime DEFAULT NULL,
  `atailingstarttime` datetime DEFAULT NULL,
  `atailingendtime` datetime DEFAULT NULL,
  `ligationstarttime` datetime DEFAULT NULL,
  `ligationendtime` datetime DEFAULT NULL,
  `amplificationstarttime` datetime DEFAULT NULL,
  `amplificationendtime` datetime DEFAULT NULL,
  `minipcrstarttime` datetime DEFAULT NULL,
  `minipcrendtime` datetime DEFAULT NULL,
  `barcodingpcrstarttime` datetime DEFAULT NULL,
  `barcodingpcrendtime` datetime DEFAULT NULL,
  `concentration` double DEFAULT NULL,
  `flowcellbarcode` varchar(255) DEFAULT NULL,
  `runfolder` varchar(255) DEFAULT NULL,
  `experiment` varchar(255) DEFAULT NULL,
  `experimentdate` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `barcode` (`barcode`),
  KEY `FKB000CB15C12B023A` (`transferredfromplate_id`),
  CONSTRAINT `FKB000CB15C12B023A` FOREIGN KEY (`transferredfromplate_id`) REFERENCES `npd_barcodedplate` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;;
/*!40101 SET character_set_client = @saved_cs_client */;;
/*!40101 SET @saved_cs_client     = @@character_set_client */;;
/*!40101 SET character_set_client = utf8 */;;
CREATE TABLE `npd_barcodedplate_inventorieditem` (
  `npd_barcodedplate_id` bigint(20) NOT NULL,
  `reagents_id` bigint(20) NOT NULL,
  PRIMARY KEY (`npd_barcodedplate_id`,`reagents_id`),
  KEY `FKF85E9354E71F8F2B` (`reagents_id`),
  KEY `FKF85E93547798546B` (`npd_barcodedplate_id`),
  CONSTRAINT `FKF85E93547798546B` FOREIGN KEY (`npd_barcodedplate_id`) REFERENCES `npd_barcodedplate` (`id`),
  CONSTRAINT `FKF85E9354E71F8F2B` FOREIGN KEY (`reagents_id`) REFERENCES `inventorieditem` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;;
/*!40101 SET character_set_client = @saved_cs_client */;;
/*!40101 SET @saved_cs_client     = @@character_set_client */;;
/*!40101 SET character_set_client = utf8 */;;
CREATE TABLE `npd_barcodedplate_npd_barcodedsample` (
  `npd_barcodedplate_id` bigint(20) NOT NULL,
  `wells_id` bigint(20) NOT NULL,
  `position` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`npd_barcodedplate_id`,`position`),
  KEY `FK4C1FB6F57798546B` (`npd_barcodedplate_id`),
  KEY `FK4C1FB6F588F76B0F` (`wells_id`),
  CONSTRAINT `FK4C1FB6F57798546B` FOREIGN KEY (`npd_barcodedplate_id`) REFERENCES `npd_barcodedplate` (`id`),
  CONSTRAINT `FK4C1FB6F588F76B0F` FOREIGN KEY (`wells_id`) REFERENCES `npd_barcodedsample` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;;
/*!40101 SET character_set_client = @saved_cs_client */;;
/*!40101 SET @saved_cs_client     = @@character_set_client */;;
/*!40101 SET character_set_client = utf8 */;;
CREATE TABLE `npd_barcodedsample` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `barcodesequence` varchar(255) DEFAULT NULL,
  `sample_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK54A1858BD50BCD23` (`sample_id`),
  CONSTRAINT `FK54A1858BD50BCD23` FOREIGN KEY (`sample_id`) REFERENCES `sample` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=65 DEFAULT CHARSET=latin1;;
/*!40101 SET character_set_client = @saved_cs_client */;;
/*!40101 SET @saved_cs_client     = @@character_set_client */;;
/*!40101 SET character_set_client = utf8 */;;
CREATE TABLE `npd_barcodesequence` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `wellpositionindex` int(11) NOT NULL,
  `sequence` varchar(255) NOT NULL,
  `groupkey` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=402 DEFAULT CHARSET=latin1;;
/*!40101 SET character_set_client = @saved_cs_client */;;
/*!40101 SET @saved_cs_client     = @@character_set_client */;;
/*!40101 SET character_set_client = utf8 */;;
CREATE TABLE `npt_barcodingprimerplatetemplate` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `barcode` varchar(255) NOT NULL,
  `state` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `sortorder` bigint(20) NOT NULL,
  `inuse` bit(1) NOT NULL DEFAULT b'1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `barcode` (`barcode`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;;
/*!40101 SET character_set_client = @saved_cs_client */;;
/*!40101 SET @saved_cs_client     = @@character_set_client */;;
/*!40101 SET character_set_client = utf8 */;;
CREATE TABLE `npt_barcodingprimerplatetemplate_sequencingbarcode` (
  `npt_barcodingprimerplatetemplate_id` bigint(20) NOT NULL,
  `wells_id` bigint(20) NOT NULL,
  `position` int(11) NOT NULL,
  PRIMARY KEY (`npt_barcodingprimerplatetemplate_id`,`position`),
  KEY `FKE7E00EF0BF34A6D5` (`npt_barcodingprimerplatetemplate_id`),
  KEY `FKE7E00EF0225089C4` (`wells_id`),
  CONSTRAINT `FKE7E00EF0225089C4` FOREIGN KEY (`wells_id`) REFERENCES `hts`.`sequencingbarcode` (`id`),
  CONSTRAINT `FKE7E00EF0BF34A6D5` FOREIGN KEY (`npt_barcodingprimerplatetemplate_id`) REFERENCES `npt_barcodingprimerplatetemplate` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;;
/*!40101 SET character_set_client = @saved_cs_client */;;
/*!40101 SET @saved_cs_client     = @@character_set_client */;;
/*!40101 SET character_set_client = utf8 */;;
CREATE TABLE `npt_gcnotes` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `note` varchar(512) DEFAULT NULL,
  `npthandcallresult_id` bigint(20) DEFAULT NULL,
  `npthandcallmicrodelresult_id` bigint(20) DEFAULT NULL,
  `customSummary` longtext,
  `customSummaryUsed` bit(1) NOT NULL DEFAULT b'0',
  PRIMARY KEY (`id`),
  KEY `FK8DCC2B18F093D71C` (`npthandcallresult_id`),
  CONSTRAINT `FK8DCC2B18F093D71C` FOREIGN KEY (`npthandcallresult_id`) REFERENCES `npt_handcall_result` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=206307 DEFAULT CHARSET=latin1;;
/*!40101 SET character_set_client = @saved_cs_client */;;
/*!40101 SET @saved_cs_client     = @@character_set_client */;;
/*!40101 SET character_set_client = utf8 */;;
CREATE TABLE `npt_handcall_microdel_result` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `escalated` bit(1) DEFAULT NULL,
  `handcalled_date` datetime DEFAULT NULL,
  `handcaller_notes` varchar(255) DEFAULT NULL,
  `handcall_complete` bit(1) NOT NULL,
  `no_call` bit(1) NOT NULL,
  `no_call_reason` varchar(255) DEFAULT NULL,
  `result_code` varchar(255) DEFAULT NULL,
  `result_locked` bit(1) NOT NULL,
  `handcalledby_id` bigint(20) DEFAULT NULL,
  `npt_handcall_result` bigint(20) DEFAULT NULL,
  `regions_included` varchar(255) DEFAULT NULL,
  `prader_willi_angelman_origin` varchar(255) DEFAULT NULL,
  `has_sizing_results` bit(1) DEFAULT b'0',
  `projectid` varchar(50) DEFAULT NULL,
  `jobid` varchar(50) DEFAULT NULL,
  `resultsFromConstellation` bit(1) NOT NULL DEFAULT b'0',
  PRIMARY KEY (`id`),
  KEY `npt_handcall_result` (`npt_handcall_result`),
  KEY `handcalledby_id` (`handcalledby_id`),
  CONSTRAINT `npt_handcall_microdel_result_ibfk_1` FOREIGN KEY (`npt_handcall_result`) REFERENCES `npt_handcall_result` (`id`),
  CONSTRAINT `npt_handcall_microdel_result_ibfk_2` FOREIGN KEY (`handcalledby_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=401087 DEFAULT CHARSET=latin1;;
/*!40101 SET character_set_client = @saved_cs_client */;;
/*!40101 SET @saved_cs_client     = @@character_set_client */;;
/*!40101 SET character_set_client = utf8 */;;
CREATE TABLE `npt_handcall_microdel_result_alg_probabilityofdata` (
  `handcallmicrodelresults_id` bigint(20) NOT NULL,
  `results_id` bigint(20) NOT NULL,
  `results_KEY` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`handcallmicrodelresults_id`,`results_KEY`),
  KEY `FK8ACB7BE44D20C29D` (`handcallmicrodelresults_id`),
  KEY `FK8ACB7BE4CE52335C` (`results_id`),
  CONSTRAINT `FK8ACB7BE44D20C29D` FOREIGN KEY (`handcallmicrodelresults_id`) REFERENCES `npt_handcall_microdel_result` (`id`),
  CONSTRAINT `FK8ACB7BE4CE52335C` FOREIGN KEY (`results_id`) REFERENCES `alg_probabilityofdata` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;;
/*!40101 SET character_set_client = @saved_cs_client */;;
/*!40101 SET @saved_cs_client     = @@character_set_client */;;
/*!40101 SET character_set_client = utf8 */;;
CREATE TABLE `npt_handcall_microdel_result_microdelevaluatedsubdel` (
  `npt_handcall_microdel_result_id` bigint(20) NOT NULL,
  `subdeletions_id` bigint(20) NOT NULL,
  `subdeletions_KEY` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`npt_handcall_microdel_result_id`,`subdeletions_KEY`),
  KEY `FK8ACNPTHCMRESULTSID` (`npt_handcall_microdel_result_id`),
  KEY `FK8ACB7BRERSULTSID` (`subdeletions_id`),
  CONSTRAINT `FK8ACBNPTHCMDELEVALSUBDEL` FOREIGN KEY (`subdeletions_id`) REFERENCES `microdelevaluatedsubdel` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK8ACBNPTHCMICRODELRESULT` FOREIGN KEY (`npt_handcall_microdel_result_id`) REFERENCES `npt_handcall_microdel_result` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;;
/*!40101 SET character_set_client = @saved_cs_client */;;
/*!40101 SET @saved_cs_client     = @@character_set_client */;;
/*!40101 SET character_set_client = utf8 */;;
CREATE TABLE `npt_handcall_microdel_result_sequencinginitfile` (
  `sequencinginitfile_id` bigint(20) NOT NULL,
  `handcallmicrodelresult_id` bigint(20) NOT NULL,
  PRIMARY KEY (`sequencinginitfile_id`,`handcallmicrodelresult_id`),
  KEY `handcallmicrodelresult_id` (`handcallmicrodelresult_id`),
  CONSTRAINT `npt_handcall_microdel_result_sequencinginitfile_ibfk_1` FOREIGN KEY (`sequencinginitfile_id`) REFERENCES `alg_sequencinginitfile` (`id`),
  CONSTRAINT `npt_handcall_microdel_result_sequencinginitfile_ibfk_2` FOREIGN KEY (`handcallmicrodelresult_id`) REFERENCES `npt_handcall_microdel_result` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;;
/*!40101 SET character_set_client = @saved_cs_client */;;
/*!40101 SET @saved_cs_client     = @@character_set_client */;;
/*!40101 SET character_set_client = utf8 */;;
CREATE TABLE `npt_handcall_result` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `no_call` bit(1) DEFAULT NULL,
  `no_call_reason` varchar(75) DEFAULT NULL,
  `handcaller_notes` varchar(1000) DEFAULT NULL,
  `chr13_result` bigint(20) DEFAULT NULL,
  `chr18_result` bigint(20) DEFAULT NULL,
  `chr21_result` bigint(20) DEFAULT NULL,
  `chrsex_result` bigint(20) DEFAULT NULL,
  `handcall_complete` bit(1) DEFAULT NULL,
  `result_locked` bit(1) DEFAULT NULL,
  `handcalledby_id` bigint(20) DEFAULT NULL,
  `handcalled_date` datetime DEFAULT NULL,
  `result_code` varchar(50) DEFAULT NULL,
  `escalated` bit(1) NOT NULL DEFAULT b'0',
  `projectid` varchar(50) DEFAULT NULL,
  `jobid` varchar(50) DEFAULT NULL,
  `fetalfraction` double DEFAULT NULL,
  `gender` varchar(50) DEFAULT NULL,
  `resultsFromConstellation` bit(1) NOT NULL DEFAULT b'0',
  PRIMARY KEY (`id`),
  KEY `FKNPTHANDCALLRESULTCHR13` (`chr13_result`),
  KEY `FKNPTHANDCALLRESULTCHR18` (`chr18_result`),
  KEY `FKNPTHANDCALLRESULTCHR21` (`chr21_result`),
  KEY `FKNPTHANDCALLRESULTCHRSEX` (`chrsex_result`),
  KEY `FKNPTHANDCALLRESULTUSER` (`handcalledby_id`),
  CONSTRAINT `FKNPTHANDCALLRESULTCHR13` FOREIGN KEY (`chr13_result`) REFERENCES `alg_probabilityofdata` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FKNPTHANDCALLRESULTCHR18` FOREIGN KEY (`chr18_result`) REFERENCES `alg_probabilityofdata` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FKNPTHANDCALLRESULTCHR21` FOREIGN KEY (`chr21_result`) REFERENCES `alg_probabilityofdata` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FKNPTHANDCALLRESULTCHRSEX` FOREIGN KEY (`chrsex_result`) REFERENCES `alg_probabilityofdata` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FKNPTHANDCALLRESULTUSER` FOREIGN KEY (`handcalledby_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=764770 DEFAULT CHARSET=latin1;;
/*!40101 SET character_set_client = @saved_cs_client */;;
/*!40101 SET @saved_cs_client     = @@character_set_client */;;
/*!40101 SET character_set_client = utf8 */;;
CREATE TABLE `npt_handcallresult_sequencinginitfile` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `handcallresult_id` bigint(20) DEFAULT NULL,
  `sequencinginitfile_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKHANDCALLRESULTID` (`handcallresult_id`),
  KEY `FKSEQUENCINGINITFILEID` (`sequencinginitfile_id`),
  CONSTRAINT `FKHANDCALLRESULTID` FOREIGN KEY (`handcallresult_id`) REFERENCES `npt_handcall_result` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FKSEQUENCINGINITFILEID` FOREIGN KEY (`sequencinginitfile_id`) REFERENCES `alg_sequencinginitfile` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=802184 DEFAULT CHARSET=latin1;;
/*!40101 SET character_set_client = @saved_cs_client */;;
/*!40101 SET @saved_cs_client     = @@character_set_client */;;
/*!40101 SET character_set_client = utf8 */;;
CREATE TABLE `npt_microdel_report_note` (
  `report_id` bigint(20) NOT NULL,
  `microdel_note` varchar(1024) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;;
/*!40101 SET character_set_client = @saved_cs_client */;;
/*!40101 SET @saved_cs_client     = @@character_set_client */;;
/*!40101 SET character_set_client = utf8 */;;
CREATE TABLE `npt_plate` (
  `DTYPE` varchar(31) NOT NULL,
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `barcode` varchar(255) NOT NULL,
  `state` varchar(255) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `createdby_id` bigint(20) DEFAULT NULL,
  `sourceplate_id` bigint(20) DEFAULT NULL,
  `primerplate_id` bigint(20) DEFAULT NULL,
  `template_id` bigint(20) DEFAULT NULL,
  `platetype` varchar(255) DEFAULT NULL,
  `concentration` double DEFAULT NULL,
  `intendeddepthofread` varchar(255) DEFAULT NULL,
  `csvfile_id` bigint(20) DEFAULT NULL,
  `last_resequence_reason` varchar(75) DEFAULT NULL,
  `standardOneMeasurement` double DEFAULT NULL,
  `standardTwoMeasurement` double DEFAULT NULL,
  `training_job_id` bigint(20) DEFAULT NULL,
  `training_job_create_date` datetime DEFAULT NULL,
  `training_moabjob_id` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `barcode` (`barcode`),
  KEY `FKC8B76B899CEFFD89` (`createdby_id`),
  KEY `FKC8B76B89C3ACE33A` (`sourceplate_id`),
  KEY `FKC8B76B898A4CC7C5` (`primerplate_id`),
  KEY `FKC8B76B89BD76D3A8` (`template_id`),
  KEY `FKC8B76B8959816504` (`csvfile_id`),
  CONSTRAINT `FKC8B76B898A4CC7C5` FOREIGN KEY (`primerplate_id`) REFERENCES `npt_plate` (`id`),
  CONSTRAINT `FKC8B76B899CEFFD89` FOREIGN KEY (`createdby_id`) REFERENCES `user` (`id`),
  CONSTRAINT `FKC8B76B89BD76D3A8` FOREIGN KEY (`template_id`) REFERENCES `npt_barcodingprimerplatetemplate` (`id`),
  CONSTRAINT `FKC8B76B89C3ACE33A` FOREIGN KEY (`sourceplate_id`) REFERENCES `npt_plate` (`id`),
  CONSTRAINT `npt_plate_ibfk_1` FOREIGN KEY (`csvfile_id`) REFERENCES `documentinfo` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=88938 DEFAULT CHARSET=latin1;;
/*!40101 SET character_set_client = @saved_cs_client */;;
/*!40101 SET @saved_cs_client     = @@character_set_client */;;
/*!40101 SET character_set_client = utf8 */;;
CREATE TABLE `npt_plate_clarity` (
  `sample_barcode` varchar(255) DEFAULT NULL,
  `plate_barcode` varchar(255) DEFAULT NULL,
  `process_type` varchar(255) DEFAULT NULL,
  `plate_created` datetime DEFAULT NULL,
  `plate_type` varchar(255) DEFAULT NULL,
  `placement_id` bigint(20) DEFAULT NULL,
  `process_id` bigint(20) DEFAULT NULL,
  `create_timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `pool_barcode` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `create_timestampIDX` (`create_timestamp`),
  KEY `samplePlacementIDX` (`sample_barcode`,`placement_id`),
  KEY `sample_barcodeIDX` (`sample_barcode`),
  KEY `plate_createdIDX` (`plate_created`),
  KEY `plate_barcodeIDX` (`plate_barcode`)
) ENGINE=InnoDB AUTO_INCREMENT=8923154 DEFAULT CHARSET=latin1;;
/*!40101 SET character_set_client = @saved_cs_client */;;
/*!40101 SET @saved_cs_client     = @@character_set_client */;;
/*!40101 SET character_set_client = utf8 */;;
CREATE TABLE `npt_plate_inventorieditem` (
  `npt_plate_id` bigint(20) NOT NULL,
  `reagents_id` bigint(20) NOT NULL,
  PRIMARY KEY (`npt_plate_id`,`reagents_id`),
  KEY `FK9CCDCBC8E2DE14F5` (`reagents_id`),
  KEY `FK9CCDCBC841DC7CCC` (`npt_plate_id`),
  CONSTRAINT `FK9CCDCBC841DC7CCC` FOREIGN KEY (`npt_plate_id`) REFERENCES `npt_plate` (`id`),
  CONSTRAINT `FK9CCDCBC8E2DE14F5` FOREIGN KEY (`reagents_id`) REFERENCES `inventorieditem` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;;
/*!40101 SET character_set_client = @saved_cs_client */;;
/*!40101 SET @saved_cs_client     = @@character_set_client */;;
/*!40101 SET character_set_client = utf8 */;;
CREATE TABLE `npt_plate_platewellsample` (
  `npt_plate_id` bigint(20) NOT NULL,
  `wells_id` bigint(20) NOT NULL,
  `position` int(11) NOT NULL,
  PRIMARY KEY (`npt_plate_id`,`position`),
  KEY `FK35479740CC60NPTPPWSPID_idx` (`npt_plate_id`),
  KEY `FK35479740CC60NPTPPWSWID_idx` (`wells_id`),
  CONSTRAINT `FK35479740CC60NPTPPWSPID` FOREIGN KEY (`npt_plate_id`) REFERENCES `npt_plate` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK35479740CC60NPTPPWSWID` FOREIGN KEY (`wells_id`) REFERENCES `platewellsample` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;;
/*!40101 SET character_set_client = @saved_cs_client */;;
/*!40101 SET @saved_cs_client     = @@character_set_client */;;
/*!40101 SET character_set_client = utf8 */;;
CREATE TABLE `npt_plate_sample` (
  `npt_plate_id` bigint(20) NOT NULL,
  `wells_id` bigint(20) NOT NULL,
  `position` int(11) NOT NULL,
  PRIMARY KEY (`npt_plate_id`,`position`),
  KEY `FK3547974041DC7CCC` (`npt_plate_id`),
  KEY `FK35479740CC60BE75` (`wells_id`),
  CONSTRAINT `FK3547974041DC7CCC` FOREIGN KEY (`npt_plate_id`) REFERENCES `npt_plate` (`id`),
  CONSTRAINT `FK35479740CC60BE75` FOREIGN KEY (`wells_id`) REFERENCES `sample` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;;
/*!40101 SET character_set_client = @saved_cs_client */;;
/*!40101 SET @saved_cs_client     = @@character_set_client */;;
/*!40101 SET character_set_client = utf8 */;;
CREATE TABLE `npt_plate_sequencingbarcode` (
  `npt_plate_id` bigint(20) NOT NULL,
  `sequencingbarcode_id` bigint(20) NOT NULL,
  `sample_id` bigint(20) NOT NULL,
  PRIMARY KEY (`npt_plate_id`,`sequencingbarcode_id`),
  KEY `FK9CEC034CB12B06FF` (`npt_plate_id`),
  KEY `FK9CEC034C27C3A010` (`sample_id`),
  KEY `FK9CEC034C3973F387` (`sequencingbarcode_id`),
  CONSTRAINT `FK9CEC034C27C3A010` FOREIGN KEY (`sample_id`) REFERENCES `sample` (`id`),
  CONSTRAINT `FK9CEC034C3973F387` FOREIGN KEY (`sequencingbarcode_id`) REFERENCES `hts`.`sequencingbarcode` (`id`),
  CONSTRAINT `FK9CEC034CB12B06FF` FOREIGN KEY (`npt_plate_id`) REFERENCES `npt_plate` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;;
/*!40101 SET character_set_client = @saved_cs_client */;;
/*!40101 SET @saved_cs_client     = @@character_set_client */;;
/*!40101 SET character_set_client = utf8 */;;
CREATE TABLE `npt_plate_sequencingbarcode_platewellsample` (
  `npt_plate_id` bigint(20) NOT NULL,
  `sequencingbarcode_id` bigint(20) NOT NULL,
  `platewellsample_id` bigint(20) NOT NULL,
  PRIMARY KEY (`npt_plate_id`,`sequencingbarcode_id`),
  KEY `FK9CEC034C27NPSPWSSID_idx` (`platewellsample_id`),
  KEY `FK9CEC034CBNPSPWSPID_idx` (`npt_plate_id`),
  KEY `FK9CEC055CBNPSPWSSBID_idx` (`sequencingbarcode_id`),
  CONSTRAINT `FK9CEC034C27NPSPWSSID` FOREIGN KEY (`platewellsample_id`) REFERENCES `platewellsample` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK9CEC034CBNPSPWSPID` FOREIGN KEY (`npt_plate_id`) REFERENCES `npt_plate` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK9CEC055CBNPSPWSSBID_idx` FOREIGN KEY (`sequencingbarcode_id`) REFERENCES `hts`.`sequencingbarcode` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;;
/*!40101 SET character_set_client = @saved_cs_client */;;
/*!40101 SET @saved_cs_client     = @@character_set_client */;;
/*!40101 SET character_set_client = utf8 */;;
CREATE TABLE `npt_plate_times` (
  `plate_id` bigint(20) NOT NULL,
  `startendtimes_value_endtime` datetime DEFAULT NULL,
  `startendtimes_value_starttime` datetime DEFAULT NULL,
  `state` varchar(255) NOT NULL,
  PRIMARY KEY (`plate_id`,`state`),
  KEY `FK56214B1018CCC61F` (`plate_id`),
  CONSTRAINT `FK56214B1018CCC61F` FOREIGN KEY (`plate_id`) REFERENCES `npt_plate` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;;
/*!40101 SET character_set_client = @saved_cs_client */;;
SET @saved_cs_client     = @@character_set_client;;
SET character_set_client = utf8;;
/*!50001 CREATE TABLE `npt_redrawsummary` (
  `Casefile ID` tinyint NOT NULL,
  `Test Type` tinyint NOT NULL,
  `Clinic ID` tinyint NOT NULL,
  `Clinic Name` tinyint NOT NULL,
  `Casefile Opened` tinyint NOT NULL,
  `Casefile State` tinyint NOT NULL,
  `Kit ID` tinyint NOT NULL,
  `Kit Barcode` tinyint NOT NULL,
  `Kit Received` tinyint NOT NULL,
  `Kit Redraw Registered` tinyint NOT NULL,
  `Redraw Reason(s)` tinyint NOT NULL,
  `Redraw Mother Category` tinyint NOT NULL
) ENGINE=MyISAM */;;
SET character_set_client = @saved_cs_client;;
/*!40101 SET @saved_cs_client     = @@character_set_client */;;
/*!40101 SET character_set_client = utf8 */;;
CREATE TABLE `npt_report` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `accessioning_id` varchar(255) DEFAULT NULL,
  `case_id` varchar(255) DEFAULT NULL,
  `4medica_id` varchar(255) DEFAULT NULL,
  `hl7_accessioning_id` varchar(255) DEFAULT NULL,
  `clinic_name` varchar(255) DEFAULT NULL,
  `clinic_id` varchar(255) DEFAULT NULL,
  `medical_record_id` varchar(255) DEFAULT NULL,
  `ordering_physician` varchar(255) DEFAULT NULL,
  `physician_id` bigint(20) DEFAULT NULL,
  `patient_dob` varchar(255) DEFAULT NULL,
  `patient_edd_age` decimal(19,2) DEFAULT NULL,
  `patient_gestational_age_days` decimal(19,2) DEFAULT NULL,
  `patient_gestational_age_weeks` decimal(19,2) DEFAULT NULL,
  `patient_name` varchar(255) DEFAULT NULL,
  `patient_firstname` varchar(255) DEFAULT NULL,
  `patient_lastname` varchar(255) DEFAULT NULL,
  `patient_microdeletion_carrier` varchar(255) DEFAULT NULL,
  `patient_4medica_chart_id` varchar(255) DEFAULT NULL,
  `patient_gender` varchar(255) DEFAULT NULL,
  `patient_id` varchar(255) DEFAULT NULL,
  `sample_collected` varchar(255) DEFAULT NULL,
  `sample_has_father` bit(1) DEFAULT NULL,
  `sample_has_mother` bit(1) DEFAULT NULL,
  `published_date` varchar(255) DEFAULT NULL,
  `amends_previous` bit(1) NOT NULL DEFAULT b'0',
  `report_id` varchar(255) DEFAULT NULL,
  `fetal_fraction` varchar(255) DEFAULT NULL,
  `reported_gender` varchar(255) DEFAULT NULL,
  `result_statement` longtext,
  `npthandcallresult_id` bigint(20) DEFAULT NULL,
  `third_party_kit_id` varchar(255) DEFAULT NULL,
  `third_party_draw_id_mom` varchar(255) DEFAULT NULL,
  `third_party_draw_id_dad` varchar(255) DEFAULT NULL,
  `parentkit_id` bigint(20) NOT NULL,
  `result_code` varchar(50) DEFAULT NULL,
  `triploidy_ordered` bit(1) DEFAULT b'0',
  `collection_kit` varchar(255) DEFAULT NULL,
  `sample_received` varchar(255) DEFAULT NULL,
  `microdeletion_ordered` bit(1) DEFAULT b'0',
  `gender_ordered` bit(1) DEFAULT b'0',
  `newyork_case` bit(1) DEFAULT NULL,
  `canada_case` bit(1) DEFAULT NULL,
  `patient_weight` varchar(255) DEFAULT NULL,
  `microdel_result_code` varchar(255) DEFAULT NULL,
  `microdel_result_statement` longtext,
  `npthandcallmicrodelresult_id` bigint(20) DEFAULT NULL,
  `result_summary` longtext,
  `microdeletion_panel_ordered` varchar(255) NOT NULL DEFAULT 'NONE',
  `clinic_city` varchar(255) DEFAULT NULL,
  `clinic_phone_number` varchar(255) DEFAULT NULL,
  `clinic_postcode` varchar(255) DEFAULT NULL,
  `clinic_state` varchar(255) DEFAULT NULL,
  `clinic_street_1` varchar(255) DEFAULT NULL,
  `clinic_street_2` varchar(255) DEFAULT NULL,
  `sample_barcode` varchar(255) DEFAULT NULL,
  `original_kit_barcode` varchar(255) DEFAULT NULL,
  `billingcode` varchar(50) DEFAULT NULL,
  `patient_street1` varchar(255) DEFAULT NULL,
  `patient_street2` varchar(255) DEFAULT NULL,
  `patient_city` varchar(255) DEFAULT NULL,
  `patient_state` varchar(255) DEFAULT NULL,
  `patient_postcode` varchar(255) DEFAULT NULL,
  `patient_country` varchar(255) DEFAULT NULL,
  `patient_phone` varchar(255) DEFAULT NULL,
  `result_interpretation` varchar(1024) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK5143D321F093D71C` (`npthandcallresult_id`),
  KEY `fk_npt_report_parentkit` (`parentkit_id`),
  KEY `npt_report_case_id_idx` (`case_id`),
  KEY `fk_npt_report_provider` (`physician_id`),
  CONSTRAINT `FK5143D321F093D71C` FOREIGN KEY (`npthandcallresult_id`) REFERENCES `npt_handcall_result` (`id`),
  CONSTRAINT `fk_npt_report_parentkit` FOREIGN KEY (`parentkit_id`) REFERENCES `parentkit` (`id`),
  CONSTRAINT `fk_npt_report_provider` FOREIGN KEY (`physician_id`) REFERENCES `provider` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1030989 DEFAULT CHARSET=latin1;;
/*!40101 SET character_set_client = @saved_cs_client */;;
/*!40101 SET @saved_cs_client     = @@character_set_client */;;
/*!40101 SET character_set_client = utf8 */;;
CREATE TABLE `npt_report_microdel_testresult` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `comments` varchar(255) DEFAULT NULL,
  `result_text` longtext,
  `type` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3522 DEFAULT CHARSET=latin1;;
/*!40101 SET character_set_client = @saved_cs_client */;;
/*!40101 SET @saved_cs_client     = @@character_set_client */;;
/*!40101 SET character_set_client = utf8 */;;
CREATE TABLE `npt_report_note` (
  `report_id` bigint(20) NOT NULL,
  `note` longtext,
  KEY `FK4CE66250821518DA` (`report_id`),
  CONSTRAINT `FK4CE66250821518DA` FOREIGN KEY (`report_id`) REFERENCES `npt_report` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;;
/*!40101 SET character_set_client = @saved_cs_client */;;
/*!40101 SET @saved_cs_client     = @@character_set_client */;;
/*!40101 SET character_set_client = utf8 */;;
CREATE TABLE `npt_report_npt_report_microdel_testresult` (
  `npt_report_id` bigint(20) NOT NULL,
  `testresult_microdeltests_id` bigint(20) NOT NULL,
  UNIQUE KEY `testresult_microdeltests_id` (`testresult_microdeltests_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;;
/*!40101 SET character_set_client = @saved_cs_client */;;
/*!40101 SET @saved_cs_client     = @@character_set_client */;;
/*!40101 SET character_set_client = utf8 */;;
CREATE TABLE `npt_report_npt_report_testresult` (
  `npt_report_id` bigint(20) NOT NULL,
  `testresult_tests_id` bigint(20) NOT NULL,
  UNIQUE KEY `testresult_tests_id` (`testresult_tests_id`),
  KEY `FKA656606F7AFC37CD` (`npt_report_id`),
  KEY `FKA656606F63275E0A` (`testresult_tests_id`),
  CONSTRAINT `FKA656606F63275E0A` FOREIGN KEY (`testresult_tests_id`) REFERENCES `npt_report_testresult` (`id`),
  CONSTRAINT `FKA656606F7AFC37CD` FOREIGN KEY (`npt_report_id`) REFERENCES `npt_report` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;;
/*!40101 SET character_set_client = @saved_cs_client */;;
/*!40101 SET @saved_cs_client     = @@character_set_client */;;
/*!40101 SET character_set_client = utf8 */;;
CREATE TABLE `npt_report_npt_result_note` (
  `npt_report_id` bigint(20) NOT NULL,
  `testresult_resultnotes_note_id` bigint(20) NOT NULL,
  UNIQUE KEY `testresult_resultnotes_note_id` (`testresult_resultnotes_note_id`),
  KEY `FKC3DA1FE97AFC37CD` (`npt_report_id`),
  KEY `FKC3DA1FE9EC50DC5E` (`testresult_resultnotes_note_id`),
  CONSTRAINT `FKC3DA1FE97AFC37CD` FOREIGN KEY (`npt_report_id`) REFERENCES `npt_report` (`id`),
  CONSTRAINT `FKC3DA1FE9EC50DC5E` FOREIGN KEY (`testresult_resultnotes_note_id`) REFERENCES `npt_result_note` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;;
/*!40101 SET character_set_client = @saved_cs_client */;;
/*!40101 SET @saved_cs_client     = @@character_set_client */;;
/*!40101 SET character_set_client = utf8 */;;
CREATE TABLE `npt_report_npt_result_summary` (
  `npt_report_id` bigint(20) NOT NULL,
  `testresult_resultsummaries_summary_id` bigint(20) NOT NULL,
  UNIQUE KEY `testresult_resultsummaries_summary_id` (`testresult_resultsummaries_summary_id`),
  KEY `npt_report_id` (`npt_report_id`),
  CONSTRAINT `npt_report_npt_result_summary_ibfk_1` FOREIGN KEY (`testresult_resultsummaries_summary_id`) REFERENCES `npt_result_summary` (`id`),
  CONSTRAINT `npt_report_npt_result_summary_ibfk_2` FOREIGN KEY (`npt_report_id`) REFERENCES `npt_report` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;;
/*!40101 SET character_set_client = @saved_cs_client */;;
/*!40101 SET @saved_cs_client     = @@character_set_client */;;
/*!40101 SET character_set_client = utf8 */;;
CREATE TABLE `npt_report_receiver` (
  `report_id` bigint(20) NOT NULL,
  `receiver` longtext,
  KEY `FK45023D4D821518DA` (`report_id`),
  CONSTRAINT `FK45023D4D821518DA` FOREIGN KEY (`report_id`) REFERENCES `npt_report` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;;
/*!40101 SET character_set_client = @saved_cs_client */;;
/*!40101 SET @saved_cs_client     = @@character_set_client */;;
/*!40101 SET character_set_client = utf8 */;;
CREATE TABLE `npt_report_testresult` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `agerisk_text` varchar(255) DEFAULT NULL,
  `agerisk_value` decimal(19,6) DEFAULT NULL,
  `agerisk_fraction` varchar(255) DEFAULT NULL,
  `comments` longtext,
  `result_text` longtext,
  `riskscore_text` varchar(255) DEFAULT NULL,
  `riskscore_value` decimal(19,6) DEFAULT NULL,
  `riskscore_fraction` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `interpretation` longtext,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6791496 DEFAULT CHARSET=latin1;;
/*!40101 SET character_set_client = @saved_cs_client */;;
SET @saved_cs_client     = @@character_set_client;;
SET character_set_client = utf8;;
/*!50001 CREATE TABLE `npt_reportsummary` (
  `kit_id` tinyint NOT NULL,
  `case_id` tinyint NOT NULL,
  `Clinic` tinyint NOT NULL,
  `kit_barcode` tinyint NOT NULL,
  `kit_received` tinyint NOT NULL,
  `accessioning_id` tinyint NOT NULL,
  `medical_record_id` tinyint NOT NULL,
  `patient_id` tinyint NOT NULL,
  `third_party_kit_id` tinyint NOT NULL,
  `third_party_draw_id_mom` tinyint NOT NULL,
  `third_party_draw_id_dad` tinyint NOT NULL,
  `patient_gestational_age_weeks` tinyint NOT NULL,
  `patient_gestational_age_days` tinyint NOT NULL,
  `handcalled_date` tinyint NOT NULL,
  `published_date` tinyint NOT NULL,
  `delivered_date` tinyint NOT NULL,
  `TAT_calendar` tinyint NOT NULL,
  `TAT_biz` tinyint NOT NULL,
  `T13_result_text` tinyint NOT NULL,
  `T13_riskscore_value` tinyint NOT NULL,
  `T18_result_text` tinyint NOT NULL,
  `T18_riskscore_value` tinyint NOT NULL,
  `T21_result_text` tinyint NOT NULL,
  `T21_riskscore_value` tinyint NOT NULL,
  `MX_result_text` tinyint NOT NULL,
  `MX_riskscore_value` tinyint NOT NULL,
  `result_code` tinyint NOT NULL,
  `microdeletion_panel_ordered` tinyint NOT NULL,
  `microdel_result_code` tinyint NOT NULL,
  `no_call` tinyint NOT NULL,
  `no_call_reason` tinyint NOT NULL,
  `handcaller_notes` tinyint NOT NULL,
  `reported_gender` tinyint NOT NULL,
  `patient_edd_age` tinyint NOT NULL,
  `qc rollup` tinyint NOT NULL,
  `qc rollup message` tinyint NOT NULL,
  `reported CFE` tinyint NOT NULL,
  `CFE` tinyint NOT NULL,
  `CFE range` tinyint NOT NULL,
  `spike ratio` tinyint NOT NULL,
  `spike ratio range` tinyint NOT NULL,
  `sentby` tinyint NOT NULL,
  `senton` tinyint NOT NULL,
  `maternal_weight` tinyint NOT NULL,
  `father sample included` tinyint NOT NULL,
  `sample_collected` tinyint NOT NULL
) ENGINE=MyISAM */;;
SET character_set_client = @saved_cs_client;;
/*!40101 SET @saved_cs_client     = @@character_set_client */;;
/*!40101 SET character_set_client = utf8 */;;
CREATE TABLE `npt_result_note` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `note_text` longtext,
  `type` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=59460 DEFAULT CHARSET=latin1;;
/*!40101 SET character_set_client = @saved_cs_client */;;
/*!40101 SET @saved_cs_client     = @@character_set_client */;;
/*!40101 SET character_set_client = utf8 */;;
CREATE TABLE `npt_result_summary` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `position` varchar(255) DEFAULT NULL,
  `summary_text` longtext,
  `type` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1070246 DEFAULT CHARSET=latin1;;
/*!40101 SET character_set_client = @saved_cs_client */;;
SET @saved_cs_client     = @@character_set_client;;
SET character_set_client = utf8;;
/*!50001 CREATE TABLE `nptplateclarity` (
  `Process Type` tinyint NOT NULL,
  `Plate Barcode` tinyint NOT NULL,
  `Plate Created` tinyint NOT NULL,
  `Plate Type` tinyint NOT NULL,
  `Sample Barcode` tinyint NOT NULL,
  `Case` tinyint NOT NULL,
  `Prenatus` tinyint NOT NULL,
  `NIPT Research` tinyint NOT NULL,
  `NIPT Bridging Study` tinyint NOT NULL,
  `Test Type` tinyint NOT NULL,
  `Territory Name` tinyint NOT NULL,
  `Process Completed` tinyint NOT NULL,
  `Pool Barcode` tinyint NOT NULL
) ENGINE=MyISAM */;;
SET character_set_client = @saved_cs_client;;
SET @saved_cs_client     = @@character_set_client;;
SET character_set_client = utf8;;
/*!50001 CREATE TABLE `nptplatesummary` (
  `Process Type` tinyint NOT NULL,
  `Plate Barcode` tinyint NOT NULL,
  `Plate Created` tinyint NOT NULL,
  `Plate Type` tinyint NOT NULL,
  `Plate Position` tinyint NOT NULL,
  `Sample Barcode` tinyint NOT NULL,
  `Root Barcode` tinyint NOT NULL,
  `Case` tinyint NOT NULL,
  `Prenatus` tinyint NOT NULL,
  `NIPT Research` tinyint NOT NULL,
  `NIPT Bridging Study` tinyint NOT NULL,
  `Case Opened Date` tinyint NOT NULL,
  `Test Type` tinyint NOT NULL,
  `Family Position` tinyint NOT NULL,
  `Sample Type` tinyint NOT NULL,
  `Root Sample Receive Date` tinyint NOT NULL,
  `Prep Date` tinyint NOT NULL,
  `Territory Name` tinyint NOT NULL
) ENGINE=MyISAM */;;
SET character_set_client = @saved_cs_client;;
/*!40101 SET @saved_cs_client     = @@character_set_client */;;
/*!40101 SET character_set_client = utf8 */;;
CREATE TABLE `nvstore` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `json` varchar(5096) DEFAULT NULL,
  `name` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_UNIQUE` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=314 DEFAULT CHARSET=latin1;;
/*!40101 SET character_set_client = @saved_cs_client */;;
/*!40101 SET @saved_cs_client     = @@character_set_client */;;
/*!40101 SET character_set_client = utf8 */;;
CREATE TABLE `odebatch` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `filename` varchar(255) NOT NULL,
  `filesent` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=495 DEFAULT CHARSET=latin1;;
/*!40101 SET character_set_client = @saved_cs_client */;;
/*!40101 SET @saved_cs_client     = @@character_set_client */;;
/*!40101 SET character_set_client = utf8 */;;
CREATE TABLE `odebatch_casefile` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `batch_id` bigint(20) NOT NULL,
  `case_id` bigint(20) NOT NULL,
  `docinfo_id` bigint(20) NOT NULL,
  `state` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_batch_id` (`batch_id`),
  KEY `fk_case_id` (`case_id`),
  KEY `fk_docinfo_id` (`docinfo_id`),
  CONSTRAINT `fk_batch_id` FOREIGN KEY (`batch_id`) REFERENCES `odebatch` (`id`),
  CONSTRAINT `fk_case_id` FOREIGN KEY (`case_id`) REFERENCES `casefile` (`id`),
  CONSTRAINT `fk_docinfo_id` FOREIGN KEY (`docinfo_id`) REFERENCES `documentinfo` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=136802 DEFAULT CHARSET=latin1;;
/*!40101 SET character_set_client = @saved_cs_client */;;
/*!40101 SET @saved_cs_client     = @@character_set_client */;;
/*!40101 SET character_set_client = utf8 */;;
CREATE TABLE `organization` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `billtoclinic` bit(1) DEFAULT NULL,
  `cyclesperyear` varchar(255) DEFAULT NULL,
  `deleted` bit(1) NOT NULL,
  `gcspecialinstructions` text,
  `genzymeid` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `note` text,
  `pgdperyear` varchar(255) DEFAULT NULL,
  `pgsperyear` varchar(255) DEFAULT NULL,
  `specialinstructions` text,
  `address_id` bigint(20) DEFAULT NULL,
  `pgdbreakdown_id` bigint(20) DEFAULT NULL,
  `includeranking` bit(1) DEFAULT NULL,
  `includeparentalsource` bit(1) DEFAULT NULL,
  `removesex` bit(1) DEFAULT NULL,
  `labdirectoralias` varchar(255) DEFAULT NULL,
  `day5biopsyability` bit(1) DEFAULT NULL,
  `specialist_id` bigint(20) DEFAULT NULL,
  `pocperyear` varchar(255) DEFAULT NULL,
  `reporttemplate` varchar(255) DEFAULT NULL,
  `wgcasecounter` bigint(20) DEFAULT '0',
  `gpclinicid` varchar(255) DEFAULT NULL,
  `istriploidynptreport` bit(1) DEFAULT b'0',
  `requiresCanadaWaiver` bit(1) DEFAULT b'0',
  `referralFormVersions` varchar(255) DEFAULT NULL,
  `researchstatus` varchar(255) NOT NULL DEFAULT 'RESEARCH_ALLOWED',
  `requirePhysician` bit(1) DEFAULT NULL,
  `approvedForPlasmaKits` bit(1) NOT NULL DEFAULT b'0',
  `clinicHeadSignatureOnFile` bit(1) NOT NULL DEFAULT b'0',
  `is_new_connect` bit(1) DEFAULT NULL,
  `routeToBaylor` bit(1) NOT NULL DEFAULT b'0',
  `donotcontact` bit(1) DEFAULT b'0',
  `isResidualRisksReportOptIn` bit(1) NOT NULL DEFAULT b'0',
  `usesNpiNumbers` bit(1) NOT NULL DEFAULT b'1',
  PRIMARY KEY (`id`),
  KEY `FK501041537D92625D` (`address_id`),
  KEY `FK5010415332CC758` (`pgdbreakdown_id`) USING BTREE,
  KEY `FK501041534E426AAB` (`specialist_id`),
  CONSTRAINT `FK5010415332CC758` FOREIGN KEY (`pgdbreakdown_id`) REFERENCES `document` (`id`),
  CONSTRAINT `FK501041534E426AAB` FOREIGN KEY (`specialist_id`) REFERENCES `user` (`id`),
  CONSTRAINT `FK501041537D92625D` FOREIGN KEY (`address_id`) REFERENCES `contactinfo` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9047 DEFAULT CHARSET=latin1;;
/*!40101 SET character_set_client = @saved_cs_client */;;
/*!40101 SET @saved_cs_client     = @@character_set_client */;;
/*!40101 SET character_set_client = utf8 */;;
CREATE TABLE `organization_contactinfo` (
  `Organization_id` bigint(20) NOT NULL,
  `satelites_id` bigint(20) NOT NULL,
  UNIQUE KEY `satelites_id` (`satelites_id`),
  UNIQUE KEY `UK_1f92a60d592b418db9cda2f2337` (`satelites_id`),
  KEY `FK91F2CFE2D12F71D1` (`Organization_id`),
  KEY `FK91F2CFE28E83F56B` (`satelites_id`),
  CONSTRAINT `FK91F2CFE28E83F56B` FOREIGN KEY (`satelites_id`) REFERENCES `contactinfo` (`id`),
  CONSTRAINT `FK91F2CFE2D12F71D1` FOREIGN KEY (`Organization_id`) REFERENCES `organization` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;;
/*!40101 SET character_set_client = @saved_cs_client */;;
/*!40101 SET @saved_cs_client     = @@character_set_client */;;
/*!40101 SET character_set_client = utf8 */;;
CREATE TABLE `organization_deliverydestination` (
  `Organization_id` bigint(20) NOT NULL,
  `deliverydestinations_id` bigint(20) NOT NULL,
  UNIQUE KEY `deliverydestinations_id` (`Organization_id`,`deliverydestinations_id`),
  UNIQUE KEY `UK_4660f6b4eb6c4b0b81fb9138d98` (`deliverydestinations_id`),
  KEY `FKB37D3E6ED12F71D1` (`Organization_id`),
  KEY `FKB37D3E6E7CD02DA4` (`deliverydestinations_id`),
  CONSTRAINT `FKB37D3E6E7CD02DA4` FOREIGN KEY (`deliverydestinations_id`) REFERENCES `deliverydestination` (`id`),
  CONSTRAINT `FKB37D3E6ED12F71D1` FOREIGN KEY (`Organization_id`) REFERENCES `organization` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;;
/*!40101 SET character_set_client = @saved_cs_client */;;
/*!40101 SET @saved_cs_client     = @@character_set_client */;;
/*!40101 SET character_set_client = utf8 */;;
CREATE TABLE `organization_instructions` (
  `organization_id` bigint(20) NOT NULL,
  `label` varchar(50) NOT NULL,
  `instruction` text NOT NULL,
  PRIMARY KEY (`organization_id`,`label`),
  KEY `FK_organization_instruction` (`organization_id`),
  CONSTRAINT `FK_organization_instruction` FOREIGN KEY (`organization_id`) REFERENCES `organization` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;;
/*!40101 SET character_set_client = @saved_cs_client */;;
/*!40101 SET @saved_cs_client     = @@character_set_client */;;
/*!40101 SET character_set_client = utf8 */;;
CREATE TABLE `organization_note` (
  `Organization_id` bigint(20) NOT NULL,
  `notes_id` bigint(20) NOT NULL,
  UNIQUE KEY `notes_id` (`notes_id`),
  UNIQUE KEY `UK_538b5211910c482e8988b0150c7` (`notes_id`),
  KEY `FKB7F2777ED12F71D1` (`Organization_id`),
  KEY `FKB7F2777EBC19A742` (`notes_id`),
  CONSTRAINT `FKB7F2777EBC19A742` FOREIGN KEY (`notes_id`) REFERENCES `note` (`id`),
  CONSTRAINT `FKB7F2777ED12F71D1` FOREIGN KEY (`Organization_id`) REFERENCES `organization` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;;
/*!40101 SET character_set_client = @saved_cs_client */;;
/*!40101 SET @saved_cs_client     = @@character_set_client */;;
/*!40101 SET character_set_client = utf8 */;;
CREATE TABLE `organization_organizationpricingplan` (
  `Organization_id` bigint(20) NOT NULL,
  `organizationpricingplans_id` bigint(20) NOT NULL,
  UNIQUE KEY `organizationpricingplans_id` (`organizationpricingplans_id`),
  UNIQUE KEY `UK_77bf99ecada84d05a97382978fb` (`organizationpricingplans_id`),
  KEY `FK23A6EDD0D12F71D1` (`Organization_id`),
  KEY `FK23A6EDD0662F1EC8` (`organizationpricingplans_id`),
  CONSTRAINT `FK23A6EDD0662F1EC8` FOREIGN KEY (`organizationpricingplans_id`) REFERENCES `organizationpricingplan` (`id`),
  CONSTRAINT `FK23A6EDD0D12F71D1` FOREIGN KEY (`Organization_id`) REFERENCES `organization` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;;
/*!40101 SET character_set_client = @saved_cs_client */;;
/*!40101 SET @saved_cs_client     = @@character_set_client */;;
/*!40101 SET character_set_client = utf8 */;;
CREATE TABLE `organization_organizationterritory` (
  `Organization_id` bigint(20) NOT NULL,
  `organizationterritories_id` bigint(20) NOT NULL,
  `organizationTerritories_ORDER` int(11) NOT NULL,
  PRIMARY KEY (`Organization_id`,`organizationTerritories_ORDER`),
  KEY `organizationterritories_id` (`organizationterritories_id`),
  CONSTRAINT `organization_organizationterritory_ibfk_1` FOREIGN KEY (`Organization_id`) REFERENCES `organization` (`id`),
  CONSTRAINT `organization_organizationterritory_ibfk_2` FOREIGN KEY (`organizationterritories_id`) REFERENCES `organizationterritory` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;;
/*!40101 SET character_set_client = @saved_cs_client */;;
/*!40101 SET @saved_cs_client     = @@character_set_client */;;
/*!40101 SET character_set_client = utf8 */;;
CREATE TABLE `organization_provider` (
  `Organization_id` bigint(20) NOT NULL,
  `physicians_id` bigint(20) NOT NULL,
  UNIQUE KEY `physicians_id` (`physicians_id`),
  UNIQUE KEY `UK_69177fb4e1dc4776b89ce770524` (`physicians_id`),
  KEY `FK69DC277DD12F71D1` (`Organization_id`),
  KEY `FK69DC277D828574F9` (`physicians_id`),
  CONSTRAINT `FK69DC277D828574F9` FOREIGN KEY (`physicians_id`) REFERENCES `provider` (`id`),
  CONSTRAINT `FK69DC277DD12F71D1` FOREIGN KEY (`Organization_id`) REFERENCES `organization` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;;
/*!40101 SET character_set_client = @saved_cs_client */;;
/*!40101 SET @saved_cs_client     = @@character_set_client */;;
/*!40101 SET character_set_client = utf8 */;;
CREATE TABLE `organizationpricingplan` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `billtotype` varchar(255) DEFAULT NULL,
  `validfrom` datetime DEFAULT NULL,
  `pricingplan_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK5FCCB0BCE174BFA3` (`pricingplan_id`),
  CONSTRAINT `FK5FCCB0BCE174BFA3` FOREIGN KEY (`pricingplan_id`) REFERENCES `pricingplan` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=41703 DEFAULT CHARSET=latin1;;
/*!40101 SET character_set_client = @saved_cs_client */;;
/*!40101 SET @saved_cs_client     = @@character_set_client */;;
/*!40101 SET character_set_client = utf8 */;;
CREATE TABLE `organizationproperty` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `organization_id` bigint(20) DEFAULT NULL,
  `property_id` int(11) DEFAULT NULL,
  `value` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK1` (`organization_id`),
  KEY `FK2` (`property_id`),
  CONSTRAINT `FK1` FOREIGN KEY (`organization_id`) REFERENCES `organization` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK2` FOREIGN KEY (`property_id`) REFERENCES `property` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=latin1;;
/*!40101 SET character_set_client = @saved_cs_client */;;
/*!40101 SET @saved_cs_client     = @@character_set_client */;;
/*!40101 SET character_set_client = utf8 */;;
CREATE TABLE `organizations_reportformats` (
  `organization_id` bigint(20) NOT NULL,
  `reportformat_id` bigint(20) NOT NULL,
  `reportFormats_KEY` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`organization_id`,`reportFormats_KEY`),
  KEY `FK52076349D12F71D1` (`organization_id`),
  KEY `FK5207634944A7E980` (`reportformat_id`),
  CONSTRAINT `FK5207634944A7E980` FOREIGN KEY (`reportformat_id`) REFERENCES `reportformat` (`id`),
  CONSTRAINT `FK52076349D12F71D1` FOREIGN KEY (`organization_id`) REFERENCES `organization` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;;
/*!40101 SET character_set_client = @saved_cs_client */;;
/*!40101 SET @saved_cs_client     = @@character_set_client */;;
/*!40101 SET character_set_client = utf8 */;;
CREATE TABLE `organizationterritory` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `validfrom` datetime DEFAULT NULL,
  `territory_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `territory_id` (`territory_id`),
  CONSTRAINT `organizationterritory_ibfk_1` FOREIGN KEY (`territory_id`) REFERENCES `territory` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=298839 DEFAULT CHARSET=latin1;;
/*!40101 SET character_set_client = @saved_cs_client */;;
/*!40101 SET @saved_cs_client     = @@character_set_client */;;
/*!40101 SET character_set_client = utf8 */;;
CREATE TABLE `outboundorderstatus` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `parentkit_id` bigint(20) DEFAULT NULL,
  `subtesttype` varchar(255) DEFAULT NULL,
  `state` varchar(255) DEFAULT NULL,
  `referral_id` bigint(20) DEFAULT NULL,
  `referralsent` datetime DEFAULT NULL,
  `order_id` bigint(20) DEFAULT NULL,
  `ordersent` datetime DEFAULT NULL,
  `result_id` bigint(20) DEFAULT NULL,
  `resultreceived` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKA7D45FB0EC5C8BC4` (`parentkit_id`),
  KEY `FKA7D45FB0AC0CD409` (`referral_id`),
  KEY `FKA7D45FB0E11A5EB8` (`order_id`),
  KEY `FKA7D45FB02B143789` (`result_id`),
  CONSTRAINT `FKA7D45FB02B143789` FOREIGN KEY (`result_id`) REFERENCES `documentinfo` (`id`),
  CONSTRAINT `FKA7D45FB0AC0CD409` FOREIGN KEY (`referral_id`) REFERENCES `documentinfo` (`id`),
  CONSTRAINT `FKA7D45FB0E11A5EB8` FOREIGN KEY (`order_id`) REFERENCES `documentinfo` (`id`),
  CONSTRAINT `FKA7D45FB0EC5C8BC4` FOREIGN KEY (`parentkit_id`) REFERENCES `parentkit` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=30825 DEFAULT CHARSET=latin1;;
/*!40101 SET character_set_client = @saved_cs_client */;;
/*!40101 SET @saved_cs_client     = @@character_set_client */;;
/*!40101 SET character_set_client = utf8 */;;
CREATE TABLE `outboundshipper` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `created` datetime DEFAULT NULL,
  `createdby_id` bigint(20) DEFAULT NULL,
  `filldate` datetime DEFAULT NULL,
  `shipdate` datetime DEFAULT NULL,
  `trackingnumber` varchar(255) DEFAULT NULL,
  `state` varchar(50) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKCOBSHIPPERCREATEDBYID` (`createdby_id`),
  CONSTRAINT `FKCOBKITCREATEDBYID` FOREIGN KEY (`createdby_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3124 DEFAULT CHARSET=latin1;;
/*!40101 SET character_set_client = @saved_cs_client */;;
/*!40101 SET @saved_cs_client     = @@character_set_client */;;
/*!40101 SET character_set_client = utf8 */;;
CREATE TABLE `outboundshipper_sample` (
  `outboundshipper_id` bigint(20) DEFAULT NULL,
  `sample_id` bigint(20) NOT NULL,
  PRIMARY KEY (`sample_id`),
  KEY `FK9863535DEE91E1D1` (`outboundshipper_id`),
  KEY `FK9863535DEDA3F7AD` (`sample_id`),
  CONSTRAINT `FKOBKITOBKITID` FOREIGN KEY (`outboundshipper_id`) REFERENCES `outboundshipper` (`id`),
  CONSTRAINT `FKOBKITSMPID` FOREIGN KEY (`sample_id`) REFERENCES `sample` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;;
/*!40101 SET character_set_client = @saved_cs_client */;;
/*!40101 SET @saved_cs_client     = @@character_set_client */;;
/*!40101 SET character_set_client = utf8 */;;
CREATE TABLE `panel_disease` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `panel_id` bigint(20) NOT NULL,
  `disease_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FKPDPANELID_idx` (`panel_id`),
  KEY `FKHPDDISEASEID_idx` (`disease_id`),
  CONSTRAINT `FKHPDDISEASEID` FOREIGN KEY (`disease_id`) REFERENCES `horizondisease` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FKHPDPANELID` FOREIGN KEY (`panel_id`) REFERENCES `horizonpanel` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1110 DEFAULT CHARSET=latin1;;
/*!40101 SET character_set_client = @saved_cs_client */;;
/*!40101 SET @saved_cs_client     = @@character_set_client */;;
/*!40101 SET character_set_client = utf8 */;;
CREATE TABLE `panelorder_reasoncode` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `panelorder_id` bigint(20) NOT NULL,
  `reasoncode_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK1PORCPANELORDERID_idx` (`panelorder_id`),
  KEY `FK2PORCREASONCODEID_idx` (`reasoncode_id`),
  CONSTRAINT `FK1PORCPANELORDERID` FOREIGN KEY (`panelorder_id`) REFERENCES `horizonpanelorder` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK2PORCREASONCODEID` FOREIGN KEY (`reasoncode_id`) REFERENCES `reasoncode` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1274 DEFAULT CHARSET=latin1;;
/*!40101 SET character_set_client = @saved_cs_client */;;
/*!40101 SET @saved_cs_client     = @@character_set_client */;;
/*!40101 SET character_set_client = utf8 */;;
CREATE TABLE `panelorder_sample` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `panelorder_id` bigint(20) DEFAULT NULL,
  `sample_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK1POSPANELORDERID_idx` (`panelorder_id`),
  KEY `FK1POSSAMPLEID_idx` (`sample_id`),
  CONSTRAINT `FK1POSPANELORDERID` FOREIGN KEY (`panelorder_id`) REFERENCES `horizonpanelorder` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK1POSSAMPLEID` FOREIGN KEY (`sample_id`) REFERENCES `sample` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=352322 DEFAULT CHARSET=latin1;;
/*!40101 SET character_set_client = @saved_cs_client */;;
SET @saved_cs_client     = @@character_set_client;;
SET character_set_client = utf8;;
/*!50001 CREATE TABLE `parent_rerun_by_sample` (
  `rundate` tinyint NOT NULL,
  `samplebarcode` tinyint NOT NULL,
  `parents_reruns` tinyint NOT NULL,
  `cnt` tinyint NOT NULL
) ENGINE=MyISAM */;;
SET character_set_client = @saved_cs_client;;
/*!40101 SET @saved_cs_client     = @@character_set_client */;;
/*!40101 SET character_set_client = utf8 */;;
CREATE TABLE `parentkit` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `consent` bit(1) DEFAULT NULL,
  `hipaa` bit(1) DEFAULT NULL,
  `barcode` varchar(255) NOT NULL,
  `kitnumber` varchar(255) DEFAULT NULL,
  `paymentauthorization` bit(1) DEFAULT NULL,
  `received` datetime DEFAULT NULL,
  `referral` bit(1) DEFAULT NULL,
  `samplecollection` bit(1) DEFAULT NULL,
  `appointmentdate` datetime DEFAULT NULL,
  `expectedshipdate` datetime DEFAULT NULL,
  `carrier` varchar(255) DEFAULT NULL,
  `trackingnumber` varchar(255) DEFAULT NULL,
  `lotinformation` text,
  `casefile_id` bigint(20) NOT NULL,
  `expectedbirthdate` datetime DEFAULT NULL,
  `gestationalage` int(11) DEFAULT NULL,
  `gestationalageuserentered` bit(1) DEFAULT b'0',
  `coldmarklevel` varchar(255) DEFAULT NULL,
  `warmmarklevel` varchar(255) DEFAULT NULL,
  `thirdpartykitid` varchar(50) DEFAULT NULL,
  `thirdpartycaseid` varchar(255) DEFAULT NULL,
  `thirdpartymotherdrawid` varchar(50) DEFAULT NULL,
  `thirdpartyfatherdrawid` varchar(50) DEFAULT NULL,
  `thirdpartypatientid` varchar(50) DEFAULT NULL,
  `medicalrecordnumber` varchar(50) DEFAULT NULL,
  `state` varchar(50) DEFAULT NULL,
  `supportstate` varchar(50) DEFAULT NULL,
  `microdelstate` varchar(50) DEFAULT NULL,
  `activitiProcessId` int(11) DEFAULT NULL,
  `activitiDeploymentId` int(11) DEFAULT NULL,
  `slipstream` bit(1) DEFAULT NULL,
  `originalkitbarcode` varchar(255) DEFAULT NULL,
  `inventoryconsumed` bit(1) DEFAULT NULL,
  `version` int(11) DEFAULT NULL,
  `reflexstate` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `barcode` (`barcode`),
  UNIQUE KEY `kitnumber` (`kitnumber`),
  KEY `FK7B66DDECCB9103C3` (`casefile_id`),
  KEY `IDX1PKSTATE` (`state`),
  KEY `IDX2PKSUPPORTSTATE` (`supportstate`),
  KEY `microdelstate` (`microdelstate`),
  CONSTRAINT `FK7B66DDECCB9103C3` FOREIGN KEY (`casefile_id`) REFERENCES `casefile` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=971408 DEFAULT CHARSET=latin1;;
/*!40101 SET character_set_client = @saved_cs_client */;;
--
-- WARNING: old server version. The following dump may be incomplete.
--

/*!50003 SET SESSION SQL_MODE="" */;;
/*!50003 CREATE */ /*!50017 DEFINER=`gsnuser`@`localhost` */ /*!50003 TRIGGER `before_insert_parentkit` BEFORE INSERT ON `parentkit` FOR EACH ROW BEGIN
    SET NEW.kitnumber = substring_index(NEW.barcode, '-2', 1);
  END */;;

--
-- WARNING: old server version. The following dump may be incomplete.
--

/*!50003 SET SESSION SQL_MODE="" */;;
/*!50003 CREATE */ /*!50017 DEFINER=`gsnuser`@`localhost` */ /*!50003 TRIGGER `before_update_parentkit` BEFORE UPDATE ON `parentkit` FOR EACH ROW BEGIN
    SET NEW.kitnumber = substring_index(NEW.barcode, '-2', 1);
  END */;;

/*!40101 SET @saved_cs_client     = @@character_set_client */;;
/*!40101 SET character_set_client = utf8 */;;
CREATE TABLE `parentkit_familyposition` (
  `parentkit_id` bigint(20) NOT NULL,
  `expectedfamilyposition` varchar(255) NOT NULL,
  PRIMARY KEY (`parentkit_id`,`expectedfamilyposition`),
  KEY `FKC9A3CB40EE91E1D1` (`parentkit_id`),
  CONSTRAINT `FKC9A3CB40EE91E1D1` FOREIGN KEY (`parentkit_id`) REFERENCES `parentkit` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;;
/*!40101 SET character_set_client = @saved_cs_client */;;
/*!40101 SET @saved_cs_client     = @@character_set_client */;;
/*!40101 SET character_set_client = utf8 */;;
CREATE TABLE `parentkit_receipt` (
  `parentkit_id` bigint(20) NOT NULL,
  `familyposition` varchar(255) NOT NULL,
  `receipt_id` bigint(20) NOT NULL,
  PRIMARY KEY (`parentkit_id`,`familyposition`),
  UNIQUE KEY `receipt_id` (`receipt_id`),
  KEY `FK45624AE5EE91E1D1` (`parentkit_id`),
  KEY `FK45624AE5F1B9A2D` (`receipt_id`),
  CONSTRAINT `FK45624AE5EE91E1D1` FOREIGN KEY (`parentkit_id`) REFERENCES `parentkit` (`id`),
  CONSTRAINT `FK45624AE5F1B9A2D` FOREIGN KEY (`receipt_id`) REFERENCES `kitreceipt` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;;
/*!40101 SET character_set_client = @saved_cs_client */;;
/*!40101 SET @saved_cs_client     = @@character_set_client */;;
/*!40101 SET character_set_client = utf8 */;;
CREATE TABLE `parentkit_sample` (
  `parentkit_id` bigint(20) DEFAULT NULL,
  `sample_id` bigint(20) NOT NULL,
  PRIMARY KEY (`sample_id`),
  KEY `FK9863535DEE91E1D1` (`parentkit_id`),
  KEY `FK9863535DEDA3F7AD` (`sample_id`),
  CONSTRAINT `FK9863535DEDA3F7AD` FOREIGN KEY (`sample_id`) REFERENCES `sample` (`id`),
  CONSTRAINT `FK9863535DEE91E1D1` FOREIGN KEY (`parentkit_id`) REFERENCES `parentkit` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;;
/*!40101 SET character_set_client = @saved_cs_client */;;
SET @saved_cs_client     = @@character_set_client;;
SET character_set_client = utf8;;
/*!50001 CREATE TABLE `parentsetupsummary` (
  `casefile` tinyint NOT NULL,
  `Product` tinyint NOT NULL,
  `disposable` tinyint NOT NULL,
  `familyPosition` tinyint NOT NULL,
  `barcode` tinyint NOT NULL,
  `DNA barcode` tinyint NOT NULL,
  `Sample age` tinyint NOT NULL,
  `date parent run on array` tinyint NOT NULL,
  `month run on array` tinyint NOT NULL,
  `received by` tinyint NOT NULL,
  `run on array` tinyint NOT NULL,
  `validated` tinyint NOT NULL,
  `array type` tinyint NOT NULL
) ENGINE=MyISAM */;;
SET character_set_client = @saved_cs_client;;
SET @saved_cs_client     = @@character_set_client;;
SET character_set_client = utf8;;
/*!50001 CREATE TABLE `parentsummary` (
  `id` tinyint NOT NULL,
  `eggdonor` tinyint NOT NULL,
  `spermdonor` tinyint NOT NULL,
  `satelliteaddress_id` tinyint NOT NULL,
  `maternal age` tinyint NOT NULL
) ENGINE=MyISAM */;;
SET character_set_client = @saved_cs_client;;
/*!40101 SET @saved_cs_client     = @@character_set_client */;;
/*!40101 SET character_set_client = utf8 */;;
CREATE TABLE `paternity_fields` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `alleged_fathers_related` bit(1) DEFAULT NULL,
  `alleged_fathers_relation` varchar(255) DEFAULT NULL,
  `chain` bit(1) NOT NULL,
  `report_names` bit(1) NOT NULL DEFAULT b'0',
  `deidentify` bit(1) DEFAULT b'0',
  `report_gender` bit(1) DEFAULT b'0',
  `incest` bit(1) DEFAULT NULL,
  `multiples` bit(1) DEFAULT NULL,
  `new_york` bit(1) DEFAULT NULL,
  `canada` bit(1) DEFAULT NULL,
  `number_of_alleged_fathers` int(11) DEFAULT NULL,
  `number_of_multiples` int(11) DEFAULT NULL,
  `payment_plan` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `alternate_case_id` varchar(255) DEFAULT NULL,
  `pregnant` varchar(255) DEFAULT NULL,
  `egg_donor_used` varchar(255) DEFAULT NULL,
  `surrogate_used` varchar(255) DEFAULT NULL,
  `multiple_pregnancy` varchar(255) DEFAULT NULL,
  `father_sample` varchar(255) DEFAULT NULL,
  `maternal_weight` double DEFAULT NULL,
  `patient_signature` bit(1) DEFAULT NULL,
  `consent_signature` bit(1) DEFAULT NULL,
  `clinic_postcode` varchar(255) DEFAULT NULL,
  `missing_insurance` bit(1) DEFAULT NULL,
  `received_ny_waiver` bit(1) DEFAULT NULL,
  `received_canadian_waiver` bit(1) DEFAULT NULL,
  `third_party_ordering_physician` varchar(255) DEFAULT NULL,
  `linkedbundledcase_id` bigint(20) DEFAULT NULL,
  `mother_microdeletion_carrier` varchar(255) DEFAULT NULL,
  `missing_payment_information` bit(1) DEFAULT NULL,
  `using_hormonal_medications` varchar(255) DEFAULT NULL,
  `family_history_info` bit(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK1LNK1BNDLD1CASEID1_idx` (`linkedbundledcase_id`),
  CONSTRAINT `FK1LNK1BNDLD1CASEID1` FOREIGN KEY (`linkedbundledcase_id`) REFERENCES `casefile` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=1007127 DEFAULT CHARSET=latin1;;
/*!40101 SET character_set_client = @saved_cs_client */;;
/*!40101 SET @saved_cs_client     = @@character_set_client */;;
/*!40101 SET character_set_client = utf8 */;;
CREATE TABLE `paternity_report` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `case_number` varchar(255) DEFAULT NULL,
  `report_date` varchar(255) DEFAULT NULL,
  `report_id` varchar(255) DEFAULT NULL,
  `result` varchar(255) DEFAULT NULL,
  `stats_version` varchar(255) DEFAULT NULL,
  `version` varchar(255) DEFAULT NULL,
  `alleged_father_id` bigint(20) DEFAULT NULL,
  `mother_id` bigint(20) DEFAULT NULL,
  `casefile_id` bigint(20) DEFAULT NULL,
  `lab_note` varchar(1024) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK79D1EE43D9CAC771` (`mother_id`),
  KEY `FK79D1EE43ACF80C1B` (`alleged_father_id`),
  KEY `FK79D1EE43CB9103C3` (`casefile_id`),
  CONSTRAINT `FK79D1EE43ACF80C1B` FOREIGN KEY (`alleged_father_id`) REFERENCES `paternity_report_subject` (`id`),
  CONSTRAINT `FK79D1EE43CB9103C3` FOREIGN KEY (`casefile_id`) REFERENCES `casefile` (`id`),
  CONSTRAINT `FK79D1EE43D9CAC771` FOREIGN KEY (`mother_id`) REFERENCES `paternity_report_subject` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17631 DEFAULT CHARSET=latin1;;
/*!40101 SET character_set_client = @saved_cs_client */;;
/*!40101 SET @saved_cs_client     = @@character_set_client */;;
/*!40101 SET character_set_client = utf8 */;;
CREATE TABLE `paternity_report_call` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `algorithm_plot` varchar(255) DEFAULT NULL,
  `default_plot` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `child_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK99F0B6DAEE8C538A` (`child_id`),
  CONSTRAINT `FK99F0B6DAEE8C538A` FOREIGN KEY (`child_id`) REFERENCES `paternity_report_subject` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=88151 DEFAULT CHARSET=latin1;;
/*!40101 SET character_set_client = @saved_cs_client */;;
/*!40101 SET @saved_cs_client     = @@character_set_client */;;
/*!40101 SET character_set_client = utf8 */;;
CREATE TABLE `paternity_report_channel` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `p_value` double DEFAULT NULL,
  `plot` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `result_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK3E881F0795A4434A` (`result_id`),
  CONSTRAINT `FK3E881F0795A4434A` FOREIGN KEY (`result_id`) REFERENCES `paternity_report_result` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=175321 DEFAULT CHARSET=latin1;;
/*!40101 SET character_set_client = @saved_cs_client */;;
/*!40101 SET @saved_cs_client     = @@character_set_client */;;
/*!40101 SET character_set_client = utf8 */;;
CREATE TABLE `paternity_report_code_list` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=37310 DEFAULT CHARSET=latin1;;
/*!40101 SET character_set_client = @saved_cs_client */;;
/*!40101 SET @saved_cs_client     = @@character_set_client */;;
/*!40101 SET character_set_client = utf8 */;;
CREATE TABLE `paternity_report_code_list_code` (
  `code_list_id` bigint(20) NOT NULL,
  `code` varchar(255) DEFAULT NULL,
  KEY `FK69651E989C56F7E1` (`code_list_id`),
  CONSTRAINT `FK69651E989C56F7E1` FOREIGN KEY (`code_list_id`) REFERENCES `paternity_report_code_list` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;;
/*!40101 SET character_set_client = @saved_cs_client */;;
/*!40101 SET @saved_cs_client     = @@character_set_client */;;
/*!40101 SET character_set_client = utf8 */;;
CREATE TABLE `paternity_report_code_list_message` (
  `code_list_id` bigint(20) NOT NULL,
  `message` varchar(255) DEFAULT NULL,
  KEY `FKEF2C4B7C9C56F7E1` (`code_list_id`),
  CONSTRAINT `FKEF2C4B7C9C56F7E1` FOREIGN KEY (`code_list_id`) REFERENCES `paternity_report_code_list` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;;
/*!40101 SET character_set_client = @saved_cs_client */;;
/*!40101 SET @saved_cs_client     = @@character_set_client */;;
/*!40101 SET character_set_client = utf8 */;;
CREATE TABLE `paternity_report_fetal_fraction` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `context` varchar(255) DEFAULT NULL,
  `value` double NOT NULL,
  `child_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK38F30E5DEE8C538A` (`child_id`),
  CONSTRAINT `FK38F30E5DEE8C538A` FOREIGN KEY (`child_id`) REFERENCES `paternity_report_subject` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=35065 DEFAULT CHARSET=latin1;;
/*!40101 SET character_set_client = @saved_cs_client */;;
/*!40101 SET @saved_cs_client     = @@character_set_client */;;
/*!40101 SET character_set_client = utf8 */;;
CREATE TABLE `paternity_report_result` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `race_group` varchar(255) DEFAULT NULL,
  `child_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKFA72D599EE8C538A` (`child_id`),
  CONSTRAINT `FKFA72D599EE8C538A` FOREIGN KEY (`child_id`) REFERENCES `paternity_report_subject` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=87661 DEFAULT CHARSET=latin1;;
/*!40101 SET character_set_client = @saved_cs_client */;;
/*!40101 SET @saved_cs_client     = @@character_set_client */;;
/*!40101 SET character_set_client = utf8 */;;
CREATE TABLE `paternity_report_subject` (
  `DTYPE` varchar(31) NOT NULL,
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `array_id` varchar(255) DEFAULT NULL,
  `sample_id` varchar(255) DEFAULT NULL,
  `subject_id` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `race` varchar(255) DEFAULT NULL,
  `sample_collected` varchar(255) DEFAULT NULL,
  `redraw_sample_id` varchar(255) DEFAULT NULL,
  `redraw_sample_collected` varchar(255) DEFAULT NULL,
  `algorithm_call` varchar(255) DEFAULT NULL,
  `interpretation` varchar(255) DEFAULT NULL,
  `interpretation_text` varchar(1024) DEFAULT NULL,
  `override_call` varchar(255) DEFAULT NULL,
  `override_plot` varchar(255) DEFAULT NULL,
  `report_id` bigint(20) DEFAULT NULL,
  `drop_out_rate` double DEFAULT NULL,
  `report_plot` varchar(255) DEFAULT NULL,
  `error_list_id` bigint(20) DEFAULT NULL,
  `warning_list_id` bigint(20) DEFAULT NULL,
  `handcall_error_list_id` bigint(20) DEFAULT NULL,
  `handcall_warning_list_id` bigint(20) DEFAULT NULL,
  `sample_received` varchar(255) DEFAULT NULL,
  `redraw_sample_received` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKA326F7303BFA6ABA` (`report_id`),
  KEY `FKA326F730B764DA90` (`warning_list_id`),
  KEY `FKA326F730EEC0D0FC` (`error_list_id`),
  KEY `FKA326F730B151C38A` (`handcall_error_list_id`),
  KEY `FKA326F7301983619E` (`handcall_warning_list_id`),
  CONSTRAINT `FKA326F7303BFA6ABA` FOREIGN KEY (`report_id`) REFERENCES `paternity_report` (`id`),
  CONSTRAINT `FKA326F730B764DA90` FOREIGN KEY (`warning_list_id`) REFERENCES `paternity_report_code_list` (`id`),
  CONSTRAINT `FKA326F730EEC0D0FC` FOREIGN KEY (`error_list_id`) REFERENCES `paternity_report_code_list` (`id`),
  CONSTRAINT `paternity_report_subject_ibfk_1` FOREIGN KEY (`handcall_error_list_id`) REFERENCES `paternity_report_code_list` (`id`),
  CONSTRAINT `paternity_report_subject_ibfk_2` FOREIGN KEY (`handcall_warning_list_id`) REFERENCES `paternity_report_code_list` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=52891 DEFAULT CHARSET=latin1;;
/*!40101 SET character_set_client = @saved_cs_client */;;
/*!40101 SET @saved_cs_client     = @@character_set_client */;;
/*!40101 SET character_set_client = utf8 */;;
CREATE TABLE `paternityfields_hl7panels` (
  `PaternityFields_id` bigint(20) NOT NULL,
  `hl7panels` varchar(255) DEFAULT NULL,
  KEY `FK2ECF946C5D793F64` (`PaternityFields_id`),
  CONSTRAINT `FK2ECF946C5D793F64` FOREIGN KEY (`PaternityFields_id`) REFERENCES `paternity_fields` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;;
/*!40101 SET character_set_client = @saved_cs_client */;;
/*!40101 SET @saved_cs_client     = @@character_set_client */;;
/*!40101 SET character_set_client = utf8 */;;
CREATE TABLE `patient` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `dob` datetime DEFAULT NULL,
  `firstname` varchar(255) DEFAULT NULL,
  `lastname` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;;
/*!40101 SET character_set_client = @saved_cs_client */;;
SET @saved_cs_client     = @@character_set_client;;
SET character_set_client = utf8;;
/*!50001 CREATE TABLE `patientcontactinfos` (
  `Case` tinyint NOT NULL,
  `Transaction Profile` tinyint NOT NULL,
  `Date Xifin Submitted` tinyint NOT NULL,
  `First Name` tinyint NOT NULL,
  `Last Name` tinyint NOT NULL,
  `Address Line 1` tinyint NOT NULL,
  `Address Line 2` tinyint NOT NULL,
  `City` tinyint NOT NULL,
  `State` tinyint NOT NULL,
  `Zip Code` tinyint NOT NULL,
  `Phone Number` tinyint NOT NULL,
  `Email` tinyint NOT NULL,
  `Referring Clinic` tinyint NOT NULL,
  `Physician Name` tinyint NOT NULL,
  `Test Type` tinyint NOT NULL
) ENGINE=MyISAM */;;
SET character_set_client = @saved_cs_client;;
/*!40101 SET @saved_cs_client     = @@character_set_client */;;
/*!40101 SET character_set_client = utf8 */;;
CREATE TABLE `pcrplate` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `barcode` varchar(255) NOT NULL,
  `state` varchar(255) DEFAULT NULL,
  `dilutionplate_id` bigint(20) DEFAULT NULL,
  `primerpair_id` bigint(20) DEFAULT NULL,
  `seqplate_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `barcode` (`barcode`),
  KEY `FKDF26D597AC53DB7A` (`dilutionplate_id`),
  KEY `FKDF26D597BE7D3BDA` (`seqplate_id`),
  KEY `FKDF26D5971C4A9AAF` (`primerpair_id`),
  CONSTRAINT `FKDF26D5971C4A9AAF` FOREIGN KEY (`primerpair_id`) REFERENCES `diseaseassociations`.`primerpair` (`id`),
  CONSTRAINT `FKDF26D597AC53DB7A` FOREIGN KEY (`dilutionplate_id`) REFERENCES `dilutionplate` (`id`),
  CONSTRAINT `FKDF26D597BE7D3BDA` FOREIGN KEY (`seqplate_id`) REFERENCES `seqplate` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1309 DEFAULT CHARSET=latin1;;
/*!40101 SET character_set_client = @saved_cs_client */;;
/*!40101 SET @saved_cs_client     = @@character_set_client */;;
/*!40101 SET character_set_client = utf8 */;;
CREATE TABLE `pcrplate_reaction` (
  `pcrplates_id` bigint(20) NOT NULL,
  `wells_id` bigint(20) NOT NULL,
  `position` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`pcrplates_id`,`position`),
  KEY `FKD394F3F16878E995` (`pcrplates_id`),
  KEY `FKD394F3F1F5AE09C7` (`wells_id`),
  CONSTRAINT `FKD394F3F16878E995` FOREIGN KEY (`pcrplates_id`) REFERENCES `pcrplate` (`id`),
  CONSTRAINT `FKD394F3F1F5AE09C7` FOREIGN KEY (`wells_id`) REFERENCES `reaction` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;;
/*!40101 SET character_set_client = @saved_cs_client */;;
/*!40101 SET @saved_cs_client     = @@character_set_client */;;
/*!40101 SET character_set_client = utf8 */;;
CREATE TABLE `plate` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;;
/*!40101 SET character_set_client = @saved_cs_client */;;
/*!40101 SET @saved_cs_client     = @@character_set_client */;;
/*!40101 SET character_set_client = utf8 */;;
CREATE TABLE `plate_disposal` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `plate_type` varchar(255) NOT NULL,
  `plate_barcode` varchar(255) NOT NULL,
  `disposal_state` varchar(255) DEFAULT NULL,
  `disposal_state_reason` varchar(255) DEFAULT NULL,
  `disposed_by` varchar(255) DEFAULT NULL,
  `disposal_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `platetype_IDX` (`plate_type`),
  KEY `platebarcode_IDX` (`plate_barcode`)
) ENGINE=InnoDB AUTO_INCREMENT=224450 DEFAULT CHARSET=latin1;;
/*!40101 SET character_set_client = @saved_cs_client */;;
/*!40101 SET @saved_cs_client     = @@character_set_client */;;
/*!40101 SET character_set_client = utf8 */;;
CREATE TABLE `platewellsample` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `sample_id` bigint(20) NOT NULL,
  `sourceplate_id` bigint(20) DEFAULT NULL,
  `sourceposition_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK1PLATEWELLSAMPLEID_idx` (`sample_id`),
  KEY `FK2PLATEWELLSAMPLESPID_idx` (`sourceplate_id`),
  CONSTRAINT `FK1PLATEWELLSAMPLEID` FOREIGN KEY (`sample_id`) REFERENCES `sample` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK2PLATEWELLSAMPLESPID` FOREIGN KEY (`sourceplate_id`) REFERENCES `npt_plate` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=5262268 DEFAULT CHARSET=latin1;;
/*!40101 SET character_set_client = @saved_cs_client */;;
/*!40101 SET @saved_cs_client     = @@character_set_client */;;
/*!40101 SET character_set_client = utf8 */;;
CREATE TABLE `prepprocedure` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;;
/*!40101 SET character_set_client = @saved_cs_client */;;
SET @saved_cs_client     = @@character_set_client;;
SET character_set_client = utf8;;
/*!50001 CREATE TABLE `prepsamplesummary` (
  `Case(s)` tinyint NOT NULL,
  `Sample Barcode` tinyint NOT NULL,
  `Root Barcode` tinyint NOT NULL,
  `Genomic Prep Procedure` tinyint NOT NULL,
  `Test Type` tinyint NOT NULL,
  `Prep Date` tinyint NOT NULL,
  `Root Sample Receive Date` tinyint NOT NULL,
  `Earliest Case Open Date` tinyint NOT NULL,
  `Sample Type` tinyint NOT NULL,
  `Prenatus` tinyint NOT NULL,
  `NIPT Research` tinyint NOT NULL,
  `NIPT Bridging Study` tinyint NOT NULL,
  `Territory Name` tinyint NOT NULL
) ENGINE=MyISAM */;;
SET character_set_client = @saved_cs_client;;
/*!40101 SET @saved_cs_client     = @@character_set_client */;;
/*!40101 SET character_set_client = utf8 */;;
CREATE TABLE `pricingplan` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `testtype` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=62 DEFAULT CHARSET=latin1;;
/*!40101 SET character_set_client = @saved_cs_client */;;
/*!40101 SET @saved_cs_client     = @@character_set_client */;;
/*!40101 SET character_set_client = utf8 */;;
CREATE TABLE `productionruns` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `jobdir` varchar(45) NOT NULL,
  `arrayId` varchar(45) NOT NULL,
  `sampleId` varchar(45) NOT NULL,
  `casefile_id` bigint(20) NOT NULL,
  `embryoId` varchar(10) NOT NULL,
  `subjectType` varchar(45) DEFAULT NULL,
  `sampleType` varchar(45) DEFAULT NULL,
  `cellType` varchar(45) DEFAULT NULL,
  `chrom` char(2) NOT NULL,
  `hypothesis` varchar(10) NOT NULL,
  `hypothesisConf` decimal(10,0) NOT NULL,
  `isEuploid` int(10) unsigned NOT NULL,
  `healthConf` varchar(45) NOT NULL,
  `isSegmented` varchar(10) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  `tissueType` varchar(45) DEFAULT NULL,
  `sampleScale` varchar(45) DEFAULT NULL,
  `prepProcedure` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `job_constraint` (`jobdir`,`arrayId`,`chrom`)
) ENGINE=InnoDB AUTO_INCREMENT=193339 DEFAULT CHARSET=latin1;;
/*!40101 SET character_set_client = @saved_cs_client */;;
/*!40101 SET @saved_cs_client     = @@character_set_client */;;
/*!40101 SET character_set_client = utf8 */;;
CREATE TABLE `property` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `type` varchar(45) NOT NULL,
  `label` varchar(1024) NOT NULL DEFAULT '',
  `description` varchar(255) DEFAULT NULL,
  `category` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_UNIQUE` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=latin1;;
/*!40101 SET character_set_client = @saved_cs_client */;;
/*!40101 SET @saved_cs_client     = @@character_set_client */;;
/*!40101 SET character_set_client = utf8 */;;
CREATE TABLE `propertyenum` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `property_id` int(11) NOT NULL,
  `enumvalue` varchar(250) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK` (`property_id`),
  CONSTRAINT `FK` FOREIGN KEY (`property_id`) REFERENCES `property` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;;
/*!40101 SET character_set_client = @saved_cs_client */;;
/*!40101 SET @saved_cs_client     = @@character_set_client */;;
/*!40101 SET character_set_client = utf8 */;;
CREATE TABLE `protocol` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;;
/*!40101 SET character_set_client = @saved_cs_client */;;
/*!40101 SET @saved_cs_client     = @@character_set_client */;;
/*!40101 SET character_set_client = utf8 */;;
CREATE TABLE `provider` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `credentials` varchar(255) DEFAULT NULL,
  `deleted` bit(1) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `firstname` varchar(255) DEFAULT NULL,
  `lastname` varchar(255) DEFAULT NULL,
  `licensenumber` varchar(255) DEFAULT NULL,
  `note` text,
  `npinumber` varchar(255) DEFAULT NULL,
  `phonenumber` varchar(255) DEFAULT NULL,
  `prefix` varchar(255) DEFAULT NULL,
  `signatureonfile` bit(1) NOT NULL DEFAULT b'0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=42627 DEFAULT CHARSET=latin1;;
/*!40101 SET character_set_client = @saved_cs_client */;;
/*!40101 SET @saved_cs_client     = @@character_set_client */;;
/*!40101 SET character_set_client = utf8 */;;
CREATE TABLE `provider_deliverydestination` (
  `Provider_id` bigint(20) NOT NULL,
  `deliverydestinations_id` bigint(20) NOT NULL,
  UNIQUE KEY `deliverydestinations_id` (`deliverydestinations_id`),
  UNIQUE KEY `UK_951741d3ac62442bb1a36c402f9` (`deliverydestinations_id`),
  KEY `FKA94D9C2CCA3E491` (`Provider_id`),
  KEY `FKA94D9C2C7CD02DA4` (`deliverydestinations_id`),
  CONSTRAINT `FKA94D9C2C7CD02DA4` FOREIGN KEY (`deliverydestinations_id`) REFERENCES `deliverydestination` (`id`),
  CONSTRAINT `FKA94D9C2CCA3E491` FOREIGN KEY (`Provider_id`) REFERENCES `provider` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;;
/*!40101 SET character_set_client = @saved_cs_client */;;
SET @saved_cs_client     = @@character_set_client;;
SET character_set_client = utf8;;
/*!50001 CREATE TABLE `publishedreport_paternity` (
  `clinic_name` tinyint NOT NULL,
  `casefile_id` tinyint NOT NULL,
  `report_id` tinyint NOT NULL,
  `sample_id` tinyint NOT NULL,
  `mother_sample_received` tinyint NOT NULL,
  `mother_sample_collected` tinyint NOT NULL,
  `mother_redraw_sample_received` tinyint NOT NULL,
  `mother_redraw_sample_collected` tinyint NOT NULL,
  `af_sample_received` tinyint NOT NULL,
  `af_sample_collected` tinyint NOT NULL,
  `af_redraw_sample_received` tinyint NOT NULL,
  `af_redraw_sample_collected` tinyint NOT NULL,
  `af_sample_id` tinyint NOT NULL,
  `reported_call` tinyint NOT NULL,
  `algorithm_call` tinyint NOT NULL,
  `reported_plot` tinyint NOT NULL,
  `algorithm_plot` tinyint NOT NULL,
  `p_value` tinyint NOT NULL,
  `fetal_fraction_context_none` tinyint NOT NULL,
  `fetal_fraction_context_af` tinyint NOT NULL,
  `drop_out_rate` tinyint NOT NULL,
  `gestationalage` tinyint NOT NULL,
  `mother_race` tinyint NOT NULL,
  `alleged_father_race` tinyint NOT NULL,
  `report_senton` tinyint NOT NULL,
  `published` tinyint NOT NULL,
  `amended` tinyint NOT NULL
) ENGINE=MyISAM */;;
SET character_set_client = @saved_cs_client;;
SET @saved_cs_client     = @@character_set_client;;
SET character_set_client = utf8;;
/*!50001 CREATE TABLE `publishedreport_per_chrom` (
  `casefile_id` tinyint NOT NULL,
  `testtype` tinyint NOT NULL,
  `useEggDonor` tinyint NOT NULL,
  `maternal age` tinyint NOT NULL,
  `array` tinyint NOT NULL,
  `sampleid` tinyint NOT NULL,
  `sampletype` tinyint NOT NULL,
  `bucket_normalized` tinyint NOT NULL,
  `buckettype` tinyint NOT NULL,
  `embryoid` tinyint NOT NULL,
  `euploid` tinyint NOT NULL,
  `euploidconfidence` tinyint NOT NULL,
  `rank` tinyint NOT NULL,
  `mcc` tinyint NOT NULL,
  `labnote` tinyint NOT NULL,
  `gestationalage` tinyint NOT NULL,
  `senton` tinyint NOT NULL,
  `sentto` tinyint NOT NULL,
  `jobdir` tinyint NOT NULL,
  `report_id` tinyint NOT NULL,
  `reportblastomere_id` tinyint NOT NULL,
  `summarynumber` tinyint NOT NULL,
  `bestsubhypothesis` tinyint NOT NULL,
  `chrom_euploid` tinyint NOT NULL,
  `chrom_euploidconfidence` tinyint NOT NULL,
  `chrom` tinyint NOT NULL,
  `segmented` tinyint NOT NULL
) ENGINE=MyISAM */;;
SET character_set_client = @saved_cs_client;;
SET @saved_cs_client     = @@character_set_client;;
SET character_set_client = utf8;;
/*!50001 CREATE TABLE `publishedreport_per_target` (
  `casefile_id` tinyint NOT NULL,
  `testtype` tinyint NOT NULL,
  `useEggDonor` tinyint NOT NULL,
  `maternal age` tinyint NOT NULL,
  `array` tinyint NOT NULL,
  `sampleid` tinyint NOT NULL,
  `sampletype` tinyint NOT NULL,
  `bucket_normalized` tinyint NOT NULL,
  `buckettype` tinyint NOT NULL,
  `embryoid` tinyint NOT NULL,
  `euploid` tinyint NOT NULL,
  `euploidconfidence` tinyint NOT NULL,
  `rank` tinyint NOT NULL,
  `mcc` tinyint NOT NULL,
  `labnote` tinyint NOT NULL,
  `gestationalage` tinyint NOT NULL,
  `senton` tinyint NOT NULL,
  `sentto` tinyint NOT NULL,
  `jobdir` tinyint NOT NULL,
  `report_id` tinyint NOT NULL,
  `reportblastomere_id` tinyint NOT NULL,
  `summarynumber` tinyint NOT NULL
) ENGINE=MyISAM */;;
SET character_set_client = @saved_cs_client;;
SET @saved_cs_client     = @@character_set_client;;
SET character_set_client = utf8;;
/*!50001 CREATE TABLE `publishedreport_per_target_mcc` (
  `casefile_id` tinyint NOT NULL,
  `testtype` tinyint NOT NULL,
  `useEggDonor` tinyint NOT NULL,
  `maternal age` tinyint NOT NULL,
  `array` tinyint NOT NULL,
  `sampleid` tinyint NOT NULL,
  `sampletype` tinyint NOT NULL,
  `bucket_normalized` tinyint NOT NULL,
  `buckettype` tinyint NOT NULL,
  `embryoid` tinyint NOT NULL,
  `euploid` tinyint NOT NULL,
  `euploidconfidence` tinyint NOT NULL,
  `rank` tinyint NOT NULL,
  `mcc` tinyint NOT NULL,
  `labnote` tinyint NOT NULL,
  `gestationalage` tinyint NOT NULL,
  `senton` tinyint NOT NULL,
  `sentto` tinyint NOT NULL,
  `jobdir` tinyint NOT NULL,
  `report_id` tinyint NOT NULL,
  `reportblastomere_id` tinyint NOT NULL,
  `summarynumber` tinyint NOT NULL,
  `anymcc` tinyint NOT NULL,
  `unrecovered` tinyint NOT NULL
) ENGINE=MyISAM */;;
SET character_set_client = @saved_cs_client;;
SET @saved_cs_client     = @@character_set_client;;
SET character_set_client = utf8;;
/*!50001 CREATE TABLE `publishedreport_per_target_pivotedchrom` (
  `casefile_id` tinyint NOT NULL,
  `testtype` tinyint NOT NULL,
  `useEggDonor` tinyint NOT NULL,
  `maternal age` tinyint NOT NULL,
  `array` tinyint NOT NULL,
  `sampleid` tinyint NOT NULL,
  `sampletype` tinyint NOT NULL,
  `bucket_normalized` tinyint NOT NULL,
  `buckettype` tinyint NOT NULL,
  `embryoid` tinyint NOT NULL,
  `euploid` tinyint NOT NULL,
  `euploidconfidence` tinyint NOT NULL,
  `rank` tinyint NOT NULL,
  `mcc` tinyint NOT NULL,
  `labnote` tinyint NOT NULL,
  `gestationalage` tinyint NOT NULL,
  `senton` tinyint NOT NULL,
  `sentto` tinyint NOT NULL,
  `jobdir` tinyint NOT NULL,
  `report_id` tinyint NOT NULL,
  `reportblastomere_id` tinyint NOT NULL,
  `summarynumber` tinyint NOT NULL,
  `bestsubhypothesis_1` tinyint NOT NULL,
  `chrom_euploidconfidence_1` tinyint NOT NULL,
  `segmented_1` tinyint NOT NULL,
  `bestsubhypothesis_2` tinyint NOT NULL,
  `chrom_euploidconfidence_2` tinyint NOT NULL,
  `segmented_2` tinyint NOT NULL,
  `bestsubhypothesis_3` tinyint NOT NULL,
  `chrom_euploidconfidence_3` tinyint NOT NULL,
  `segmented_3` tinyint NOT NULL,
  `bestsubhypothesis_4` tinyint NOT NULL,
  `chrom_euploidconfidence_4` tinyint NOT NULL,
  `segmented_4` tinyint NOT NULL,
  `bestsubhypothesis_5` tinyint NOT NULL,
  `chrom_euploidconfidence_5` tinyint NOT NULL,
  `segmented_5` tinyint NOT NULL,
  `bestsubhypothesis_6` tinyint NOT NULL,
  `chrom_euploidconfidence_6` tinyint NOT NULL,
  `segmented_6` tinyint NOT NULL,
  `bestsubhypothesis_7` tinyint NOT NULL,
  `chrom_euploidconfidence_7` tinyint NOT NULL,
  `segmented_7` tinyint NOT NULL,
  `bestsubhypothesis_8` tinyint NOT NULL,
  `chrom_euploidconfidence_8` tinyint NOT NULL,
  `segmented_8` tinyint NOT NULL,
  `bestsubhypothesis_9` tinyint NOT NULL,
  `chrom_euploidconfidence_9` tinyint NOT NULL,
  `segmented_9` tinyint NOT NULL,
  `bestsubhypothesis_10` tinyint NOT NULL,
  `chrom_euploidconfidence_10` tinyint NOT NULL,
  `segmented_10` tinyint NOT NULL,
  `bestsubhypothesis_11` tinyint NOT NULL,
  `chrom_euploidconfidence_11` tinyint NOT NULL,
  `segmented_11` tinyint NOT NULL,
  `bestsubhypothesis_12` tinyint NOT NULL,
  `chrom_euploidconfidence_12` tinyint NOT NULL,
  `segmented_12` tinyint NOT NULL,
  `bestsubhypothesis_13` tinyint NOT NULL,
  `chrom_euploidconfidence_13` tinyint NOT NULL,
  `segmented_13` tinyint NOT NULL,
  `bestsubhypothesis_14` tinyint NOT NULL,
  `chrom_euploidconfidence_14` tinyint NOT NULL,
  `segmented_14` tinyint NOT NULL,
  `bestsubhypothesis_15` tinyint NOT NULL,
  `chrom_euploidconfidence_15` tinyint NOT NULL,
  `segmented_15` tinyint NOT NULL,
  `bestsubhypothesis_16` tinyint NOT NULL,
  `chrom_euploidconfidence_16` tinyint NOT NULL,
  `segmented_16` tinyint NOT NULL,
  `bestsubhypothesis_17` tinyint NOT NULL,
  `chrom_euploidconfidence_17` tinyint NOT NULL,
  `segmented_17` tinyint NOT NULL,
  `bestsubhypothesis_18` tinyint NOT NULL,
  `chrom_euploidconfidence_18` tinyint NOT NULL,
  `segmented_18` tinyint NOT NULL,
  `bestsubhypothesis_19` tinyint NOT NULL,
  `chrom_euploidconfidence_19` tinyint NOT NULL,
  `segmented_19` tinyint NOT NULL,
  `bestsubhypothesis_20` tinyint NOT NULL,
  `chrom_euploidconfidence_20` tinyint NOT NULL,
  `segmented_20` tinyint NOT NULL,
  `bestsubhypothesis_21` tinyint NOT NULL,
  `chrom_euploidconfidence_21` tinyint NOT NULL,
  `segmented_21` tinyint NOT NULL,
  `bestsubhypothesis_22` tinyint NOT NULL,
  `chrom_euploidconfidence_22` tinyint NOT NULL,
  `segmented_22` tinyint NOT NULL,
  `bestsubhypothesis_Sex` tinyint NOT NULL,
  `chrom_euploidconfidence_Sex` tinyint NOT NULL,
  `segmented_Sex` tinyint NOT NULL
) ENGINE=MyISAM */;;
SET character_set_client = @saved_cs_client;;
/*!40101 SET @saved_cs_client     = @@character_set_client */;;
/*!40101 SET character_set_client = utf8 */;;
CREATE TABLE `qc_result` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `created` datetime DEFAULT NULL,
  `message` longtext,
  `overridden` datetime DEFAULT NULL,
  `overridereason` varchar(255) DEFAULT NULL,
  `overrideresult` varchar(255) DEFAULT NULL,
  `result` varchar(255) NOT NULL,
  `overriddenby_id` bigint(20) DEFAULT NULL,
  `type_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK8071EEA5D58FA3D` (`overriddenby_id`),
  KEY `FK8071EEA16586C08` (`type_id`),
  CONSTRAINT `FK8071EEA16586C08` FOREIGN KEY (`type_id`) REFERENCES `qc_type` (`id`),
  CONSTRAINT `FK8071EEA5D58FA3D` FOREIGN KEY (`overriddenby_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25314025 DEFAULT CHARSET=latin1;;
/*!40101 SET character_set_client = @saved_cs_client */;;
/*!40101 SET @saved_cs_client     = @@character_set_client */;;
/*!40101 SET character_set_client = utf8 */;;
CREATE TABLE `qc_result_sample` (
  `qualitycontrolresults_id` bigint(20) NOT NULL,
  `samples_id` bigint(20) NOT NULL,
  PRIMARY KEY (`qualitycontrolresults_id`,`samples_id`),
  KEY `FKF465989FEE02C551` (`samples_id`),
  KEY `FKF465989F781D952D` (`qualitycontrolresults_id`),
  CONSTRAINT `FKF465989F781D952D` FOREIGN KEY (`qualitycontrolresults_id`) REFERENCES `qc_result` (`id`),
  CONSTRAINT `FKF465989FEE02C551` FOREIGN KEY (`samples_id`) REFERENCES `sample` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;;
/*!40101 SET character_set_client = @saved_cs_client */;;
/*!40101 SET @saved_cs_client     = @@character_set_client */;;
/*!40101 SET character_set_client = utf8 */;;
CREATE TABLE `qc_result_sequencingrun` (
  `qualitycontrolresults_id` bigint(20) NOT NULL,
  `sequencingruns_id` bigint(20) NOT NULL,
  PRIMARY KEY (`qualitycontrolresults_id`,`sequencingruns_id`),
  KEY `FK76C2D0F8781D952D` (`qualitycontrolresults_id`),
  KEY `FK76C2D0F8FCB648E` (`sequencingruns_id`),
  CONSTRAINT `FK76C2D0F8781D952D` FOREIGN KEY (`qualitycontrolresults_id`) REFERENCES `qc_result` (`id`),
  CONSTRAINT `FK76C2D0F8FCB648E` FOREIGN KEY (`sequencingruns_id`) REFERENCES `hts`.`sequencingrun` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;;
/*!40101 SET character_set_client = @saved_cs_client */;;
/*!40101 SET @saved_cs_client     = @@character_set_client */;;
/*!40101 SET character_set_client = utf8 */;;
CREATE TABLE `qc_result_sequencingsample` (
  `qualitycontrolresults_id` bigint(20) NOT NULL,
  `sequencingsamples_id` bigint(20) NOT NULL,
  `sampletype` varchar(10) NOT NULL DEFAULT 'PRIMARY',
  PRIMARY KEY (`qualitycontrolresults_id`,`sequencingsamples_id`),
  KEY `FK59982C1D781D952D` (`qualitycontrolresults_id`),
  KEY `FK59982C1D7502B48A` (`sequencingsamples_id`),
  CONSTRAINT `FK59982C1D7502B48A` FOREIGN KEY (`sequencingsamples_id`) REFERENCES `hts`.`sequencingsample` (`id`),
  CONSTRAINT `FK59982C1D781D952D` FOREIGN KEY (`qualitycontrolresults_id`) REFERENCES `qc_result` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;;
/*!40101 SET character_set_client = @saved_cs_client */;;
/*!40101 SET @saved_cs_client     = @@character_set_client */;;
/*!40101 SET character_set_client = utf8 */;;
CREATE TABLE `qc_result_stats` (
  `id` bigint(20) NOT NULL,
  `phred` int(11) NOT NULL,
  `testtype` varchar(45) DEFAULT NULL,
  `hash` binary(32) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `hash_UNIQUE` (`hash`),
  KEY `FKA4D1EF0ABE7BE646` (`id`),
  CONSTRAINT `FKA4D1EF0ABE7BE646` FOREIGN KEY (`id`) REFERENCES `qc_result` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;;
/*!40101 SET character_set_client = @saved_cs_client */;;
/*!40101 SET @saved_cs_client     = @@character_set_client */;;
/*!40101 SET character_set_client = utf8 */;;
CREATE TABLE `qc_rollup` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `created` datetime DEFAULT NULL,
  `message` varchar(1024) DEFAULT NULL,
  `result` varchar(255) NOT NULL,
  `sequencinginitfile_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `FK890BAA5D5BC5F58` (`sequencinginitfile_id`),
  CONSTRAINT `FK890BAA5D5BC5F58` FOREIGN KEY (`sequencinginitfile_id`) REFERENCES `alg_sequencinginitfile` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2011021 DEFAULT CHARSET=latin1;;
/*!40101 SET character_set_client = @saved_cs_client */;;
/*!40101 SET @saved_cs_client     = @@character_set_client */;;
/*!40101 SET character_set_client = utf8 */;;
CREATE TABLE `qc_rollup_result` (
  `qc_rollup_id` bigint(20) NOT NULL,
  `qualitycontrolresults_id` bigint(20) NOT NULL,
  PRIMARY KEY (`qc_rollup_id`,`qualitycontrolresults_id`),
  KEY `FK2DE9B6F7781D952D` (`qualitycontrolresults_id`),
  KEY `FK2DE9B6F7814EEDDB` (`qc_rollup_id`),
  CONSTRAINT `FK2DE9B6F7781D952D` FOREIGN KEY (`qualitycontrolresults_id`) REFERENCES `qc_result` (`id`),
  CONSTRAINT `FK2DE9B6F7814EEDDB` FOREIGN KEY (`qc_rollup_id`) REFERENCES `qc_rollup` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;;
/*!40101 SET character_set_client = @saved_cs_client */;;
/*!40101 SET @saved_cs_client     = @@character_set_client */;;
/*!40101 SET character_set_client = utf8 */;;
CREATE TABLE `qc_rollup_sequencingsample` (
  `qc_rollup_id` bigint(20) NOT NULL,
  `sequencingsamples_id` bigint(20) NOT NULL,
  PRIMARY KEY (`qc_rollup_id`,`sequencingsamples_id`),
  KEY `FK46A81DC27502B48A` (`sequencingsamples_id`),
  KEY `FK46A81DC2814EEDDB` (`qc_rollup_id`),
  CONSTRAINT `FK46A81DC27502B48A` FOREIGN KEY (`sequencingsamples_id`) REFERENCES `hts`.`sequencingsample` (`id`),
  CONSTRAINT `FK46A81DC2814EEDDB` FOREIGN KEY (`qc_rollup_id`) REFERENCES `qc_rollup` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;;
/*!40101 SET character_set_client = @saved_cs_client */;;
/*!40101 SET @saved_cs_client     = @@character_set_client */;;
/*!40101 SET character_set_client = utf8 */;;
CREATE TABLE `qc_statistics` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `value` double NOT NULL,
  `result_id` bigint(20) DEFAULT NULL,
  `type_id` bigint(20) DEFAULT NULL,
  `testtype` varchar(45) DEFAULT NULL,
  `hash` binary(32) DEFAULT NULL,
  `start` int(11) DEFAULT NULL,
  `end` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `hash_UNIQUE` (`hash`),
  KEY `FK7CC3D9707E6C1638` (`result_id`),
  KEY `FK7CC3D970AD891D3A` (`type_id`),
  CONSTRAINT `FK7CC3D9707E6C1638` FOREIGN KEY (`result_id`) REFERENCES `qc_result_stats` (`id`),
  CONSTRAINT `FK7CC3D970AD891D3A` FOREIGN KEY (`type_id`) REFERENCES `qc_statistics_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=77422627 DEFAULT CHARSET=utf8;;
/*!40101 SET character_set_client = @saved_cs_client */;;
/*!40101 SET @saved_cs_client     = @@character_set_client */;;
/*!40101 SET character_set_client = utf8 */;;
CREATE TABLE `qc_statistics_sequencingsample` (
  `statistics_id` bigint(20) NOT NULL,
  `sequencingsample_id` bigint(20) NOT NULL,
  `sampletype` varchar(10) NOT NULL DEFAULT 'PRIMARY',
  KEY `FK57030E57AA155A0D` (`sequencingsample_id`),
  KEY `FK57030E574D431357` (`statistics_id`),
  CONSTRAINT `FK57030E574D431357` FOREIGN KEY (`statistics_id`) REFERENCES `qc_statistics` (`id`),
  CONSTRAINT `FK57030E57AA155A0D` FOREIGN KEY (`sequencingsample_id`) REFERENCES `hts`.`sequencingsample` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;;
/*!40101 SET character_set_client = @saved_cs_client */;;
/*!40101 SET @saved_cs_client     = @@character_set_client */;;
/*!40101 SET character_set_client = utf8 */;;
CREATE TABLE `qc_statistics_type` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `description` varchar(255) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `applicability` varchar(20) NOT NULL DEFAULT 'ALL',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=203 DEFAULT CHARSET=utf8;;
/*!40101 SET character_set_client = @saved_cs_client */;;
/*!40101 SET @saved_cs_client     = @@character_set_client */;;
/*!40101 SET character_set_client = utf8 */;;
CREATE TABLE `qc_test_types` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `qc_type_id` bigint(20) NOT NULL,
  `testtype` varchar(45) NOT NULL,
  `units` varchar(45) DEFAULT NULL,
  `lowwarnthreshold` double DEFAULT NULL,
  `lowpassthreshold` double DEFAULT NULL,
  `highpassthreshold` double DEFAULT NULL,
  `highwarnthreshold` double DEFAULT NULL,
  `intendeddor` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uc_qc_test_types_qc_type_id_testtype` (`qc_type_id`,`testtype`,`intendeddor`),
  KEY `fk_qc_test_types_qc_type1_idx` (`qc_type_id`),
  CONSTRAINT `fk_qc_test_types_qc_type1` FOREIGN KEY (`qc_type_id`) REFERENCES `qc_type` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=169 DEFAULT CHARSET=latin1;;
/*!40101 SET character_set_client = @saved_cs_client */;;
/*!40101 SET @saved_cs_client     = @@character_set_client */;;
/*!40101 SET character_set_client = utf8 */;;
CREATE TABLE `qc_type` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `category` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `ismultisample` bit(1) NOT NULL DEFAULT b'0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uc_name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=94 DEFAULT CHARSET=latin1;;
/*!40101 SET character_set_client = @saved_cs_client */;;
/*!40101 SET @saved_cs_client     = @@character_set_client */;;
/*!40101 SET character_set_client = utf8 */;;
CREATE TABLE `quantitplate` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `barcode` varchar(128) NOT NULL,
  `reagentbarcode` varchar(128) NOT NULL,
  `state` varchar(128) DEFAULT NULL,
  `blank` bigint(20) DEFAULT NULL,
  `standard` bigint(20) DEFAULT NULL,
  `referenceplate_id` bigint(20) DEFAULT NULL,
  `DTYPE` varchar(31) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `barcodeunique` (`barcode`),
  KEY `refplate` (`referenceplate_id`),
  CONSTRAINT `refplate` FOREIGN KEY (`referenceplate_id`) REFERENCES `quantitplate` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3451 DEFAULT CHARSET=latin1;;
/*!40101 SET character_set_client = @saved_cs_client */;;
/*!40101 SET @saved_cs_client     = @@character_set_client */;;
/*!40101 SET character_set_client = utf8 */;;
CREATE TABLE `quantitplate_quantitwell` (
  `quantitplate_id` bigint(20) DEFAULT NULL,
  `wells_id` bigint(20) DEFAULT NULL,
  `position` int(11) DEFAULT NULL,
  KEY `quantitplateindex` (`quantitplate_id`),
  KEY `quantitwellindex` (`wells_id`),
  KEY `FK_42727ee4913549be8f5bb9a46b2` (`wells_id`),
  KEY `FK_c06ebb494be34dd98ab077a7515` (`quantitplate_id`),
  CONSTRAINT `FK_42727ee4913549be8f5bb9a46b2` FOREIGN KEY (`wells_id`) REFERENCES `quantitwell` (`id`),
  CONSTRAINT `FK_c06ebb494be34dd98ab077a7515` FOREIGN KEY (`quantitplate_id`) REFERENCES `quantitplate` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;;
/*!40101 SET character_set_client = @saved_cs_client */;;
/*!40101 SET @saved_cs_client     = @@character_set_client */;;
/*!40101 SET character_set_client = utf8 */;;
CREATE TABLE `quantitwell` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `content` double DEFAULT NULL,
  `standard` bit(1) NOT NULL,
  `source_id` bigint(20) DEFAULT NULL,
  `DTYPE` varchar(31) DEFAULT NULL,
  `position` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=319297 DEFAULT CHARSET=latin1;;
/*!40101 SET character_set_client = @saved_cs_client */;;
/*!40101 SET @saved_cs_client     = @@character_set_client */;;
/*!40101 SET character_set_client = utf8 */;;
CREATE TABLE `race` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `shortname` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=latin1;;
/*!40101 SET character_set_client = @saved_cs_client */;;
/*!40101 SET @saved_cs_client     = @@character_set_client */;;
/*!40101 SET character_set_client = utf8 */;;
CREATE TABLE `reaction` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `sample_id` bigint(20) DEFAULT NULL,
  `primerpair_id` bigint(20) DEFAULT NULL,
  `direction` enum('F','R') NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FKD0253E49D50BCD23` (`sample_id`),
  KEY `FKD0253E491C4A9AAF` (`primerpair_id`),
  CONSTRAINT `FKD0253E491C4A9AAF` FOREIGN KEY (`primerpair_id`) REFERENCES `diseaseassociations`.`primerpair` (`id`),
  CONSTRAINT `FKD0253E49D50BCD23` FOREIGN KEY (`sample_id`) REFERENCES `sample` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=106717 DEFAULT CHARSET=latin1;;
/*!40101 SET character_set_client = @saved_cs_client */;;
/*!40101 SET @saved_cs_client     = @@character_set_client */;;
/*!40101 SET character_set_client = utf8 */;;
CREATE TABLE `reasoncode` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `editable` bit(1) NOT NULL DEFAULT b'1',
  `deleted` bit(1) NOT NULL DEFAULT b'0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=latin1;;
/*!40101 SET character_set_client = @saved_cs_client */;;
SET @saved_cs_client     = @@character_set_client;;
SET character_set_client = utf8;;
/*!50001 CREATE TABLE `redrawcases` (
  `Case id` tinyint NOT NULL,
  `Opened` tinyint NOT NULL,
  `Test` tinyint NOT NULL,
  `Clinic name` tinyint NOT NULL,
  `Physician last name` tinyint NOT NULL,
  `Kit barcode` tinyint NOT NULL,
  `Kit received` tinyint NOT NULL,
  `Redraw reason` tinyint NOT NULL,
  `Redraw categories` tinyint NOT NULL,
  `Contact date` tinyint NOT NULL,
  `Contact notes` tinyint NOT NULL,
  `Contact user` tinyint NOT NULL,
  `Kit State` tinyint NOT NULL
) ENGINE=MyISAM */;;
SET character_set_client = @saved_cs_client;;
SET @saved_cs_client     = @@character_set_client;;
SET character_set_client = utf8;;
/*!50001 CREATE TABLE `redrawsummary` (
  `case_id` tinyint NOT NULL,
  `test_type` tinyint NOT NULL,
  `clinic_name` tinyint NOT NULL,
  `kit_barcode` tinyint NOT NULL,
  `subject_type` tinyint NOT NULL,
  `gestional_age` tinyint NOT NULL,
  `received` tinyint NOT NULL,
  `redrawn` tinyint NOT NULL,
  `redraw_reason` tinyint NOT NULL
) ENGINE=MyISAM */;;
SET character_set_client = @saved_cs_client;;
/*!40101 SET @saved_cs_client     = @@character_set_client */;;
/*!40101 SET character_set_client = utf8 */;;
CREATE TABLE `referral` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `structure` varchar(755) DEFAULT NULL,
  `product` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_product` (`name`,`product`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;;
/*!40101 SET character_set_client = @saved_cs_client */;;
/*!40101 SET @saved_cs_client     = @@character_set_client */;;
/*!40101 SET character_set_client = utf8 */;;
CREATE TABLE `referralreason` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;;
/*!40101 SET character_set_client = @saved_cs_client */;;
/*!40101 SET @saved_cs_client     = @@character_set_client */;;
/*!40101 SET character_set_client = utf8 */;;
CREATE TABLE `report_blastomere` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `array` varchar(255) DEFAULT NULL,
  `barcode` varchar(255) DEFAULT NULL,
  `buckettype` varchar(255) DEFAULT NULL,
  `embryoid` varchar(255) DEFAULT NULL,
  `euploid` int(11) DEFAULT NULL,
  `euploidconfidence` double DEFAULT NULL,
  `labnote` varchar(255) DEFAULT NULL,
  `rank` int(11) DEFAULT NULL,
  `sampleid` varchar(255) DEFAULT NULL,
  `summarynumber` int(11) DEFAULT NULL,
  `viable` int(11) DEFAULT NULL,
  `report_id` bigint(20) NOT NULL,
  `sampletype_id` bigint(20) DEFAULT NULL,
  `idx` int(11) DEFAULT NULL,
  `mcc` bit(1) DEFAULT NULL,
  `collectiondate` datetime DEFAULT NULL,
  `receiveddate` datetime DEFAULT NULL,
  `incomplete` bit(1) DEFAULT b'0',
  PRIMARY KEY (`id`),
  KEY `FKBAB0FCDCA97B517` (`report_id`),
  KEY `FKBAB0FCD157B6283` (`sampletype_id`),
  KEY `report_blastomere_array_idx` (`array`),
  CONSTRAINT `FKBAB0FCD157B6283` FOREIGN KEY (`sampletype_id`) REFERENCES `sampletype` (`id`),
  CONSTRAINT `FKBAB0FCDCA97B517` FOREIGN KEY (`report_id`) REFERENCES `report_report` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=293582 DEFAULT CHARSET=latin1;;
/*!40101 SET character_set_client = @saved_cs_client */;;
/*!40101 SET @saved_cs_client     = @@character_set_client */;;
/*!40101 SET character_set_client = utf8 */;;
CREATE TABLE `report_chromosome` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `bestSubHypothesis` varchar(7) DEFAULT NULL,
  `euploid` varchar(255) DEFAULT NULL,
  `euploidconfidence` double DEFAULT NULL,
  `matstart` int(11) DEFAULT NULL,
  `matstop` int(11) DEFAULT NULL,
  `mattype` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `patstart` int(11) DEFAULT NULL,
  `patstop` int(11) DEFAULT NULL,
  `pattype` int(11) DEFAULT NULL,
  `patystart` int(11) DEFAULT NULL,
  `patystop` int(11) DEFAULT NULL,
  `patytype` int(11) DEFAULT NULL,
  `segmented` int(11) DEFAULT NULL,
  `blastomere_id` bigint(20) NOT NULL,
  `idx` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKB54EC5838E44CBD7` (`blastomere_id`),
  CONSTRAINT `FKB54EC5838E44CBD7` FOREIGN KEY (`blastomere_id`) REFERENCES `report_blastomere` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6752364 DEFAULT CHARSET=latin1;;
/*!40101 SET character_set_client = @saved_cs_client */;;
/*!40101 SET @saved_cs_client     = @@character_set_client */;;
/*!40101 SET character_set_client = utf8 */;;
CREATE TABLE `report_disease` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `ChanceAffected` double DEFAULT NULL,
  `ChanceCarrier` double DEFAULT NULL,
  `diseaseid` int(11) DEFAULT NULL,
  `model` varchar(255) DEFAULT NULL,
  `chromosomename` varchar(255) DEFAULT NULL,
  `DiseaseStatus` varchar(255) DEFAULT NULL,
  `blastomere_id` bigint(20) NOT NULL,
  `idx` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK35D505518E44CBD7` (`blastomere_id`),
  CONSTRAINT `FK35D505518E44CBD7` FOREIGN KEY (`blastomere_id`) REFERENCES `report_blastomere` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22265 DEFAULT CHARSET=latin1;;
/*!40101 SET character_set_client = @saved_cs_client */;;
/*!40101 SET @saved_cs_client     = @@character_set_client */;;
/*!40101 SET character_set_client = utf8 */;;
CREATE TABLE `report_report` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `testtype` varchar(255) DEFAULT NULL,
  `version` varchar(255) DEFAULT NULL,
  `casefile_id` bigint(20) DEFAULT NULL,
  `dateofreport` datetime DEFAULT NULL,
  `dateofcollection` datetime DEFAULT NULL,
  `dateofreceipt` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK29EAF2BFCB9103C3` (`casefile_id`),
  CONSTRAINT `FK29EAF2BFCB9103C3` FOREIGN KEY (`casefile_id`) REFERENCES `casefile` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=94426 DEFAULT CHARSET=latin1;;
/*!40101 SET character_set_client = @saved_cs_client */;;
/*!40101 SET @saved_cs_client     = @@character_set_client */;;
/*!40101 SET character_set_client = utf8 */;;
CREATE TABLE `report_variation` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `bestHypothesisConf` double DEFAULT NULL,
  `bestHypothesis` varchar(255) DEFAULT NULL,
  `variationfamilyid` bigint(20) NOT NULL,
  `variationid` int(11) DEFAULT NULL,
  `disease_id` bigint(20) NOT NULL,
  `idx` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK145D14A8A9656BFD` (`disease_id`),
  CONSTRAINT `FK145D14A8A9656BFD` FOREIGN KEY (`disease_id`) REFERENCES `report_disease` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27683 DEFAULT CHARSET=latin1;;
/*!40101 SET character_set_client = @saved_cs_client */;;
/*!40101 SET @saved_cs_client     = @@character_set_client */;;
/*!40101 SET character_set_client = utf8 */;;
CREATE TABLE `reportdiseaseresult_diseaseresult` (
  `reportdiseaseresult_id` bigint(20) NOT NULL,
  `diseaseresult_id` bigint(20) NOT NULL,
  PRIMARY KEY (`reportdiseaseresult_id`,`diseaseresult_id`),
  KEY `FK200DISEASERID_idx` (`diseaseresult_id`),
  KEY `FK100REPORTDRID` (`reportdiseaseresult_id`),
  CONSTRAINT `FK100REPORTDRID` FOREIGN KEY (`reportdiseaseresult_id`) REFERENCES `horizon_report_disease_results` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK200DISEASERRESULTID` FOREIGN KEY (`diseaseresult_id`) REFERENCES `horizondiseaseresult` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;;
/*!40101 SET character_set_client = @saved_cs_client */;;
/*!40101 SET @saved_cs_client     = @@character_set_client */;;
/*!40101 SET character_set_client = utf8 */;;
CREATE TABLE `reportformat` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `xsltemplatefile` varchar(255) DEFAULT NULL,
  `fileextension` varchar(255) DEFAULT NULL,
  `mimetype` varchar(255) DEFAULT NULL,
  `createhl7` bit(1) NOT NULL DEFAULT b'0',
  `embedPDF` bit(1) NOT NULL DEFAULT b'0',
  `reportVersion` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3501 DEFAULT CHARSET=latin1;;
/*!40101 SET character_set_client = @saved_cs_client */;;
/*!40101 SET @saved_cs_client     = @@character_set_client */;;
/*!40101 SET character_set_client = utf8 */;;
CREATE TABLE `reportshipmentrecord` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `published` bit(1) NOT NULL,
  `senton` datetime DEFAULT NULL,
  `sentto` varchar(1024) DEFAULT NULL,
  `sentby` varchar(1024) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16329 DEFAULT CHARSET=latin1;;
/*!40101 SET character_set_client = @saved_cs_client */;;
/*!40101 SET @saved_cs_client     = @@character_set_client */;;
/*!40101 SET character_set_client = utf8 */;;
CREATE TABLE `reportshipmentrecord_documentinfo` (
  `ReportShipmentRecord_id` bigint(20) NOT NULL,
  `documentinfos_id` bigint(20) NOT NULL,
  KEY `FKB7245FC932A23326` (`ReportShipmentRecord_id`),
  KEY `FKB7245FC987E23190` (`documentinfos_id`),
  CONSTRAINT `FKB7245FC932A23326` FOREIGN KEY (`ReportShipmentRecord_id`) REFERENCES `reportshipmentrecord` (`id`),
  CONSTRAINT `FKB7245FC987E23190` FOREIGN KEY (`documentinfos_id`) REFERENCES `documentinfo` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;;
/*!40101 SET character_set_client = @saved_cs_client */;;
SET @saved_cs_client     = @@character_set_client;;
SET character_set_client = utf8;;
/*!50001 CREATE TABLE `reportsummary` (
  `casefile id` tinyint NOT NULL,
  `triploidy ordered` tinyint NOT NULL,
  `third-party case id` tinyint NOT NULL,
  `alternate_case_id` tinyint NOT NULL,
  `report id` tinyint NOT NULL,
  `paternity report id` tinyint NOT NULL,
  `Physician name` tinyint NOT NULL,
  `Product` tinyint NOT NULL,
  `billable` tinyint NOT NULL,
  `non-billable` tinyint NOT NULL,
  `Payment Plan` tinyint NOT NULL,
  `Day 5 bx w/freezing` tinyint NOT NULL,
  `Day 5 bx w/fresh transfer` tinyint NOT NULL,
  `translocation` tinyint NOT NULL,
  `additional parent` tinyint NOT NULL,
  `embryo batching` tinyint NOT NULL,
  `number of embryos excl. re-bx` tinyint NOT NULL,
  `special billing` tinyint NOT NULL,
  `pricing plan` tinyint NOT NULL,
  `pricing plan valid from` tinyint NOT NULL,
  `pricing plan bill-to` tinyint NOT NULL,
  `productFamily` tinyint NOT NULL,
  `subTestType` tinyint NOT NULL,
  `cs ashkenazi jewish` tinyint NOT NULL,
  `cs cystic fibrosis` tinyint NOT NULL,
  `cs cystic fibrosis external` tinyint NOT NULL,
  `cs fragile x` tinyint NOT NULL,
  `cs spinal muscular atrophy` tinyint NOT NULL,
  `clinic_id` tinyint NOT NULL,
  `clinic` tinyint NOT NULL,
  `satellite territory` tinyint NOT NULL,
  `clinic territory` tinyint NOT NULL,
  `territory` tinyint NOT NULL,
  `clinic specialist` tinyint NOT NULL,
  `clinic state` tinyint NOT NULL,
  `clinic country` tinyint NOT NULL,
  `satellite_street1` tinyint NOT NULL,
  `satellite_street2` tinyint NOT NULL,
  `satellite_city` tinyint NOT NULL,
  `satellite_state` tinyint NOT NULL,
  `satellite_country` tinyint NOT NULL,
  `sent to` tinyint NOT NULL,
  `delivered date` tinyint NOT NULL,
  `delivered month` tinyint NOT NULL,
  `opened date` tinyint NOT NULL,
  `Paternity AFN Case` tinyint NOT NULL
) ENGINE=MyISAM */;;
SET character_set_client = @saved_cs_client;;
SET @saved_cs_client     = @@character_set_client;;
SET character_set_client = utf8;;
/*!50001 CREATE TABLE `rerun_reflex_by_sample` (
  `rundate` tinyint NOT NULL,
  `samplebarcode` tinyint NOT NULL,
  `LDOR_reruns` tinyint NOT NULL,
  `HDOR_reruns` tinyint NOT NULL,
  `cnt` tinyint NOT NULL
) ENGINE=MyISAM */;;
SET character_set_client = @saved_cs_client;;
/*!40101 SET @saved_cs_client     = @@character_set_client */;;
/*!40101 SET character_set_client = utf8 */;;
CREATE TABLE `research_sample_comparison` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `source_id` bigint(20) NOT NULL,
  `compare_barcode` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `res_sample_comparison_uk` (`source_id`,`compare_barcode`),
  KEY `res_sample_comparison_sample_source_fk` (`source_id`),
  KEY `compare_barcode` (`compare_barcode`),
  CONSTRAINT `res_sample_comparison_sample_source_fk` FOREIGN KEY (`source_id`) REFERENCES `sample` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=24012 DEFAULT CHARSET=latin1;;
/*!40101 SET character_set_client = @saved_cs_client */;;
/*!40101 SET @saved_cs_client     = @@character_set_client */;;
/*!40101 SET character_set_client = utf8 */;;
CREATE TABLE `sample` (
  `DTYPE` varchar(31) NOT NULL,
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `dneasy` varchar(255) DEFAULT NULL,
  `pbs` varchar(255) DEFAULT NULL,
  `barcode` varchar(255) NOT NULL,
  `samplenumber` varchar(255) DEFAULT NULL,
  `microcentrifugetubebarcode` varchar(255) DEFAULT NULL,
  `dnabarcode` varchar(255) DEFAULT NULL,
  `quantamplifieddna_260over280` double DEFAULT NULL,
  `quantamplifieddna_concentration` double DEFAULT NULL,
  `spincolumnbarcode` varchar(255) DEFAULT NULL,
  `state` varchar(255) DEFAULT NULL,
  `blastomereletter` varchar(255) DEFAULT NULL,
  `cellstage` varchar(255) DEFAULT NULL,
  `embryograde` varchar(255) DEFAULT NULL,
  `hasimage` bit(1) DEFAULT NULL,
  `intact` bit(1) DEFAULT NULL,
  `ivfclinicembryoid` varchar(255) DEFAULT NULL,
  `manifestcomments` varchar(255) DEFAULT NULL,
  `nucleusseen` bit(1) DEFAULT NULL,
  `gender` varchar(255) DEFAULT NULL,
  `received` datetime DEFAULT NULL,
  `receivedby_id` bigint(20) DEFAULT NULL,
  `prepped` datetime DEFAULT NULL,
  `preppedby_id` bigint(20) DEFAULT NULL,
  `quantamplifieddna_nanodropspreadsheet_id` bigint(20) DEFAULT NULL,
  `lysisprotocol_id` bigint(20) DEFAULT NULL,
  `sampletype_id` bigint(20) DEFAULT NULL,
  `positive` bit(1) DEFAULT NULL,
  `dilutionstate` varchar(255) DEFAULT NULL,
  `ldorate` int(11) DEFAULT NULL,
  `isrerun` bit(1) DEFAULT NULL,
  `subject_id` bigint(20) DEFAULT NULL,
  `aliquot_id` bigint(20) DEFAULT NULL,
  `notesOnTube` varchar(255) DEFAULT NULL,
  `disposed` bit(1) DEFAULT b'0',
  `dashdnadisposed` bit(1) DEFAULT b'0',
  `cellline_id` bigint(20) DEFAULT NULL,
  `prepprocedure_id` bigint(20) DEFAULT NULL,
  `genomicprepprocedure_id` bigint(20) DEFAULT NULL,
  `collectiondate` datetime DEFAULT NULL,
  `npdstate` varchar(255) DEFAULT NULL,
  `microdelstate` varchar(255) DEFAULT NULL,
  `sourcesample_id` bigint(20) DEFAULT NULL,
  `npdneg80cstarttime` datetime DEFAULT NULL,
  `npdneg80cendtime` datetime DEFAULT NULL,
  `npdneg20cstarttime` datetime DEFAULT NULL,
  `npdneg20cendtime` datetime DEFAULT NULL,
  `npdafterampconc` double DEFAULT NULL,
  `npdafterpurificationconc` double DEFAULT NULL,
  `npdnormalizedpurifiedlibraryconc` double DEFAULT NULL,
  `npdplasmavolume` double DEFAULT NULL,
  `npdlabisgood` int(11) DEFAULT NULL,
  `csstate` varchar(255) DEFAULT NULL,
  `smastate` varchar(255) DEFAULT NULL,
  `fraxstate` varchar(255) DEFAULT NULL,
  `plasmaisolationstate` varchar(255) DEFAULT NULL,
  `spingroupname` varchar(255) DEFAULT NULL,
  `spinstarttime` datetime DEFAULT NULL,
  `spinendtime` datetime DEFAULT NULL,
  `hemolysis` varchar(45) DEFAULT NULL,
  `redraw` bit(1) DEFAULT b'0',
  `plasmavolume` double DEFAULT NULL,
  `plasmadnavolume` double DEFAULT NULL,
  `bloodvolume` double DEFAULT NULL,
  `thirdPartySampleId` varchar(50) DEFAULT NULL,
  `villiseen` bit(1) DEFAULT NULL,
  `qsstate` varchar(255) DEFAULT NULL,
  `isNotMixture` bit(1) DEFAULT NULL,
  `experimentName` varchar(255) DEFAULT NULL,
  `needsreview` bit(1) DEFAULT NULL,
  `redoautomation` bit(1) DEFAULT NULL,
  `reviewreason` varchar(255) DEFAULT NULL,
  `automationfilename` varchar(255) DEFAULT NULL,
  `isreprep` bit(1) DEFAULT b'0',
  `reprepteam` varchar(255) DEFAULT NULL,
  `shipDestinationType` varchar(255) DEFAULT NULL,
  `incubatestarttime` datetime DEFAULT NULL,
  `incubateendtime` datetime DEFAULT NULL,
  `spin2endtime` datetime DEFAULT NULL,
  `spin2starttime` datetime DEFAULT NULL,
  `spin3endtime` datetime DEFAULT NULL,
  `spin3starttime` datetime DEFAULT NULL,
  `containertype_id` bigint(20) DEFAULT NULL,
  `counsylbarcode` varchar(255) DEFAULT NULL,
  `controlsamplecaseparent` varchar(255) DEFAULT NULL,
  `clogseverity` varchar(255) DEFAULT NULL,
  `created_in_clarity` datetime DEFAULT NULL,
  `panoramaTracerGroupKey` varchar(255) DEFAULT NULL,
  `microdelTracerGroupKey` varchar(255) DEFAULT NULL,
  `tracerIndex` int(11) DEFAULT NULL,
  `tracerPlate` varchar(255) DEFAULT NULL,
  `isolationValidated` bit(1) NOT NULL DEFAULT b'0',
  `disposalstate` varchar(255) DEFAULT NULL,
  `disposalStateReason` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `barcode` (`barcode`),
  UNIQUE KEY `microcentrifugetubebarcode` (`microcentrifugetubebarcode`),
  UNIQUE KEY `onepointfivemltubebarcode` (`dnabarcode`),
  UNIQUE KEY `spincolumnbarcode` (`spincolumnbarcode`),
  UNIQUE KEY `samplenumber` (`samplenumber`),
  KEY `FK932C61CADB50D2D9` (`quantamplifieddna_nanodropspreadsheet_id`),
  KEY `FK932C61CAD39E5084` (`receivedby_id`),
  KEY `FK932C61CA506E11F3` (`lysisprotocol_id`) USING BTREE,
  KEY `FK932C61CA157B6283` (`sampletype_id`),
  KEY `FK932C61CA142D7D2E` (`subject_id`),
  KEY `FK932C61CAFDE57DD1` (`aliquot_id`),
  KEY `FK932C61CA6B8DEB83` (`cellline_id`),
  KEY `FK932C61CAB21B00A3` (`genomicprepprocedure_id`),
  KEY `FK932C61CA862F5368` (`sourcesample_id`),
  KEY `FK932C61CA581A9011` (`prepprocedure_id`),
  KEY `FK932C61CA49E5FB43` (`preppedby_id`),
  KEY `cssindex` (`csstate`) USING BTREE,
  KEY `smaindex` (`smastate`) USING BTREE,
  KEY `fraxindex` (`fraxstate`) USING BTREE,
  KEY `stateindex` (`state`) USING BTREE,
  KEY `plasmaisolationindex` (`plasmaisolationstate`) USING BTREE,
  KEY `dilutionstateindex` (`dilutionstate`) USING BTREE,
  KEY `npdstate` (`npdstate`),
  KEY `qsstate` (`qsstate`),
  KEY `microdelstate` (`microdelstate`),
  KEY `containertype_id` (`containertype_id`),
  KEY `disposalState_index` (`disposalstate`),
  KEY `disposalStateReason_index` (`disposalStateReason`),
  CONSTRAINT `FK932C61CA142D7D2E` FOREIGN KEY (`subject_id`) REFERENCES `subject` (`id`),
  CONSTRAINT `FK932C61CA157B6283` FOREIGN KEY (`sampletype_id`) REFERENCES `sampletype` (`id`),
  CONSTRAINT `FK932C61CA49E5FB43` FOREIGN KEY (`preppedby_id`) REFERENCES `user` (`id`),
  CONSTRAINT `FK932C61CA506E11F3` FOREIGN KEY (`lysisprotocol_id`) REFERENCES `protocol` (`id`),
  CONSTRAINT `FK932C61CA581A9011` FOREIGN KEY (`prepprocedure_id`) REFERENCES `prepprocedure` (`id`),
  CONSTRAINT `FK932C61CA6B8DEB83` FOREIGN KEY (`cellline_id`) REFERENCES `cellline` (`id`),
  CONSTRAINT `FK932C61CA862F5368` FOREIGN KEY (`sourcesample_id`) REFERENCES `sample` (`id`),
  CONSTRAINT `FK932C61CAB21B00A3` FOREIGN KEY (`genomicprepprocedure_id`) REFERENCES `genomicprepprocedure` (`id`),
  CONSTRAINT `FK932C61CAD39E5084` FOREIGN KEY (`receivedby_id`) REFERENCES `user` (`id`),
  CONSTRAINT `FK932C61CADB50D2D9` FOREIGN KEY (`quantamplifieddna_nanodropspreadsheet_id`) REFERENCES `documentinfo` (`id`),
  CONSTRAINT `FK932C61CAFDE57DD1` FOREIGN KEY (`aliquot_id`) REFERENCES `aliquot` (`id`),
  CONSTRAINT `sample_ibfk_1` FOREIGN KEY (`containertype_id`) REFERENCES `containertype` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4798957 DEFAULT CHARSET=latin1;;
/*!40101 SET character_set_client = @saved_cs_client */;;
--
-- WARNING: old server version. The following dump may be incomplete.
--

/*!50003 SET SESSION SQL_MODE="" */;;
/*!50003 CREATE */ /*!50017 DEFINER=`gsnuser`@`localhost` */ /*!50003 TRIGGER `before_insert_sample` BEFORE INSERT ON `sample` FOR EACH ROW BEGIN
    SET NEW.samplenumber = substring_index(NEW.barcode, '-2', 1);
  END */;;

--
-- WARNING: old server version. The following dump may be incomplete.
--

/*!50003 SET SESSION SQL_MODE="" */;;
/*!50003 CREATE */ /*!50017 DEFINER=`gsnuser`@`localhost` */ /*!50003 TRIGGER `before_update_sample` BEFORE UPDATE ON `sample` FOR EACH ROW BEGIN
    SET NEW.samplenumber = substring_index(NEW.barcode, '-2', 1);
  END */;;

/*!40101 SET @saved_cs_client     = @@character_set_client */;;
/*!40101 SET character_set_client = utf8 */;;
CREATE TABLE `sample_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sample_id` bigint(20) NOT NULL,
  `categories_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_1` (`sample_id`),
  KEY `FK_2` (`categories_id`),
  CONSTRAINT `FK_1` FOREIGN KEY (`sample_id`) REFERENCES `sample` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_2` FOREIGN KEY (`categories_id`) REFERENCES `category` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=17111 DEFAULT CHARSET=latin1;;
/*!40101 SET character_set_client = @saved_cs_client */;;
/*!40101 SET @saved_cs_client     = @@character_set_client */;;
/*!40101 SET character_set_client = utf8 */;;
CREATE TABLE `sample_cs_plate` (
  `Sample_id` bigint(20) NOT NULL,
  `cspcrplates_id` bigint(20) NOT NULL,
  KEY `FK7183695CEDA3F7AD` (`Sample_id`),
  KEY `FK7183695C69E9FFB3` (`cspcrplates_id`),
  CONSTRAINT `FK7183695C69E9FFB3` FOREIGN KEY (`cspcrplates_id`) REFERENCES `cs_plate` (`id`),
  CONSTRAINT `FK7183695CEDA3F7AD` FOREIGN KEY (`Sample_id`) REFERENCES `sample` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;;
/*!40101 SET character_set_client = @saved_cs_client */;;
/*!40101 SET @saved_cs_client     = @@character_set_client */;;
/*!40101 SET character_set_client = utf8 */;;
CREATE TABLE `sample_disposal_temp` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `sample_id` bigint(20) NOT NULL,
  `sample_barcode` varchar(255) NOT NULL,
  `disposalState` varchar(255) DEFAULT NULL,
  `disposalStateReason` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3891275 DEFAULT CHARSET=latin1;;
/*!40101 SET character_set_client = @saved_cs_client */;;
/*!40101 SET @saved_cs_client     = @@character_set_client */;;
/*!40101 SET character_set_client = utf8 */;;
CREATE TABLE `sample_inventorieditem` (
  `sample_id` bigint(20) NOT NULL,
  `reagents_id` bigint(20) NOT NULL,
  PRIMARY KEY (`sample_id`,`reagents_id`),
  KEY `sample_reagents_reagents_id_fk` (`reagents_id`),
  KEY `sample_reagents_sample_id_fk` (`sample_id`),
  CONSTRAINT `sample_reagents_reagents_id_fk` FOREIGN KEY (`reagents_id`) REFERENCES `inventorieditem` (`id`),
  CONSTRAINT `sample_reagents_sample_id_fk` FOREIGN KEY (`sample_id`) REFERENCES `sample` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;;
/*!40101 SET character_set_client = @saved_cs_client */;;
/*!40101 SET @saved_cs_client     = @@character_set_client */;;
/*!40101 SET character_set_client = utf8 */;;
CREATE TABLE `sample_preparation` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `source_id` bigint(20) NOT NULL,
  `prep_id` bigint(20) NOT NULL,
  `isprimary` bit(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `U1` (`prep_id`,`source_id`),
  UNIQUE KEY `U2` (`isprimary`,`prep_id`),
  KEY `F1` (`source_id`),
  KEY `F2` (`prep_id`),
  CONSTRAINT `F1` FOREIGN KEY (`source_id`) REFERENCES `sample` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `F2` FOREIGN KEY (`prep_id`) REFERENCES `sample` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3418010 DEFAULT CHARSET=latin1;;
/*!40101 SET character_set_client = @saved_cs_client */;;
SET @saved_cs_client     = @@character_set_client;;
SET character_set_client = utf8;;
/*!50001 CREATE TABLE `sample_rootsample` (
  `id` tinyint NOT NULL,
  `rootsample_id` tinyint NOT NULL
) ENGINE=MyISAM */;;
SET character_set_client = @saved_cs_client;;
/*!40101 SET @saved_cs_client     = @@character_set_client */;;
/*!40101 SET character_set_client = utf8 */;;
CREATE TABLE `sampleproperty` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sample_id` bigint(20) NOT NULL,
  `name` varchar(255) NOT NULL,
  `value` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `sp_sample_name_index` (`sample_id`,`name`),
  KEY `FK_N` (`name`),
  KEY `FK_S` (`sample_id`),
  CONSTRAINT `FK_S` FOREIGN KEY (`sample_id`) REFERENCES `sample` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=1152 DEFAULT CHARSET=latin1;;
/*!40101 SET character_set_client = @saved_cs_client */;;
/*!40101 SET @saved_cs_client     = @@character_set_client */;;
/*!40101 SET character_set_client = utf8 */;;
CREATE TABLE `sampleproperty_backup` (
  `id` int(11) NOT NULL DEFAULT '0',
  `property_id` int(11) NOT NULL,
  `sample_id` bigint(20) NOT NULL,
  `value` varchar(1700) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;;
/*!40101 SET character_set_client = @saved_cs_client */;;
/*!40101 SET @saved_cs_client     = @@character_set_client */;;
/*!40101 SET character_set_client = utf8 */;;
CREATE TABLE `samplerack` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `rows` int(11) DEFAULT NULL,
  `cols` int(11) DEFAULT NULL,
  `barcode` varchar(255) NOT NULL,
  `state` varchar(255) DEFAULT NULL,
  `received` datetime DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uniquebarcode` (`barcode`)
) ENGINE=InnoDB AUTO_INCREMENT=74683 DEFAULT CHARSET=latin1;;
/*!40101 SET character_set_client = @saved_cs_client */;;
/*!40101 SET @saved_cs_client     = @@character_set_client */;;
/*!40101 SET character_set_client = utf8 */;;
CREATE TABLE `samplerack_sample` (
  `samplerack_id` bigint(20) DEFAULT NULL,
  `samples_id` bigint(20) DEFAULT NULL,
  KEY `samplerack` (`samplerack_id`),
  KEY `sample` (`samples_id`),
  CONSTRAINT `sample` FOREIGN KEY (`samples_id`) REFERENCES `sample` (`id`),
  CONSTRAINT `samplerack` FOREIGN KEY (`samplerack_id`) REFERENCES `samplerack` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;;
/*!40101 SET character_set_client = @saved_cs_client */;;
SET @saved_cs_client     = @@character_set_client;;
SET character_set_client = utf8;;
/*!50001 CREATE TABLE `samplerun` (
  `barcode` tinyint NOT NULL,
  `run_date` tinyint NOT NULL,
  `run_status` tinyint NOT NULL
) ENGINE=MyISAM */;;
SET character_set_client = @saved_cs_client;;
/*!40101 SET @saved_cs_client     = @@character_set_client */;;
/*!40101 SET character_set_client = utf8 */;;
CREATE TABLE `samplescale` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;;
/*!40101 SET character_set_client = @saved_cs_client */;;
/*!40101 SET @saved_cs_client     = @@character_set_client */;;
/*!40101 SET character_set_client = utf8 */;;
CREATE TABLE `sampletype` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `displayname` varchar(255) DEFAULT NULL,
  `samplescale_id` bigint(20) DEFAULT NULL,
  `tissuetype_id` bigint(20) DEFAULT NULL,
  `sourcetypename` varchar(255) DEFAULT NULL,
  `sampletypename` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK5244761738630FDE` (`samplescale_id`) USING BTREE,
  KEY `FK5244761738630FDF` (`tissuetype_id`) USING BTREE,
  CONSTRAINT `FK5244761738630FDE` FOREIGN KEY (`samplescale_id`) REFERENCES `samplescale` (`id`),
  CONSTRAINT `FK5244761738630FDF` FOREIGN KEY (`tissuetype_id`) REFERENCES `tissuetype` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=latin1;;
/*!40101 SET character_set_client = @saved_cs_client */;;
/*!40101 SET @saved_cs_client     = @@character_set_client */;;
/*!40101 SET character_set_client = utf8 */;;
CREATE TABLE `script` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) DEFAULT NULL,
  `code` longtext,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=68 DEFAULT CHARSET=latin1;;
/*!40101 SET character_set_client = @saved_cs_client */;;
/*!40101 SET @saved_cs_client     = @@character_set_client */;;
/*!40101 SET character_set_client = utf8 */;;
CREATE TABLE `scriptparameter` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `code` varchar(255) DEFAULT NULL,
  `elementtype` varchar(255) DEFAULT NULL,
  `islist` bit(1) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `script_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK9A646EFE81929E5D` (`script_id`),
  KEY `FK_2409479247aa4404b3b7a6fb167` (`script_id`)
) ENGINE=MyISAM AUTO_INCREMENT=152 DEFAULT CHARSET=latin1;;
/*!40101 SET character_set_client = @saved_cs_client */;;
/*!40101 SET @saved_cs_client     = @@character_set_client */;;
/*!40101 SET character_set_client = utf8 */;;
CREATE TABLE `seqplate` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `barcode` varchar(255) NOT NULL,
  `state` varchar(255) DEFAULT NULL,
  `pcrplate_id` bigint(20) DEFAULT NULL,
  `sequenceprotocolname` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `barcode` (`barcode`),
  KEY `FK5244761738630FDA` (`pcrplate_id`),
  CONSTRAINT `FK5244761738630FDA` FOREIGN KEY (`pcrplate_id`) REFERENCES `pcrplate` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1287 DEFAULT CHARSET=latin1;;
/*!40101 SET character_set_client = @saved_cs_client */;;
/*!40101 SET @saved_cs_client     = @@character_set_client */;;
/*!40101 SET character_set_client = utf8 */;;
CREATE TABLE `seqplate_reaction` (
  `seqplates_id` bigint(20) NOT NULL,
  `wells_id` bigint(20) NOT NULL,
  `position` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`position`,`seqplates_id`) USING BTREE,
  KEY `FK9C83E371F5AE09C7` (`wells_id`),
  KEY `FK9C83E371282B6E95` (`seqplates_id`) USING BTREE,
  CONSTRAINT `FK9C83E371282B6E95` FOREIGN KEY (`seqplates_id`) REFERENCES `seqplate` (`id`),
  CONSTRAINT `FK9C83E371F5AE09C7` FOREIGN KEY (`wells_id`) REFERENCES `reaction` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;;
/*!40101 SET character_set_client = @saved_cs_client */;;
/*!40101 SET @saved_cs_client     = @@character_set_client */;;
/*!40101 SET character_set_client = utf8 */;;
CREATE TABLE `sequence` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `next` bigint(20) NOT NULL,
  `version` bigint(20) NOT NULL,
  `chromosome` varchar(255) DEFAULT NULL,
  `endpos` bigint(20) DEFAULT NULL,
  `sequence` text,
  `startpos` bigint(20) DEFAULT NULL,
  `strand` char(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;;
/*!40101 SET character_set_client = @saved_cs_client */;;
/*!40101 SET @saved_cs_client     = @@character_set_client */;;
/*!40101 SET character_set_client = utf8 */;;
CREATE TABLE `sequence__history` (
  `Sequence_id` bigint(20) NOT NULL,
  `history_id` bigint(20) NOT NULL,
  `idx` int(11) NOT NULL,
  PRIMARY KEY (`Sequence_id`,`idx`),
  UNIQUE KEY `history_id` (`history_id`),
  KEY `FK307CADF3A54FC9F0` (`Sequence_id`),
  KEY `FK307CADF32BB26AA4` (`history_id`),
  CONSTRAINT `FK307CADF32BB26AA4` FOREIGN KEY (`history_id`) REFERENCES `_history` (`id`),
  CONSTRAINT `FK307CADF3A54FC9F0` FOREIGN KEY (`Sequence_id`) REFERENCES `sequence` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;;
/*!40101 SET character_set_client = @saved_cs_client */;;
/*!40101 SET @saved_cs_client     = @@character_set_client */;;
/*!40101 SET character_set_client = utf8 */;;
CREATE TABLE `sequenceprotocol` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `defaultprotocol` bit(1) NOT NULL,
  `csdefault` bit(1) DEFAULT b'0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;;
/*!40101 SET character_set_client = @saved_cs_client */;;
SET @saved_cs_client     = @@character_set_client;;
SET character_set_client = utf8;;
/*!50001 CREATE TABLE `sequencingrunsummary` (
  `Sequencing Sample Id` tinyint NOT NULL,
  `Sample barcode` tinyint NOT NULL,
  `Sequencing Run Id` tinyint NOT NULL,
  `Sequencing Run Date` tinyint NOT NULL,
  `Run Flow Cell` tinyint NOT NULL,
  `Run Instrument` tinyint NOT NULL,
  `Case(s)` tinyint NOT NULL,
  `Prenatus` tinyint NOT NULL,
  `NIPT Research` tinyint NOT NULL,
  `NIPT Bridging Study` tinyint NOT NULL,
  `Target Set` tinyint NOT NULL,
  `Earliest Case Open Date` tinyint NOT NULL,
  `Test Type(s)` tinyint NOT NULL,
  `Family Position` tinyint NOT NULL,
  `Sample Type` tinyint NOT NULL,
  `Root Sample Receive Date` tinyint NOT NULL,
  `Prep Date` tinyint NOT NULL,
  `Territory Name` tinyint NOT NULL
) ENGINE=MyISAM */;;
SET character_set_client = @saved_cs_client;;
SET @saved_cs_client     = @@character_set_client;;
SET character_set_client = utf8;;
/*!50001 CREATE TABLE `sequencingsample_barcodingplate` (
  `sequencingsample_id` tinyint NOT NULL,
  `samplebarcode` tinyint NOT NULL,
  `sequencingbarcode` tinyint NOT NULL,
  `lane` tinyint NOT NULL,
  `samplepool_id` tinyint NOT NULL,
  `samplepool_barcode` tinyint NOT NULL,
  `runid` tinyint NOT NULL,
  `barcodingplate_id` tinyint NOT NULL,
  `barcodingplate_barcode` tinyint NOT NULL,
  `barcodingplate_sampleposition` tinyint NOT NULL
) ENGINE=MyISAM */;;
SET character_set_client = @saved_cs_client;;
/*!40101 SET @saved_cs_client     = @@character_set_client */;;
/*!40101 SET character_set_client = utf8 */;;
CREATE TABLE `spermkit` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `barcode` varchar(255) NOT NULL,
  `state` varchar(255) DEFAULT NULL,
  `dilutionstate` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `barcode` (`barcode`)
) ENGINE=InnoDB AUTO_INCREMENT=280 DEFAULT CHARSET=latin1;;
/*!40101 SET character_set_client = @saved_cs_client */;;
/*!40101 SET @saved_cs_client     = @@character_set_client */;;
/*!40101 SET character_set_client = utf8 */;;
CREATE TABLE `spermkit_inventorieditem` (
  `SpermKit_id` bigint(20) NOT NULL,
  `reagents_id` bigint(20) NOT NULL,
  PRIMARY KEY (`SpermKit_id`,`reagents_id`),
  KEY `FKDE1A2652E71F8F2B` (`reagents_id`),
  KEY `FKDE1A265292DE625A` (`SpermKit_id`),
  CONSTRAINT `FKDE1A265292DE625A` FOREIGN KEY (`SpermKit_id`) REFERENCES `spermkit` (`id`),
  CONSTRAINT `FKDE1A2652E71F8F2B` FOREIGN KEY (`reagents_id`) REFERENCES `inventorieditem` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;;
/*!40101 SET character_set_client = @saved_cs_client */;;
/*!40101 SET @saved_cs_client     = @@character_set_client */;;
/*!40101 SET character_set_client = utf8 */;;
CREATE TABLE `spermkit_sample` (
  `SpermKits_id` bigint(20) NOT NULL,
  `samplelist_id` bigint(20) NOT NULL,
  `idx` int(11) NOT NULL,
  PRIMARY KEY (`SpermKits_id`,`idx`),
  KEY `FK879359767AEFF4C5` (`samplelist_id`),
  KEY `FK8793597692DE625A` (`SpermKits_id`),
  KEY `FK87935976DD4DE08D` (`SpermKits_id`),
  KEY `FK87935976705026D6` (`samplelist_id`),
  CONSTRAINT `FK87935976705026D6` FOREIGN KEY (`samplelist_id`) REFERENCES `sample` (`id`),
  CONSTRAINT `FK879359767AEFF4C5` FOREIGN KEY (`samplelist_id`) REFERENCES `sample` (`id`),
  CONSTRAINT `FK8793597692DE625A` FOREIGN KEY (`SpermKits_id`) REFERENCES `spermkit` (`id`),
  CONSTRAINT `FK87935976DD4DE08D` FOREIGN KEY (`SpermKits_id`) REFERENCES `spermkit` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;;
/*!40101 SET character_set_client = @saved_cs_client */;;
/*!40101 SET @saved_cs_client     = @@character_set_client */;;
/*!40101 SET character_set_client = utf8 */;;
CREATE TABLE `storagecontainer` (
  `DTYPE` varchar(31) NOT NULL,
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `barcode` varchar(255) DEFAULT NULL,
  `casename` varchar(255) DEFAULT NULL,
  `numcolumns` int(11) DEFAULT NULL,
  `numrows` int(11) DEFAULT NULL,
  `rackname` varchar(255) DEFAULT NULL,
  `shelfnumber` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `scandate` datetime DEFAULT NULL,
  `state` varchar(255) DEFAULT NULL,
  `owner_id` bigint(20) DEFAULT NULL,
  `active` bit(1) DEFAULT NULL,
  `defaultcontainer` bit(1) DEFAULT NULL,
  `location` varchar(255) DEFAULT NULL,
  `disposalpercentage` tinyint(4) DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `barcode` (`barcode`),
  KEY `storagecontainer_ibfk_1` (`owner_id`),
  CONSTRAINT `storagecontainer_ibfk_1` FOREIGN KEY (`owner_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13716 DEFAULT CHARSET=latin1;;
/*!40101 SET character_set_client = @saved_cs_client */;;
/*!40101 SET @saved_cs_client     = @@character_set_client */;;
/*!40101 SET character_set_client = utf8 */;;
CREATE TABLE `storagecontainer_contents` (
  `StorageContainer_id` bigint(20) NOT NULL,
  `contents` varchar(255) DEFAULT NULL,
  `contents_ORDER` int(11) NOT NULL,
  PRIMARY KEY (`StorageContainer_id`,`contents_ORDER`),
  KEY `FK6D4596D34AF2E443` (`StorageContainer_id`),
  KEY `storagecontainer_contents_contents_idx` (`contents`),
  CONSTRAINT `FK6D4596D34AF2E443` FOREIGN KEY (`StorageContainer_id`) REFERENCES `storagecontainer` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;;
/*!40101 SET character_set_client = @saved_cs_client */;;
/*!40101 SET @saved_cs_client     = @@character_set_client */;;
/*!40101 SET character_set_client = utf8 */;;
CREATE TABLE `subject` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `dateofbirth` datetime DEFAULT NULL,
  `firstname` varchar(255) DEFAULT NULL,
  `lastname` varchar(255) DEFAULT NULL,
  `hassinglename` bit(1) DEFAULT b'0',
  `name` varchar(255) DEFAULT NULL,
  `gender` varchar(255) DEFAULT NULL,
  `karyotype_id` bigint(20) DEFAULT NULL,
  `medicalrecordnumber` varchar(50) DEFAULT NULL,
  `thirdpartypatientid` varchar(50) DEFAULT NULL,
  `_4medicachartid` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `FKF3E2ED0C1A6CB1F1` (`karyotype_id`),
  KEY `fullname_index` (`lastname`,`firstname`),
  CONSTRAINT `FKF3E2ED0C1A6CB1F1` FOREIGN KEY (`karyotype_id`) REFERENCES `karyotype` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6059655 DEFAULT CHARSET=latin1;;
/*!40101 SET character_set_client = @saved_cs_client */;;
/*!40101 SET @saved_cs_client     = @@character_set_client */;;
/*!40101 SET character_set_client = utf8 */;;
CREATE TABLE `subject_contactinfo` (
  `Subject_id` bigint(20) NOT NULL,
  `addresses_id` bigint(20) NOT NULL,
  `addresses_KEY` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`Subject_id`,`addresses_KEY`),
  UNIQUE KEY `addresses_id` (`addresses_id`),
  KEY `FK3EBDCA3B142D7D2E` (`Subject_id`),
  KEY `FK3EBDCA3B3DB83BEF` (`addresses_id`),
  CONSTRAINT `FK3EBDCA3B142D7D2E` FOREIGN KEY (`Subject_id`) REFERENCES `subject` (`id`),
  CONSTRAINT `FK3EBDCA3B3DB83BEF` FOREIGN KEY (`addresses_id`) REFERENCES `contactinfo` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;;
/*!40101 SET character_set_client = @saved_cs_client */;;
/*!40101 SET @saved_cs_client     = @@character_set_client */;;
/*!40101 SET character_set_client = utf8 */;;
CREATE TABLE `subject_race` (
  `Subject_id` bigint(20) NOT NULL,
  `races_id` bigint(20) NOT NULL,
  PRIMARY KEY (`Subject_id`,`races_id`),
  KEY `FKAFC4D2442B9D5715` (`races_id`),
  KEY `FKAFC4D244142D7D2E` (`Subject_id`),
  CONSTRAINT `FKAFC4D244142D7D2E` FOREIGN KEY (`Subject_id`) REFERENCES `subject` (`id`),
  CONSTRAINT `FKAFC4D2442B9D5715` FOREIGN KEY (`races_id`) REFERENCES `race` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;;
/*!40101 SET character_set_client = @saved_cs_client */;;
/*!40101 SET @saved_cs_client     = @@character_set_client */;;
/*!40101 SET character_set_client = utf8 */;;
CREATE TABLE `task` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `body` longtext,
  `subject` varchar(255) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `completed` bit(1) NOT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK27A9A5550BB1D1` (`user_id`),
  CONSTRAINT `FK27A9A5550BB1D1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4888 DEFAULT CHARSET=latin1;;
/*!40101 SET character_set_client = @saved_cs_client */;;
/*!40101 SET @saved_cs_client     = @@character_set_client */;;
/*!40101 SET character_set_client = utf8 */;;
CREATE TABLE `template_variable` (
  `template_id` bigint(20) NOT NULL,
  `variable_id` bigint(20) NOT NULL,
  KEY `template_id` (`template_id`),
  KEY `variable_id` (`variable_id`),
  CONSTRAINT `template_variable_ibfk_1` FOREIGN KEY (`variable_id`) REFERENCES `horizontemplatevariable` (`id`),
  CONSTRAINT `template_variable_ibfk_2` FOREIGN KEY (`template_id`) REFERENCES `horizondiseasetemplate` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;;
/*!40101 SET character_set_client = @saved_cs_client */;;
/*!40101 SET @saved_cs_client     = @@character_set_client */;;
/*!40101 SET character_set_client = utf8 */;;
CREATE TABLE `territory` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `region` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=429 DEFAULT CHARSET=latin1;;
/*!40101 SET character_set_client = @saved_cs_client */;;
/*!40101 SET @saved_cs_client     = @@character_set_client */;;
/*!40101 SET character_set_client = utf8 */;;
CREATE TABLE `territory_territorydirector` (
  `Territory_id` bigint(20) NOT NULL,
  `territorydirectors_id` bigint(20) NOT NULL,
  `territoryDirectors_ORDER` int(11) NOT NULL,
  PRIMARY KEY (`Territory_id`,`territoryDirectors_ORDER`),
  UNIQUE KEY `UK_096a04d4c15b4ec4878194f8535` (`territorydirectors_id`),
  CONSTRAINT `territory_territorydirector_ibfk_1` FOREIGN KEY (`Territory_id`) REFERENCES `territory` (`id`),
  CONSTRAINT `territory_territorydirector_ibfk_2` FOREIGN KEY (`territorydirectors_id`) REFERENCES `territorydirector` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;;
/*!40101 SET character_set_client = @saved_cs_client */;;
/*!40101 SET @saved_cs_client     = @@character_set_client */;;
/*!40101 SET character_set_client = utf8 */;;
CREATE TABLE `territorydirector` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `validfrom` datetime DEFAULT NULL,
  `director_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `director_id` (`director_id`),
  CONSTRAINT `territorydirector_ibfk_1` FOREIGN KEY (`director_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=223 DEFAULT CHARSET=latin1;;
/*!40101 SET character_set_client = @saved_cs_client */;;
SET @saved_cs_client     = @@character_set_client;;
SET character_set_client = utf8;;
/*!50001 CREATE TABLE `territoryinforeport` (
  `territory id` tinyint NOT NULL,
  `territory name` tinyint NOT NULL,
  `director cfs id` tinyint NOT NULL,
  `director cfs email` tinyint NOT NULL
) ENGINE=MyISAM */;;
SET character_set_client = @saved_cs_client;;
/*!40101 SET @saved_cs_client     = @@character_set_client */;;
/*!40101 SET character_set_client = utf8 */;;
CREATE TABLE `tissuetype` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=latin1;;
/*!40101 SET character_set_client = @saved_cs_client */;;
/*!40101 SET @saved_cs_client     = @@character_set_client */;;
/*!40101 SET character_set_client = utf8 */;;
CREATE TABLE `tmp_1` (
  `caseFileId` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;;
/*!40101 SET character_set_client = @saved_cs_client */;;
/*!40101 SET @saved_cs_client     = @@character_set_client */;;
/*!40101 SET character_set_client = utf8 */;;
CREATE TABLE `tmp_audit` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `entityattribute` varchar(255) DEFAULT NULL,
  `entityid` bigint(20) DEFAULT NULL,
  `entityname` varchar(255) DEFAULT NULL,
  `message` varchar(255) DEFAULT NULL,
  `newvalue` varchar(16384) DEFAULT NULL,
  `oldvalue` varchar(16384) DEFAULT NULL,
  `timestamp` datetime DEFAULT NULL,
  `userid` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=720071292 DEFAULT CHARSET=latin1;;
/*!40101 SET character_set_client = @saved_cs_client */;;
/*!40101 SET @saved_cs_client     = @@character_set_client */;;
/*!40101 SET character_set_client = utf8 */;;
CREATE TABLE `tmp_org_univ5` (
  `id` bigint(20) NOT NULL DEFAULT '0',
  `billtoclinic` bit(1) DEFAULT NULL,
  `cyclesperyear` varchar(255) DEFAULT NULL,
  `deleted` bit(1) NOT NULL,
  `gcspecialinstructions` text,
  `genzymeid` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `note` text,
  `pgdperyear` varchar(255) DEFAULT NULL,
  `pgsperyear` varchar(255) DEFAULT NULL,
  `specialinstructions` text,
  `address_id` bigint(20) DEFAULT NULL,
  `pgdbreakdown_id` bigint(20) DEFAULT NULL,
  `includeranking` bit(1) DEFAULT NULL,
  `includeparentalsource` bit(1) DEFAULT NULL,
  `removesex` bit(1) DEFAULT NULL,
  `labdirectoralias` varchar(255) DEFAULT NULL,
  `day5biopsyability` bit(1) DEFAULT NULL,
  `specialist_id` bigint(20) DEFAULT NULL,
  `pocperyear` varchar(255) DEFAULT NULL,
  `reporttemplate` varchar(255) DEFAULT NULL,
  `wgcasecounter` bigint(20) DEFAULT '0',
  `gpclinicid` varchar(255) DEFAULT NULL,
  `istriploidynptreport` bit(1) DEFAULT b'0',
  `requiresCanadaWaiver` bit(1) DEFAULT b'0',
  `referralFormVersions` varchar(255) DEFAULT NULL,
  `researchstatus` varchar(255) NOT NULL DEFAULT 'RESEARCH_ALLOWED',
  `requirePhysician` bit(1) DEFAULT NULL,
  `approvedForPlasmaKits` bit(1) NOT NULL DEFAULT b'0',
  `clinicHeadSignatureOnFile` bit(1) NOT NULL DEFAULT b'0',
  `is_new_connect` bit(1) DEFAULT NULL,
  `routeToBaylor` bit(1) NOT NULL DEFAULT b'0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;;
/*!40101 SET character_set_client = @saved_cs_client */;;
/*!40101 SET @saved_cs_client     = @@character_set_client */;;
/*!40101 SET character_set_client = utf8 */;;
CREATE TABLE `tmp_org_univ6` (
  `id` bigint(20) NOT NULL DEFAULT '0',
  `billtoclinic` bit(1) DEFAULT NULL,
  `cyclesperyear` varchar(255) DEFAULT NULL,
  `deleted` bit(1) NOT NULL,
  `gcspecialinstructions` text,
  `genzymeid` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `note` text,
  `pgdperyear` varchar(255) DEFAULT NULL,
  `pgsperyear` varchar(255) DEFAULT NULL,
  `specialinstructions` text,
  `address_id` bigint(20) DEFAULT NULL,
  `pgdbreakdown_id` bigint(20) DEFAULT NULL,
  `includeranking` bit(1) DEFAULT NULL,
  `includeparentalsource` bit(1) DEFAULT NULL,
  `removesex` bit(1) DEFAULT NULL,
  `labdirectoralias` varchar(255) DEFAULT NULL,
  `day5biopsyability` bit(1) DEFAULT NULL,
  `specialist_id` bigint(20) DEFAULT NULL,
  `pocperyear` varchar(255) DEFAULT NULL,
  `reporttemplate` varchar(255) DEFAULT NULL,
  `wgcasecounter` bigint(20) DEFAULT '0',
  `gpclinicid` varchar(255) DEFAULT NULL,
  `istriploidynptreport` bit(1) DEFAULT b'0',
  `requiresCanadaWaiver` bit(1) DEFAULT b'0',
  `referralFormVersions` varchar(255) DEFAULT NULL,
  `researchstatus` varchar(255) NOT NULL DEFAULT 'RESEARCH_ALLOWED',
  `requirePhysician` bit(1) DEFAULT NULL,
  `approvedForPlasmaKits` bit(1) NOT NULL DEFAULT b'0',
  `clinicHeadSignatureOnFile` bit(1) NOT NULL DEFAULT b'0',
  `is_new_connect` bit(1) DEFAULT NULL,
  `routeToBaylor` bit(1) NOT NULL DEFAULT b'0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;;
/*!40101 SET character_set_client = @saved_cs_client */;;
/*!40101 SET @saved_cs_client     = @@character_set_client */;;
/*!40101 SET character_set_client = utf8 */;;
CREATE TABLE `tracer_blacklist` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'identifier',
  `created_user_id` bigint(20) NOT NULL COMMENT 'id of user which created the record',
  `created` datetime NOT NULL COMMENT 'creation date',
  `tracer_index` varchar(50) NOT NULL COMMENT 'tracer index',
  `lot_id` varchar(50) NOT NULL COMMENT 'plate/lot id',
  PRIMARY KEY (`id`),
  UNIQUE KEY `UN_TRACER_BLACKLIST` (`lot_id`,`tracer_index`) USING BTREE COMMENT 'lot_id + tracer_index should be unique',
  KEY `created_user_id_idx` (`created_user_id`),
  CONSTRAINT `FK_TRACER_BLACKLIST_USER` FOREIGN KEY (`created_user_id`) REFERENCES `user` (`id`) ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;;
/*!40101 SET character_set_client = @saved_cs_client */;;
/*!40101 SET @saved_cs_client     = @@character_set_client */;;
/*!40101 SET character_set_client = utf8 */;;
CREATE TABLE `user` (
  `DTYPE` varchar(31) NOT NULL,
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `created` datetime DEFAULT NULL,
  `deleted` bit(1) NOT NULL,
  `email` varchar(255) NOT NULL,
  `lastlogin` datetime DEFAULT NULL,
  `passwordhash` varchar(255) DEFAULT NULL,
  `changedpasswdon` datetime DEFAULT NULL,
  `numoftries` int(11) DEFAULT NULL,
  `locked` bit(1) DEFAULT NULL,
  `legaleseacceptancedate` datetime DEFAULT NULL,
  `lastusedorganization_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`),
  KEY `FK285FEBF139BE1E` (`lastusedorganization_id`),
  CONSTRAINT `FK285FEBF139BE1E` FOREIGN KEY (`lastusedorganization_id`) REFERENCES `organization` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8269 DEFAULT CHARSET=latin1;;
/*!40101 SET character_set_client = @saved_cs_client */;;
/*!40101 SET @saved_cs_client     = @@character_set_client */;;
/*!40101 SET character_set_client = utf8 */;;
CREATE TABLE `user_oldpasswords` (
  `User_id` bigint(20) NOT NULL,
  `oldpasswords_element` varchar(255) DEFAULT NULL,
  KEY `FK3C166C5C185D8A8` (`User_id`),
  CONSTRAINT `FK3C166C5C185D8A8` FOREIGN KEY (`User_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;;
/*!40101 SET character_set_client = @saved_cs_client */;;
/*!40101 SET @saved_cs_client     = @@character_set_client */;;
/*!40101 SET character_set_client = utf8 */;;
CREATE TABLE `user_organization` (
  `User_id` bigint(20) NOT NULL,
  `organizations_id` bigint(20) NOT NULL,
  KEY `User_id` (`User_id`),
  KEY `organization_id` (`organizations_id`),
  CONSTRAINT `FK_organizations_id` FOREIGN KEY (`organizations_id`) REFERENCES `organization` (`id`),
  CONSTRAINT `FK_User_id` FOREIGN KEY (`User_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;;
/*!40101 SET character_set_client = @saved_cs_client */;;
/*!40101 SET @saved_cs_client     = @@character_set_client */;;
/*!40101 SET character_set_client = utf8 */;;
CREATE TABLE `user_properties` (
  `user_id` bigint(20) NOT NULL,
  `propertyvalue` varchar(255) DEFAULT NULL,
  `propertykey` varchar(255) NOT NULL,
  PRIMARY KEY (`user_id`,`propertykey`),
  KEY `FK18623A27550BB1D1` (`user_id`),
  CONSTRAINT `FK18623A27550BB1D1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;;
/*!40101 SET character_set_client = @saved_cs_client */;;
/*!40101 SET @saved_cs_client     = @@character_set_client */;;
/*!40101 SET character_set_client = utf8 */;;
CREATE TABLE `user_roles` (
  `User_id` bigint(20) NOT NULL,
  `roles_element` varchar(255) DEFAULT NULL,
  KEY `FKEA147569550BB1D1` (`User_id`),
  CONSTRAINT `FKEA147569550BB1D1` FOREIGN KEY (`User_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;;
/*!40101 SET character_set_client = @saved_cs_client */;;
/*!40101 SET @saved_cs_client     = @@character_set_client */;;
/*!40101 SET character_set_client = utf8 */;;
CREATE TABLE `variationinfo` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `fatherTruth` varchar(255) DEFAULT NULL,
  `motherTruth` varchar(255) DEFAULT NULL,
  `amptarget_id` bigint(20) DEFAULT NULL,
  `casefile_id` bigint(20) NOT NULL,
  `variation_id` bigint(20) DEFAULT NULL,
  `allowblastomeres` bit(1) NOT NULL,
  `sequencing` bit(1) NOT NULL,
  `method_id` bigint(20) DEFAULT NULL,
  `allowspermsamples` bit(1) NOT NULL,
  `excluded` bit(1) DEFAULT b'0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `FK404A6941CB9103C3` (`casefile_id`),
  KEY `FK404A694129F3304C` (`method_id`),
  KEY `FK404A6941CB792305` (`amptarget_id`),
  KEY `FK404A6941BCCE245` (`variation_id`),
  CONSTRAINT `FK404A694129F3304C` FOREIGN KEY (`method_id`) REFERENCES `variationmeasurementmethod` (`id`),
  CONSTRAINT `FK404A6941BCCE245` FOREIGN KEY (`variation_id`) REFERENCES `diseaseassociations`.`variation` (`id`),
  CONSTRAINT `FK404A6941CB792305` FOREIGN KEY (`amptarget_id`) REFERENCES `diseaseassociations`.`amptarget` (`id`),
  CONSTRAINT `FK404A6941CB9103C3` FOREIGN KEY (`casefile_id`) REFERENCES `casefile` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4912 DEFAULT CHARSET=latin1;;
/*!40101 SET character_set_client = @saved_cs_client */;;
/*!40101 SET @saved_cs_client     = @@character_set_client */;;
/*!40101 SET character_set_client = utf8 */;;
CREATE TABLE `variationinfo_familyposition` (
  `variationinfo_id` bigint(20) NOT NULL,
  `family_position` varchar(255) NOT NULL,
  PRIMARY KEY (`variationinfo_id`,`family_position`),
  KEY `FK2368BB8BA5085E71` (`variationinfo_id`),
  CONSTRAINT `FK2368BB8BA5085E71` FOREIGN KEY (`variationinfo_id`) REFERENCES `variationinfo` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;;
/*!40101 SET character_set_client = @saved_cs_client */;;
/*!40101 SET @saved_cs_client     = @@character_set_client */;;
/*!40101 SET character_set_client = utf8 */;;
CREATE TABLE `variationmeasurement` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `_call` varchar(255) DEFAULT NULL,
  `confidencelevel` varchar(255) DEFAULT NULL,
  `state` varchar(255) DEFAULT NULL,
  `sample_id` bigint(20) NOT NULL,
  `variationinfo_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `variationmeasurement_sample_variationinfo` (`sample_id`,`variationinfo_id`),
  KEY `FKE0BA1BC9A5085E71` (`variationinfo_id`),
  KEY `FKE0BA1BC9D50BCD23` (`sample_id`),
  CONSTRAINT `FKE0BA1BC9A5085E71` FOREIGN KEY (`variationinfo_id`) REFERENCES `variationinfo` (`id`),
  CONSTRAINT `FKE0BA1BC9D50BCD23` FOREIGN KEY (`sample_id`) REFERENCES `sample` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8907 DEFAULT CHARSET=latin1;;
/*!40101 SET character_set_client = @saved_cs_client */;;
/*!40101 SET @saved_cs_client     = @@character_set_client */;;
/*!40101 SET character_set_client = utf8 */;;
CREATE TABLE `variationmeasurementmethod` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `high_mm` double NOT NULL,
  `high_m_` double NOT NULL,
  `high_rm` double NOT NULL,
  `high_rr` double NOT NULL,
  `high_r_` double NOT NULL,
  `low_mm` double NOT NULL,
  `low_m_` double NOT NULL,
  `low_rm` double NOT NULL,
  `low_rr` double NOT NULL,
  `low_r_` double NOT NULL,
  `medium_mm` double NOT NULL,
  `medium_m_` double NOT NULL,
  `medium_rm` double NOT NULL,
  `medium_rr` double NOT NULL,
  `medium_r_` double NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `dropoutoverride` float DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;;
/*!40101 SET character_set_client = @saved_cs_client */;;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;;
/*!50003 SET character_set_client  = utf8 */ ;;
/*!50003 SET character_set_results = utf8 */ ;;
/*!50003 SET collation_connection  = utf8_general_ci */ ;;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;;
/*!50003 SET sql_mode              = '' */ ;;

CREATE DEFINER=`root`@`localhost` FUNCTION `BizDaysInclusive`( d1 DATE, d2 DATE , trimHolidays BOOLEAN ) RETURNS int(11)
    DETERMINISTIC
BEGIN
  DECLARE dow1, dow2, days, hcount INT;
  SET dow1 = DAYOFWEEK(d1);
  SET dow2 = DAYOFWEEK(d2);
  SET days = FLOOR( DATEDIFF(d2,d1)/7 ) * 5 +
             CASE
               WHEN dow1=1 AND dow2=7 THEN 5
               WHEN dow1 IN(7,1) AND dow2 IN (7,1) THEN 0
               WHEN dow1=dow2 THEN 1
               WHEN dow1 IN(7,1) AND dow2 NOT IN (7,1) THEN dow2-1
               WHEN dow1 NOT IN(7,1) AND dow2 IN(7,1) THEN 7-dow1
               WHEN dow1<=dow2 THEN dow2-dow1+1
               WHEN dow1>dow2 THEN 5-(dow1-dow2-1)
               ELSE 0
             END;
  IF trimHolidays THEN
    select count(*) into hcount from HOLIDAY where day between d1 and d2;
    SET days = days - hcount;
  END IF;
  RETURN days;
END ;;

/*!50003 SET sql_mode              = @saved_sql_mode */ ;;
/*!50003 SET character_set_client  = @saved_cs_client */ ;;
/*!50003 SET character_set_results = @saved_cs_results */ ;;
/*!50003 SET collation_connection  = @saved_col_connection */ ;;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;;
/*!50003 SET character_set_client  = utf8 */ ;;
/*!50003 SET character_set_results = utf8 */ ;;
/*!50003 SET collation_connection  = utf8_general_ci */ ;;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;;
/*!50003 SET sql_mode              = '' */ ;;

CREATE DEFINER=`gsnuser`@`localhost` FUNCTION `parentalSource`(h CHAR(4)) RETURNS char(20) CHARSET latin1
    DETERMINISTIC
BEGIN

  CASE h
  WHEN 'H000' THEN RETURN 'NA';
  WHEN 'H100' THEN RETURN 'PAT';
  WHEN 'H200' THEN RETURN 'MIX';
  WHEN 'H010' THEN RETURN 'MAT';
  WHEN 'H110' THEN RETURN '';
  WHEN 'H210' THEN RETURN 'MAT';
  WHEN 'H020' THEN RETURN 'MIX';
  WHEN 'H120' THEN RETURN 'PAT';
  WHEN 'H220' THEN RETURN 'MIX';
  WHEN 'H001' THEN RETURN 'MAT';
  WHEN 'H101' THEN RETURN '';
  WHEN 'H201' THEN RETURN 'MAT';
  WHEN 'H011' THEN RETURN '';
  WHEN 'H111' THEN RETURN 'PAT';
  WHEN 'H211' THEN RETURN 'MIX';
  WHEN 'H021' THEN RETURN 'PAT';
  WHEN 'H121' THEN RETURN 'PAT';
  WHEN 'H221' THEN RETURN 'MIX';
  WHEN 'H002' THEN RETURN 'MIX';
  WHEN 'H102' THEN RETURN 'PAT';
  WHEN 'H202' THEN RETURN 'MIX';
  WHEN 'H012' THEN RETURN 'PAT';
  WHEN 'H112' THEN RETURN 'PAT';
  WHEN 'H212' THEN RETURN 'MIX';
  WHEN 'H022' THEN RETURN 'MIX';
  WHEN 'H122' THEN RETURN 'PAT';
  WHEN 'H222' THEN RETURN 'MIX';
  ELSE return 'NA';
  END CASE;

END ;;

/*!50003 SET sql_mode              = @saved_sql_mode */ ;;
/*!50003 SET character_set_client  = @saved_cs_client */ ;;
/*!50003 SET character_set_results = @saved_cs_results */ ;;
/*!50003 SET collation_connection  = @saved_col_connection */ ;;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;;
/*!50003 SET character_set_client  = utf8 */ ;;
/*!50003 SET character_set_results = utf8 */ ;;
/*!50003 SET collation_connection  = utf8_general_ci */ ;;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;;
/*!50003 SET sql_mode              = '' */ ;;

CREATE DEFINER=`root`@`localhost` FUNCTION `SPLIT_STR`(
  x VARCHAR(255),
  delim VARCHAR(12),
  pos INT
) RETURNS varchar(255) CHARSET latin1
    DETERMINISTIC
BEGIN
if (pos < 0) then 
set pos := pos*-1;
RETURN reverse(REPLACE(SUBSTRING(SUBSTRING_INDEX(reverse(x), delim, pos),
       LENGTH(SUBSTRING_INDEX(reverse(x), delim, pos -1)) + 1),
       delim, ''));
else 
RETURN REPLACE(SUBSTRING(SUBSTRING_INDEX(x, delim, pos),
       LENGTH(SUBSTRING_INDEX(x, delim, pos -1)) + 1),
       delim, '');
end if;
END ;;

/*!50003 SET sql_mode              = @saved_sql_mode */ ;;
/*!50003 SET character_set_client  = @saved_cs_client */ ;;
/*!50003 SET character_set_results = @saved_cs_results */ ;;
/*!50003 SET collation_connection  = @saved_col_connection */ ;;

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `hts` /*!40100 DEFAULT CHARACTER SET latin1 */;;

USE `hts`;;
/*!40101 SET @saved_cs_client     = @@character_set_client */;;
/*!40101 SET character_set_client = utf8 */;;
CREATE TABLE `bias_data` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `bias_variance` double DEFAULT NULL,
  `doubling_rate_x` double DEFAULT NULL,
  `doubling_rate_y` double DEFAULT NULL,
  `exp_bias` double DEFAULT NULL,
  `good_snp` bit(1) NOT NULL,
  `total_dor` int(11) DEFAULT NULL,
  `biasmodel_id` bigint(20) DEFAULT NULL,
  `genomelocation_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK32715170EC3555C7` (`biasmodel_id`),
  KEY `FK32715170FE2C7110` (`genomelocation_id`),
  CONSTRAINT `FK32715170EC3555C7` FOREIGN KEY (`biasmodel_id`) REFERENCES `bias_model` (`id`),
  CONSTRAINT `FK32715170FE2C7110` FOREIGN KEY (`genomelocation_id`) REFERENCES `genomelocation` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=62787 DEFAULT CHARSET=utf8;;
/*!40101 SET character_set_client = @saved_cs_client */;;
/*!40101 SET @saved_cs_client     = @@character_set_client */;;
/*!40101 SET character_set_client = utf8 */;;
CREATE TABLE `bias_model` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `codeversion_id` bigint(20) DEFAULT NULL,
  `sequencingtargetset_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK1C3DD22352C73287` (`sequencingtargetset_id`),
  KEY `FK1C3DD223A33D18A7` (`codeversion_id`),
  CONSTRAINT `FK1C3DD22352C73287` FOREIGN KEY (`sequencingtargetset_id`) REFERENCES `sequencingtargetset` (`id`),
  CONSTRAINT `FK1C3DD223A33D18A7` FOREIGN KEY (`codeversion_id`) REFERENCES `code_version` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;;
/*!40101 SET character_set_client = @saved_cs_client */;;
/*!40101 SET @saved_cs_client     = @@character_set_client */;;
/*!40101 SET character_set_client = utf8 */;;
CREATE TABLE `clarity_plate` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `sequencingsample_id` bigint(20) NOT NULL,
  `platetype` varchar(32) NOT NULL,
  `platebarcode` varchar(64) NOT NULL,
  `wellposition` varchar(16) DEFAULT NULL,
  `processlimsid` varchar(32) DEFAULT NULL,
  `processDate` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `SEQUENCINGSAMPLEIDFKEY1_idx` (`sequencingsample_id`),
  CONSTRAINT `SEQUENCINGSAMPLEIDFKEY1` FOREIGN KEY (`sequencingsample_id`) REFERENCES `sequencingsample` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=5178689 DEFAULT CHARSET=latin1;;
/*!40101 SET character_set_client = @saved_cs_client */;;
/*!40101 SET @saved_cs_client     = @@character_set_client */;;
/*!40101 SET character_set_client = utf8 */;;
CREATE TABLE `code_version` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `algorithm` varchar(50) NOT NULL,
  `start_date` datetime NOT NULL,
  `version` varchar(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uc_algorithm_version` (`algorithm`,`version`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;;
/*!40101 SET character_set_client = @saved_cs_client */;;
/*!40101 SET @saved_cs_client     = @@character_set_client */;;
/*!40101 SET character_set_client = utf8 */;;
CREATE TABLE `counting_model` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_date` datetime NOT NULL,
  `dropout_n` int(11) NOT NULL,
  `codeversion_id` bigint(20) DEFAULT NULL,
  `star1plate_id` bigint(20) NOT NULL,
  `star2plate_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK5716745DA33D18A7` (`codeversion_id`),
  CONSTRAINT `FK5716745DA33D18A7` FOREIGN KEY (`codeversion_id`) REFERENCES `code_version` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9144 DEFAULT CHARSET=latin1;;
/*!40101 SET character_set_client = @saved_cs_client */;;
/*!40101 SET @saved_cs_client     = @@character_set_client */;;
/*!40101 SET character_set_client = utf8 */;;
CREATE TABLE `counting_model_counting_modeled_chrom` (
  `num_samples_inlcuded` int(11) NOT NULL,
  `rho` double NOT NULL,
  `countingmodel_id` bigint(20) NOT NULL DEFAULT '0',
  `countingmodeledchrom_id` bigint(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`countingmodel_id`,`countingmodeledchrom_id`),
  KEY `FKE7A4ED2AA1D8652` (`countingmodel_id`),
  KEY `FKE7A4ED2A2F1C4682` (`countingmodeledchrom_id`),
  CONSTRAINT `FKE7A4ED2A2F1C4682` FOREIGN KEY (`countingmodeledchrom_id`) REFERENCES `counting_modeled_chrom` (`id`),
  CONSTRAINT `FKE7A4ED2AA1D8652` FOREIGN KEY (`countingmodel_id`) REFERENCES `counting_model` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;;
/*!40101 SET character_set_client = @saved_cs_client */;;
/*!40101 SET @saved_cs_client     = @@character_set_client */;;
/*!40101 SET character_set_client = utf8 */;;
CREATE TABLE `counting_model_disomy_chroms` (
  `countingmodel_id` bigint(20) NOT NULL,
  `countingmodeledchrom_id` bigint(20) NOT NULL,
  KEY `FKC73EDF98A1D8652` (`countingmodel_id`),
  KEY `FKC73EDF982F1C4682` (`countingmodeledchrom_id`),
  CONSTRAINT `FKC73EDF982F1C4682` FOREIGN KEY (`countingmodeledchrom_id`) REFERENCES `counting_modeled_chrom` (`id`),
  CONSTRAINT `FKC73EDF98A1D8652` FOREIGN KEY (`countingmodel_id`) REFERENCES `counting_model` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;;
/*!40101 SET character_set_client = @saved_cs_client */;;
/*!40101 SET @saved_cs_client     = @@character_set_client */;;
/*!40101 SET character_set_client = utf8 */;;
CREATE TABLE `counting_model_genomelocation` (
  `beta` double DEFAULT NULL,
  `sigma` double DEFAULT NULL,
  `countingmodel_id` bigint(20) NOT NULL DEFAULT '0',
  `genomelocation_id` bigint(20) NOT NULL DEFAULT '0',
  `used` bit(1) NOT NULL DEFAULT b'1',
  PRIMARY KEY (`countingmodel_id`,`genomelocation_id`),
  KEY `FK81DE9CEFE2C7110` (`genomelocation_id`),
  KEY `FK81DE9CEA1D8652` (`countingmodel_id`),
  CONSTRAINT `_FK81DE9CEA1D8652` FOREIGN KEY (`countingmodel_id`) REFERENCES `counting_model` (`id`),
  CONSTRAINT `_FK81DE9CEFE2C7110` FOREIGN KEY (`genomelocation_id`) REFERENCES `genomelocation` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;;
/*!40101 SET character_set_client = @saved_cs_client */;;
/*!40101 SET @saved_cs_client     = @@character_set_client */;;
/*!40101 SET character_set_client = utf8 */;;
CREATE TABLE `counting_model_sequencingsample` (
  `child_fraction` double DEFAULT NULL,
  `is_excluded` bit(1) NOT NULL,
  `fit_score` double DEFAULT NULL,
  `countingmodel_id` bigint(20) NOT NULL DEFAULT '0',
  `sequencingsample_id` bigint(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`countingmodel_id`,`sequencingsample_id`),
  KEY `FKE8060B0AAA155A0D` (`sequencingsample_id`),
  KEY `FKE8060B0AA1D8652` (`countingmodel_id`),
  CONSTRAINT `FKE8060B0AA1D8652` FOREIGN KEY (`countingmodel_id`) REFERENCES `counting_model` (`id`),
  CONSTRAINT `FKE8060B0AAA155A0D` FOREIGN KEY (`sequencingsample_id`) REFERENCES `sequencingsample` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;;
/*!40101 SET character_set_client = @saved_cs_client */;;
/*!40101 SET @saved_cs_client     = @@character_set_client */;;
/*!40101 SET character_set_client = utf8 */;;
CREATE TABLE `counting_modeled_chrom` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `chromosome_no` int(11) NOT NULL,
  `noise_correlation` double NOT NULL,
  `countingtargetsetmodel_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKDC51B08BABEA862` (`countingtargetsetmodel_id`),
  CONSTRAINT `FKDC51B08BABEA862` FOREIGN KEY (`countingtargetsetmodel_id`) REFERENCES `counting_targetset_model` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;;
/*!40101 SET character_set_client = @saved_cs_client */;;
/*!40101 SET @saved_cs_client     = @@character_set_client */;;
/*!40101 SET character_set_client = utf8 */;;
CREATE TABLE `counting_modeled_chrom_sequencingsample` (
  `copy_number` int(11) DEFAULT NULL,
  `plot_means_1` double DEFAULT NULL,
  `plot_means_2` double DEFAULT NULL,
  `plot_means_3` double DEFAULT NULL,
  `plot_observations_1` double DEFAULT NULL,
  `plot_observations_2` double DEFAULT NULL,
  `plot_observations_3` double DEFAULT NULL,
  `plot_sigmas_1` double DEFAULT NULL,
  `plot_sigmas_2` double DEFAULT NULL,
  `plot_sigmas_3` double DEFAULT NULL,
  `countingmodel_id` bigint(20) NOT NULL DEFAULT '0',
  `sequencingsample_id` bigint(20) NOT NULL DEFAULT '0',
  `countingmodeledchrom_id` bigint(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`countingmodel_id`,`countingmodeledchrom_id`,`sequencingsample_id`),
  KEY `FK892A2FBFAA155A0D` (`sequencingsample_id`),
  KEY `FK892A2FBFA1D8652` (`countingmodel_id`),
  KEY `FK892A2FBF2F1C4682` (`countingmodeledchrom_id`),
  CONSTRAINT `FK892A2FBF2F1C4682` FOREIGN KEY (`countingmodeledchrom_id`) REFERENCES `counting_modeled_chrom` (`id`),
  CONSTRAINT `FK892A2FBFA1D8652` FOREIGN KEY (`countingmodel_id`) REFERENCES `counting_model` (`id`),
  CONSTRAINT `FK892A2FBFAA155A0D` FOREIGN KEY (`sequencingsample_id`) REFERENCES `sequencingsample` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;;
/*!40101 SET character_set_client = @saved_cs_client */;;
/*!40101 SET @saved_cs_client     = @@character_set_client */;;
/*!40101 SET character_set_client = utf8 */;;
CREATE TABLE `counting_targetset_model` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `noise_variance_1` double NOT NULL,
  `noise_variance_2` double NOT NULL,
  `codeversion_id` bigint(20) DEFAULT NULL,
  `sequencingtargetset_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKB75512CF52C73287` (`sequencingtargetset_id`),
  KEY `FKB75512CFA33D18A7` (`codeversion_id`),
  CONSTRAINT `FKB75512CF52C73287` FOREIGN KEY (`sequencingtargetset_id`) REFERENCES `sequencingtargetset` (`id`),
  CONSTRAINT `FKB75512CFA33D18A7` FOREIGN KEY (`codeversion_id`) REFERENCES `code_version` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;;
/*!40101 SET character_set_client = @saved_cs_client */;;
/*!40101 SET @saved_cs_client     = @@character_set_client */;;
/*!40101 SET character_set_client = utf8 */;;
CREATE TABLE `counting_targetset_model_genomelocation` (
  `countingtargetsetmodel_id` bigint(20) NOT NULL,
  `genomelocation_id` bigint(20) NOT NULL,
  KEY `FKDE04591CBABEA862` (`countingtargetsetmodel_id`),
  KEY `FKDE04591CFE2C7110` (`genomelocation_id`),
  CONSTRAINT `FKDE04591CBABEA862` FOREIGN KEY (`countingtargetsetmodel_id`) REFERENCES `counting_targetset_model` (`id`),
  CONSTRAINT `FKDE04591CFE2C7110` FOREIGN KEY (`genomelocation_id`) REFERENCES `genomelocation` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;;
/*!40101 SET character_set_client = @saved_cs_client */;;
/*!40101 SET @saved_cs_client     = @@character_set_client */;;
/*!40101 SET character_set_client = utf8 */;;
CREATE TABLE `counting_targetset_model_sequencingsample` (
  `countingtargetsetmodel_id` bigint(20) NOT NULL,
  `sequencingsample_id` bigint(20) NOT NULL,
  KEY `FKDE0DDED8BABEA862` (`countingtargetsetmodel_id`),
  KEY `FKDE0DDED8AA155A0D` (`sequencingsample_id`),
  CONSTRAINT `FKDE0DDED8AA155A0D` FOREIGN KEY (`sequencingsample_id`) REFERENCES `sequencingsample` (`id`),
  CONSTRAINT `FKDE0DDED8BABEA862` FOREIGN KEY (`countingtargetsetmodel_id`) REFERENCES `counting_targetset_model` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;;
/*!40101 SET character_set_client = @saved_cs_client */;;
/*!40101 SET @saved_cs_client     = @@character_set_client */;;
/*!40101 SET character_set_client = utf8 */;;
CREATE TABLE `genomelocation` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `chrom` varchar(255) DEFAULT NULL,
  `end` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `start` int(11) DEFAULT NULL,
  `remapto_id` bigint(20) DEFAULT NULL,
  `refAllele` char(1) NOT NULL DEFAULT 'N',
  `mutAllele` char(1) NOT NULL DEFAULT 'N',
  `genomeVersion` tinyint(1) NOT NULL DEFAULT '18',
  `negativeStrand` tinyint(1) DEFAULT NULL,
  `genomicPosition` double DEFAULT NULL COMMENT 'Genomic position measured in centiMorgans',
  `refAlleleFreq` float DEFAULT NULL COMMENT 'Fraction of reference alleles',
  PRIMARY KEY (`id`),
  KEY `genomelocation_ibfk_1` (`remapto_id`),
  CONSTRAINT `genomelocation_ibfk_1` FOREIGN KEY (`remapto_id`) REFERENCES `genomelocation` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=60376 DEFAULT CHARSET=latin1;;
/*!40101 SET character_set_client = @saved_cs_client */;;
/*!40101 SET @saved_cs_client     = @@character_set_client */;;
/*!40101 SET character_set_client = utf8 */;;
CREATE TABLE `product` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `description` varchar(255) NOT NULL,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;;
/*!40101 SET character_set_client = @saved_cs_client */;;
/*!40101 SET @saved_cs_client     = @@character_set_client */;;
/*!40101 SET character_set_client = utf8 */;;
CREATE TABLE `product_setup` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_date` datetime NOT NULL,
  `validated` bit(1) NOT NULL,
  `biasmodel_id` bigint(20) NOT NULL,
  `codeversion_id` bigint(20) NOT NULL,
  `product_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK5296BB2DEC3555C7` (`biasmodel_id`),
  KEY `FK5296BB2DD6E44CC7` (`product_id`),
  KEY `FK5296BB2DA33D18A7` (`codeversion_id`),
  CONSTRAINT `FK5296BB2DA33D18A7` FOREIGN KEY (`codeversion_id`) REFERENCES `code_version` (`id`),
  CONSTRAINT `FK5296BB2DD6E44CC7` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`),
  CONSTRAINT `FK5296BB2DEC3555C7` FOREIGN KEY (`biasmodel_id`) REFERENCES `bias_model` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;;
/*!40101 SET character_set_client = @saved_cs_client */;;
/*!40101 SET @saved_cs_client     = @@character_set_client */;;
/*!40101 SET character_set_client = utf8 */;;
CREATE TABLE `sanitycheck` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `phred` int(11) NOT NULL DEFAULT '0',
  `mapq` int(11) NOT NULL DEFAULT '0',
  `passed` bit(1) DEFAULT NULL,
  `notes` varchar(255) DEFAULT NULL,
  `timestamp` datetime NOT NULL,
  `type_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `sanitycheck_sanitychecktype_fk` (`type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=539 DEFAULT CHARSET=latin1;;
/*!40101 SET character_set_client = @saved_cs_client */;;
/*!40101 SET @saved_cs_client     = @@character_set_client */;;
/*!40101 SET character_set_client = utf8 */;;
CREATE TABLE `sanitycheckmeasurement` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `type` varchar(255) DEFAULT NULL,
  `value` double DEFAULT NULL,
  `sanitycheck_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK8A3A0EA236F495DC` (`sanitycheck_id`),
  CONSTRAINT `FK8A3A0EA236F495DC` FOREIGN KEY (`sanitycheck_id`) REFERENCES `sanitycheck` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1232 DEFAULT CHARSET=latin1;;
/*!40101 SET character_set_client = @saved_cs_client */;;
/*!40101 SET @saved_cs_client     = @@character_set_client */;;
/*!40101 SET character_set_client = utf8 */;;
CREATE TABLE `sanitychecktype` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `category` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;;
/*!40101 SET character_set_client = @saved_cs_client */;;
/*!40101 SET @saved_cs_client     = @@character_set_client */;;
/*!40101 SET character_set_client = utf8 */;;
CREATE TABLE `sequencingbarcode` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `groupkey` varchar(255) NOT NULL,
  `idx` int(11) NOT NULL,
  `sequence` varchar(255) NOT NULL,
  `defunct` bit(1) NOT NULL DEFAULT b'0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5731 DEFAULT CHARSET=latin1;;
/*!40101 SET character_set_client = @saved_cs_client */;;
/*!40101 SET @saved_cs_client     = @@character_set_client */;;
/*!40101 SET character_set_client = utf8 */;;
CREATE TABLE `sequencingrun` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `flowcellid` varchar(255) DEFAULT NULL,
  `rundate` datetime DEFAULT NULL,
  `runfolder` varchar(255) DEFAULT NULL,
  `instrumentclass` varchar(255) DEFAULT NULL,
  `archivelabel` varchar(255) DEFAULT NULL,
  `runid` varchar(255) DEFAULT NULL,
  `state` varchar(255) DEFAULT NULL,
  `phixsamplebarcode` varchar(255) DEFAULT NULL,
  `truSeqSRClusterKitBarcode` varchar(255) DEFAULT NULL,
  `truSeqSBSKitBarcode` varchar(255) DEFAULT NULL,
  `waterBarcode` varchar(255) DEFAULT NULL,
  `cBotStartTime` datetime DEFAULT NULL,
  `cBotEndTime` datetime DEFAULT NULL,
  `sequencerLoadTime` datetime DEFAULT NULL,
  `runComment` varchar(255) DEFAULT NULL,
  `inJobsRerunQueue` bit(1) DEFAULT b'0',
  `truSeqSRRapidClusterKitBarcode` varchar(255) DEFAULT NULL,
  `cloudJobID` varchar(255) DEFAULT NULL,
  `doLocalPipeline` bit(1) NOT NULL DEFAULT b'1',
  `clarityRun` bit(1) NOT NULL DEFAULT b'0',
  `cloudSampleMetricsCalculatorJobID` varchar(255) DEFAULT NULL,
  `doCloudPipeline` bit(1) NOT NULL DEFAULT b'0',
  `commercialRun` bit(1) NOT NULL DEFAULT b'1',
  `cloudProjectCloneComplete` bit(1) NOT NULL DEFAULT b'0',
  `cloudproject_id` bigint(20) DEFAULT NULL,
  `jobdownloadfailed` bit(1) NOT NULL DEFAULT b'0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `runid` (`runid`),
  UNIQUE KEY `sequencingrun_runfolder_uc` (`runfolder`),
  KEY `FK5FCCB0BCE134BFA3` (`cloudproject_id`),
  CONSTRAINT `FK5FCCB0BCE134BFA3` FOREIGN KEY (`cloudproject_id`) REFERENCES `prodlims`.`cloudproject` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=47358 DEFAULT CHARSET=latin1;;
/*!40101 SET character_set_client = @saved_cs_client */;;
/*!40101 SET @saved_cs_client     = @@character_set_client */;;
/*!40101 SET character_set_client = utf8 */;;
CREATE TABLE `sequencingrun_samplepool` (
  `sequencingrun_id` bigint(20) NOT NULL,
  `npt_plate_id` bigint(20) NOT NULL,
  `lane` int(11) NOT NULL,
  PRIMARY KEY (`sequencingrun_id`,`lane`),
  KEY `FKBBBDB2B861F2A227` (`sequencingrun_id`),
  KEY `FKBBBDB2B8B12B06FF` (`npt_plate_id`),
  CONSTRAINT `FKBBBDB2B861F2A227` FOREIGN KEY (`sequencingrun_id`) REFERENCES `sequencingrun` (`id`),
  CONSTRAINT `FKBBBDB2B8B12B06FF` FOREIGN KEY (`npt_plate_id`) REFERENCES `prodlims`.`npt_plate` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;;
/*!40101 SET character_set_client = @saved_cs_client */;;
/*!40101 SET @saved_cs_client     = @@character_set_client */;;
/*!40101 SET character_set_client = utf8 */;;
CREATE TABLE `sequencingsample` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `allelecountcsvpath` varchar(255) DEFAULT NULL,
  `bampath` varchar(255) DEFAULT NULL,
  `lane` int(11) DEFAULT NULL,
  `mappedreads` int(11) DEFAULT NULL,
  `mediandor` double DEFAULT NULL,
  `modelingplasmasample` bit(1) DEFAULT NULL,
  `project` varchar(255) DEFAULT NULL,
  `read1fastq` varchar(255) DEFAULT NULL,
  `read2fastq` varchar(255) DEFAULT NULL,
  `sampleid` varchar(255) DEFAULT NULL,
  `sampleprepnotes` varchar(255) DEFAULT NULL,
  `samplestate` varchar(255) DEFAULT NULL,
  `sampletype` varchar(255) DEFAULT NULL,
  `sequencingbarcode` int(11) DEFAULT NULL,
  `sequencingfailed` bit(1) NOT NULL DEFAULT b'0',
  `sequencingresultnotes` varchar(255) DEFAULT NULL,
  `totalreads` int(11) DEFAULT NULL,
  `useforgenotypetruth` bit(1) DEFAULT NULL,
  `run_id` bigint(20) NOT NULL,
  `subject_id` bigint(20) DEFAULT NULL,
  `targetset_id` bigint(20) DEFAULT NULL,
  `spiketargetset_id` bigint(20) DEFAULT NULL,
  `samplebarcode` varchar(255) DEFAULT NULL,
  `coveragecountcsvpath` varchar(255) DEFAULT NULL,
  `failurereason` varchar(255) DEFAULT NULL,
  `mappingstart` datetime DEFAULT NULL,
  `mappingcomplete` datetime DEFAULT NULL,
  `sequencingbarcodegroupkey` varchar(255) DEFAULT NULL,
  `allelecountpath` varchar(255) DEFAULT NULL,
  `sample_id` bigint(20) DEFAULT NULL,
  `intendeddepthofread` varchar(255) DEFAULT NULL,
  `resequence_reason` varchar(75) DEFAULT NULL,
  `pcrid` varchar(255) DEFAULT NULL,
  `sequencingmetricsprofile` varchar(255) DEFAULT NULL,
  `cloudSampleMetricsJobID` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uc_project_sampleid` (`project`,`sampleid`),
  KEY `FK1506A7A8369B49DE` (`targetset_id`),
  KEY `FK1506A7A8272AA51E` (`subject_id`),
  KEY `FK1506A7A8DF24C6BE` (`run_id`),
  KEY `samplebarcode` (`samplebarcode`),
  KEY `sampleid` (`sampleid`,`project`),
  KEY `fk_sequencingsample_spiketargetset_id` (`spiketargetset_id`),
  KEY `FK1506A7A827C3A010` (`sample_id`),
  CONSTRAINT `FK1506A7A8272AA51E` FOREIGN KEY (`subject_id`) REFERENCES `sequencingsubject` (`id`),
  CONSTRAINT `FK1506A7A827C3A010` FOREIGN KEY (`sample_id`) REFERENCES `prodlims`.`sample` (`id`),
  CONSTRAINT `FK1506A7A8369B49DE` FOREIGN KEY (`targetset_id`) REFERENCES `sequencingtargetset` (`id`),
  CONSTRAINT `FK1506A7A8DF24C6BE` FOREIGN KEY (`run_id`) REFERENCES `sequencingrun` (`id`),
  CONSTRAINT `fk_sequencingsample_spiketargetset_id` FOREIGN KEY (`spiketargetset_id`) REFERENCES `sequencingtargetset` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2699748 DEFAULT CHARSET=latin1;;
/*!40101 SET character_set_client = @saved_cs_client */;;
/*!40101 SET @saved_cs_client     = @@character_set_client */;;
/*!40101 SET character_set_client = utf8 */;;
CREATE TABLE `sequencingsample_bias_model` (
  `sample_noise` int(11) NOT NULL,
  `biasmodel_id` bigint(20) NOT NULL,
  `sequencingsample_id` bigint(20) NOT NULL,
  PRIMARY KEY (`biasmodel_id`,`sequencingsample_id`),
  KEY `FK37297F5AAA155A0D` (`sequencingsample_id`),
  KEY `FK37297F5AEC3555C7` (`biasmodel_id`),
  CONSTRAINT `FK37297F5AAA155A0D` FOREIGN KEY (`sequencingsample_id`) REFERENCES `sequencingsample` (`id`),
  CONSTRAINT `FK37297F5AEC3555C7` FOREIGN KEY (`biasmodel_id`) REFERENCES `bias_model` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;;
/*!40101 SET character_set_client = @saved_cs_client */;;
/*!40101 SET @saved_cs_client     = @@character_set_client */;;
/*!40101 SET character_set_client = utf8 */;;
CREATE TABLE `sequencingsample_partialjob` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `job_id` varchar(255) NOT NULL,
  `sample_id` bigint(20) NOT NULL,
  `completetime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `I_SSPJ_JOBID` (`job_id`),
  KEY `FK_SSPJ_SS` (`sample_id`),
  CONSTRAINT `FK_SSPJ_SS` FOREIGN KEY (`sample_id`) REFERENCES `sequencingsample` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;;
/*!40101 SET character_set_client = @saved_cs_client */;;
SET @saved_cs_client     = @@character_set_client;;
SET character_set_client = utf8;;
/*!50001 CREATE TABLE `sequencingsample_prodsample` (
  `id` tinyint NOT NULL,
  `prodsample_id` tinyint NOT NULL,
  `rootsample_id` tinyint NOT NULL
) ENGINE=MyISAM */;;
SET character_set_client = @saved_cs_client;;
/*!40101 SET @saved_cs_client     = @@character_set_client */;;
/*!40101 SET character_set_client = utf8 */;;
CREATE TABLE `sequencingsample_sanitycheck` (
  `sanitycheck_id` bigint(20) NOT NULL,
  `sequencingsample_id` bigint(20) NOT NULL,
  UNIQUE KEY `sequencingsample_sanitycheck_composite_key` (`sanitycheck_id`,`sequencingsample_id`),
  KEY `sequencingsample_sanitycheck_sample_id_fk` (`sequencingsample_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;;
/*!40101 SET character_set_client = @saved_cs_client */;;
/*!40101 SET @saved_cs_client     = @@character_set_client */;;
/*!40101 SET character_set_client = utf8 */;;
CREATE TABLE `sequencingsubject` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `familyid` varchar(255) DEFAULT NULL,
  `familyposition` varchar(255) DEFAULT NULL,
  `subjectid` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_familyid_familyposition_subjectid` (`familyid`,`familyposition`,`subjectid`)
) ENGINE=InnoDB AUTO_INCREMENT=1455718 DEFAULT CHARSET=latin1;;
/*!40101 SET character_set_client = @saved_cs_client */;;
/*!40101 SET @saved_cs_client     = @@character_set_client */;;
/*!40101 SET character_set_client = utf8 */;;
CREATE TABLE `sequencingtarget` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `amplicon` varchar(255) DEFAULT NULL,
  `ampliconstart` int(11) NOT NULL DEFAULT '0',
  `outeramplicon` varchar(255) DEFAULT NULL,
  `outerampliconstart` int(11) DEFAULT NULL,
  `targetlocation_id` bigint(20) DEFAULT NULL,
  `fwdStart` bigint(20) NOT NULL DEFAULT '0',
  `fwdSequence` varchar(255) DEFAULT NULL,
  `revStart` bigint(20) NOT NULL DEFAULT '0',
  `revSequence` varchar(255) DEFAULT NULL,
  `outerFwdStart` bigint(20) DEFAULT NULL,
  `outerFwdSequence` varchar(255) DEFAULT NULL,
  `outerRevStart` bigint(20) DEFAULT NULL,
  `outerRevSequence` varchar(255) DEFAULT NULL,
  `fwdNegStrand` tinyint(1) NOT NULL DEFAULT '0',
  `outerFwdNegStrand` tinyint(1) NOT NULL DEFAULT '0',
  `exclusionReason` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK16BDA38F5F83F7BE` (`targetlocation_id`),
  CONSTRAINT `FK16BDA38F5F83F7BE` FOREIGN KEY (`targetlocation_id`) REFERENCES `genomelocation` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=59612 DEFAULT CHARSET=latin1;;
/*!40101 SET character_set_client = @saved_cs_client */;;
/*!40101 SET @saved_cs_client     = @@character_set_client */;;
/*!40101 SET character_set_client = utf8 */;;
CREATE TABLE `sequencingtargetset` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=latin1;;
/*!40101 SET character_set_client = @saved_cs_client */;;
/*!40101 SET @saved_cs_client     = @@character_set_client */;;
/*!40101 SET character_set_client = utf8 */;;
CREATE TABLE `sequencingtargetset_sequencingtarget` (
  `targetsets_id` bigint(20) NOT NULL,
  `targets_id` bigint(20) NOT NULL,
  PRIMARY KEY (`targetsets_id`,`targets_id`),
  KEY `FK1991D3FBBD84940D` (`targetsets_id`),
  KEY `FK1991D3FBB4B42BA5` (`targets_id`),
  CONSTRAINT `FK1991D3FBB4B42BA5` FOREIGN KEY (`targets_id`) REFERENCES `sequencingtarget` (`id`),
  CONSTRAINT `FK1991D3FBBD84940D` FOREIGN KEY (`targetsets_id`) REFERENCES `sequencingtargetset` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;;
/*!40101 SET character_set_client = @saved_cs_client */;;
SET @saved_cs_client     = @@character_set_client;;
SET character_set_client = utf8;;
/*!50001 CREATE TABLE `sif_seqsamples_results` (
  `sif_id` tinyint NOT NULL,
  `casefile_id` tinyint NOT NULL,
  `mom_seq_id` tinyint NOT NULL,
  `child_seq_id` tinyint NOT NULL,
  `dad_seq_id` tinyint NOT NULL,
  `rollup_result` tinyint NOT NULL,
  `has_het_result` tinyint NOT NULL,
  `has_y_result` tinyint NOT NULL,
  `has_counting_result` tinyint NOT NULL,
  `has_handcall` tinyint NOT NULL
) ENGINE=MyISAM */;;
SET character_set_client = @saved_cs_client;;
/*!40101 SET @saved_cs_client     = @@character_set_client */;;
/*!40101 SET character_set_client = utf8 */;;
CREATE TABLE `stats_results` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `project_id` varchar(255) NOT NULL,
  `family_id` varchar(255) DEFAULT NULL,
  `sequencing_sample_barcode` varchar(255) NOT NULL,
  `sample_barcode` varchar(255) DEFAULT NULL,
  `version` varchar(255) NOT NULL,
  `algorithm` varchar(255) NOT NULL,
  `mother_project_id` varchar(255) DEFAULT NULL,
  `mother_sequence_sample_barcode` varchar(255) DEFAULT NULL,
  `father_project_id` varchar(255) DEFAULT NULL,
  `father_sequence_sample_barcode` varchar(255) DEFAULT NULL,
  `child_fraction` float DEFAULT NULL,
  `num_reads` bigint(20) DEFAULT NULL,
  `num_reads_training` bigint(20) DEFAULT NULL,
  `num_reads_mother` bigint(20) DEFAULT NULL,
  `num_reads_father` bigint(20) DEFAULT NULL,
  `training_conf` float DEFAULT NULL,
  `call_13` int(11) DEFAULT NULL,
  `conf_13` float DEFAULT NULL,
  `call_18` int(11) DEFAULT NULL,
  `conf_18` float DEFAULT NULL,
  `call_21` int(11) DEFAULT NULL,
  `conf_21` float DEFAULT NULL,
  `call_23` int(11) DEFAULT NULL,
  `conf_23` float DEFAULT NULL,
  `call_24` int(11) DEFAULT NULL,
  `conf_24` float DEFAULT NULL,
  `is_good_stats` tinyint(1) DEFAULT NULL,
  `spike_ratio` float DEFAULT NULL,
  `leakage_rate` float DEFAULT NULL,
  `contamination_rate` float DEFAULT NULL,
  `beta_noise_parameter` int(11) DEFAULT NULL,
  PRIMARY KEY (`project_id`,`sequencing_sample_barcode`,`version`,`algorithm`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4201 DEFAULT CHARSET=latin1;;
/*!40101 SET character_set_client = @saved_cs_client */;;
SET @saved_cs_client     = @@character_set_client;;
SET character_set_client = utf8;;
/*!50001 CREATE TABLE `statssample` (
  `id` tinyint NOT NULL,
  `allelecountcsvpath` tinyint NOT NULL,
  `lane` tinyint NOT NULL,
  `mappedreads` tinyint NOT NULL,
  `mediandor` tinyint NOT NULL,
  `modelingplasmasample` tinyint NOT NULL,
  `project` tinyint NOT NULL,
  `sampleid` tinyint NOT NULL,
  `sampleprepnotes` tinyint NOT NULL,
  `samplestate` tinyint NOT NULL,
  `sampletype` tinyint NOT NULL,
  `sequencingbarcode` tinyint NOT NULL,
  `sequencingfailed` tinyint NOT NULL,
  `failurereason` tinyint NOT NULL,
  `sequencingresultnotes` tinyint NOT NULL,
  `totalreads` tinyint NOT NULL,
  `useforgenotypetruth` tinyint NOT NULL,
  `run_id` tinyint NOT NULL,
  `subject_id` tinyint NOT NULL,
  `targetset_id` tinyint NOT NULL,
  `samplebarcode` tinyint NOT NULL,
  `familyid` tinyint NOT NULL,
  `familyposition` tinyint NOT NULL,
  `subjectid` tinyint NOT NULL,
  `targetset` tinyint NOT NULL,
  `prodsampleid` tinyint NOT NULL,
  `prodsamplebarcode` tinyint NOT NULL,
  `npdafterampconc` tinyint NOT NULL,
  `npdafterpurificationconc` tinyint NOT NULL,
  `npdnormalizedpurifiedlibraryconc` tinyint NOT NULL,
  `npdplasmavolume` tinyint NOT NULL,
  `npdlabisgood` tinyint NOT NULL,
  `prodsubjectid` tinyint NOT NULL,
  `isnormal` tinyint NOT NULL,
  `notes` tinyint NOT NULL,
  `source` tinyint NOT NULL,
  `sexchromosomestring` tinyint NOT NULL,
  `chr1_copynumber` tinyint NOT NULL,
  `chr2_copynumber` tinyint NOT NULL,
  `chr13_copynumber` tinyint NOT NULL,
  `chr18_copynumber` tinyint NOT NULL,
  `chr21_copynumber` tinyint NOT NULL,
  `sexchromosomecount_X` tinyint NOT NULL,
  `sexchromosomecount_Y` tinyint NOT NULL,
  `chr1_notes` tinyint NOT NULL,
  `chr2_notes` tinyint NOT NULL,
  `chr13_notes` tinyint NOT NULL,
  `chr18_notes` tinyint NOT NULL,
  `chr21_notes` tinyint NOT NULL,
  `gestationalage` tinyint NOT NULL,
  `spike_ratio` tinyint NOT NULL,
  `child_fraction` tinyint NOT NULL,
  `amb_contam` tinyint NOT NULL,
  `geno_contam` tinyint NOT NULL,
  `num_mapped_reads` tinyint NOT NULL
) ENGINE=MyISAM */;;
SET character_set_client = @saved_cs_client;;
SET @saved_cs_client     = @@character_set_client;;
SET character_set_client = utf8;;
/*!50001 CREATE TABLE `statssample_results` (
  `id` tinyint NOT NULL,
  `allelecountcsvpath` tinyint NOT NULL,
  `lane` tinyint NOT NULL,
  `mappedreads` tinyint NOT NULL,
  `mediandor` tinyint NOT NULL,
  `modelingplasmasample` tinyint NOT NULL,
  `project` tinyint NOT NULL,
  `sampleid` tinyint NOT NULL,
  `sampleprepnotes` tinyint NOT NULL,
  `samplestate` tinyint NOT NULL,
  `sampletype` tinyint NOT NULL,
  `sequencingbarcode` tinyint NOT NULL,
  `sequencingfailed` tinyint NOT NULL,
  `failurereason` tinyint NOT NULL,
  `sequencingresultnotes` tinyint NOT NULL,
  `totalreads` tinyint NOT NULL,
  `useforgenotypetruth` tinyint NOT NULL,
  `run_id` tinyint NOT NULL,
  `subject_id` tinyint NOT NULL,
  `targetset_id` tinyint NOT NULL,
  `samplebarcode` tinyint NOT NULL,
  `familyid` tinyint NOT NULL,
  `familyposition` tinyint NOT NULL,
  `subjectid` tinyint NOT NULL,
  `targetset` tinyint NOT NULL,
  `prodsampleid` tinyint NOT NULL,
  `prodsamplebarcode` tinyint NOT NULL,
  `npdafterampconc` tinyint NOT NULL,
  `npdafterpurificationconc` tinyint NOT NULL,
  `npdnormalizedpurifiedlibraryconc` tinyint NOT NULL,
  `npdplasmavolume` tinyint NOT NULL,
  `npdlabisgood` tinyint NOT NULL,
  `prodsubjectid` tinyint NOT NULL,
  `isnormal` tinyint NOT NULL,
  `notes` tinyint NOT NULL,
  `source` tinyint NOT NULL,
  `sexchromosomestring` tinyint NOT NULL,
  `chr1_copynumber` tinyint NOT NULL,
  `chr2_copynumber` tinyint NOT NULL,
  `chr13_copynumber` tinyint NOT NULL,
  `chr18_copynumber` tinyint NOT NULL,
  `chr21_copynumber` tinyint NOT NULL,
  `sexchromosomecount_X` tinyint NOT NULL,
  `sexchromosomecount_Y` tinyint NOT NULL,
  `chr1_notes` tinyint NOT NULL,
  `chr2_notes` tinyint NOT NULL,
  `chr13_notes` tinyint NOT NULL,
  `chr18_notes` tinyint NOT NULL,
  `chr21_notes` tinyint NOT NULL,
  `gestationalage` tinyint NOT NULL,
  `stats_result_id` tinyint NOT NULL,
  `project_id` tinyint NOT NULL,
  `family_id` tinyint NOT NULL,
  `sequencing_sample_barcode` tinyint NOT NULL,
  `sample_barcode` tinyint NOT NULL,
  `version` tinyint NOT NULL,
  `algorithm` tinyint NOT NULL,
  `mother_project_id` tinyint NOT NULL,
  `mother_sequence_sample_barcode` tinyint NOT NULL,
  `father_project_id` tinyint NOT NULL,
  `father_sequence_sample_barcode` tinyint NOT NULL,
  `child_fraction` tinyint NOT NULL,
  `num_reads` tinyint NOT NULL,
  `num_reads_training` tinyint NOT NULL,
  `num_reads_mother` tinyint NOT NULL,
  `num_reads_father` tinyint NOT NULL,
  `training_conf` tinyint NOT NULL,
  `call_13` tinyint NOT NULL,
  `conf_13` tinyint NOT NULL,
  `call_18` tinyint NOT NULL,
  `conf_18` tinyint NOT NULL,
  `call_21` tinyint NOT NULL,
  `conf_21` tinyint NOT NULL,
  `call_23` tinyint NOT NULL,
  `conf_23` tinyint NOT NULL,
  `call_24` tinyint NOT NULL,
  `conf_24` tinyint NOT NULL,
  `minconf` tinyint NOT NULL,
  `is_good_stats` tinyint NOT NULL,
  `spike_ratio` tinyint NOT NULL,
  `leakage_rate` tinyint NOT NULL,
  `contamination_rate` tinyint NOT NULL,
  `beta_noise_parameter` tinyint NOT NULL
) ENGINE=MyISAM */;;
SET character_set_client = @saved_cs_client;;
/*!40101 SET @saved_cs_client     = @@character_set_client */;;
/*!40101 SET character_set_client = utf8 */;;
CREATE TABLE `tmp_online_change_test` (
  `pk` bigint(20) NOT NULL AUTO_INCREMENT,
  `genomelocation_id` bigint(20) NOT NULL,
  `used2` bit(1) NOT NULL DEFAULT b'1',
  `used` bit(1) NOT NULL DEFAULT b'1',
  PRIMARY KEY (`pk`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;;
/*!40101 SET character_set_client = @saved_cs_client */;;

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `auditlog` /*!40100 DEFAULT CHARACTER SET latin1 */;;

USE `auditlog`;;
/*!40101 SET @saved_cs_client     = @@character_set_client */;;
/*!40101 SET character_set_client = utf8 */;;
CREATE TABLE `auditlogrecord` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `entityattribute` varchar(255) DEFAULT NULL,
  `entityid` bigint(20) DEFAULT NULL,
  `entityname` varchar(255) DEFAULT NULL,
  `message` varchar(255) DEFAULT NULL,
  `newvalue` varchar(16384) DEFAULT NULL,
  `oldvalue` varchar(16384) DEFAULT NULL,
  `timestamp` datetime DEFAULT NULL,
  `userid` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `entityname_entityid` (`entityname`,`entityid`)
) ENGINE=InnoDB AUTO_INCREMENT=884400001 DEFAULT CHARSET=latin1;;
/*!40101 SET character_set_client = @saved_cs_client */;;
/*!40101 SET @saved_cs_client     = @@character_set_client */;;
/*!40101 SET character_set_client = utf8 */;;
CREATE TABLE `notification` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `timestamp` datetime NOT NULL,
  `entity_name` varchar(255) NOT NULL,
  `entity_id` bigint(20) NOT NULL,
  `event` varchar(45) NOT NULL,
  `delivered` datetime DEFAULT NULL,
  `source_entities` varchar(8192) DEFAULT NULL,
  `source` varchar(1024) DEFAULT NULL,
  `notification` varchar(1024) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_notification_timestamp` (`timestamp`),
  KEY `idx_notification_delivered` (`delivered`),
  KEY `idx_notification_entity_name_id` (`entity_name`,`entity_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1257176 DEFAULT CHARSET=latin1;;
/*!40101 SET character_set_client = @saved_cs_client */;;

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `diseaseassociations` /*!40100 DEFAULT CHARACTER SET latin1 */;;

USE `diseaseassociations`;;
/*!40101 SET @saved_cs_client     = @@character_set_client */;;
/*!40101 SET character_set_client = utf8 */;;
CREATE TABLE `ab1data` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `sequence_id` bigint(20) DEFAULT NULL,
  `field` char(10) NOT NULL,
  `idx` int(10) unsigned NOT NULL,
  `value` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ab1data_idx` (`sequence_id`,`field`,`idx`),
  KEY `FK189167BAD9D6E74F` (`sequence_id`),
  CONSTRAINT `FK189167BAD9D6E74F` FOREIGN KEY (`sequence_id`) REFERENCES `sequence` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=537611 DEFAULT CHARSET=latin1;;
/*!40101 SET character_set_client = @saved_cs_client */;;
/*!40101 SET @saved_cs_client     = @@character_set_client */;;
/*!40101 SET character_set_client = utf8 */;;
CREATE TABLE `amptarget` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `amplicon` text NOT NULL,
  `hgVersion` int(10) unsigned NOT NULL,
  `chr` char(2) NOT NULL,
  `start` bigint(20) unsigned NOT NULL,
  `end` bigint(20) unsigned NOT NULL,
  `version` int(10) unsigned DEFAULT '0',
  `fwd_id` bigint(20) DEFAULT NULL,
  `rev_id` bigint(20) DEFAULT NULL,
  `failed` tinyint(1) DEFAULT NULL,
  `penalty` float DEFAULT NULL,
  `compl_any` float DEFAULT NULL,
  `compl_end` float DEFAULT NULL,
  `mispriming_score` float DEFAULT NULL,
  `designedBy` varchar(45) DEFAULT NULL,
  `comment` tinytext,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_b92f5c8747814dbabdbda75c9cc` (`fwd_id`,`rev_id`),
  KEY `FKD078A8359934A36F` (`fwd_id`),
  KEY `FKD078A835ACB9527F` (`rev_id`),
  KEY `FK_fdf4166d68ee43ce98ccfa8223e` (`fwd_id`),
  KEY `FK_db5ca98965df4365a2236cf4442` (`rev_id`),
  CONSTRAINT `FKD078A8359934A36F` FOREIGN KEY (`fwd_id`) REFERENCES `primer` (`id`),
  CONSTRAINT `FKD078A835ACB9527F` FOREIGN KEY (`rev_id`) REFERENCES `primer` (`id`),
  CONSTRAINT `FK_db5ca98965df4365a2236cf4442` FOREIGN KEY (`rev_id`) REFERENCES `primer` (`id`),
  CONSTRAINT `FK_fdf4166d68ee43ce98ccfa8223e` FOREIGN KEY (`fwd_id`) REFERENCES `primer` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3505 DEFAULT CHARSET=latin1 COMMENT='InnoDB free: 23552 kB; (`fwd_id`) REFER `diseaseassociations';;
/*!40101 SET character_set_client = @saved_cs_client */;;
/*!40101 SET @saved_cs_client     = @@character_set_client */;;
/*!40101 SET character_set_client = utf8 */;;
CREATE TABLE `annotation` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `variation_id` bigint(20) DEFAULT NULL,
  `reviewer_name` tinytext,
  `status` enum('confirmed','flagged','unchecked') DEFAULT NULL,
  `master_reviewer_notes` text,
  `disease_2` varchar(255) DEFAULT NULL,
  `disease_name` tinytext,
  `diseasesubtype_name` tinytext,
  `gene_symbol` tinytext,
  `alt_symbols` tinytext,
  `gene_strand` enum('-','+') DEFAULT NULL,
  `alias1` tinytext,
  `alias2` tinytext,
  `alias3` tinytext,
  `rs_id` varchar(45) DEFAULT NULL,
  `notes_variation` text,
  `papers_variation` text,
  `mutation_description` text,
  `omim_id` int(10) unsigned DEFAULT NULL,
  `omim_allele` int(10) unsigned DEFAULT NULL,
  `inheritance` tinytext,
  `chr` varchar(4) DEFAULT NULL,
  `variation_strand` enum('-','+') DEFAULT NULL,
  `upstream_base` int(11) DEFAULT NULL,
  `downstream_base` int(11) DEFAULT NULL,
  `ref_seq` text,
  `mut_seq` text,
  `funcType` tinytext,
  `physicalChange` tinytext,
  `bioType` tinytext,
  `hgVersion` int(11) DEFAULT NULL,
  `frequency_class` enum('high','medium','low','rare') DEFAULT NULL,
  `prevalence` tinytext,
  `carrier_frequency` tinytext,
  `fraction_affected` tinytext,
  `population_notes` tinytext,
  `notes_frequency` text,
  `papers_frequency` text,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `fk_variation_id` (`variation_id`),
  CONSTRAINT `fk_variation_id` FOREIGN KEY (`variation_id`) REFERENCES `variation` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5715 DEFAULT CHARSET=latin1;;
/*!40101 SET character_set_client = @saved_cs_client */;;
/*!40101 SET @saved_cs_client     = @@character_set_client */;;
/*!40101 SET character_set_client = utf8 */;;
CREATE TABLE `band` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `chr` varchar(2) NOT NULL,
  `start` int(10) NOT NULL,
  `end` int(10) NOT NULL,
  `name` varchar(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=863 DEFAULT CHARSET=latin1;;
/*!40101 SET character_set_client = @saved_cs_client */;;
/*!40101 SET @saved_cs_client     = @@character_set_client */;;
/*!40101 SET character_set_client = utf8 */;;
CREATE TABLE `coriell` (
  `disease_id` bigint(20) DEFAULT NULL,
  `catalog_id` varchar(45) NOT NULL,
  `dna_sample_id` varchar(45) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `sampleType` varchar(45) DEFAULT NULL,
  `cellLineAvailable` tinyint(1) DEFAULT NULL,
  `dnaAvailable` tinyint(1) DEFAULT NULL,
  `caseClass` tinyint(1) DEFAULT NULL,
  `gender` enum('Male','Female','Ambiguous') DEFAULT NULL,
  `race` varchar(45) DEFAULT NULL,
  `affected` tinyint(1) DEFAULT NULL,
  `karyotype` varchar(45) DEFAULT NULL,
  `proband_relationship` varchar(45) DEFAULT NULL,
  `coriellMutation` varchar(45) DEFAULT NULL,
  `mutation1` varchar(45) DEFAULT NULL,
  `mutation2` varchar(45) DEFAULT NULL,
  `mutation3` varchar(45) DEFAULT NULL,
  `mutation4` varchar(45) DEFAULT NULL,
  `CoriellGene` varchar(45) DEFAULT NULL,
  `gene1` varchar(45) DEFAULT NULL,
  `gene2` varchar(45) DEFAULT NULL,
  `gene3` varchar(45) DEFAULT NULL,
  `gene4` varchar(45) DEFAULT NULL,
  `pubsCited` int(10) DEFAULT NULL,
  `coriellFamily` varchar(45) DEFAULT NULL,
  `ethnicity` varchar(45) DEFAULT NULL,
  `linkRef` varchar(45) DEFAULT NULL,
  `collectionType` varchar(255) DEFAULT NULL,
  `pageName` varchar(45) DEFAULT NULL,
  `collectionType_id` varchar(45) DEFAULT NULL,
  `catalogRemark` text,
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `notes` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`,`catalog_id`) USING BTREE,
  KEY `dna_sample_idx` (`dna_sample_id`) USING BTREE,
  KEY `FK9C232A0291109C65` (`disease_id`),
  KEY `FK_1f16b7ef979b42a39e4512ac96a` (`disease_id`),
  CONSTRAINT `FK9C232A0291109C65` FOREIGN KEY (`disease_id`) REFERENCES `disease` (`id`),
  CONSTRAINT `FK_1f16b7ef979b42a39e4512ac96a` FOREIGN KEY (`disease_id`) REFERENCES `disease` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=230 DEFAULT CHARSET=latin1 COMMENT='InnoDB free: 40960 kB; (`variation_id`) REFER `diseaseassoci';;
/*!40101 SET character_set_client = @saved_cs_client */;;
/*!40101 SET @saved_cs_client     = @@character_set_client */;;
/*!40101 SET character_set_client = utf8 */;;
CREATE TABLE `coriell_variation` (
  `mutation` varchar(45) NOT NULL,
  `catalog_id` varchar(45) NOT NULL,
  `coriell_id` bigint(20) DEFAULT NULL,
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `variation_id` bigint(20) DEFAULT NULL,
  `homozygous` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `fk_coriell_id` (`coriell_id`),
  KEY `FK5DDEAC16BCCE245` (`variation_id`),
  KEY `FK_6413eede380e460c9546464197e` (`variation_id`),
  CONSTRAINT `FK5DDEAC16BCCE245` FOREIGN KEY (`variation_id`) REFERENCES `variation` (`id`),
  CONSTRAINT `FK_6413eede380e460c9546464197e` FOREIGN KEY (`variation_id`) REFERENCES `variation` (`id`),
  CONSTRAINT `fk_coriell_id` FOREIGN KEY (`coriell_id`) REFERENCES `coriell` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=298 DEFAULT CHARSET=latin1 COMMENT='InnoDB free: 40960 kB; (`variation_id`) REFER `diseaseassoci';;
/*!40101 SET character_set_client = @saved_cs_client */;;
/*!40101 SET @saved_cs_client     = @@character_set_client */;;
/*!40101 SET character_set_client = utf8 */;;
CREATE TABLE `demographics` (
  `id` bigint(20) DEFAULT NULL,
  `disease_id` bigint(20) DEFAULT NULL,
  `ethnicity` varchar(45) DEFAULT NULL,
  `prevalence` varchar(45) DEFAULT NULL,
  `date` date DEFAULT NULL,
  KEY `fk_disease` (`disease_id`),
  KEY `FK1C5C698E91109C65` (`disease_id`),
  KEY `FK_560a307e2038484db3a2c2103cf` (`disease_id`),
  CONSTRAINT `FK1C5C698E91109C65` FOREIGN KEY (`disease_id`) REFERENCES `disease` (`id`),
  CONSTRAINT `FK_560a307e2038484db3a2c2103cf` FOREIGN KEY (`disease_id`) REFERENCES `disease` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;;
/*!40101 SET character_set_client = @saved_cs_client */;;
/*!40101 SET @saved_cs_client     = @@character_set_client */;;
/*!40101 SET character_set_client = utf8 */;;
CREATE TABLE `disease` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `alt_names` varchar(1000) DEFAULT NULL,
  `reportDisplayName` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_idx` (`name`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=366 DEFAULT CHARSET=utf8;;
/*!40101 SET character_set_client = @saved_cs_client */;;
/*!40101 SET @saved_cs_client     = @@character_set_client */;;
/*!40101 SET character_set_client = utf8 */;;
CREATE TABLE `disease_gene` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `disease_id` bigint(20) DEFAULT NULL,
  `gene_id` bigint(20) DEFAULT NULL,
  `attributed_load` varchar(45) DEFAULT NULL,
  `num_known_variations` int(11) DEFAULT NULL,
  `mut_types` varchar(45) DEFAULT NULL,
  `mut_types_notes` varchar(256) DEFAULT NULL,
  `num_common_variations` int(11) DEFAULT NULL,
  `freq_comm_var_disease` varchar(45) DEFAULT NULL COMMENT 'This is the freq of the common mutation in disease cases. e.g. 99% of Achondroplasia is due to two mutations in FGFR3\n',
  `testing_methods` varchar(45) DEFAULT NULL,
  `freq_var_identified` varchar(45) DEFAULT NULL,
  `reference` varchar(45) DEFAULT NULL,
  `date` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK2A7E041891109C65` (`disease_id`),
  KEY `FK2A7E0418834D194F` (`gene_id`),
  KEY `FK_6a43195bbf77493686a174c7e48` (`disease_id`),
  KEY `FK_cdb907f081914503a455ba49092` (`gene_id`),
  CONSTRAINT `FK2A7E0418834D194F` FOREIGN KEY (`gene_id`) REFERENCES `gene` (`id`),
  CONSTRAINT `FK2A7E041891109C65` FOREIGN KEY (`disease_id`) REFERENCES `disease` (`id`),
  CONSTRAINT `FK_6a43195bbf77493686a174c7e48` FOREIGN KEY (`disease_id`) REFERENCES `disease` (`id`),
  CONSTRAINT `FK_cdb907f081914503a455ba49092` FOREIGN KEY (`gene_id`) REFERENCES `gene` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;;
/*!40101 SET character_set_client = @saved_cs_client */;;
/*!40101 SET @saved_cs_client     = @@character_set_client */;;
/*!40101 SET character_set_client = utf8 */;;
CREATE TABLE `disease_old` (
  `id` int(11) NOT NULL,
  `name` varchar(45) NOT NULL,
  `alt_name` varchar(45) DEFAULT NULL,
  `CUI` varchar(10) DEFAULT NULL,
  `penetrance` varchar(45) DEFAULT NULL,
  `denovo_mutation_rate` varchar(45) DEFAULT NULL,
  `g_fraction` varchar(45) DEFAULT NULL,
  `prevalence` varchar(45) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `comments` text,
  `inheritance` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;;
/*!40101 SET character_set_client = @saved_cs_client */;;
/*!40101 SET @saved_cs_client     = @@character_set_client */;;
/*!40101 SET character_set_client = utf8 */;;
CREATE TABLE `disease_variation` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `variation_id` bigint(20) DEFAULT NULL,
  `ethnicity` varchar(45) DEFAULT NULL,
  `acmg_code` enum('PRRC','PUEC','PUMC','PUUC','PRNC') DEFAULT NULL,
  `reference` varchar(256) DEFAULT NULL,
  `pubmedid` smallint(6) DEFAULT NULL,
  `lastCurated` date DEFAULT NULL,
  `cui` varchar(45) DEFAULT NULL,
  `disease_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKB64BE31091109C65` (`disease_id`),
  KEY `FKB64BE310BCCE245` (`variation_id`),
  CONSTRAINT `FKB64BE31091109C65` FOREIGN KEY (`disease_id`) REFERENCES `disease` (`id`),
  CONSTRAINT `FKB64BE310BCCE245` FOREIGN KEY (`variation_id`) REFERENCES `variation` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1728 DEFAULT CHARSET=latin1;;
/*!40101 SET character_set_client = @saved_cs_client */;;
/*!40101 SET @saved_cs_client     = @@character_set_client */;;
/*!40101 SET character_set_client = utf8 */;;
CREATE TABLE `diseasesubtype` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `disease_id` bigint(20) DEFAULT NULL,
  `name` varchar(54) NOT NULL,
  `date` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK1FF0B09E91109C65` (`disease_id`),
  KEY `FK_fec2c7cf79944064968d45969ae` (`disease_id`),
  CONSTRAINT `FK1FF0B09E91109C65` FOREIGN KEY (`disease_id`) REFERENCES `disease` (`id`),
  CONSTRAINT `FK_fec2c7cf79944064968d45969ae` FOREIGN KEY (`disease_id`) REFERENCES `disease` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;;
/*!40101 SET character_set_client = @saved_cs_client */;;
/*!40101 SET @saved_cs_client     = @@character_set_client */;;
/*!40101 SET character_set_client = utf8 */;;
CREATE TABLE `experiment` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `description` text,
  `notes` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=229 DEFAULT CHARSET=latin1;;
/*!40101 SET character_set_client = @saved_cs_client */;;
/*!40101 SET @saved_cs_client     = @@character_set_client */;;
/*!40101 SET character_set_client = utf8 */;;
CREATE TABLE `gene` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `symbol` varchar(45) NOT NULL,
  `alt_symbols` varchar(45) DEFAULT NULL,
  `name` varchar(45) DEFAULT NULL,
  `chr` varchar(5) NOT NULL,
  `start` int(11) NOT NULL,
  `end` int(11) NOT NULL,
  `strand` enum('+','-') DEFAULT NULL,
  `omim_id` bigint(20) unsigned DEFAULT NULL,
  `hgVersion` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `symbol_idx` (`symbol`),
  UNIQUE KEY `UK_a0d65d7c4af14fb49769aed8a86` (`symbol`)
) ENGINE=InnoDB AUTO_INCREMENT=361 DEFAULT CHARSET=latin1;;
/*!40101 SET character_set_client = @saved_cs_client */;;
/*!40101 SET @saved_cs_client     = @@character_set_client */;;
/*!40101 SET character_set_client = utf8 */;;
CREATE TABLE `lab` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `resultmode` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;;
/*!40101 SET character_set_client = @saved_cs_client */;;
/*!40101 SET @saved_cs_client     = @@character_set_client */;;
/*!40101 SET character_set_client = utf8 */;;
CREATE TABLE `lab_labtest` (
  `Lab_id` bigint(20) DEFAULT NULL,
  `labtests_id` bigint(20) DEFAULT NULL,
  UNIQUE KEY `labtests_id` (`labtests_id`),
  UNIQUE KEY `UK_1669303932de40c89002027a894` (`labtests_id`),
  KEY `FK71E776CD46552445` (`Lab_id`),
  KEY `FK71E776CD96116070` (`labtests_id`),
  KEY `FK_b710fcff3bc84c4bb9db36a0529` (`labtests_id`),
  KEY `FK_92afa4166c724e3fbd6748b2016` (`Lab_id`),
  CONSTRAINT `FK71E776CD46552445` FOREIGN KEY (`Lab_id`) REFERENCES `lab` (`id`),
  CONSTRAINT `FK71E776CD96116070` FOREIGN KEY (`labtests_id`) REFERENCES `labtest` (`id`),
  CONSTRAINT `FK_92afa4166c724e3fbd6748b2016` FOREIGN KEY (`Lab_id`) REFERENCES `lab` (`id`),
  CONSTRAINT `FK_b710fcff3bc84c4bb9db36a0529` FOREIGN KEY (`labtests_id`) REFERENCES `labtest` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;;
/*!40101 SET character_set_client = @saved_cs_client */;;
/*!40101 SET @saved_cs_client     = @@character_set_client */;;
/*!40101 SET character_set_client = utf8 */;;
CREATE TABLE `labtest` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `deleted` bit(1) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `disease_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `FK5F6C639F91109C65` (`disease_id`),
  KEY `FK_82128270abab48c7abb0c330023` (`disease_id`),
  CONSTRAINT `FK5F6C639F91109C65` FOREIGN KEY (`disease_id`) REFERENCES `disease` (`id`),
  CONSTRAINT `FK_82128270abab48c7abb0c330023` FOREIGN KEY (`disease_id`) REFERENCES `disease` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;;
/*!40101 SET character_set_client = @saved_cs_client */;;
/*!40101 SET @saved_cs_client     = @@character_set_client */;;
/*!40101 SET character_set_client = utf8 */;;
CREATE TABLE `labtest_diseasevariation` (
  `variation_id` bigint(20) DEFAULT NULL,
  `disease_id` bigint(20) DEFAULT NULL,
  `vendorLabel` varchar(45) DEFAULT NULL,
  `vendor` varchar(45) NOT NULL,
  `variationDesc1` varchar(100) DEFAULT NULL,
  `variationDesc2` varchar(100) DEFAULT NULL,
  `diseasesubtype_id` bigint(20) DEFAULT NULL,
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  UNIQUE KEY `id` (`id`),
  KEY `FK1AEAF8B791109C65` (`disease_id`),
  KEY `FK1AEAF8B74A4E626F` (`diseasesubtype_id`),
  KEY `FK1AEAF8B7BCCE245` (`variation_id`),
  CONSTRAINT `FK1AEAF8B74A4E626F` FOREIGN KEY (`diseasesubtype_id`) REFERENCES `diseasesubtype` (`id`),
  CONSTRAINT `FK1AEAF8B791109C65` FOREIGN KEY (`disease_id`) REFERENCES `disease` (`id`),
  CONSTRAINT `FK1AEAF8B7BCCE245` FOREIGN KEY (`variation_id`) REFERENCES `variation` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=559 DEFAULT CHARSET=latin1 COMMENT='InnoDB free: 16384 kB; (`disease_id`) REFER `diseaseassociat';;
/*!40101 SET character_set_client = @saved_cs_client */;;
/*!40101 SET @saved_cs_client     = @@character_set_client */;;
/*!40101 SET character_set_client = utf8 */;;
CREATE TABLE `labtest_labtest_diseasevariation` (
  `LabTest_id` bigint(20) DEFAULT NULL,
  `diseasevariations_id` bigint(20) DEFAULT NULL,
  UNIQUE KEY `UK_3f84fd583cb24b199ed603a659f` (`diseasevariations_id`),
  KEY `FKEC0B2957643039A5` (`LabTest_id`),
  KEY `FKEC0B29579E6F60DF` (`diseasevariations_id`),
  KEY `FK_0cdd618486b749d0b14f91fd33c` (`diseasevariations_id`),
  KEY `FK_fe9408e212a049b6a4aee769e10` (`LabTest_id`),
  CONSTRAINT `FKEC0B2957643039A5` FOREIGN KEY (`LabTest_id`) REFERENCES `labtest` (`id`),
  CONSTRAINT `FKEC0B29579E6F60DF` FOREIGN KEY (`diseasevariations_id`) REFERENCES `labtest_diseasevariation` (`id`),
  CONSTRAINT `FK_0cdd618486b749d0b14f91fd33c` FOREIGN KEY (`diseasevariations_id`) REFERENCES `labtest_diseasevariation` (`id`),
  CONSTRAINT `FK_fe9408e212a049b6a4aee769e10` FOREIGN KEY (`LabTest_id`) REFERENCES `labtest` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;;
/*!40101 SET character_set_client = @saved_cs_client */;;
/*!40101 SET @saved_cs_client     = @@character_set_client */;;
/*!40101 SET character_set_client = utf8 */;;
CREATE TABLE `primer` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `sequence` varchar(127) NOT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `start` bigint(20) unsigned DEFAULT NULL,
  `chr` char(2) DEFAULT NULL,
  `hgVersion` int(10) unsigned DEFAULT NULL,
  `direction` enum('F','R') DEFAULT NULL,
  `tm` float DEFAULT NULL,
  `gc_percent` float DEFAULT NULL,
  `penalty` float DEFAULT NULL,
  `end_stability` float DEFAULT NULL,
  `mispriming_score` float DEFAULT NULL,
  `self_any` float DEFAULT NULL,
  `self_end` float DEFAULT NULL,
  `comment` text,
  `strand` enum('+','-') DEFAULT NULL,
  `primermid_id` bigint(20) DEFAULT NULL,
  `primertail_id` bigint(20) DEFAULT NULL,
  `DTYPE` varchar(31) NOT NULL DEFAULT 'Primer',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9187 DEFAULT CHARSET=latin1;;
/*!40101 SET character_set_client = @saved_cs_client */;;
/*!40101 SET @saved_cs_client     = @@character_set_client */;;
/*!40101 SET character_set_client = utf8 */;;
CREATE TABLE `primer_data_for_dev` (
  `primer_tube_id` bigint(20) DEFAULT NULL,
  `amptarget_id` bigint(20) DEFAULT NULL,
  `expected_length` bigint(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;;
/*!40101 SET character_set_client = @saved_cs_client */;;
/*!40101 SET @saved_cs_client     = @@character_set_client */;;
/*!40101 SET character_set_client = utf8 */;;
CREATE TABLE `primermid` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `sequence` varchar(45) NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  `description` varchar(100) DEFAULT NULL,
  `notes` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;;
/*!40101 SET character_set_client = @saved_cs_client */;;
/*!40101 SET @saved_cs_client     = @@character_set_client */;;
/*!40101 SET character_set_client = utf8 */;;
CREATE TABLE `primerpair` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `description` varchar(255) DEFAULT NULL,
  `ampTarget_id` bigint(20) DEFAULT NULL,
  `legacyName` varchar(45) DEFAULT NULL,
  `comment` text,
  `fwdprimertail_id` bigint(20) DEFAULT NULL,
  `fwdprimermid_id` bigint(20) DEFAULT NULL,
  `revprimertail_id` bigint(20) DEFAULT NULL,
  `revprimermid_id` bigint(20) DEFAULT NULL,
  `fwdLegacyName` varchar(45) DEFAULT NULL,
  `revLegacyName` varchar(45) DEFAULT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `FK31952F6DCB792305` (`ampTarget_id`),
  KEY `FK_8094aa83a5414366a1d7594dc7b` (`ampTarget_id`),
  CONSTRAINT `FK31952F6DCB792305` FOREIGN KEY (`ampTarget_id`) REFERENCES `amptarget` (`id`),
  CONSTRAINT `FK_8094aa83a5414366a1d7594dc7b` FOREIGN KEY (`ampTarget_id`) REFERENCES `amptarget` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7416 DEFAULT CHARSET=latin1;;
/*!40101 SET character_set_client = @saved_cs_client */;;
/*!40101 SET @saved_cs_client     = @@character_set_client */;;
/*!40101 SET character_set_client = utf8 */;;
CREATE TABLE `primerplate` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `receivedBy` varchar(45) DEFAULT NULL,
  `received` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `concentration` float DEFAULT NULL,
  `barcode` varchar(45) DEFAULT NULL,
  `name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `Unique_barcode` (`barcode`),
  UNIQUE KEY `UK_bb4d543d665547dfa5d92eb652f` (`barcode`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;;
/*!40101 SET character_set_client = @saved_cs_client */;;
/*!40101 SET @saved_cs_client     = @@character_set_client */;;
/*!40101 SET character_set_client = utf8 */;;
CREATE TABLE `primerplate_primer` (
  `PrimerPlate_id` bigint(20) DEFAULT NULL,
  `Well` char(3) NOT NULL,
  `id` bigint(20) DEFAULT NULL,
  `primerpair_id` bigint(20) DEFAULT NULL,
  `direction` enum('F','R') NOT NULL,
  UNIQUE KEY `Unique_Plate_Well_Pair` (`Well`,`PrimerPlate_id`),
  UNIQUE KEY `UK_41ea65b5054f4690be386c007e0` (`Well`,`PrimerPlate_id`),
  KEY `FK8CA15CAF1C4A9AAF` (`primerpair_id`),
  KEY `FK8CA15CAFA56A2965` (`PrimerPlate_id`),
  KEY `FK_4c7227fd97354abf83c1f012563` (`primerpair_id`),
  KEY `FK_494e50859f4a43959c0c7e4e144` (`PrimerPlate_id`),
  CONSTRAINT `FK8CA15CAF1C4A9AAF` FOREIGN KEY (`primerpair_id`) REFERENCES `primerpair` (`id`),
  CONSTRAINT `FK8CA15CAFA56A2965` FOREIGN KEY (`PrimerPlate_id`) REFERENCES `primerplate` (`id`),
  CONSTRAINT `FK_494e50859f4a43959c0c7e4e144` FOREIGN KEY (`PrimerPlate_id`) REFERENCES `primerplate` (`id`),
  CONSTRAINT `FK_4c7227fd97354abf83c1f012563` FOREIGN KEY (`primerpair_id`) REFERENCES `primerpair` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;;
/*!40101 SET character_set_client = @saved_cs_client */;;
/*!40101 SET @saved_cs_client     = @@character_set_client */;;
/*!40101 SET character_set_client = utf8 */;;
CREATE TABLE `primers_for_ordering` (
  `primer name` varbinary(21) DEFAULT NULL,
  `primer sequence` varchar(127) DEFAULT NULL,
  `primer pair` bigint(20) DEFAULT NULL,
  `amptarget` bigint(20) DEFAULT NULL,
  `mutation` tinytext,
  `amplicon length` bigint(20) DEFAULT NULL,
  `strand` varchar(1) DEFAULT NULL,
  `direction` varchar(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;;
/*!40101 SET character_set_client = @saved_cs_client */;;
/*!40101 SET @saved_cs_client     = @@character_set_client */;;
/*!40101 SET character_set_client = utf8 */;;
CREATE TABLE `primertail` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `sequence` varchar(100) NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  `description` varchar(100) DEFAULT NULL,
  `notes` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;;
/*!40101 SET character_set_client = @saved_cs_client */;;
/*!40101 SET @saved_cs_client     = @@character_set_client */;;
/*!40101 SET character_set_client = utf8 */;;
CREATE TABLE `rawcall` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `a` int(11) NOT NULL,
  `c` int(11) NOT NULL,
  `g` int(11) NOT NULL,
  `idx` int(11) NOT NULL,
  `phd` int(11) NOT NULL,
  `seq` char(1) NOT NULL,
  `seqpos` int(11) NOT NULL,
  `t` int(11) NOT NULL,
  `wild` char(1) NOT NULL,
  `wildpos` int(11) NOT NULL,
  `splitAlignment_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK3AC7DE8677C5C66F` (`splitAlignment_id`),
  CONSTRAINT `FK3AC7DE8677C5C66F` FOREIGN KEY (`splitAlignment_id`) REFERENCES `split_alignment` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;;
/*!40101 SET character_set_client = @saved_cs_client */;;
/*!40101 SET @saved_cs_client     = @@character_set_client */;;
/*!40101 SET character_set_client = utf8 */;;
CREATE TABLE `sequence` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `experiment` varchar(45) DEFAULT NULL,
  `sequenceplate_id` bigint(20) DEFAULT NULL,
  `sample_id` varchar(100) NOT NULL,
  `sample_db` enum('P','R','C') NOT NULL,
  `primerpair_id` bigint(20) DEFAULT NULL,
  `direction` enum('F','R') DEFAULT NULL,
  `filename` varchar(528) NOT NULL,
  `well` varchar(10) DEFAULT NULL,
  `LOR` int(10) unsigned DEFAULT NULL,
  `snr` int(10) unsigned DEFAULT NULL,
  `score` int(10) unsigned DEFAULT NULL,
  `version` bigint(20) DEFAULT NULL,
  `aligned_allowance` decimal(5,3) DEFAULT NULL,
  `aligned_length` int(10) unsigned DEFAULT NULL,
  `failed` tinyint(1) DEFAULT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `sequenceprimer_id` bigint(20) DEFAULT NULL,
  `analysisProtocol` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `file_run` (`sequenceplate_id`,`filename`) USING BTREE,
  KEY `FK544ADBE11C4A9AAF` (`primerpair_id`),
  KEY `FK544ADBE11CE46165` (`sequenceplate_id`),
  KEY `FK544ADBE18A8F5ACF` (`sequenceprimer_id`),
  KEY `FK_7db3179b96ce45d08ec244c8494` (`primerpair_id`),
  CONSTRAINT `FK544ADBE11C4A9AAF` FOREIGN KEY (`primerpair_id`) REFERENCES `primerpair` (`id`),
  CONSTRAINT `FK544ADBE11CE46165` FOREIGN KEY (`sequenceplate_id`) REFERENCES `sequenceplate` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK544ADBE18A8F5ACF` FOREIGN KEY (`sequenceprimer_id`) REFERENCES `primer` (`id`),
  CONSTRAINT `FK_7db3179b96ce45d08ec244c8494` FOREIGN KEY (`primerpair_id`) REFERENCES `primerpair` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7213792 DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;;
/*!40101 SET character_set_client = @saved_cs_client */;;
/*!40101 SET @saved_cs_client     = @@character_set_client */;;
/*!40101 SET character_set_client = utf8 */;;
CREATE TABLE `sequence_sample` (
  `id` bigint(20) DEFAULT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `sequenceplate_id` bigint(20) DEFAULT NULL,
  `sample_id` varchar(100) DEFAULT NULL,
  `sample_db` enum('P','R','C') DEFAULT NULL,
  `primerpair_id` bigint(20) DEFAULT NULL,
  `direction` enum('F','R') DEFAULT NULL,
  `filename` varchar(528) DEFAULT NULL,
  `well` varchar(10) DEFAULT NULL,
  `LOR` int(10) unsigned DEFAULT NULL,
  `snr` int(10) unsigned DEFAULT NULL,
  `score` int(10) unsigned DEFAULT NULL,
  `version` bigint(20) DEFAULT NULL,
  `aligned_allowance` decimal(5,3) DEFAULT NULL,
  `aligned_length` int(10) unsigned DEFAULT NULL,
  `failed` tinyint(1) DEFAULT NULL,
  `dir` text,
  `amptarget_id` bigint(20) DEFAULT NULL,
  `amplicon` text,
  `prep_procedure` varchar(255) DEFAULT NULL,
  `sample_scale` varchar(255) DEFAULT NULL,
  `subjectname` varchar(255) DEFAULT NULL,
  `tissue_type` varchar(255) DEFAULT NULL,
  `subject_id` bigint(20) DEFAULT NULL,
  `sampledatabase` char(1) DEFAULT NULL,
  `note` text
) ENGINE=InnoDB DEFAULT CHARSET=latin1;;
/*!40101 SET character_set_client = @saved_cs_client */;;
/*!40101 SET @saved_cs_client     = @@character_set_client */;;
/*!40101 SET character_set_client = utf8 */;;
CREATE TABLE `sequence_sample_family` (
  `id` bigint(20) DEFAULT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `sequenceplate_id` bigint(20) DEFAULT NULL,
  `sample_id` varchar(100) DEFAULT NULL,
  `sample_db` enum('P','R','C') DEFAULT NULL,
  `primerpair_id` bigint(20) DEFAULT NULL,
  `direction` enum('F','R') DEFAULT NULL,
  `filename` varchar(528) DEFAULT NULL,
  `well` varchar(10) DEFAULT NULL,
  `LOR` int(10) unsigned DEFAULT NULL,
  `snr` int(10) unsigned DEFAULT NULL,
  `score` int(10) unsigned DEFAULT NULL,
  `version` bigint(20) DEFAULT NULL,
  `aligned_allowance` decimal(5,3) DEFAULT NULL,
  `aligned_length` int(10) unsigned DEFAULT NULL,
  `failed` tinyint(1) DEFAULT NULL,
  `dir` text,
  `amptarget_id` bigint(20) DEFAULT NULL,
  `amplicon` text,
  `prep_procedure` varchar(255) DEFAULT NULL,
  `sample_scale` varchar(255) DEFAULT NULL,
  `subjectname` varchar(255) DEFAULT NULL,
  `tissue_type` varchar(255) DEFAULT NULL,
  `subject_id` bigint(20) DEFAULT NULL,
  `sampledatabase` char(1) DEFAULT NULL,
  `note` text,
  `family_id` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;;
/*!40101 SET character_set_client = @saved_cs_client */;;
/*!40101 SET @saved_cs_client     = @@character_set_client */;;
/*!40101 SET character_set_client = utf8 */;;
CREATE TABLE `sequenceplate` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `dir` text NOT NULL,
  `version` bigint(20) DEFAULT NULL,
  `plate_id` mediumint(9) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=104968 DEFAULT CHARSET=latin1;;
/*!40101 SET character_set_client = @saved_cs_client */;;
--
-- WARNING: old server version. The following dump may be incomplete.
--

/*!50003 SET SESSION SQL_MODE="" */;;
/*!50003 CREATE */ /*!50017 DEFINER=`gsnuser`@`localhost` */ /*!50003 TRIGGER `sequenceplate_bi_trigger` BEFORE INSERT ON `sequenceplate` FOR EACH ROW BEGIN

select
	@start:=length(NEW.dir) - locate("_", reverse(NEW.dir)) + 2,
	@len:=locate('-SEQ',NEW.dir)-@start,
	@plate_id:= if('-SEQ'=right(NEW.dir,4),
          		mid(NEW.dir,@start, @len),
              null) into @start,@len,@plate_id2;

if @plate_id is not null THEN
set NEW.plate_id = @plate_id;
END IF;


END */;;

--
-- WARNING: old server version. The following dump may be incomplete.
--

/*!50003 SET SESSION SQL_MODE="" */;;
/*!50003 CREATE */ /*!50017 DEFINER=`gsnuser`@`localhost` */ /*!50003 TRIGGER `sequenceplate_bu_trigger` BEFORE UPDATE ON `sequenceplate` FOR EACH ROW BEGIN

select
	@start:=length(NEW.dir) - locate("_", reverse(NEW.dir)) + 2,
	@len:=locate('-SEQ',NEW.dir)-@start,
	@plate_id:= if('-SEQ'=right(NEW.dir,4),
          		mid(NEW.dir,@start, @len),
              null) into @start,@len,@plate_id2;


if @plate_id is not null THEN
set NEW.plate_id = @plate_id;
END IF;

END */;;

/*!40101 SET @saved_cs_client     = @@character_set_client */;;
/*!40101 SET character_set_client = utf8 */;;
CREATE TABLE `sequenceplate_qc` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `plate_id` bigint(20) DEFAULT NULL,
  `dir` varchar(45) NOT NULL,
  `hand_qc` int(10) unsigned DEFAULT NULL,
  `hand_qc_pi` varchar(45) DEFAULT NULL,
  `experiment` varchar(45) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `run_purpose` text,
  `notes` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=272 DEFAULT CHARSET=latin1;;
/*!40101 SET character_set_client = @saved_cs_client */;;
SET @saved_cs_client     = @@character_set_client;;
SET character_set_client = utf8;;
/*!50001 CREATE TABLE `sequencex` (
  `id` tinyint NOT NULL,
  `experiment` tinyint NOT NULL,
  `sequenceplate_id` tinyint NOT NULL,
  `sample_id` tinyint NOT NULL,
  `sample_db` tinyint NOT NULL,
  `primerpair_id` tinyint NOT NULL,
  `direction` tinyint NOT NULL,
  `filename` tinyint NOT NULL,
  `well` tinyint NOT NULL,
  `LOR` tinyint NOT NULL,
  `snr` tinyint NOT NULL,
  `score` tinyint NOT NULL,
  `version` tinyint NOT NULL,
  `aligned_allowance` tinyint NOT NULL,
  `aligned_length` tinyint NOT NULL,
  `failed` tinyint NOT NULL,
  `created` tinyint NOT NULL,
  `sequenceprimer_id` tinyint NOT NULL,
  `analysisProtocol` tinyint NOT NULL,
  `derived_sequenceprimer_id` tinyint NOT NULL
) ENGINE=MyISAM */;;
SET character_set_client = @saved_cs_client;;
/*!40101 SET @saved_cs_client     = @@character_set_client */;;
/*!40101 SET character_set_client = utf8 */;;
CREATE TABLE `split_alignment` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `version` bigint(20) NOT NULL,
  `after_aligned_length` int(11) NOT NULL,
  `after_expected_aligned_length` int(11) NOT NULL,
  `before_aligned_length` int(11) NOT NULL,
  `before_expected_aligned_length` int(11) NOT NULL,
  `variation_id` bigint(20) DEFAULT NULL,
  `sequence_id` bigint(20) DEFAULT NULL,
  `rawcall` text,
  `before_het_ratio` decimal(10,9) DEFAULT NULL,
  `before_good_calls` int(10) unsigned DEFAULT NULL,
  `after_het_ratio` decimal(10,9) DEFAULT NULL,
  `after_good_calls` int(10) unsigned DEFAULT NULL,
  `var_call` char(2) DEFAULT NULL,
  `qc` varchar(255) DEFAULT NULL,
  `sperm_qc` varchar(255) DEFAULT NULL,
  `matlab_call` varchar(255) DEFAULT NULL,
  `matlab_conf` float DEFAULT NULL,
  `matlab_qc` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `variation_sequence_unique` (`variation_id`,`sequence_id`),
  KEY `FK7DFE1EFED9D6E74F` (`sequence_id`),
  KEY `FK7DFE1EFEBCCE245` (`variation_id`),
  CONSTRAINT `FK7DFE1EFEBCCE245` FOREIGN KEY (`variation_id`) REFERENCES `variation` (`id`),
  CONSTRAINT `FK7DFE1EFED9D6E74F` FOREIGN KEY (`sequence_id`) REFERENCES `sequence` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=40077582 DEFAULT CHARSET=latin1;;
/*!40101 SET character_set_client = @saved_cs_client */;;
--
-- WARNING: old server version. The following dump may be incomplete.
--

/*!50003 SET SESSION SQL_MODE="" */;;
/*!50003 CREATE */ /*!50017 DEFINER=`gsnuser`@`localhost` */ /*!50003 TRIGGER `split_alignment_bi_trigger` BEFORE INSERT ON `split_alignment` FOR EACH ROW BEGIN

SELECT
  SequenceQC(
  variation.funcType,
  NEW.rawcall,
  NEW.before_aligned_length,
  NEW.after_aligned_length,
  NEW.before_het_ratio,
  NEW.before_good_calls,
  NEW.after_het_ratio,
  NEW.after_good_calls,
  sequence.direction,
  false,
  variation.ref_seq,
  variation.mut_seq),

SequenceQC(
  variation.funcType,
  NEW.rawcall,
  NEW.before_aligned_length,
  NEW.after_aligned_length,
  NEW.before_het_ratio,
  NEW.before_good_calls,
  NEW.after_het_ratio,
  NEW.after_good_calls,
  sequence.direction,
  true,
  variation.ref_seq,
  variation.mut_seq)

INTO
  @qc,
  @sperm_qc

from
sequence, variation
where
sequence.id=NEW.sequence_id
and variation.id=NEW.variation_id
;

set NEW.qc = @qc;
set NEW.sperm_qc = @sperm_qc;



END */;;

--
-- WARNING: old server version. The following dump may be incomplete.
--

/*!50003 SET SESSION SQL_MODE="" */;;
/*!50003 CREATE */ /*!50017 DEFINER=`gsnuser`@`localhost` */ /*!50003 TRIGGER `split_alignment_bu_trigger` BEFORE UPDATE ON `split_alignment` FOR EACH ROW BEGIN

SELECT
SequenceQC(
  variation.funcType,
  NEW.rawcall,
  NEW.before_aligned_length,
  NEW.after_aligned_length,
  NEW.before_het_ratio,
  NEW.before_good_calls,
  NEW.after_het_ratio,
  NEW.after_good_calls,
  sequence.direction,
  false,
  variation.ref_seq,
  variation.mut_seq),

SequenceQC(
  variation.funcType,
  NEW.rawcall,
  NEW.before_aligned_length,
  NEW.after_aligned_length,
  NEW.before_het_ratio,
  NEW.before_good_calls,
  NEW.after_het_ratio,
  NEW.after_good_calls,
  sequence.direction,
  true,
  variation.ref_seq,
  variation.mut_seq)

INTO
  @qc,
  @sperm_qc

from
sequence, variation
where
sequence.id=NEW.sequence_id
and variation.id=NEW.variation_id
;

set NEW.qc = @qc;
set NEW.sperm_qc = @sperm_qc;



END */;;

/*!40101 SET @saved_cs_client     = @@character_set_client */;;
/*!40101 SET character_set_client = utf8 */;;
CREATE TABLE `variation` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `gene_id` bigint(20) DEFAULT NULL,
  `alias1` tinytext,
  `alias2` tinytext,
  `alias3` tinytext,
  `hgVersion` int(11) DEFAULT NULL,
  `physicalChange` tinytext,
  `inheritance` tinytext,
  `difficult_allele` tinyint(1) DEFAULT NULL,
  `bioType` tinytext,
  `mutation_description` text,
  `gene_strand` enum('-','+') DEFAULT NULL,
  `chr` varchar(4) DEFAULT NULL,
  `upstream_base` int(11) DEFAULT NULL,
  `downstream_base` int(11) DEFAULT NULL,
  `ref_snp` varchar(255) DEFAULT NULL,
  `mut_snp` varchar(255) DEFAULT NULL,
  `ref_seq` tinytext,
  `mut_seq` tinytext,
  `rs` varchar(45) DEFAULT NULL,
  `hold` tinyint(1) DEFAULT NULL,
  `reviewer1_name` varchar(45) DEFAULT NULL,
  `reviewer1_conf` char(1) DEFAULT NULL,
  `reviewer1_note` text,
  `reviewer1_paper` tinytext,
  `reviewer2_name` varchar(45) DEFAULT NULL,
  `reviewer2_conf` char(1) DEFAULT NULL,
  `reviewer2_note` text,
  `reviewer2_paper` tinytext,
  `reviewer3_name` varchar(45) DEFAULT NULL,
  `reviewer3_conf` char(1) DEFAULT NULL,
  `reviewer3_note` text,
  `reviewer3_paper` tinytext,
  `prod2Group` char(1) DEFAULT NULL,
  `original_location` tinytext,
  `alternative_loc` varchar(45) DEFAULT NULL,
  `reviewer1_location` varchar(45) DEFAULT NULL,
  `reviewer2_location` varchar(45) DEFAULT NULL,
  `reviewer3_location` varchar(45) DEFAULT NULL,
  `official_location` bigint(20) unsigned DEFAULT NULL,
  `target_id` int(10) unsigned DEFAULT NULL,
  `order_for_pilot` tinyint(1) DEFAULT NULL,
  `size` int(11) DEFAULT NULL,
  `warning` tinytext,
  `hg17_exon` tinytext,
  `hg17_locus` tinytext,
  `notes1` text,
  `notes2` text,
  `other_papers` text,
  `omim_allele` int(10) unsigned DEFAULT NULL,
  `_genename` varchar(45) DEFAULT NULL,
  `avHet` float DEFAULT NULL,
  `qc` tinyint(1) DEFAULT NULL,
  `frequency_class` enum('rare','low','medium','high') DEFAULT NULL,
  `coords_to_spec` tinyint(1) DEFAULT NULL,
  `variation_strand` enum('+','-') DEFAULT NULL,
  `cell_line_validation` tinytext,
  `functype` tinytext,
  PRIMARY KEY (`id`),
  KEY `FK728FC1F3834D194F` (`gene_id`),
  CONSTRAINT `FK728FC1F3834D194F` FOREIGN KEY (`gene_id`) REFERENCES `gene` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2701 DEFAULT CHARSET=latin1;;
/*!40101 SET character_set_client = @saved_cs_client */;;
/*!40101 SET @saved_cs_client     = @@character_set_client */;;
/*!40101 SET character_set_client = utf8 */;;
CREATE TABLE `variation_amptargets` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `variation_id` bigint(20) DEFAULT NULL,
  `ampTarget_id` bigint(20) DEFAULT NULL,
  `rank` int(10) unsigned DEFAULT NULL,
  `passed` tinyint(1) DEFAULT NULL,
  `primer_id` bigint(20) NOT NULL DEFAULT '0',
  `product` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `variation_amptarget_primer` (`variation_id`,`ampTarget_id`,`primer_id`),
  KEY `FKE6413C6ACB792305` (`ampTarget_id`),
  KEY `FKE6413C6ABCCE245` (`variation_id`),
  KEY `FKE6413C6AE0BA970` (`primer_id`),
  CONSTRAINT `FKE6413C6ABCCE245` FOREIGN KEY (`variation_id`) REFERENCES `variation` (`id`),
  CONSTRAINT `FKE6413C6ACB792305` FOREIGN KEY (`ampTarget_id`) REFERENCES `amptarget` (`id`),
  CONSTRAINT `FKE6413C6AE0BA970` FOREIGN KEY (`primer_id`) REFERENCES `primer` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23113 DEFAULT CHARSET=latin1;;
/*!40101 SET character_set_client = @saved_cs_client */;;
/*!40101 SET @saved_cs_client     = @@character_set_client */;;
/*!40101 SET character_set_client = utf8 */;;
CREATE TABLE `variation_set` (
  `variation_id` bigint(20) NOT NULL,
  `set` varchar(255) NOT NULL,
  KEY `variation_set_variation_id` (`variation_id`),
  CONSTRAINT `variation_set_variation_id` FOREIGN KEY (`variation_id`) REFERENCES `variation` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;;
/*!40101 SET character_set_client = @saved_cs_client */;;
/*!40101 SET @saved_cs_client     = @@character_set_client */;;
/*!40101 SET character_set_client = utf8 */;;
CREATE TABLE `variations_for_annotation` (
  `annotation.variation_id` bigint(20) DEFAULT NULL,
  `annotation.reviewer_name` binary(0) DEFAULT NULL,
  `annotation.status` binary(0) DEFAULT NULL,
  `annotation.notes_variation` binary(0) DEFAULT NULL,
  `annotation.papers_variation` binary(0) DEFAULT NULL,
  `annotation.disease_name` varchar(255) DEFAULT NULL,
  `annotation.gene_symbol` varchar(45) DEFAULT NULL,
  `annotation.alt_symbols` varchar(45) DEFAULT NULL,
  `ignore.gene_start` int(11) DEFAULT NULL,
  `ignore.gene_end` int(11) DEFAULT NULL,
  `ignore.gene_link` binary(0) DEFAULT NULL,
  `annotation.gene_strand` enum('+','-') DEFAULT NULL,
  `annotation.omim_id` bigint(20) unsigned DEFAULT NULL,
  `ignore.omim_link` binary(0) DEFAULT NULL,
  `annotation.omim_allele` int(10) unsigned DEFAULT NULL,
  `annotation.inheritance` tinytext,
  `annotation.chr` varchar(5) DEFAULT NULL,
  `annotation.alias1` tinytext,
  `annotation.alias2` tinytext,
  `annotation.alias3` tinytext,
  `annotation.mutation_description` text,
  `annotation.hgVersion` int(11) DEFAULT NULL,
  `annotation.variation_strand` enum('+','-') DEFAULT NULL,
  `annotation.upstream_base` int(11) DEFAULT NULL,
  `annotation.downstream_base` int(11) DEFAULT NULL,
  `annotation.ref_seq` tinytext,
  `annotation.mut_seq` tinytext,
  `annotation.funcType` tinytext,
  `annotation.physicalChange` tinytext,
  `annotation.biotype` tinytext
) ENGINE=InnoDB DEFAULT CHARSET=latin1;;
/*!40101 SET character_set_client = @saved_cs_client */;;
/*!40101 SET @saved_cs_client     = @@character_set_client */;;
/*!40101 SET character_set_client = utf8 */;;
CREATE TABLE `variations_for_primer_dev` (
  `id` bigint(20) DEFAULT NULL,
  `upstream_base` int(11) DEFAULT NULL,
  `downstream_base` int(11) DEFAULT NULL,
  `mut_seq` tinytext,
  `chromosome` varchar(4) DEFAULT NULL,
  `hg_version` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;;
/*!40101 SET character_set_client = @saved_cs_client */;;
/*!40101 SET @saved_cs_client     = @@character_set_client */;;
/*!40101 SET character_set_client = utf8 */;;
CREATE TABLE `variationtruth` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `variation_id` int(10) unsigned NOT NULL,
  `truth` enum('RR','RM','MM') NOT NULL,
  `subject_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `Variation_Subject_IDX` (`variation_id`,`subject_id`)
) ENGINE=InnoDB AUTO_INCREMENT=168 DEFAULT CHARSET=latin1;;
/*!40101 SET character_set_client = @saved_cs_client */;;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;;
/*!50003 SET character_set_client  = utf8 */ ;;
/*!50003 SET character_set_results = utf8 */ ;;
/*!50003 SET collation_connection  = utf8_general_ci */ ;;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;;
/*!50003 SET sql_mode              = '' */ ;;

CREATE DEFINER=`gsnuser`@`localhost` FUNCTION `SequenceQC`(
	funcType tinytext,
	rawcall char(2),
	before_aligned_length int(11),
	after_aligned_length int(11),
	 before_het_ratio decimal(10,9),
	before_good_calls int(10),
	after_het_ratio decimal(10,9) ,
	after_good_calls int(10),
	direction enum('F','R'),
  isSperm boolean,
  ref_seq tinytext,
  mut_seq tinytext
  ) RETURNS char(255) CHARSET latin1
    DETERMINISTIC
BEGIN
	declare NUM_MIN_ROWS int(10);
	declare NUM_MIN_ROWS_DOWNSTREAM int(10);
	declare NUM_MIN_ROWS_UPSTREAM int(10);
	declare MAX_HET_RATE decimal(10,9);
  declare MIN_HET_WINDOW int(10);

	-- OPTIONS
	set NUM_MIN_ROWS =150;
	set NUM_MIN_ROWS_UPSTREAM =20;
	set NUM_MIN_ROWS_DOWNSTREAM =20;
	set MAX_HET_RATE =0.200314159;
  set MIN_HET_WINDOW=20;
	-- END OPTIONS

  IF (ref_seq is null || length(ref_seq)=0 || mut_seq is null || length(mut_seq)=0) THEN
    return 'missing ref_seq or mut_seq';
  END IF;

  CASE

  WHEN (funcType='substitution') THEN
  		IF rawcall = 'XX' THEN return 'no valid call at snp position'; END IF;
  		-- IF length(ref_seq) != 3 THEN return 'Currently only SNP substitutions are supported'; END IF;
  		IF before_het_ratio >=  MAX_HET_RATE THEN return ' before_het_ratio  >=  MAX_HET_RATE'; END IF;
  		IF after_het_ratio  >=  MAX_HET_RATE THEN return 'after_het_ratio  >=  MAX_HET_RATE'; END IF;
  		IF before_aligned_length + after_aligned_length  < NUM_MIN_ROWS  THEN return 'before and after aligned lengths < NUM_MIN_ROWS'; END IF;
  		IF before_aligned_length  < NUM_MIN_ROWS_UPSTREAM THEN return 'before_aligned length < NUM_MIN_ROWS_UPSTREAM '; END IF;
  		IF after_aligned_length < NUM_MIN_ROWS_DOWNSTREAM THEN return 'after_aligned_length < NUM_MIN_ROWS_DOWNSTREAM '; END IF;

	WHEN (funcType='indel'||funcType='largedeletion') THEN
    IF not isSperm THEN
        IF before_good_calls < MIN_HET_WINDOW THEN return 'Too few good before calls to calculate het ratio'; END IF;
        IF after_good_calls < MIN_HET_WINDOW THEN return 'Too few good after calls to calculate het ratio'; END IF;
        IF direction = 'F' THEN
    	    IF before_het_ratio >= MAX_HET_RATE THEN return 'before_het_ratio  >=  MAX_HET_RATE'; END IF;
  			IF before_aligned_length  < NUM_MIN_ROWS_UPSTREAM THEN return 'before_aligned length < NUM_MIN_ROWS_UPSTREAM '; END IF;
  		ELSE
            IF after_het_ratio >=  MAX_HET_RATE THEN return 'after_het_ratio  >=  MAX_HET_RATE'; END IF;
  			IF after_aligned_length < NUM_MIN_ROWS_DOWNSTREAM THEN return 'after_aligned_length < NUM_MIN_ROWS_DOWNSTREAM '; END IF;
  		END IF;

  		-- Now check if RR or MM then you should never see before/after het_ratio
  		IF (rawcall='RR' || rawcall='MM') THEN
    	    IF before_het_ratio >= MAX_HET_RATE THEN return 'before_het_ratio  >=  MAX_HET_RATE'; END IF;
            IF after_het_ratio >=  MAX_HET_RATE THEN return 'after_het_ratio  >=  MAX_HET_RATE'; END IF;
  		END IF;

    ELSE
       -- isSperm
        IF before_het_ratio >=  MAX_HET_RATE THEN return 'before_het_ratio  >=  MAX_HET_RATE'; END IF;
  	    IF after_het_ratio >=  MAX_HET_RATE THEN return 'after_het_ratio  >=  MAX_HET_RATE'; END IF;
  		IF before_aligned_length  < NUM_MIN_ROWS_UPSTREAM THEN return 'before_aligned length < NUM_MIN_ROWS_UPSTREAM '; END IF;
  		IF after_aligned_length < NUM_MIN_ROWS_DOWNSTREAM THEN return 'after_aligned_length < NUM_MIN_ROWS_DOWNSTREAM '; END IF;
    	-- IF before_aligned_length + after_aligned_length  < NUM_MIN_ROWS  THEN return 'before and after aligned lengths < NUM_MIN_ROWS'; END IF;
    END IF;

  ELSE
    return 'invalid functype; only substitutions, indels/largedeletions currently supported.';
	END CASE;

  return '';

END ;;

/*!50003 SET sql_mode              = @saved_sql_mode */ ;;
/*!50003 SET character_set_client  = @saved_cs_client */ ;;
/*!50003 SET character_set_results = @saved_cs_results */ ;;
/*!50003 SET collation_connection  = @saved_col_connection */ ;;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;;
/*!50003 SET character_set_client  = utf8 */ ;;
/*!50003 SET character_set_results = utf8 */ ;;
/*!50003 SET collation_connection  = utf8_general_ci */ ;;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;;
/*!50003 SET sql_mode              = '' */ ;;

CREATE DEFINER=`gsnuser`@`localhost` PROCEDURE `Recalc_Sequence_QC`()
BEGIN

update split_alignment, sequence, variation
set split_alignment.qc =
SequenceQC(
  variation.funcType,
  split_alignment.rawcall,
  split_alignment.before_aligned_length,
  split_alignment.after_aligned_length,
  split_alignment.before_het_ratio,
  split_alignment.before_good_calls,
  split_alignment.after_het_ratio,
  split_alignment.after_good_calls,
  sequence.direction,
  false,
  variation.ref_seq,
  variation.mut_seq),

split_alignment.sperm_qc =
SequenceQC(
  variation.funcType,
  split_alignment.rawcall,
  split_alignment.before_aligned_length,
  split_alignment.after_aligned_length,
  split_alignment.before_het_ratio,
  split_alignment.before_good_calls,
  split_alignment.after_het_ratio,
  split_alignment.after_good_calls,
  sequence.direction,
  true,
  variation.ref_seq,
  variation.mut_seq)

where sequence.id=split_alignment.sequence_id
and variation.id=split_alignment.variation_id
;

END ;;

/*!50003 SET sql_mode              = @saved_sql_mode */ ;;
/*!50003 SET character_set_client  = @saved_cs_client */ ;;
/*!50003 SET character_set_results = @saved_cs_results */ ;;
/*!50003 SET collation_connection  = @saved_col_connection */ ;;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;;
/*!50003 SET character_set_client  = utf8 */ ;;
/*!50003 SET character_set_results = utf8 */ ;;
/*!50003 SET collation_connection  = utf8_general_ci */ ;;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;;
/*!50003 SET sql_mode              = '' */ ;;

CREATE DEFINER=`root`@`localhost` PROCEDURE `update_variation_amptargets`()
BEGIN

insert ignore into variation_amptargets
(variation_id,amptarget_id,`rank`)
select v.id,at.id,0 from variation v
join amptarget at on
((v.chr=at.chr) and
(v.upstream_base > at.start+60) and (v.upstream_base < at.end-60) and
(v.downstream_base > at.start+60) and (v.downstream_base < at.end-60));

END ;;

/*!50003 SET sql_mode              = @saved_sql_mode */ ;;
/*!50003 SET character_set_client  = @saved_cs_client */ ;;
/*!50003 SET character_set_results = @saved_cs_results */ ;;
/*!50003 SET collation_connection  = @saved_col_connection */ ;;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;;
/*!50003 SET character_set_client  = utf8 */ ;;
/*!50003 SET character_set_results = utf8 */ ;;
/*!50003 SET collation_connection  = utf8_general_ci */ ;;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;;
/*!50003 SET sql_mode              = '' */ ;;

CREATE DEFINER=`labadmin`@`%` PROCEDURE `update_var_from_annot_consensus`()
BEGIN
       UPDATE variation v, annotation a
SET 
	v.alias1 = a.alias1,
	v.alias2 = a.alias2,
	v.alias3 = a.alias3,
	v.omim_allele = a.omim_allele,
	v.mutation_description = a.mutation_description,
	v.funcType = a.funcType,
	v.physicalchange = a.physicalchange,
	v.bioType = a.bioType,
	v.upstream_base = a.upstream_base,
	v.downstream_base = a.downstream_base,
	v.ref_seq = a.ref_seq,
	v.mut_seq = a.mut_seq,
	v.variation_strand = a.variation_strand,
	v.hgVersion = a.hgVersion,
	v.chr = a.chr,
	v.frequency_class = a.frequency_class,
	v.inheritance = a.inheritance
       WHERE a.variation_id = v.id
       AND a.reviewer_name = 'consensus'
       AND a.status = 'confirmed';
END ;;

USE `prodlims`;;
/*!50001 DROP TABLE IF EXISTS `_contactinfolatestterritory`*/;;
/*!50001 SET @saved_cs_client          = @@character_set_client */;;
/*!50001 SET @saved_cs_results         = @@character_set_results */;;
/*!50001 SET @saved_col_connection     = @@collation_connection */;;
/*!50001 SET character_set_client      = utf8 */;;
/*!50001 SET character_set_results     = utf8 */;;
/*!50001 SET collation_connection      = utf8_general_ci */;;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`gsnuser`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `_contactinfolatestterritory` AS select `ct`.`contactinfo_id` AS `contactinfo_id`,`t`.`territory_id` AS `territory_id` from ((`contactinfo_organizationterritory` `ct` join `organizationterritory` `t` on((`ct`.`organizationterritories_id` = `t`.`id`))) join `_contactinfoterritorymaxvalidfrom` `m` on((`m`.`contactinfo_id` = `ct`.`contactinfo_id`))) where (`m`.`maxvalidfrom` = `t`.`validfrom`) */;;
/*!50001 SET character_set_client      = @saved_cs_client */;;
/*!50001 SET character_set_results     = @saved_cs_results */;;
/*!50001 SET collation_connection      = @saved_col_connection */;;
/*!50001 DROP TABLE IF EXISTS `_contactinfoterritorymaxvalidfrom`*/;;
/*!50001 SET @saved_cs_client          = @@character_set_client */;;
/*!50001 SET @saved_cs_results         = @@character_set_results */;;
/*!50001 SET @saved_col_connection     = @@collation_connection */;;
/*!50001 SET character_set_client      = utf8 */;;
/*!50001 SET character_set_results     = utf8 */;;
/*!50001 SET collation_connection      = utf8_general_ci */;;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`gsnuser`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `_contactinfoterritorymaxvalidfrom` AS select `ct`.`contactinfo_id` AS `contactinfo_id`,max(if((`t`.`validfrom` <= now()),`t`.`validfrom`,NULL)) AS `maxvalidfrom` from (`contactinfo_organizationterritory` `ct` join `organizationterritory` `t` on((`ct`.`organizationterritories_id` = `t`.`id`))) group by `ct`.`contactinfo_id` */;;
/*!50001 SET character_set_client      = @saved_cs_client */;;
/*!50001 SET character_set_results     = @saved_cs_results */;;
/*!50001 SET collation_connection      = @saved_col_connection */;;
/*!50001 DROP TABLE IF EXISTS `_contactlog`*/;;
/*!50001 SET @saved_cs_client          = @@character_set_client */;;
/*!50001 SET @saved_cs_results         = @@character_set_results */;;
/*!50001 SET @saved_col_connection     = @@collation_connection */;;
/*!50001 SET character_set_client      = latin1 */;;
/*!50001 SET character_set_results     = latin1 */;;
/*!50001 SET collation_connection      = latin1_swedish_ci */;;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`gsnuser`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `_contactlog` AS select `cn`.`CaseFile_id` AS `casefile_id`,`n`.`body` AS `body`,`u`.`email` AS `email`,`n`.`created` AS `created` from ((`casefile_note` `cn` left join `note` `n` on((`n`.`id` = `cn`.`notes_id`))) left join `user` `u` on((`u`.`id` = `n`.`user_id`))) where (`n`.`subject` like '%contact%log%') */;;
/*!50001 SET character_set_client      = @saved_cs_client */;;
/*!50001 SET character_set_results     = @saved_cs_results */;;
/*!50001 SET collation_connection      = @saved_col_connection */;;
/*!50001 DROP TABLE IF EXISTS `_npt_reportsummary_sub1`*/;;
/*!50001 SET @saved_cs_client          = @@character_set_client */;;
/*!50001 SET @saved_cs_results         = @@character_set_results */;;
/*!50001 SET @saved_col_connection     = @@collation_connection */;;
/*!50001 SET character_set_client      = latin1 */;;
/*!50001 SET character_set_results     = latin1 */;;
/*!50001 SET collation_connection      = latin1_swedish_ci */;;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`statsadmin`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `_npt_reportsummary_sub1` AS select `pk`.`id` AS `kit_id`,`cf`.`id` AS `case_id`,min(`rpt`.`id`) AS `min_rpt_id`,max(`rpt`.`id`) AS `max_rpt_id`,`pk`.`received` AS `kit_received`,`pk`.`barcode` AS `kit_barcode`,min(`rsr`.`senton`) AS `delivered_date`,`pf`.`maternal_weight` AS `maternal_weight`,`rsr`.`sentby` AS `sentby` from (((((`npt_report` `rpt` join `cncreportshipmentrecord` `rsr` on(((`rsr`.`npt_report_id` = `rpt`.`id`) and (`rsr`.`published` is true)))) join `casefile_cncreportshipmentrecord` `cf_rsr` on((`cf_rsr`.`cncreportshipmentrecords_id` = `rsr`.`id`))) join `casefile` `cf` on((`cf`.`id` = `cf_rsr`.`CaseFile_id`))) join `parentkit` `pk` on((`pk`.`id` = `rpt`.`parentkit_id`))) join `paternity_fields` `pf` on((`pf`.`id` = `cf`.`paternity_fields_id`))) group by `pk`.`id` */;;
/*!50001 SET character_set_client      = @saved_cs_client */;;
/*!50001 SET character_set_results     = @saved_cs_results */;;
/*!50001 SET collation_connection      = @saved_col_connection */;;
/*!50001 DROP TABLE IF EXISTS `_orglatestorgpricingplan`*/;;
/*!50001 SET @saved_cs_client          = @@character_set_client */;;
/*!50001 SET @saved_cs_results         = @@character_set_results */;;
/*!50001 SET @saved_col_connection     = @@collation_connection */;;
/*!50001 SET character_set_client      = utf8 */;;
/*!50001 SET character_set_results     = utf8 */;;
/*!50001 SET collation_connection      = utf8_general_ci */;;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`gsnuser`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `_orglatestorgpricingplan` AS select `o`.`id` AS `org_id`,`opp`.`id` AS `opp_id`,`pp`.`testtype` AS `testtype`,`pp`.`name` AS `name`,`opp`.`validfrom` AS `validfrom`,`opp`.`billtotype` AS `billtotype` from ((((`organization` `o` join `organization_organizationpricingplan` `oopp` on((`oopp`.`Organization_id` = `o`.`id`))) join `organizationpricingplan` `opp` on((`opp`.`id` = `oopp`.`organizationpricingplans_id`))) join `pricingplan` `pp` on((`pp`.`id` = `opp`.`pricingplan_id`))) join `_orgppmaxvalidfrom` `omvf` on(((`omvf`.`org_id` = `o`.`id`) and (`pp`.`testtype` = `omvf`.`testtype`) and (`omvf`.`maxvalidfrom` = `opp`.`validfrom`)))) */;;
/*!50001 SET character_set_client      = @saved_cs_client */;;
/*!50001 SET character_set_results     = @saved_cs_results */;;
/*!50001 SET collation_connection      = @saved_col_connection */;;
/*!50001 DROP TABLE IF EXISTS `_orglatestterritory`*/;;
/*!50001 SET @saved_cs_client          = @@character_set_client */;;
/*!50001 SET @saved_cs_results         = @@character_set_results */;;
/*!50001 SET @saved_col_connection     = @@collation_connection */;;
/*!50001 SET character_set_client      = utf8 */;;
/*!50001 SET character_set_results     = utf8 */;;
/*!50001 SET collation_connection      = utf8_general_ci */;;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`gsnuser`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `_orglatestterritory` AS select `ot`.`Organization_id` AS `org_id`,`t`.`territory_id` AS `territory_id` from ((`organization_organizationterritory` `ot` join `organizationterritory` `t` on((`ot`.`organizationterritories_id` = `t`.`id`))) join `_orgterritorymaxvalidfrom` `m` on((`m`.`org_id` = `ot`.`Organization_id`))) where (`m`.`maxvalidfrom` = `t`.`validfrom`) */;;
/*!50001 SET character_set_client      = @saved_cs_client */;;
/*!50001 SET character_set_results     = @saved_cs_results */;;
/*!50001 SET collation_connection      = @saved_col_connection */;;
/*!50001 DROP TABLE IF EXISTS `_orgppmaxvalidfrom`*/;;
/*!50001 SET @saved_cs_client          = @@character_set_client */;;
/*!50001 SET @saved_cs_results         = @@character_set_results */;;
/*!50001 SET @saved_col_connection     = @@collation_connection */;;
/*!50001 SET character_set_client      = utf8 */;;
/*!50001 SET character_set_results     = utf8 */;;
/*!50001 SET collation_connection      = utf8_general_ci */;;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`gsnuser`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `_orgppmaxvalidfrom` AS select `o`.`id` AS `org_id`,`pp`.`testtype` AS `testtype`,max(if((`opp`.`validfrom` <= now()),`opp`.`validfrom`,NULL)) AS `maxvalidfrom` from (((`organization` `o` join `organization_organizationpricingplan` `oopp` on((`oopp`.`Organization_id` = `o`.`id`))) join `organizationpricingplan` `opp` on((`opp`.`id` = `oopp`.`organizationpricingplans_id`))) join `pricingplan` `pp` on((`pp`.`id` = `opp`.`pricingplan_id`))) group by `o`.`id`,`pp`.`testtype` */;;
/*!50001 SET character_set_client      = @saved_cs_client */;;
/*!50001 SET character_set_results     = @saved_cs_results */;;
/*!50001 SET collation_connection      = @saved_col_connection */;;
/*!50001 DROP TABLE IF EXISTS `_orgterritorymaxvalidfrom`*/;;
/*!50001 SET @saved_cs_client          = @@character_set_client */;;
/*!50001 SET @saved_cs_results         = @@character_set_results */;;
/*!50001 SET @saved_col_connection     = @@collation_connection */;;
/*!50001 SET character_set_client      = utf8 */;;
/*!50001 SET character_set_results     = utf8 */;;
/*!50001 SET collation_connection      = utf8_general_ci */;;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`gsnuser`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `_orgterritorymaxvalidfrom` AS select `ot`.`Organization_id` AS `org_id`,max(if((`t`.`validfrom` <= now()),`t`.`validfrom`,NULL)) AS `maxvalidfrom` from (`organization_organizationterritory` `ot` join `organizationterritory` `t` on((`ot`.`organizationterritories_id` = `t`.`id`))) group by `ot`.`Organization_id` */;;
/*!50001 SET character_set_client      = @saved_cs_client */;;
/*!50001 SET character_set_results     = @saved_cs_results */;;
/*!50001 SET collation_connection      = @saved_col_connection */;;
/*!50001 DROP TABLE IF EXISTS `_sequencingsample_qc_statistics`*/;;
/*!50001 SET @saved_cs_client          = @@character_set_client */;;
/*!50001 SET @saved_cs_results         = @@character_set_results */;;
/*!50001 SET @saved_col_connection     = @@collation_connection */;;
/*!50001 SET character_set_client      = utf8 */;;
/*!50001 SET character_set_results     = utf8 */;;
/*!50001 SET collation_connection      = utf8_general_ci */;;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`gsnuser`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `_sequencingsample_qc_statistics` AS select `hts`.`sequencingsample`.`id` AS `sequencingsample_id`,`prodlims`.`qc_statistics`.`id` AS `id`,`prodlims`.`qc_statistics`.`value` AS `value`,`prodlims`.`qc_statistics`.`result_id` AS `result_id`,`prodlims`.`qc_statistics`.`type_id` AS `type_id`,`prodlims`.`qc_statistics_type`.`name` AS `name`,`prodlims`.`qc_statistics_type`.`description` AS `description`,`prodlims`.`qc_statistics_type`.`applicability` AS `applicability` from (((`hts`.`sequencingsample` join `prodlims`.`qc_statistics_sequencingsample` on((`prodlims`.`qc_statistics_sequencingsample`.`sequencingsample_id` = `hts`.`sequencingsample`.`id`))) join `prodlims`.`qc_statistics` on((`prodlims`.`qc_statistics_sequencingsample`.`statistics_id` = `prodlims`.`qc_statistics`.`id`))) join `prodlims`.`qc_statistics_type` on((`prodlims`.`qc_statistics`.`type_id` = `prodlims`.`qc_statistics_type`.`id`))) */;;
/*!50001 SET character_set_client      = @saved_cs_client */;;
/*!50001 SET character_set_results     = @saved_cs_results */;;
/*!50001 SET collation_connection      = @saved_col_connection */;;
/*!50001 DROP TABLE IF EXISTS `_territorydirectormaxvalidfrom`*/;;
/*!50001 SET @saved_cs_client          = @@character_set_client */;;
/*!50001 SET @saved_cs_results         = @@character_set_results */;;
/*!50001 SET @saved_col_connection     = @@collation_connection */;;
/*!50001 SET character_set_client      = utf8 */;;
/*!50001 SET character_set_results     = utf8 */;;
/*!50001 SET collation_connection      = utf8_general_ci */;;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`gsnuser`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `_territorydirectormaxvalidfrom` AS select `td`.`Territory_id` AS `terr_id`,max(if((`t`.`validfrom` <= now()),`t`.`validfrom`,NULL)) AS `maxvalidfrom` from (`territory_territorydirector` `td` join `territorydirector` `t` on((`td`.`territorydirectors_id` = `t`.`id`))) group by `td`.`Territory_id` */;;
/*!50001 SET character_set_client      = @saved_cs_client */;;
/*!50001 SET character_set_results     = @saved_cs_results */;;
/*!50001 SET collation_connection      = @saved_col_connection */;;
/*!50001 DROP TABLE IF EXISTS `_territorylatestdirector`*/;;
/*!50001 SET @saved_cs_client          = @@character_set_client */;;
/*!50001 SET @saved_cs_results         = @@character_set_results */;;
/*!50001 SET @saved_col_connection     = @@collation_connection */;;
/*!50001 SET character_set_client      = utf8 */;;
/*!50001 SET character_set_results     = utf8 */;;
/*!50001 SET collation_connection      = utf8_general_ci */;;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`gsnuser`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `_territorylatestdirector` AS select `td`.`Territory_id` AS `terr_id`,`t`.`director_id` AS `director_id` from ((`territory_territorydirector` `td` join `territorydirector` `t` on((`td`.`territorydirectors_id` = `t`.`id`))) join `_territorydirectormaxvalidfrom` `m` on((`m`.`terr_id` = `td`.`Territory_id`))) where (`m`.`maxvalidfrom` = `t`.`validfrom`) */;;
/*!50001 SET character_set_client      = @saved_cs_client */;;
/*!50001 SET character_set_results     = @saved_cs_results */;;
/*!50001 SET collation_connection      = @saved_col_connection */;;
/*!50001 DROP TABLE IF EXISTS `allreport_paternity`*/;;
/*!50001 SET @saved_cs_client          = @@character_set_client */;;
/*!50001 SET @saved_cs_results         = @@character_set_results */;;
/*!50001 SET @saved_col_connection     = @@collation_connection */;;
/*!50001 SET character_set_client      = utf8 */;;
/*!50001 SET character_set_results     = utf8 */;;
/*!50001 SET collation_connection      = utf8_general_ci */;;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `allreport_paternity` AS select `o`.`name` AS `clinic_name`,`cf`.`id` AS `casefile_id`,`pr`.`report_id` AS `report_id`,`s`.`barcode` AS `sample_id`,coalesce(str_to_date(`prm`.`sample_received`,'%m/%d/%Y'),`s`.`received`) AS `mother_sample_received`,coalesce(str_to_date(`prm`.`sample_collected`,'%m/%d/%Y'),`s`.`collectiondate`) AS `mother_sample_collected`,coalesce(str_to_date(`prm`.`redraw_sample_received`,'%m/%d/%Y'),`redraw`.`received`) AS `mother_redraw_sample_received`,coalesce(str_to_date(`prm`.`redraw_sample_collected`,'%m/%d/%Y'),`redraw`.`collectiondate`) AS `mother_redraw_sample_collected`,coalesce(str_to_date(`prf`.`sample_received`,'%m/%d/%Y'),`af`.`received`) AS `af_sample_received`,coalesce(str_to_date(`prf`.`sample_collected`,'%m/%d/%Y'),`af`.`collectiondate`) AS `af_sample_collected`,coalesce(str_to_date(`prf`.`redraw_sample_received`,'%m/%d/%Y'),`af_redraw`.`received`) AS `af_redraw_sample_received`,coalesce(str_to_date(`prf`.`redraw_sample_collected`,'%m/%d/%Y'),`af_redraw`.`collectiondate`) AS `af_redraw_sample_collected`,`prf`.`sample_id` AS `af_sample_id`,ifnull(`prc`.`override_call`,`prc`.`algorithm_call`) AS `reported_call`,`prc`.`algorithm_call` AS `algorithm_call`,ifnull(`prc`.`override_plot`,`prc`.`report_plot`) AS `reported_plot`,`prc`.`report_plot` AS `algorithm_plot`,`prchan`.`p_value` AS `p_value`,`prff_none`.`value` AS `fetal_fraction_context_none`,`prff_af`.`value` AS `fetal_fraction_context_af`,`prc`.`drop_out_rate` AS `drop_out_rate`,`pk`.`gestationalage` AS `gestationalage`,`prm`.`race` AS `mother_race`,`prf`.`race` AS `alleged_father_race`,`rsr`.`senton` AS `report_senton`,`rsr`.`published` AS `published`,`rsr`.`amended` AS `amended` from (((((((((((((((`paternity_report` `pr` join `paternity_report_subject` `prf` on((`pr`.`alleged_father_id` = `prf`.`id`))) join `paternity_report_subject` `prm` on((`pr`.`mother_id` = `prm`.`id`))) join `paternity_report_subject` `prc` on((`prc`.`report_id` = `pr`.`id`))) left join (`paternity_report_result` `prr` join `paternity_report_channel` `prchan` on((`prchan`.`result_id` = `prr`.`id`))) on(((`prr`.`child_id` = `prc`.`id`) and (`prchan`.`plot` = ifnull(`prc`.`override_plot`,`prc`.`report_plot`))))) join `paternity_report_fetal_fraction` `prff_af` on(((`prff_af`.`child_id` = `prc`.`id`) and (`prff_af`.`context` = 'ALLEGED_FATHER')))) join `paternity_report_fetal_fraction` `prff_none` on(((`prff_none`.`child_id` = `prc`.`id`) and (`prff_none`.`context` = 'NONE')))) join `cncreportshipmentrecord` `rsr` on((`rsr`.`paternity_report_id` = `pr`.`id`))) join `casefile` `cf` on((`pr`.`casefile_id` = `cf`.`id`))) join `organization` `o` on((`cf`.`clinic_id` = `o`.`id`))) join `sample` `s` on((`s`.`barcode` = `prm`.`sample_id`))) left join `sample` `redraw` on((`redraw`.`barcode` = `prm`.`redraw_sample_id`))) join `sample` `af` on((`af`.`barcode` = `prf`.`sample_id`))) left join `sample` `af_redraw` on((`af_redraw`.`barcode` = `prf`.`redraw_sample_id`))) join `parentkit_sample` `pks` on((`pks`.`sample_id` = `s`.`id`))) join `parentkit` `pk` on((`pk`.`id` = `pks`.`parentkit_id`))) */;;
/*!50001 SET character_set_client      = @saved_cs_client */;;
/*!50001 SET character_set_results     = @saved_cs_results */;;
/*!50001 SET collation_connection      = @saved_col_connection */;;
/*!50001 DROP TABLE IF EXISTS `arraysummary`*/;;
/*!50001 SET @saved_cs_client          = @@character_set_client */;;
/*!50001 SET @saved_cs_results         = @@character_set_results */;;
/*!50001 SET @saved_col_connection     = @@collation_connection */;;
/*!50001 SET character_set_client      = utf8 */;;
/*!50001 SET character_set_results     = utf8 */;;
/*!50001 SET collation_connection      = utf8_general_ci */;;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `arraysummary` AS select `arraysummaryforparentsamples`.`Case id` AS `Case id`,`arraysummaryforparentsamples`.`Product` AS `Product`,`arraysummaryforparentsamples`.`Array id` AS `Array id`,`arraysummaryforparentsamples`.`Chip type` AS `Chip type`,`arraysummaryforparentsamples`.`Date consumed` AS `Date consumed`,`arraysummaryforparentsamples`.`billable` AS `billable`,`arraysummaryforparentsamples`.`non-billable` AS `non-billable`,`arraysummaryforparentsamples`.`Sample barcode` AS `Sample barcode`,`arraysummaryforparentsamples`.`Sample type` AS `Sample type`,`arraysummaryforparentsamples`.`MSA1 barcode` AS `MSA1 barcode` from `arraysummaryforparentsamples` union select `arraysummaryforblastkits`.`Case id` AS `Case id`,`arraysummaryforblastkits`.`Product` AS `Product`,`arraysummaryforblastkits`.`Array id` AS `Array id`,`arraysummaryforblastkits`.`Chip type` AS `Chip type`,`arraysummaryforblastkits`.`Date consumed` AS `Date consumed`,`arraysummaryforblastkits`.`billable` AS `billable`,`arraysummaryforblastkits`.`non-billable` AS `non-billable`,`arraysummaryforblastkits`.`Sample barcode` AS `Sample barcode`,`arraysummaryforblastkits`.`Sample type` AS `Sample type`,`arraysummaryforblastkits`.`MSA1 barcode` AS `MSA1 barcode` from `arraysummaryforblastkits` union select `arraysummaryforspermsamples`.`Case id` AS `Case id`,`arraysummaryforspermsamples`.`Product` AS `Product`,`arraysummaryforspermsamples`.`Array id` AS `Array id`,`arraysummaryforspermsamples`.`Chip type` AS `Chip type`,`arraysummaryforspermsamples`.`Date consumed` AS `Date consumed`,`arraysummaryforspermsamples`.`billable` AS `billable`,`arraysummaryforspermsamples`.`non-billable` AS `non-billable`,`arraysummaryforspermsamples`.`Sample barcode` AS `Sample barcode`,`arraysummaryforspermsamples`.`Sample type` AS `Sample type`,`arraysummaryforspermsamples`.`MSA1 barcode` AS `MSA1 barcode` from `arraysummaryforspermsamples` union select `arraysummaryforcontrolsamples`.`Case id` AS `Case id`,`arraysummaryforcontrolsamples`.`Product` AS `Product`,`arraysummaryforcontrolsamples`.`Array id` AS `Array id`,`arraysummaryforcontrolsamples`.`Chip type` AS `Chip type`,`arraysummaryforcontrolsamples`.`Date consumed` AS `Date consumed`,`arraysummaryforcontrolsamples`.`billable` AS `billable`,`arraysummaryforcontrolsamples`.`non-billable` AS `non-billable`,`arraysummaryforcontrolsamples`.`Sample barcode` AS `Sample barcode`,`arraysummaryforcontrolsamples`.`Sample type` AS `Sample type`,`arraysummaryforcontrolsamples`.`MSA1 barcode` AS `MSA1 barcode` from `arraysummaryforcontrolsamples` union select `arraysummaryforresearchsamples`.`Case id` AS `Case id`,`arraysummaryforresearchsamples`.`Product` AS `Product`,`arraysummaryforresearchsamples`.`Array id` AS `Array id`,`arraysummaryforresearchsamples`.`Chip type` AS `Chip type`,`arraysummaryforresearchsamples`.`Date consumed` AS `Date consumed`,`arraysummaryforresearchsamples`.`billable` AS `billable`,`arraysummaryforresearchsamples`.`non-billable` AS `non-billable`,`arraysummaryforresearchsamples`.`Sample barcode` AS `Sample barcode`,`arraysummaryforresearchsamples`.`Sample type` AS `Sample type`,`arraysummaryforresearchsamples`.`MSA1 barcode` AS `MSA1 barcode` from `arraysummaryforresearchsamples` */;;
/*!50001 SET character_set_client      = @saved_cs_client */;;
/*!50001 SET character_set_results     = @saved_cs_results */;;
/*!50001 SET collation_connection      = @saved_col_connection */;;
/*!50001 DROP TABLE IF EXISTS `arraysummaryforblastkits`*/;;
/*!50001 SET @saved_cs_client          = @@character_set_client */;;
/*!50001 SET @saved_cs_results         = @@character_set_results */;;
/*!50001 SET @saved_col_connection     = @@collation_connection */;;
/*!50001 SET character_set_client      = utf8 */;;
/*!50001 SET character_set_results     = utf8 */;;
/*!50001 SET collation_connection      = utf8_general_ci */;;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `arraysummaryforblastkits` AS select `c`.`id` AS `Case id`,`c`.`testtype` AS `Product`,concat(`chip`.`barcode`,'_P',cast(`ia`.`idx` as char charset latin1)) AS `Array id`,`chip`.`illuminaarraytype` AS `Chip type`,`chip`.`received` AS `Date consumed`,if((sum((case `cg`.`categorygroup_id` when 3 then 1 else 0 end)) > 0),'yes','') AS `billable`,if((sum((case `cg`.`categorygroup_id` when 4 then 1 else 0 end)) > 0),'yes','') AS `non-billable`,`s`.`barcode` AS `Sample barcode`,`s`.`DTYPE` AS `Sample type`,`amp`.`barcode` AS `MSA1 barcode`,`t`.`name` AS `Territory Name` from ((((`illuminaarray` `ia` join `inventorieditem` `chip`) join `amp2plate` `amp`) join (((((`sample` `s` join `blastomereplate_sample` `b` on((`b`.`samplelist_id` = `s`.`id`))) join `blastomereplate` `bp` on((`bp`.`id` = `b`.`blastomereplates_id`))) join `casefile` `c` on((`bp`.`casefile_id` = `c`.`id`))) left join `casefile_category` `cc` on((`cc`.`CaseFile_id` = `c`.`id`))) left join `categorygroup_category` `cg` on((`cg`.`category_id` = `cc`.`categories_id`)))) left join `territory` `t` on((`t`.`id` = `c`.`historicterritory_id`))) where ((`ia`.`illuminaChip_id` = `chip`.`id`) and (`chip`.`amp2plate_id` = `amp`.`id`) and (`ia`.`sample_id` = `s`.`id`) and (`s`.`DTYPE` <> 'DummySample')) group by `ia`.`id` order by `chip`.`received` desc,`c`.`id` */;;
/*!50001 SET character_set_client      = @saved_cs_client */;;
/*!50001 SET character_set_results     = @saved_cs_results */;;
/*!50001 SET collation_connection      = @saved_col_connection */;;
/*!50001 DROP TABLE IF EXISTS `arraysummaryforcontrolsamples`*/;;
/*!50001 SET @saved_cs_client          = @@character_set_client */;;
/*!50001 SET @saved_cs_results         = @@character_set_results */;;
/*!50001 SET @saved_col_connection     = @@collation_connection */;;
/*!50001 SET character_set_client      = utf8 */;;
/*!50001 SET character_set_results     = utf8 */;;
/*!50001 SET collation_connection      = utf8_general_ci */;;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `arraysummaryforcontrolsamples` AS select NULL AS `Case id`,NULL AS `Product`,concat(`chip`.`barcode`,'_P',cast(`ia`.`idx` as char charset latin1)) AS `Array id`,`chip`.`illuminaarraytype` AS `Chip type`,`chip`.`received` AS `Date consumed`,'yes' AS `billable`,'' AS `non-billable`,`s`.`barcode` AS `Sample barcode`,`s`.`DTYPE` AS `Sample type`,`amp`.`barcode` AS `MSA1 barcode`,NULL AS `Territory Name` from (((`illuminaarray` `ia` join `inventorieditem` `chip`) join `amp2plate` `amp`) join `sample` `s`) where ((`ia`.`illuminaChip_id` = `chip`.`id`) and (`chip`.`amp2plate_id` = `amp`.`id`) and (`ia`.`sample_id` = `s`.`id`) and (`s`.`DTYPE` = 'ControlSample')) group by `ia`.`id` order by `chip`.`received` desc */;;
/*!50001 SET character_set_client      = @saved_cs_client */;;
/*!50001 SET character_set_results     = @saved_cs_results */;;
/*!50001 SET collation_connection      = @saved_col_connection */;;
/*!50001 DROP TABLE IF EXISTS `arraysummaryforparentsamples`*/;;
/*!50001 SET @saved_cs_client          = @@character_set_client */;;
/*!50001 SET @saved_cs_results         = @@character_set_results */;;
/*!50001 SET @saved_col_connection     = @@collation_connection */;;
/*!50001 SET character_set_client      = utf8 */;;
/*!50001 SET character_set_results     = utf8 */;;
/*!50001 SET collation_connection      = utf8_general_ci */;;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `arraysummaryforparentsamples` AS select `c`.`id` AS `Case id`,`c`.`testtype` AS `Product`,concat(`chip`.`barcode`,'_P',cast(`ia`.`idx` as char charset latin1)) AS `Array id`,`chip`.`illuminaarraytype` AS `Chip type`,`chip`.`received` AS `Date consumed`,if((sum((case `cg`.`categorygroup_id` when 3 then 1 else 0 end)) > 0),'yes','') AS `billable`,if((sum((case `cg`.`categorygroup_id` when 4 then 1 else 0 end)) > 0),'yes','') AS `non-billable`,`s`.`barcode` AS `Sample barcode`,`s`.`DTYPE` AS `Sample type`,`amp`.`barcode` AS `MSA1 barcode`,`t`.`name` AS `Territory Name` from ((((`illuminaarray` `ia` join `inventorieditem` `chip`) join `amp2plate` `amp`) join ((((((((((`sample` `s` left join `sample_preparation` `sp1` on((`sp1`.`prep_id` = `s`.`id`))) left join `sample` `s1` on((`s1`.`id` = `sp1`.`source_id`))) left join `sample_preparation` `sp2` on((`sp2`.`prep_id` = `s1`.`id`))) left join `sample` `s2` on((`s2`.`id` = `sp2`.`source_id`))) join `subject` `sub` on((coalesce(`s`.`subject_id`,`s1`.`subject_id`,`s2`.`subject_id`) = `sub`.`id`))) join `family_subject` `fs` on((`fs`.`members_id` = `sub`.`id`))) join `family` `f` on((`fs`.`families_id` = `f`.`id`))) join `casefile` `c` on((`c`.`family_id` = `f`.`id`))) left join `casefile_category` `cc` on((`cc`.`CaseFile_id` = `c`.`id`))) left join `categorygroup_category` `cg` on((`cg`.`category_id` = `cc`.`categories_id`)))) left join `territory` `t` on((`t`.`id` = `c`.`historicterritory_id`))) where ((`ia`.`illuminaChip_id` = `chip`.`id`) and (`chip`.`amp2plate_id` = `amp`.`id`) and (`ia`.`sample_id` = `s`.`id`) and (`s`.`DTYPE` <> 'DummySample')) group by `ia`.`id` having (`c`.`id` = min(`c`.`id`)) order by `chip`.`received` desc,`c`.`id` */;;
/*!50001 SET character_set_client      = @saved_cs_client */;;
/*!50001 SET character_set_results     = @saved_cs_results */;;
/*!50001 SET collation_connection      = @saved_col_connection */;;
/*!50001 DROP TABLE IF EXISTS `arraysummaryforresearchsamples`*/;;
/*!50001 SET @saved_cs_client          = @@character_set_client */;;
/*!50001 SET @saved_cs_results         = @@character_set_results */;;
/*!50001 SET @saved_col_connection     = @@collation_connection */;;
/*!50001 SET character_set_client      = utf8 */;;
/*!50001 SET character_set_results     = utf8 */;;
/*!50001 SET collation_connection      = utf8_general_ci */;;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `arraysummaryforresearchsamples` AS select NULL AS `Case id`,NULL AS `Product`,concat(`chip`.`barcode`,'_P',cast(`ia`.`idx` as char charset latin1)) AS `Array id`,`chip`.`illuminaarraytype` AS `Chip type`,`chip`.`received` AS `Date consumed`,'' AS `billable`,'yes' AS `non-billable`,`s`.`barcode` AS `Sample barcode`,`s`.`DTYPE` AS `Sample type`,`amp`.`barcode` AS `MSA1 barcode`,NULL AS `Territory Name` from (((`illuminaarray` `ia` join `inventorieditem` `chip`) join `sample` `s`) join `amp2plate` `amp`) where ((`ia`.`illuminaChip_id` = `chip`.`id`) and (`chip`.`amp2plate_id` = `amp`.`id`) and (`ia`.`sample_id` = `s`.`id`) and (`s`.`DTYPE` = 'ResearchSample')) group by `ia`.`id` order by `chip`.`received` desc */;;
/*!50001 SET character_set_client      = @saved_cs_client */;;
/*!50001 SET character_set_results     = @saved_cs_results */;;
/*!50001 SET collation_connection      = @saved_col_connection */;;
/*!50001 DROP TABLE IF EXISTS `arraysummaryforspermsamples`*/;;
/*!50001 SET @saved_cs_client          = @@character_set_client */;;
/*!50001 SET @saved_cs_results         = @@character_set_results */;;
/*!50001 SET @saved_col_connection     = @@collation_connection */;;
/*!50001 SET character_set_client      = utf8 */;;
/*!50001 SET character_set_results     = utf8 */;;
/*!50001 SET collation_connection      = utf8_general_ci */;;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `arraysummaryforspermsamples` AS select `c`.`id` AS `Case id`,`c`.`testtype` AS `Product`,concat(`chip`.`barcode`,'_P',cast(`ia`.`idx` as char charset latin1)) AS `Array id`,`chip`.`illuminaarraytype` AS `Chip type`,`chip`.`received` AS `Date consumed`,if((sum((case `cg`.`categorygroup_id` when 3 then 1 else 0 end)) > 0),'yes','') AS `billable`,if((sum((case `cg`.`categorygroup_id` when 4 then 1 else 0 end)) > 0),'yes','') AS `non-billable`,`s`.`barcode` AS `Sample barcode`,`s`.`DTYPE` AS `Sample type`,`amp`.`barcode` AS `MSA1 barcode`,`t`.`name` AS `Territory Name` from ((((`illuminaarray` `ia` join `inventorieditem` `chip`) join `amp2plate` `amp`) join ((((((((`sample` `s` join `aliquot` `a` on((`s`.`aliquot_id` = `a`.`id`))) join `sample` `ss` on((`a`.`semensample_id` = `ss`.`id`))) join `subject` `sub` on((`ss`.`subject_id` = `sub`.`id`))) join `family_subject` `fs` on((`fs`.`members_id` = `sub`.`id`))) join `family` `f` on((`fs`.`families_id` = `f`.`id`))) join `casefile` `c` on((`c`.`family_id` = `f`.`id`))) left join `casefile_category` `cc` on((`cc`.`CaseFile_id` = `c`.`id`))) left join `categorygroup_category` `cg` on((`cg`.`category_id` = `cc`.`categories_id`)))) left join `territory` `t` on((`t`.`id` = `c`.`historicterritory_id`))) where ((`ia`.`illuminaChip_id` = `chip`.`id`) and (`chip`.`amp2plate_id` = `amp`.`id`) and (`ia`.`sample_id` = `s`.`id`) and (`s`.`DTYPE` = 'SpermSample')) group by `ia`.`id` having (`c`.`id` = min(`c`.`id`)) order by `chip`.`received` desc,`c`.`id` */;;
/*!50001 SET character_set_client      = @saved_cs_client */;;
/*!50001 SET character_set_results     = @saved_cs_results */;;
/*!50001 SET collation_connection      = @saved_col_connection */;;
/*!50001 DROP TABLE IF EXISTS `blastomereplaterun`*/;;
/*!50001 SET @saved_cs_client          = @@character_set_client */;;
/*!50001 SET @saved_cs_results         = @@character_set_results */;;
/*!50001 SET @saved_col_connection     = @@collation_connection */;;
/*!50001 SET character_set_client      = utf8 */;;
/*!50001 SET character_set_results     = utf8 */;;
/*!50001 SET collation_connection      = utf8_general_ci */;;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`gsnuser`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `blastomereplaterun` AS select `bp`.`barcode` AS `barcode`,`bp`.`gestationalage` AS `gestationalage`,min(`sr`.`run_date`) AS `run_date`,sum(`sr`.`run_status`) AS `run_status`,`c`.`id` AS `casefile_id`,`o`.`name` AS `clinic_name` from (((((`blastomereplate` `bp` join `casefile` `c` on((`bp`.`casefile_id` = `c`.`id`))) join `organization` `o` on((`o`.`id` = `c`.`clinic_id`))) join `blastomereplate_sample` `bs` on((`bs`.`blastomereplates_id` = `bp`.`id`))) join `sample` `s` on((`s`.`id` = `bs`.`samplelist_id`))) left join `samplerun` `sr` on((`sr`.`barcode` = `s`.`barcode`))) group by `bp`.`barcode` */;;
/*!50001 SET character_set_client      = @saved_cs_client */;;
/*!50001 SET character_set_results     = @saved_cs_results */;;
/*!50001 SET collation_connection      = @saved_col_connection */;;
/*!50001 DROP TABLE IF EXISTS `casecategorysummary`*/;;
/*!50001 SET @saved_cs_client          = @@character_set_client */;;
/*!50001 SET @saved_cs_results         = @@character_set_results */;;
/*!50001 SET @saved_col_connection     = @@collation_connection */;;
/*!50001 SET character_set_client      = utf8 */;;
/*!50001 SET character_set_results     = utf8 */;;
/*!50001 SET collation_connection      = utf8_general_ci */;;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`gsnuser`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `casecategorysummary` AS select `c`.`id` AS `id`,`o`.`name` AS `clinic`,`c`.`opened` AS `referred`,date_format(`c`.`opened`,_utf8'%Y-%m') AS `referred month`,`c`.`expectedretrievaldate` AS `ER`,date_format(`c`.`expectedretrievaldate`,_utf8'%Y-%m') AS `ER month`,`ct`.`name` AS `category`,`ct`.`id` AS `category_id` from (((`casefile` `c` join `casefile_category` `cc`) join `category` `ct`) join `organization` `o`) where ((`cc`.`CaseFile_id` = `c`.`id`) and (`cc`.`categories_id` = `ct`.`id`) and (`c`.`clinic_id` = `o`.`id`)) */;;
/*!50001 SET character_set_client      = @saved_cs_client */;;
/*!50001 SET character_set_results     = @saved_cs_results */;;
/*!50001 SET collation_connection      = @saved_col_connection */;;
/*!50001 DROP TABLE IF EXISTS `casefile_territory`*/;;
/*!50001 SET @saved_cs_client          = @@character_set_client */;;
/*!50001 SET @saved_cs_results         = @@character_set_results */;;
/*!50001 SET @saved_col_connection     = @@collation_connection */;;
/*!50001 SET character_set_client      = utf8 */;;
/*!50001 SET character_set_results     = utf8 */;;
/*!50001 SET collation_connection      = utf8_general_ci */;;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `casefile_territory` AS select `cf`.`id` AS `casefile_id`,coalesce(`slt`.`territory_id`,`olt`.`territory_id`) AS `territory_id`,if(isnull(`slt`.`territory_id`),0,1) AS `satellite_override` from ((`casefile` `cf` join `_orglatestterritory` `olt` on((`olt`.`org_id` = `cf`.`clinic_id`))) left join `_contactinfolatestterritory` `slt` on((`slt`.`contactinfo_id` = `cf`.`satelliteaddress_id`))) */;;
/*!50001 SET character_set_client      = @saved_cs_client */;;
/*!50001 SET character_set_results     = @saved_cs_results */;;
/*!50001 SET collation_connection      = @saved_col_connection */;;
/*!50001 DROP TABLE IF EXISTS `clinicinforeport`*/;;
/*!50001 SET @saved_cs_client          = @@character_set_client */;;
/*!50001 SET @saved_cs_results         = @@character_set_results */;;
/*!50001 SET @saved_col_connection     = @@collation_connection */;;
/*!50001 SET character_set_client      = utf8 */;;
/*!50001 SET character_set_results     = utf8 */;;
/*!50001 SET collation_connection      = utf8_general_ci */;;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`gsnuser`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `clinicinforeport` AS select `o`.`id` AS `id`,`o`.`name` AS `name`,`c`.`street1` AS `street1`,`c`.`street2` AS `street2`,`c`.`city` AS `city`,`c`.`state` AS `state`,`c`.`postcode` AS `postcode`,`c`.`country` AS `country`,`c`.`phonenumber` AS `phonenumber`,`c`.`emergencycontactinformationnotes` AS `emergencycontactinformationnotes`,`t`.`id` AS `territory id`,`t`.`name` AS `territory name`,`u`.`id` AS `director cfs id`,`u`.`email` AS `director cfs email` from (((((`organization` `o` left join `_orglatestterritory` `ot` on((`ot`.`org_id` = `o`.`id`))) left join `territory` `t` on((`ot`.`territory_id` = `t`.`id`))) left join `_territorylatestdirector` `td` on((`td`.`terr_id` = `t`.`id`))) left join `user` `u` on((`u`.`id` = `td`.`director_id`))) left join `contactinfo` `c` on((`o`.`address_id` = `c`.`id`))) */;;
/*!50001 SET character_set_client      = @saved_cs_client */;;
/*!50001 SET character_set_results     = @saved_cs_results */;;
/*!50001 SET collation_connection      = @saved_col_connection */;;
/*!50001 DROP TABLE IF EXISTS `csfraxplatesummary`*/;;
/*!50001 SET @saved_cs_client          = @@character_set_client */;;
/*!50001 SET @saved_cs_results         = @@character_set_results */;;
/*!50001 SET @saved_col_connection     = @@collation_connection */;;
/*!50001 SET character_set_client      = utf8 */;;
/*!50001 SET character_set_results     = utf8 */;;
/*!50001 SET collation_connection      = utf8_general_ci */;;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `csfraxplatesummary` AS select `fp`.`DTYPE` AS `Plate Type`,`fp`.`barcode` AS `Plate Barcode`,`fps`.`position` AS `Plate Position`,`fp`.`experimentdate` AS `Plate Use Date`,`smp`.`barcode` AS `Sample Barcode`,`rt`.`barcode` AS `Root Sample Barcode`,`st`.`displayname` AS `Root Sample Type`,`c`.`id` AS `Casefile`,`c`.`testtype` AS `Test Type`,`rt`.`received` AS `Root Sample Receive Date`,`fs`.`familyPosition` AS `Family Position`,`t`.`name` AS `Territory Name` from (((((((((`frax_plate` `fp` left join `frax_plate_sample` `fps` on((`fps`.`frax_plate_id` = `fp`.`id`))) left join `sample` `smp` on((`fps`.`wells_id` = `smp`.`id`))) left join `sample_rootsample` `srs` on((`smp`.`id` = `srs`.`id`))) left join `sample` `rt` on((`rt`.`id` = `srs`.`rootsample_id`))) left join `sampletype` `st` on((`rt`.`sampletype_id` = `st`.`id`))) left join `family_subject` `fs` on((`fs`.`members_id` = `rt`.`subject_id`))) left join `family` `f` on((`fs`.`families_id` = `f`.`id`))) left join `casefile` `c` on((`c`.`family_id` = `f`.`id`))) left join `territory` `t` on((`t`.`id` = `c`.`historicterritory_id`))) group by `fp`.`id`,`fps`.`wells_id` */;;
/*!50001 SET character_set_client      = @saved_cs_client */;;
/*!50001 SET character_set_results     = @saved_cs_results */;;
/*!50001 SET collation_connection      = @saved_col_connection */;;
/*!50001 DROP TABLE IF EXISTS `cspcrplatesummary`*/;;
/*!50001 SET @saved_cs_client          = @@character_set_client */;;
/*!50001 SET @saved_cs_results         = @@character_set_results */;;
/*!50001 SET @saved_col_connection     = @@collation_connection */;;
/*!50001 SET character_set_client      = utf8 */;;
/*!50001 SET character_set_results     = utf8 */;;
/*!50001 SET collation_connection      = utf8_general_ci */;;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `cspcrplatesummary` AS select `cp`.`barcode` AS `Plate Barcode`,`pt`.`version` AS `Plate Type`,`smp`.`barcode` AS `Sample Barcode`,`c`.`id` AS `Casefile`,`c`.`testtype` AS `Test Type`,`rt`.`barcode` AS `Root Sample Barcode`,`st`.`displayname` AS `Root Sample Type`,`rt`.`received` AS `Date Received`,min(if((`ii`.`type` = 'TAQ_2X'),`ii`.`received`,NULL)) AS `Earliest TAQ 2X Date`,min(if((`ii`.`type` = 'EXOSAP'),`ii`.`received`,NULL)) AS `Earliest EXOSAP Date`,`t`.`name` AS `Territory Name` from (((((((((((((`cs_plate` `cp` left join `cs_platetemplate` `pt` on((`pt`.`id` = `cp`.`platetemplate_id`))) left join `cs_plate_csreaction` `cspcsr` on(((`cspcsr`.`cs_plate_id` = `cp`.`id`) and (`cspcsr`.`position` = 0)))) left join `csreaction` on((`cspcsr`.`wells_id` = `csreaction`.`id`))) left join `sample` `smp` on((`csreaction`.`sample_id` = `smp`.`id`))) left join `sample_rootsample` `srs` on((`smp`.`id` = `srs`.`id`))) left join `sample` `rt` on((`rt`.`id` = `srs`.`rootsample_id`))) left join `sampletype` `st` on((`rt`.`sampletype_id` = `st`.`id`))) left join `parentkit_sample` `ps` on((`ps`.`sample_id` = `rt`.`id`))) left join `parentkit` `pk` on((`pk`.`id` = `ps`.`parentkit_id`))) left join `casefile` `c` on((`c`.`id` = `pk`.`casefile_id`))) left join `territory` `t` on((`t`.`id` = `c`.`historicterritory_id`))) left join `cs_plate_inventorieditem` `cpi` on((`cpi`.`cs_plate_id` = `cp`.`id`))) left join `inventorieditem` `ii` on((`ii`.`id` = `cpi`.`reagents_id`))) where (`cp`.`DTYPE` = 'CSPcrPlate') group by `cp`.`barcode`,`smp`.`barcode` */;;
/*!50001 SET character_set_client      = @saved_cs_client */;;
/*!50001 SET character_set_results     = @saved_cs_results */;;
/*!50001 SET collation_connection      = @saved_col_connection */;;
/*!50001 DROP TABLE IF EXISTS `csseqplatesummary`*/;;
/*!50001 SET @saved_cs_client          = @@character_set_client */;;
/*!50001 SET @saved_cs_results         = @@character_set_results */;;
/*!50001 SET @saved_col_connection     = @@collation_connection */;;
/*!50001 SET character_set_client      = utf8 */;;
/*!50001 SET character_set_results     = utf8 */;;
/*!50001 SET collation_connection      = utf8_general_ci */;;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `csseqplatesummary` AS select `cp`.`barcode` AS `Plate Barcode`,`smp`.`barcode` AS `Sample Barcode`,`c`.`id` AS `Casefile`,`c`.`testtype` AS `Test Type`,`rt`.`barcode` AS `Root Sample Barcode`,`st`.`displayname` AS `Root Sample Type`,`rt`.`received` AS `Date Received`,min(if((`ii`.`type` = 'BDT'),`ii`.`received`,NULL)) AS `Earliest BDT Date`,min(if((`ii`.`type` = 'CLEANSEQ'),`ii`.`received`,NULL)) AS `Earliest CLEANSEQ Date`,`t`.`name` AS `Territory Name` from ((((((((((((`cs_plate` `cp` left join `cs_plate_csreaction` `cspcsr` on(((`cspcsr`.`cs_plate_id` = `cp`.`id`) and (`cspcsr`.`position` = 0)))) left join `csreaction` on((`cspcsr`.`wells_id` = `csreaction`.`id`))) left join `sample` `smp` on((`csreaction`.`sample_id` = `smp`.`id`))) left join `sample_rootsample` `srs` on((`smp`.`id` = `srs`.`id`))) left join `sample` `rt` on((`rt`.`id` = `srs`.`rootsample_id`))) left join `sampletype` `st` on((`rt`.`sampletype_id` = `st`.`id`))) left join `parentkit_sample` `ps` on((`ps`.`sample_id` = `rt`.`id`))) left join `parentkit` `pk` on((`pk`.`id` = `ps`.`parentkit_id`))) left join `casefile` `c` on((`c`.`id` = `pk`.`casefile_id`))) left join `territory` `t` on((`t`.`id` = `c`.`historicterritory_id`))) left join `cs_plate_inventorieditem` `cpi` on((`cpi`.`cs_plate_id` = `cp`.`id`))) left join `inventorieditem` `ii` on((`ii`.`id` = `cpi`.`reagents_id`))) where (`cp`.`DTYPE` = 'CSSeqPlate') group by `cp`.`barcode`,`smp`.`barcode` */;;
/*!50001 SET character_set_client      = @saved_cs_client */;;
/*!50001 SET character_set_results     = @saved_cs_results */;;
/*!50001 SET collation_connection      = @saved_col_connection */;;
/*!50001 DROP TABLE IF EXISTS `current_month_scale`*/;;
/*!50001 SET @saved_cs_client          = @@character_set_client */;;
/*!50001 SET @saved_cs_results         = @@character_set_results */;;
/*!50001 SET @saved_col_connection     = @@collation_connection */;;
/*!50001 SET character_set_client      = utf8 */;;
/*!50001 SET character_set_results     = utf8 */;;
/*!50001 SET collation_connection      = utf8_general_ci */;;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`gsnuser`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `current_month_scale` AS select curdate() AS `current_date()`,(dayofmonth(last_day(curdate())) / dayofmonth(curdate())) AS `scale` */;;
/*!50001 SET character_set_client      = @saved_cs_client */;;
/*!50001 SET character_set_results     = @saved_cs_results */;;
/*!50001 SET collation_connection      = @saved_col_connection */;;
/*!50001 DROP TABLE IF EXISTS `hs_tracking`*/;;
/*!50001 SET @saved_cs_client          = @@character_set_client */;;
/*!50001 SET @saved_cs_results         = @@character_set_results */;;
/*!50001 SET @saved_col_connection     = @@collation_connection */;;
/*!50001 SET character_set_client      = utf8 */;;
/*!50001 SET character_set_results     = utf8 */;;
/*!50001 SET collation_connection      = utf8_general_ci */;;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `hs_tracking` AS select `ss`.`run_id` AS `run_id`,`ss`.`intendeddepthofread` AS `intendeddepthofread`,`sr`.`rundate` AS `rundate`,`sr`.`phixsamplebarcode` AS `phixsamplebarcode`,`sr`.`truSeqSRClusterKitBarcode` AS `truSeqSRClusterKitBarcode`,`sr`.`truSeqSBSKitBarcode` AS `truSeqSBSKitBarcode`,`nptp`.`barcode` AS `NPT_barcode`,`nptp`.`concentration` AS `concentration`,group_concat(distinct if((`qc`.`type_id` = 3),substring_index(substring_index(`qc`.`message`,'cluster density',-(1)),'clusters/mm',1),NULL) separator ',') AS `Clus_Den`,group_concat(distinct if((`qc`.`type_id` = 2),substring_index(substring_index(`qc`.`message`,'Cluster pass-filter rate ',-(1)),'%',1),NULL) separator ',') AS `PF` from ((((((`hts`.`sequencingrun` `sr` join `hts`.`sequencingsample` `ss` on((`sr`.`id` = `ss`.`run_id`))) join `prodlims`.`qc_result_sequencingsample` `qcss` on((`ss`.`id` = `qcss`.`sequencingsamples_id`))) join `prodlims`.`qc_result` `qc` on((`qcss`.`qualitycontrolresults_id` = `qc`.`id`))) join `prodlims`.`qc_type` `qct` on((`qc`.`type_id` = `qct`.`id`))) join `hts`.`sequencingrun_samplepool` `srs` on(((`sr`.`id` = `srs`.`sequencingrun_id`) and (`ss`.`lane` = `srs`.`lane`)))) join `prodlims`.`npt_plate` `nptp` on((`srs`.`npt_plate_id` = `nptp`.`id`))) where (`qc`.`type_id` in (2,3)) group by 1 */;;
/*!50001 SET character_set_client      = @saved_cs_client */;;
/*!50001 SET character_set_results     = @saved_cs_results */;;
/*!50001 SET collation_connection      = @saved_col_connection */;;
/*!50001 DROP TABLE IF EXISTS `insuranceoverridecases`*/;;
/*!50001 SET @saved_cs_client          = @@character_set_client */;;
/*!50001 SET @saved_cs_results         = @@character_set_results */;;
/*!50001 SET @saved_col_connection     = @@collation_connection */;;
/*!50001 SET character_set_client      = latin1 */;;
/*!50001 SET character_set_results     = latin1 */;;
/*!50001 SET collation_connection      = latin1_swedish_ci */;;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`gsnuser`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `insuranceoverridecases` AS select `cf`.`id` AS `Case`,`sub`.`firstname` AS `First Name`,`sub`.`lastname` AS `Last Name`,`ci`.`street1` AS `Address Line 1`,`ci`.`street2` AS `Address Line 2`,`ci`.`city` AS `City`,`ci`.`state` AS `State`,`ci`.`postcode` AS `Zip Code`,`ci`.`phonenumber` AS `Phone Number`,`ci`.`email` AS `Email`,`o`.`name` AS `Referring Clinic`,concat(`p`.`lastname`,', ',`p`.`firstname`) AS `Physician Name`,`p`.`npinumber` AS `Physician NPI Number`,`cf`.`testtype` AS `Test Type`,cast(min(`bp`.`biopsydate`) as date) AS `Blastomere Collection Date`,if(isnull(`cc_no_icd9`.`CaseFile_id`),'','yes') AS `No ICD9`,if(isnull(`cc_free_special_billing`.`CaseFile_id`),'','yes') AS `Free Special Billing`,if(`cf`.`insuranceclaimed`,'yes','') AS `Insurance Claimed`,if(`cf`.`paymentprocessed`,'yes','') AS `Payment Processed`,cast(`cf`.`closed` as date) AS `Closed`,`closingreason`.`name` AS `Closing Reason`,`cf`.`closingnotes` AS `Closing Notes` from (((((((((((`casefile` `cf` join `family_subject` `fs` on((`fs`.`families_id` = `cf`.`family_id`))) join `subject` `sub` on((`sub`.`id` = `fs`.`members_id`))) join `subject_contactinfo` `sci` on((`sci`.`Subject_id` = `sub`.`id`))) join `contactinfo` `ci` on((`ci`.`id` = `sci`.`addresses_id`))) left join `organization` `o` on((`o`.`id` = `cf`.`clinic_id`))) left join `provider` `p` on((`p`.`id` = `cf`.`physician_id`))) left join `casefile_category` `cc` on((`cc`.`CaseFile_id` = `cf`.`id`))) left join `casefile_category` `cc_no_icd9` on(((`cc_no_icd9`.`CaseFile_id` = `cf`.`id`) and (`cc_no_icd9`.`categories_id` = 124)))) left join `casefile_category` `cc_free_special_billing` on(((`cc_free_special_billing`.`CaseFile_id` = `cf`.`id`) and (`cc_free_special_billing`.`categories_id` = 125)))) left join `reasoncode` `closingreason` on((`closingreason`.`id` = `cf`.`closingreason_id`))) left join `blastomereplate` `bp` on((`bp`.`casefile_id` = `cf`.`id`))) where ((`fs`.`familyPosition` = 'patient') and (`sci`.`addresses_KEY` = 'DEFAULT') and (`cc`.`categories_id` = 194)) group by `cf`.`id` */;;
/*!50001 SET character_set_client      = @saved_cs_client */;;
/*!50001 SET character_set_results     = @saved_cs_results */;;
/*!50001 SET collation_connection      = @saved_col_connection */;;
/*!50001 DROP TABLE IF EXISTS `karyotypesummary`*/;;
/*!50001 SET @saved_cs_client          = @@character_set_client */;;
/*!50001 SET @saved_cs_results         = @@character_set_results */;;
/*!50001 SET @saved_col_connection     = @@collation_connection */;;
/*!50001 SET character_set_client      = utf8 */;;
/*!50001 SET character_set_results     = utf8 */;;
/*!50001 SET collation_connection      = utf8_general_ci */;;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`gsnuser`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `karyotypesummary` AS select `casefile`.`id` AS `casefile`,`family_subject`.`familyPosition` AS `familyPosition`,`sample`.`id` AS `sample_id`,`sample`.`barcode` AS `samplebarcode`,`sample`.`dnabarcode` AS `samplednabarcode`,`subject`.`id` AS `subject_id`,`karyotype`.`ploidyType` AS `isnormal`,`karyotype`.`notes` AS `notes`,`karyotype`.`source` AS `source`,`karyotype`.`sexchromosomestring` AS `sexchromosomestring`,if(isnull(`karyotype`.`id`),NULL,if(isnull(`chr1`.`chromosomecount`),2,`chr1`.`chromosomecount`)) AS `chr1_copynumber`,if(isnull(`karyotype`.`id`),NULL,if(isnull(`chr2`.`chromosomecount`),2,`chr2`.`chromosomecount`)) AS `chr2_copynumber`,if(isnull(`karyotype`.`id`),NULL,if(isnull(`chr13`.`chromosomecount`),2,`chr13`.`chromosomecount`)) AS `chr13_copynumber`,if(isnull(`karyotype`.`id`),NULL,if(isnull(`chr18`.`chromosomecount`),2,`chr18`.`chromosomecount`)) AS `chr18_copynumber`,if(isnull(`karyotype`.`id`),NULL,if(isnull(`chr21`.`chromosomecount`),2,`chr21`.`chromosomecount`)) AS `chr21_copynumber`,`chr1`.`notes` AS `chr1_notes`,`chr2`.`notes` AS `chr2_notes`,`chr13`.`notes` AS `chr13_notes`,`chr18`.`notes` AS `chr18_notes`,`chr21`.`notes` AS `chr21_notes` from (((((((((`karyotype` join `subject` on((`subject`.`karyotype_id` = `karyotype`.`id`))) join `family_subject` on((`subject`.`id` = `family_subject`.`members_id`))) join `casefile` on((`casefile`.`family_id` = `family_subject`.`families_id`))) join `sample` on((`sample`.`subject_id` = `subject`.`id`))) left join `karyotypeentry` `chr1` on(((`karyotype`.`id` = `chr1`.`entries_id`) and (`chr1`.`chromosome` = 1)))) left join `karyotypeentry` `chr2` on(((`karyotype`.`id` = `chr2`.`entries_id`) and (`chr2`.`chromosome` = 2)))) left join `karyotypeentry` `chr13` on(((`karyotype`.`id` = `chr13`.`entries_id`) and (`chr13`.`chromosome` = 13)))) left join `karyotypeentry` `chr18` on(((`karyotype`.`id` = `chr18`.`entries_id`) and (`chr18`.`chromosome` = 18)))) left join `karyotypeentry` `chr21` on(((`karyotype`.`id` = `chr21`.`entries_id`) and (`chr21`.`chromosome` = 21)))) */;;
/*!50001 SET character_set_client      = @saved_cs_client */;;
/*!50001 SET character_set_results     = @saved_cs_results */;;
/*!50001 SET collation_connection      = @saved_col_connection */;;
/*!50001 DROP TABLE IF EXISTS `karyotypesummary_persubject`*/;;
/*!50001 SET @saved_cs_client          = @@character_set_client */;;
/*!50001 SET @saved_cs_results         = @@character_set_results */;;
/*!50001 SET @saved_col_connection     = @@collation_connection */;;
/*!50001 SET character_set_client      = utf8 */;;
/*!50001 SET character_set_results     = utf8 */;;
/*!50001 SET collation_connection      = utf8_general_ci */;;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`gsnuser`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `karyotypesummary_persubject` AS select cast(group_concat(distinct `karyotypesummary`.`casefile` separator ', ') as char charset latin1) AS `casefiles`,cast(group_concat(distinct `karyotypesummary`.`samplebarcode` separator ', ') as char charset latin1) AS `samplebarcodes`,cast(group_concat(distinct `karyotypesummary`.`samplednabarcode` separator ', ') as char charset latin1) AS `samplednabarcodes`,`karyotypesummary`.`subject_id` AS `subject_id`,`karyotypesummary`.`isnormal` AS `isnormal`,`karyotypesummary`.`notes` AS `notes`,`karyotypesummary`.`source` AS `source`,`karyotypesummary`.`sexchromosomestring` AS `sexchromosomestring`,`karyotypesummary`.`chr1_copynumber` AS `chr1_copynumber`,`karyotypesummary`.`chr2_copynumber` AS `chr2_copynumber`,`karyotypesummary`.`chr13_copynumber` AS `chr13_copynumber`,`karyotypesummary`.`chr18_copynumber` AS `chr18_copynumber`,`karyotypesummary`.`chr21_copynumber` AS `chr21_copynumber`,`karyotypesummary`.`chr1_notes` AS `chr1_notes`,`karyotypesummary`.`chr2_notes` AS `chr2_notes`,`karyotypesummary`.`chr13_notes` AS `chr13_notes`,`karyotypesummary`.`chr18_notes` AS `chr18_notes`,`karyotypesummary`.`chr21_notes` AS `chr21_notes` from `karyotypesummary` group by `karyotypesummary`.`subject_id` */;;
/*!50001 SET character_set_client      = @saved_cs_client */;;
/*!50001 SET character_set_results     = @saved_cs_results */;;
/*!50001 SET collation_connection      = @saved_col_connection */;;
/*!50001 DROP TABLE IF EXISTS `kitsreceived`*/;;
/*!50001 SET @saved_cs_client          = @@character_set_client */;;
/*!50001 SET @saved_cs_results         = @@character_set_results */;;
/*!50001 SET @saved_col_connection     = @@collation_connection */;;
/*!50001 SET character_set_client      = utf8 */;;
/*!50001 SET character_set_results     = utf8 */;;
/*!50001 SET collation_connection      = utf8_general_ci */;;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`gsnuser`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `kitsreceived` AS select `k`.`casefile_id` AS `casefile_id`,`k`.`barcode` AS `barcode`,1 AS `is_parentkit`,`k`.`received` AS `received` from `parentkit` `k` union select `bp`.`casefile_id` AS `casefile_id`,`bp`.`barcode` AS `barcode`,0 AS `is_parentkit`,`bp`.`received` AS `received` from `blastomereplate` `bp` */;;
/*!50001 SET character_set_client      = @saved_cs_client */;;
/*!50001 SET character_set_results     = @saved_cs_results */;;
/*!50001 SET collation_connection      = @saved_col_connection */;;
/*!50001 DROP TABLE IF EXISTS `kitsummary`*/;;
/*!50001 SET @saved_cs_client          = @@character_set_client */;;
/*!50001 SET @saved_cs_results         = @@character_set_results */;;
/*!50001 SET @saved_col_connection     = @@collation_connection */;;
/*!50001 SET character_set_client      = utf8 */;;
/*!50001 SET character_set_results     = utf8 */;;
/*!50001 SET collation_connection      = utf8_general_ci */;;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`gsnuser`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `kitsummary` AS select `c`.`id` AS `casefile_id`,`o`.`id` AS `clinic id`,`o`.`name` AS `clinic name`,`ci`.`id` AS `satellite id`,concat(`ci`.`street1`,_latin1', ',`ci`.`street2`,_latin1', ',`ci`.`city`,_latin1' ',`ci`.`state`,_latin1', ',`ci`.`postcode`) AS `satellite address`,`cl`.`director cfs id` AS `cfs id`,`cl`.`director cfs email` AS `cfs email`,`c`.`testtype` AS `Product`,`r`.`barcode` AS `kit barcode`,`r`.`received` AS `received`,`r`.`is_parentkit` AS `parent kit?` from ((((`kitsreceived` `r` left join `casefile` `c` on((`c`.`id` = `r`.`casefile_id`))) left join `organization` `o` on((`o`.`id` = `c`.`clinic_id`))) left join `clinicinforeport` `cl` on((`cl`.`id` = `c`.`clinic_id`))) left join `contactinfo` `ci` on((`ci`.`id` = `c`.`satelliteaddress_id`))) */;;
/*!50001 SET character_set_client      = @saved_cs_client */;;
/*!50001 SET character_set_results     = @saved_cs_results */;;
/*!50001 SET collation_connection      = @saved_col_connection */;;
/*!50001 DROP TABLE IF EXISTS `npt_redrawsummary`*/;;
/*!50001 SET @saved_cs_client          = @@character_set_client */;;
/*!50001 SET @saved_cs_results         = @@character_set_results */;;
/*!50001 SET @saved_col_connection     = @@collation_connection */;;
/*!50001 SET character_set_client      = utf8 */;;
/*!50001 SET character_set_results     = utf8 */;;
/*!50001 SET collation_connection      = utf8_general_ci */;;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`gsnuser`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `npt_redrawsummary` AS select `casefile`.`id` AS `Casefile ID`,`casefile`.`testtype` AS `Test Type`,`organization`.`id` AS `Clinic ID`,`organization`.`name` AS `Clinic Name`,`casefile`.`opened` AS `Casefile Opened`,`casefile`.`state` AS `Casefile State`,`kit`.`id` AS `Kit ID`,`kit`.`barcode` AS `Kit Barcode`,min(`krec`.`received`) AS `Kit Received`,max(`krec`.`redrawn`) AS `Kit Redraw Registered`,group_concat(distinct `rdr`.`name` separator ', ') AS `Redraw Reason(s)`,if((sum((`category`.`name` = 'Redraw Mother')) > 0),1,0) AS `Redraw Mother Category` from (((((((`parentkit` `kit` join `parentkit_receipt` `pk_rec` on((`pk_rec`.`parentkit_id` = `kit`.`id`))) join `kitreceipt` `krec` on((`krec`.`id` = `pk_rec`.`receipt_id`))) left join `reasoncode` `rdr` on((`rdr`.`id` = `krec`.`redrawreason_id`))) join `casefile` on((`casefile`.`id` = `kit`.`casefile_id`))) join `organization` on((`organization`.`id` = `casefile`.`clinic_id`))) left join `casefile_category` `cf_cat` on((`casefile`.`id` = `cf_cat`.`CaseFile_id`))) left join `category` on((`cf_cat`.`categories_id` = `category`.`id`))) where (`casefile`.`testtype` = 'NPT') group by `kit`.`id` */;;
/*!50001 SET character_set_client      = @saved_cs_client */;;
/*!50001 SET character_set_results     = @saved_cs_results */;;
/*!50001 SET collation_connection      = @saved_col_connection */;;
/*!50001 DROP TABLE IF EXISTS `npt_reportsummary`*/;;
/*!50001 SET @saved_cs_client          = @@character_set_client */;;
/*!50001 SET @saved_cs_results         = @@character_set_results */;;
/*!50001 SET @saved_col_connection     = @@collation_connection */;;
/*!50001 SET character_set_client      = utf8 */;;
/*!50001 SET character_set_results     = utf8 */;;
/*!50001 SET collation_connection      = utf8_general_ci */;;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `npt_reportsummary` AS select `a`.`kit_id` AS `kit_id`,`a`.`case_id` AS `case_id`,`rpt`.`clinic_name` AS `Clinic`,`a`.`kit_barcode` AS `kit_barcode`,`a`.`kit_received` AS `kit_received`,`rpt`.`accessioning_id` AS `accessioning_id`,`rpt`.`medical_record_id` AS `medical_record_id`,`rpt`.`patient_id` AS `patient_id`,`rpt`.`third_party_kit_id` AS `third_party_kit_id`,`rpt`.`third_party_draw_id_mom` AS `third_party_draw_id_mom`,`rpt`.`third_party_draw_id_dad` AS `third_party_draw_id_dad`,`rpt`.`patient_gestational_age_weeks` AS `patient_gestational_age_weeks`,`rpt`.`patient_gestational_age_days` AS `patient_gestational_age_days`,`npt_handcall_result`.`handcalled_date` AS `handcalled_date`,`rpt`.`published_date` AS `published_date`,`a`.`delivered_date` AS `delivered_date`,(to_days(`a`.`delivered_date`) - to_days(`a`.`kit_received`)) AS `TAT_calendar`,(`BizDaysInclusive`(`a`.`kit_received`,`a`.`delivered_date`,1) - 1) AS `TAT_biz`,min(if((`tr`.`type` = 'TRISOMY_13'),`tr`.`result_text`,NULL)) AS `T13_result_text`,cast(min(if((`tr`.`type` = 'TRISOMY_13'),`tr`.`riskscore_value`,NULL)) as decimal(10,5)) AS `T13_riskscore_value`,min(if((`tr`.`type` = 'TRISOMY_18'),`tr`.`result_text`,NULL)) AS `T18_result_text`,cast(min(if((`tr`.`type` = 'TRISOMY_18'),`tr`.`riskscore_value`,NULL)) as decimal(10,5)) AS `T18_riskscore_value`,min(if((`tr`.`type` = 'TRISOMY_21'),`tr`.`result_text`,NULL)) AS `T21_result_text`,cast(min(if((`tr`.`type` = 'TRISOMY_21'),`tr`.`riskscore_value`,NULL)) as decimal(10,5)) AS `T21_riskscore_value`,min(if((`tr`.`type` = 'MONOSOMY_X'),`tr`.`result_text`,NULL)) AS `MX_result_text`,cast(min(if((`tr`.`type` = 'MONOSOMY_X'),`tr`.`riskscore_value`,NULL)) as decimal(10,5)) AS `MX_riskscore_value`,`rpt`.`result_code` AS `result_code`,`rpt`.`microdeletion_panel_ordered` AS `microdeletion_panel_ordered`,`rpt`.`microdel_result_code` AS `microdel_result_code`,`npt_handcall_result`.`no_call` AS `no_call`,`npt_handcall_result`.`no_call_reason` AS `no_call_reason`,`npt_handcall_result`.`handcaller_notes` AS `handcaller_notes`,`rpt`.`reported_gender` AS `reported_gender`,`rpt`.`patient_edd_age` AS `patient_edd_age`,`qc_rollup`.`result` AS `qc rollup`,`qc_rollup`.`message` AS `qc rollup message`,`rpt`.`fetal_fraction` AS `reported CFE`,avg(distinct if((`qc_type`.`name` = 'CFE'),`qc_statistics`.`value`,NULL)) AS `CFE`,(max(if((`qc_type`.`name` = 'CFE'),`qc_statistics`.`value`,NULL)) - min(if((`qc_type`.`name` = 'CFE'),`qc_statistics`.`value`,NULL))) AS `CFE range`,avg(distinct if((`qc_type`.`name` = 'SPIKE_RATIO'),`qc_statistics`.`value`,NULL)) AS `spike ratio`,(max(if((`qc_type`.`name` = 'SPIKE_RATIO'),`qc_statistics`.`value`,NULL)) - min(if((`qc_type`.`name` = 'SPIKE_RATIO'),`qc_statistics`.`value`,NULL))) AS `spike ratio range`,`a`.`sentby` AS `sentby`,`a`.`delivered_date` AS `senton`,`a`.`maternal_weight` AS `maternal_weight`,`rpt`.`sample_has_father` AS `father sample included`,`rpt`.`sample_collected` AS `sample_collected` from ((((`_npt_reportsummary_sub1` `a` join `npt_report` `rpt` on((`rpt`.`id` = `a`.`max_rpt_id`))) join `npt_report_npt_report_testresult` `rtr` on((`rtr`.`npt_report_id` = `rpt`.`id`))) join `npt_report_testresult` `tr` on((`tr`.`id` = `rtr`.`testresult_tests_id`))) left join ((((((((`npt_handcall_result` join `npt_handcallresult_sequencinginitfile` on((`npt_handcallresult_sequencinginitfile`.`handcallresult_id` = `npt_handcall_result`.`id`))) join `alg_sequencinginitfile` `sif` on((`sif`.`id` = `npt_handcallresult_sequencinginitfile`.`sequencinginitfile_id`))) join `qc_rollup` on((`qc_rollup`.`sequencinginitfile_id` = `sif`.`id`))) join `qc_rollup_result` on((`qc_rollup_result`.`qc_rollup_id` = `qc_rollup`.`id`))) join `qc_result` on((`qc_rollup_result`.`qualitycontrolresults_id` = `qc_result`.`id`))) join `qc_type` on(((`qc_type`.`id` = `qc_result`.`type_id`) and (`qc_type`.`name` in ('SPIKE_RATIO','CFE'))))) join `qc_result_stats` on((`qc_result_stats`.`id` = `qc_result`.`id`))) join `qc_statistics` on((`qc_statistics`.`result_id` = `qc_result_stats`.`id`))) on((`npt_handcall_result`.`id` = `rpt`.`npthandcallresult_id`))) group by `a`.`kit_id` */;;
/*!50001 SET character_set_client      = @saved_cs_client */;;
/*!50001 SET character_set_results     = @saved_cs_results */;;
/*!50001 SET collation_connection      = @saved_col_connection */;;
/*!50001 DROP TABLE IF EXISTS `nptplateclarity`*/;;
/*!50001 SET @saved_cs_client          = @@character_set_client */;;
/*!50001 SET @saved_cs_results         = @@character_set_results */;;
/*!50001 SET @saved_col_connection     = @@collation_connection */;;
/*!50001 SET character_set_client      = latin1 */;;
/*!50001 SET character_set_results     = latin1 */;;
/*!50001 SET collation_connection      = latin1_swedish_ci */;;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`gsnuser`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `nptplateclarity` AS (select `npc`.`process_type` AS `Process Type`,`npc`.`plate_barcode` AS `Plate Barcode`,`npc`.`plate_created` AS `Plate Created`,`npc`.`plate_type` AS `Plate Type`,`npc`.`sample_barcode` AS `Sample Barcode`,`cf`.`id` AS `Case`,if((sum(if(((`ccat`.`categories_id` = 118) or (`ccat`.`categories_id` = 162)),1,0)) > 0),'yes','no') AS `Prenatus`,if((sum(if((`ccat`.`categories_id` = 62),1,0)) > 0),'yes','no') AS `NIPT Research`,if((sum(if((`ccat`.`categories_id` = 167),1,0)) > 0),'yes','no') AS `NIPT Bridging Study`,`cf`.`testtype` AS `Test Type`,`t`.`name` AS `Territory Name`,`npc`.`create_timestamp` AS `Process Completed`,`npc`.`pool_barcode` AS `Pool Barcode` from (((((((((`npt_plate_clarity` `npc` left join `sample` `smp` on((`npc`.`sample_barcode` = `smp`.`barcode`))) left join `sample_rootsample` `srs` on((`smp`.`id` = `srs`.`id`))) left join `sample` `rt` on((`srs`.`rootsample_id` = `rt`.`id`))) left join `family_subject` `fs` on((`rt`.`subject_id` = `fs`.`members_id`))) left join `parentkit_sample` `ps` on((`rt`.`id` = `ps`.`sample_id`))) left join `parentkit` `pk` on((`ps`.`parentkit_id` = `pk`.`id`))) left join `casefile` `cf` on((`pk`.`casefile_id` = `cf`.`id`))) left join `casefile_category` `ccat` on((`ccat`.`CaseFile_id` = `cf`.`id`))) left join `territory` `t` on((`cf`.`historicterritory_id` = `t`.`id`))) where (`rt`.`DTYPE` <> 'Blastomere') group by `npc`.`sample_barcode`,`npc`.`placement_id`) union (select `npc`.`process_type` AS `Process Type`,`npc`.`plate_barcode` AS `Plate Barcode`,`npc`.`plate_created` AS `Plate Created`,`npc`.`plate_type` AS `Plate Type`,`npc`.`sample_barcode` AS `Sample Barcode`,`cf`.`id` AS `Case`,if((sum(if(((`ccat`.`categories_id` = 118) or (`ccat`.`categories_id` = 162)),1,0)) > 0),'yes','no') AS `Prenatus`,if((sum(if((`ccat`.`categories_id` = 62),1,0)) > 0),'yes','no') AS `NIPT Research`,if((sum(if((`ccat`.`categories_id` = 167),1,0)) > 0),'yes','no') AS `NIPT Bridging Study`,`cf`.`testtype` AS `Test Type`,`t`.`name` AS `Territory Name`,`npc`.`create_timestamp` AS `Process Completed`,`npc`.`pool_barcode` AS `Pool Barcode` from (((((((((`npt_plate_clarity` `npc` left join `sample` `smp` on((`npc`.`sample_barcode` = `smp`.`barcode`))) left join `sample_rootsample` `srs` on((`smp`.`id` = `srs`.`id`))) left join `sample` `rt` on((`srs`.`rootsample_id` = `rt`.`id`))) left join `family_subject` `fs` on((`rt`.`subject_id` = `fs`.`members_id`))) left join `blastomereplate_sample` `bs` on((`rt`.`id` = `bs`.`samplelist_id`))) left join `blastomereplate` `bp` on((`bp`.`id` = `bs`.`blastomereplates_id`))) left join `casefile` `cf` on((`bp`.`casefile_id` = `cf`.`id`))) left join `casefile_category` `ccat` on((`ccat`.`CaseFile_id` = `cf`.`id`))) left join `territory` `t` on((`cf`.`historicterritory_id` = `t`.`id`))) where (`rt`.`DTYPE` = 'Blastomere') group by `npc`.`sample_barcode`,`npc`.`placement_id`) */;;
/*!50001 SET character_set_client      = @saved_cs_client */;;
/*!50001 SET character_set_results     = @saved_cs_results */;;
/*!50001 SET collation_connection      = @saved_col_connection */;;
/*!50001 DROP TABLE IF EXISTS `nptplatesummary`*/;;
/*!50001 SET @saved_cs_client          = @@character_set_client */;;
/*!50001 SET @saved_cs_results         = @@character_set_results */;;
/*!50001 SET @saved_col_connection     = @@collation_connection */;;
/*!50001 SET character_set_client      = utf8 */;;
/*!50001 SET character_set_results     = utf8 */;;
/*!50001 SET collation_connection      = utf8_general_ci */;;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `nptplatesummary` AS select `np`.`DTYPE` AS `Process Type`,`np`.`barcode` AS `Plate Barcode`,`np`.`created` AS `Plate Created`,`np`.`platetype` AS `Plate Type`,`nps`.`position` AS `Plate Position`,`smp`.`barcode` AS `Sample Barcode`,`rt`.`barcode` AS `Root Barcode`,`c`.`id` AS `Case`,if((sum(if(((`ccat`.`categories_id` = 118) or (`ccat`.`categories_id` = 162)),1,0)) > 0),'yes','no') AS `Prenatus`,if((sum(if((`ccat`.`categories_id` = 62),1,0)) > 0),'yes','no') AS `NIPT Research`,if((sum(if((`ccat`.`categories_id` = 167),1,0)) > 0),'yes','no') AS `NIPT Bridging Study`,`c`.`opened` AS `Case Opened Date`,`c`.`testtype` AS `Test Type`,`fs`.`familyPosition` AS `Family Position`,`st`.`displayname` AS `Sample Type`,`rt`.`received` AS `Root Sample Receive Date`,`smp`.`prepped` AS `Prep Date`,`t`.`name` AS `Territory Name` from ((((((((((((`prodlims`.`npt_plate` `np` left join `prodlims`.`npt_plate_platewellsample` `nps` on((`nps`.`npt_plate_id` = `np`.`id`))) left join `prodlims`.`platewellsample` `pws` on((`pws`.`id` = `nps`.`wells_id`))) left join `prodlims`.`sample` `smp` on((`smp`.`id` = `pws`.`sample_id`))) left join `prodlims`.`sampletype` `st` on((`smp`.`sampletype_id` = `st`.`id`))) left join `prodlims`.`sample_rootsample` `srs` on((`srs`.`id` = `smp`.`id`))) left join `prodlims`.`sample` `rt` on((`rt`.`id` = `srs`.`rootsample_id`))) left join `prodlims`.`family_subject` `fs` on((`fs`.`members_id` = `rt`.`subject_id`))) left join `prodlims`.`parentkit_sample` `ps` on((`ps`.`sample_id` = `rt`.`id`))) left join `prodlims`.`parentkit` `pk` on((`pk`.`id` = `ps`.`parentkit_id`))) left join `prodlims`.`casefile` `c` on((`c`.`id` = `pk`.`casefile_id`))) left join `prodlims`.`casefile_category` `ccat` on((`ccat`.`CaseFile_id` = `c`.`id`))) left join `prodlims`.`territory` `t` on((`t`.`id` = `c`.`historicterritory_id`))) where ((`np`.`DTYPE` <> 'SamplePool') and (`np`.`DTYPE` <> 'BarcodingPrimerPlate')) group by `np`.`barcode`,`nps`.`position` union select `np`.`DTYPE` AS `Process Type`,`np`.`barcode` AS `Plate Barcode`,`np`.`created` AS `Plate Created`,`np`.`platetype` AS `Plate Type`,`bar`.`idx` AS `Plate Position`,`smp`.`barcode` AS `Sample Barcode`,`rt`.`barcode` AS `Root Barcode`,`c`.`id` AS `Case`,if((sum(if(((`ccat`.`categories_id` = 118) or (`ccat`.`categories_id` = 162)),1,0)) > 0),'yes','no') AS `Prenatus`,if((sum(if((`ccat`.`categories_id` = 62),1,0)) > 0),'yes','no') AS `NIPT Research`,if((sum(if((`ccat`.`categories_id` = 167),1,0)) > 0),'yes','no') AS `NIPT Bridging Study`,`c`.`opened` AS `Case Opened Date`,`c`.`testtype` AS `Test Type`,`fs`.`familyPosition` AS `Family Position`,`st`.`displayname` AS `Sample Type`,`rt`.`received` AS `Root Sample Receive Date`,`smp`.`prepped` AS `Prep Date`,`t`.`name` AS `Territory Name` from (((((((((((((`prodlims`.`npt_plate` `np` left join `prodlims`.`npt_plate_sequencingbarcode_platewellsample` `nps` on((`nps`.`npt_plate_id` = `np`.`id`))) left join `prodlims`.`platewellsample` `pws` on((`pws`.`id` = `nps`.`platewellsample_id`))) left join `hts`.`sequencingbarcode` `bar` on((`bar`.`id` = `nps`.`sequencingbarcode_id`))) left join `prodlims`.`sample` `smp` on((`smp`.`id` = `pws`.`sample_id`))) left join `prodlims`.`sampletype` `st` on((`smp`.`sampletype_id` = `st`.`id`))) left join `prodlims`.`sample_rootsample` `srs` on((`srs`.`id` = `smp`.`id`))) left join `prodlims`.`sample` `rt` on((`rt`.`id` = `srs`.`rootsample_id`))) left join `prodlims`.`family_subject` `fs` on((`fs`.`members_id` = `rt`.`subject_id`))) left join `prodlims`.`parentkit_sample` `ps` on((`ps`.`sample_id` = `rt`.`id`))) left join `prodlims`.`parentkit` `pk` on((`pk`.`id` = `ps`.`parentkit_id`))) left join `prodlims`.`casefile` `c` on((`c`.`id` = `pk`.`casefile_id`))) left join `prodlims`.`casefile_category` `ccat` on((`ccat`.`CaseFile_id` = `c`.`id`))) left join `prodlims`.`territory` `t` on((`t`.`id` = `c`.`historicterritory_id`))) where (`np`.`DTYPE` = 'SamplePool') group by `np`.`barcode`,`bar`.`idx` */;;
/*!50001 SET character_set_client      = @saved_cs_client */;;
/*!50001 SET character_set_results     = @saved_cs_results */;;
/*!50001 SET collation_connection      = @saved_col_connection */;;
/*!50001 DROP TABLE IF EXISTS `parent_rerun_by_sample`*/;;
/*!50001 SET @saved_cs_client          = @@character_set_client */;;
/*!50001 SET @saved_cs_results         = @@character_set_results */;;
/*!50001 SET @saved_col_connection     = @@collation_connection */;;
/*!50001 SET character_set_client      = utf8 */;;
/*!50001 SET character_set_results     = utf8 */;;
/*!50001 SET collation_connection      = utf8_general_ci */;;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `parent_rerun_by_sample` AS select min(`sr`.`rundate`) AS `rundate`,`ss`.`samplebarcode` AS `samplebarcode`,(sum(if((`ss`.`intendeddepthofread` = 'DOR_GENOMIC_GENOTYPES'),1,0)) - 1) AS `parents_reruns`,count(0) AS `cnt` from (`hts`.`sequencingsample` `ss` join `hts`.`sequencingrun` `sr` on((`sr`.`id` = `ss`.`run_id`))) where ((left(`ss`.`project`,2) = 'HS') and (`ss`.`sampletype` in ('buccal','parent','blood'))) group by `ss`.`samplebarcode` having min((`sr`.`rundate` > '2013-09-01')) */;;
/*!50001 SET character_set_client      = @saved_cs_client */;;
/*!50001 SET character_set_results     = @saved_cs_results */;;
/*!50001 SET collation_connection      = @saved_col_connection */;;
/*!50001 DROP TABLE IF EXISTS `parentsetupsummary`*/;;
/*!50001 SET @saved_cs_client          = @@character_set_client */;;
/*!50001 SET @saved_cs_results         = @@character_set_results */;;
/*!50001 SET @saved_col_connection     = @@collation_connection */;;
/*!50001 SET character_set_client      = utf8 */;;
/*!50001 SET character_set_results     = utf8 */;;
/*!50001 SET collation_connection      = utf8_general_ci */;;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`gsnuser`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `parentsetupsummary` AS select `c`.`id` AS `casefile`,`c`.`testtype` AS `Product`,if((sum((case `cc`.`categories_id` when 61 then 1 when 62 then 1 when 64 then 1 when 65 then 1 when 66 then 1 when 67 then 1 when 68 then 1 when 69 then 1 when 71 then 1 else 0 end)) > 0),_latin1'no',_latin1'') AS `disposable`,`fs`.`familyPosition` AS `familyPosition`,`sam`.`barcode` AS `barcode`,`sam`.`dnabarcode` AS `DNA barcode`,(to_days(curdate()) - to_days(`sam`.`received`)) AS `Sample age`,(`sam`.`received` + interval 1 day) AS `date parent run on array`,date_format((`sam`.`received` + interval 1 day),_latin1'%Y-%m') AS `month run on array`,`u`.`email` AS `received by`,if(isnull(`ia`.`id`),_latin1'',_latin1'yes') AS `run on array`,if(`ia`.`validated`,_latin1'yes',_latin1'') AS `validated`,ifnull(`chip`.`illuminaarraytype`,_latin1'') AS `array type` from ((((((((`casefile` `c` join `family` `fam` on((`fam`.`id` = `c`.`family_id`))) join `family_subject` `fs` on((`fs`.`families_id` = `fam`.`id`))) join `subject` `sub` on((`sub`.`id` = `fs`.`members_id`))) join `sample` `sam` on((`sam`.`subject_id` = `sub`.`id`))) join `illuminaarray` `ia` on((`ia`.`sample_id` = `sam`.`id`))) join `inventorieditem` `chip` on((`ia`.`illuminaChip_id` = `chip`.`id`))) left join `casefile_category` `cc` on((`cc`.`CaseFile_id` = `c`.`id`))) join `user` `u`) where (`sam`.`receivedby_id` = `u`.`id`) group by `c`.`id` */;;
/*!50001 SET character_set_client      = @saved_cs_client */;;
/*!50001 SET character_set_results     = @saved_cs_results */;;
/*!50001 SET collation_connection      = @saved_col_connection */;;
/*!50001 DROP TABLE IF EXISTS `parentsummary`*/;;
/*!50001 SET @saved_cs_client          = @@character_set_client */;;
/*!50001 SET @saved_cs_results         = @@character_set_results */;;
/*!50001 SET @saved_col_connection     = @@collation_connection */;;
/*!50001 SET character_set_client      = latin1 */;;
/*!50001 SET character_set_results     = latin1 */;;
/*!50001 SET collation_connection      = latin1_swedish_ci */;;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`gsnuser`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `parentsummary` AS select `cf`.`id` AS `id`,if(`fam`.`useeggdonor`,'yes','') AS `eggdonor`,if(`fam`.`usespermdonor`,'yes','') AS `spermdonor`,`cf`.`satelliteaddress_id` AS `satelliteaddress_id`,((to_days(`cf`.`expectedretrievaldate`) - to_days(`sub`.`dateofbirth`)) / 365) AS `maternal age` from (((`casefile` `cf` join `family` `fam` on((`cf`.`family_id` = `fam`.`id`))) left join `family_subject` `fm` on(((`fm`.`families_id` = `fam`.`id`) and (`fm`.`familyPosition` = if(`fam`.`useeggdonor`,_latin1'egg_donor',_latin1'patient'))))) join `subject` `sub` on((`fm`.`members_id` = `sub`.`id`))) */;;
/*!50001 SET character_set_client      = @saved_cs_client */;;
/*!50001 SET character_set_results     = @saved_cs_results */;;
/*!50001 SET collation_connection      = @saved_col_connection */;;
/*!50001 DROP TABLE IF EXISTS `patientcontactinfos`*/;;
/*!50001 SET @saved_cs_client          = @@character_set_client */;;
/*!50001 SET @saved_cs_results         = @@character_set_results */;;
/*!50001 SET @saved_col_connection     = @@collation_connection */;;
/*!50001 SET character_set_client      = latin1 */;;
/*!50001 SET character_set_results     = latin1 */;;
/*!50001 SET collation_connection      = latin1_swedish_ci */;;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`gsnuser`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `patientcontactinfos` AS select `cf`.`id` AS `Case`,`cf`.`submissioncode` AS `Transaction Profile`,`cf`.`submissiondate` AS `Date Xifin Submitted`,`sub`.`firstname` AS `First Name`,`sub`.`lastname` AS `Last Name`,`ci`.`street1` AS `Address Line 1`,`ci`.`street2` AS `Address Line 2`,`ci`.`city` AS `City`,`ci`.`state` AS `State`,`ci`.`postcode` AS `Zip Code`,`ci`.`phonenumber` AS `Phone Number`,`ci`.`email` AS `Email`,`o`.`name` AS `Referring Clinic`,concat(`p`.`lastname`,', ',`p`.`firstname`) AS `Physician Name`,`cf`.`testtype` AS `Test Type` from ((((((`casefile` `cf` join `family_subject` `fs` on((`fs`.`families_id` = `cf`.`family_id`))) join `subject` `sub` on((`sub`.`id` = `fs`.`members_id`))) join `subject_contactinfo` `sci` on((`sci`.`Subject_id` = `sub`.`id`))) join `contactinfo` `ci` on((`ci`.`id` = `sci`.`addresses_id`))) left join `organization` `o` on((`o`.`id` = `cf`.`clinic_id`))) left join `provider` `p` on((`p`.`id` = `cf`.`physician_id`))) where ((`fs`.`familyPosition` = 'patient') and (`sci`.`addresses_KEY` = 'DEFAULT') and (length(`sub`.`firstname`) <> 0) and (length(`sub`.`lastname`) <> 0) and (length(`ci`.`street1`) <> 0) and (length(`ci`.`city`) <> 0) and (length(`ci`.`state`) <> 0) and (length(`ci`.`postcode`) <> 0) and (year(`cf`.`submissiondate`) > 2009)) */;;
/*!50001 SET character_set_client      = @saved_cs_client */;;
/*!50001 SET character_set_results     = @saved_cs_results */;;
/*!50001 SET collation_connection      = @saved_col_connection */;;
/*!50001 DROP TABLE IF EXISTS `prepsamplesummary`*/;;
/*!50001 SET @saved_cs_client          = @@character_set_client */;;
/*!50001 SET @saved_cs_results         = @@character_set_results */;;
/*!50001 SET @saved_col_connection     = @@collation_connection */;;
/*!50001 SET character_set_client      = latin1 */;;
/*!50001 SET character_set_results     = latin1 */;;
/*!50001 SET collation_connection      = latin1_swedish_ci */;;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`gsnuser`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `prepsamplesummary` AS select group_concat(distinct `c`.`id` separator ',') AS `Case(s)`,`s`.`barcode` AS `Sample Barcode`,`rt`.`barcode` AS `Root Barcode`,`pp`.`name` AS `Genomic Prep Procedure`,`c`.`testtype` AS `Test Type`,`s`.`prepped` AS `Prep Date`,`rt`.`received` AS `Root Sample Receive Date`,min(`c`.`opened`) AS `Earliest Case Open Date`,`st`.`displayname` AS `Sample Type`,if((sum(if(((`ccat`.`categories_id` = 118) or (`ccat`.`categories_id` = 162)),1,0)) > 0),'yes','no') AS `Prenatus`,if((sum(if((`ccat`.`categories_id` = 62),1,0)) > 0),'yes','no') AS `NIPT Research`,if((sum(if((`ccat`.`categories_id` = 167),1,0)) > 0),'yes','no') AS `NIPT Bridging Study`,`t`.`name` AS `Territory Name` from (((((((((`sample` `s` left join `genomicprepprocedure` `pp` on((`s`.`genomicprepprocedure_id` = `pp`.`id`))) left join `sampletype` `st` on((`s`.`sampletype_id` = `st`.`id`))) left join `sample_rootsample` `srs` on((`srs`.`id` = `s`.`id`))) left join `sample` `rt` on((`rt`.`id` = `srs`.`rootsample_id`))) left join `family_subject` `fs` on((`fs`.`members_id` = `rt`.`subject_id`))) left join `family` `f` on((`fs`.`families_id` = `f`.`id`))) left join `casefile` `c` on((`c`.`family_id` = `f`.`id`))) left join `casefile_category` `ccat` on((`ccat`.`CaseFile_id` = `c`.`id`))) left join `territory` `t` on((`t`.`id` = `c`.`historicterritory_id`))) where ((`s`.`genomicprepprocedure_id` is not null) or (`st`.`name` = 'dna')) group by `s`.`barcode`,`rt`.`barcode` */;;
/*!50001 SET character_set_client      = @saved_cs_client */;;
/*!50001 SET character_set_results     = @saved_cs_results */;;
/*!50001 SET collation_connection      = @saved_col_connection */;;
/*!50001 DROP TABLE IF EXISTS `publishedreport_paternity`*/;;
/*!50001 SET @saved_cs_client          = @@character_set_client */;;
/*!50001 SET @saved_cs_results         = @@character_set_results */;;
/*!50001 SET @saved_col_connection     = @@collation_connection */;;
/*!50001 SET character_set_client      = utf8 */;;
/*!50001 SET character_set_results     = utf8 */;;
/*!50001 SET collation_connection      = utf8_general_ci */;;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `publishedreport_paternity` AS select `allreport_paternity`.`clinic_name` AS `clinic_name`,`allreport_paternity`.`casefile_id` AS `casefile_id`,`allreport_paternity`.`report_id` AS `report_id`,`allreport_paternity`.`sample_id` AS `sample_id`,`allreport_paternity`.`mother_sample_received` AS `mother_sample_received`,`allreport_paternity`.`mother_sample_collected` AS `mother_sample_collected`,`allreport_paternity`.`mother_redraw_sample_received` AS `mother_redraw_sample_received`,`allreport_paternity`.`mother_redraw_sample_collected` AS `mother_redraw_sample_collected`,`allreport_paternity`.`af_sample_received` AS `af_sample_received`,`allreport_paternity`.`af_sample_collected` AS `af_sample_collected`,`allreport_paternity`.`af_redraw_sample_received` AS `af_redraw_sample_received`,`allreport_paternity`.`af_redraw_sample_collected` AS `af_redraw_sample_collected`,`allreport_paternity`.`af_sample_id` AS `af_sample_id`,`allreport_paternity`.`reported_call` AS `reported_call`,`allreport_paternity`.`algorithm_call` AS `algorithm_call`,`allreport_paternity`.`reported_plot` AS `reported_plot`,`allreport_paternity`.`algorithm_plot` AS `algorithm_plot`,`allreport_paternity`.`p_value` AS `p_value`,`allreport_paternity`.`fetal_fraction_context_none` AS `fetal_fraction_context_none`,`allreport_paternity`.`fetal_fraction_context_af` AS `fetal_fraction_context_af`,`allreport_paternity`.`drop_out_rate` AS `drop_out_rate`,`allreport_paternity`.`gestationalage` AS `gestationalage`,`allreport_paternity`.`mother_race` AS `mother_race`,`allreport_paternity`.`alleged_father_race` AS `alleged_father_race`,`allreport_paternity`.`report_senton` AS `report_senton`,`allreport_paternity`.`published` AS `published`,`allreport_paternity`.`amended` AS `amended` from `allreport_paternity` where (`allreport_paternity`.`published` is true) */;;
/*!50001 SET character_set_client      = @saved_cs_client */;;
/*!50001 SET character_set_results     = @saved_cs_results */;;
/*!50001 SET collation_connection      = @saved_col_connection */;;
/*!50001 DROP TABLE IF EXISTS `publishedreport_per_chrom`*/;;
/*!50001 SET @saved_cs_client          = @@character_set_client */;;
/*!50001 SET @saved_cs_results         = @@character_set_results */;;
/*!50001 SET @saved_col_connection     = @@collation_connection */;;
/*!50001 SET character_set_client      = latin1 */;;
/*!50001 SET character_set_results     = latin1 */;;
/*!50001 SET collation_connection      = latin1_swedish_ci */;;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`gsnuser`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `publishedreport_per_chrom` AS select `t`.`casefile_id` AS `casefile_id`,`t`.`testtype` AS `testtype`,`t`.`useEggDonor` AS `useEggDonor`,`t`.`maternal age` AS `maternal age`,`t`.`array` AS `array`,`t`.`sampleid` AS `sampleid`,`t`.`sampletype` AS `sampletype`,`t`.`bucket_normalized` AS `bucket_normalized`,`t`.`buckettype` AS `buckettype`,`t`.`embryoid` AS `embryoid`,`t`.`euploid` AS `euploid`,`t`.`euploidconfidence` AS `euploidconfidence`,`t`.`rank` AS `rank`,`t`.`mcc` AS `mcc`,`t`.`labnote` AS `labnote`,`t`.`gestationalage` AS `gestationalage`,`t`.`senton` AS `senton`,`t`.`sentto` AS `sentto`,`t`.`jobdir` AS `jobdir`,`t`.`report_id` AS `report_id`,`t`.`reportblastomere_id` AS `reportblastomere_id`,`t`.`summarynumber` AS `summarynumber`,`rc`.`bestSubHypothesis` AS `bestsubhypothesis`,`rc`.`euploid` AS `chrom_euploid`,`rc`.`euploidconfidence` AS `chrom_euploidconfidence`,`rc`.`name` AS `chrom`,`rc`.`segmented` AS `segmented` from (`publishedreport_per_target` `t` join `report_chromosome` `rc` on((`rc`.`blastomere_id` = `t`.`reportblastomere_id`))) */;;
/*!50001 SET character_set_client      = @saved_cs_client */;;
/*!50001 SET character_set_results     = @saved_cs_results */;;
/*!50001 SET collation_connection      = @saved_col_connection */;;
/*!50001 DROP TABLE IF EXISTS `publishedreport_per_target`*/;;
/*!50001 SET @saved_cs_client          = @@character_set_client */;;
/*!50001 SET @saved_cs_results         = @@character_set_results */;;
/*!50001 SET @saved_col_connection     = @@collation_connection */;;
/*!50001 SET character_set_client      = latin1 */;;
/*!50001 SET character_set_results     = latin1 */;;
/*!50001 SET collation_connection      = latin1_swedish_ci */;;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`gsnuser`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `publishedreport_per_target` AS select `r`.`casefile_id` AS `casefile_id`,`r`.`testtype` AS `testtype`,`fam`.`useeggdonor` AS `useEggDonor`,`p`.`maternal age` AS `maternal age`,`rb`.`array` AS `array`,`rb`.`sampleid` AS `sampleid`,`st`.`name` AS `sampletype`,(case `rb`.`buckettype` when 'ANEUPLOIDY' then 'ANEUPLOIDY' when 'ANEUPLOIDY_INCLUDING_VIABLE' then 'ANEUPLOIDY' when 'ANEUPLOIDY_EXCLUDING_VIABLE' then 'ANEUPLOIDY_EXCLUDING_VIABLE' when 'NORMAL_RANKED' then 'NORMAL' when 'NORMAL_UNRANKED' then 'NORMAL' when 'INCOMPLETE_RANKED' then 'INCOMPLETE' when 'INCOMPLETE_UNRANKED' then 'INCOMPLETE' else NULL end) AS `bucket_normalized`,`rb`.`buckettype` AS `buckettype`,`rb`.`embryoid` AS `embryoid`,`rb`.`euploid` AS `euploid`,`rb`.`euploidconfidence` AS `euploidconfidence`,`rb`.`rank` AS `rank`,if((`rb`.`mcc` is true),'yes','') AS `mcc`,`rb`.`labnote` AS `labnote`,`bp`.`gestationalage` AS `gestationalage`,`rsr`.`senton` AS `senton`,`rsr`.`sentto` AS `sentto`,`rsr`.`jobdir` AS `jobdir`,`r`.`id` AS `report_id`,`rb`.`id` AS `reportblastomere_id`,`rb`.`summarynumber` AS `summarynumber` from (((((((((`cncreportshipmentrecord` `rsr` join `report_report` `r` on((`r`.`id` = `rsr`.`report_id`))) join `report_blastomere` `rb` on((`rb`.`report_id` = `r`.`id`))) join `sampletype` `st` on((`st`.`id` = `rb`.`sampletype_id`))) join `sample` `smp` on((`rb`.`sampleid` = `smp`.`barcode`))) left join `blastomereplate_sample` `bs` on((`bs`.`samplelist_id` = `smp`.`id`))) left join `blastomereplate` `bp` on((`bs`.`blastomereplates_id` = `bp`.`id`))) join `casefile` `cs` on((`cs`.`id` = `r`.`casefile_id`))) join `family` `fam` on((`fam`.`id` = `cs`.`family_id`))) join `parentsummary` `p` on((`p`.`id` = `cs`.`id`))) where ((`rsr`.`amended` is false) and (`rsr`.`published` is true)) group by `rb`.`array` */;;
/*!50001 SET character_set_client      = @saved_cs_client */;;
/*!50001 SET character_set_results     = @saved_cs_results */;;
/*!50001 SET collation_connection      = @saved_col_connection */;;
/*!50001 DROP TABLE IF EXISTS `publishedreport_per_target_mcc`*/;;
/*!50001 SET @saved_cs_client          = @@character_set_client */;;
/*!50001 SET @saved_cs_results         = @@character_set_results */;;
/*!50001 SET @saved_col_connection     = @@collation_connection */;;
/*!50001 SET character_set_client      = latin1 */;;
/*!50001 SET character_set_results     = latin1 */;;
/*!50001 SET collation_connection      = latin1_swedish_ci */;;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`gsnuser`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `publishedreport_per_target_mcc` AS select `publishedreport_per_target`.`casefile_id` AS `casefile_id`,`publishedreport_per_target`.`testtype` AS `testtype`,`publishedreport_per_target`.`useEggDonor` AS `useEggDonor`,`publishedreport_per_target`.`maternal age` AS `maternal age`,`publishedreport_per_target`.`array` AS `array`,`publishedreport_per_target`.`sampleid` AS `sampleid`,`publishedreport_per_target`.`sampletype` AS `sampletype`,`publishedreport_per_target`.`bucket_normalized` AS `bucket_normalized`,`publishedreport_per_target`.`buckettype` AS `buckettype`,`publishedreport_per_target`.`embryoid` AS `embryoid`,`publishedreport_per_target`.`euploid` AS `euploid`,`publishedreport_per_target`.`euploidconfidence` AS `euploidconfidence`,`publishedreport_per_target`.`rank` AS `rank`,`publishedreport_per_target`.`mcc` AS `mcc`,`publishedreport_per_target`.`labnote` AS `labnote`,`publishedreport_per_target`.`gestationalage` AS `gestationalage`,`publishedreport_per_target`.`senton` AS `senton`,`publishedreport_per_target`.`sentto` AS `sentto`,`publishedreport_per_target`.`jobdir` AS `jobdir`,`publishedreport_per_target`.`report_id` AS `report_id`,`publishedreport_per_target`.`reportblastomere_id` AS `reportblastomere_id`,`publishedreport_per_target`.`summarynumber` AS `summarynumber`,(sum(if((`publishedreport_per_target`.`mcc` = 'yes'),1,0)) > 0) AS `anymcc`,((sum(if((`publishedreport_per_target`.`mcc` = 'yes'),1,0)) > 0) and (sum(if((`publishedreport_per_target`.`mcc` = 'yes'),1,0)) >= count(0))) AS `unrecovered` from `publishedreport_per_target` where (`publishedreport_per_target`.`testtype` = 'product_poc') group by `publishedreport_per_target`.`casefile_id`,`publishedreport_per_target`.`embryoid` */;;
/*!50001 SET character_set_client      = @saved_cs_client */;;
/*!50001 SET character_set_results     = @saved_cs_results */;;
/*!50001 SET collation_connection      = @saved_col_connection */;;
/*!50001 DROP TABLE IF EXISTS `publishedreport_per_target_pivotedchrom`*/;;
/*!50001 SET @saved_cs_client          = @@character_set_client */;;
/*!50001 SET @saved_cs_results         = @@character_set_results */;;
/*!50001 SET @saved_col_connection     = @@collation_connection */;;
/*!50001 SET character_set_client      = latin1 */;;
/*!50001 SET character_set_results     = latin1 */;;
/*!50001 SET collation_connection      = latin1_swedish_ci */;;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`gsnuser`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `publishedreport_per_target_pivotedchrom` AS select `s`.`casefile_id` AS `casefile_id`,`s`.`testtype` AS `testtype`,`s`.`useEggDonor` AS `useEggDonor`,`s`.`maternal age` AS `maternal age`,`s`.`array` AS `array`,`s`.`sampleid` AS `sampleid`,`s`.`sampletype` AS `sampletype`,`s`.`bucket_normalized` AS `bucket_normalized`,`s`.`buckettype` AS `buckettype`,`s`.`embryoid` AS `embryoid`,`s`.`euploid` AS `euploid`,`s`.`euploidconfidence` AS `euploidconfidence`,`s`.`rank` AS `rank`,`s`.`mcc` AS `mcc`,`s`.`labnote` AS `labnote`,`s`.`gestationalage` AS `gestationalage`,`s`.`senton` AS `senton`,`s`.`sentto` AS `sentto`,`s`.`jobdir` AS `jobdir`,`s`.`report_id` AS `report_id`,`s`.`reportblastomere_id` AS `reportblastomere_id`,`s`.`summarynumber` AS `summarynumber`,cast(group_concat(if((`s`.`chrom` = 1),`s`.`bestsubhypothesis`,NULL) separator ',') as char(7) charset latin1) AS `bestsubhypothesis_1`,sum(if((`s`.`chrom` = 1),`s`.`chrom_euploidconfidence`,0)) AS `chrom_euploidconfidence_1`,cast(sum(if((`s`.`chrom` = 1),`s`.`segmented`,0)) as signed) AS `segmented_1`,cast(group_concat(if((`s`.`chrom` = 2),`s`.`bestsubhypothesis`,NULL) separator ',') as char(7) charset latin1) AS `bestsubhypothesis_2`,sum(if((`s`.`chrom` = 2),`s`.`chrom_euploidconfidence`,0)) AS `chrom_euploidconfidence_2`,cast(sum(if((`s`.`chrom` = 2),`s`.`segmented`,0)) as signed) AS `segmented_2`,cast(group_concat(if((`s`.`chrom` = 3),`s`.`bestsubhypothesis`,NULL) separator ',') as char(7) charset latin1) AS `bestsubhypothesis_3`,sum(if((`s`.`chrom` = 3),`s`.`chrom_euploidconfidence`,0)) AS `chrom_euploidconfidence_3`,cast(sum(if((`s`.`chrom` = 3),`s`.`segmented`,0)) as signed) AS `segmented_3`,cast(group_concat(if((`s`.`chrom` = 4),`s`.`bestsubhypothesis`,NULL) separator ',') as char(7) charset latin1) AS `bestsubhypothesis_4`,sum(if((`s`.`chrom` = 4),`s`.`chrom_euploidconfidence`,0)) AS `chrom_euploidconfidence_4`,cast(sum(if((`s`.`chrom` = 4),`s`.`segmented`,0)) as signed) AS `segmented_4`,cast(group_concat(if((`s`.`chrom` = 5),`s`.`bestsubhypothesis`,NULL) separator ',') as char(7) charset latin1) AS `bestsubhypothesis_5`,sum(if((`s`.`chrom` = 5),`s`.`chrom_euploidconfidence`,0)) AS `chrom_euploidconfidence_5`,cast(sum(if((`s`.`chrom` = 5),`s`.`segmented`,0)) as signed) AS `segmented_5`,cast(group_concat(if((`s`.`chrom` = 6),`s`.`bestsubhypothesis`,NULL) separator ',') as char(7) charset latin1) AS `bestsubhypothesis_6`,sum(if((`s`.`chrom` = 6),`s`.`chrom_euploidconfidence`,0)) AS `chrom_euploidconfidence_6`,cast(sum(if((`s`.`chrom` = 6),`s`.`segmented`,0)) as signed) AS `segmented_6`,cast(group_concat(if((`s`.`chrom` = 7),`s`.`bestsubhypothesis`,NULL) separator ',') as char(7) charset latin1) AS `bestsubhypothesis_7`,sum(if((`s`.`chrom` = 7),`s`.`chrom_euploidconfidence`,0)) AS `chrom_euploidconfidence_7`,cast(sum(if((`s`.`chrom` = 7),`s`.`segmented`,0)) as signed) AS `segmented_7`,cast(group_concat(if((`s`.`chrom` = 8),`s`.`bestsubhypothesis`,NULL) separator ',') as char(7) charset latin1) AS `bestsubhypothesis_8`,sum(if((`s`.`chrom` = 8),`s`.`chrom_euploidconfidence`,0)) AS `chrom_euploidconfidence_8`,cast(sum(if((`s`.`chrom` = 8),`s`.`segmented`,0)) as signed) AS `segmented_8`,cast(group_concat(if((`s`.`chrom` = 9),`s`.`bestsubhypothesis`,NULL) separator ',') as char(7) charset latin1) AS `bestsubhypothesis_9`,sum(if((`s`.`chrom` = 9),`s`.`chrom_euploidconfidence`,0)) AS `chrom_euploidconfidence_9`,cast(sum(if((`s`.`chrom` = 9),`s`.`segmented`,0)) as signed) AS `segmented_9`,cast(group_concat(if((`s`.`chrom` = 10),`s`.`bestsubhypothesis`,NULL) separator ',') as char(7) charset latin1) AS `bestsubhypothesis_10`,sum(if((`s`.`chrom` = 10),`s`.`chrom_euploidconfidence`,0)) AS `chrom_euploidconfidence_10`,cast(sum(if((`s`.`chrom` = 10),`s`.`segmented`,0)) as signed) AS `segmented_10`,cast(group_concat(if((`s`.`chrom` = 11),`s`.`bestsubhypothesis`,NULL) separator ',') as char(7) charset latin1) AS `bestsubhypothesis_11`,sum(if((`s`.`chrom` = 11),`s`.`chrom_euploidconfidence`,0)) AS `chrom_euploidconfidence_11`,cast(sum(if((`s`.`chrom` = 11),`s`.`segmented`,0)) as signed) AS `segmented_11`,cast(group_concat(if((`s`.`chrom` = 12),`s`.`bestsubhypothesis`,NULL) separator ',') as char(7) charset latin1) AS `bestsubhypothesis_12`,sum(if((`s`.`chrom` = 12),`s`.`chrom_euploidconfidence`,0)) AS `chrom_euploidconfidence_12`,cast(sum(if((`s`.`chrom` = 12),`s`.`segmented`,0)) as signed) AS `segmented_12`,cast(group_concat(if((`s`.`chrom` = 13),`s`.`bestsubhypothesis`,NULL) separator ',') as char(7) charset latin1) AS `bestsubhypothesis_13`,sum(if((`s`.`chrom` = 13),`s`.`chrom_euploidconfidence`,0)) AS `chrom_euploidconfidence_13`,cast(sum(if((`s`.`chrom` = 13),`s`.`segmented`,0)) as signed) AS `segmented_13`,cast(group_concat(if((`s`.`chrom` = 14),`s`.`bestsubhypothesis`,NULL) separator ',') as char(7) charset latin1) AS `bestsubhypothesis_14`,sum(if((`s`.`chrom` = 14),`s`.`chrom_euploidconfidence`,0)) AS `chrom_euploidconfidence_14`,cast(sum(if((`s`.`chrom` = 14),`s`.`segmented`,0)) as signed) AS `segmented_14`,cast(group_concat(if((`s`.`chrom` = 15),`s`.`bestsubhypothesis`,NULL) separator ',') as char(7) charset latin1) AS `bestsubhypothesis_15`,sum(if((`s`.`chrom` = 15),`s`.`chrom_euploidconfidence`,0)) AS `chrom_euploidconfidence_15`,cast(sum(if((`s`.`chrom` = 15),`s`.`segmented`,0)) as signed) AS `segmented_15`,cast(group_concat(if((`s`.`chrom` = 16),`s`.`bestsubhypothesis`,NULL) separator ',') as char(7) charset latin1) AS `bestsubhypothesis_16`,sum(if((`s`.`chrom` = 16),`s`.`chrom_euploidconfidence`,0)) AS `chrom_euploidconfidence_16`,cast(sum(if((`s`.`chrom` = 16),`s`.`segmented`,0)) as signed) AS `segmented_16`,cast(group_concat(if((`s`.`chrom` = 17),`s`.`bestsubhypothesis`,NULL) separator ',') as char(7) charset latin1) AS `bestsubhypothesis_17`,sum(if((`s`.`chrom` = 17),`s`.`chrom_euploidconfidence`,0)) AS `chrom_euploidconfidence_17`,cast(sum(if((`s`.`chrom` = 17),`s`.`segmented`,0)) as signed) AS `segmented_17`,cast(group_concat(if((`s`.`chrom` = 18),`s`.`bestsubhypothesis`,NULL) separator ',') as char(7) charset latin1) AS `bestsubhypothesis_18`,sum(if((`s`.`chrom` = 18),`s`.`chrom_euploidconfidence`,0)) AS `chrom_euploidconfidence_18`,cast(sum(if((`s`.`chrom` = 18),`s`.`segmented`,0)) as signed) AS `segmented_18`,cast(group_concat(if((`s`.`chrom` = 19),`s`.`bestsubhypothesis`,NULL) separator ',') as char(7) charset latin1) AS `bestsubhypothesis_19`,sum(if((`s`.`chrom` = 19),`s`.`chrom_euploidconfidence`,0)) AS `chrom_euploidconfidence_19`,cast(sum(if((`s`.`chrom` = 19),`s`.`segmented`,0)) as signed) AS `segmented_19`,cast(group_concat(if((`s`.`chrom` = 20),`s`.`bestsubhypothesis`,NULL) separator ',') as char(7) charset latin1) AS `bestsubhypothesis_20`,sum(if((`s`.`chrom` = 20),`s`.`chrom_euploidconfidence`,0)) AS `chrom_euploidconfidence_20`,cast(sum(if((`s`.`chrom` = 20),`s`.`segmented`,0)) as signed) AS `segmented_20`,cast(group_concat(if((`s`.`chrom` = 21),`s`.`bestsubhypothesis`,NULL) separator ',') as char(7) charset latin1) AS `bestsubhypothesis_21`,sum(if((`s`.`chrom` = 21),`s`.`chrom_euploidconfidence`,0)) AS `chrom_euploidconfidence_21`,cast(sum(if((`s`.`chrom` = 21),`s`.`segmented`,0)) as signed) AS `segmented_21`,cast(group_concat(if((`s`.`chrom` = 22),`s`.`bestsubhypothesis`,NULL) separator ',') as char(7) charset latin1) AS `bestsubhypothesis_22`,sum(if((`s`.`chrom` = 22),`s`.`chrom_euploidconfidence`,0)) AS `chrom_euploidconfidence_22`,cast(sum(if((`s`.`chrom` = 22),`s`.`segmented`,0)) as signed) AS `segmented_22`,cast(group_concat(if((`s`.`chrom` = 'SEX'),`s`.`bestsubhypothesis`,NULL) separator ',') as char(7) charset latin1) AS `bestsubhypothesis_Sex`,sum(if((`s`.`chrom` = 'SEX'),`s`.`chrom_euploidconfidence`,0)) AS `chrom_euploidconfidence_Sex`,cast(sum(if((`s`.`chrom` = 'SEX'),`s`.`segmented`,0)) as signed) AS `segmented_Sex` from `publishedreport_per_chrom` `s` group by `s`.`sampleid`,`s`.`report_id` */;;
/*!50001 SET character_set_client      = @saved_cs_client */;;
/*!50001 SET character_set_results     = @saved_cs_results */;;
/*!50001 SET collation_connection      = @saved_col_connection */;;
/*!50001 DROP TABLE IF EXISTS `redrawcases`*/;;
/*!50001 SET @saved_cs_client          = @@character_set_client */;;
/*!50001 SET @saved_cs_results         = @@character_set_results */;;
/*!50001 SET @saved_col_connection     = @@collation_connection */;;
/*!50001 SET character_set_client      = utf8 */;;
/*!50001 SET character_set_results     = utf8 */;;
/*!50001 SET collation_connection      = utf8_general_ci */;;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`gsnuser`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `redrawcases` AS select `cf`.`id` AS `Case id`,`cf`.`opened` AS `Opened`,`cf`.`testtype` AS `Test`,`o`.`name` AS `Clinic name`,`p`.`lastname` AS `Physician last name`,`pkit`.`barcode` AS `Kit barcode`,`pkit`.`received` AS `Kit received`,`rc`.`name` AS `Redraw reason`,`c`.`name` AS `Redraw categories`,`cl`.`created` AS `Contact date`,`cl`.`body` AS `Contact notes`,`cl`.`email` AS `Contact user`,`pkit`.`state` AS `Kit State` from (((((((((`parentkit` `pkit` join `casefile` `cf` on((`cf`.`id` = `pkit`.`casefile_id`))) left join `organization` `o` on((`cf`.`clinic_id` = `o`.`id`))) left join `provider` `p` on((`cf`.`physician_id` = `p`.`id`))) join `casefile_category` `cc` on((`cc`.`CaseFile_id` = `cf`.`id`))) join `category` `c` on((`c`.`id` = `cc`.`categories_id`))) join `parentkit_receipt` `pr` on((`pr`.`parentkit_id` = `pkit`.`id`))) join `kitreceipt` `r` on((`r`.`id` = `pr`.`receipt_id`))) join `reasoncode` `rc` on((`rc`.`id` = `r`.`redrawreason_id`))) left join `_contactlog` `cl` on((`cl`.`casefile_id` = `cf`.`id`))) where ((`cc`.`categories_id` in (109,110,163)) and isnull(`cf`.`closed`)) order by `cf`.`opened` */;;
/*!50001 SET character_set_client      = @saved_cs_client */;;
/*!50001 SET character_set_results     = @saved_cs_results */;;
/*!50001 SET collation_connection      = @saved_col_connection */;;
/*!50001 DROP TABLE IF EXISTS `redrawsummary`*/;;
/*!50001 SET @saved_cs_client          = @@character_set_client */;;
/*!50001 SET @saved_cs_results         = @@character_set_results */;;
/*!50001 SET @saved_col_connection     = @@collation_connection */;;
/*!50001 SET character_set_client      = utf8 */;;
/*!50001 SET character_set_results     = utf8 */;;
/*!50001 SET collation_connection      = utf8_general_ci */;;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`gsnuser`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `redrawsummary` AS select `c`.`id` AS `case_id`,`c`.`testtype` AS `test_type`,`o`.`name` AS `clinic_name`,`k`.`barcode` AS `kit_barcode`,`pr`.`familyposition` AS `subject_type`,if((cast(`k`.`barcode` as unsigned) = cast(`bp`.`barcode` as unsigned)),`bp`.`gestationalage`,NULL) AS `gestional_age`,`r`.`received` AS `received`,`r`.`redrawn` AS `redrawn`,`cc`.`name` AS `redraw_reason` from ((((((`parentkit_receipt` `pr` join `parentkit` `k` on((`k`.`id` = `pr`.`parentkit_id`))) join `kitreceipt` `r` on((`r`.`id` = `pr`.`receipt_id`))) join `casefile` `c` on((`c`.`id` = `k`.`casefile_id`))) left join `organization` `o` on((`o`.`id` = `c`.`clinic_id`))) left join `blastomereplate` `bp` on((`bp`.`casefile_id` = `c`.`id`))) left join `reasoncode` `cc` on((`cc`.`id` = `r`.`redrawreason_id`))) group by `k`.`barcode`,`pr`.`familyposition` */;;
/*!50001 SET character_set_client      = @saved_cs_client */;;
/*!50001 SET character_set_results     = @saved_cs_results */;;
/*!50001 SET collation_connection      = @saved_col_connection */;;
/*!50001 DROP TABLE IF EXISTS `reportsummary`*/;;
/*!50001 SET @saved_cs_client          = @@character_set_client */;;
/*!50001 SET @saved_cs_results         = @@character_set_results */;;
/*!50001 SET @saved_col_connection     = @@collation_connection */;;
/*!50001 SET character_set_client      = latin1 */;;
/*!50001 SET character_set_results     = latin1 */;;
/*!50001 SET collation_connection      = latin1_swedish_ci */;;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`gsnuser`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `reportsummary` AS select `c`.`id` AS `casefile id`,if(((`nr`.`triploidy_ordered` = 1) and (`c`.`testtype` = 'NPT')),'yes','') AS `triploidy ordered`,`c`.`thirdpartyid` AS `third-party case id`,`pf`.`alternate_case_id` AS `alternate_case_id`,`r`.`report_id` AS `report id`,`r`.`paternity_report_id` AS `paternity report id`,concat(`ph`.`firstname`,' ',`ph`.`lastname`) AS `Physician name`,`c`.`testtype` AS `Product`,if((sum((case `cg`.`categorygroup_id` when 3 then 1 else 0 end)) > 0),'yes','') AS `billable`,if((sum((case `cg`.`categorygroup_id` when 4 then 1 else 0 end)) > 0),'yes','') AS `non-billable`,`pf`.`payment_plan` AS `Payment Plan`,if(((sum(if((`cc`.`categories_id` = 51),1,0)) > 0) and (sum(if((`cc`.`categories_id` = 46),1,0)) = 0) and (sum(if((`cc`.`categories_id` = 47),1,0)) = 0)),'yes','') AS `Day 5 bx w/freezing`,if(((sum(if((`cc`.`categories_id` = 51),1,0)) > 0) and ((sum(if((`cc`.`categories_id` = 46),1,0)) > 0) or (sum(if((`cc`.`categories_id` = 47),1,0)) > 0))),'yes','') AS `Day 5 bx w/fresh transfer`,if((sum((case `cc`.`categories_id` when 54 then 1 else 0 end)) > 0),'yes','') AS `translocation`,if((sum((case `cc`.`categories_id` when 75 then 1 else 0 end)) > 0),'yes','') AS `additional parent`,if((sum((case `cc`.`categories_id` when 53 then 1 else 0 end)) > 0),'yes','') AS `embryo batching`,(select count(0) from ((`blastomereplate` `bp` join `blastomereplate_sample` `bs` on((`bs`.`blastomereplates_id` = `bp`.`id`))) join `sample` `s` on((`bs`.`samplelist_id` = `s`.`id`))) where ((`bp`.`casefile_id` = `c`.`id`) and (`s`.`sampletype_id` <> 16))) AS `number of embryos excl. re-bx`,if((sum((case `cc`.`categories_id` when 76 then 1 else 0 end)) > 0),'yes','') AS `special billing`,`opp`.`name` AS `pricing plan`,`opp`.`validfrom` AS `pricing plan valid from`,`opp`.`billtotype` AS `pricing plan bill-to`,(case `c`.`testtype` when 'PRODUCT_1' then 'Aneuploidy' when 'PRODUCT_1_2' then 'Single Gene' when 'SINGLE_GENE_PLUS_21' then 'Single Gene' when 'PRODUCT_POC' then 'POC' when 'PARAFFIN_POC' then 'POC' when 'PATERNITY' then 'Paternity' when 'CARRIER_SCREENING' then 'Carrier Screening' when 'NPT' then 'NPT' when 'PRODUCT_4' then 'Product 4' else 'OTHER' end) AS `productFamily`,if((`c`.`testtype` = 'CARRIER_SCREENING'),bit_or((case `cc`.`categories_id` when 180 then 1 when 121 then 2 when 181 then 4 when 130 then 8 when 131 then 16 else 0 end)),`c`.`testtype`) AS `subTestType`,if((sum((case `cc`.`categories_id` when 180 then 1 else 0 end)) > 0),'yes','') AS `cs ashkenazi jewish`,if((sum((case `cc`.`categories_id` when 121 then 1 else 0 end)) > 0),'yes','') AS `cs cystic fibrosis`,if((sum((case `cc`.`categories_id` when 181 then 1 else 0 end)) > 0),'yes','') AS `cs cystic fibrosis external`,if((sum((case `cc`.`categories_id` when 130 then 1 else 0 end)) > 0),'yes','') AS `cs fragile x`,if((sum((case `cc`.`categories_id` when 131 then 1 else 0 end)) > 0),'yes','') AS `cs spinal muscular atrophy`,`o`.`id` AS `clinic_id`,`o`.`name` AS `clinic`,`st`.`name` AS `satellite territory`,`cl`.`territory name` AS `clinic territory`,if(isnull(`st`.`name`),`cl`.`territory name`,`st`.`name`) AS `territory`,`cl`.`director cfs email` AS `clinic specialist`,`cl`.`state` AS `clinic state`,`cl`.`country` AS `clinic country`,`sci`.`street1` AS `satellite_street1`,`sci`.`street2` AS `satellite_street2`,`sci`.`city` AS `satellite_city`,`sci`.`state` AS `satellite_state`,`sci`.`country` AS `satellite_country`,`r`.`sentto` AS `sent to`,`r`.`senton` AS `delivered date`,date_format(`r`.`senton`,'%Y-%m') AS `delivered month`,`c`.`opened` AS `opened date`,if((((select count(0) from (((`parentkit` `pkit` join `parentkit_sample` `pks` on((`pks`.`parentkit_id` = `pkit`.`id`))) join `sample` `smp` on((`pks`.`sample_id` = `smp`.`id`))) join `family_subject` `famsub` on(((`famsub`.`members_id` = `smp`.`subject_id`) and (`famsub`.`familyPosition` = 'patient')))) where ((`pkit`.`casefile_id` = `c`.`id`) and (`c`.`testtype` = 'PATERNITY') and (`famsub`.`families_id` = `c`.`family_id`))) = 0) and (`c`.`testtype` = 'PATERNITY')),'yes','no') AS `Paternity AFN Case` from ((((((((((((((((((((`casefile` `c` join `organization` `o` on((`o`.`id` = `c`.`clinic_id`))) join `casefile_cncreportshipmentrecord` `cr` on((`cr`.`CaseFile_id` = `c`.`id`))) join `cncreportshipmentrecord` `r` on((`r`.`id` = `cr`.`cncreportshipmentrecords_id`))) left join `npt_report` `nr` on((`nr`.`id` = `r`.`npt_report_id`))) left join `blastomereplate` `bp` on((`bp`.`casefile_id` = `c`.`id`))) left join `blastomereplate_sample` `bs` on((`bs`.`blastomereplates_id` = `bp`.`id`))) join `family` `fam` on((`c`.`family_id` = `fam`.`id`))) join `family_subject` `fs` on((`fs`.`families_id` = `fam`.`id`))) join `subject` `patient` on(((`fs`.`members_id` = `patient`.`id`) and (`fs`.`familyPosition` = 'patient')))) left join `subject_contactinfo` `psci` on((`psci`.`Subject_id` = `patient`.`id`))) left join `contactinfo` `pci` on((`psci`.`addresses_id` = `pci`.`id`))) left join `casefile_category` `cc` on((`cc`.`CaseFile_id` = `c`.`id`))) left join `categorygroup_category` `cg` on((`cg`.`category_id` = `cc`.`categories_id`))) left join `provider` `ph` on((`ph`.`id` = `c`.`physician_id`))) left join `paternity_fields` `pf` on((`c`.`paternity_fields_id` = `pf`.`id`))) left join `clinicinforeport` `cl` on((`cl`.`id` = `c`.`clinic_id`))) left join `contactinfo` `sci` on((`c`.`satelliteaddress_id` = `sci`.`id`))) left join `_contactinfolatestterritory` `ct` on((`ct`.`contactinfo_id` = `c`.`satelliteaddress_id`))) left join `territory` `st` on((`st`.`id` = `ct`.`territory_id`))) left join `_orglatestorgpricingplan` `opp` on(((`c`.`clinic_id` = `opp`.`org_id`) and (`c`.`testtype` = `opp`.`testtype`)))) where ((`r`.`published` is true) and (isnull(`nr`.`result_code`) or (`nr`.`result_code` in ('LOW_RISK_RESULT','HIGH_RISK_RESULT','SINGLE_CHROM_HAPLOBLOCK_MATERNAL','SINGLE_CHROM_HAPLOBLOCK_FETAL','SINGLE_CHROM_MATERNAL_DEL_DUP','SINGLE_CHROM_MATERNAL_ANEUPLOIDY','SINGLE_CHROM_LOW_CONF','STATS_NO_CALL_OTHER_SINGLE_CHROM','ABNORMAL_RESULT_SINGLE_CHROM','HIGH_RISK_WITH_SINGLE_CHROM_NO_CALL','SUSPECTED_XXY','SUSPECTED_XXX','SUSPECTED_XYY')) or ((`nr`.`triploidy_ordered` = 1) and (`nr`.`result_code` in ('SUSPECTED_MULTIPLE_GESTATION_OR_TRIPLOIDY','SUSPECTED_MATERNAL_TRIPLOIDY')))) and (isnull(`nr`.`microdel_result_code`) or (`nr`.`microdel_result_code` <> 'MICRODELETION_PANEL_PENDING'))) group by `c`.`id` order by `r`.`senton` */;;
/*!50001 SET character_set_client      = @saved_cs_client */;;
/*!50001 SET character_set_results     = @saved_cs_results */;;
/*!50001 SET collation_connection      = @saved_col_connection */;;
/*!50001 DROP TABLE IF EXISTS `rerun_reflex_by_sample`*/;;
/*!50001 SET @saved_cs_client          = @@character_set_client */;;
/*!50001 SET @saved_cs_results         = @@character_set_results */;;
/*!50001 SET @saved_col_connection     = @@collation_connection */;;
/*!50001 SET character_set_client      = utf8 */;;
/*!50001 SET character_set_results     = utf8 */;;
/*!50001 SET collation_connection      = utf8_general_ci */;;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `rerun_reflex_by_sample` AS select min(`sr`.`rundate`) AS `rundate`,`ss`.`samplebarcode` AS `samplebarcode`,(sum(if((`ss`.`intendeddepthofread` in ('DOR_NPT_PLASMA_RAPID_RUN_48_SAMPLES','DOR_NPT_PLASMA_STANDARD_RAPID_RUN','DOR_NPT_PLASMA_STANDARD')),1,0)) - 1) AS `LDOR_reruns`,sum(if((`ss`.`intendeddepthofread` in ('DOR_NPT_PLASMA_HIGH_RAPID_RUN','DOR_NPT_PLASMA_HIGH')),1,0)) AS `HDOR_reruns`,count(0) AS `cnt` from (`hts`.`sequencingsample` `ss` join `hts`.`sequencingrun` `sr` on((`sr`.`id` = `ss`.`run_id`))) where ((left(`ss`.`project`,2) = 'HS') and (`ss`.`sampletype` = 'free_floating_dna')) group by `ss`.`samplebarcode` having min((`sr`.`rundate` > '2013-09-01')) */;;
/*!50001 SET character_set_client      = @saved_cs_client */;;
/*!50001 SET character_set_results     = @saved_cs_results */;;
/*!50001 SET collation_connection      = @saved_col_connection */;;
/*!50001 DROP TABLE IF EXISTS `sample_rootsample`*/;;
/*!50001 SET @saved_cs_client          = @@character_set_client */;;
/*!50001 SET @saved_cs_results         = @@character_set_results */;;
/*!50001 SET @saved_col_connection     = @@collation_connection */;;
/*!50001 SET character_set_client      = utf8 */;;
/*!50001 SET character_set_results     = utf8 */;;
/*!50001 SET collation_connection      = utf8_general_ci */;;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`gsnuser`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `sample_rootsample` AS select `leaf`.`id` AS `id`,coalesce(`sp3`.`source_id`,`sp2`.`source_id`,`sp1`.`source_id`,`leaf`.`id`) AS `rootsample_id` from (((`sample` `leaf` left join `sample_preparation` `sp1` on(((`leaf`.`id` = `sp1`.`prep_id`) and (`sp1`.`isprimary` <=> 1)))) left join `sample_preparation` `sp2` on(((`sp1`.`source_id` = `sp2`.`prep_id`) and (`sp2`.`isprimary` <=> 1)))) left join `sample_preparation` `sp3` on(((`sp2`.`source_id` = `sp3`.`prep_id`) and (`sp3`.`isprimary` <=> 1)))) */;;
/*!50001 SET character_set_client      = @saved_cs_client */;;
/*!50001 SET character_set_results     = @saved_cs_results */;;
/*!50001 SET collation_connection      = @saved_col_connection */;;
/*!50001 DROP TABLE IF EXISTS `samplerun`*/;;
/*!50001 SET @saved_cs_client          = @@character_set_client */;;
/*!50001 SET @saved_cs_results         = @@character_set_results */;;
/*!50001 SET @saved_col_connection     = @@collation_connection */;;
/*!50001 SET character_set_client      = utf8 */;;
/*!50001 SET character_set_results     = utf8 */;;
/*!50001 SET collation_connection      = utf8_general_ci */;;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`gsnuser`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `samplerun` AS select `prs`.`sample_id` AS `barcode`,min(str_to_date(`pr`.`report_date`,_latin1'%M %e, %Y')) AS `run_date`,sum(if((`prs`.`interpretation` = _latin1'Insufficient fetal DNA for reliable analysis'),0,1)) AS `run_status` from (`paternity_report_subject` `prs` join `paternity_report` `pr` on((`pr`.`id` = `prs`.`report_id`))) where (`prs`.`DTYPE` = _latin1'Child') group by `prs`.`sample_id` */;;
/*!50001 SET character_set_client      = @saved_cs_client */;;
/*!50001 SET character_set_results     = @saved_cs_results */;;
/*!50001 SET collation_connection      = @saved_col_connection */;;
/*!50001 DROP TABLE IF EXISTS `sequencingrunsummary`*/;;
/*!50001 SET @saved_cs_client          = @@character_set_client */;;
/*!50001 SET @saved_cs_results         = @@character_set_results */;;
/*!50001 SET @saved_col_connection     = @@collation_connection */;;
/*!50001 SET character_set_client      = utf8 */;;
/*!50001 SET character_set_results     = utf8 */;;
/*!50001 SET collation_connection      = utf8_general_ci */;;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `sequencingrunsummary` AS select `ss`.`id` AS `Sequencing Sample Id`,`smp`.`barcode` AS `Sample barcode`,`sr`.`runid` AS `Sequencing Run Id`,`sr`.`rundate` AS `Sequencing Run Date`,`sr`.`flowcellid` AS `Run Flow Cell`,`sr`.`instrumentclass` AS `Run Instrument`,group_concat(distinct `c`.`id` separator ',') AS `Case(s)`,if((sum(if(((`ccat`.`categories_id` = 118) or (`ccat`.`categories_id` = 162)),1,0)) > 0),'yes','no') AS `Prenatus`,if((sum(if((`ccat`.`categories_id` = 62),1,0)) > 0),'yes','no') AS `NIPT Research`,if((sum(if((`ccat`.`categories_id` = 167),1,0)) > 0),'yes','no') AS `NIPT Bridging Study`,`ts`.`name` AS `Target Set`,min(`c`.`opened`) AS `Earliest Case Open Date`,group_concat(distinct `c`.`testtype` separator ',') AS `Test Type(s)`,`fs`.`familyPosition` AS `Family Position`,`st`.`displayname` AS `Sample Type`,`rt`.`received` AS `Root Sample Receive Date`,`smp`.`prepped` AS `Prep Date`,`t`.`name` AS `Territory Name` from (((((((((((`hts`.`sequencingsample` `ss` left join `hts`.`sequencingrun` `sr` on((`ss`.`run_id` = `sr`.`id`))) left join `hts`.`sequencingtargetset` `ts` on((`ss`.`targetset_id` = `ts`.`id`))) left join `prodlims`.`sample` `smp` on((`ss`.`sample_id` = `smp`.`id`))) left join `prodlims`.`sampletype` `st` on((`smp`.`sampletype_id` = `st`.`id`))) left join `prodlims`.`sample_rootsample` `srs` on((`srs`.`id` = `smp`.`id`))) left join `prodlims`.`sample` `rt` on((`rt`.`id` = `srs`.`rootsample_id`))) left join `prodlims`.`family_subject` `fs` on((`fs`.`members_id` = `rt`.`subject_id`))) left join `prodlims`.`family` `f` on((`fs`.`families_id` = `f`.`id`))) left join `prodlims`.`casefile` `c` on((`c`.`family_id` = `f`.`id`))) left join `prodlims`.`casefile_category` `ccat` on((`ccat`.`CaseFile_id` = `c`.`id`))) left join `prodlims`.`territory` `t` on((`t`.`id` = `c`.`historicterritory_id`))) group by `ss`.`id` */;;
/*!50001 SET character_set_client      = @saved_cs_client */;;
/*!50001 SET character_set_results     = @saved_cs_results */;;
/*!50001 SET collation_connection      = @saved_col_connection */;;
/*!50001 DROP TABLE IF EXISTS `sequencingsample_barcodingplate`*/;;
/*!50001 SET @saved_cs_client          = @@character_set_client */;;
/*!50001 SET @saved_cs_results         = @@character_set_results */;;
/*!50001 SET @saved_col_connection     = @@collation_connection */;;
/*!50001 SET character_set_client      = utf8 */;;
/*!50001 SET character_set_results     = utf8 */;;
/*!50001 SET collation_connection      = utf8_general_ci */;;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `sequencingsample_barcodingplate` AS select `hts`.`sequencingsample`.`id` AS `sequencingsample_id`,`hts`.`sequencingsample`.`samplebarcode` AS `samplebarcode`,`hts`.`sequencingsample`.`sequencingbarcode` AS `sequencingbarcode`,`hts`.`sequencingsample`.`lane` AS `lane`,`samplepool`.`id` AS `samplepool_id`,`samplepool`.`barcode` AS `samplepool_barcode`,`hts`.`sequencingrun`.`runid` AS `runid`,`barplate`.`id` AS `barcodingplate_id`,`barplate`.`barcode` AS `barcodingplate_barcode`,`barplate_pws`.`position` AS `barcodingplate_sampleposition` from ((((((((`hts`.`sequencingsample` join `hts`.`sequencingrun` on((`hts`.`sequencingrun`.`id` = `hts`.`sequencingsample`.`run_id`))) join `hts`.`sequencingrun_samplepool` on(((`hts`.`sequencingrun`.`id` = `hts`.`sequencingrun_samplepool`.`sequencingrun_id`) and (`hts`.`sequencingsample`.`lane` = `hts`.`sequencingrun_samplepool`.`lane`)))) join `prodlims`.`npt_plate` `samplepool` on((`samplepool`.`id` = `hts`.`sequencingrun_samplepool`.`npt_plate_id`))) join `prodlims`.`npt_plate_sequencingbarcode_platewellsample` on((`prodlims`.`npt_plate_sequencingbarcode_platewellsample`.`npt_plate_id` = `samplepool`.`id`))) join `hts`.`sequencingbarcode` on(((`hts`.`sequencingbarcode`.`id` = `prodlims`.`npt_plate_sequencingbarcode_platewellsample`.`sequencingbarcode_id`) and (`hts`.`sequencingbarcode`.`idx` = `hts`.`sequencingsample`.`sequencingbarcode`)))) join `prodlims`.`platewellsample` `pool_pws` on((`pool_pws`.`id` = `prodlims`.`npt_plate_sequencingbarcode_platewellsample`.`platewellsample_id`))) join `prodlims`.`npt_plate` `barplate` on((`pool_pws`.`sourceplate_id` = `barplate`.`id`))) join `prodlims`.`npt_plate_platewellsample` `barplate_pws` on(((`barplate_pws`.`position` = `pool_pws`.`sourceposition_id`) and (`barplate_pws`.`npt_plate_id` = `barplate`.`id`)))) */;;
/*!50001 SET character_set_client      = @saved_cs_client */;;
/*!50001 SET character_set_results     = @saved_cs_results */;;
/*!50001 SET collation_connection      = @saved_col_connection */;;
/*!50001 DROP TABLE IF EXISTS `territoryinforeport`*/;;
/*!50001 SET @saved_cs_client          = @@character_set_client */;;
/*!50001 SET @saved_cs_results         = @@character_set_results */;;
/*!50001 SET @saved_col_connection     = @@collation_connection */;;
/*!50001 SET character_set_client      = utf8 */;;
/*!50001 SET character_set_results     = utf8 */;;
/*!50001 SET collation_connection      = utf8_general_ci */;;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`gsnuser`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `territoryinforeport` AS select `t`.`id` AS `territory id`,`t`.`name` AS `territory name`,`u`.`id` AS `director cfs id`,`u`.`email` AS `director cfs email` from ((`_territorylatestdirector` `tld` join `territory` `t` on((`tld`.`terr_id` = `t`.`id`))) join `user` `u` on((`tld`.`director_id` = `u`.`id`))) */;;
/*!50001 SET character_set_client      = @saved_cs_client */;;
/*!50001 SET character_set_results     = @saved_cs_results */;;
/*!50001 SET collation_connection      = @saved_col_connection */;;

USE `hts`;;
/*!50001 DROP TABLE IF EXISTS `sequencingsample_prodsample`*/;;
/*!50001 SET @saved_cs_client          = @@character_set_client */;;
/*!50001 SET @saved_cs_results         = @@character_set_results */;;
/*!50001 SET @saved_col_connection     = @@collation_connection */;;
/*!50001 SET character_set_client      = utf8 */;;
/*!50001 SET character_set_results     = utf8 */;;
/*!50001 SET collation_connection      = utf8_general_ci */;;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`gsnuser`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `sequencingsample_prodsample` AS select distinct `hts`.`sequencingsample`.`id` AS `id`,coalesce(`s`.`id`,`dnas`.`id`) AS `prodsample_id`,`sample_rootsample`.`rootsample_id` AS `rootsample_id` from (((`hts`.`sequencingsample` left join `prodlims`.`sample` `s` on((`s`.`barcode` = `hts`.`sequencingsample`.`samplebarcode`))) left join `prodlims`.`sample` `dnas` on((`dnas`.`dnabarcode` = `hts`.`sequencingsample`.`samplebarcode`))) join `prodlims`.`sample_rootsample` on((`sample_rootsample`.`id` = `s`.`id`))) */;;
/*!50001 SET character_set_client      = @saved_cs_client */;;
/*!50001 SET character_set_results     = @saved_cs_results */;;
/*!50001 SET collation_connection      = @saved_col_connection */;;
/*!50001 DROP TABLE IF EXISTS `sif_seqsamples_results`*/;;
/*!50001 SET @saved_cs_client          = @@character_set_client */;;
/*!50001 SET @saved_cs_results         = @@character_set_results */;;
/*!50001 SET @saved_col_connection     = @@collation_connection */;;
/*!50001 SET character_set_client      = latin1 */;;
/*!50001 SET character_set_results     = latin1 */;;
/*!50001 SET collation_connection      = latin1_swedish_ci */;;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`statsadmin`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `sif_seqsamples_results` AS select `sif`.`id` AS `sif_id`,`sif`.`casefile_id` AS `casefile_id`,`snap_mom`.`sequencingsample_id` AS `mom_seq_id`,`snap_child`.`sequencingsample_id` AS `child_seq_id`,`snap_dad`.`sequencingsample_id` AS `dad_seq_id`,`qcr`.`result` AS `rollup_result`,if(isnull(`ar_het`.`id`),0,1) AS `has_het_result`,if(isnull(`ar_y`.`id`),0,1) AS `has_y_result`,if(isnull(`ar_counting`.`id`),0,1) AS `has_counting_result`,if(isnull(`hr_sif`.`handcallresult_id`),0,1) AS `has_handcall` from ((((((((`prodlims`.`alg_sequencinginitfile` `sif` join `prodlims`.`alg_samplemetadatasnapshot` `snap_mom` on(((`sif`.`id` = `snap_mom`.`sequencinginitfile_id`) and (`snap_mom`.`familyPosition` = 'Patient')))) join `prodlims`.`alg_samplemetadatasnapshot` `snap_child` on(((`sif`.`id` = `snap_child`.`sequencinginitfile_id`) and (`snap_child`.`familyPosition` = 'Child')))) left join `prodlims`.`alg_samplemetadatasnapshot` `snap_dad` on(((`sif`.`id` = `snap_dad`.`sequencinginitfile_id`) and (`snap_dad`.`familyPosition` = 'Partner')))) left join `prodlims`.`qc_rollup` `qcr` on((`qcr`.`sequencinginitfile_id` = `sif`.`id`))) left join `prodlims`.`alg_algorithmresult` `ar_het` on(((`sif`.`id` = `ar_het`.`sequencinginitfile_id`) and (`ar_het`.`state` = 'VALID') and `ar_het`.`version_id` in (select `hts`.`code_version`.`id` from `hts`.`code_version` where (`hts`.`code_version`.`algorithm` = 'NPT_HETRATE'))))) left join `prodlims`.`alg_algorithmresult` `ar_y` on(((`sif`.`id` = `ar_y`.`sequencinginitfile_id`) and (`ar_y`.`state` = 'VALID') and `ar_y`.`version_id` in (select `hts`.`code_version`.`id` from `hts`.`code_version` where (`hts`.`code_version`.`algorithm` = 'NPT_Y'))))) left join `prodlims`.`alg_algorithmresult` `ar_counting` on(((`sif`.`id` = `ar_counting`.`sequencinginitfile_id`) and (`ar_counting`.`state` = 'VALID') and `ar_counting`.`version_id` in (select `hts`.`code_version`.`id` from `hts`.`code_version` where (`hts`.`code_version`.`algorithm` = 'NPT_COUNTING'))))) left join `prodlims`.`npt_handcallresult_sequencinginitfile` `hr_sif` on((`sif`.`id` = `hr_sif`.`sequencinginitfile_id`))) */;;
/*!50001 SET character_set_client      = @saved_cs_client */;;
/*!50001 SET character_set_results     = @saved_cs_results */;;
/*!50001 SET collation_connection      = @saved_col_connection */;;
/*!50001 DROP TABLE IF EXISTS `statssample`*/;;
/*!50001 SET @saved_cs_client          = @@character_set_client */;;
/*!50001 SET @saved_cs_results         = @@character_set_results */;;
/*!50001 SET @saved_col_connection     = @@collation_connection */;;
/*!50001 SET character_set_client      = utf8 */;;
/*!50001 SET character_set_results     = utf8 */;;
/*!50001 SET collation_connection      = utf8_general_ci */;;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`gsnuser`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `statssample` AS select `hts`.`sequencingsample`.`id` AS `id`,`hts`.`sequencingsample`.`allelecountcsvpath` AS `allelecountcsvpath`,`hts`.`sequencingsample`.`lane` AS `lane`,`hts`.`sequencingsample`.`mappedreads` AS `mappedreads`,`hts`.`sequencingsample`.`mediandor` AS `mediandor`,`hts`.`sequencingsample`.`modelingplasmasample` AS `modelingplasmasample`,`hts`.`sequencingsample`.`project` AS `project`,`hts`.`sequencingsample`.`sampleid` AS `sampleid`,`hts`.`sequencingsample`.`sampleprepnotes` AS `sampleprepnotes`,`hts`.`sequencingsample`.`samplestate` AS `samplestate`,`hts`.`sequencingsample`.`sampletype` AS `sampletype`,`hts`.`sequencingsample`.`sequencingbarcode` AS `sequencingbarcode`,`hts`.`sequencingsample`.`sequencingfailed` AS `sequencingfailed`,`hts`.`sequencingsample`.`failurereason` AS `failurereason`,`hts`.`sequencingsample`.`sequencingresultnotes` AS `sequencingresultnotes`,`hts`.`sequencingsample`.`totalreads` AS `totalreads`,`hts`.`sequencingsample`.`useforgenotypetruth` AS `useforgenotypetruth`,`hts`.`sequencingsample`.`run_id` AS `run_id`,`hts`.`sequencingsample`.`subject_id` AS `subject_id`,`hts`.`sequencingsample`.`targetset_id` AS `targetset_id`,`hts`.`sequencingsample`.`samplebarcode` AS `samplebarcode`,`hts`.`sequencingsubject`.`familyid` AS `familyid`,`hts`.`sequencingsubject`.`familyposition` AS `familyposition`,`hts`.`sequencingsubject`.`subjectid` AS `subjectid`,`hts`.`sequencingtargetset`.`name` AS `targetset`,`prodlims`.`sample`.`id` AS `prodsampleid`,`prodlims`.`sample`.`barcode` AS `prodsamplebarcode`,`prodlims`.`sample`.`npdafterampconc` AS `npdafterampconc`,`prodlims`.`sample`.`npdafterpurificationconc` AS `npdafterpurificationconc`,`prodlims`.`sample`.`npdnormalizedpurifiedlibraryconc` AS `npdnormalizedpurifiedlibraryconc`,`prodlims`.`sample`.`npdplasmavolume` AS `npdplasmavolume`,`prodlims`.`sample`.`npdlabisgood` AS `npdlabisgood`,`prodlims`.`subject`.`id` AS `prodsubjectid`,coalesce(`prodlims`.`karyotype`.`ploidyType`,_latin1'PUTATIVE_EUPLOID') AS `isnormal`,`prodlims`.`karyotype`.`notes` AS `notes`,`prodlims`.`karyotype`.`source` AS `source`,`prodlims`.`karyotype`.`sexchromosomestring` AS `sexchromosomestring`,if(isnull(`prodlims`.`karyotype`.`id`),NULL,if(isnull(`chr1`.`chromosomecount`),2,`chr1`.`chromosomecount`)) AS `chr1_copynumber`,if(isnull(`prodlims`.`karyotype`.`id`),NULL,if(isnull(`chr2`.`chromosomecount`),2,`chr2`.`chromosomecount`)) AS `chr2_copynumber`,if(isnull(`prodlims`.`karyotype`.`id`),NULL,if(isnull(`chr13`.`chromosomecount`),2,`chr13`.`chromosomecount`)) AS `chr13_copynumber`,if(isnull(`prodlims`.`karyotype`.`id`),NULL,if(isnull(`chr18`.`chromosomecount`),2,`chr18`.`chromosomecount`)) AS `chr18_copynumber`,if(isnull(`prodlims`.`karyotype`.`id`),NULL,if(isnull(`chr21`.`chromosomecount`),2,`chr21`.`chromosomecount`)) AS `chr21_copynumber`,(case `prodlims`.`karyotype`.`sexchromosomestring` when '??' then NULL when 'X?' then 1 when 'X' then 1 when 'XX' then 2 when 'XY' then 1 when 'XXX' then 3 when 'XXY' then 2 when 'XYY' then 1 when 'XXYY' then 2 when 'XXXY' then 3 else NULL end) AS `sexchromosomecount_X`,(case `prodlims`.`karyotype`.`sexchromosomestring` when '??' then NULL when 'X?' then NULL when 'X' then 0 when 'XX' then 0 when 'XY' then 1 when 'XXX' then 0 when 'XXY' then 1 when 'XYY' then 2 when 'XXYY' then 2 when 'XXXY' then 1 else NULL end) AS `sexchromosomecount_Y`,`chr1`.`notes` AS `chr1_notes`,`chr2`.`notes` AS `chr2_notes`,`chr13`.`notes` AS `chr13_notes`,`chr18`.`notes` AS `chr18_notes`,`chr21`.`notes` AS `chr21_notes`,`prodlims`.`blastomereplate`.`gestationalage` AS `gestationalage`,`spike_ratio`.`value` AS `spike_ratio`,`child_fraction`.`value` AS `child_fraction`,`amb_contam`.`value` AS `amb_contam`,`geno_contam`.`value` AS `geno_contam`,`hts`.`sequencingsample`.`mappedreads` AS `num_mapped_reads` from (((((((((((((((((`hts`.`sequencingsample` left join `hts`.`sequencingsample_prodsample` `x` on((`x`.`id` = `hts`.`sequencingsample`.`id`))) left join `hts`.`sequencingsubject` on((`hts`.`sequencingsample`.`subject_id` = `hts`.`sequencingsubject`.`id`))) left join `hts`.`sequencingtargetset` on((`hts`.`sequencingtargetset`.`id` = `hts`.`sequencingsample`.`targetset_id`))) left join `prodlims`.`sample` on((`x`.`rootsample_id` = `prodlims`.`sample`.`id`))) left join `prodlims`.`subject` on((`prodlims`.`sample`.`subject_id` = `prodlims`.`subject`.`id`))) left join `prodlims`.`karyotype` on((`prodlims`.`subject`.`karyotype_id` = `prodlims`.`karyotype`.`id`))) left join `prodlims`.`karyotypeentry` `chr1` on(((`prodlims`.`karyotype`.`id` = `chr1`.`entries_id`) and (`chr1`.`chromosome` = 1)))) left join `prodlims`.`karyotypeentry` `chr2` on(((`prodlims`.`karyotype`.`id` = `chr2`.`entries_id`) and (`chr2`.`chromosome` = 2)))) left join `prodlims`.`karyotypeentry` `chr13` on(((`prodlims`.`karyotype`.`id` = `chr13`.`entries_id`) and (`chr13`.`chromosome` = 13)))) left join `prodlims`.`karyotypeentry` `chr18` on(((`prodlims`.`karyotype`.`id` = `chr18`.`entries_id`) and (`chr18`.`chromosome` = 18)))) left join `prodlims`.`karyotypeentry` `chr21` on(((`prodlims`.`karyotype`.`id` = `chr21`.`entries_id`) and (`chr21`.`chromosome` = 21)))) left join `prodlims`.`blastomereplate_sample` on((`prodlims`.`sample`.`id` = `prodlims`.`blastomereplate_sample`.`samplelist_id`))) left join `prodlims`.`blastomereplate` on((`prodlims`.`blastomereplate_sample`.`blastomereplates_id` = `prodlims`.`blastomereplate`.`id`))) left join `prodlims`.`_sequencingsample_qc_statistics` `spike_ratio` on(((`hts`.`sequencingsample`.`id` = `spike_ratio`.`sequencingsample_id`) and (`spike_ratio`.`name` = _utf8'SPIKE_RATIO')))) left join `prodlims`.`_sequencingsample_qc_statistics` `amb_contam` on(((`hts`.`sequencingsample`.`id` = `amb_contam`.`sequencingsample_id`) and (`amb_contam`.`name` = _utf8'CONT_AMBIENT_PLASMA_MOM')))) left join `prodlims`.`_sequencingsample_qc_statistics` `geno_contam` on(((`hts`.`sequencingsample`.`id` = `geno_contam`.`sequencingsample_id`) and (`geno_contam`.`name` = _utf8'CONT_GENOTYPED_PLASMA_MOM')))) left join `prodlims`.`_sequencingsample_qc_statistics` `child_fraction` on(((`hts`.`sequencingsample`.`id` = `child_fraction`.`sequencingsample_id`) and (`child_fraction`.`name` = _utf8'CFE')))) group by `hts`.`sequencingsample`.`id` */;;
/*!50001 SET character_set_client      = @saved_cs_client */;;
/*!50001 SET character_set_results     = @saved_cs_results */;;
/*!50001 SET collation_connection      = @saved_col_connection */;;
/*!50001 DROP TABLE IF EXISTS `statssample_results`*/;;
/*!50001 SET @saved_cs_client          = @@character_set_client */;;
/*!50001 SET @saved_cs_results         = @@character_set_results */;;
/*!50001 SET @saved_col_connection     = @@collation_connection */;;
/*!50001 SET character_set_client      = utf8 */;;
/*!50001 SET character_set_results     = utf8 */;;
/*!50001 SET collation_connection      = utf8_general_ci */;;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`gsnuser`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `statssample_results` AS select `ss`.`id` AS `id`,`ss`.`allelecountcsvpath` AS `allelecountcsvpath`,`ss`.`lane` AS `lane`,`ss`.`mappedreads` AS `mappedreads`,`ss`.`mediandor` AS `mediandor`,`ss`.`modelingplasmasample` AS `modelingplasmasample`,`ss`.`project` AS `project`,`ss`.`sampleid` AS `sampleid`,`ss`.`sampleprepnotes` AS `sampleprepnotes`,`ss`.`samplestate` AS `samplestate`,`ss`.`sampletype` AS `sampletype`,`ss`.`sequencingbarcode` AS `sequencingbarcode`,`ss`.`sequencingfailed` AS `sequencingfailed`,`ss`.`failurereason` AS `failurereason`,`ss`.`sequencingresultnotes` AS `sequencingresultnotes`,`ss`.`totalreads` AS `totalreads`,`ss`.`useforgenotypetruth` AS `useforgenotypetruth`,`ss`.`run_id` AS `run_id`,`ss`.`subject_id` AS `subject_id`,`ss`.`targetset_id` AS `targetset_id`,`ss`.`samplebarcode` AS `samplebarcode`,`ss`.`familyid` AS `familyid`,`ss`.`familyposition` AS `familyposition`,`ss`.`subjectid` AS `subjectid`,`ss`.`targetset` AS `targetset`,`ss`.`prodsampleid` AS `prodsampleid`,`ss`.`prodsamplebarcode` AS `prodsamplebarcode`,`ss`.`npdafterampconc` AS `npdafterampconc`,`ss`.`npdafterpurificationconc` AS `npdafterpurificationconc`,`ss`.`npdnormalizedpurifiedlibraryconc` AS `npdnormalizedpurifiedlibraryconc`,`ss`.`npdplasmavolume` AS `npdplasmavolume`,`ss`.`npdlabisgood` AS `npdlabisgood`,`ss`.`prodsubjectid` AS `prodsubjectid`,`ss`.`isnormal` AS `isnormal`,`ss`.`notes` AS `notes`,`ss`.`source` AS `source`,`ss`.`sexchromosomestring` AS `sexchromosomestring`,`ss`.`chr1_copynumber` AS `chr1_copynumber`,`ss`.`chr2_copynumber` AS `chr2_copynumber`,`ss`.`chr13_copynumber` AS `chr13_copynumber`,`ss`.`chr18_copynumber` AS `chr18_copynumber`,`ss`.`chr21_copynumber` AS `chr21_copynumber`,`ss`.`sexchromosomecount_X` AS `sexchromosomecount_X`,`ss`.`sexchromosomecount_Y` AS `sexchromosomecount_Y`,`ss`.`chr1_notes` AS `chr1_notes`,`ss`.`chr2_notes` AS `chr2_notes`,`ss`.`chr13_notes` AS `chr13_notes`,`ss`.`chr18_notes` AS `chr18_notes`,`ss`.`chr21_notes` AS `chr21_notes`,`ss`.`gestationalage` AS `gestationalage`,`sr`.`id` AS `stats_result_id`,`sr`.`project_id` AS `project_id`,`sr`.`family_id` AS `family_id`,`sr`.`sequencing_sample_barcode` AS `sequencing_sample_barcode`,`sr`.`sample_barcode` AS `sample_barcode`,`sr`.`version` AS `version`,`sr`.`algorithm` AS `algorithm`,`sr`.`mother_project_id` AS `mother_project_id`,`sr`.`mother_sequence_sample_barcode` AS `mother_sequence_sample_barcode`,`sr`.`father_project_id` AS `father_project_id`,`sr`.`father_sequence_sample_barcode` AS `father_sequence_sample_barcode`,`sr`.`child_fraction` AS `child_fraction`,`sr`.`num_reads` AS `num_reads`,`sr`.`num_reads_training` AS `num_reads_training`,`sr`.`num_reads_mother` AS `num_reads_mother`,`sr`.`num_reads_father` AS `num_reads_father`,`sr`.`training_conf` AS `training_conf`,`sr`.`call_13` AS `call_13`,`sr`.`conf_13` AS `conf_13`,`sr`.`call_18` AS `call_18`,`sr`.`conf_18` AS `conf_18`,`sr`.`call_21` AS `call_21`,`sr`.`conf_21` AS `conf_21`,`sr`.`call_23` AS `call_23`,`sr`.`conf_23` AS `conf_23`,`sr`.`call_24` AS `call_24`,`sr`.`conf_24` AS `conf_24`,if((least(if(isnull(`sr`.`conf_13`),999,`sr`.`conf_13`),if(isnull(`sr`.`conf_18`),999,`sr`.`conf_18`),if(isnull(`sr`.`conf_21`),999,`sr`.`conf_21`),if(isnull(`sr`.`conf_23`),999,`sr`.`conf_23`),if(isnull(`sr`.`conf_24`),999,`sr`.`conf_24`)) >= 999),NULL,least(if(isnull(`sr`.`conf_13`),999,`sr`.`conf_13`),if(isnull(`sr`.`conf_18`),999,`sr`.`conf_18`),if(isnull(`sr`.`conf_21`),999,`sr`.`conf_21`),if(isnull(`sr`.`conf_23`),999,`sr`.`conf_23`),if(isnull(`sr`.`conf_24`),999,`sr`.`conf_24`))) AS `minconf`,`sr`.`is_good_stats` AS `is_good_stats`,`sr`.`spike_ratio` AS `spike_ratio`,`sr`.`leakage_rate` AS `leakage_rate`,`sr`.`contamination_rate` AS `contamination_rate`,`sr`.`beta_noise_parameter` AS `beta_noise_parameter` from (`hts`.`statssample` `ss` left join `hts`.`stats_results` `sr` on(((`sr`.`project_id` = `ss`.`project`) and (`sr`.`sequencing_sample_barcode` = `ss`.`sampleid`)))) */;;
/*!50001 SET character_set_client      = @saved_cs_client */;;
/*!50001 SET character_set_results     = @saved_cs_results */;;
/*!50001 SET collation_connection      = @saved_col_connection */;;

USE `auditlog`;;

USE `diseaseassociations`;;
/*!50001 DROP TABLE IF EXISTS `sequencex`*/;;
/*!50001 SET @saved_cs_client          = @@character_set_client */;;
/*!50001 SET @saved_cs_results         = @@character_set_results */;;
/*!50001 SET @saved_col_connection     = @@collation_connection */;;
/*!50001 SET character_set_client      = utf8 */;;
/*!50001 SET character_set_results     = utf8 */;;
/*!50001 SET collation_connection      = utf8_general_ci */;;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`gsnuser`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `sequencex` AS select `seq`.`id` AS `id`,`seq`.`experiment` AS `experiment`,`seq`.`sequenceplate_id` AS `sequenceplate_id`,`seq`.`sample_id` AS `sample_id`,`seq`.`sample_db` AS `sample_db`,`seq`.`primerpair_id` AS `primerpair_id`,`seq`.`direction` AS `direction`,`seq`.`filename` AS `filename`,`seq`.`well` AS `well`,`seq`.`LOR` AS `LOR`,`seq`.`snr` AS `snr`,`seq`.`score` AS `score`,`seq`.`version` AS `version`,`seq`.`aligned_allowance` AS `aligned_allowance`,`seq`.`aligned_length` AS `aligned_length`,`seq`.`failed` AS `failed`,`seq`.`created` AS `created`,`seq`.`sequenceprimer_id` AS `sequenceprimer_id`,`seq`.`analysisProtocol` AS `analysisProtocol`,if((`seq`.`sequenceprimer_id` is not null),`seq`.`sequenceprimer_id`,if((`seq`.`direction` = _latin1'F'),`amptarget`.`fwd_id`,`amptarget`.`rev_id`)) AS `derived_sequenceprimer_id` from ((`sequence` `seq` join `primerpair` on((`seq`.`primerpair_id` = `primerpair`.`id`))) join `amptarget` on((`primerpair`.`ampTarget_id` = `amptarget`.`id`))) */;;
/*!50001 SET character_set_client      = @saved_cs_client */;;
/*!50001 SET character_set_results     = @saved_cs_results */;;
/*!50001 SET collation_connection      = @saved_col_connection */;;


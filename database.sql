# Currency Table

CREATE TABLE `currency` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(45) DEFAULT NULL,
  `ISO` varchar(45) DEFAULT NULL,
  `ValueUnit` bigint(20) DEFAULT NULL,
  `DisplayName` varchar(45) DEFAULT NULL,
  `DisplayUnit` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

# Mining Table

CREATE TABLE `mining` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `TimeStamp` datetime DEFAULT NULL,
  `WalletID` int(11) DEFAULT NULL,
  `PoolID` int(11) DEFAULT NULL,
  `Hashes` bigint(20) DEFAULT NULL,
  `LastShare` datetime DEFAULT NULL,
  `Balance` bigint(20) DEFAULT NULL,
  `HashRate` double DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `MainIDX` (`TimeStamp`,`WalletID`,`PoolID`)
) ENGINE=InnoDB AUTO_INCREMENT=541 DEFAULT CHARSET=utf8;

# Mining Hourly Stats Table

CREATE TABLE `mining_hourly` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `TimeStamp` datetime DEFAULT NULL,
  `WalletID` int(11) DEFAULT NULL,
  `PoolID` int(11) DEFAULT NULL,
  `Hashes` bigint(20) DEFAULT NULL,
  `Balance` bigint(20) DEFAULT NULL,
  `HashRate` double DEFAULT NULL,
  `Entries` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `MainIDX` (`TimeStamp`,`WalletID`,`PoolID`)
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8;

# Mining Daily Stats Table

CREATE TABLE `mining_daily` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `TimeStamp` datetime DEFAULT NULL,
  `WalletID` int(11) DEFAULT NULL,
  `PoolID` int(11) DEFAULT NULL,
  `Hashes` bigint(20) DEFAULT NULL,
  `Balance` bigint(20) DEFAULT NULL,
  `HashRate` double DEFAULT NULL,
  `Entries` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `MainIDX` (`TimeStamp`,`WalletID`,`PoolID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

# Pools Table

CREATE TABLE `pools` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(255) DEFAULT NULL,
  `URL` varchar(255) DEFAULT NULL,
  `API` varchar(255) DEFAULT NULL,
  `APIType` varchar(45) DEFAULT NULL,
  `CurrencyID` int(11) DEFAULT NULL,
  `Active` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

# Pool Blocks Table

CREATE TABLE `pool_blocks` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `PoolID` int(11) DEFAULT NULL,
  `Height` int(11) DEFAULT NULL,
  `Hash` varchar(64) DEFAULT NULL,
  `Difficulty` bigint(20) DEFAULT NULL,
  `FoundTime` datetime DEFAULT NULL,
  `Luck` bigint(20) DEFAULT NULL,
  `Reward` bigint(20) DEFAULT NULL,
  `Share` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `LookupIDX` (`Height`,`PoolID`)
) ENGINE=InnoDB AUTO_INCREMENT=73 DEFAULT CHARSET=utf8;

# Pool Meta Data Table

CREATE TABLE `pool_meta` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `TimeStamp` datetime DEFAULT NULL,
  `PoolID` int(11) DEFAULT NULL,
  `HashRate` double DEFAULT NULL,
  `Miners` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=543 DEFAULT CHARSET=utf8;

# Pool Daily Stats Table

CREATE TABLE `pool_daily` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `TimeStamp` datetime DEFAULT NULL,
  `PoolID` int(11) DEFAULT NULL,
  `AvgDifficulty` bigint(20) DEFAULT NULL,
  `AvgLuck` bigint(20) DEFAULT NULL,
  `AvgReward` bigint(20) DEFAULT NULL,
  `SumReward` bigint(20) DEFAULT NULL,
  `Blocks` int(11) DEFAULT NULL,
  `HashRate` double DEFAULT NULL,
  `Miners` int(11) DEFAULT NULL,
  `MetaEntries` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

# Wallets Table

CREATE TABLE `wallets` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(45) DEFAULT NULL,
  `Owner` varchar(45) DEFAULT NULL,
  `Address` varchar(100) DEFAULT NULL,
  `CurrencyID` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

# Pool to Wallet Links Table

CREATE TABLE `pool_wallet` (
  `PoolID` int(11) NOT NULL,
  `WalletID` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`PoolID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
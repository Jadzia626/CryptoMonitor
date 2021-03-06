#!/usr/bin/env php
<?php
   /**
    *  Crypto Monitor – Cron Script
    * ==============================
    *  Created 2017-05-17
    *  Updated 2017-05-20 :: Rewritten to single cron file for all jobs
    */

    $bCron = true;
    require_once("config.php");
    require_once("functions.php");
    require_once("pools.php");
    require_once("hourly.php");
    require_once("daily.php");

    // BEGIN Cron Settings
    $bSave   = true;
    $sDaily  = "00:00";
    $sHourly = "00";
    $aPoll   = array("05","15","25","35","45","55");
    // END Cron Settings

    $sHour = date("H:i",time());
    $sMin  = date("i",time());

    if(!$bSave) {
        echo getTimeStamp()." Running in test mode\n";
        $sHour = "00:05";
        $sMin  = "05";
    }

    $oDB    = new mysqli($cDBHost,$cDBUser,$cDBPass,$cDBMain);
    $oPools = $oDB->query("SELECT * FROM pools WHERE Active = 1");

    while($aPool = $oPools->fetch_assoc()) {

        // Poll Mining Pools
        if(in_array($sMin,$aPoll)) {
            switch($aPool["APIType"]) {
                case "node-cryptonote-pool":
                    poolNodeCryptoNotePool($oDB, $aPool, $bSave);
                    break;
                default:
                    echo getTimeStamp()." Unknown API Type\n";
                    break;
            }
        }

        // Run Hourly Stats Averages
        if($sMin == $sHourly) {
            calcHourlyWalletStats($oDB, $aPool, $bSave);
        }

        // Run Daily Stats Averages
        if($sHour == $sDaily) {
            calcDailyWalletStats($oDB, $aPool, $bSave);
            calcDailyPoolStats($oDB, $aPool, $bSave);
        }
    }
    $oPools->close();

    $oDB->close();
?>

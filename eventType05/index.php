<?php
$speech="今天穿紅色衣服" ;  // the getTextToApi.sh will sed this line!!
//weitinglin , 20160229, wakey project
//==========================================PHP API===========================
//STEP 1:Connect to TTS ITRI Webservice
$client = new SoapClient("http://tts.itri.org.tw/TTSService/Soap_1_3.php?wsdl");
//STEP 2: Invoke Call to ConvertSimple
$result=$client->ConvertSimple("weitinglin66","itritts",$speech);
//STEP 3: Iterate through the returned string array
$resultArray=explode("&",$result);
list($resultCode, $resultString, $resultConvertID) = $resultArray;
//echo "resultCode：".$resultCode."<br/>";		//debug
//echo "resultString：".$resultString."<br/>";		//debug
//echo "resultConvertID：".$resultConvertID."<br/>";	//debug
//STEP 4: Wait for the TTS ITRI DB Process

//STEP 5: Invoke Call to ConvertText

$result1=$client->GetConvertStatus("weitinglin66","itritts","$resultConvertID");
//STEP 6: Iterate through the returned string array
$try=1;
$resultArray1= explode("&",$result1);
while( !in_array("completed", $resultArray1 ) ){
usleep(100000);
$result1=$client->GetConvertStatus("weitinglin66","itritts","$resultConvertID");
//echo "the request ".$try." times ";                   //debug
$try++;
//echo " empty($result1)";                              //debug
$resultArray1= explode("&",$result1);
}

list($resultCode, $resultString, $statusCode, $status, $resultUrl) = $resultArray1;

//echo "resultCovertID".$resultConvertID."<br/>";	//debug
//echo "resultCode：".$resultCode1."<br/>";		//debug
//echo "resultString：".$resultString1."<br/>";		//debug
//echo "statusCode：".$statusCode1."<br/>";		//debug
//echo "status：".$status1."<br/>";			//debug
//STEP 7: Print out the url for downloading the .wav
echo $resultUrl;

//========================================GET DATA FROM  MYSQL==================
//STEP 1:Connect to the mySQL
/*$link= mysql_connect("gardenia.csie.ntu.edu.tw","wakey","wakeyteam2");
if (!$link)
	die("Cannot connect to MySQL" . mysql_error());
//echo "Connect to It! <br />"; 		//debug
//STEP 2:Select the "Wakey" database
$db_select=mysql_select_db("wakey",$link);
if(!$db_select)
	die("Cannot connect to DB_WAKEY! <br />".mysql_error());
mysql_query("SET NAMES UTF8");
//STEP 3:Query the data from the table of "testText25Speech" with id =1
$sql = "SELECT * FROM testText2Speech WHERE id=1";
$result=mysql_query($sql);
//echo gettype($result),"<br />";		//debug
//echo gettype($row);				//debug
//STEP 4:Fetch the row data from the resorce
$row = mysql_fetch_row($result);
//echo gettype($row[0]);			//debug
//STEP 5:Set the variable to pass to the text to speech PHP API
$speech = $row[1];
//echo "<br />";
//STEP 6: release the memory
mysql_free_result($result);
mysql_close($link);
//echo "the end <br />";
*/
?>

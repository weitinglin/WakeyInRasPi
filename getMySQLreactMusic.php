<?php
$userID = 0 ;
$date = "20160417" ;
//$date = "20160410";
//$deleteOrNot;
//echo 'Current PHP version:'. phpversion() . "\n";
//weitinglin , 20160229, wakey project
//========================================GET DATA FROM  MYSQL=================
//STEP 1:Connect to the mySQL
$mysqli= new mysqli("gardenia.csie.ntu.edu.tw","wakey","wakeyteam2","wakey");
if($mysqli->connect_errno) {
    // The connection failed. What do you want to do?
    // You could contact yourself (email?), log the error, show a nice page, etc.
    // You do not want to reveal sensitive information

    // Let's try this:
    echo "Sorry, this website is experiencing problems.";

    // Something you should not do on a public site, but this example will show you
    // anyways, is print out MySQL error related information -- you might log this
    echo "Error: Failed to make a MySQL connection, here is why: \n";
    echo "Errno: " . $mysqli->connect_errno . "\n";
    echo "Error: " . $mysqli->connect_error . "\n";

    // You might want to show them something nice, but we will simply exit
    exit;
}

//echo "Connect to It! <br />"; 		//debug
//STEP 2:Select the "Wakey" database

// 設定文件utf-8編碼
 $mysqli->set_charset("utf8");

 //==============================query===============================
 //$sql = "SELECT * FROM event WHERE userID = $userID AND scheduleID = $scheduleID";
 $sql = "SELECT action.userID,action.date,action.eventID,action.actionID,event.eventType,action.actionType,action.music,event.startTime FROM  action,event WHERE action.eventID = event.eventID AND action.date = $date AND action.actionType = 3 AND action.userID = $userID AND action.deleteOrNot = 1 AND action.music !='' ";
 $sql1 = "SELECT * FROM  action WHERE date = $date AND actionType = 3 AND userID = $userID AND deleteOrNot = 1 ";
 $result = $mysqli->query($sql);

// echo "<h2>查詢範例(object)</h2>";
// echo "========================";
// echo "<table border='1'>";
 while($row = $result->fetch_array()) {
 echo $row['actionID'].' '.'userID '.$row['userID'].' '.'eventType'.' '.$row['eventType'].' '.'eventID'.' '.$row['eventID'].' '.'actionType'.' '.$row['actionType'].' '.'date'.' '.$row['date'].' '.$row['music'].' '.'startTime'.' '.$row['startTime']."\n" ;
 }
// echo gettype($row);
// echo gettype($result);
 //echo gettype($result);
/*
 $test = [];
 while ($row = $result->fetch_row()) {
  $text[] = print_r($row);
 }
*/
// $myfile = fopen("joblist.txt", "w");
//file_put_contents("joblist.txt", print_r($text, true));
// fwrite($myfile, "test");
// fclose($myfile);
//==============================INSERT===============================
/*
$sql = "INSERT INTO user_info (username, password, birth_date, sex, age) VALUES ('Eric','eric12345','1995-02-24',1,19)";
 $mysqli->query($sql);
*/
//==============================UPDATE===============================
//==============================DELETE===============================
 // 關閉MySQL資料庫連線
 $mysqli->close();
//STEP 3:Query the data from the table of "realTimeTalk" with id =1

//echo gettype($result),"<br />";		//debug
//echo gettype($row);				//debug
//STEP 4:Fetch the row data from the resorce

//echo gettype($row[0]);			//debug
//STEP 5:Set the variable to pass to the text to speech PHP API

//echo "<br />";
//STEP 6: release the memory

//echo "the end <br />";

?>

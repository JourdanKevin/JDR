<?php
use PHPMailer\PHPMailer\PHPMailer;
use PHPMailer\PHPMailer\Exception;

require 'phpmailer/Exception.php';
require 'phpmailer/PHPMailer.php';
require 'phpmailer/SMTP.php';

define('GMailUSER', 'proptimeworld@gmail.com'); // utilisateur Gmail
define('GMailPWD', '12fb13a3'); // Mot de passe Gmail

function smtpMailer($to, $from_name, $subject, $body,$from='proptimeworld@gmail.com') {
    $mail = new PHPMailer(true);  // Cree un nouvel objet PHPMailer
    $mail->SMTPDebug = 0;  // debogage: 1 = Erreurs et messages, 2 = messages seulement
	$mail->IsSMTP(); // active SMTP   
    $mail->Host = 'smtp.gmail.com';
    $mail->SMTPAuth = true;  // Authentification SMTP active
    $mail->Username = GMailUSER;
    $mail->Password = GMailPWD;
	$mail->SMTPSecure = 'ssl'; // Gmail REQUIERT Le transfert securise	
	$mail->Port = 465;	
    $mail->SetFrom($from, $from_name);
    foreach($to as $value){
        $mail->AddAddress($value);
    }    
    $mail->isHTML(true);
	$mail->Subject = $subject;
	$mail->Body = $body;
    $mail->Send();
}
?>
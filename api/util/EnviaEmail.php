<?php
if (!function_exists("PHPMailer")) {
	// require_once('PHPMailer_5.2.2/class.phpmailer.php');
	require_once("phpmailer/PHPMailerAutoload.php");
}

class EnviaEmail {
	// atributos
	// private $usuario = 'solverp@akto.com.br';
	// private $senha = '123@456';
	private $usuario = 'nuviosolucoes@gmail.com';
	private $senha = 'Nuv1050luc035';
	private $remetente;
	private $emails;
	private $assunto;
	private $mensagem;

	function __construct 
	(
		$remetente = NULL,
		$assunto = NULL,
		$emails = NULL,
		$mensagem = NULL,
		$anexo = NULL
	)
	{
		$this->remetente = $remetente;
		$this->assunto = $assunto;
		$this->emails = $emails;
		$this->mensagem = $mensagem;
		$this->anexo = $anexo;
	}

	// metodos
	public function getUsuario () {
		return $this->usuario;
	}
	public function setUsuario ( $usuario ) {
		$this->usuario = $usuario;
		return $this;
	}
	public function getSenha () {
		return $this->senha;
	}
	public function setSenha ( $senha ) {
		$this->senha = $senha;
		return $this;
	}
	public function getRemetente () {
		return $this->remetente;
	}
	public function setRemetente ( $remetente ) {
		$this->remetente = $remetente;
		return $this;
	}
	public function getEmails () {
		return $this->emails;
	}
	public function setEmails ( $emails ) {
		$this->emails = $emails;
		return $this;
	}
	public function getAssunto () {
		return $this->assunto;
	}
	public function setAssunto ( $assunto ) {
		$this->assunto = $assunto;
		return $this;
	}
	public function getMensagem () {
		return $this->mensagem;
	}
	public function setMensagem ( $mensagem ) {
		$this->mensagem = $mensagem;
		return $this;
	}

	public function enviar () {
		// echo '<pre>';
		if ( empty($this->emails) ) return false; // se não haver emails
		
		// $Host = 'mail.akto.com.br';//'smtp.'.substr(strstr($this->usuario, '@'), 1); //'mail.akto.com.br';
		$Host = 'smtp.gmail.com';
		$Username = $this->usuario;
		$Password = $this->senha;
		$Port = "587";

		$mail = null;
		unset($mail);
		$mail = new PHPMailer();

		$body = $this->mensagem;
		$mail->IsSMTP(); // telling the class to use SMTP


		$mail->SMTPOptions = array(
		    'ssl' => array(
		        'verify_peer' => false,
		        'verify_peer_name' => false,
		        'allow_self_signed' => true
		    )
		);

		$mail->Host = $Host; // SMTP server
		// $mail->SMTPDebug = 2; // enables SMTP debug information (for testing)
		// 1 = errors and messages1
		// 2 = messages only
		$mail->SMTPAuth = true; // enable SMTP authentication
		// $mail->AuthType = 'PLAIN';
		$mail->SMTPSecure = 'tls';
		$mail->Port = $Port; // set the SMTP port for the service server
		$mail->Username = $Username; // account username
		$mail->Password = $Password; // account password
		$mail->CharSet = 'UTF-8';

		$mail->SetFrom( $this->usuario, $this->remetente );
		$mail->Subject = $this->assunto;
		$mail->MsgHTML($body);
		
		if ( !empty($this->anexo) && filesize( $this->anexo ) < 10485760 ) { // caso não exceda o limite 10MB
			$mail->AddAttachment( $this->anexo );
		}

		foreach ( $this->emails as $key ) {
			$mail->AddAddress( trim($key), "" );
		}

		if(!$mail->Send()) {
			$response = $mail->ErrorInfo;
		} else {
			$response = true;
		}

		return $response;
	}


}

// $obj = new EnviaEmail( 'Nuvio - Teste Email', 'Teste de Envio de Email Sem SSL', array('adelsonguimaraes@gmail.com', 'dayane@akto.com.br', 'niltonbox@gmail.com'), 'Testando email Akto sem SSL via DWEB' );
// echo $obj->enviar();


?>
<?php
// rest : destino

/*
	Projeto: Fermento Aierlines.
	Project Owner: Fermen.to Innovation Lab.
	Desenvolvedor: Adelson Guimaraes Monteiro.
	Data de início: 2019-07-25T14:46:14.209Z.
	Data Atual: 25/07/2019.
*/

//inclui autoload
require_once 'autoload.php';

//verifica requisição
switch ($_POST['metodo']) {
	case 'cadastrar':
		cadastrar();
		break;
	case 'buscarPorId':
		buscarPorId();
		break;
	case 'listar':
		listar();
		break;
	case 'atualizar':
		atualizar();
		break;
	case 'deletar':
		deletar();
		break;
}

function cadastrar () {
	$data = $_POST['data'];
	$obj = new Destino(
		NULL,
		$data['nome'],
		$data['brev']
	);
	$control = new DestinoControl($obj);
	$response = $control->cadastrar();
	echo json_encode($response);
}
function buscarPorId () {
	$data = $_POST['data'];
	$control = new DestinoControl(new Destino($data['id']));
	$response = $control->buscarPorId();
	echo json_encode($response);
}
function listar () {
	$control = new DestinoControl(new Destino);
	$response = $control->listar();
	echo json_encode($response);
}
function atualizar () {
	$data = $_POST['data'];
	$obj = new Destino(
		$data['id'],
		$data['nome'],
		$data['brev']
	);
	$control = new DestinoControl($obj);
	$response = $control->atualizar();
	echo json_encode($response);
}
function deletar () {
	$data = $_POST['data'];
	$banco = new Destino();
	$banco->setId($data['id']);
	$control = new DestinoControl($banco);
	echo json_encode($control->deletar());
}


// Classe gerada com BlackCoffeePHP 2.0 - by Adelson Guimarães
?>
<?php
// rest : viagem

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
$_POST['metodo']();


function cadastrar () {
	$data = $_POST['data'];
	$obj = new Viagem(
		NULL,
		new Destino($data['idorigem']),
		new Destino($data['iddestino']),
		$data['modalidade'],
		$data['descricao'],
		$data['data']
	);
	$control = new ViagemControl($obj);
	$response = $control->cadastrar();
	echo json_encode($response);
}
function buscarPorId () {
	$data = $_POST['data'];
	$control = new ViagemControl(new Viagem($data['id']));
	$response = $control->buscarPorId();
	echo json_encode($response);
}
function listarPorCriterios () {
	$data = $_POST['data'];
	$control = new ViagemControl();
	$response = $control->listarPorCriterios($data['origem'], $data['destino']);
	if ($response['success'] === false) die ($response);
	$voos_ida = $response['data'];

	// caso a modalidade tenha volta
	$voos_volta = array();
	if ($data['modalidade'] === "IDAVOLTA") {
		$control = new ViagemControl();
		$response = $control->listarPorCriterios($data['destino'], $data['origem']);
		if ($response['success'] === false) die ($response);
		$voos_volta = $response['data'];
	}

	$response['data'] = array("voosida"=>$voos_ida, "voosvolta"=>$voos_volta);
	echo json_encode($response);
}
function atualizar () {
	$data = $_POST['data'];
	$obj = new Viagem(
		$data['id'],
		new Destino($data['idorigem']),
		new Destino($data['iddestino']),
		$data['modalidade'],
		$data['descricao'],
		$data['data']
	);
	$control = new ViagemControl($obj);
	$response = $control->atualizar();
	echo json_encode($response);
}
function deletar () {
	$data = $_POST['data'];
	$banco = new Viagem();
	$banco->setId($data['id']);
	$control = new ViagemControl($banco);
	echo json_encode($control->deletar());
}


// Classe gerada com BlackCoffeePHP 2.0 - by Adelson Guimarães
?>
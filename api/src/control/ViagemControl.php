<?php
// control : viagem

/*
	Projeto: Fermento Aierlines.
	Project Owner: Fermen.to Innovation Lab.
	Desenvolvedor: Adelson Guimaraes Monteiro.
	Data de início: 2019-07-25T14:46:14.209Z.
	Data Atual: 25/07/2019.
*/

Class ViagemControl {
	//atributos
	protected $con;
	protected $obj;
	protected $objDAO;

	//construtor
	public function __construct(Viagem $obj=NULL) {
		$this->con = Conexao::getInstance()->getConexao();
		$this->objDAO = new ViagemDAO($this->con);
		$this->obj = $obj;
	}

	//metodos
	function cadastrar () {
		return $this->objDAO->cadastrar($this->obj);
	}
	function buscarPorId () {
		return $this->objDAO->buscarPorId($this->obj);
	}
	function listarPorCriterios ($origem, $destino) {
		return $this->objDAO->listarPorCriterios($origem, $destino);
	}
	function atualizar () {
		return $this->objDAO->atualizar($this->obj);
	}
	function deletar () {
		return $this->objDAO->deletar($this->obj);
	}
	function listarPaginado ($start, $limit) {
	return $this->objDAO->listarPaginado($start, $limit);
	}
	function qtdTotal () {
		return $this->objDAO->qtdTotal();
	}
}

// Classe gerada com BlackCoffeePHP 2.0 - by Adelson Guimarães
?>
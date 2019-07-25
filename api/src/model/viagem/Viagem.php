<?php
// model : viagem

/*
	Projeto: Fermento Aierlines.
	Project Owner: Fermen.to Innovation Lab.
	Desenvolvedor: Adelson Guimaraes Monteiro.
	Data de início: 2019-07-25T14:46:14.209Z.
	Data Atual: 25/07/2019.
*/

Class Viagem implements JsonSerializable {
	//atributos
	private $id;
	private $objdestino;
	private $objdestino;
	private $modalidade;
	private $descricao;
	private $data;
	private $datacadastro;
	private $dataedicao;

	//constutor
	public function __construct
	(
		$id = NULL,
		Destino $objdestino = NULL,
		Destino $objdestino = NULL,
		$modalidade = NULL,
		$descricao = NULL,
		$data = NULL,
		$datacadastro = NULL,
		$dataedicao = NULL
	)
	{
		$this->id	= $id;
		$this->objdestino	= $objdestino;
		$this->objdestino	= $objdestino;
		$this->modalidade	= $modalidade;
		$this->descricao	= $descricao;
		$this->data	= $data;
		$this->datacadastro	= $datacadastro;
		$this->dataedicao	= $dataedicao;
	}

	//Getters e Setters
	public function getId() {
		return $this->id;
	}
	public function setId($id) {
		$this->id = $id;
		return $this;
	}
	public function getObjdestino() {
		return $this->objdestino;
	}
	public function setObjdestino($objdestino) {
		$this->objdestino = $objdestino;
		return $this;
	}
	public function getObjdestino() {
		return $this->objdestino;
	}
	public function setObjdestino($objdestino) {
		$this->objdestino = $objdestino;
		return $this;
	}
	public function getModalidade() {
		return $this->modalidade;
	}
	public function setModalidade($modalidade) {
		$this->modalidade = $modalidade;
		return $this;
	}
	public function getDescricao() {
		return $this->descricao;
	}
	public function setDescricao($descricao) {
		$this->descricao = $descricao;
		return $this;
	}
	public function getData() {
		return $this->data;
	}
	public function setData($data) {
		$this->data = $data;
		return $this;
	}
	public function getDatacadastro() {
		return $this->datacadastro;
	}
	public function setDatacadastro($datacadastro) {
		$this->datacadastro = $datacadastro;
		return $this;
	}
	public function getDataedicao() {
		return $this->dataedicao;
	}
	public function setDataedicao($dataedicao) {
		$this->dataedicao = $dataedicao;
		return $this;
	}

	//Json Serializable
	public function JsonSerialize () {
		return [
			"id"	=> $this->id,
			"objdestino"	=> $this->objdestino,
			"objdestino"	=> $this->objdestino,
			"modalidade"	=> $this->modalidade,
			"descricao"	=> $this->descricao,
			"data"	=> $this->data,
			"datacadastro"	=> $this->datacadastro,
			"dataedicao"	=> $this->dataedicao
		];
	}
}

// Classe gerada com BlackCoffeePHP 2.0 - by Adelson Guimarães
?>
<?php
// model : destino

/*
	Projeto: Fermento Aierlines.
	Project Owner: Fermen.to Innovation Lab.
	Desenvolvedor: Adelson Guimaraes Monteiro.
	Data de início: 2019-07-25T14:46:14.209Z.
	Data Atual: 25/07/2019.
*/

Class Destino implements JsonSerializable {
	//atributos
	private $id;
	private $nome;
	private $brev;
	private $datacadastro;

	//constutor
	public function __construct
	(
		$id = NULL,
		$nome = NULL,
		$brev = NULL,
		$datacadastro = NULL
	)
	{
		$this->id	= $id;
		$this->nome	= $nome;
		$this->brev	= $brev;
		$this->datacadastro	= $datacadastro;
	}

	//Getters e Setters
	public function getId() {
		return $this->id;
	}
	public function setId($id) {
		$this->id = $id;
		return $this;
	}
	public function getNome() {
		return $this->nome;
	}
	public function setNome($nome) {
		$this->nome = $nome;
		return $this;
	}
	public function getBrev() {
		return $this->brev;
	}
	public function setBrev($brev) {
		$this->brev = $brev;
		return $this;
	}
	public function getDatacadastro() {
		return $this->datacadastro;
	}
	public function setDatacadastro($datacadastro) {
		$this->datacadastro = $datacadastro;
		return $this;
	}

	//Json Serializable
	public function JsonSerialize () {
		return [
			"id"	=> $this->id,
			"nome"	=> $this->nome,
			"brev"	=> $this->brev,
			"datacadastro"	=> $this->datacadastro
		];
	}
}

// Classe gerada com BlackCoffeePHP 2.0 - by Adelson Guimarães
?>
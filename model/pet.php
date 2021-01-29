<?php
    class Pet{
        private $id;
        private $nome;
        private $tipo;
        private $idade;
        private $sexo;

        public function Pet($id, $nome, $tipo, $idade, $sexo){
            $this->id = $id;
            $this->nome = $nome;
            $this->tipo = $tipo;
            $this->idade = $idade;
            $this->sexo = $sexo;
        }

        public function setId($id){
            $this->id = $id;
        }

        public function getId(){
            return $this->id;
        }

        public function setNome($nome){
            $this->nome = $nome;
        }

        public function getNome(){
            return $this->nome;
        }

        public function setTipo($tipo){
            $this->tipo = $tipo;
        }

        public function getTipo(){
            return $this->tipo;
        }

        public function setIdade($idade){
            $this->idade = $idade;
        }

        public function getIdade(){
            return $this->idade;
        }

        public function setSexo($sexo){
            $this->sexo = $sexo;
        }

        public function getSexo(){
            return $this->sexo;
        }
    }
?>
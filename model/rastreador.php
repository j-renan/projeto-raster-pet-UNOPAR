<?php
    class Rastreador{
        private $id;
        private $codigo;
        private $dataAtivacao;
        private $tutorId;

        public function Ratreador($id, $codigo, $dataAtivacao, $tutorId){
            $this->id = $id;
            $this->codigo = $codigo;
            $this->dataAtivacao = $dataAtivacao;
            $this->tutorId = $tutorId;
        }

        public function setId($id){
            $this->id = $id;
        }

        public function getId(){
            return $this->id;
        }

        public function setCodigo($codigo){
            $this->codigo = $codigo;
        }

        public function getCodigo(){
            return $this->codigo;
        }

        public function setDataAtivacao($dataAtivacao){
            $this->dataAtivacao = $dataAtivacao;
        }

        public function getDataAtivacao(){
            return $this->dataAtivacao;
        }

        public function setTutorId($tutorId){
            $this->tutorId = $tutorId;
        }

        public function gertTutorId(){
            return $this->tutorId;
        }
    }
?>
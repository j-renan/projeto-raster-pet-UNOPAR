<?php
    class RastreadorPet{
        private $id;
        private $data;
        private $latitude;
        private $longitude;
        private $rastreadorId;
        private $petId;

        public function RastreadorPet($id, $data, $latitude, $longitude, $rastreadorId, $petId){
            $this->id = $id;
            $this->data = $data;
            $this->latitude = $latitude;
            $this->longitude = $longitude;
            $this->rastreadorId = $rastreadorId;
            $this->petId = $petId;
        }

        public function setId($id){
            $this->id = $id;
        }

        public function getId(){
            return $this->id;
        }

        public function setData($data){
            $this->data = $data;
        }

        public function getData(){
            return $this->data;
        }

        public function setLatitude($latitude){
            $this->latitude = $latitude;
        }

        public function getLatitude(){
            return $this->latitude;
        }

        public function setLongitude($longitude){
            $this->longitude = $longitude;
        }

        public function getLongitude(){
            return $this->longitude;
        }

        public function setRastreadorId($rastreadorId){
            $this->rastreadorId = $rastreadorId;
        }

        public function getRastreadorId(){
            return $this->rastreadorId;
        }

        public function setPetId($petId){
            $this->petId = $petId;
        }

        public function getPetId(){
            return $this->petID;
        }
    }
?>
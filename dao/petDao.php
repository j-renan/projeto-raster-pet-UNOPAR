<?php

    include '../conexao/conexao.php';

    class PetDao {

        public function listarPorTutor($tutorId){
            $conexao = new conexao();
            $bd = $conexao->conectar();
            $sql = "SELECT * FROM pets WHERE tutor_id='" . $tutorId . "'";
            $resultados = $bd->query($sql);
            $bd->close();
            return $this->formatarDadosPet($resultados);
        }

        public function formatarDadosPet($resultados){

            $numeroLinhas = $resultados->num_rows;
             $listaPets = [];

            for ($i=0; $i < $numeroLinhas; $i++) {

            $linha = $resultados->fetch_assoc();
            array_push($listaPets, $linha);    
            }
            return $listaPets;
        }

          public function listarTrajetoPorPetEData($petId, $dataInicio, $dataFim){
            $conexao = new conexao();
            $bd = $conexao->conectar();
            $sql = "SELECT * FROM pet_rastreador_dados WHERE pet_rastreador_id = '".$petId."' AND data BETWEEN '".$dataInicio."' AND '".$dataFim."'";
            $resultados = $bd->query($sql);
            $bd->close();
            return $this->formatarDadosRastreador($resultados);
        }

            private function formatarDadosRastreador($resultados){

                $numeroLinhas = $resultados->num_rows;
                $listaTrajeto = [];

                for ($i=0; $i < $numeroLinhas; $i++) {

                    $linha = $resultados->fetch_assoc();
                    array_push($listaTrajeto, $linha);    
                }
                return $listaTrajeto;
            }
    }


?>
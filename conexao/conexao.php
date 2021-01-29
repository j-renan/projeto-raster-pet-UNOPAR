<?php

class Conexao {
    public function conectar() {
        // conexão com banco de dados
        $servidor = "localhost";
        $usuario = "root";
        $senha = "";
        $bancoDeDados = "rasterpet2";

        $conexao = new mysqli($servidor, $usuario, $senha, $bancoDeDados);
        return $conexao;
    }

}



?>
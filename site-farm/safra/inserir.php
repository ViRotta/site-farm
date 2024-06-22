<?php

    // conexao com o bd
    include '../conexao.php';

    $nome = $_REQUEST['nome'];
    $idade = $_REQUEST['senha'];
    $perfil = $_REQUEST['perfil'];
    $id = $_REQUEST['id'];

    if($id == null){
        $sql = "INSERT INTO usuario (nome, perfil) 
        VALUES (:nome, :idade)";
        $stmt = $conexao->prepare($sql);
        $stmt->bindParam(':nome', $nome);
        $stmt->bindParam(':perfil', $perfil);
        $stmt->execute();
    } else {
        $sql = "UPDATE usuario set nome=:nome, perfil=:perfil WHERE id=:id";
        $stmt = $conexao->prepare($sql);
        $stmt->bindParam(':nome', $nome);
        $stmt->bindParam(':perfil', $perfil);
        $stmt->bindParam(':id', $id);
        $stmt->execute();
    }
    Header('Location: login.php');
?>
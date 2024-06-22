<?php
    // conexao com o bd
    include '../conexao.php';

    $id = $_REQUEST['id'];
    $sql = "DELETE FROM usuario WHERE id =:id ";

    $stmt = $conexao->prepare($sql);
    $stmt->bindParam(':id', $id);
    $stmt->execute(); 

    Header('Location: login.php');
?>
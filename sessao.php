<?php

    include '../conexao.php';
    
    $login = $_REQUEST['login'];
    $senha = md5($_REQUEST['senha']);

    $sqlUsuario = "SELECT * FROM usuario as u
                    INNER JOIN perfil as p
                    ON u.id_perfil = p.id
                    WHERE login =:login and senha =:senha";

    $stmt = $conexao->prepare($sqlUsuario);
    $stmt->bindParam(':login', $login);
    $stmt->bindParam(':senha', $senha);
    $stmt->execute();
    $usuario = $stmt->fetch(PDO::FETCH_OBJ);
    
    var_dump($usuario);
    //exit;

    if($usuario != null) {
        session_start();
        $_SESSION['nome_usuario'] = $usuario->nome;
        $_SESSION['login_usuario'] = $usuario->login;
        $_SESSION['id_perfil'] = $usuario->id_perfil;
        $_SESSION['descricao_perfil'] = $usuario->descricao;
        Header('Location: safra/index.php');
     } else {
        Header('Location: login.php');
    }
    
    
?>
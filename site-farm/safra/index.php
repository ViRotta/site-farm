<?php


    session_start();

    //var_dump($_SESSION);

    // Testa se há usuário na sessão
    if(!isset($_SESSION['login_usuario'])) {
        Header('Location: ../login.php');
    }

    // Conexão com o banco de dados
    include '../conexao.php';

    // Lista todos os alunos
    // comando de seleção
    $sql = "SELECT * FROM safra";
    // execução do comando select
    $consulta = $conexao->query($sql);

    // Trecho utilizado para carregamento da informação para edição
    $id = null;
    $aluno = null;
    if(isset($_REQUEST['id'])) {
        $id = $_REQUEST['id'];
        $sqlAluno = "SELECT * FROM usuario WHERE id=:id";
        $stmt = $conexao->prepare($sqlUsuario);
        $stmt->bindParam(':id', $id);
        $stmt->execute();
        $aluno = $stmt->fetch(PDO::FETCH_OBJ);
    }
    

?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
    <form action="inserir.php" method="post">

        <input type="hidden" name="id" value="<?php echo $id ?>">
        Nome: <input type="text" name="nome" 
                value="<?php echo $usuario != null ? $aluno->nome : "" ?>">
        Idade: <input type="text" name="idade"
                value="<?php echo $usuario != null ? $aluno->idade : "" ?>">
        <input type="submit" value="Salvar">
    </form>
    <br>
    <br>
    <table width="100%" border="1">
        <thead>
            <tr>
                <th>Id</th>
                <th>Nome</th>
                <th>Perfil</th>
                <th>Ações</th>
            </tr>
        </thead>
        <?php
            while ($linha = $consulta->fetch(PDO::FETCH_OBJ)) {
        ?>
            <tr>
                <td><?php  echo $linha->id ?></td>
                <td><?php  echo $linha->nome ?></td>
                <td><?php  echo $linha->Perfil ?></td>
                <td>
                    <a href="index.php?id=<?php echo $linha->id ?>">Editar</a>
                    <a href="excluir.php?id=<?php echo $linha->id ?>">Excluir</a>
                </td>
            </tr>
        <?php
            }
        ?>
    </table>
</body>
</html>

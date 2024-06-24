<!DOCTYPE html>
<html lang="en">

<body>
    <?php 
        session_start();
        $id_perfil = $_SESSION['id_perfil'];
        if ($id_perfil == 1 || $id_perfil == 2) {
    ?>
            <a href="Safras">Tabelas de Safras</a>
            <br><br>
            <a href="#">Funcionalidade 1</a>
            <br><br>
            <a href="#">Funcionalidade 2</a>
            <br><br>
    <?php } 
        if ($id_perfil == 3) {
    ?>
            <h1 class="section-heading mb-4">
                <span class="section-heading-lower">Sinto Muito!</span>
                <p class="mb-3"> Está é uma área para o pessoal da fazenda</p>
            </h1>
    <?php } ?>

    <br><br>
    <a href="sair.php">Sair</a>
</body>
</html>
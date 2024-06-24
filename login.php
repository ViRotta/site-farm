<!DOCTYPE html>
<html lang="en">
   
    <?php include 'head.php'; ?>

    <body>
        <?php include 'menu.php';?>
        
        <section class="page-section cta">
            <div class="container">
                <div class="row">
                    <div class="col-xl-9 mx-auto">
                        <div class="cta-inner bg-faded text-center rounded">
                            
                            <h2 class="section-heading mb-5">
                                <span class="section-heading-upper">Área de Safras</span>
                                <span class="section-heading-lower">Login</span>
                            </h2>
                            <ul class="list-unstyled list-hours mb-5 text-left mx-auto">

                                <!--AREA DE LOGIN-->

                                <form action="sessao.php" method="post">
                                    <span>Login: </span><input type="text" name="login" class="form-control form-control-user">
                                    <br><br>
                                    <span>Senha:</span><input type="password" name="senha" class="form-control form-control-user">
                                    <br><br>
                                    <input type="submit" value="Login" class="btn btn-primary btn-user btn-block">
                                    <input type="submit" value="Limpar" class="btn btn-primary btn-user btn-block">
                                </form>


                            </ul>
                        
                
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <?php include 'footer.php'; ?>

    </body>
</html>

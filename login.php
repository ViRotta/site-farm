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

                                <form action="login.php" method="post">
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


        <section class="page-section about-heading">
            <div class="container">
                <img class="img-fluid rounded about-heading-img mb-3 mb-lg-0" src="assets/img/about.jpg" alt="..." />
                <div class="about-heading-content">
                    <div class="row">
                        <div class="col-xl-9 col-lg-10 mx-auto">
                            <div class="bg-faded rounded p-5">
                                <h2 class="section-heading mb-4">
                                    <span class="section-heading-upper">Strong Generation, Strong Roots</span>
                                    <span class="section-heading-lower">Sobre nossa Origem</span>
                                </h2>
                              <p>Founded in 1987 by the Hernandez brothers, our establishment has been serving up rich coffee sourced from artisan farmers in various regions of South and Central America. We are dedicated to travelling the world, finding the best coffee, and bringing back to you here in our cafe.</p>
                                <p class="mb-0">
                                    We guarantee that you will fall in
                                    <em>lust</em>
                                    with our decadent blends the moment you walk inside until you finish your last sip. Join us for your daily routine, an outing with friends, or simply just to enjoy some alone time.
                                </p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <?php include 'footer.php'; ?>

    </body>
</html>

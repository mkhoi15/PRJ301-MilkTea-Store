<%-- 
    Document   : login
    Created on : May 29, 2023, 11:15:51 AM
    Author     : ADMIN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login JSP</title>
        <!--===============================================================================================-->
        <link rel="stylesheet" href="./assets/css/style.css">
        <!--===============================================================================================-->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">
        <!--===============================================================================================-->
        <link rel="stylesheet" href="./assets/fonts/font-awesome-4.7.0/font-awesome-4.7.0/css/font-awesome.min.css">
        <!--===============================================================================================-->
    </head>
    <body>


        <section class="vh-90 gradient-custom">
            <div class="container py-5 h-100">
                <div class="row d-flex justify-content-center align-items-center h-100">
                    <div class="col-12 col-md-8 col-lg-6 col-xl-5">
                        <div class="card bg-dark text-white" style="border-radius: 1rem;">
                            <div class="card-body p-5 text-center">

                                <div class="mb-md-5 mt-md-4 pb-5">

                                    <h2 class="fw-bold mb-2 text-uppercase">Login</h2>
                                    <p class="text-white-50 mb-5">Please enter your login and password!</p>
                                    <!--Form Start-->
                                    <form action="MainController" method="POST" id="form">
                                        <div class="form-outline form-white mb-4">
                                            <input type="text" name="userID" required="" id="userID" class="form-control form-control-lg" placeholder="User ID"/>
                                            <label class="form-label" for="userID"></label>
                                        </div>

                                        <div class="form-outline form-white mb-2">
                                            <input type="password" name="password" required="" id="typePasswordX" class="form-control form-control-lg" placeholder="Password"/>
                                            <label class="form-label" for="typePasswordX"></label>
                                        </div>

                                        <h5 class="fw-bolder mb-2 text-uppercase text-danger">
                                            ${requestScope.ERROR}
                                        </h5>

                                        <div class="recapcha pt-md-2 pb-md-2 pt-lg-3 pb-lg-3">
                                            <div class="g-recaptcha" data-sitekey="6LeZZacmAAAAAJAYLru8RjWA8iBvBaOg3C8GOvny"></div>
                                        </div>
                                        <div id="error" class="text-uppercase text-danger"></div>
                                        <div class="btn-container pt-md-2 pt-lg-3">
                                            <input class="btn btn-outline-light btn-lg px-5" type="submit" name="action" value="Login"  ></input>
                                            <input class="btn btn-outline-light btn-lg px-5" type="reset" value="Reset"></input>
                                        </div>

                                    </form>
                                    <!--Form End-->


                                    <p class="big pt-md-3 pt-lg-4"><a class="text-white-50" href="MainController?action=ShoppingPage">Go Shopping now</a></p>

                                    <div class="d-flex justify-content-center text-center mt-4 pt-3">
                                        <a href="https://accounts.google.com/o/oauth2/auth?scope=email%20profile%20openid&redirect_uri=http://localhost:8084/PRJ301_T2S2_JSP_Customize/MainController?action=LoginWithGoogle&response_type=code&client_id=767897810349-6o7dak433knleibcd02bg0c3rdk6ptab.apps.googleusercontent.com&approval_prompt=force" class="text-white"><i class="fa fa-google fa-lg"></i></a>
                                    </div>
                                </div>

                                <div>
                                    <p class="mb-0">Don't have an account? <a href="MainController?action=CreatePage" class="text-white-50 fw-bold">Sign Up</a>
                                    </p>
                                </div>

                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!--Recapcha Start-->
        <script src="https://www.google.com/recaptcha/api.js" async defer></script>
        <script>

            const form = document.getElementById("form");
            const error = document.getElementById("error");

            form.addEventListener("submit", function (event) {
                const response = grecaptcha.getResponse();
                if (response) {
                    form.submit();
                } else {
                    event.preventDefault();
                    error.innerHTML = "Please check";
                }
            });

        </script>
        <!--Recapcha End-->
    </body>
</html>

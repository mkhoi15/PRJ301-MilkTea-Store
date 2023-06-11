<%-- 
    Document   : create
    Created on : Jun 8, 2023, 10:49:36 AM
    Author     : ADMIN
--%>

<%@page import="sample.user.UserError"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Create User</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">
        <link rel="stylesheet" href="./assets/fonts/font-awesome-4.7.0/font-awesome-4.7.0/css/font-awesome.min.css">
    </head>
    
    <style>
    @media (min-width: 1025px) {

        body {
            background: linear-gradient(178.6deg, rgb(20, 36, 50) 11.8%, rgb(124, 143, 161) 83.8%);
    }
        .roleID{
            display: flex;
        }
    }

    
</style>
    <body>


        <%
            UserError userError = (UserError) request.getAttribute("USER_ERROR");
            if (userError == null) {
                userError = new UserError();
            }
            String error = (String) request.getAttribute("ERROR");
            if (error == null) {
                error = "";
            }
        %>


        <section class="vh-90 " >
            <div class="container py-5 h-100">
                <div class="row d-flex justify-content-center align-items-center h-100">
                    <div class="col-lg-8 col-xl-6">
                        <div class="card rounded-3">
                            <img src="./assets/img/skyNight.jpg" class="w-100"
                                 style="border-top-left-radius: .3rem; border-top-right-radius: .3rem;" alt="Sample photo">
                            <div class="card-body p-4 p-md-5">
                                <h3 class="mb-4 pb-2 pb-md-0 mb-md-5 px-md-2">Registration Info</h3>

                                <form class="px-md-2" action="MainController" method="POST">

                                    <div class="mb-4">
                                        
                                        <div class="form-outline">
                                            <input type="text" id="formUserID" class="form-control" placeholder="User ID" name="userID" required=""/>
                                             <h5 style="color: red">  <%= userError.getUserIDError()%> <h5>
                                            <label class="form-label" for="formUserID"></label>
                                        </div>
                                        
                                    </div>



                                    <div class=" mb-4">

                                        <div class="form-outline ">
                                            <input type="text" class="form-control" id="formName" placeholder="Full Name" name="fullName" required=""/>
                                            <label for="formName" class="form-label"></label>
                                            <h5 style="color: red"> <%= userError.getFullNameError() %> <h5>    
                                        </div>

                                    </div>



                                    <div class=" mb-4">

                                        <div class="form-outline ">
                                            <input type="text" name="roleID" value="US" readonly="" class="form-control" id="formName"/>
                                            <label for="formName" class="form-label"></label>
                                        </div>

                                    </div>

                                    <div class="form-outline mb-4">
                                        <input type="password" id="formPassword" class="form-control" placeholder="Password" name="password" required=""/>
                                        <label class="form-label" for="formPassword"></label>
                                    </div>

                                    <div class="form-outline mb-4">
                                        <input type="password" id="formConfirm" class="form-control" placeholder="Confirm" name="confirm" required=""/>
                                        <label class="form-label" for="formConfirm"></label>
                                        <h5 style="color: red"> <%= userError.getConfirmError()%> <h5>
                                    </div>



                                    <input type="submit" name="action" value="Create" class="btn btn-success btn-lg mb-1"/>
                                    <input type="reset" value="Reset" class="btn btn-success btn-lg mb-1"/>

                                    <%= error%>
                                </form>

                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>


    </body>
</html>

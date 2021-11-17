<%-- 
    Document   : navbar
    Created on : Nov 17, 2021, 12:10:26 PM
    Author     : Jacob
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!-- Navigation bar -->
    <nav class="navbar navbar-expand-lg navbar-light bg-light">
        <div class="collapse navbar-collapse">
            <ul class="navbar-nav mr-auto">
                <li class="nav-item">
                    <form name="viewpage" action="ServletController" method="post">
                        <input type="hidden" name="cmd" value="view">
                        <input type="hidden" name="page" value="index">
                        <input type="submit" class="btn btn-light" value="Home">
                    </form>
                </li>
                <li class="nav-item">
                    <form name="viewpage" action="ServletController" method="post">
                        <input type="hidden" name="cmd" value="view">
                        <input type="hidden" name="page" value="forumpage">
                        <input type="submit" class="btn btn-light" value="Feed">
                    </form>
                </li>
                <c:if test="${user != null}">
                    <li class="nav-item">
                        <form name="viewpage" action="ServletController" method="post">
                            <input type="hidden" name="cmd" value="view">
                            <input type="hidden" name="page" value="userpage">
                            <input type="submit" class="btn btn-light" value="${user.getUsername()}s page">
                        </form>
                    </li>
                </c:if>
            </ul>
            <c:choose>
                <c:when test="${user != null}">
                    <form name="logout" action="ServletController" method="post">
                        <input type="hidden" name="cmd" value="user">
                        <input type="hidden" name="usercmd" value="logout">
                        <button type="submit" class="btn btn-light">Logout</button>
                    </form>
                </c:when>
                <c:otherwise>
                    <button type="button" class="btn btn-light" data-toggle="modal" data-target="#loginModal">
                        Login
                    </button>
                </c:otherwise>
            </c:choose>
        </div>
    </nav>

<!-- Login modal -->
    <div class="modal fade" id="loginModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
     aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered" role="document">
            <div class="modal-content">
                <div class="modal-header border-bottom-0">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <div class="form-title text-center">
                        <h4>Login</h4>
                    </div>
                    <div class="d-flex flex-column text-center">
                        <form name="login" action="ServletController" method="post">
                            <input type="hidden" name="cmd" value="user">
                            <input type="hidden" name="usercmd" value="login">
                            <div class="form-group">
                                <input type="text" class="form-control" name="l_username" placeholder="Username"
                                            required>
                            </div>
                            <div class="form-group">
                                <input type="password" class="form-control" name="l_password"
                                            placeholder="Password" required>
                            </div>
                            <button type="submit" class="btn btn-info btn-block btn-round">Login</button>
                        </form>
                    </div>
                </div>
                <div class="modal-footer d-flex justify-content-center">
                    <div class="signup-section">Not a member yet?
                        <button type="button" class="sign-up-btn" data-toggle="modal"
                                    data-target="#registerModal"> Sign up.</button>
                    </div>
                </div>
            </div>
        </div>

        <!-- Registration modal -->
        <!--TODO! make sure username cant contain whitespaces and that password and repaet password match-->
        <div class="modal fade" id="registerModal" tabindex="-1" role="dialog"
             aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered" role="document">
                <div class="modal-content">
                    <div class="modal-header border-bottom-0">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <div class="form-title text-center">
                            <h4>Register</h4>
                        </div>
                        <div class="d-flex flex-column text-center">
                            <form name="register" action="ServletController" method="post">
                                <input type="hidden" name="cmd" value="user">
                                <input type="hidden" name="usercmd" value="register">
                                <div class="form-group">
                                    <input type="text" class="form-control" name="r_username"
                                                placeholder="Username" required>
                                </div>
                                <div class="form-group">
                                    <input type="password" class="form-control" name="r_password"
                                                placeholder="Password" required>
                                </div>
                                <div class="form-group">
                                    <input type="password" class="form-control" name="r_control_password"
                                                placeholder="Repeat password" required>
                                </div>
                                <button type="submit" class="btn btn-info btn-block btn-round">Register</button>
                            </form>
                        </div>
                    </div>
                    <div class="modal-footer d-flex justify-content-center"></div>
                </div>
            </div>
        </div>
    </div>
<script src='https://code.jquery.com/jquery-3.3.1.slim.min.js'></script>
<script src='https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js'></script>
<script src='https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js'></script>
<script src="../WEB-INF/js/script.js"></script>
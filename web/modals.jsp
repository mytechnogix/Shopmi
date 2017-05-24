<%
    if (String.valueOf(session.getAttribute("flag")).equals("1")) {
%>
<script>
    // alert("after login");
    $("#login-before-div").hide();
    $("#login-after-div").show();
    //document.getElementById("user_name").innerHTML="Ankush Nistane";
</script>
<%    } else {
%>
<script>
    // alert("before login");
    $("#login-before-div").show();
    $("#login-after-div").hide();
</script>
<%    }
%>
<div id="offerModal" class="modal fade" role="dialog" data-backdrop="static" data-keyboard="false">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-body">
                <div class="login-box-body text-center"  style="background-color: #605ca8">
                    <div class="row">
                        <img id="modalImg_offer" src="images/loading.gif" style="width: 200px; height: 200px; border-radius: 50%">
                    </div>
                    <h3 id="modalMsg_offer" style="color: white">Generating coupon for you...</h3>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-primary" data-dismiss="modal">Close</button>
            </div>
        </div>
    </div>
</div>
<div class="modal fade" id="loginModal" tabindex="-1" role="dialog" aria-labelledby="loginModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content login-modal">
            <div class="modal-header login-modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title text-center" id="loginModalLabel">Login To Shejari.com</h4>
            </div>
            <div class="modal-body">
                <div class="text-center">
                    <div role="tabpanel" class="login-tab">
                        <!-- Nav tabs -->
                        <ul class="nav nav-tabs" role="tablist">
                            <li role="presentation" class="active"><a id="signin-taba" href="#home" aria-controls="home" role="tab" data-toggle="tab">Sign In</a></li>
                            <li role="presentation"><a id="signup-taba" href="#profile" aria-controls="profile" role="tab" data-toggle="tab">Sign Up</a></li>
                            <li role="presentation"><a id="forgetpass-taba" href="#forget_password" aria-controls="forget_password" role="tab" data-toggle="tab">Forget Password</a></li>
                        </ul>

                        <!-- Tab panes -->
                        <div class="tab-content">
                            <div role="tabpanel" class="tab-pane active text-center" id="home">
                                <br>
                                <div class="clearfix"></div>
                                <form>
                                    <div class="form-group">
                                        <div class="input-group">
                                            <div class="input-group-addon"><i class="fa fa-user"></i></div>
                                            <input type="email" class="form-control" id="emailLog" placeholder="Username">
                                        </div>
                                        <span class="help-block has-error" id="email-error"></span>
                                    </div>
                                    <div class="form-group">
                                        <div class="input-group">
                                            <div class="input-group-addon"><i class="fa fa-lock"></i></div>
                                            <input type="password" class="form-control" id="passLog" placeholder="Password">
                                        </div>
                                        <span class="help-block has-error" id="password-error"></span>
                                    </div>
                                    <button type="button" id="login_btn" onclick="loginCheck1('1')" class="btn btn-block bt-login" data-loading-text="Signing In....">Login</button>
                                    &nbsp;&nbsp;
                                    <span id="loginError" class="response_error text-red" style="font-weight: bolder; display: none">
                                        Login failed, Invalid username or password
                                    </span>
                                    <div class="clearfix"></div>
                                    <div class="login-modal-footer">
                                        <div class="row">
                                            <div class="col-xs-8 col-sm-8 col-md-8">
                                                <i class="fa fa-lock"></i>
                                                <a href="javascript:;" class="forgetpass-tab"> Forgot password? </a>
                                            </div>
                                            <div class="col-xs-4 col-sm-4 col-md-4">
                                                <i class="fa fa-check"></i>
                                                <a href="javascript:;" class="signup-tab"> Sign Up </a>
                                            </div>
                                        </div>
                                    </div>
                                </form>
                            </div>
                            <div role="tabpanel" class="tab-pane" id="profile">
                                <div class="clearfix"></div>
                                <br>
                                <form action="#">
                                    <div class="form-group">
                                        <div class="input-group">
                                            <div class="input-group-addon"><i class="fa fa-at"></i></div>
                                            <input type="email" class="form-control" id="emailReg" name="emailReg" placeholder="Email" required>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <div class="input-group">
                                            <div class="input-group-addon"><i class="fa fa-user"></i></div>
                                            <input type="text" class="form-control" id="fnmReg" name="fnmReg" placeholder="First Name" required>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <div class="input-group">
                                            <div class="input-group-addon"><i class="fa fa-user"></i></div>
                                            <input type="text" class="form-control" id="lnmReg" name="lnmReg" placeholder="Last Name" required>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <div class="input-group">
                                            <div class="input-group-addon"><i class="fa fa-key"></i></div>
                                            <input type="text" class="form-control" id="passReg" name="passReg" placeholder="Password" required>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <div class="input-group">
                                            <div class="input-group-addon"><i class="fa fa-key"></i></div>
                                            <input type="text" class="form-control" id="cpassReg" name="cpassReg" placeholder="Confirm Password" required>
                                        </div>
                                    </div>
                                    <button type="button" onclick="registerUser()" id="register_btn" class="btn btn-block bt-login">Register</button>

                                    &nbsp;&nbsp;
                                    <span id="regSuccess" style="display: none; color: green">Registration Successful !  <a href='javascript:;' class='signin-tab'> Login Now</a></span>
                                    <span id="regError" style="display: none; color: red"></span>

                                    <div class="clearfix"></div>
                                    <div class="login-modal-footer">
                                        <div class="row">
                                            <div class="col-xs-8 col-sm-8 col-md-8">
                                                <i class="fa fa-lock"></i>
                                                <a href="javascript:;" class="forgetpass-tab"> Forgot password? </a>
                                            </div>
                                            <div class="col-xs-4 col-sm-4 col-md-4">
                                                <i class="fa fa-check"></i>
                                                <a href="javascript:;" class="signin-tab"> Sign In </a>
                                            </div>
                                        </div>
                                    </div>
                                </form>
                            </div>
                            <div role="tabpanel" class="tab-pane text-center" id="forget_password">
                                &nbsp;&nbsp;
                                <span id="reset_fail" class="response_error" style="display: none;"></span>
                                <div class="clearfix"></div>
                                <form>
                                    <div class="form-group">
                                        <div class="input-group">
                                            <div class="input-group-addon"><i class="fa fa-user"></i></div>
                                            <input type="text" class="form-control" id="femail" placeholder="Email">
                                        </div>
                                        <span class="help-block has-error" data-error='0' id="femail-error"></span>
                                    </div>
                                    <button type="button" id="reset_btn" class="btn btn-block bt-login" data-loading-text="Please wait....">Forget Password</button>
                                    <div class="clearfix"></div>
                                    <div class="login-modal-footer">
                                        <div class="row">
                                            <div class="col-xs-6 col-sm-6 col-md-6">
                                                <i class="fa fa-lock"></i>
                                                <a href="javascript:;" class="signin-tab"> Sign In </a>
                                            </div>
                                            <div class="col-xs-6 col-sm-6 col-md-6">
                                                <i class="fa fa-check"></i>
                                                <a href="javascript:;" class="signup-tab"> Sign Up </a>
                                            </div>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>       
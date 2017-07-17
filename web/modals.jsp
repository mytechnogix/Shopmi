<%@page import="java.util.*,java.text.*,java.sql.*" %>
<link rel="stylesheet" href="css/rating.min.css">
<%
    if (String.valueOf(session.getAttribute("flag")).equals("1")) {
%>
<script>
    // alert("after login");
    $(".login-before-div").hide();
    $(".login-after-div").show();
</script>
<%    } else {
%>
<script>
    // alert("before login");
    $(".login-before-div").show();
    $(".login-after-div").hide();
    
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
                <h4 class="modal-title text-center" id="loginModalLabel">Connect To MyShejari.com</h4>
            </div>
            <div class="modal-body">
                <div class="text-center">
                    <div role="tabpanel" class="login-tab">
                        <ul class="nav nav-tabs" role="tablist">
                            <li role="presentation" class="active"><a id="signin-taba" href="#home" aria-controls="home" role="tab" data-toggle="tab">Sign In</a></li>
                            <li role="presentation"><a id="signup-taba" href="#profile" aria-controls="profile" role="tab" data-toggle="tab">Sign Up</a></li>
                            <li role="presentation"><a id="forgetpass-taba" href="#forget_password" aria-controls="forget_password" role="tab" data-toggle="tab">Forget Password</a></li>
                        </ul>
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
                                    <br>
                                    -- OR --
                                    <div class="login-modal-footer">
                                        <div class="row">
                                            <div class="col-xs-12 col-sm-12 col-md-12">
                                                <img id="googleSignIn" src="images/sign-in-button_google.png" style="cursor: pointer; width: 100%; height: 50px">
                                            </div>
                                        </div>
                                        <br>
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
                                            <div class="input-group-addon"><i class="fa fa-envelope"></i></div>
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
                                            <input type="password" class="form-control" id="passReg" name="passReg" placeholder="Password" required>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <div class="input-group">
                                            <div class="input-group-addon"><i class="fa fa-key"></i></div>
                                            <input type="password" class="form-control" id="cpassReg" name="cpassReg" placeholder="Confirm Password" required>
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
                                <div class="form-group">
                                    <div class="input-group">
                                        <div class="input-group-addon"><i class="fa fa-envelope"></i></div>
                                        <input type="text" class="form-control" id="fEmail" name="fEmail" placeholder="Enter Email ID" required>
                                    </div>
                                    <span class="help-block has-error" data-error='0' id="femail-error"></span>
                                </div>
                                <button type="button" onclick="forgetCheck()" id="reset_btn" class="btn btn-block bt-login" data-loading-text="Please wait....">Forget Password</button>
                                <span id="forgetError" style="display: none; color: red"></span>
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
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>       
<div id="enquiryModalShop" class="modal fade" role="dialog">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title text-center">Send enquiry to shop</h4>
            </div>
            <div class="modal-body">
                <form role="form" name="enqFormStore">
                    <input type="hidden" name="enqType" id="enqType" value="store">
                    <div class="form-group">
                        <label for="lblSubject">Subject</label>
                        <input type="text" class="form-control" id="txtEnqSubject" name="txtEnqSubject" placeholder="Enter enquiry subject">
                    </div>
                    <div class="form-group">
                        <label for="lblDesc">Enquiry Description</label>
                        <textarea class="form-control" rows="3" id="txtEnqDesc" name="txtEnqDesc" placeholder="Enter enquiry in detail"></textarea>
                    </div>
                    <button type="button" onclick="saveEnquiry('store')" class="btn btn-primary">Submit</button>
                </form>
            </div>
        </div>
    </div>
</div>
<div id="enquiryModalHall" class="modal fade" role="dialog">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title text-center">Send enquiry to Hall</h4>
            </div>
            <div class="modal-body">
                <form role="form" name="enqFormHall">
                    <input type="hidden" name="enqType" id="enqType" value="hall">
                    <div class="form-group">
                        <label for="lblSubject">Subject</label>
                        <input type="text" class="form-control" id="txtEnqSubject" name="txtEnqSubject" placeholder="Enter enquiry subject">
                    </div>
                    <div class="form-group">
                        <label for="lblDesc">Enquiry Description</label>
                        <textarea class="form-control" rows="3" id="txtEnqDesc" name="txtEnqDesc" placeholder="Enter enquiry in detail"></textarea>
                    </div>
                    <button type="button" onclick="saveEnquiry('hall')" class="btn btn-primary">Submit</button>
                </form>
            </div>
        </div>
    </div>
</div>
<div id="enquiryModalMes" class="modal fade" role="dialog">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title text-center">Send enquiry to Mes</h4>
            </div>
            <div class="modal-body">
                <form role="form" name="enqFormMes">
                    <input type="hidden" name="enqType" id="enqType" value="hall">
                    <div class="form-group">
                        <label for="lblSubject">Subject</label>
                        <input type="text" class="form-control" id="txtEnqSubject" name="txtEnqSubject" placeholder="Enter enquiry subject">
                    </div>
                    <div class="form-group">
                        <label for="lblDesc">Enquiry Description</label>
                        <textarea class="form-control" rows="3" id="txtEnqDesc" name="txtEnqDesc" placeholder="Enter enquiry in detail"></textarea>
                    </div>
                    <button type="button" onclick="saveEnquiry('mes')" class="btn btn-primary">Submit</button>
                </form>
            </div>
        </div>
    </div>
</div>
<div id="ratingModal" class="modal fade" role="dialog">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title text-center">Rate this shop</h4>
            </div>
            <div class="modal-body text-center">
                <main class="o-content">
                    <div class="o-container">
                        <div class="o-section">
                            <div id="shop"></div>
                            <br>
                            <div id="rateMsg">Rate here</div><br>
                            <div id="rateThanks" style="display: none">Thank you for rating</div>
                        </div>
                    </div>
                </main>
            </div>
            <div class="modal-footer">
                <button class="btn btn-primary" data-dismiss="modal">Close</button>
            </div>
        </div>
    </div>
</div>
<div id="enquiryModalSuccess" class="modal fade" role="dialog">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-body text-center" style="background-color: #605ca8">
                <img id="modalImg_offer" src="images/rightIcon.png" style="width: 100px; height: 100px; border-radius: 50%">
                <h3 id="modalMsgEnq" style="color: white">Your enquiry has sent successfully.<br> They will get back to you soon.<br>Thank you!</h3>
                <input type="hidden" id="hdfRatingValue" />  
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-primary" data-dismiss="modal">OK</button>
            </div>
        </div>
    </div>
</div>
<div id="contactModal" class="modal fade" role="dialog">
    <div class="modal-dialog">
        <div class="modal-content" style="background-color:#605ca8 ">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true" style="color: #fff">&times;</span>
                </button>
                <h4 class="modal-title text-center" style="color: #fff">Contact us</h4>
            </div>
            <div class="modal-body">
                <div class="row">
                    <div class="col-md-6">
                        <img src="images/contactus.jpg" id="contactUsImg" style="width: 100%">
                    </div>
                    <div class="col-md-6" style="color: #fff; font-size: 16px">
                        MyShejari.com is a Amravati's dedicated and fast search tool.<br>
                        For any queries kindly contact us.
                        <br><br>
                        Email : <a href="mailto:team@myshejari.com" style="color: #fff">team@myshejari.com</a>
                        <br><br>
                        Contact No. 1 : <a href="tel:+917709588509" style="color: #fff"> +917709588509</a>, <br>
                        Contact No. 2 : <a href="tel:919049469246" style="color: #fff"> +919049469246</a>
                        <br>
                        <br>
                        Thank You

                    </div>
                </div>
            </div>
            <div class="modal-footer">
            </div>
        </div>
    </div>
</div>
<div id="aboutModal" class="modal fade" role="dialog">
    <div class="modal-dialog">
        <div class="modal-content" style="background-color:#605ca8 ">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true" style="color: #fff">&times;</span>
                </button>
                <h4 class="modal-title text-center" style="color: #fff">About us</h4>
            </div>
            <div class="modal-body">
                <div style="color: #fff; font-size: 16px; text-align: justify">
                    <ul class="aboutText">
                        <li>
                            MyShejari.com is a proprietary business search portal developed by Technogix group.
                        </li>
                        <li>
                            Technogix group was established in 2016 to form a consortium of Amravati based software engineers in order to take up technical ventures in the region. 
                        </li>
                        <li>
                            Creating an online platform for all small and medium size businesses so as to expand their reach to customers in order to increase their revenue is our goal.
                        </li>
                        <li>
                            MyShejari.com strives to create win-win situation for both consumers and business owners. 
                        </li>
                        <li>
                            MyShejari.com provides a unique,safe and rapid platform for business owners to showcase their product,services and specialities whereas customers get access to huge amount of information like contact details, map locations, offers etc. 
                        </li>
                    </ul>
                </div>
            </div>
            <div class="modal-footer">
            </div>
        </div>
    </div>
</div>
<%
    int yy = 0, mm = 0;
    Calendar c = Calendar.getInstance();
    yy = c.get(Calendar.YEAR);
    mm = c.get(Calendar.MONTH);
%>
<div id="bookCalendarModal" class="modal fade" role="dialog">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title text-center" id="loginModalLabel">Check Availability</h4>
            </div>
            <div class="modal-body">
                <select name="month" id="month" class="col-md-4" style="height: 34px;">
                    <option value="0">Jan</option>
                    <option value="1">Feb</option>
                    <option value="2">March</option>
                    <option value="3">April</option>
                    <option value="4">May</option>
                    <option value="5">Jun</option>
                    <option value="6">Jul</option>
                    <option value="7">Aug</option>
                    <option value="8">Sept</option>
                    <option value="9">Oct</option>
                    <option value="10">Nov</option>
                    <option value="11">Dec</option>
                </select>
                <select name="year" id="year" class="col-md-4" style="height: 34px">
                    <option value="2017">2017</option>
                    <option value="2018">2018</option>
                    <option value="2019">2019</option>
                    <option value="2020">2020</option>
                </select>
                <input type=button id="btnDisplay" class="col-md-4 btn btn-primary" value="Display" onclick="getCalendarMonth()">
                <br><br>
                <div id="showCalendar" class="table-responsive"></div>
            </div>
            <div class="modal-footer">
                <canvas id="myCanvas" width="20" height="10"
                        style="border:1px solid #000000; background-color:red"> 
                </canvas>  Booked Date
                <canvas id="myCanvas" width="20" height="10"
                        style="margin-left: 3px; border:1px solid #000000; background-color:white"> 
                </canvas>  Available Date
            </div>
        </div>
    </div>
    <script>
        $('select option[value=<%=mm%>]').attr('selected','selected');
    </script>
</div>
<div id="loginSuccess" class="modal fade" role="dialog" data-backdrop="static" data-keyboard="false">
    <div class="modal-dialog">
        <div class="modal-content login-modal">
            <div class="modal-header login-modal-header">
                <!--                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>-->
                <h4 class="modal-title text-center" id="loginModalLabel">
                    <i class="fa fa-check bg-green-active" style="color: white; border-radius: 50%; padding: 7px"></i> Login Successful!</h4>
            </div>
            <div class="modal-body text-center">
                <h4>Set Password for the first time<br></h4>
                <div class="tab-content">
                    <div role="tabpanel" class="tab-pane active text-center" id="home">
                        <br>
                        <div class="clearfix"></div>
                        <form>
                            <div class="form-group">
                                <div class="input-group">
                                    <div class="input-group-addon"><i class="fa fa-lock"></i></div>
                                    <input type="password" class="form-control" id="passGoogle" placeholder="Enter Password">
                                </div>
                            </div>
                            <button type="button" id="login_setPass" onclick="googleCheck()" class="btn btn-block bt-login" data-loading-text="Signing In....">Set Password</button>
                            <br>
                            <span class="help-block has-error" style="color: red" id="password-error-google"></span>
                            <br>
                            <br>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<input type="hidden" name="ratingScore" id="ratingScore" value="">

<script src="js/rating.min.js"></script>
<script>
    (function() {
        'use strict';
        var shop = document.querySelector('#shop');
        var data = [
            {
                rating: 5
            }
        ];
        (function init() {
            for (var i = 0; i < data.length; i++) {
                addRatingWidget(buildShopItem(data[i]), data[i]);
            }
        })();

        function buildShopItem(data) {
            var shopItem = document.createElement('div');

            var html = '' +
                '<ul class="c-rating"></ul>';

            shopItem.classList.add('c-shop-item');
            shopItem.innerHTML = html;
            shop.appendChild(shopItem);

            return shopItem;
        }
        var rateVal=0;
        function addRatingWidget(shopItem, data) {
            var ratingElement = shopItem.querySelector('.c-rating');
            var currentRating = data.rating;
            var maxRating = 5;
            var callback = function(rating) { 
                
                rateVal=rating;
                toggleRating(rateVal);
            };
            var r = rating(ratingElement, currentRating, maxRating, callback);
        }
    })();
</script>
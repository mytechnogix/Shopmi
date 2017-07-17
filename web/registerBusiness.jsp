<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <title>Register Your Business - MyShejari.com</title>
        <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
        <link rel="stylesheet" href="bootstrap/css/bootstrap.min.css"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.5.0/css/font-awesome.min.css"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/ionicons/2.0.1/css/ionicons.min.css"/>
        <link rel="stylesheet" href="dist/css/AdminLTE.min.css"/>
        <link rel="stylesheet" href="plugins/datatables/dataTables.bootstrap.css">
        <link rel="stylesheet" href="dist/css/skins/_all-skins.min.css"/>
        <link rel="stylesheet" href="css/carousalOffers.css"/>
        <link rel="stylesheet" href="css/index.css"/>
        <script src="plugins/jQuery/jquery-2.2.3.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/modernizr/2.8.3/modernizr.min.js" type="text/javascript"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-validator/0.4.5/js/bootstrapvalidator.min.js"></script>
        <style>
            #login-after-div, #login-before-div
            {
                display: none;
            }
            #success_message{ display: none;}
        </style>
    </head>
    <body class="hold-transition skin-blue layout-top-nav fixed">
        <div class="wrapper">
            <jsp:include page="header.jsp"/>
            <div class="content-wrapper">
                <section class="content" style="padding-top:0px">
                    <h3 style="margin-left: 4%"><img src="images/shopIcon_sm.png" style="width: 40px">   Register Your Business on MyShejari.com</h3>
                    <div class="row">
                        <div class="col-md-8">
                            <div class="box box-primary">
                                <div class="box-body">
                                    <form class="form-horizontal" action="registerBusinessCheck.jsp" method="post"  id="contact_form">
                                        <fieldset>
                                            <div class="form-group"> 
                                                <div class="col-md-12">
                                                    <label class="col-md-3">City</label>
                                                    <div class="col-md-9 selectContainer">
                                                        <div class="input-group">
                                                            <span class="input-group-addon"><i class="glyphicon glyphicon-list"></i></span>
                                                            <select name="city" class="form-control selectpicker" >
                                                                <option>Amravati</option>
                                                            </select>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <div class="col-md-12">
                                                    <label class="col-md-3">Business Name</label>  
                                                    <div class="col-md-9 inputGroupContainer">
                                                        <div class="input-group">
                                                            <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
                                                            <input  name="businessName" placeholder="Enter Business Name" class="form-control"  type="text" required>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="form-group"> 
                                                <div class="col-md-12">
                                                    <label class="col-md-3">Business Type</label>
                                                    <div class="col-md-9 selectContainer">
                                                        <div class="input-group">
                                                            <span class="input-group-addon"><i class="glyphicon glyphicon-list"></i></span>
                                                            <select name="type" class="form-control selectpicker" >
                                                                <option value="">Select Business Type</option>
                                                                <option value="store">Local Shop</option>
                                                                <option value="hall">Party Hall</option>
                                                                <option value="mes">Mess Service</option>
                                                                <option value="hostel">Property Sell/Rent</option>
                                                            </select>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <div class="col-md-12">
                                                    <label class="col-md-3">Services Offered</label>
                                                    <div class="col-md-9 inputGroupContainer">
                                                        <div class="input-group">
                                                            <span class="input-group-addon"><i class="glyphicon glyphicon-pencil"></i></span>
                                                            <textarea class="form-control" name="services" placeholder="Enter services offered by the business"></textarea>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <div class="col-md-12">
                                                    <label class="col-md-3">Location/Area</label>  
                                                    <div class="col-md-9 inputGroupContainer">
                                                        <div class="input-group">
                                                            <span class="input-group-addon"><i class="glyphicon glyphicon-earphone"></i></span>
                                                            <input name="area" placeholder="Enter your business location" class="form-control" type="text">
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <div class="col-md-12">
                                                    <label class="col-md-3">Email</label>  
                                                    <div class="col-md-9 inputGroupContainer">
                                                        <div class="input-group">
                                                            <span class="input-group-addon"><i class="glyphicon glyphicon-envelope"></i></span>
                                                            <input name="email" placeholder="Enter Email address" class="form-control"  type="email">
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <div class="col-md-12">
                                                    <label class="col-md-3">Mobile Number</label>  
                                                    <div class="col-md-9 inputGroupContainer">
                                                        <div class="input-group">
                                                            <span class="input-group-addon"><i class="glyphicon glyphicon-earphone"></i></span>
                                                            <input name="mob" placeholder="90******99" class="form-control" type="tel">
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <div class="col-md-12">
                                                    <label class="col-md-3">Phone Number</label>  
                                                    <div class="col-md-9 inputGroupContainer">
                                                        <div class="input-group">
                                                            <span class="input-group-addon"><i class="glyphicon glyphicon-earphone"></i></span>
                                                            <input name="phone" pattern="^\d{4}\d{3}\d{4}$" placeholder="072125****25" class="form-control" type="tel">
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <div class="col-md-12">
                                                    <label class="col-md-3">Website</label>  
                                                    <div class="col-md-9 inputGroupContainer">
                                                        <div class="input-group">
                                                            <span class="input-group-addon"><i class="glyphicon glyphicon-home"></i></span>
                                                            <input name="website" placeholder="Enter Website URL" class="form-control"  type="url">
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <div class="col-md-12">
                                                    <label class="col-md-3">Address</label>
                                                    <div class="col-md-9 inputGroupContainer">
                                                        <div class="input-group">
                                                            <span class="input-group-addon"><i class="glyphicon glyphicon-pencil"></i></span>
                                                            <textarea class="form-control" name="address" placeholder="Enter full address"></textarea>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <div class="col-md-12">
                                                    <div class="radio">
                                                        <label>
                                                            <input type="checkbox" name=""> I am authorised to advertise the business above and have read and agree to the privacy policy and terms and conditions
                                                        </label>
                                                    </div>
                                                    <div class="radio">
                                                        <label>
                                                            <input type="checkbox" name=""> I am authorised to advertise the business above and have read and agree to the privacy policy and terms and conditions
                                                        </label>
                                                    </div>
                                                    <div class="radio">
                                                        <label>
                                                            <input type="checkbox" name=""> I am authorised to advertise the business above and have read and agree to the privacy policy and terms and conditions
                                                        </label>
                                                    </div>
                                                </div>
                                            </div>  
                                            <div class="alert alert-success" role="alert" id="success_message">Success <i class="glyphicon glyphicon-thumbs-up"></i> Thanks for contacting us, we will get back to you shortly.</div>
                                            <div class="form-group">
                                                <label class="col-md-3 col-md-12"></label>
                                                <div class="col-md-12">
                                                    <button type="submit" class="btn btn-primary" >Submit <span class="glyphicon glyphicon-send"></span></button>
                                                </div>
                                            </div>
                                        </fieldset>
                                    </form>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="box box-primary">
                                <div class="box-header  bg-blue">
                                    <h3 class="box-title">Why to join MyShejari.com</h3>
                                </div>
                                <div class="box-body">
                                    <ul>
                                        <li>
                                            Display your business in most popular online business directory of Amravati region
                                        </li>
                                        <li>
                                            Improve Visibility in Google searches
                                        </li>
                                        <li>
                                            Business Leads with Instant SMS & Email Enquiries
                                        </li>
                                        <li>
                                            Display your variety of Products & Services by posting pictures and videos
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                </section>
            </div>
        </div>
        <jsp:include page="footer.jsp"/>
        <script src="bootstrap/js/bootstrap.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/raphael/2.1.0/raphael-min.js"></script>
        <script src="plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.all.min.js"></script>
        <script src="plugins/slimScroll/jquery.slimscroll.min.js"></script>
        <script src="plugins/fastclick/fastclick.js"></script>
        <script src="plugins/datatables/jquery.dataTables.min.js"></script>
        <script src="plugins/datatables/dataTables.bootstrap.min.js"></script>
        <script src="dist/js/app.min.js"></script>
        <script src="dist/js/demo.js"></script>
        <script src="js/jquery.newsTicker.min.js"></script> 
        <script src="js/custom.js"></script>
        <script src="https://apis.google.com/js/platform.js"></script>
        <jsp:include page="modals.jsp"/>
        <script>
            $(document).ready(function() {
                $('#contact_form').bootstrapValidator({
                    // To use feedback icons, ensure that you use Bootstrap v3.1.0 or later
                    feedbackIcons: {
                        valid: 'glyphicon glyphicon-ok',
                        invalid: 'glyphicon glyphicon-remove',
                        validating: 'glyphicon glyphicon-refresh'
                    },
                    fields: {
                        businessName: {
                            validators: {
                                stringLength: {
                                    min: 2
                                },
                                notEmpty: {
                                    message: 'Please enter business name'
                                }
                            }
                        },
                        type: {
                            validators: {
                                notEmpty: {
                                    message: 'Please select business type'
                                }
                            }
                        },
                        email: {
                            validators: {
                                notEmpty: {
                                    message: 'Please enter email address'
                                }
                            }
                        },
                        services: {
                            validators: {
                                stringLength: {
                                    min: 2
                                },
                                notEmpty: {
                                    message: 'Please enter business services'
                                }
                            }
                        },
                        mob: {
                            validators: {
                                notEmpty: {
                                    message: 'Please enter your mobile number'
                                },
                                stringLength: {
                                    min: 10,
                                    max: 10
                                },
                                mob: {
                                    message: 'Please enter valid 10 digit mobile number'
                                }
                            }
                        },
                        city: {
                            validators: {
                                notEmpty: {
                                    message: 'Please select your city'
                                }
                            }
                        },
                        area: {
                            validators: {
                                notEmpty: {
                                    message: 'Please enter area/location'
                                }
                            }
                        },
                        address: {
                            validators: {
                                stringLength: {
                                    min: 10,
                                    message:'Please enter at least 10 characters'
                                },
                                notEmpty: {
                                    message: 'Please enter adress of your business'
                                }
                            }
                        }
                    }
                })
                .on('success.form.bv', function(e) {
                    $('#success_message').slideDown({ opacity: "show" }, "slow") // Do something ...
                    $('#contact_form').data('bootstrapValidator').resetForm();

                    // Prevent form submission
                    e.preventDefault();

                    // Get the form instance
                    var $form = $(e.target);

                    // Get the BootstrapValidator instance
                    var bv = $form.data('bootstrapValidator');

                    // Use Ajax to submit form data
                    $.post($form.attr('action'), $form.serialize(), function(result) {
                        console.log(result);
                    }, 'json');
                });
            });
        </script>
    </body>
</html>
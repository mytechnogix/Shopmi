<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <title>Add Offer</title>
        <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
        <jsp:include page="aHeadFiles.jsp"/>
        <script src="plugins/jQuery/jquery-2.2.3.min.js"></script>
        <script>
            var photoFlag=0;
            function formSubmitCheck()
            {
                if(photoFlag==1){
                    return true;
                }
                else{
                    alert("Upload proper image")
                    return false;
                }
            }

            function fileCheck(obj) {
                var fileExtension = ['jpeg', 'jpg', 'png', 'gif', 'bmp'];
                if(photoFlag==1){
                    if ($.inArray($(obj).val().split('.').pop().toLowerCase(), fileExtension) == -1){
                        alert("Only '.jpeg','.jpg', '.png', '.gif', '.bmp' formats are allowed.");
                        photoFlag=0;
                    }
                    else{
                        photoFlag=1;
                    }
                }
                else
                {
                        
                }
            }
            function checkDimension(obj){
                var fileUpload = document.getElementById("fileUpload");
                if (typeof (fileUpload.files) != "undefined") {
                    var reader = new FileReader();
                    reader.readAsDataURL(fileUpload.files[0]);
                    reader.onload = function (e) {
                        var image = new Image();
                        image.src = e.target.result;
                        image.onload = function () {
                            var height = this.height;
                            var width = this.width;
                            //alert(width+" - "+height);
                            if (width<300 || height<250) {
                                alert("Width should be greater than 300px and Height should be greater than 250px");
                                photoFlag = 0;
                            }
                            else{
                                // alert("Uploaded image has valid Height and Width.");
                                photoFlag = 1;
                                fileCheck(obj);
                            }
                        };
                    }
                } else {
                    alert("This browser does not support HTML5.");
                }
            }
        </script>
    </head>
    <body class="hold-transition skin-blue sidebar-mini">
        <div class="wrapper">
            <jsp:include page="aHeader.jsp"/>
            <jsp:include page="aSideMenuLeft.jsp"/>  
            <div class="content-wrapper">
                <section class="content-header">
                    <h1>
                        Add Offer
                        <small>( Step 2 of 2 )</small>
                    </h1>
                    <ol class="breadcrumb">
                        <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
                        <li class="active">Manage Offers</li>
                        <li class="active">Add New Offer</li>
                    </ol>
                </section>
                <section class="content">
                    <div class="row" >
                        <div class="col-md-8">
                            <div class="box box-primary">
                                <div class="box-body">
                                    <%
                                        String oid = request.getParameter("oid");
                                        if (oid != null) {
                                            session.setAttribute("oidAddOffer", oid);
                                        }
                                    %>
                                    <form role="form" ENCTYPE="multipart/form-data" onsubmit="return formSubmitCheck()" action="aAddOfferPhotoCheck.jsp" method="post">
                                        <div class="box-body">
                                            <div class="form-group">
                                                <label> Select Offer Photo</label>
                                                <input type="file" name="file" id="fileUpload" onchange="checkDimension(this)" required>
                                            </div>
                                        </div>
                                        <div class="box-footer">
                                            <a class="btn btn-primary" id="btnCancel" onclick="history.back()">Back</a>
                                            <button type="submit" class="btn btn-primary">Next</button>
                                            <input type="reset" value="Reset" class="btn btn-primary">
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </section>
            </div>
            <jsp:include page="aSideMenuRight.jsp"/>
            <jsp:include page="aFooterFiles.jsp"/>
        </div>
    </body>
</html>

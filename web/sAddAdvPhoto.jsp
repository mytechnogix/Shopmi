<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <title>Add Advertise</title>
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
                //Check whether HTML5 is supported.
                if (typeof (fileUpload.files) != "undefined") {
                    //Initiate the FileReader object.
                    var reader = new FileReader();
                    //Read the contents of Image File.
                    reader.readAsDataURL(fileUpload.files[0]);
                    reader.onload = function (e) {
                        //Initiate the JavaScript Image object.
                        var image = new Image();
                        //Set the Base64 string return from FileReader as source.
                        image.src = e.target.result;
                        image.onload = function () {
                            //Determine the Height and Width.
                            var height = this.height;
                            var width = this.width;
                            //alert(width+" - "+height);
                            if (!(width>859 && width<901) || !(height>399 && height<431)) {
                                alert("Width range should be between : 860px and 900px \nHeight range should be between 400px and 430px");
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
            <jsp:include page="sHeader.jsp"/>
            <jsp:include page="sSideMenuLeft.jsp"/>  
            <div class="content-wrapper">
                <section class="content-header">
                    <h1>
                        Add Advertise Image
                    </h1>
                    <ol class="breadcrumb">
                        <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
                        <li class="active">Manage Advertise</li>
                        <li class="active">Add Photo</li>
                    </ol>
                </section>
                <section class="content">
                    <div class="row" >
                        <div class="col-md-8">
                            <div class="box box-primary">
                                <div class="box-body">
                                    <form role="form" ENCTYPE="multipart/form-data" onsubmit="return formSubmitCheck()" action="sAddAdvPhotoCheck.jsp" method="post">
                                        <div class="box-body">
                                            <div class="form-group">
                                                <label> Select Advertise Photo</label><br>
                                                Ad Banner Size : 
                                                <br>Width should be in range : 860px to 900px
                                                <br>Height should be in range : 400px t0 430px<br>
                                                <a href="images/advphotos/ad_samplebanner.jpg" target="_blank">See Sample Ad Banner</a>
                                                <br><br>
                                                <input type="file" name="file" id="fileUpload" onchange="checkDimension(this)" required>
                                            </div>
                                        </div>
                                        <div class="box-footer">
                                            <a class="btn btn-primary" id="btnCancel" onclick="history.back()">Back</a>
                                            <button type="submit" class="btn btn-primary">Upload</button>
                                            <input type="reset" value="Reset" class="btn btn-primary">
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </section>
            </div>
            <jsp:include page="aFooterFiles.jsp"/>
        </div>
    </body>
</html>

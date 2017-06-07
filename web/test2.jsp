<!DOCTYPE html>  
<html>  
    <head>  
        <title></title>  
        <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet" />  
        <script src="plugins/jQuery/jquery-2.2.3.min.js"></script>  
        <link href="bootstrap/css/star-rating.min.css" rel="stylesheet" />  
        <script src="bootstrap/js/star-rating.js"></script>  

        <script>  
            $(document).ready(function () {  
                $("#input-21b").on("rating.change", function (event, value, caption) {  
                    var ratingValue = $('#hdfRatingValue').val(); 
                    ratingValue = value;  
                    alert(ratingValue);  
                });  
            });  
        </script>  
    </head>  
    <body>  
        <form id="form1">  
            <div>  

                <div class="row">  
                    <div class="col-lg-12">  

                        <input id="input-21a" value="0" type="number" class="rating" data-symbol="*" min=0 max=5 step=0.5 data-size="xl" >  
                        <hr>  
                        <input id="input-21b" type="number" class="rating" min=0 max=5 step=0.5 data-glyphicon="false" data-star-captions="{}" data-default-caption="{rating} Stars" data-size="sm">  
                        <hr>  
                        <input id="input-21c" value="0" type="number" class="rating" min=0 max=8 step=0.5 data-size="xl" data-stars="8">  
                        <hr>  
                        <input id="input-21d" value="2" type="number" class="rating" min=0 max=5 step=0.5 data-size="sm">  
                        <hr>  
                        <input id="input-21e" value="0" type="number" class="rating" min=0 max=5 step=0.5 data-size="xs" >  
                        <hr>  
                    </div>  
                </div>  

            </div>  
            <input type="hidden" id="hdfRatingValue" />  
        </form>  
    </body>  
</html>
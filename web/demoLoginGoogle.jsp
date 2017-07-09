<html>
    <head>
        <meta name="google-signin-client_id" content="38073448623-gp7csemfcamsndl5l9450420ftrasdl4.apps.googleusercontent.com">
    </head>
    <body>
        <image id="googleSignIn" src="images/logoFinal.png"></image>
        <script src="https://apis.google.com/js/platform.js?onload=onLoadGoogleCallback" async defer></script>
        <div id="data"></div>
        <script>
            function onLoadGoogleCallback(){
                gapi.load('auth2', function() {
                    auth2 = gapi.auth2.init({
                        client_id: '38073448623-gp7csemfcamsndl5l9450420ftrasdl4.apps.googleusercontent.com',
                        cookiepolicy: 'single_host_origin',
                        scope: 'profile'
                    });

                    auth2.attachClickHandler(element, {},
                    function(googleUser) {
                        //document.getElementById('data').innerHTML='Signed in: ' + googleUser.getBasicProfile().getName();
                        var profile = googleUser.getBasicProfile();
        
                        googleCheck(profile.getGivenName(),profile.getFamilyName(),profile.getImageUrl(),profile.getEmail());
                    }, function(error) {
                        alert('Sign-in error', error);
                    }
                );
                });

                element = document.getElementById('googleSignIn');
            }

            var xmlHttp
            function googleCheck(fnm, lnm, img, id){
    
                alert(id);
                if (typeof XMLHttpRequest != "undefined"){
                    xmlHttp= new XMLHttpRequest();
                }
                else if (window.ActiveXObject){
                    xmlHttp= new ActiveXObject("Microsoft.XMLHTTP");
                }
                if (xmlHttp==null){
                    alert("Browser does not support XMLHTTP Request")
                    return;
                }
                var url="signInCheck.jsp?&fnm="+fnm+"&lnm"+lnm+"&img="+img+"&id="+id;
                xmlHttp.onreadystatechange = googleCheckOutput;
                xmlHttp.open("GET", url, true);
                xmlHttp.send(null);
            }
            function googleCheckOutput(){
                if (xmlHttp.readyState==4 || xmlHttp.readyState=="complete"){ 
                    alert(xmlHttp.responseText);
                    if(xmlHttp.responseText=="0")
                    {
                        alert("Failed");
             
                        return;
                    }
                    if(xmlHttp.responseText=="1")
                    {
                        window.location.reload();
                    }
                }
            }
            function GetXmlHttpObject()
            {
                if (window.XMLHttpRequest)
                {
                    return new XMLHttpRequest();
                }
                if (window.ActiveXObject)
                {
                    return new ActiveXObject("Microsoft.XMLHTTP");
                }
                return null;
            }
        </script>
    </body>
</html>
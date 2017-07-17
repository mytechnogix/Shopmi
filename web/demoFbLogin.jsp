<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <title></title>
        <link rel="stylesheet" type="text/css" href="">
    </head>
    <body>
        <script>
            window.fbAsyncInit = function() {
                FB.init({
                    appId      : '106818853301815',
                    autoLogAppEvents : true,
                    xfbml      : true,
                    version    : 'v2.9'
                });
                FB.getLoginStatus(function(response){
                    if(response.status === 'connected'){
                        document.getElementById('status').innerHTML = 'we are connected';
                    } else if(response.status === 'not_authorized') {
                        document.getElementById('status').innerHTML = 'we are not logged in.'
                    } else {
                        document.getElementById('status').innerHTML = 'you are not logged in to Facebook';
                    }
                });
                // FB.AppEvents.logPageView();
            };

            (function(d, s, id){
                var js, fjs = d.getElementsByTagName(s)[0];
                if (d.getElementById(id)) {return;}
                js = d.createElement(s); js.id = id;
                js.src = "//connect.facebook.net/en_US/sdk.js";
                fjs.parentNode.insertBefore(js, fjs);
            }(document, 'script', 'facebook-jssdk'));

            function login(){
                FB.login(function(response){
                    if(response.status === 'connected'){
                        document.getElementById('status').innerHTML = 'we are connected';
                        var uid = response.authResponse.userID;
                        var accessToken = response.authResponse.accessToken;
                        getInfo();
                    } else if(response.status === 'not_authorized') {
                        document.getElementById('status').innerHTML = 'we are not logged in.'
                    } else {
                        document.getElementById('status').innerHTML = 'you are not logged in to Facebook';
                    }

                });
            }
            function getInfo() {
                FB.api('/me', 'GET', {fields: 'first_name,last_name,email,id'}, function(response) {
                    document.getElementById('status').innerHTML = response.first_name+", "+response.last_name+", "+response.email+", "+response.id;
                });
            }
        </script>
        <div id="status"></div>
        <button onclick="login()">login</button>
    </body>
</html>
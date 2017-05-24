//admin add offers
var xmlhttp;
var optype="";
function aAddOffer(str)
{
    optype=str;
    var dates=document.getElementById("bothdates").value;
    var offerOn=document.getElementById("offerOn").value;
    var discount=document.getElementById("offerDiscount").value;
    var tc=document.getElementById("offerTC").value;
    var storeId=document.getElementById("offerStoreId").value;
    var totalCoupons=document.getElementById("offerCoupons").value;
    //alert(str);
    // alert(dates+offerOn+discount+tc+storeId+totalCoupons);
    xmlhttp=GetXmlHttpObject();
    if (xmlhttp==null)
    {
        alert ("Your browser does not support Ajax HTTP");
        return;
    }
    var url="aAddOfferCheck.jsp";
    url=url+"?bothdates="+dates+"&offerOn="+offerOn+"&offerDiscount="+discount+"&offerStoreId="+storeId+"&offerCoupons="+totalCoupons+"&offerTC="+tc+"&type="+optype;
    //alert(url);
    xmlhttp.onreadystatechange=aAddOffer_output;
    xmlhttp.open("GET",url,true);
    xmlhttp.send(null);
}
function aAddOffer_output()
{
    //alert();
    if (xmlhttp.readyState==4)
    {
        //alert(xmlhttp.responseText);
        if(xmlhttp.responseText=="1"){
            alert("Offer Added successfully");
            window.location="aAddOfferPhoto.jsp";
        }
        else{
            alert("Failed to add offer");
        }
    //        if(xmlhttp.responseText=="0" && xmlhttp.responseText!="2" && xmlhttp.responseText!="1"){
    //        }
    }
}
//ajax -1
var xmlhttp;
var gtype;
function del(id, type)
{
    gtype = type;
    xmlhttp=GetXmlHttpObject();
    if (xmlhttp==null)
    {
        alert ("Your browser does not support Ajax HTTP");
        return;
    }
    var r=confirm("Do you really want to delete this record?");
    if (r==true)
    {
        var url="aDeleteService.jsp";
        url=url+"?id="+id+"&type="+type;
        xmlhttp.onreadystatechange=getOutput;
        xmlhttp.open("GET",url,true);
        xmlhttp.send(null);
    }
    else
    {}
}
function getOutput()
{
    if (xmlhttp.readyState==4)
    {
        //   alert(xmlhttp.responseText);
        if(xmlhttp.responseText=="1"){
            window.location.reload();
        }
        else{
            alert("Failed to delete");
        }
    }
}

//ajax -2
var xmlhttp;
var gtype="";
function changeStatus(id,status,type)
{
    gtype = type;
    xmlhttp=GetXmlHttpObject();
    if (xmlhttp==null)
    {
        alert ("Your browser does not support Ajax HTTP");
        return;
    }
    var url="aStatusChangeService.jsp";
    url=url+"?id="+id+"&status="+status+"&type="+type;
    xmlhttp.onreadystatechange=getOutput1;
    xmlhttp.open("GET",url,true);
    xmlhttp.send(null);
}
function getOutput1()
{
    if (xmlhttp.readyState==4)
    {
        if(xmlhttp.responseText=="1")
        {
            location.reload();
        }
    }
}
// check login before claiming offer
function checkLogin(){
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
    // alert(id+" "+pass);
    var url="checkOfferLogin.jsp";
    xmlHttp.onreadystatechange=checkOfferLoginOutput;
    xmlHttp.open("GET",url,true);
    xmlHttp.send(null);
}
function checkOfferLoginOutput(){
    if (xmlHttp.readyState==4 || xmlHttp.readyState=="complete"){ 
        //var someString = xmlHttp.responseText;
        //  alert(someString);
        if(xmlHttp.responseText=="0"){
            // alert("You must login first");
            //     $('#offerModal').modal('hide');    
            //$('#loginModal').modal({backdrop: 'static', keyboard: false})
            $('#loginModal').modal('show');           
        }
        if(xmlHttp.responseText=="1")
        {
            //            alert("call another ajax here");
            getOffer($("#oid").val(), $("#sid").val());
        }
    }
}
var xmlHttp;
function getOffer(oid, sid){
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
    var url="generateCoupon.jsp";
    url +="?oid="+oid+"&sid="+sid;
    //    $('#offerModal').modal({
    //        backdrop: 'static', 
    //        keyboard: false
    //    })
    $('.modal-footer').hide();     
    $('#offerModal').modal('show');           
    xmlHttp.onreadystatechange=getOfferOutput;
    xmlHttp.open("GET",url,true);
    xmlHttp.send(null);   
}
function getOfferOutput(){
    if (xmlHttp.readyState==4 || xmlHttp.readyState=="complete"){ 
        //alert(xmlHttp.responseText);
        if(xmlHttp.responseText=="0"){
            $("#modalImg_offer").attr("src","images/wrongIcon.png");
            $("#modalMsg_offer").text("Sorry! No coupons available ");
            $('.modal-footer').show();     
            $('#offerModal').modal('show');           
        }
        else if(xmlHttp.responseText=="2")
        {
            $("#modalImg_offer").attr("src","images/wrongIcon.png");
            $("#modalMsg_offer").text("You have already claimed coupon for this offer");
            $('.modal-footer').show();     
            $('#offerModal').modal('show');         
        }
        else if(xmlHttp.responseText=="3")
        {
            $("#modalImg_offer").attr("src","images/wrongIcon.png");
            $("#modalMsg_offer").text("Sorry! No Coupons Available");
            $('.modal-footer').show();     
            $('#offerModal').modal('show');         
        }
        else
        {
            $("#modalCouponCode").text(xmlHttp.responseText);
            $('#offerModal').modal('hide');           
            $('#couponModal').modal('show');              
        }
    }
}
// ajax-check login details
var idFlag=false;
var passFlag=false;
function loginCheck1(str){
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
    if(str=="1"){
        var id=document.getElementById("emailLog").value;
        var pass=document.getElementById("passLog").value;
        // alert(id+" "+pass);
        if(id!='' && !id.length<=0 )
        {
            idFlag=true;
        }
        else
        {
            document.getElementById("emailLog").focus();
        }
        if(idFlag){
            if(pass!='' && !pass.length<=0 )
            {
                passFlag=true;
            }
            else
            {
                document.getElementById("passLog").focus();
            }
        }
        if(idFlag && passFlag){
            var url="loginCheck.jsp";
            url +="?id="+id+"&pass="+pass+"&log=1";
            xmlHttp.onreadystatechange=loginCheckOutput;
            xmlHttp.open("GET",url,true);
            xmlHttp.send(null);
        }
    }

    else
    {
        var url="loginCheck.jsp";
        url +="?log=0";
        xmlHttp.onreadystatechange=loginCheckOutput;
        xmlHttp.open("GET",url,true);
        xmlHttp.send(null);   
    }
}
function loginCheckOutput(){
    if (xmlHttp.readyState==4 || xmlHttp.readyState=="complete"){ 
        // alert(xmlHttp.responseText);
        if(xmlHttp.responseText=="1" || xmlHttp.responseText=="0"){
            window.location.reload();
        }
        if(xmlHttp.responseText=="2")
        {
            $("#loginError").show();
        }
    }
}
// ajax-check registration details
function registerUser(){
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
    var id=document.getElementById("emailReg");
    var pass=document.getElementById("passReg");
    var fnm=document.getElementById("fnmReg");
    var lnm=document.getElementById("lnmReg");
    var cpass=document.getElementById("cpassReg");
    
    //alert(id+" "+fnm+" "+lnm+" "+pass+" "+cpass);
    //var mailformat = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;  

    if(id.value.trim()=='' || id.value.trim().length<=0  )
    {
        id.focus();
        $("#regSuccess").hide();
        $("#regError").text("Email address name cannot be empty");
        $("#regError").show();
    }
    else if(fnm.value.trim()=='' || fnm.value.trim().length<=0 )
    {
        fnm.focus();
        $("#regSuccess").hide();
        $("#regError").text("First name cannot be empty");
        $("#regError").show();
    }
    else if(lnm.value.trim()=='' || lnm.value.trim().length<=0){
        lnm.focus();
        $("#regSuccess").hide();
        $("#regError").text("Last name cannot be empty");
        $("#regError").show();
    }
    else if(pass.value.trim()=='' || pass.value.trim().length<=0){
        pass.focus();
        $("#regSuccess").hide();
        $("#regError").text("Password cannot be empty");
        $("#regError").show();
    }
    else if(cpass.value.trim()=='' || cpass.value.trim().length<=0){
        cpass.focus();
        $("#regSuccess").hide();
        $("#regError").text("Confirm password cannot be empty");
        $("#regError").show();
    }
    else if(pass.value.trim()!=cpass.value.trim()){
        $("#regSuccess").hide();
        $("#regError").text("Passwords Mismatched!");
        $("#regError").show();
    }
    else
    {
        //alert("submitted");
        var url="registerCheck.jsp";
        url +="?email="+id.value+"&fnm="+fnm.value+"&lnm="+lnm.value+"&pass="+pass.value;
        xmlHttp.onreadystatechange=registerUserOutput;
        xmlHttp.open("GET",url,true);
        xmlHttp.send(null);
    }
}
function registerUserOutput(){
    if (xmlHttp.readyState==4 || xmlHttp.readyState=="complete"){ 
        //   alert(xmlHttp.responseText);
        if(xmlHttp.responseText=="1"){
            $("#regError").hide();
            $("#register_btn").attr("disabled", "disabled");
            $("#regSuccess").show();

        }
        else if(xmlHttp.responseText=="0")
        {
            $("#regSuccess").hide();
            $("#regError").text("Registration Failed!");
            $("#regError").show();
        }
        else if(xmlHttp.responseText=="2")
        {
            $("#regSuccess").hide();
            $("#regError").text("Already registered!");
            $("#regError").show();                
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

//add store vaidations

$("#txtOfferStoreArea").attr("disabled", "disabled");
$("#txtOfferStoreCat").attr("disabled", "disabled");

$("#ddlOfferStoreArea").change(function() {
    var opt = $(this).find('option:selected').val();
    if(opt=="Other")
    {
        $("#txtOfferStoreArea").removeAttr("disabled");
    }
    else
    {
        $("#txtOfferStoreArea").attr("disabled", "disabled");
    }
});
$("#ddlOfferStoreCat").change(function() {
    var opt = $(this).find('option:selected').val();
    if(opt=="Other")
    {
        $("#txtOfferStoreCat").removeAttr("disabled");
    }
    else
    {
        $("#txtOfferStoreCat").attr("disabled", "disabled");
    }
});
// admin - validate add store - step 1

function validateAddStore(){
    var location = $('#txtLocation');  
    var lat = $('#txtLat');  
    var longi = $('#txtLong');  
    
    if (location.val() == null || location.val() == '') {  
        alert('Location cannot be blank');
        location.focus();
        return false;
    }  
    if (lat.val() == null || lat.val() == '') {  
        alert('Drag marker on store location to get latitude filled automatically');
        lat.focus();
        return false;
    }
    if (longi.val() == null || longi.val() == '') {  
        alert('Drag marker on store location to get longitude filled automatically');
        longi.focus();
        return false;
    }  
    return true;
}
$(document).on('click','.signup-tab',function(e){
    e.preventDefault();
    $('#signup-taba').tab('show');
});	

$(document).on('click','.signin-tab',function(e){
    e.preventDefault();
    $('#signin-taba').tab('show');
});

$(document).on('click','.forgetpass-tab',function(e){
    e.preventDefault();
    $('#forgetpass-taba').tab('show');
});


function setSearchCat(str)
{
    window.location = "search.jsp?search="+str;
}
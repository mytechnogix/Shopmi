$(document).on('click','.product-info', function() {
    $parent_box = $(this).closest('.boxr');
    $parent_box.siblings().find('.bottom').slideUp();
    $parent_box.find('.bottom').slideToggle(1000, 'swing');
});

$('#tooltipMap').tooltip().eq(0).tooltip('show').tooltip('disable').one('mouseout', function() {
    $(this).tooltip('enable');
});

setTimeout(function() {
    $('#tooltipMap').tooltip().eq(0).tooltip('hide').tooltip('enable');
}, 5000);

$(window).scroll(function() {

    if ($(this).scrollTop()>0)
    {
        $('#tooltipMap').tooltip('hide');
    }
    else
    {
    }
});
 
//ajax -get suggestions
var xmlHttp;
var searchQuery;
function getSuggestionsAjax(){
    var filter = $('input:radio[name=filterChk]:checked').val();
    var str = $("#autocomplete").val().trim();
    searchQuery = str;
    //    alert(filter+str);
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
    var url="getSuggestAjax.jsp";
    url +="?query=" +str+"&filter="+filter;
    xmlHttp.onreadystatechange = getSuggestionsOutput;
    xmlHttp.open("GET", url, true);
    xmlHttp.send(null);
}
function getSuggestionsOutput(){
    if (xmlHttp.readyState==4 || xmlHttp.readyState=="complete"){ 
        var someString = xmlHttp.responseText;
        // alert(xmlHttp.responseText);
        var count = 0;
        var pos = someString.indexOf("<tr");
        while(pos > -1){
            ++count;
            pos = someString.indexOf("<tr", ++pos);
        }
        //alert(count);
        if(count>=3)
        {
            count=count-2;
        }
        else if(count==2)
        {
            count=0;
        }
        //document.getElementById("showCount").innerHTML=count;
        $("#showData").html(xmlHttp.responseText);
        // alert($("#showData").height());
        document.getElementById("showCount").innerHTML=count;
        $("#resFor").text(searchQuery);
        $("#example1").DataTable();
        $('#example2').DataTable({
            "paging": true,
            "lengthChange": false,
            "searching": false,
            "ordering": false,
            "info": true,
            "autoWidth": false
        });

        $("#example1_filter").hide();
        $("#example1_length").hide();
        
    }
}
//admin add offers
var xmlhttp;
var optype="";
function aAddOffer(str)
{
    //alert(str);
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
    if (xmlhttp.readyState==4)
    {
        //alert(xmlhttp.responseText);
        if(xmlhttp.responseText=="1"){
            if(optype=="000"){
                alert("Offer Added successfully");
                window.location="aAddOfferPhoto.jsp";
            }
            if(optype=="222")
            {
                alert("Offer details added successfully");
                window.location="sStoreOfferDetails.jsp";
            }
        }
        else if(xmlhttp.responseText=="2"){
            alert("Offer already exist");
        }
        else{
            alert("Failed to add offer");
        }
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
var xmlhttp;
var eType="";
function saveEnquiry(str)
{
    eType=str;
    xmlhttp=GetXmlHttpObject();
    if (xmlhttp==null)
    {
        alert ("Your browser does not support Ajax HTTP");
        return;
    }
    var enqType = str;
    var enqId = $("#id").val();
    var enqSub="";
    var enqDesc="";
    if(enqType=="store"){
        enqSub = document.forms["enqFormStore"]["txtEnqSubject"].value;
        enqDesc = document.forms["enqFormStore"]["txtEnqDesc"].value;
    }
    else if(enqType=="hall"){
        enqSub = document.forms["enqFormHall"]["txtEnqSubject"].value;
        enqDesc = document.forms["enqFormHall"]["txtEnqDesc"].value;        
    }
    else if(enqType=="mes"){
        enqSub = document.forms["enqFormMes"]["txtEnqSubject"].value;
        enqDesc = document.forms["enqFormMes"]["txtEnqDesc"].value;        
    }
    else
    {
            
    }
    // alert(enqType+enqSub+enqDesc+enqId);
    if(enqSub.trim()=="" || enqSub.trim().length==0){
        document.forms["enqFormHall"]["txtEnqSubject"].focus();
    }
    else if(enqDesc.trim()=="" || enqDesc.trim().length==0){
        document.forms["enqFormHall"]["txtEnqDesc"].focus();
    }
    else{
        var url="enquiryCheck.jsp";
        url=url+"?type="+enqType+"&sub="+enqSub+"&desc="+enqDesc+"&sid="+enqId;
        xmlhttp.onreadystatechange=saveEnquiryOutput;
        xmlhttp.open("GET",url,true);
        xmlhttp.send(null);
    }
}
function saveEnquiryOutput()
{
    if (xmlhttp.readyState==4)
    {
        //alert(xmlhttp.responseText);
        if(xmlhttp.responseText=="1"){
            //  alert(eType);
            if(eType=="store"){
                $('#enquiryModalShop').modal('hide');   
                $('#enquiryModalSuccess').modal('show'); 
                $("#enquiredStore").addClass("changeColor");
            }
            else if(eType=="hall")
            {
                $('#enquiryModalHall').modal('hide');   
                $('#enquiryModalSuccess').modal('show'); 
                $("#enquiredHall").addClass("changeColor");
            }
            else if(eType=="mes")
            {
                $('#enquiryModalMes').modal('hide');   
                $('#enquiryModalSuccess').modal('show'); 
                $("#enquiredMes").addClass("changeColor");
            }
        }
        else{
            $("#modalMsgEnq").text("Failed to send enquiry");
            $('#enquiryModalSuccess').modal('show');  
        }
    }
}
var XmlHttp;
function checkIconColor()
{
    XmlHttp=GetXmlHttpObject();
    if (XmlHttp==null)
    {
        alert ("Your browser does not support Ajax HTTP");
        return;
    }
    var enqid = $("#id").val();
    var type = $("#type").val();
    
    // alert(enqid+type);
    var url="checkIconColor.jsp";
    url=url+"?id="+enqid+"&type="+type;
    XmlHttp.onreadystatechange=checkIconColorOutput;
    XmlHttp.open("GET",url,true);
    XmlHttp.send(null);
}
function checkIconColorOutput()
{
    if (XmlHttp.readyState==4)
    {
        //alert(XmlHttp.responseText);
        if((XmlHttp.responseText).startsWith("1") || (XmlHttp.responseText).startsWith("0")){
            var str = XmlHttp.responseText;
            var strarray = str.split(',');
            for (var i = 0; i < strarray.length; i++) {
                if(strarray[i]=="1" && i==0)
                {
                    $("#addFav").toggleClass("changeColor");
                }
                if(strarray[i]=="1" && i==1)
                {
                    $("#rated").addClass("changeColor");
                }
                if(strarray[i]=="1" && i==2)
                {
                    //          alert("");
                    $("#enquiredHall").addClass("changeColor");
                    $("#enquiredStore").addClass("changeColor");
                    $("#enquiredMes").addClass("changeColor");
                }
                if(strarray[i]=="1" && i==3)
                {
                    $("#settingsTabRev").hide();
                    $("#successReviewMsg").hide();
                    $("#editReviewMsg").show();
                }
            }
        }
    }
}
//ajax -2

var xmlhttp;
function toggleFav()
{
    xmlhttp=GetXmlHttpObject();
    if (xmlhttp==null)
    {
        alert ("Your browser does not support Ajax HTTP");
        return;
    }
    var enqid = $("#id").val();
    var type = $("#type").val();

    var url="toggleFavCheck.jsp";
    url=url+"?id="+enqid+"&type="+type;
    xmlhttp.onreadystatechange=toggleFavOutput;
    xmlhttp.open("GET",url,true);
    xmlhttp.send(null);
}
function toggleFavOutput()
{
    if (xmlhttp.readyState==4)
    {
        //alert(xmlhttp.responseText);
        if(xmlhttp.responseText=="1"){
            $("#addFav").toggleClass("changeColor");
        }
    }
}

var xmlhttp;
function submitReview()
{
    xmlhttp=GetXmlHttpObject();
    if (xmlhttp==null)
    {
        alert ("Your browser does not support Ajax HTTP");
        return;
    }
    var enqid = $("#id").val();
    var type = $("#type").val();
    var review = $("#txtAreaReview").val().trim();
    
    //alert(enqid+type+review);
    if(review=="" || review==null)
    {
        $("#txtAreaReview").focus();
        return;
    }
    
    var url="submitReviewCheck.jsp";
    url=url+"?id="+enqid+"&type="+type+"&review="+review;
    xmlhttp.onreadystatechange=submitReviewOutput;
    xmlhttp.open("GET",url,true);
    xmlhttp.send(null);
}
function submitReviewOutput()
{
    if (xmlhttp.readyState==4)
    {
        //alert(xmlhttp.responseText);
        if(xmlhttp.responseText=="1"){
            $("#settingsTabRev").hide();
            $("#successReviewMsg").show();
            alert("Your review posted successfully");
            window.location.reload();
            
        }
    }
}

var xmlhttp;
var rateVal;
function toggleRating(str)
{
    // alert(str);
    rateVal=str;
    xmlhttp=GetXmlHttpObject();
    if (xmlhttp==null)
    {
        alert ("Your browser does not support Ajax HTTP");
        return;
    }
    var enqid = $("#id").val();
    var type = $("#type").val();
    
    var url="toggleRatingCheck.jsp";
    url=url+"?id="+enqid+"&type="+type+"&rating="+rateVal;
    xmlhttp.onreadystatechange=toggleRatingOutput;
    xmlhttp.open("GET",url,true);
    xmlhttp.send(null);
}
function toggleRatingOutput()
{
    if (xmlhttp.readyState==4)
    {
        alert(xmlhttp.responseText);
        if(xmlhttp.responseText=="1"){
            $("#shop").hide();  
            $("#rateMsg").text("You have rated "+rateVal + " stars to this shop");
            $("#rateMsg").show();  
            $("#rateThanks").show();  
            $("#rated").addClass("changeColor");  

        }
    }
}

var xmlHttp;
function getUserRatedCount()
{
    xmlHttp=GetXmlHttpObject();
    if (xmlHttp==null)
    {
        alert ("Your browser does not support Ajax HTTP");
        return;
    }
    var enqid = $("#id").val();
    var type = $("#type").val();
    
    var url="getUserRatedCount.jsp";
    url=url+"?id="+enqid+"&type="+type;
    xmlHttp.onreadystatechange=getUserRatedCountOutput;
    xmlHttp.open("GET",url,true);
    xmlHttp.send(null);
}
function getUserRatedCountOutput()
{
    if (xmlHttp.readyState==4)
    {
        //alert(xmlHttp.responseText);
        var res=xmlHttp.responseText;
        if(res=="1" || res=="2" || res=="3" || res=="4" || res=="5"){
            $("#ratingScore").val(res);  
        }
    }
}

var xmlhttp;
var gtype="";
function changeStatus(id,status,type)
{
    //alert("");
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
        //alert(xmlhttp.responseText);
        if(xmlhttp.responseText=="1")
        {
            window.location.reload();
        }
    }
}
// check login before claiming offer
var op;
function checkLogin(str){
    op=str;
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
        if(xmlHttp.responseText=="0"){
            $('#loginModal').modal('show');           
        }
        if(xmlHttp.responseText=="1")
        {
            if(op=="offer"){
                getOffer($("#oid").val(), $("#sid").val());
            }
            else if(op=="enq")
            {
                if($("#type").val()=="store")
                    $('#enquiryModalShop').modal('show');     
                else if($("#type").val()=="hall")
                    $('#enquiryModalHall').modal('show');   
                else if($("#type").val()=="mes")
                    $('#enquiryModalMes').modal('show');   
            }
            else if(op=="fav")
            {
                toggleFav();     
            }
            else if(op=="rate")
            {
                $('#ratingModal').modal('show');        
            }
            else if(op=="hostel")
            {
                $('#contactHostelModal').modal('show');        
            }
            else if(op=="uLogin")
            {
                window.location="mycart.jsp";        
            }
        }
    }
}
var xmlHttp;
function getOffer(oid, sid){
    
    // alert(oid+" - "+sid);
    if(oid==undefined || oid==null || sid==undefined || sid==null)
    {
        return;
    }
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

        var atpos = id.indexOf("@");
        var dotpos = id.lastIndexOf(".");
        if (atpos<1 || dotpos<atpos+2 || dotpos+2>=id.length) {
            $("#emailLog").focus();
            $("#loginError").text("Invalid email id");
            $("#loginError").show();
            return false;
        }
        else{
            $("#loginError").hide();
            idFlag=true;
        }
        if(idFlag){
            if(pass!='' && !pass.length<=0 )
            {
                $("#loginError").hide();
                passFlag=true;
            }
            else
            {
                $("#passLog").focus();
                $("#loginError").text("Invalid password");
                $("#loginError").show();
            }
        }
        if(idFlag && passFlag){
            $("#loginError").hide();
            var url="loginCheck.jsp";
            url +="?id="+id+"&pass="+pass+"&log=1";
            xmlHttp.onreadystatechange=loginCheckOutput;
            xmlHttp.open("GET",url,true);
            xmlHttp.send(null);
        }
    }

    else
    {
        $("#loginError").hide();
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
            $("#loginError").hide();
            window.location.reload();
        }
        if(xmlHttp.responseText=="2")
        {
            $("#loginError").text("Login failed, Invalid username or password");
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

    var atpos = id.value.indexOf("@");
    var dotpos = id.value.lastIndexOf(".");
    if (atpos<1 || dotpos<atpos+2 || dotpos+2>=id.length) {
        id.focus();
        $("#regSuccess").hide();
        $("#regError").text("Invalid email address");
        $("#regError").show();
        return false;
    }
    else if(fnm.value.trim()=='' || fnm.value.trim().length<=1 || !/^[a-zA-Z]*$/g.test(fnm.value.trim()))
    {
        fnm.focus();
        $("#regSuccess").hide();
        $("#regError").text("Enter first name properly");
        $("#regError").show();
    }
    else if(lnm.value.trim()=='' || lnm.value.trim().length<=1 || !/^[a-zA-Z]*$/g.test(lnm.value.trim())){
        lnm.focus();
        $("#regSuccess").hide();
        $("#regError").text("Enter last name properly");
        $("#regError").show();
    }
    else if(pass.value.trim()=='' || pass.value.trim().length<=5){
        pass.focus();
        $("#regSuccess").hide();
        $("#regError").text("Password length should be minimum 6 characters");
        $("#regError").show();
    }
    else if(cpass.value.trim()=='' || cpass.value.trim().length<=5){
        cpass.focus();
        $("#regSuccess").hide();
        $("#regError").text("Confirm password length should be minimum 6 characters");
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
        url +="?email="+id.value+"&fnm="+fnm.value+"&lnm="+lnm.value+"&pass="+pass.value+"&img=default.jpg";
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
//amenities count
var xmlhttp;
var amenities="";
var opType="";
function checkAmenities(str)
{
    //alert("");
    opType=str;
    amenities="";
    if($("#lift").is(':checked')){
        amenities+="1,";
    } else {
        amenities+="0,";
    }
    if($("#ac").is(':checked')){
        amenities+="1,";
    } else {
        amenities+="0,";
    }
    if($("#swim").is(':checked')){
        amenities+="1,";
    } else {
        amenities+="0,";
    }
    if($("#harvest").is(':checked')){
        amenities+="1,";
    } else {
        amenities+="0,";
    }
    if($("#servantroom").is(':checked')){
        amenities+="1,";
    } else {
        amenities+="0,";
    }
    if($("#gas").is(':checked')){
        amenities+="1,";
    } else {
        amenities+="0,";
    }
    if($("#gym").is(':checked')){
        amenities+="1,";
    } else {
        amenities+="0,";
    }
    if($("#power").is(':checked')){
        amenities+="1,";
    } else {
        amenities+="0,";
    }
    if($("#firesafe").is(':checked')){
        amenities+="1,";
    } else {
        amenities+="0,";
    }
    if($("#club").is(':checked')){
        amenities+="1,";
    } else {
        amenities+="0,";
    }
    if($("#play").is(':checked')){
        amenities+="1,";
    } else {
        amenities+="0,";
    }
    if($("#security").is(':checked')){
        amenities+="1,";
    } else {
        amenities+="0,";
    }
    if($("#park").is(':checked')){
        amenities+="1,";
    } else {
        amenities+="0,";
    }
    if($("#housekeeping").is(':checked')){
        amenities+="1,";
    } else {
        amenities+="0,";
    }
    if($("#internet").is(':checked')){
        amenities+="1,";
    } else {
        amenities+="0,";
    }
    if($("#parking").is(':checked')){
        amenities+="1";
    } else {
        amenities+="0";
    }
    alert(amenities);
    xmlhttp=GetXmlHttpObject();
    if (xmlhttp==null)
    {
        alert ("Your browser does not support Ajax HTTP");
        return;
    }
    //alert($("#hostidAdd").val());
    var url="aAddHostelAmenitiesCheck.jsp";
    url=url+"?id="+$("#hostidAdd").val()+"&amenities="+amenities;
    xmlhttp.onreadystatechange=checkAmenitiesOutput;
    xmlhttp.open("GET",url,true);
    xmlhttp.send(null);
}
function checkAmenitiesOutput()
{
    if (xmlhttp.readyState==4)
    {
        //alert(xmlhttp.responseText);
        if(xmlhttp.responseText=="1"){
            if(opType=="add")
                window.location="aAddHostelPhoto.jsp";
            if(opType=="update")
                window.location="aManageHostels.jsp";
        }
        else{
            alert("Failed to add Amenities");
        }
    }
}

//ajax - user forgot password
var xmlHttp
function forgetCheck(){
    var x = $("#fEmail").val().trim();
    //alert(x);
    var atpos = x.indexOf("@");
    var dotpos = x.lastIndexOf(".");
    if (atpos<1 || dotpos<atpos+2 || dotpos+2>=x.length) {
        $("#fEmail").focus();
        $("#forgetError").text("Invalid email address");
        $("#forgetError").show();
        return;
    }
    $("#reset_btn").attr("disabled","disabled");
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
    $("#forgetError").hide();
    var url="forgetCheck.jsp?id="+x;
    xmlHttp.onreadystatechange = forgetCheckOutput;
    xmlHttp.open("GET", url, true);
    xmlHttp.send(null);
}
function forgetCheckOutput(){
    if (xmlHttp.readyState==4 || xmlHttp.readyState=="complete"){ 
        //alert(xmlHttp.responseText);
        if(xmlHttp.responseText=="1")
        {
            $("#forgetSuccess").text("New password has sent to your mail id")
            $("#reset_btn").attr("disabled","disabled");
            $("#forgetError").hide();
            $("#forgetSuccess").show();
        }
        else if(xmlHttp.responseText=="2")
        {
            $("#forgetSuccess").hide();
            $("#reset_btn").removeAttr("disabled");
            $("#forgetError").text("User does not exist")
            $("#forgetError").show();
        }
        else
        {
            $("#reset_btn").removeAttr("disabled");
            $("#forgetError").text("Failed to reset password")
            $("#forgetError").show();
            $("#forgetSuccess").hide();
        }
    }
}

//ajax - business forgot password
var xmlHttp
function busForgetCheck(){
    var x = $("#busEmail").val().trim();
    var type = $("#busType").val().trim();
    //alert(x);
    var atpos = x.indexOf("@");
    var dotpos = x.lastIndexOf(".");
    if (atpos<1 || dotpos<atpos+2 || dotpos+2>=x.length) {
        $("#busEmail").focus();
        $("#forgetError").text("Invalid email address");
        $("#forgetError").show();
        return;
    }
    $("#reset_btn").attr("disabled","disabled");
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
    $("#forgetError").hide();
    var url="forgetCheckBus.jsp?email="+x+"&type="+type;
    xmlHttp.onreadystatechange = busForgetCheckOutput;
    xmlHttp.open("GET", url, true);
    xmlHttp.send(null);
}
function busForgetCheckOutput(){
    if (xmlHttp.readyState==4 || xmlHttp.readyState=="complete"){ 
        //alert(xmlHttp.responseText);
        if(xmlHttp.responseText=="1")
        {
            $("#forgetSuccess").html("<h3>New password has sent to your mail id</h3>");
            $("#reset_btn").attr("disabled","disabled");
            $("#forgetError").hide();
            $("#forgetSuccess").show();
        }
        else if(xmlHttp.responseText=="2")
        {
            $("#forgetSuccess").hide();
            $("#reset_btn").removeAttr("disabled");
            $("#forgetError").text("Business does not exist");
            $("#forgetError").show();
        }
        else
        {
            $("#reset_btn").removeAttr("disabled");
            $("#forgetError").text("Failed to reset password");
            $("#forgetSuccess").hide();
            $("#forgetError").show();
        }
    }
}
//ajax - redirect to offer page of particular store
var xmlHttp
function redirectToOffer(){
    var id = $("#id").val();
    //alert(id);
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
    var url="redirectToOffer.jsp?id="+id;
    xmlHttp.onreadystatechange = redirectToOfferOutput;
    xmlHttp.open("GET", url, true);
    xmlHttp.send(null);
}
function redirectToOfferOutput(){
    if (xmlHttp.readyState==4 || xmlHttp.readyState=="complete"){ 
        //alert(xmlHttp.responseText);
        if(xmlHttp.responseText=="0")
        {
            //alert("No offer available for this shop");
            $("#modalImg_offer").attr("src","images/wrongIcon.png");
            $("#modalMsg_offer").text("Sorry! Currently there is no offer available for this shop");
            $('.modal-footer').show();     
            $('#offerModal').modal('show');       
            return;
        }
        if(xmlHttp.responseText!="0")
        {
            window.location="offerDetails.jsp?id="+xmlHttp.responseText;
        }
    }
}

//ajax - use coupons
var xmlHttp
function useCoupon(str){
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
    
    var r=confirm("Do you really want to use this coupon?");
    if (r==true)
    {
        var url="useCoupon.jsp?cid="+str;
        xmlHttp.onreadystatechange = useCouponOutput;
        xmlHttp.open("GET", url, true);
        xmlHttp.send(null);
    }
    else
    {
        return;
    }
}
function useCouponOutput(){
    if (xmlHttp.readyState==4 || xmlHttp.readyState=="complete"){ 
        //alert(xmlHttp.responseText);
        if(xmlHttp.responseText=="1")
        {
            window.location.reload();
        }
        if(xmlHttp.responseText=="0")
        {
            alert("Failed to apply coupon");
        }
    }
}

//ajax - use coupons
var xmlHttp
function subscribePromotions(){
    var x = $("#txtSubscribe").val().trim();
    var atpos = x.indexOf("@");
    var dotpos = x.lastIndexOf(".");
    if (atpos<1 || dotpos<atpos+2 || dotpos+2>=x.length) {
        $("#fEmail").focus();
        $("#promoError").text("Invalid email address");
        $("#promoError").show();
        return;
    }
    $("#promoError").hide();
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
    var url="subscribePromotions.jsp?email="+x;
    xmlHttp.onreadystatechange = subscribePromotionsOutput;
    xmlHttp.open("GET", url, true);
    xmlHttp.send(null);
}
function subscribePromotionsOutput(){
    if (xmlHttp.readyState==4 || xmlHttp.readyState=="complete"){ 
        //alert(xmlHttp.responseText);
        if(xmlHttp.responseText=="1")
        {
            alert("Your subscription is successful.\nWe will mail you about latest offers/promotions\nThank you for subscribing");
        }
        else if(xmlHttp.responseText=="2"){
            $("#promoError").text("Already subscribed for promotions/offers");
            $("#promoError").show();
        }
        else
        {
            $("#promoError").text("Failed to apply for promotions");
            $("#promoError").show();
        }
    }
}

//ajax - admin search business
var xmlHttp
function aSearchBusiness(){
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
    var str = $('#searchBus').val().trim();
    if(str!="" && str!=null){
        var url="aGetBusSuggestions.jsp?query="+str;
        xmlHttp.onreadystatechange = aSearchBusinessOutput;
        xmlHttp.open("GET", url, true);
        xmlHttp.send(null);
    }
    else
    {
        return;
    }
}
function aSearchBusinessOutput(){
    if (xmlHttp.readyState==4 || xmlHttp.readyState=="complete"){ 
        //alert(xmlHttp.responseText);
        $("#searchRes").html(xmlHttp.responseText);
    }
}
//ajax - admin search business
var xmlHttp
function aSearchAdvertise(){
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
    var str = $('#searchAdv').val().trim();
    if(str!="" && str!=null){
        var url="aGetAdvSuggestions.jsp?query="+str;
        xmlHttp.onreadystatechange = aSearchAdvertiseOutput;
        xmlHttp.open("GET", url, true);
        xmlHttp.send(null);
    }
    else
    {
        return;
    }
}
function aSearchAdvertiseOutput(){
    if (xmlHttp.readyState==4 || xmlHttp.readyState=="complete"){ 
        //alert(xmlHttp.responseText);
        $("#searchRes").html(xmlHttp.responseText);
    }
}
//ajax - admin start business subscription
var xmlHttp
function aStartBusSubscription(){
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
    var id = $('#busid').val();
    var type = $('#bustype').val();
    var date = $('#date').val();
    
    if (date.match(/^(?:(0[1-9]|1[012])[\- \/.](0[1-9]|[12][0-9]|3[01])[\- \/.](19|20)[0-9]{2})$/)){
    }else{
        $("#date").focus();
        return false;
    }
    
    var url="aStartSubscription.jsp?id="+id+"&type="+type+"&date="+date;
    xmlHttp.onreadystatechange = aStartSubscriptionOutput;
    xmlHttp.open("GET", url, true);
    xmlHttp.send(null);
}
function aStartSubscriptionOutput(){
    if (xmlHttp.readyState==4 || xmlHttp.readyState=="complete"){ 
        //alert(xmlHttp.responseText);
        if(xmlHttp.responseText=="1"){
            alert("Subscription Started Successfully");
            window.location.reload();
        }
        else
        {
            alert("Failed to start ssubscription");
        }
    }
}

//ajax - admin start advertise subscription
var xmlHttp
function aStartAdvSubscription(){
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
    var id = $('#aid').val();
    var date = $('#date').val();
    
    if (date.match(/^(?:(0[1-9]|1[012])[\- \/.](0[1-9]|[12][0-9]|3[01])[\- \/.](19|20)[0-9]{2})$/)){
    }else{
        $("#date").focus();
        return false;
    }
    
    var url="aStartSubscription.jsp?id="+id+"&type=adv&date="+date;
    xmlHttp.onreadystatechange = aStartAdvSubscriptionOutput;
    xmlHttp.open("GET", url, true);
    xmlHttp.send(null);
}
function aStartAdvSubscriptionOutput(){
    if (xmlHttp.readyState==4 || xmlHttp.readyState=="complete"){ 
        //alert(xmlHttp.responseText);
        if(xmlHttp.responseText=="1"){
            alert("Subscription Started Successfully");
            window.location.reload();
        }
        else
        {
            alert("Failed to start ssubscription");
        }   
    }
}

//ajax - admin search business
var xmlHttp
function uChangePassCheck(type){
    $("#changeSuccess").hide();
    $("#changeError").hide();
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
    var id = document.getElementById("uEmail");
    var pass = document.getElementById("uPass");
    var npass = document.getElementById("uNPass"); 
    var cpass = document.getElementById("uCPass");
    //alert(id.value + pass.value + npass.value);
    if(pass.value.trim()=='' || pass.value.trim().length<=5){
        pass.focus();
        $("#changeError").text("Current password length should be minimum 6 characters");
        $("#changeError").show();
        return false;
    }
    else if(npass.value.trim()=='' || npass.value.trim().length<=5){
        npass.focus();
        $("#changeError").text("New password length should be minimum 6 characters");
        $("#changeError").show();
        return false;
    }
    else if(cpass.value.trim()=='' || cpass.value.trim().length<=5){
        cpass.focus();
        $("#changeError").text("Confirm password length should be minimum 6 characters");
        $("#changeError").show();
        return false;
    }
    else if(npass.value.trim()!=cpass.value.trim()){
        cpass.focus();
        $("#changeError").text("Passwords Mismatched!");
        $("#changeError").show();
        return false;
    }
    else
    {
        $("#changeError").hide();
        var url="changePasswordCheck.jsp?type="+type+"&id="+id.value+"&opass="+pass.value+"&npass="+npass.value;
        //alert(url);
        xmlHttp.onreadystatechange = uChangePassCheckOutput;
        xmlHttp.open("GET", url, true);
        xmlHttp.send(null);
    }
}
function uChangePassCheckOutput(){
    if (xmlHttp.readyState==4 || xmlHttp.readyState=="complete"){ 
        //alert(xmlHttp.responseText);
        if(xmlHttp.responseText=="1")
        {
            $("#changeSuccess").hide();
            $("#changeSuccess").html("<h3>Password has changed successfully</h3>");
            $("#changeSuccess").show();
            $("#subButton").attr("disabled","disabled");
        }
        else if(xmlHttp.responseText=="2")
        {
            $("#changeSuccess").hide();
            $("#changeError").html("Invalid credentials");
            $("#changeError").show();
        }
        else
        {
            $("#changeSuccess").hide();
            $("#changeError").html("Failed to change password");
            $("#changeError").show();
        }
    }
}
var xmlhttp;
function contacted()
{
    xmlhttp=GetXmlHttpObject();
    if (xmlhttp==null)
    {
        alert ("Your browser does not support Ajax HTTP");
        return;
    }
    var id = $("#id").val();
    var type = $("#type").val();
    var url="contactedHostel.jsp";
    url=url+"?id="+id+"&type="+type;
    //xmlhttp.onreadystatechange=checkAmenitiesOutput;
    xmlhttp.open("GET",url,true);
    xmlhttp.send(null);
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
function aRedirectToBusSubPage()
{
    window.location = "aSubscription.jsp?id="+$("#txtBusId").val()+"&type="+$("#ddlBusType").val();
}
function aRedirectToAdvSubPage()
{
    window.location = "aSubscriptionAdv.jsp?id="+$("#txtAdvId").val();
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
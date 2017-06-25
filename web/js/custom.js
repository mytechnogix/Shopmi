$(document).on('click','.product-info', function() {
    $parent_box = $(this).closest('.boxr');
    $parent_box.siblings().find('.bottom').slideUp();
    $parent_box.find('.bottom').slideToggle(1000, 'swing');
});
//ajax -get suggestions
var xmlHttp
var searchQuery;
function getSuggestions(){
    //alert("");
    var filter = $('input:radio[name=filterChk]:checked').val();
    var str = $("#searchQuery").val().trim();
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
        //alert(xmlHttp.responseText);
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
            "ordering": true,
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
        alert(xmlhttp.responseText);

        if(xmlhttp.responseText=="1"){
            alert(eType);
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
    var review = $("#txtAreaReview").val();
    
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
        }
    }
}

var xmlhttp;
var rateVal;
function toggleRating(str)
{
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
        // alert(xmlhttp.responseText);
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
    
    alert(oid+" - "+sid);
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
//amenities count
var xmlhttp;
var amenities="";
var opType="";
function checkAmenities(str)
{
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
    // alert(amenities);
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




<%@page import="TimerServices.ScheduleTimers"%>
<%
    ScheduleTimers obj = new ScheduleTimers();
    obj.PopularCats();
    obj.CalcAvgRating();
    obj.updateClaimedOfferStatusJob();
%>
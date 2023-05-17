<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.lang.System"%>
<%@page import="javax.management.Query"%>
<%@page import="java.io.FileDescriptor"%>
<%@page import="java.lang.System"%>
<%@page import="java.io.IOException" %>
<%@page import="java.net.URI"%>
<%@page import="java.net.http.HttpClient" %>
<%@page import="java.net.http.HttpRequest" %>
<%@page import="java.net.http.HttpResponse" %>
<%@page import="java.util.logging.Level" %>
<%@page import="java.util.logging.Logger" %>
<%@page import="org.json.JSONException" %>
<%@page import="Api.WeatherdataApi" %>




<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="Style/Stylesheet.css">
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Sofia">
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    <h1>Enter Your City</h1>
    <form action="Home.jsp" >
        <input id="in" type="text" class="input" placeholder="" name="city">
        <input type="submit" value="Submit">
        <%String in = request.getParameter("city"); %>
    </form>
    <style>
        .maincard{
            display: flex;
            justify-content: center;
            height: 11rem;
            font-family: Roboto;

        }
        .mm{
            display: flex;
            justify-content: center;
            align-items: center;
            font-size: 60px;
            font-family:roboto;
            width: 25%;
            height: 12rem;
        }
        .card{
            width: 18rem;

            background-repeat: no-repeat;
            background-size:cover;
            background-color: #00000014;
            margin: 10px;
        }
        body {
            background-image: linear-gradient(to top, rgb(251, 194, 235) 0%, rgb(166, 193, 238) 100%);
            background-size: cover;
            background-repeat: no-repeat;
            height: 100%;
            background-attachment: fixed;
            font-family: Roboto;
        }
        form{
            display: flex;
            justify-content: center;
            padding: 10px;
            margin: 25px;
        }
        #in{
            width: 25rem;
            height: 2rem;
        }
        h1{
            display: flex;
            justify-content: center;
        }
        .weather{
            display: flex;
            justify-content: center;
            flex-direction: row;
            margin: 20px;
            padding: 10px;
        }

        .card:hover{
            background-color:#B2E4FA;
        }

        .card{
            width: 8rem;

        }
        .Datacontainer{
            display: flex;
            justify-content: center;
            flex-direction: row;
            flex-wrap: wrap;
            margin: 5px;
            padding: 2px;
        }
        img.card-img-top {
            width: 100px;
        }
        #headimg{
            width: 10rem;
        }
        input[type="submit"] {
            background-color:  #750df05e;
            border-radius: 0px 25px 25px 0px;
            border:none;
        }
        input#in {
            border-radius: 25px 0px 0px 25px;
            border:none;
        }

    </style>
</head>
<body>

    <div class="maincard">

        <h1 class="mm" > <span> <img id="headimg" src="image/weather.svg"> </span>
            <% out.print(WeatherdataApi.GetData(in).get(4)); %>
        </h1>

    </div>
    <div>
        <h1><% out.print(WeatherdataApi.GetData(in).get(1)); %></h1> 
    </div>

    <div class="Datacontainer">
        <%
            int count = 0;
            for (Object i : WeatherdataApi.GetData(in)) {%> 


        <div class="card" style="width: 18rem;">
            <img src="image/day.svg" class="card-img-top" alt="...">
            <div class="card-body">
                <p class="card-title"><%  out.print(WeatherdataApi.Headerdata().get(count));%></p>
                <h5 class="card-text"><%  out.print(i); %></h5>

            </div>
        </div><% count++;
            }%>
    </div>

</body>
</html>

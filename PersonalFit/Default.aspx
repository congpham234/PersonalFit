﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Home</title>
<link rel="stylesheet" type="text/css" href="Style/LoginStyle.css" />
</head>





<body>
    
    <div class="loginbox">
        <img src="img_src/avt.png" class="avatar"/>
        <h1>Login Here</h1>
        <form id="form1" runat="server">
            <p>Username</p>
            <input id="usernameTextBox" type="text" name="" placeholder="Enter Username" runat="server"/>
            <p>Password</p>
            <input id="passwordTextBox" type="password" name="" placeholder ="Enter Password" runat="server"/><br />
            <button id="submitButton" type= "button" name="" text="Login"  runat ="server" onclick="submitButtonEventMethod">Login</button><br />
            <%--<asp:Button ID="submitButton" Text ="Login" runat ="server" OnClick="submitButtonEventMethod" />--%>
            <a href="#">Lost your password?</a><br />
            <a href="Registration.aspx">Do not have an account?</a>
        </form>
    </div>


    <!--
        username:webuser
        password:Xn140839
        -->

<%--     <div class="loginbox">
        <img src="img_src/avt.png" class="avatar"/>   
        <form id="form1" runat="server">
            <p>Username</p>
            <asp:TextBox ID="usernameTextBox" Text="Enter Username Here" runat ="server" />
            <p>Password</p>
            <asp:TextBox ID="passwordTextBox" Text="Enter Password" runat ="server" />
            
        </form>
    </div>--%>


    <div id="hitCountValue">0</div>

    <!-- Call out to the HUB using javascript.
        The order is important.-->

    <script src="Scripts/jquery-1.6.4.js"></script>
    <script src="Scripts/jquery.signalR-2.3.0.js"></script>
    <script type="text/javascript">
        $(function () {
            var connection = $.hubConnection();
            var hub = connection.createHubProxy("Chat");
            hub.on("onRecordHit",function (hitCount) {$('#hitCountValue').text(hitCount);});
            connection.start(function (){ hub.invoke('chatNow');});
        })


    </script>
</body>
</html>

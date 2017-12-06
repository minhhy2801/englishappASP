<%@ Page Title="" Language="C#" MasterPageFile="~/Website/MasterPage.master" AutoEventWireup="true" CodeFile="HomePage.aspx.cs" Inherits="HomePage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link href="../App_Themes/Admin/css/fixAllMem.css" rel="stylesheet" />
     <link href="../Content/bootstrap.css" rel="stylesheet" />
    <link href="../Content/bootstrap.min.css" rel="stylesheet" />
    <style>
        body{
            overflow:hidden;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" runat="server" contentplaceholderid="ContentPlaceHolder1">
    <div class="border">
        <div id="bg">
            background
        </div>
        <div class="page">
            <div class="sidebar">
                <!--
                <a href="HomePage.aspx"" id="logo">
                <img src="App_Themes/Admin/images/logo5.jpg" alt="Alternate Text" /></a>
                !-->
                <ul>
                    <li><strong>Hello, <%= Session["NAME"].ToString() %></strong></li>
                    <li class="selected"><a href="HomePage.aspx"">Home</a> </li>
                    <li><a href="ProfileManage.aspx">Profile</a> </li>
                    <%if (Session["ID"].ToString().Equals("admin"))
                        {%>
                    <li><a href="ManageTest.aspx">Test</a> </li>
                    <%}
                    else
                    { %>
                    <li><a href="AllTest.aspx">Test</a> </li>
                    <% }%>
                    <li><a href="HighScore.aspx">leaderboard</a> </li>
                      <%if (Session["ID"].ToString().Equals("admin"))
                          {%>
                    <li><a href="AllMembers.aspx">Members List</a> </li>
                    <%}
                    else { } %>
                    
                   <li><asp:Button ID="btnLogout" CssClass="btn btn-block" runat="server" Text="Logout" OnClick="Button1_Click" /></li>
                </ul>
            </div>
            <div class="body">
                <div>
                     <h2>welcome to our learning website,
                         <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
                     </h2>
                                <p>
                                    This website helps you improve your english.
                                </p>
                                &nbsp;<div>
                                    <h3><span>Features</span></h3>
                                    <ul>
                                        <li id="link1"><a href="ProfileManage.aspx">
                                            <span>Profile</span></a>
                                        </li>
                                        <li id="link2"><a href="HighScore.aspx"><span>Leaderboard</span></a></li>
                                        <li id="link3"><a href="AllTest.aspx"><span>Test</span></a></li>
                                    </ul>
                                </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>



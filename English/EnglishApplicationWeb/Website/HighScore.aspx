<%@ Page Title="" Language="C#" MasterPageFile="~/Website/MasterPage.master" AutoEventWireup="true" CodeFile="HighScore.aspx.cs" Inherits="HighScore" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link href="../Content/bootstrap.css" rel="stylesheet" />
    <link href="../Content/bootstrap.min.css" rel="stylesheet" />
    <link href="../App_Themes/Admin/css/testgrid.css" rel="stylesheet" />
    <style type="text/css">
        .auto-style1 {
        }

        body {
            overflow: hidden;
        }

        #products {
            height: 500px;
            overflow-x: hidden;
            overflow-y: scroll;
        }

        .listtab {
            height: 40px;
        }

        .gbtn {
            padding-left: 10%;
        }
    </style>
    <script src="../Scripts/jquery-3.2.1.js"></script>
    <script src="../Scripts/jquery-3.2.1.min.js"></script>
    <script src="../Scripts/bootstrap.min.js"></script>
    <script src="../Scripts/bootstrap.js"></script>

</asp:Content>
<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="ContentPlaceHolder1">
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
                    <li><a href="HomePage.aspx"">Home</a> </li>
                    <li><a href="ProfileManage.aspx">Profile</a> </li>
                    <%if (Session["ID"].ToString().Equals("admin"))
                        {%>
                    <li><a href="ManageTest.aspx">Test</a> </li>
                    <%} else { %>
                    <li><a href="AllTest.aspx">Test</a> </li>
                    <% }%>
                    <li class="selected"><a href="HighScore.aspx">leaderboard</a> </li>
                    <%if (Session["ID"].ToString().Equals("admin"))
                          {%>
                    <li><a href="AllMembers.aspx">Members List</a> </li>
                    <%} else { } %>
                   <li><asp:Button ID="btnLogout" CssClass="btn btn-block" runat="server" Text="Logout" OnClick="btnLogout_Click"/></li>
                </ul>
            </div>
            <div class="body">
                <div class="container">
                    <div class="auto-style1">
                        <strong>Tests List</strong>
                    </div>
                    <div id="products" class="row list-group">

                        <% 

                            TestDAO dao = new TestDAO();
                            int numOfTest = dao.countTests();
                            int[] idTest = dao.getAllIDOfTest();
                            int box;
                            for (int i = 0; i < numOfTest; i++)
                            {
                                box = dao.getState(idTest[i]);
                                if(box != 0) { 
                                string accountID = (string)Session["ID"];
                                string[] names = dao.getTop5BestScoreName(idTest[i]);
                                int[] score = dao.getTop5BestScore(idTest[i]);
                        %>

                        <div class="item  col-xs-4 col-lg-4">
                            <div class="thumbnail">
                                <div class="caption">
                                    <h4 class="group inner list-group-item-heading" style="text-align: center">Test <% Response.Write(dao.getTestName(idTest[i])); %></h4>
                                    <%for (int j = 0; j < names.Length; j++)
                                        { %>
                                    <div class="row">
                                        <%if(score[j] != 0) { %>
                                        <span>Top <% Response.Write( (j+1) + " - Name: " + names[j] + ", Score:" + score[j]); %></span>
                                        <% } else { %>
                                        <br/>
                                        <% } %>
                                    </div>
                                    <%} %>
                                </div>
                            </div>
                        </div>
                        <%} } %>
                    </div>
                </div>

            </div>
        </div>
    </div>
</asp:Content>



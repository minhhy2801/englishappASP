<%@ Page Title="" Language="C#" MasterPageFile="~/Website/MasterPage.master" AutoEventWireup="true" CodeFile="AllTest.aspx.cs" Inherits="AllTest" %>


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
                    <li class="selected"><a href="AllTest.aspx">Test</a> </li>
                    <li><a href="HighScore.aspx">leaderboard</a> </li>
                    <li><asp:Button ID="btnLogout" CssClass="btn btn-block" runat="server" Text="Logout" OnClick="btnLogout_Click" /></li>
                </ul>
            </div>
            <div class="body">
                <div>
                    <div class="container">
                        <div class="auto-style1">
                            <strong>Tests List</strong>
                        </div>
                        <div id="products" class="row list-group">
                            
                            <% 

                                TestDAO tDAO = new TestDAO();
                                int numOfTest = tDAO.countTests();
                                int box;
                                int[] idTest = tDAO.getAllIDOfTest();
                                for (int i = 0; i < numOfTest; i++)
                                {
                                box = tDAO.getState(i+1);
                                string accountID = (string)Session["ID"];
                                int aa = tDAO.getTop1IDTestScore(idTest[i], accountID);
                               
                            %>


                            <div class="item  col-xs-4 col-lg-4">
                                <div class="thumbnail">
                                    <div class="caption">
                                        <h4 class="group inner list-group-item-heading" style="text-align: center">Test  <% Response.Write(tDAO.getTestName(idTest[i])); %></h4>
                                        <%
                                                if(box != 0) {
                                        %>
                                        <div class="row">

                                            <!--a href="#">Turn 1:
                                                <% Response.Write(aa); %>
                                            </!--a-->
                               This test will help you to improve your grammar skil...
                                        </div>
                                        <% if(aa != 0) { %>
                                        <div class="row gbtn">
                                            <a href="ReviewTest.aspx?IDQUIZREVIEW=<%=(i+1) %>" class="btn btn-success">Review test</a>
                                        </div>
                                        <% } else { %>
                                        <div class="row gbtn">
                                            <a href="DoTest.aspx?IDQUIZDO=<%=(i+1) %>" class="btn btn-success">Do test</a>
                                        </div>
                                        <% } %>
                                        <% } else {%>
                                       Empty
                                        <% } %>
                                    </div>
                                </div>
                            </div>
                            <%} %>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

</asp:Content>



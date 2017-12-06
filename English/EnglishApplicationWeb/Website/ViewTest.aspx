<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Website/MasterPage.master" CodeFile="ViewTest.aspx.cs" Inherits="Website_ViewTest" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link href="../Content/bootstrap.css" rel="stylesheet" />
    <link href="../Content/bootstrap.min.css" rel="stylesheet" />
    <script src="../Scripts/jquery-3.2.1.js"></script>
    <script src="../Scripts/bootstrap.js"></script>
    <script src="../Scripts/bootstrap.min.js"></script>
    <style>
        #products {
            height: 500px;
            overflow-x: hidden;
            overflow-y: scroll;
        }
          body {
            overflow: hidden;
        }
        .center-div {
           display:inline-block;
        }
    </style>
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
                      <li><a href="AllMembers.aspx">Members List</a> </li>
                    <li><asp:Button ID="btnLogout" CssClass="btn btn-block" runat="server" Text="Logout" OnClick="Button1_Click" /></li>
                </ul>
            </div>
            <div class="body">
                <div>
                    <div class="container">
                        <ul class="nav nav-tabs" style="height: 50px;">
                            <li><a href="ManageTest.aspx">Manage Test</a></li>
                            <li class="active"><a href="ViewTest.aspx">View All Test</a></li>
                        </ul>
                    </div>
                    <div id="products" class="row list-group">
                        <% 
                            TestDAO tdao = new TestDAO();
                            QuizDAO qdao = new QuizDAO();
                            int numOfTest = tdao.countTests();
                            int[] idTest = tdao.getAllIDOfTest();
                            int[] numQuiz = qdao.getNumOfAllQuiz();
                            for (int i = 0; i < numOfTest; i++)
                            {
                        %>
                        <div class="item  col-xs-4 col-lg-4">
                            <div class="thumbnail">
                                <h4 class="group inner list-group-item-heading" style="text-align: center; padding-top:5%;">Test <% Response.Write(tdao.getTestName(idTest[i])); %> </h4>
                                <div class="row">
                                    
                                    <% if(numQuiz[i] < 20){ %>
                                    <p>Add <% Response.Write(20 - numQuiz[i]); %> more quizs to active this test.</p>
                                    <% } else if(numQuiz[i] == 20){ %>
                                    <p>This test have <% Response.Write(numQuiz[i]); tdao.setStatusPass(idTest[i]);%> quizs.</p>
                                    <%} else {%>
                                    <p>This test have <% Response.Write(numQuiz[i]); %> quizs.</p>
                                    <%} %>
                                </div>
                                <div class="row center-div">
                                    <a href="AddQuiz.aspx?IDTEST=<%=idTest[i] %>" class="btn btn-success">Add Quiz</a>
                                </div>
                            </div>
                        </div>
                        <% } %>
                    </div>
                </div>
            </div>
        </div>
    </div>
    
</asp:Content>


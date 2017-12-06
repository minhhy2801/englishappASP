<%@ Page Title="" Language="C#" MasterPageFile="~/Website/MasterPage.master" AutoEventWireup="true" CodeFile="ReviewTest.aspx.cs" Inherits="ReviewTest" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link href="../Content/bootstrap.css" rel="stylesheet" />
    <link href="../Content/bootstrap.min.css" rel="stylesheet" />
    <style>
        body {
            overflow: hidden;
        }

        #review {
            overflow-y: scroll;
            overflow-x: hidden;
            height: 550px;
        }
    </style>
    <script>
window.location.hash="no-back-button";
window.location.hash="Again-no-back-button";//for google chrome
window.onhashchange=function(){window.location.hash="no-back-button";}
    </script>
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
                    <li><asp:Button ID="btnLogout" CssClass="btn btn-block" runat="server" Text="Logout" OnClick="btnLogout_Click"/></li>
                </ul>
            </div>
            <div class="body">
                <div>
                    <strong>
                        <asp:Label ID="lbReview" runat="server" Text="Test 1"></asp:Label></strong>
                    <asp:Button ID="btnClose" runat="server" Text="Close" CssClass="btn btn-info" OnClick="btnClose_Click"/>
                    <div id="review" class="row list-group">
                        <asp:Label ID="LabelResult" runat="server"></asp:Label>
                        <div class="row">
                            <h4 style="font-weight: bold;">
                                <asp:Label ID="Label5" runat="server" Text="Quiz 1: "></asp:Label>
                                <asp:Label ID="q1" runat="server"></asp:Label>
                            </h4>
                            <p>
                                <asp:Label ID="ya1" runat="server" Text="34565768765432"></asp:Label>
                            </p>
                            <p>
                                <asp:Label ID="ca1" runat="server" Text="2345676" ForeColor="Red" Font-Bold="True"></asp:Label>
                            </p>
                        </div>
                        <div class="row">
                            <h4 style="font-weight: bold;">
                                <asp:Label ID="Label9" runat="server" Text="Quiz 2: "></asp:Label>
                                <asp:Label ID="q2" runat="server" Text="aadeee"></asp:Label>
                            </h4>
                            <p>
                                <asp:Label ID="ya2" runat="server" Text="34565768765432"></asp:Label>
                            </p>
                            <p>
                                <asp:Label ID="ca2" runat="server" Text="2345676" ForeColor="Red" Font-Bold="True"></asp:Label>
                            </p>
                        </div>
                        <div class="row">
                            <h4 style="font-weight: bold;">
                                <asp:Label ID="Label13" runat="server" Text="Quiz 3: "></asp:Label>
                                <asp:Label ID="q3" runat="server" Text="aadeee"></asp:Label>
                            </h4>
                            <p>
                                <asp:Label ID="ya3" runat="server" Text="34565768765432"></asp:Label>
                            </p>
                            <p>
                                <asp:Label ID="ca3" runat="server" Text="2345676" ForeColor="Red" Font-Bold="True"></asp:Label>
                            </p>
                        </div>
                        <div class="row">
                            <h4 style="font-weight: bold;">
                                <asp:Label ID="Label17" runat="server" Text="Quiz 4: "></asp:Label>
                                <asp:Label ID="q4" runat="server" Text="aadeee"></asp:Label>
                            </h4>
                            <p>
                                <asp:Label ID="ya4" runat="server" Text="34565768765432"></asp:Label>
                            </p>
                            <p>
                                <asp:Label ID="ca4" runat="server" Text="2345676" ForeColor="Red" Font-Bold="True"></asp:Label>
                            </p>
                        </div>
                        <div class="row">
                            <h4 style="font-weight: bold;">
                                <asp:Label ID="Label21" runat="server" Text="Quiz 5: "></asp:Label>
                                <asp:Label ID="q5" runat="server" Text="aadeee"></asp:Label>
                            </h4>
                            <p>
                                <asp:Label ID="ya5" runat="server" Text="34565768765432"></asp:Label>
                            </p>
                            <p>
                                <asp:Label ID="ca5" runat="server" Text="2345676" ForeColor="Red" Font-Bold="True"></asp:Label>
                            </p>
                        </div>
                        <div class="row">
                            <h4 style="font-weight: bold;">
                                <asp:Label ID="Label1" runat="server" Text="Quiz 6: "></asp:Label>
                                <asp:Label ID="q6" runat="server" Text="aadeee"></asp:Label>
                            </h4>
                            <p>
                                <asp:Label ID="ya6" runat="server" Text="34565768765432"></asp:Label>
                            </p>
                            <p>
                                <asp:Label ID="ca6" runat="server" Text="2345676" ForeColor="Red" Font-Bold="True"></asp:Label>
                            </p>
                        </div>
                        <div class="row">
                            <h4 style="font-weight: bold;">
                                <asp:Label ID="Label25" runat="server" Text="Quiz 7: "></asp:Label>
                                <asp:Label ID="q7" runat="server" Text="aadeee"></asp:Label>
                            </h4>
                            <p>
                                <asp:Label ID="ya7" runat="server" Text="34565768765432"></asp:Label>
                            </p>
                            <p>
                                <asp:Label ID="ca7" runat="server" Text="2345676" ForeColor="Red" Font-Bold="True"></asp:Label>
                            </p>
                        </div>
                        <div class="row">
                            <h4 style="font-weight: bold;">
                                <asp:Label ID="Label29" runat="server" Text="Quiz 8: "></asp:Label>
                                <asp:Label ID="q8" runat="server" Text="aadeee"></asp:Label>
                            </h4>
                            <p>
                                <asp:Label ID="ya8" runat="server" Text="34565768765432"></asp:Label>
                            </p>
                            <p>
                                <asp:Label ID="ca8" runat="server" Text="2345676" ForeColor="Red" Font-Bold="True"></asp:Label>
                            </p>
                        </div>
                        <div class="row">
                            <h4 style="font-weight: bold;">
                                <asp:Label ID="Label33" runat="server" Text="Quiz 9: "></asp:Label>
                                <asp:Label ID="q9" runat="server" Text="aadeee"></asp:Label>
                            </h4>
                            <p>
                                <asp:Label ID="ya9" runat="server" Text="34565768765432"></asp:Label>
                            </p>
                            <p>
                                <asp:Label ID="ca9" runat="server" Text="2345676" ForeColor="Red" Font-Bold="True"></asp:Label>
                            </p>
                        </div>
                        <div class="row">
                            <h4 style="font-weight: bold;">
                                <asp:Label ID="Label37" runat="server" Text="Quiz 10: "></asp:Label>
                                <asp:Label ID="q10" runat="server" Text="aadeee"></asp:Label>
                            </h4>
                            <p>
                                <asp:Label ID="ya10" runat="server" Text="34565768765432"></asp:Label>
                            </p>
                            <p>
                                <asp:Label ID="ca10" runat="server" Text="2345676" ForeColor="Red" Font-Bold="True"></asp:Label>
                            </p>
                        </div>
                        <div class="row">
                            <h4 style="font-weight: bold;">
                                <asp:Label ID="Label41" runat="server" Text="Quiz 11: "></asp:Label>
                                <asp:Label ID="q11" runat="server" Text="aadeee"></asp:Label>
                            </h4>
                            <p>
                                <asp:Label ID="ya11" runat="server" Text="34565768765432"></asp:Label>
                            </p>
                            <p>
                                <asp:Label ID="ca11" runat="server" Text="2345676" ForeColor="Red" Font-Bold="True"></asp:Label>
                            </p>
                        </div>
                        <div class="row">
                            <h4 style="font-weight: bold;">
                                <asp:Label ID="Label45" runat="server" Text="Quiz 12: "></asp:Label>
                                <asp:Label ID="q12" runat="server" Text="aadeee"></asp:Label>
                            </h4>
                            <p>
                                <asp:Label ID="ya12" runat="server" Text="34565768765432"></asp:Label>
                            </p>
                            <p>
                                <asp:Label ID="ca12" runat="server" Text="2345676" ForeColor="Red" Font-Bold="True"></asp:Label>
                            </p>
                        </div>
                        <div class="row">
                            <h4 style="font-weight: bold;">
                                <asp:Label ID="Label49" runat="server" Text="Quiz 13: "></asp:Label>
                                <asp:Label ID="q13" runat="server" Text="aadeee"></asp:Label>
                            </h4>
                            <p>
                                <asp:Label ID="ya13" runat="server" Text="34565768765432"></asp:Label>
                            </p>
                            <p>
                                <asp:Label ID="ca13" runat="server" Text="2345676" ForeColor="Red" Font-Bold="True"></asp:Label>
                            </p>
                        </div>
                        <div class="row">
                            <h4 style="font-weight: bold;">
                                <asp:Label ID="Label53" runat="server" Text="Quiz 14: "></asp:Label>
                                <asp:Label ID="q14" runat="server" Text="aadeee"></asp:Label>
                            </h4>
                            <p>
                                <asp:Label ID="ya14" runat="server" Text="34565768765432"></asp:Label>
                            </p>
                            <p>
                                <asp:Label ID="ca14" runat="server" Text="2345676" ForeColor="Red" Font-Bold="True"></asp:Label>
                            </p>
                        </div>
                        <div class="row">
                            <h4 style="font-weight: bold;">
                                <asp:Label ID="Label57" runat="server" Text="Quiz 15: "></asp:Label>
                                <asp:Label ID="q15" runat="server" Text="aadeee"></asp:Label>
                            </h4>
                            <p>
                                <asp:Label ID="ya15" runat="server" Text="34565768765432"></asp:Label>
                            </p>
                            <p>
                                <asp:Label ID="ca15" runat="server" Text="2345676" ForeColor="Red" Font-Bold="True"></asp:Label>
                            </p>
                        </div>
                        <div class="row">
                            <h4 style="font-weight: bold;">
                                <asp:Label ID="Label61" runat="server" Text="Quiz 16: "></asp:Label>
                                <asp:Label ID="q16" runat="server" Text="aadeee"></asp:Label>
                            </h4>
                            <p>
                                <asp:Label ID="ya16" runat="server" Text="34565768765432"></asp:Label>
                            </p>
                            <p>
                                <asp:Label ID="ca16" runat="server" Text="2345676" ForeColor="Red" Font-Bold="True"></asp:Label>
                            </p>
                        </div>
                        <div class="row">
                            <h4 style="font-weight: bold;">
                                <asp:Label ID="Label65" runat="server" Text="Quiz 17: "></asp:Label>
                                <asp:Label ID="q17" runat="server" Text="aadeee"></asp:Label>
                            </h4>
                            <p>
                                <asp:Label ID="ya17" runat="server" Text="34565768765432"></asp:Label>
                            </p>
                            <p>
                                <asp:Label ID="ca17" runat="server" Text="2345676" ForeColor="Red" Font-Bold="True"></asp:Label>
                            </p>
                        </div>
                        <div class="row">
                            <h4 style="font-weight: bold;">
                                <asp:Label ID="Label69" runat="server" Text="Quiz 18: "></asp:Label>
                                <asp:Label ID="q18" runat="server" Text="aadeee"></asp:Label>
                            </h4>
                            <p>
                                <asp:Label ID="ya18" runat="server" Text="34565768765432"></asp:Label>
                            </p>
                            <p>
                                <asp:Label ID="ca18" runat="server" Text="2345676" ForeColor="Red" Font-Bold="True"></asp:Label>
                            </p>
                        </div>
                        <div class="row">
                            <h4 style="font-weight: bold;">
                                <asp:Label ID="Label73" runat="server" Text="Quiz 19: "></asp:Label>
                                <asp:Label ID="q19" runat="server" Text="aadeee"></asp:Label>
                            </h4>
                            <p>
                                <asp:Label ID="ya19" runat="server" Text="34565768765432"></asp:Label>
                            </p>
                            <p>
                                <asp:Label ID="ca19" runat="server" Text="2345676" ForeColor="Red" Font-Bold="True"></asp:Label>
                            </p>
                        </div>
                        <div class="row">
                            <h4 style="font-weight: bold;">
                                <asp:Label ID="Label77" runat="server" Text="Quiz 20: "></asp:Label>
                                <asp:Label ID="q20" runat="server" Text="aadeee"></asp:Label>
                            </h4>
                            <p>
                                <asp:Label ID="ya20" runat="server" Text="34565768765432"></asp:Label>
                            </p>
                            <p>
                                <asp:Label ID="ca20" runat="server" Text="2345676" ForeColor="Red" Font-Bold="True"></asp:Label>
                            </p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>



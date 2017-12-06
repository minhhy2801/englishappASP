<%@ Page Title="" Language="C#" MasterPageFile="~/Website/MasterPage.master" AutoEventWireup="true" CodeFile="DoTest.aspx.cs" Inherits="DoTest" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">

    <style>
        body {
            overflow: hidden;
        }

        #ques {
            height: 500px;
            overflow-x: hidden;
            overflow-y: scroll;
        }
    </style>
    <link href="../Content/bootstrap.css" rel="stylesheet" />
    <link href="../Content/bootstrap.min.css" rel="stylesheet" />
    
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
                    <div class="row" id="ques">
                        <asp:scriptmanager id="ScriptManager1" runat="server">
                        </asp:scriptmanager>
                        <asp:updatepanel id="UpdatePanel1" runat="server">
                            <ContentTemplate>
                                <asp:Timer ID="Timer1" runat="server" Interval="1000" OnTick="Timer1_Tick">
                                </asp:Timer>
                                <asp:Label ID="Label2" runat="server" OnDataBinding="Label2_DataBinding"></asp:Label><br/>
                                <asp:Label ID="Label3" runat="server"></asp:Label>
                            </ContentTemplate>
                        </asp:updatepanel>
                        <h1>Test 1</h1>
                        <p>
                            <asp:label id="Label1" runat="server"></asp:label>
                        </p>
                        <div class="quiz-group">
                            <div class="quiz-question-strong">
                                <asp:label id="q1" runat="server" text=""></asp:label>
                            </div>
                            <asp:radiobuttonlist id="RadioButtonList1" runat="server">
                            </asp:radiobuttonlist>
                            <asp:label id="a1" runat="server" text="Label"></asp:label>
                            <asp:label id="aID1" runat="server" text="Label"></asp:label>
                        </div>

                        <div class="quiz-group">
                            <div class="quiz-question-strong">
                                <asp:label id="q2" runat="server" text=""></asp:label>
                            </div>
                            <asp:radiobuttonlist id="RadioButtonList2" runat="server">
                            </asp:radiobuttonlist>
                            <asp:label id="a2" runat="server" text="Label"></asp:label>
                            <asp:label id="aID2" runat="server" text="Label"></asp:label>
                        </div>

                        <div class="quiz-group">
                            <div class="quiz-question-strong">
                                <asp:label id="q3" runat="server" text=""></asp:label>
                            </div>
                            <asp:radiobuttonlist id="RadioButtonList3" runat="server">
                            </asp:radiobuttonlist>
                            <asp:label id="a3" runat="server" text="Label"></asp:label>
                            <asp:label id="aID3" runat="server" text="Label"></asp:label>
                        </div>

                        <div class="quiz-group">
                            <div class="quiz-question-strong">
                                <asp:label id="q4" runat="server" text=""></asp:label>
                            </div>
                            <asp:radiobuttonlist id="RadioButtonList4" runat="server">
                            </asp:radiobuttonlist>
                            <asp:label id="a4" runat="server" text="Label"></asp:label>
                            <asp:label id="aID4" runat="server" text="Label"></asp:label>
                        </div>

                        <div class="quiz-group">
                            <div class="quiz-question-strong">
                                <asp:label id="q5" runat="server" text=""></asp:label>
                            </div>
                            <asp:radiobuttonlist id="RadioButtonList5" runat="server">
                            </asp:radiobuttonlist>
                            <asp:label id="a5" runat="server" text="Label"></asp:label>
                            <asp:label id="aID5" runat="server" text="Label"></asp:label>
                        </div>

                        <div class="quiz-group">
                            <div class="quiz-question-strong">
                                <asp:label id="q6" runat="server" text=""></asp:label>
                            </div>
                            <asp:radiobuttonlist id="RadioButtonList6" runat="server">
                            </asp:radiobuttonlist>
                            <asp:label id="a6" runat="server" text="Label"></asp:label>
                            <asp:label id="aID6" runat="server" text="Label"></asp:label>
                        </div>

                        <div class="quiz-group">
                            <div class="quiz-question-strong">
                                <asp:label id="q7" runat="server" text=""></asp:label>
                            </div>
                            <asp:radiobuttonlist id="RadioButtonList7" runat="server">
                            </asp:radiobuttonlist>
                            <asp:label id="a7" runat="server" text="Label"></asp:label>
                            <asp:label id="aID7" runat="server" text="Label"></asp:label>
                        </div>

                        <div class="quiz-group">
                            <div class="quiz-question-strong">
                                <asp:label id="q8" runat="server" text=""></asp:label>
                            </div>
                            <asp:radiobuttonlist id="RadioButtonList8" runat="server">
                            </asp:radiobuttonlist>
                            <asp:label id="a8" runat="server" text="Label"></asp:label>
                            <asp:label id="aID8" runat="server" text="Label"></asp:label>
                        </div>

                        <div class="quiz-group">
                            <div class="quiz-question-strong">
                                <asp:label id="q9" runat="server" text=""></asp:label>
                            </div>
                            <asp:radiobuttonlist id="RadioButtonList9" runat="server">
                            </asp:radiobuttonlist>
                            <asp:label id="a9" runat="server" text="Label"></asp:label>
                            <asp:label id="aID9" runat="server" text="Label"></asp:label>
                        </div>

                        <div class="quiz-group">
                            <div class="quiz-question-strong">
                                <asp:label id="q10" runat="server" text=""></asp:label>
                            </div>
                            <asp:radiobuttonlist id="RadioButtonList10" runat="server">
                            </asp:radiobuttonlist>
                            <asp:label id="a10" runat="server" text="Label"></asp:label>
                            <asp:label id="aID10" runat="server" text="Label"></asp:label>
                        </div>

                        <div class="quiz-group">
                            <div class="quiz-question-strong">
                                <asp:label id="q11" runat="server" text=""></asp:label>
                            </div>
                            <asp:radiobuttonlist id="RadioButtonList11" runat="server">
                            </asp:radiobuttonlist>
                            <asp:label id="a11" runat="server" text="Label"></asp:label>
                            <asp:label id="aID11" runat="server" text="Label"></asp:label>
                        </div>

                        <div class="quiz-group">
                            <div class="quiz-question-strong">
                                <asp:label id="q12" runat="server" text=""></asp:label>
                            </div>
                            <asp:radiobuttonlist id="RadioButtonList12" runat="server">
                            </asp:radiobuttonlist>
                            <asp:label id="a12" runat="server" text="Label"></asp:label>
                            <asp:label id="aID12" runat="server" text="Label"></asp:label>
                        </div>

                        <div class="quiz-group">
                            <div class="quiz-question-strong">
                                <asp:label id="q13" runat="server" text=""></asp:label>
                            </div>
                            <asp:radiobuttonlist id="RadioButtonList13" runat="server">
                            </asp:radiobuttonlist>
                            <asp:label id="a13" runat="server" text="Label"></asp:label>
                            <asp:label id="aID13" runat="server" text="Label"></asp:label>
                        </div>

                        <div class="quiz-group">
                            <div class="quiz-question-strong">
                                <asp:label id="q14" runat="server" text=""></asp:label>
                            </div>
                            <asp:radiobuttonlist id="RadioButtonList14" runat="server">
                            </asp:radiobuttonlist>
                            <asp:label id="a14" runat="server" text="Label"></asp:label>
                            <asp:label id="aID14" runat="server" text="Label"></asp:label>
                        </div>

                        <div class="quiz-group">
                            <div class="quiz-question-strong">
                                <asp:label id="q15" runat="server" text=""></asp:label>
                            </div>
                            <asp:radiobuttonlist id="RadioButtonList15" runat="server">
                            </asp:radiobuttonlist>
                            <asp:label id="a15" runat="server" text="Label"></asp:label>
                            <asp:label id="aID15" runat="server" text="Label"></asp:label>
                        </div>

                        <div class="quiz-group">
                            <div class="quiz-question-strong">
                                <asp:label id="q16" runat="server" text=""></asp:label>
                            </div>
                            <asp:radiobuttonlist id="RadioButtonList16" runat="server">
                            </asp:radiobuttonlist>
                            <asp:label id="a16" runat="server" text="Label"></asp:label>
                            <asp:label id="aID16" runat="server" text="Label"></asp:label>
                        </div>

                        <div class="quiz-group">
                            <div class="quiz-question-strong">
                                <asp:label id="q17" runat="server" text=""></asp:label>
                            </div>
                            <asp:radiobuttonlist id="RadioButtonList17" runat="server">
                            </asp:radiobuttonlist>
                            <asp:label id="a17" runat="server" text="Label"></asp:label>
                            <asp:label id="aID17" runat="server" text="Label"></asp:label>
                        </div>

                        <div class="quiz-group">
                            <div class="quiz-question-strong">
                                <asp:label id="q18" runat="server" text=""></asp:label>
                            </div>
                            <asp:radiobuttonlist id="RadioButtonList18" runat="server">
                            </asp:radiobuttonlist>
                            <asp:label id="a18" runat="server" text="Label"></asp:label>
                            <asp:label id="aID18" runat="server" text="Label"></asp:label>
                        </div>

                        <div class="quiz-group">
                            <div class="quiz-question-strong">
                                <asp:label id="q19" runat="server" text=""></asp:label>
                            </div>
                            <asp:radiobuttonlist id="RadioButtonList19" runat="server">
                            </asp:radiobuttonlist>
                            <asp:label id="a19" runat="server" text="Label"></asp:label>
                            <asp:label id="aID19" runat="server" text="Label"></asp:label>
                        </div>

                        <div class="quiz-group">
                            <div class="quiz-question-strong">
                                <asp:label id="q20" runat="server" text=""></asp:label>
                            </div>
                            <asp:radiobuttonlist id="RadioButtonList20" runat="server">
                            </asp:radiobuttonlist>
                            <asp:label id="a20" runat="server" text="Label"></asp:label>
                            <asp:label id="aID20" runat="server" text="Label"></asp:label>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <asp:button id="btnSumbit" runat="server" text="Sumbit" cssclass="btn btn-danger" onclick="btnSumbit_Click" />
                </div>
            </div>
        </div>
    </div>
</asp:Content>



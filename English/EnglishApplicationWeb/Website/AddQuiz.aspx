<%@ Page Title="" Language="C#" MasterPageFile="~/Website/MasterPage.master" AutoEventWireup="true" CodeFile="AddQuiz.aspx.cs" Inherits="AddTest" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link href="../Content/bootstrap.css" rel="stylesheet" />
    <link href="../Content/bootstrap.min.css" rel="stylesheet" />
    <script src="../Scripts/jquery-3.2.1.js"></script>
    <script src="../Scripts/bootstrap.js"></script>
    <script src="../Scripts/bootstrap.min.js"></script>

    <style type="text/css">
        .auto-style1 {
            width: 82%;
            height: 356px;
        }

        .auto-style2 {
            width: 120px;
        }

        .auto-style3 {
            height: 500px;
        }
        body{
            overflow:hidden;
        }
        .auto-style4 {
            width: 406px;
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
                    <li class="selected"><a href="ManageTest.aspx">Test</a> </li>
                    <li><a href="HighScore.aspx">leaderboard</a> </li>
                    <li><a href="AllMembers.aspx">Members List</a> </li>
                     <li><asp:Button ID="btnLogout" CssClass="btn btn-block" runat="server" Text="Logout" OnClick="btnLogout_Click"  /></li>
                </ul>
            </div>
            <div class="body">
                <div class="auto-style3">
                    <div class="form-group">
                        <h3>
                            <asp:Label ID="Label1" runat="server" Text="Test"></asp:Label></h3>
                        <div class="row">
                            <table class="auto-style1">
                                <tr>
                                    <td class="auto-style2">Question: </td>
                                    <td class="auto-style4">
                                        <asp:TextBox ID="txtQues" runat="server" Width="350px"></asp:TextBox></td>
                                    <td><asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtQues" ErrorMessage="RequiredFieldValidator">Please input your Question.</asp:RequiredFieldValidator></td>
                                </tr>
                                <tr>
                                    <td class="auto-style2">Correct Answer :</td>
                                    <td class="auto-style4">
                                        <asp:TextBox ID="txtAns1" runat="server" Width="350px"></asp:TextBox></td>
                                    <td><asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtAns1" ErrorMessage="RequiredFieldValidator">Please input your Answer.</asp:RequiredFieldValidator></td>
                                </tr>
                                <tr>
                                    <td class="auto-style2">Wrong Answer:</td>
                                    <td class="auto-style4">
                                        <asp:TextBox ID="txtAns2" runat="server" Width="350px"></asp:TextBox></td>
                                   <td><asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtAns2" ErrorMessage="RequiredFieldValidator">Please input your Answer.</asp:RequiredFieldValidator></td>
                                </tr>
                                <tr>
                                    <td class="auto-style2">Wrong Answer:</td>
                                    <td class="auto-style4">
                                        <asp:TextBox ID="txtAns3" runat="server" Width="350px"></asp:TextBox></td>
                                   <td><asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtAns3" ErrorMessage="RequiredFieldValidator">Please input your Answer.</asp:RequiredFieldValidator></td>
                                </tr>
                                <tr>
                                    <td class="auto-style2">Wrong Answer:</td>
                                    <td class="auto-style4">
                                        <asp:TextBox ID="txtAns4" runat="server" Width="350px"></asp:TextBox></td>
                                    <td><asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtAns4" ErrorMessage="RequiredFieldValidator">Please input your Answer.</asp:RequiredFieldValidator></td>
                                </tr>
                            </table>
                            <asp:Button ID="btnAddQuiz" runat="server" Text="Add Quiz" CssClass="btn btn-success" OnClick="Button1_Click" />
                        </div>

                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>



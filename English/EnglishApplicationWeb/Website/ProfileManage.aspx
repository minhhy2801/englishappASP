<%@ Page Title="" Language="C#" MasterPageFile="~/Website/MasterPage.master" AutoEventWireup="true" CodeFile="ProfileManage.aspx.cs" Inherits="ProfileManage" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
        .auto-style1 {
            padding-top: 3%;
            text-align: center;
            height: 563px;
        }
           body {
            overflow: hidden;
        }
        .auto-style2 {
            padding-top: 3%;
            text-align: left;
        }

        .auto-style10 {
            width: 68%;
            height: 268px;
        }

        .auto-style4 {
            width: 28px;
            height: 40px;
        }

        .auto-style5 {
            width: 202px;
            height: 40px;
            padding-bottom: 3%;
        }

        .auto-style6 {
            width: 180px;
            height: 40px;
        }

        .auto-style11 {
            width: 202px;
        }

        .auto-style12 {
            text-align: center;
        }
        .auto-style13 {
            padding-top: 3%;
            text-align: center;
            width: 28px;
        }
    </style>
    <link href="../Content/bootstrap.css" rel="stylesheet" />
    <link href="../Content/bootstrap.min.css" rel="stylesheet" />
    <link href="../Styles/jquery-ui.css" rel="stylesheet" />
    <link href="../Styles/jquery-ui.min.css" rel="stylesheet" />
    <script src="../Scripts/jquery-3.2.1.min.js"></script>
    <script src="../Scripts/jquery-ui.js"></script>

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
                    <li class="selected"><a href="ProfileManage.aspx">Profile</a> </li>
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
                    <%} else { } %>
                   <li><asp:Button ID="btnLogout" CssClass="btn btn-block" runat="server" Text="Logout" OnClick="btnLogout_Click" /></li>
                </ul>
            </div>
            <div class="body">
                <div class="auto-style1">
                    <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Size="XX-Large" ForeColor="Gray" Text="Profile"></asp:Label>
                    <br />
                    <div class="auto-style2">
                        <table class="auto-style10">
                            <tr>
                                <td class="auto-style4">Username:</td>
                                <td class="auto-style5">
                                    <asp:TextBox ID="txtUsername" runat="server" ReadOnly="True" Width="270px" CssClass="form-control" Height="38px"></asp:TextBox>
                                </td>
                                <td class="auto-style6"></td>
                            </tr>
                            <tr>
                                <td class="auto-style4">Name:</td>
                                <td class="auto-style5">
                                    <asp:TextBox ID="txtName" runat="server" CssClass="form-control" Width="270px"></asp:TextBox>
                                </td>
                                <td class="auto-style6">
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtName" ErrorMessage="RequiredFieldValidator">Please input your name.</asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style4">Birthday:</td>
                                <td class="auto-style5">
                                    <asp:TextBox ID="txtDatePicker" runat="server" CssClass="form-control" Width="270px"></asp:TextBox>
                                </td>
                                <td class="auto-style6">
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtDatePicker" ErrorMessage="RequiredFieldValidator">Please choose your birthday.</asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style4">Sex:</td>
                                <td class="auto-style5">
                                    <asp:RadioButtonList ID="rbList" runat="server">
                                        <asp:ListItem>Male</asp:ListItem>
                                        <asp:ListItem>Female</asp:ListItem>
                                    </asp:RadioButtonList>
                                </td>
                                <td class="auto-style6">&nbsp;</td>
                            </tr>
                            <tr>
                                <td class="auto-style4">Phone:</td>
                                <td class="auto-style5">
                                    <asp:TextBox ID="txtPhone" runat="server" CssClass="form-control" Width="270px"></asp:TextBox>
                                </td>
                                <td class="auto-style6">
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtPhone" ErrorMessage="RequiredFieldValidator">Phone not null.</asp:RequiredFieldValidator><br />
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="txtPhone" ErrorMessage="RegularExpressionValidator" ValidationExpression="([0-9]{9,11})$">Phone number must be 9 or 11 positive integer number characters.</asp:RegularExpressionValidator>
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style4">Email</td>
                                <td class="auto-style5">
                                    <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" Width="270px"></asp:TextBox>
                                </td>
                                <td class="auto-style6">
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtEmail" ErrorMessage="RequiredFieldValidator">Email not null.</asp:RequiredFieldValidator>
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtEmail" ErrorMessage="RegularExpressionValidator" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*">Invalid email.</asp:RegularExpressionValidator>
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style13">&nbsp;</td>
                                <td class="auto-style11">
                                    <asp:Button ID="btnUpdate" runat="server" Text="Update" CssClass="btn btn-success" OnClick="btnUpdate_Click" />

                                </td>
                                <td class="auto-style12">
                                    <asp:HyperLink ID="linkChangePass" runat="server" NavigateUrl="~/Website/ChangePassword.aspx">Change Password</asp:HyperLink>
                                </td>
                            </tr>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script>
        $(function () {
            $('#ctl00_ContentPlaceHolder1_txtDatePicker').datepicker(
                {
                    dateFormat: 'dd/mm/yy',
                    changeMonth: true,
                    changeYear: true,
                    yearRange: '1950:2017'
                });
        })
    </script>
</asp:Content>


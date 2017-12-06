<%@ Page Language="C#" AutoEventWireup="true" CodeFile="SignUp.aspx.cs" Inherits="SignUp" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Register Page</title>
    <style type="text/css">
        .auto-style3 {
            width: 100%;
            box-sizing: border-box;
            padding-left: 40%;
            padding-right: 10%;
        }

        .auto-style4 {
            padding-bottom: 2%;
            width: 291px;
        }

        .auto-style7 {
            text-align: left;
            height: 40px;
            width: 291px;
        }

        .auto-style8 {
            width: 69%;
        }

        .auto-style9 {
            width: 89%;
        }

        .auto-style10 {
            width: 35%;
            padding-top: 5%;
        }
    </style>
    <link href="../Content/bootstrap.css" rel="stylesheet" />
    <link href="../Content/bootstrap.min.css" rel="stylesheet" />
    <link href="../Styles/jquery-ui.css" rel="stylesheet" />
    <link href="../Styles/jquery-ui.min.css" rel="stylesheet" />   
</head>
    <script src="../Scripts/jquery-3.2.1.min.js"></script>
    <script src="../Scripts/jquery-ui.js"></script>

<body>
    <form id="form1" runat="server">
        <div>
            <div class="auto-style3">
                <div style="text-align: center;" class="auto-style10">
                    <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Size="XX-Large" ForeColor="Black" Text="Register"></asp:Label>
                </div>
                <br />
                <table class="auto-style9">
                    <tr>
                        <td class="auto-style4">Username:
                        <asp:TextBox ID="txtUsername" runat="server" Width="250px" CssClass="form-control"></asp:TextBox>
                        </td>
                        <td class="auto-style5">
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="RequiredFieldValidator" ControlToValidate="txtUsername">Please input username.</asp:RequiredFieldValidator><br/>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ErrorMessage="RegularExpressionValidator" ControlToValidate="txtUsername" ValidationExpression="([a-zA-Z0-9]{6,14})$">Username must be at least 6 chars length and maximum length is 14.</asp:RegularExpressionValidator>
                        </td>
                    </tr>
                    <tr>

                        <td class="auto-style4">Password:
                        <asp:TextBox ID="txtPassword" runat="server" Width="250px" CssClass="form-control" TextMode="Password"></asp:TextBox>
                        </td>
                        <td class="auto-style5">
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="RequiredFieldValidator" ControlToValidate="txtPassword">Please input password</asp:RequiredFieldValidator><br/>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ErrorMessage="RegularExpressionValidator" ControlToValidate="txtPassword" ValidationExpression="(?!^[0-9]*$)(?!^[a-zA-Z]*$)^([a-zA-Z0-9]{6,14})$">Password must be between 6 and 14 characters long and must contain at least one number, at least one lowercase letter.</asp:RegularExpressionValidator>
                        </td>
                    </tr>
                    <tr>

                        <td class="auto-style4">Confirm Password:
                        <asp:TextBox ID="txtConfirmPass" runat="server" Width="250px" CssClass="form-control" TextMode="Password"></asp:TextBox>
                        </td>
                        <td class="auto-style5">
                            <asp:CompareValidator ID="CompareValidator1" runat="server" ErrorMessage="CompareValidator" ControlToCompare="txtPassword" ControlToValidate="txtConfirmPass">Confirm password must match with password.</asp:CompareValidator>
                        </td>
                    </tr>
                    <tr>

                        <td class="auto-style4">Email:
                        <asp:TextBox ID="txtMail" runat="server" Width="250px" CssClass="form-control"></asp:TextBox>
                        </td>
                        <td class="auto-style5">
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="RequiredFieldValidator" ControlToValidate="txtMail">Please input your email address.</asp:RequiredFieldValidator><br/>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="RegularExpressionValidator" ControlToValidate="txtMail" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*">Your email address is invalid.</asp:RegularExpressionValidator>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style4">Date Of Birth:
                        <asp:TextBox ID="txtDatePicker" runat="server" Width="250px" CssClass="form-control"></asp:TextBox>
                        </td>
                        <td class="auto-style5">
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="RequiredFieldValidator" ControlToValidate="txtDatePicker">Please input your birthday.</asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style7">
                            <asp:Button ID="btnSignUp" runat="server" Text="Register" CssClass="btn btn-success" Width="80px" OnClick="btnSignUp_Click" />
                            <asp:Button ID="btnLogin" runat="server" Text="Login" CssClass="btn btn-danger" Width="80px" OnClick="btnLogin_Click" CausesValidation="False" />
                        </td>
                        <td class="auto-style8"></td>
                    </tr>
                </table>
            </div>
        </div>
    </form>
</body>
<script>
    $(function () {
        $('#txtDatePicker').datepicker(
            {
                dateFormat: 'dd/mm/yy',
                changeMonth: true,
                changeYear: true,
                yearRange: '1950:2017'
            });
    })
</script>
</html>

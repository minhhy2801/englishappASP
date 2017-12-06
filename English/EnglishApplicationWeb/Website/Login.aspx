<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Login Form</title>
    <style>
        body {
            padding-top: 10%;
            padding-left: 5%;
        }

        .auto-style2 {
            width: 50%;
            max-width: 1140px;
            margin: auto;
            padding-left: 15px;
            padding-right: 15px;
        }

        .auto-style4 {
            width: 500px;
            height: 134px;
            margin-bottom: 1rem;
            text-align: left;
            padding-left: 5%;
        }

        .auto-style6 {
            left: 0px;
            top: 0px;
            width: 530px;
        }

        .auto-style7 {
            display: block;
            width: 100%;
            font-size: 1rem;
            line-height: 1.25;
            color: #495057;
            background-clip: padding-box;
            border-radius: .25rem;
            transition: border-color ease-in-out .15s, box-shadow ease-in-out .15s;
            height: 40px;
            margin-bottom: 15px;
        }

        .auto-style8 {
            text-align: center;
        }
    </style>

    <link href="../Content/bootstrap.css" rel="stylesheet" />
    <link href="../Content/bootstrap.min.css" rel="stylesheet" />

</head>
<script>
    window.location.hash = "no-back-button";
    window.location.hash = "Again-no-back-button";//for google chrome
    window.onhashchange = function () { window.location.hash = "no-back-button"; }
</script>
<body>

    <form id="form1" runat="server">
        <div class="auto-style2">
            <div class="row">
                <div class="auto-style6">
                    <div class="panel panel-default">
                        <div class="auto-style8">
                            <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Size="XX-Large" ForeColor="Black" Text="Login"></asp:Label>
                            <div class="auto-style4">
                                &nbsp;
                                    <asp:TextBox ID="txtUsername" runat="server" CssClass="auto-style7" placeholder="Username" Font-Size="Medium"></asp:TextBox>
                                <asp:TextBox ID="txtPassword" runat="server" CssClass="auto-style7" TextMode="Password" Font-Size="Medium" placeholder="Password"></asp:TextBox>
                            </div>
                        </div>
                        <div class="panel-body">
                            <fieldset>
                                <!--div class="checkbox">
                                    <label>
                                        &nbsp;
                                    <asp:CheckBox ID="cbRemember" runat="server" Text="Remember me" />

                                    </label>
                                    <br />
                                </!--div-->
                                <asp:Button ID="btnLogin" runat="server" Text="Login" CssClass="btn btn-success " Font-Bold="True" OnClick="btnLogin_Click" Width="100px" />
                                <asp:Button ID="btnSignUp" runat="server" Text="Sign Up" CssClass="btn btn-danger" Font-Bold="True" Width="100px" OnClick="btnSignUp_Click" />
                            </fieldset>
                            <br />
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </form>
</body>
<script src="../Scripts/popper.js"></script>
<script src="../Scripts/jquery-1.9.1.js"></script>
<script src="../Scripts/jquery-1.9.1.min.js"></script>
<script src="../Scripts/bootstrap.js"></script>
<script src="../Scripts/bootstrap.min.js"></script>
</html>

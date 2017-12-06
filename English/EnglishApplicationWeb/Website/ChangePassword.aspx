<%@ Page Title="" Language="C#" MasterPageFile="~/Website/MasterPage.master" AutoEventWireup="true" CodeFile="ChangePassword.aspx.cs" Inherits="ChangePassword" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
     <link href="../Content/bootstrap.css" rel="stylesheet" />
    <link href="../Content/bootstrap.min.css" rel="stylesheet" />
     <style type="text/css">
          .auto-style1 {
            padding-top: 3%;
            text-align: center;
             width: 686px;
             height: 415px;
         }
            body {
            overflow: hidden;
        }
        .auto-style2 {
            padding-top: 3%;
            text-align: left;
        }

        .auto-style10 {
            width: 100%;
            height: 268px;
        }
        .auto-style18{
            padding-bottom:3%;
        }
        .auto-style12 {
            width: 245px;
            padding-bottom: 5%;
        }
         .auto-style19 {
             text-align: center;
         }
         .auto-style999 {
            opacity: 0.0;
         }
         .body div div {
             
             margin: 0 21px;
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
                &nbsp;<ul>
                     <li><strong>Hello, <%= Session["NAME"].ToString() %></strong></li>
                    <li><a href="HomePage.aspx"">Home</a> </li>
                    <li class="selected"><a href="ProfileManage.aspx">Profile</a> </li>
                   <%if (Session["ID"].ToString().Equals("admin"))
                        {%>
                    <li><a href="ManageTest.aspx">Test</a> </li>
                    <%} else { %>
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
                    <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Size="XX-Large" ForeColor="Gray" Text="Change Password"></asp:Label>
                    <br />
                    <div class="auto-style2">
            <table class="auto-style10">
                <tr>
                    <td class="auto-style17">Username:&nbsp;</td>
                    <td class="auto-style18">
                        <asp:TextBox ID="txtUsername" runat="server" CssClass="form-control" Width="245px" ReadOnly="True"></asp:TextBox>
                    </td>
                    <td class="auto-style999">
                        <asp:TextBox ID="TextBox1" runat="server" OnTextChanged="TextBox1_TextChanged" ReadOnly="True"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style17">Old Password:</td>
                    <td class="auto-style18">
                        <asp:TextBox ID="txtOldPass" runat="server" CssClass="form-control" Width="245px" TextMode="Password"></asp:TextBox>
                    </td>
                    <td class="auto-style2">
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtOldPass" ErrorMessage="RequiredFieldValidator">Old password not null.</asp:RequiredFieldValidator><br/>
                        <asp:CompareValidator ID="CompareValidator2" runat="server" ControlToValidate="txtOldPass" ErrorMessage="CompareValidator" ControlToCompare="TextBox1">Password is not correct for </asp:CompareValidator><br/><br/>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style17">New Password:</td>
                    <td class="auto-style18">
                        <asp:TextBox ID="txtNewPass" runat="server" CssClass="form-control" Width="245px" TextMode="Password"></asp:TextBox>
                    </td>
                    <td class="auto-style16">
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtNewPass" ErrorMessage="RequiredFieldValidator">New password not null.</asp:RequiredFieldValidator><br/>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtNewPass" ErrorMessage="RegularExpressionValidator" ValidationExpression="(?!^[0-9]*$)(?!^[a-zA-Z]*$)^([a-zA-Z0-9]{6,14})$">Password must be between 6 and 14 characters long and must contain at least one number, at least one lowercase letter.</asp:RegularExpressionValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style17">Confirm New Password:</td>
                    <td class="auto-style18">
                        <asp:TextBox ID="txtConfirm" runat="server" CssClass="form-control" Width="245px" TextMode="Password"></asp:TextBox>
                    </td>
                    <td class="auto-style16">
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtConfirm" ErrorMessage="RequiredFieldValidator">Confirm new password not null.</asp:RequiredFieldValidator><br/>
                        <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="txtNewPass" ControlToValidate="txtConfirm" ErrorMessage="CompareValidator">Confirm new password must match with new password.</asp:CompareValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style11"></td>
                    <td class="auto-style12">
                        <asp:Button ID="btnChange" runat="server" Text="Change Password" CssClass="btn btn-danger" OnClick="btnChange_Click" />
                    </td>
                    <td class="auto-style19">
                        <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Website/ProfileManage.aspx">Update Profile</asp:HyperLink>
                    </td>
                </tr>


            </table>
                    </div>
                    </div>
                </div>
            </div>
        </div>
   
</asp:Content>



<%@ Page Title="" Language="C#" MasterPageFile="~/Website/MasterPage.master" AutoEventWireup="true" CodeFile="AllMembers.aspx.cs" Inherits="AllMembers" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
        .auto-style1 {
            height: 558px;
        }
        body{
            overflow:hidden;
        }
        #memList{
            overflow-y:scroll;
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
                    <li><a href="ManageTest.aspx">Test</a> </li>
                    <li><a href="HighScore.aspx">leaderboard</a> </li>
                    <li class="selected"><a href="AllMembers.aspx">Members List</a> </li>
                  <li><asp:Button ID="btnLogout" CssClass="btn btn-block" runat="server" Text="Logout" OnClick="btnLogout_Click" /></li>
                </ul>
            </div>
            <div class="body">
                <div class="auto-style1" id="memList">
                    <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Size="XX-Large" ForeColor="Gray" Text="Members List"></asp:Label>

                    <asp:GridView ID="gvMem" runat="server" Width="532px" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="AccountID" DataSourceID="SqlDataSource1" EnableModelValidation="True" AllowPaging="True" CellPadding="4" ForeColor="#333333" GridLines="None" Height="236px">
                        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                        <Columns>
                            <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                            <asp:BoundField DataField="AccountID" HeaderText="AccountID" ReadOnly="True" SortExpression="AccountID" />
                            <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
                            <asp:BoundField DataField="DateOfBirth" HeaderText="DateOfBirth" SortExpression="DateOfBirth" />
                            <asp:BoundField DataField="Sex" HeaderText="Sex" SortExpression="Sex" />
                            <asp:BoundField DataField="Phone" HeaderText="Phone" SortExpression="Phone" />
                            <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
                            <asp:BoundField DataField="DateOfCreate" HeaderText="DateOfCreate" SortExpression="DateOfCreate" />
                        </Columns>
                        <EditRowStyle BackColor="#999999" />
                        <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                        <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                        <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                        <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                    </asp:GridView>

                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:XiSapAssignmentConnectionString %>" DeleteCommand="DELETE FROM [Account] WHERE [AccountID] = @AccountID" InsertCommand="INSERT INTO [Account] ([AccountID], [Name], [DateOfBirth], [Sex], [Phone], [Email], [DateOfCreate]) VALUES (@AccountID, @Name, @DateOfBirth, @Sex, @Phone, @Email, @DateOfCreate)" SelectCommand="SELECT [AccountID], [Name], [DateOfBirth], [Sex], [Phone], [Email], [DateOfCreate] FROM [Account]" UpdateCommand="UPDATE [Account] SET [Name] = @Name, [DateOfBirth] = @DateOfBirth, [Sex] = @Sex, [Phone] = @Phone, [Email] = @Email, [DateOfCreate] = @DateOfCreate WHERE [AccountID] = @AccountID">
                        <DeleteParameters>
                            <asp:Parameter Name="AccountID" Type="String" />
                        </DeleteParameters>
                        <InsertParameters>
                            <asp:Parameter Name="AccountID" Type="String" />
                            <asp:Parameter Name="Name" Type="String" />
                            <asp:Parameter Name="DateOfBirth" Type="DateTime" />
                            <asp:Parameter Name="Sex" Type="String" />
                            <asp:Parameter Name="Phone" Type="String" />
                            <asp:Parameter Name="Email" Type="String" />
                            <asp:Parameter Name="DateOfCreate" Type="DateTime" />
                        </InsertParameters>
                        <UpdateParameters>
                            <asp:Parameter Name="Name" Type="String" />
                            <asp:Parameter Name="DateOfBirth" Type="DateTime" />
                            <asp:Parameter Name="Sex" Type="String" />
                            <asp:Parameter Name="Phone" Type="String" />
                            <asp:Parameter Name="Email" Type="String" />
                            <asp:Parameter Name="DateOfCreate" Type="DateTime" />
                            <asp:Parameter Name="AccountID" Type="String" />
                        </UpdateParameters>
                    </asp:SqlDataSource>

                </div>
            </div>
        </div>
    </div>
</asp:Content>



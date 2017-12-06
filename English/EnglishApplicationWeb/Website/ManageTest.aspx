<%@ Page Title="" Language="C#" MasterPageFile="~/Website/MasterPage.master" AutoEventWireup="true" CodeFile="ManageTest.aspx.cs" Inherits="Website_ManageTest" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link href="../Content/bootstrap.css" rel="stylesheet" />
    <link href="../Content/bootstrap.min.css" rel="stylesheet" />
    <script src="../Scripts/jquery-3.2.1.js"></script>
    <script src="../Scripts/bootstrap.js"></script>
    <script src="../Scripts/bootstrap.min.js"></script>

    <style type="text/css">
        .auto-style1 {
            height: 583px;
        }

        body {
            overflow: hidden;
        }

        .auto-style2 {
            text-align: center;
            margin-bottom: 30px;
        }

        .auto-style3 {
            text-align: justify;
            padding-left: 10%;
        }
        #memTest{
            overflow-y:scroll;
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
                  <li><asp:Button ID="btnLogout" CssClass="btn btn-block" runat="server" Text="Logout" OnClick="btnLogout_Click"/></li>
                </ul>
            </div>
            <div class="body">
                <div class="auto-style1" id="memTest">
                    <div class="container">
                        <ul class="nav nav-tabs" style="height: 50px;">
                            <li class="active"><a href="ManageTest.aspx">Manage Test</a></li>
                            <li><a href="ViewTest.aspx">View All Test</a></li>
                        </ul>
                    </div>
                    <p class="auto-style2">
                        <strong>Test Manager
                            <asp:Button ID="btnAddTest" runat="server" Text="Add Test" CssClass="btn btn-success" Width="140px" OnClick="btnAddTest_Click" />
                        </strong>
                    </p>

                    <div class="auto-style3">

                        <asp:GridView ID="gvTest" runat="server" Width="690px" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="TestID" DataSourceID="SqlDataSource1" EnableModelValidation="True" AllowPaging="True" Height="242px" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="Horizontal">
                            <Columns>
                                <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                                <asp:BoundField DataField="TestID" HeaderText="TestID" ReadOnly="True" SortExpression="TestID" />
                                <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
                                <asp:BoundField DataField="Status" HeaderText="Status" SortExpression="Status" />

                                <asp:BoundField HeaderText="Number Of Quiz" SortExpression="NumQuiz" ReadOnly="True" DataField="NumQuiz" />

                            </Columns>
                            <EditRowStyle HorizontalAlign="Center" />
                            <EmptyDataRowStyle HorizontalAlign="Center" />
                            <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
                            <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" />
                            <PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="Right" />
                            <SelectedRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
                        </asp:GridView>

                    </div>

                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:XiSapAssignmentConnectionString %>"
                        DeleteCommand="DELETE FROM [Test] WHERE [TestID] = @TestID"
                        InsertCommand="INSERT INTO [Test] ([TestID], [Name], [Status]) 
                        VALUES (@TestID, @Name, @Status)"
                        SelectCommand=" Select t.TestID, t.Name, t.Status, ISNULL(tc.numOfQuiz,0) as NumQuiz from Test t left join (select TestID, COUNT(QuizID) as numOfQuiz from TestControl group by TestID) tc on  t.TestID= tc.TestID"
                        UpdateCommand="UPDATE [Test] SET [Name] = @Name, [Status] = @Status WHERE [TestID] = @TestID">
                        <DeleteParameters>
                            <asp:Parameter Name="TestID" Type="String" />
                        </DeleteParameters>
                        <InsertParameters>
                            <asp:Parameter Name="TestID" Type="Int32" />
                            <asp:Parameter Name="Name" Type="String" />
                            <asp:Parameter Name="Status" Type="String" />

                        </InsertParameters>
                        <UpdateParameters>
                            <asp:Parameter Name="TestID" Type="Int32" />
                            <asp:Parameter Name="Name" Type="String" />
                            <asp:Parameter Name="Status" Type="String" />

                        </UpdateParameters>
                    </asp:SqlDataSource>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

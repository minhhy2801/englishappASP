using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Website_ManageTest : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btnAddTest_Click(object sender, EventArgs e)
    {
        TestDAO dao = new TestDAO();
        Test t = new Test
        {
            Name = "",
            Status = false
        };
        bool result = dao.addTest(t);
        Response.Redirect("ManageTest.aspx");
    }

    protected void btnLogout_Click(object sender, EventArgs e)
    {
        Session.Abandon();
        Session.Clear();
        Response.Redirect("Login.aspx");
    }
}
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class AllTest : System.Web.UI.Page
{
    WebMessageBox aaa = new WebMessageBox();
    protected void Page_Load(object sender, EventArgs e)
    {
        
    }

    protected void Button1_Click(object sender, EventArgs e)
    {

    }

    protected void Unnamed_ServerClick(object sender, EventArgs e)
    {

    }

    protected void btnLogout_Click(object sender, EventArgs e)
    {
        Session.Abandon();
        Session.Clear();
        Response.Redirect("Login.aspx");
    }
}
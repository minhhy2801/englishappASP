using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ChangePassword : System.Web.UI.Page
{
    AccountDAO accDAO = new AccountDAO();
    AnswerDAO ansDAO = new AnswerDAO();
    QuizDAO qDAO = new QuizDAO();
    TestDAO tDAO = new TestDAO();

    protected void Page_Load(object sender, EventArgs e)
    {
        string accountID = (string)Session["ID"];
        txtUsername.Text = accountID;
        string username = txtUsername.Text;
        if (CompareValidator2.Text.Length == 28)
        {
            CompareValidator2.Text += username;
        }
        string password = accDAO.getPassword(username);
        TextBox1.Text = password;

    }

    protected void btnChange_Click(object sender, EventArgs e)
    {
        if (txtOldPass.Text.Equals(TextBox1.Text))
        {
            bool result = accDAO.updatePassword(txtUsername.Text, txtNewPass.Text);
            if (result == true)
            {
                Response.Redirect("Login.aspx");
            }
        }
        else
        {
            CompareValidator2.Visible = true;
        }
    }

    protected void btnReset_Click(object sender, EventArgs e)
    {

    }

    protected void TextBox1_TextChanged(object sender, EventArgs e)
    {

    }

    protected void btnLogout_Click(object sender, EventArgs e)
    {
        Session.Abandon();
        Session.Clear();
        Response.Redirect("Login.aspx");
    }
}
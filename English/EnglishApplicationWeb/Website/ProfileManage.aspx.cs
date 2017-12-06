using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ProfileManage : System.Web.UI.Page
{
    AccountDAO dao = new AccountDAO();
    WebMessageBox wmb = new WebMessageBox();

    protected void Page_Load(object sender, EventArgs e)
    {
        if(txtName.Text == "")
            loadInfor();
    }
    private void loadInfor()
    {
        string accountID = (string)Session["ID"];
        Account acc = dao.getAccountInfo(accountID);
        txtUsername.Text = accountID;
        txtName.Text = acc.name;
        txtPhone.Text = acc.phone;
        txtEmail.Text = acc.email;
        txtDatePicker.Text = acc.dob;
        if(acc.gender == null)
        {
            rbList.SelectedIndex = 0;
        } else
        {
            if (acc.gender.Equals("male"))
            {
                rbList.SelectedIndex = 0;
            }
            else
            {
                rbList.SelectedIndex = 1;
            }
        }
    }


    protected void btnUpdate_Click(object sender, EventArgs e)
    {
        Account newInfor = new Account();
        Console.WriteLine(txtName.Text);
        newInfor.username = txtUsername.Text;
        newInfor.name = txtName.Text;
        newInfor.phone = txtPhone.Text;
        newInfor.email = txtEmail.Text;
        string[] arr = txtDatePicker.Text.Split('/');
        DateTime dob = DateTime.Parse(arr[1].ToString() + "/" + arr[0].ToString() + "/" + arr[2].ToString() + " 00:00:00 AM");
        string sqlFormattedDob = dob.Date.ToString("yyyy-MM-dd HH:mm:ss");
        newInfor.dob = sqlFormattedDob;
        int rbIndex = rbList.SelectedIndex;
        if (rbIndex == 0)
        {
            newInfor.gender = "male";
        }
        else
        {
            newInfor.gender = "female";
        }

        int result = dao.updateAccount(newInfor);
        if (result == 1)
        {
            wmb.Show("Update profile for account " + newInfor.username + " successfully!");
        }
        else
        {
            wmb.Show("There are some mistake when update profile, please try again!");
        }
    }

    protected void btnLogout_Click(object sender, EventArgs e)
    {
        Session.Abandon();
        Session.Clear();
        Response.Redirect("Login.aspx");
    }
}
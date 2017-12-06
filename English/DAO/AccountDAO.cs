using System;
using System.Data.SqlClient;
using System.Data;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI.WebControls;
using System.Web.Configuration;

public class AccountDAO
{
    //"server=.;database=XiSapAssignment1;uid=sa;pwd=hoangyenminh";
    String strConnection = WebConfigurationManager.ConnectionStrings["XiSapAssignment1"].ToString();
    public AccountDAO()
    {

    }

    public Account getAccountInfo(string username)
    {
        Account result = new Account();
        String sql = "Select * from Account where AccountID=@username";
        SqlConnection cnn = new SqlConnection(strConnection);
        SqlCommand cmd = new SqlCommand(sql, cnn);
        cmd.Parameters.AddWithValue("@username", username);
        try
        {
            cnn.Open();
            SqlDataReader reader = cmd.ExecuteReader();
            while (reader.Read())
            {
                DateTime dateTime = (DateTime)reader["DateOfBirth"];
                string dobString = dateTime.ToString();
                string[] arr = dobString.Split(' ');
                string[] arr1 = arr[0].Split('/');
                result.dob = arr1[1] + "/" + arr1[0] + "/" + arr1[2];
                result.email = (string)reader["Email"];
                result.phone = (string)reader["Phone"];
                result.name = (string)reader["Name"];
                result.gender = (string)reader["Sex"];
            }
        }
        catch (Exception e)
        {
            Console.WriteLine(e.ToString());
        }
        finally
        {
            cnn.Close();
        }
        return result;
    }

    public string checkLogin(String username, String password)
    {
        String result = "fail";
        SqlConnection cnn = new SqlConnection(strConnection);
        String sql = "Select * from Account where AccountID=@username and Password=@pass";
        SqlCommand cmd = new SqlCommand(sql, cnn);
        cmd.Parameters.AddWithValue("@username", username);
        cmd.Parameters.AddWithValue("@pass", password);
        try
        {
            cnn.Open();
            SqlDataReader reader = cmd.ExecuteReader();
            if (reader.Read() == true)
                result = (string)reader["AccountID"];
        }
        catch (Exception e)
        {
            Console.WriteLine(e.ToString());
        }
        finally
        {
            cnn.Close();
        }
        return result;
    }

    public string getName(String username)
    {
        String result = "fail";
        SqlConnection cnn = new SqlConnection(strConnection);
        String sql = "Select * from Account where AccountID=@username";
        SqlCommand cmd = new SqlCommand(sql, cnn);
        cmd.Parameters.AddWithValue("@username", username);
        try
        {
            cnn.Open();
            SqlDataReader reader = cmd.ExecuteReader();
            if (reader.Read() == true) result = (string)reader["Name"];
        }
        catch (Exception e)
        {
            Console.WriteLine(e.ToString());
        }
        finally
        {
            cnn.Close();
        }
        return result;
    }

    public bool updatePassword(string username, string newPassword)
    {
        int count = 0;
        SqlConnection cnn = new SqlConnection(strConnection);
        String sql = "Update Account set Password=@pass where AccountID=@username";
        SqlCommand cmd = new SqlCommand(sql, cnn);
        cmd.Parameters.AddWithValue("@pass", newPassword);
        cmd.Parameters.AddWithValue("@username", username);
        try
        {
            cnn.Open();
            count = cmd.ExecuteNonQuery();
        }
        catch (Exception e)
        {
            Console.WriteLine(e.ToString());
        }
        finally
        {
            cnn.Close();
        }
        return (count > 0);
    }

    public int updateAccount(Account acc)
    {
        int count = 0;
        SqlConnection cnn = new SqlConnection(strConnection);
        String sql = "Update Account set Name=@name,DateOfBirth=@dob,Sex=@sex,Phone=@phone,Email=@email where AccountID=@username";
        SqlCommand cmd = new SqlCommand(sql, cnn);
        cmd.Parameters.AddWithValue("@name", acc.name);
        cmd.Parameters.AddWithValue("@dob", acc.dob);
        cmd.Parameters.AddWithValue("@sex", acc.gender);
        cmd.Parameters.AddWithValue("@phone", acc.phone);
        cmd.Parameters.AddWithValue("@email", acc.email);
        cmd.Parameters.AddWithValue("@username", acc.username);
        try
        {
            cnn.Open();
            count = cmd.ExecuteNonQuery();
        }
        catch (Exception e)
        {
            Console.WriteLine(e.ToString());
        }
        finally
        {
            cnn.Close();
        }
        return count;
    }

    public string getPassword(String username)
    {
        String result = "fail";
        SqlConnection cnn = new SqlConnection(strConnection);
        String sql = "Select Password from Account where AccountID=@username";
        SqlCommand cmd = new SqlCommand(sql, cnn);
        cmd.Parameters.AddWithValue("@username", username);
        try
        {
            cnn.Open();
            SqlDataReader reader = cmd.ExecuteReader();
            while (reader.Read())
                result = (string)reader["Password"];
        }
        catch (Exception e)
        {
            Console.WriteLine(e.ToString());
        }
        finally
        {
            cnn.Close();
        }
        return result;
    }

    public bool addNewAccount(Account newAccount)
    {
        int count = 0;
        SqlConnection cnn = new SqlConnection(strConnection);
        String sql = "Insert Account(AccountID,Password,DateOfBirth,Email,DateOfCreate) values(@id,@pass,@dob,@email,@dateCreate)";
        SqlCommand cmd = new SqlCommand(sql, cnn);
        cmd.Parameters.AddWithValue("@id", newAccount.username);
        cmd.Parameters.AddWithValue("@pass", newAccount.password);
        cmd.Parameters.AddWithValue("@dob", newAccount.dob);
        cmd.Parameters.AddWithValue("@email", newAccount.email);
        cmd.Parameters.AddWithValue("@dateCreate", newAccount.dateCreate);
        try
        {
            cnn.Open();
            count = cmd.ExecuteNonQuery();
        }
        catch (Exception e)
        {
            Console.WriteLine(e.ToString());
        }
        finally
        {
            cnn.Close();
        }
        return (count > 0);
    }

    public GridView getAllMember(GridView data)
    {
        SqlConnection cnn = new SqlConnection(strConnection);
        String sql = "select AccountID,Name,DateOfBirth,Sex,Phone,Email,DateOfCreate from Account where AccountID != 'admin'";
        SqlCommand cmd = new SqlCommand(sql, cnn);
        try
        {
            cnn.Open();
            data.DataSource = cmd.ExecuteReader();
            data.DataBind();
        }
        catch (Exception e)
        {
            Console.WriteLine(e.ToString());
        }
        finally
        {
        }
        return data;
    }

}


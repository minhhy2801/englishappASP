using System;
using System.Data.SqlClient;
using System.Data;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI.WebControls;
using System.Web.Configuration;

/// <summary>
/// Summary description for TestDAO
/// </summary>
public class TestDAO
{
    String strConnection = WebConfigurationManager.ConnectionStrings["XiSapAssignment1"].ToString();
    public TestDAO()
    {

    }

    public TestDAO(string strConnection)
    {
        this.strConnection = strConnection;
    }

    public bool setStatusPass(int testID)
    {
        int count = 0;
        SqlConnection cnn = new SqlConnection(strConnection);
        String sql = "Update Test set Status=1 where TestID = @testID";
        SqlCommand cmd = new SqlCommand(sql, cnn);
        cmd.Parameters.AddWithValue("@testID", testID);
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

    
    public int numberOfQuiz(int test)
    {
        int result = 0;
        SqlConnection cnn = new SqlConnection(strConnection);
        String sql = "Select count(TestID) as Num, TestID from TestControl where TestID=@test GROUP BY TestID";
        SqlCommand cmd = new SqlCommand(sql, cnn);
        cmd.Parameters.AddWithValue("@test", test);
        try
        {
            cnn.Open();
            SqlDataReader reader = cmd.ExecuteReader();
            while (reader.Read())
                result = (int)reader["Num"];
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

    public int countTests()
    {
        int result = 0;
        SqlConnection cnn = new SqlConnection(strConnection);
        String sql = "select COUNT(TestID) as NumOfTest from Test";
        SqlCommand cmd = new SqlCommand(sql, cnn);
        try
        {
            cnn.Open();
            SqlDataReader reader = cmd.ExecuteReader();
            while (reader.Read())
            {
                result = (int)reader["NumOfTest"];
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

    public int getLargestQuizIdOfTest(int quiz)
    {
        int result = 0;
        SqlConnection cnn = new SqlConnection(strConnection);
        String sql = "Select top 1 QuizID from TestControl where TestID=@testNum order by QuizID desc";
        SqlCommand cmd = new SqlCommand(sql, cnn);
        cmd.Parameters.AddWithValue("@testNum", quiz);
        try
        {
            cnn.Open();
            SqlDataReader reader = cmd.ExecuteReader();
            while (reader.Read())
            {
                result = (int)reader["QuizID"];
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

    public int[] getAllQuizOfTest(int testNum)
    {
        int[] result = new int[numberOfQuiz(testNum)];
        SqlConnection cnn = new SqlConnection(strConnection);
        String sql = "Select QuizID from TestControl where TestID=@testNum";
        SqlCommand cmd = new SqlCommand(sql, cnn);
        cmd.Parameters.AddWithValue("@testNum", testNum);
        try
        {
            cnn.Open();
            int count = 0;
            SqlDataReader reader = cmd.ExecuteReader();
            while (reader.Read())
            {
                result[count] = (int)reader["QuizID"];
                count++;
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

    public string getTestName(int testID)
    {
        string result = "";
        SqlConnection cnn = new SqlConnection(strConnection);
        String sql = "Select Name From Test Where TestID=@testID";
        SqlCommand cmd = new SqlCommand(sql, cnn);
        cmd.Parameters.AddWithValue("@testID", testID);
        try
        {
            cnn.Open();
            SqlDataReader reader = cmd.ExecuteReader();
            while (reader.Read())
            {
                result = (string)reader["Name"];
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

    public int getTop1TimeDo(int testID, string accountID)
    {
        int result = 0;
        SqlConnection cnn = new SqlConnection(strConnection);
        String sql = "select top 1 TimeDo from TestScore where AccountID = @accountID and TestID = @testID order by TimeDo Desc";
        SqlCommand cmd = new SqlCommand(sql, cnn);
        cmd.Parameters.AddWithValue("@accountID", accountID);
        cmd.Parameters.AddWithValue("@testID", testID);
        try
        {
            cnn.Open();
            SqlDataReader reader = cmd.ExecuteReader();
            while (reader.Read())
            {
                result = (int)reader["TimeDo"];
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

    public string[] getTop5BestScoreName(int testID)
    {
        string[] result = new string[5];
        SqlConnection cnn = new SqlConnection(strConnection);
        String sql = "select t2.Name, t1.Score from (Select top 5 AccountID, Score from TestScore where TestID = @testID order by Score desc)t1, Account t2 where t2.AccountID = t1.AccountID";
        SqlCommand cmd = new SqlCommand(sql, cnn);
        cmd.Parameters.AddWithValue("@testID", testID);
        try
        {
            cnn.Open();
            SqlDataReader reader = cmd.ExecuteReader();
            int count = 0;
            while (reader.Read())
            {
                result[count] = (string)reader["Name"];
                count++;
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

    public int[] getTop5BestScore(int testID)
    {
        int[] result = new int[5];
        SqlConnection cnn = new SqlConnection(strConnection);
        String sql = "select t2.Name, t1.Score from (Select top 5 AccountID, Score from TestScore where TestID = @testID order by Score desc)t1, Account t2 where t2.AccountID = t1.AccountID";
        SqlCommand cmd = new SqlCommand(sql, cnn);
        cmd.Parameters.AddWithValue("@testID", testID);
        try
        {
            cnn.Open();
            SqlDataReader reader = cmd.ExecuteReader();
            int count = 0;
            while (reader.Read())
            {
                result[count] = (int)reader["Score"];
                count++;
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


    public int[] getAllIDOfTest()
    {
        int[] result = new int[5];
        SqlConnection cnn = new SqlConnection(strConnection);
        String sql = "select TestID from Test";
        SqlCommand cmd = new SqlCommand(sql, cnn);
        try
        {
            cnn.Open();
            SqlDataReader reader = cmd.ExecuteReader();
            int count = 0;
            while (reader.Read())
            {
                result[count] = (int)reader["TestID"];
                count++;
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

    

    public int getTop1IDTestScore(int testID, string accountID)
    {
        int result = 0;
        SqlConnection cnn = new SqlConnection(strConnection);
        String sql = "select top 1 IDTestScore from TestScore where AccountID = @accountID and TestID = @testID order by IDTestScore Desc";
        SqlCommand cmd = new SqlCommand(sql, cnn);
        cmd.Parameters.AddWithValue("@accountID", accountID);
        cmd.Parameters.AddWithValue("@testID", testID);
        try
        {
            cnn.Open();
            SqlDataReader reader = cmd.ExecuteReader();
            while (reader.Read())
            {
                result = (int)reader["IDTestScore"];
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

    public bool addNewTestScore(TestScore ts)
    {
        int count = 0;
        SqlConnection cnn = new SqlConnection(strConnection);
        String sql = "Insert TestScore(TestID,AccountID,Score,TimeDo,TimeStart,TimeDoTest) values(@testId,@accountId,@score,@timeDo,@timeStart,@timeDoTest)";
        SqlCommand cmd = new SqlCommand(sql, cnn);
        cmd.Parameters.AddWithValue("@testId", ts.TestID);
        cmd.Parameters.AddWithValue("@accountId", ts.AccountID);
        cmd.Parameters.AddWithValue("@score", ts.Score);
        cmd.Parameters.AddWithValue("@timeDo", ts.TimeDo);
        cmd.Parameters.AddWithValue("@timeStart", ts.TimeStart);
        cmd.Parameters.AddWithValue("@timeDoTest", ts.TimeDoTest);
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

    public bool addTestReview(int idTestScore, int quizID, int answerID)
    {
        int count = 0;
        SqlConnection cnn = new SqlConnection(strConnection);
        String sql = "Insert TestReview(QuizID,IDTestScore,AnswerID) values(@quizID,@idTestScore,@answerID)";
        SqlCommand cmd = new SqlCommand(sql, cnn);
        cmd.Parameters.AddWithValue("@quizID", quizID);
        cmd.Parameters.AddWithValue("@idTestScore", idTestScore);
        cmd.Parameters.AddWithValue("@answerID", answerID);
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
    //-----------------------------------------
  

   
    public int getState(int testID)
    {
        int result = 0;
        SqlConnection cnn = new SqlConnection(strConnection);
        string sql = "select Status from Test where TestID = @id";
        SqlCommand cmd = new SqlCommand(sql, cnn);
        cmd.Parameters.AddWithValue("@id", testID);
        try
        {
            cnn.Open();
            SqlDataReader reader = cmd.ExecuteReader();
            while (reader.Read())
            {
                if ((bool)reader["Status"] == true)
                    result = 1;
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

    public bool addTest(Test t)
    {
        int count = 0;
        SqlConnection cnn = new SqlConnection(strConnection);
        string sql = "insert Test values(@Name, @Status)";
        SqlCommand cmd = new SqlCommand(sql, cnn);
        cmd.Parameters.AddWithValue("@Name", t.Name);
        cmd.Parameters.AddWithValue("@Status", t.Status);
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

    

    public int addTestControl(int quizID, int testID)
    {
        int count = 0;
        SqlConnection cnn = new SqlConnection(strConnection);
        string sql = "insert TestControl values(@test, @quiz)";
        SqlCommand cmd = new SqlCommand(sql, cnn);
        cmd.Parameters.AddWithValue("@test", testID);
        cmd.Parameters.AddWithValue("@quiz", quizID);
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

    public List<TestScore> getListTestScore(string acc, int test)
    {
        string sql = "select * from TestScore where AccountID = @acc and TestID = @test";
        List<TestScore> result = new List<TestScore>();
        SqlConnection cnn = new SqlConnection(strConnection);
        SqlCommand cmd = new SqlCommand(sql, cnn);
        cmd.Parameters.AddWithValue("@test", test);
        cmd.Parameters.AddWithValue("@acc", acc);
        try
        {
            cnn.Open();
            SqlDataReader reader = cmd.ExecuteReader();
            while (reader.Read())
            {
                TestScore ts = new TestScore();
                ts.TestScoreID = (int)reader["IDTestScore"];
                ts.Score = (int)reader["Score"];
                ts.TimeStart = (string)reader["TimeStart"];
                result.Add(ts);
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

   

    public bool updateTest(Test t)
    {
        int count = 0;
        SqlConnection cnn = new SqlConnection(strConnection);
        string sql = "update Test set QuizFrom=@Start, QuizTo=@To where TestID=@ID";
        SqlCommand cmd = new SqlCommand(sql, cnn);
        cmd.Parameters.AddWithValue("@ID", t.TestID);
        cmd.Parameters.AddWithValue("@Start", t.QuizFrom);
        cmd.Parameters.AddWithValue("@To", t.QuizTo);
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

    

    public String[] getReviewScore(string user, int numTest)
    {
        String[] result = new String[2];
        SqlConnection cnn = new SqlConnection(strConnection);
        String sql = "select top 1 Score, TimeDoTest, IDTestScore from TestScore where AccountID = @id and TestID = @test order by TimeDo Desc";
        SqlCommand cmd = new SqlCommand(sql, cnn);
        cmd.Parameters.AddWithValue("@id", user);
        cmd.Parameters.AddWithValue("@test", numTest);
        try
        {
            cnn.Open();
            SqlDataReader reader = cmd.ExecuteReader();
            while (reader.Read())
            {
                result[0] = "Your total score: " + (int)reader["Score"] + "/20 and your test time is " + (string)reader["TimeDoTest"] + "s/30:00s";
                result[1] = (int)reader["IDTestScore"] + "";
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
}


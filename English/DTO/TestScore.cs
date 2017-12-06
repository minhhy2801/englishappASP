using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for TestScore
/// </summary>
public class TestScore
{
    public int TestScoreID { get; set; }
    public int TestID { get; set; }
    public int Score { get; set; }
    public int TimeDo { get; set; }
    public string AccountID { get; set; }
    public string TimeStart { get; set; }
    public string TimeDoTest { get; set; }
    public TestScore()
    {
        
    }
}
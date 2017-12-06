using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for CountDownTimer
/// </summary>
public class CountDownTimer
{
    public TimeSpan TimeLeft;
    System.Threading.Thread thread;
    public CountDownTimer(TimeSpan original)
    {
        this.TimeLeft = original;
    }
    public void Start()
    {
        // Start a background thread to count down time
        thread = new System.Threading.Thread(() =>
        {
            while (true)
            {
                System.Threading.Thread.Sleep(1000);
                TimeLeft = TimeLeft.Subtract(TimeSpan.Parse("00:00:01"));
            }
        });
        thread.Start();
    }
}
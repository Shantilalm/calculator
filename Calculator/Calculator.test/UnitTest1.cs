using System;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using NUnit.Framework;
using Calculator;
namespace Calculator.test
{
    [TestClass]
    public class UnitTest1
    {
        [TestCase]
        public void AddTest()
        {
            MathsHelper helper = new MathsHelper();
            int result = helper.Add(20, 10);
            NUnit.Framework.Assert.AreEqual(36, result);
        }

        //[TestCase]
        //public void SubtractTest()
        //{
        //    MathsHelper helper = new MathsHelper();
        //    int result = helper.Subtract(20, 10);
        //    NUnit.Framework.Assert.AreEqual(10, result);
        //}
    }
}

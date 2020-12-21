using System;

namespace Chp04
{
    class Program
    {
        static void Main(string[] args)
        {
            var manager = new MyManager();
            manager.Init("data.txt");

            Console.WriteLine("Hello World!");
        }
    }
}

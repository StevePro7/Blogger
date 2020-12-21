using System;

namespace Chp04
{
    class Program
    {
        static void Main(string[] args)
        {
            const float gamma = 0.8f;
            const int state = 3;

            var manager = new MyManager(gamma, state);
            manager.Init("data.txt");
            manager.Process();

            Console.WriteLine("Hello World!");
        }
    }
}

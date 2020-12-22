using System;

namespace Chp04
{
    class Program
    {
        static void Main(string[] args)
        {
            const float gamma = 0.8f;
            int state = 0;

            var manager = new MyManager(gamma);
            manager.Init("data.txt");
            state = 1;
            manager.SetState(state);
            manager.Process();

            state = 3;
            manager.SetState(state);
            manager.Process();

            Console.WriteLine("Hello World!");
        }
    }
}

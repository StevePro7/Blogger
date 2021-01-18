namespace MyGame
{
    class Program
    {
        static void Main(string[] args)
        {
            using(var app = new MyApp())
	        app.Run();
        }
    }
}
using ConsoleApp1;
using System;

namespace MyApp
{
	internal class Program
	{
		static void Main(string[] args)
		{
			// Replace with your ChatGPT API key
			string apiKey = "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";
			// Create a ChatGPTClient instance with the API key
			var chatGPTClient = new ChatGPTClient(apiKey);

			// Display a welcome message
			Console.WriteLine("Welcome to the ChatGPT chatbot! Type 'exit' to quit.");

			// Enter a loop to take user input and display chatbot responses
			while (true)
			{
				// Prompt the user for input
				Console.ForegroundColor = ConsoleColor.Green; // Set text color to green
				Console.Write("You: ");
				Console.ResetColor(); // Reset text color to default
				string input = Console.ReadLine() ?? string.Empty;

				// Exit the loop if the user types "exit"
				if (input.ToLower() == "exit")
					break;

				// Send the user's input to the ChatGPT API and receive a response
				string response = chatGPTClient.SendMessage(input);

				// Display the chatbot's response
				Console.ForegroundColor = ConsoleColor.Blue; // Set text color to blue
				Console.Write("Chatbot: ");
				Console.ResetColor(); // Reset text color to default
				Console.WriteLine(response);
			}
		}
	}
}
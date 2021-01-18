using System;
using Microsoft.Xna.Framework;
using Microsoft.Xna.Framework.Graphics;

namespace MyGame
{
	public class MyApp : Game
	{
		SpriteBatch spriteBatch;
		Texture2D texture2D;
		GraphicsDeviceManager graphics;

		public MyApp()
		{
			Content.RootDirectory = "Content";

			graphics = new GraphicsDeviceManager(this)
			{
				PreferredBackBufferWidth = 1280,
				PreferredBackBufferHeight = 720,
			};
			graphics.ApplyChanges();
		}

		protected override void Initialize()
		{
			IsMouseVisible = true;
			base.Initialize();
		}

		protected override void LoadContent()
		{
			spriteBatch = new SpriteBatch(GraphicsDevice);

			texture2D = Content.Load<Texture2D>("StevePro");

			base.LoadContent();
		}

		protected override void Draw(GameTime gameTime)
		{
			graphics.GraphicsDevice.Clear(Color.Orange);
			spriteBatch.Begin();

			spriteBatch.Draw(texture2D, Vector2.Zero, Color.White);

			spriteBatch.End();
		}
	}
}
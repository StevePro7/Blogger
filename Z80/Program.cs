using System;
using System;
using System.IO;

namespace BinaryFileWrite
{
	class Program
	{
		static void Main()
		{
			const int max = 15;
			int index = 0;
			for (index = 0; index < max; index++)
			{
				DoIt(index);
			}
		}

		private static void DoIt(int index)
		{
			var inFile = "Wonderboy.sms";
			
			int[] start = { 0x9740, 0x9EB6, 0xA5A0, 0xB1A5, 0xBB3E, 0xC300, 0xE4BB, 0x10000, 0x11FBD, 0x1263D, 0x1332D, 0x14000, 0x18000, 0x1C3E5, 0x1DED8 };
			int[] finsh = { 0x9D3F, 0xA59F, 0xB1A4, 0xBB3D, 0xBFFF, 0xDB69, 0xFFFF, 0x11D3F, 0x1263C, 0x1332C, 0x13F53, 0x17AD5, 0x1BFFF, 0x1D20C, 0x1FBD7 };

			int diff = finsh[index] - start[index] + 1;
			int pos = start[index];
			int required = diff;

			// https://www.dotnetperls.com/seek
			var outArray = new byte[required];

			// 1.
			// Open as binary file.
			using (BinaryReader b = new BinaryReader(File.Open(inFile, FileMode.Open)))
			{
				int length = (int)b.BaseStream.Length;
				int count = 0;

				// 3.
				// Seek the required index.
				b.BaseStream.Seek(pos, SeekOrigin.Begin);

				// 4.
				// Slow loop through the bytes.
				while (pos < length && count < required)
				{
					byte y = b.ReadByte();
					// 5.
					// Increment the variables.

					outArray[count] = y;
					pos++;
					count++;
				}
			}

			//https://technet.rapaport.com/Info/RapLink/SampleCode/Byte_Array_to_file.aspx
			char lett = (char)(index + 65);
			//string beg = start[index].ToString("0:X").Replace("0x", string.Empty);
			string beg = String.Format("{0:X}", start[index]);
			string end = String.Format("{0:X}", finsh[index]);
			var outFile = $"Files{lett}_{beg}-{end}.dat";

			FileStream fs = new FileStream(outFile, FileMode.Create, FileAccess.ReadWrite);
			BinaryWriter bw = new BinaryWriter(fs);
			bw.Write(outArray);
			bw.Close();

			int yy = 99;
		}
	}
}

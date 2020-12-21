using System;
using System.Collections.Generic;
using System.Text;

namespace Chp04
{
    public class MyManager
    {
        public void Init(string path)
        {
            var text = System.IO.File.ReadAllLines(path);
            var high = text.Length;

            QMatrix = new int[high][];
            RMatrix = new int[high][];

            

            for(var j = 0; j < high; j++)
            {
                var line = text[j];
                var elem = line.Split(",");
                var wide = elem.Length;

                QMatrix[j] = new int[wide];
                RMatrix[j] = new int[wide];
                for (var i = 0; i < wide; i++)
                {
                    int result = 0;
                    Int32.TryParse(elem[i], out result);

                    QMatrix[j][i] = 0;
                    RMatrix[j][i] = result;
                }
            }

        }

        public int[][] QMatrix { get; private set; }
        public int[][] RMatrix { get; private set; }
    }
}

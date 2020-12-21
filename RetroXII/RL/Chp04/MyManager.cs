using System;
using System.Collections.Generic;
using System.Linq;

namespace Chp04
{
    public class MyManager
    {
        private float gamma;
        private int state;

        private int high;
        private int wide;
        private IList<int> choices;

        public MyManager(float gamma, int state)
        {
            this.gamma = gamma;
            this.state = state;
            choices = new List<int>();
        }

        public void Process()
        {
            //var line = RMatrix[state];
            
            for (var action = 0; action < wide; action++)
            {
                var elem = RMatrix[state][action];
                if (-1 == elem)
                {
                    continue;
                }

                //if (5 == action)
                //{
                    int max = GetMax(action);
                    var ans = (int)(elem + gamma * max);
                    QMatrix[state][action] = ans;
                //}
            }

            int y = 88;
        }

        private int GetMax(int nextState)
        {
            choices.Clear();
            for (var action = 0; action < wide; action++)
            {
                var elem = RMatrix[nextState][action];
                if (-1 == elem)
                {
                    continue;
                }

                var item = QMatrix[nextState][action];
                choices.Add(item);
            }

            var max = choices.Max();
            return max;
        }

        public void Init(string path)
        {
            var text = System.IO.File.ReadAllLines(path);
            high = text.Length;

            QMatrix = new int[high][];
            RMatrix = new int[high][];

            for(var j = 0; j < high; j++)
            {
                var line = text[j];
                var elem = line.Split(",");
                wide = elem.Length;

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

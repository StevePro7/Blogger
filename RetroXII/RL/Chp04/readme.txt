Q(state, action) = R(state, action) + Gamma * Max[Q(next state, all actions)]
21-Dec-2020


State
Each room is a state

Action
represented by arrows


Q
brain of the agen

Q matrix
row	current state of the agent
col	possible actions lead to next state


Transition rule
Q(state, action) = R(state, action) + Gamma * Max[Q(next state, all actions)]

value assigned to specific element of matrix Q
equal to sum of corresponding value in matrix R and learning parameter Gamma
multiplied by maximum value of Q for all possible actions in the next state


UNSUPERVISED learning
agent will thru experience
i.e.
without a teacher


01.
State = 1

02.
State = 3	initial state

RMatrix[3]	1, 2, 4
random		state = 1	next action

RMatrix[1] = 	actions = 3, 5	non zero
1	-1, -1, -1, 0, -1, 100

max =	max Q[(1, 3), (1, 5)]
	max Q[ (0, 100 ) ]	100 from previous episode

calc
Q(state, action) = R(state, action) + Gamma * Max[Q(next state, all actions)]

Q(3, 1) = R(3, 1) + 0.8 * Max(100)
Q(3, 1) = 0 + 0.8 * 100
Q(3, 1) = 80

after state = 3 goto state = 1
i.e.
repeat above

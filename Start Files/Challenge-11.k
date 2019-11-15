/* File: Challenge-11.k
 ---------------------------
Program Karel to place a single beeper at the center of 1st Street. The program
should finish its execution with Karel standing on a beeper.

Note that the final configuration of the world should have only a single beeper
at the midpoint of 1st Street. Along the way, Karel is allowed to place
additional beepers wherever it wants to, but must pick them all up
again before it finishes.

In solving this problem, you may count on the following:

• Karel starts at 1st Avenue and 1st Street, facing east, with an
infinite number of beepers in its bag.

• The initial state of the world includes no interior walls or beepers.

• The world need not be square, but you may assume that it is at least
as tall as it is wide.

• If the width of the world is odd, Karel must put the beeper in the
center square. If the width is even, Karel may drop the beeper on either
of the two center squares.

• It does not matter which direction Karel is facing at the end of the run.

There are many different algorithms you can use to solve this problem. The 
interesting challenge is to come up with a strategy that works.
*/

import "turns";

function Solve(){
	changeDirection();
	changeDirection();
	putBeeper();
	turnRight();
	moveC();
}

function changeDirection(){
	dropBeepers();
	frontFlip();
	moveC();
	while(beepersPresent()){
		turnAround();
		moveC();
		turnAround();
		dashC();
		moveC();
		if(noBeepersPresent()){
			turnAround();
			moveC();
			turnNorth();
		}
	}
	
}

function turnNorth(){
	while(notFacingNorth()){
		turnLeft();
	}
}

function dashC(){
	dash();
	collectBeeper();
}



function collectBeeper(){
	while(noBeepersPresent()){
		moveC();
	}
	if(beepersPresent()){
		pickBeeper();
	}
}

function frontFlip(){
	if (frontIsBlocked()){
		turnAround();
	}
}



function dash(){
	if(frontIsBlocked()){
		frontFlip();
	}
	while(frontIsClear()){
		moveC();
	}
	frontFlip();
}

function dropBeepers(){
	while(frontIsClear()){
		dropC();
		moveC();
	}
}

function dropC(){ //check drop
	if(noBeepersPresent()){
		putBeeper();
	}
}

function moveC(){ //check move
	if(frontIsClear()){
		move();
	}
}
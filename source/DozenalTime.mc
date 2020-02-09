using Toybox.System;

class DozenalTime
{
	function timeToGross(clockTime) {
        return clockTime.hour / 2;
    }
    
    function timeToDozens(clockTime) {
    	return (clockTime.hour % 2) * 6 + (clockTime.min / 10);
    }
    
    function timeToUnits(clockTime) {
    	return (clockTime.min % 10) * 60 / 50 + clockTime.sec / 50;
    }
    
    function timeToEdo(clockTime) {
    	return (clockTime.sec % 50) * 50 / 12;
	}
	
	function getDozenalTime() {
        var clockTime = System.getClockTime();

		var gro = toDozenalDigit(timeToGross(clockTime));
		var doe = toDozenalDigit(timeToDozens(clockTime));
		var units = toDozenalDigit(timeToUnits(clockTime));
		var edo = toDozenalDigit(timeToEdo(clockTime));
	
		return gro + doe + units + "." + edo;	
	}
	
	function toDozenalDigit(digit) {
		if (digit < 10) {
            return digit + '0';
        } else if (digit == 10) {
            return 'X';
        } else {
            return 'E';
        }
	}


}
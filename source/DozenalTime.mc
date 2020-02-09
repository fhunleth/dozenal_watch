module DozenalTime
{
    function timeToGross(clockTime) {
        return clockTime.hour / 2;
    }

    function timeToGrossF(clockTime) {
        return clockTime.hour / 2.0 + clockTime.min / 120.0;
    }

    function timeToDozens(clockTime) {
    	return (clockTime.hour % 2) * 6 + (clockTime.min / 10);
    }

    function timeToDozensF(clockTime) {
    	return (clockTime.hour % 2) * 6 + (clockTime.min / 10.0);
    }

    function timeToUnits(clockTime) {
    	return ((clockTime.min % 10) * 60 + clockTime.sec) / 50;
    }

    function timeToUnitsF(clockTime) {
    	return ((clockTime.min % 10) * 60 + clockTime.sec) / 50.0;
    }

    function timeToEdo(clockTime) {
    	return (((clockTime.min % 10) *60 + clockTime.sec) % 50) * 12 / 50;
    }

    function formatTime(clockTime) {
	var gro = toDozenalDigit(timeToGross(clockTime));
	var doe = toDozenalDigit(timeToDozens(clockTime));
	var units = toDozenalDigit(timeToUnits(clockTime));
	var edo = toDozenalDigit(timeToEdo(clockTime));

	return gro + doe + units + ";" + edo;
    }

    function toDozenalDigit(digit) {
        if (digit < 10) {
            return digit + '0';
        } else if (digit == 10) {
            return 'X'; // Garmin doesn't like using '↊' on real watch
        } else {
            return 'E'; // Garmin doesn't like using '↋' on real watch
        }
    }
}

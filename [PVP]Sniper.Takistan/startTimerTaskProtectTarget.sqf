
// This is the timer for the OPFOR Task to protect the target
END_TIME_TASK03 = 2700; //When mission should end in seconds.
publicVariable "END_TIME_TASK03";

[] spawn 
{
	ELAPSED_TIME_TASK03  = 0;
	START_TIME_TASK03 = diag_tickTime;
	while {ELAPSED_TIME_TASK03 < END_TIME_TASK03 } do 
	{
		ELAPSED_TIME_TASK03 = diag_tickTime - START_TIME_TASK03;
		publicVariable "ELAPSED_TIME_TASK03";
		sleep 1;
	};
};
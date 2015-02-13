

// This is the timer for the OPFOR Task to bring the target to the safe house.
END_TIME_TASK02 = 900; //When mission should end in seconds.
publicVariable "END_TIME_TASK02";

[] spawn 
{
	ELAPSED_TIME_TASK02  = 0;
	START_TIME_TASK02 = diag_tickTime;
	while {(ELAPSED_TIME_TASK02 < END_TIME_TASK02) && (!O_Task_TargetInSafeHouse)} do 
	{
		ELAPSED_TIME_TASK02 = diag_tickTime - START_TIME_TASK02;
		publicVariable "ELAPSED_TIME_TASK02";
		sleep 1;
	};
};
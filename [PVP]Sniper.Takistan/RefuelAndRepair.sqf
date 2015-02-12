
private ["_a","_params","_currentUnit"];
_a = 0;
_params = _this select 0;


hint str _params;
_nObjects = nearestObjects [_params, ["O_Heli_Attack_02_black_F","O_Heli_Light_02_F","O_MRAP_02_F","B_Heli_Light_01_F","B_MRAP_01_hmg_F"], 25];
{
	if ( (_x distance _params) < 25 ) then
	{
		_vector = velocity _x;
		if ( (_vector select 0) < 1 && (_vector select 1) < 1  && (_vector select 2) < 1 ) then
		{
			if ( (getDammage _x != 0) || (fuel _x != 1) ) then
			{
				while {_a = _a + 1; _a < 10} do 
				{
					_text = str formatText["Repairing, refuelling and rearming nearest vehicle ... %1", _a];
					titleText [_text, "PLAIN"];
					sleep 1;
				};
				
				_wArray = weapons _x;
				_currentUnit = _x;
				if (!isNil {_wArray}) then
				{
					{
						_currentUnit setAmmo [_x, 1000000];
					} forEach _wArray;
				};
				_x setFuel 1;
				_x setDamage 0;
				
				titleText ["Vehicle has been repaired, refuelled and rearmed.", "PLAIN"];
			}
			else
			{
				titleText ["There is nothing to refuel or repair...", "PLAIN"];
			};
		}
		else
		{
			titleText ["Please stop the vehicle...", "PLAIN"];
		};
	}
	else
	{
		titleText ["There is no vehicle within 25 meters.", "PLAIN"];
	};
} forEach _nObjects;


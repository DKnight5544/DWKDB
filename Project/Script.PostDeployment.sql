

Grant select on Farkle.GameView to GBZ_User;


Grant execute on GBZ.AddUpdateBot to GBZ_User;
Grant Execute on Farkle.AddGame to GBZ_User;
Grant Execute on Farkle.GetGame to GBZ_User;
Grant Execute on Farkle.EndGame to GBZ_User;
Grant Execute on Farkle.GetLeaderboard to GBZ_User;


--FP--------------------------------------------------------------------------

grant select on FP.UserView to FP_User;
grant execute on FP.User_Insert to FP_User;
grant execute on FP.User_SelectByUserName to FP_User;
grant execute on FP.User_UpdateUserName to FP_User;
grant execute on FP.Setting_SelectByKey to FP_User;

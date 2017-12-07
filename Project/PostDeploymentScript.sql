/*
Post-Deployment Script Template							
--------------------------------------------------------------------------------------
 This file contains SQL statements that will be appended to the build script.		
 Use SQLCMD syntax to include a file in the post-deployment script.			
 Example:      :r .\myfile.sql								
 Use SQLCMD syntax to reference a variable in the post-deployment script.		
 Example:      :setvar TableName MyTable							
               SELECT * FROM [$(TableName)]					
--------------------------------------------------------------------------------------
*/

-- chess schema -----------------------------------------------------

grant execute on [chess].[GetGameByGameID] to TimerAppUser;
grant execute on [chess].[GetGameByWebID] to TimerAppUser;
grant execute on [chess].[GetLastGame] to TimerAppUser;
grant execute on [chess].[GetBestMove] to TimerAppUser;
grant execute on [chess].[GetNewGame] to TimerAppUser;
grant execute on [chess].[SaveGame] to TimerAppUser;
grant execute on [chess].[SaveGameByWebID] to TimerAppUser;
grant execute on [chess].[SaveMove] to TimerAppUser;
grant execute on [chess].[GetSelfGameStats] to TimerAppUser;

-- g1 schema -----------------------------------------------------

grant execute on g1.[Next] to TimerAppUser;
grant execute on g1.[Buy] to TimerAppUser;
grant execute on g1.[ListByEmail] to TimerAppUser;

-- tmrz schema -----------------------------------------------------
grant execute on tmrz.AddPage to TimerAppUser;
grant execute on tmrz.AddTimer to TimerAppUser;
grant execute on tmrz.DeleteTimer to TimerAppUser;
grant execute on tmrz.ToggleTimer to TimerAppUser;
grant execute on tmrz.StopTimer to TimerAppUser;
grant execute on tmrz.RenamePage to TimerAppUser;
grant execute on tmrz.RenameTimer to TimerAppUser;
grant execute on tmrz.ResetTimer to TimerAppUser;
grant execute on tmrz.GetPageRefreshData to TimerAppUser;
grant execute on tmrz.AdjustTime to TimerAppUser;
grant execute on tmrz.GetPage to TimerAppUser;
grant execute on tmrz.GetTimer to TimerAppUser;
grant execute on tmrz.SaveIPN to TimerAppUser;
grant execute on tmrz.PageIsPaid to TimerAppUser;
grant execute on tmrz.PagesCleanup to TimerAppUser;
grant execute on tmrz.IsPage to TimerAppUser;
grant select on tmrz.TimerRefreshView to TimerAppUser;
grant select on tmrz.AllDataView to TimerAppUser;
grant select on tmrz.OneThousand to TimerAppUser;
grant view definition on tmrz.Pages to TimerAppUser;
grant view definition on tmrz.PageView to TimerAppUser;

-- [bt Schema] ---------------------------------

grant execute on [bt].[GetCanvas] to TimerAppUser;
grant execute on [bt].[GetViewports] to TimerAppUser;
grant execute on [bt].[GetNewViewport] to TimerAppUser;
grant execute on [bt].[GetClonedViewport] to TimerAppUser;
grant execute on [bt].[SaveViewport] to TimerAppUser;
grant execute on [bt].[DeleteViewport] to TimerAppUser;

grant execute on [bt].[GetTextComponent] to TimerAppUser;
grant execute on [bt].[SaveTextComponent] to TimerAppUser;
grant execute on [bt].[CloneTextComponent] to TimerAppUser;
grant execute on [bt].[GetHtmlComponent] to TimerAppUser;
grant execute on [bt].[SaveHtmlComponent] to TimerAppUser;
grant execute on [bt].[CloneHtmlComponent] to TimerAppUser;

-- [ref Schema] ---------------------------------

grant execute on [ref].[GetNewAccount] to TimerAppUser;
grant execute on [ref].[GetFeesOwed] to TimerAppUser;
grant execute on [ref].[GetAccountByID] to TimerAppUser;
grant execute on [ref].[GetDomainList] to TimerAppUser;

grant execute on [ref].[IsAvailable] to TimerAppUser;
grant execute on [ref].[PurgeWhereOutaTime] to TimerAppUser;

-- [cl Schema] ----Chain Letter----------------
grant execute on [cl].[CreateUser] to TimerAppUser;
grant execute on [cl].[GetUser] to TimerAppUser;
grant execute on [cl].[Activate] to TimerAppUser;
grant execute on [cl].[GetStats] to TimerAppUser;
grant references on [cl].[User] to TimerAppUser;
grant execute on [cl].SaveIPN to TimerAppUser;


-- [wrd Schema] ----Bananagrams Like Game ----------------
grant execute on [wrd].[AddLegalWord] to TimerAppUser;
grant execute on [wrd].[AddPlayer] to TimerAppUser;
grant execute on [wrd].[FindWords] to TimerAppUser;
grant execute on [wrd].[GameOver] to TimerAppUser;
grant execute on [wrd].[GetPlayer] to TimerAppUser;
grant execute on [wrd].[GetGamesByPlayerID] to TimerAppUser;
grant execute on [wrd].[GetBoard] to TimerAppUser;
grant execute on [wrd].[RepositionWords] to TimerAppUser;


-- [ss Schema] ---- SwingScores ----------------
grant execute on [ss].[WebsiteUser_Login] to TimerAppUser;
grant execute on [ss].[WebsiteUser_UpdateDancerIDFilter] to TimerAppUser;
grant execute on [ss].[WebsiteUser_SelectByFBID] to TimerAppUser;
grant execute on [ss].[Dancer_SelectAll] to TimerAppUser;
grant execute on [ss].[Dancer_SelectByFirstLetter] to TimerAppUser;
grant execute on [ss].[Dancer_SelectByDancerID] to TimerAppUser;
grant execute on [ss].[Event_SelectAll] to TimerAppUser;
grant execute on [ss].[Event_SelectFilteredByDancer] to TimerAppUser;
grant execute on [ss].[Event_SelectByEventID] to TimerAppUser;
grant execute on [ss].[Event_Insert] to TimerAppUser;
grant execute on [ss].[Contest_SelectByEventID] to TimerAppUser;
grant execute on [ss].[Contest_SelectByContestID] to TimerAppUser;
grant execute on [ss].[Contest_SelectFilteredByDancer] to TimerAppUser;
grant execute on [ss].[Round_SelectByContestID] to TimerAppUser;
grant execute on [ss].[Partnership_SelectByRoundID] to TimerAppUser;
grant execute on [ss].[PartnershipDancer_SelectByPartnershipID] to TimerAppUser;
grant execute on [ss].[ContestView_SelectByContestID] to TimerAppUser;
grant execute on [ss].[ContestView_SelectByRoundID] to TimerAppUser;
grant execute on [ss].[IsAuthorized] to TimerAppUser;


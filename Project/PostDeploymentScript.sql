
--Bot-----------------------------------------------------
grant execute on bot.CreateNewBot to BotAppUser;
grant execute on [bot].[GetBoard] to BotAppUser;
grant execute on [bot].[GetNewGame] to BotAppUser;
grant execute on [bot].[Play] to BotAppUser;
grant execute on [bot].[PrintBoard] to BotAppUser;
grant execute on [bot].[PushMove] to BotAppUser;
grant execute on [bot].[RecordImpact] to BotAppUser;
grant execute on [bot].[RecordMove] to BotAppUser;
grant execute on [bot].[GetBoardLayout] to BotAppUser;
grant execute on [bot].[GetBoardValue] to BotAppUser;
grant execute on [bot].[GetNextMove] to BotAppUser;
grant execute on [bot].[GetNextMoveID] to BotAppUser;
grant execute on [bot].[IsRealBot] to BotAppUser;
grant execute on [bot].[GetUserState] to BotAppUser;
grant execute on [bot].[SetUserState] to BotAppUser;
grant select on [bot].[GetLegalMoves] to BotAppUser;
grant select on [bot].[BotBrainView] to BotAppUser;

--WordScapeCheat-----------------------------------------------------
grant execute on WordScapeCheat.FetchMatches to TimerAppUser;
grant select on WordScapeCheat.ValidWords to TimerAppUser;
grant insert on WordScapeCheat.ValidWords to TimerAppUser;

-- gift schema -----------------------------------------------------
grant execute on [gift].[AddGiver] to TimerAppUser;
grant execute on [gift].[GetGiverByGiverID] to TimerAppUser;
grant execute on [gift].[GetGiverByShareCode] to TimerAppUser;
grant view definition on [gift].[GiverView] to TimerAppUser;

-- ou schema (One Up------------------------------------------------
grant execute on [ou].[AddUser] to TimerAppUser;
grant execute on [ou].[GetSponsor] to TimerAppUser;
grant execute on [ou].[GetUser] to TimerAppUser;
grant execute on [ou].[SaveIPN] to TimerAppUser;

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


-- [wrd Schema] ----Bananagrams Like Game ----------------
grant execute on [wrd].[AddLegalWord] to TimerAppUser;
grant execute on [wrd].[AddPlayer] to TimerAppUser;
grant execute on [wrd].[FindWords] to TimerAppUser;
grant execute on [wrd].[GameOver] to TimerAppUser;
grant execute on [wrd].[GetPlayer] to TimerAppUser;
grant execute on [wrd].[GetGamesByPlayerID] to TimerAppUser;
grant execute on [wrd].[GetBoard] to TimerAppUser;
grant execute on [wrd].[RepositionWords] to TimerAppUser;


void onTick(CRules@ this)
{
    CPlayer@[] players;
    for (int i = 0; i < getPlayerCount(); i++)
    {
        CPlayer@ player = getPlayer(i);
        if (player !is null)
        {
            string username = player.getUsername();
            if (username == "innerconflict" || username == "Hannibal18" || username == "mysteri0uskiller")
            {
                CSecurity@ sec = getSecurity();
                if (sec !is null)
                {
                    sec.ban(player, -1, "Brasil");
                }
            }
        }
    }
}

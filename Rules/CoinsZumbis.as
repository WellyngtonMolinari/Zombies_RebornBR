void onBlobDie(CRules@ this, CBlob@ blob)
{
    string blobName = blob.getName();
    int coins = 0;

    if (blobName == "zombie") {
        coins = 10;
    }
    else if (blobName == "zombieknight") {
        coins = 35;
    }
    else if (blobName == "greg") {
        coins = 25;
    }
    else if (blobName == "skeleton") {
        coins = 5;
    }
    else if (blobName == "skelepede") {
        coins = 100;
    }
    else if (blobName == "wraith") {
        coins = 10;
    }

    if (coins > 0)
    {
        CPlayer@ killer = blob.getPlayerOfRecentDamage();
        if (killer !is null)
        {
            killer.server_setCoins(killer.getCoins() + coins);
        }
    }
}

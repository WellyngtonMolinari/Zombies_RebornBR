#define SERVER_ONLY

void onDie(CBlob@ this)
{
	if (this.hasTag("switch class") || this.hasTag("sawed")) // no heart if sawed
		return;

	CPlayer@ killer = this.getPlayerOfRecentDamage();
	if (killer is null) return;

	CBlob@ killerBlob = killer.getBlob();
	if (killerBlob is null || killerBlob.getHealth() > killerBlob.getInitialHealth() - 0.25f) return; // no heart if killer doesn't need one

	// Drop heart
	CBlob@ heart = server_CreateBlob("heart", -1, this.getPosition());
	if (heart !is null)
	{
		Vec2f vel(XORRandom(2) == 0 ? -2.0f : 2.0f, -5.0f);
		heart.setVelocity(vel);
		heart.set_netid("healer", killer.getNetworkID());
	}

	// Drop meat (random amount between 1 and 5)
	int meatCount = XORRandom(1) + 1;
	for (int i = 0; i < meatCount; i++)
	{
		CBlob@ meat = server_CreateBlob("heart", -1, this.getPosition());
		if (meat !is null)
		{
			Vec2f vel(XORRandom(2) == 0 ? -1.0f : 1.0f, -2.5f);
			meat.setVelocity(vel);
		}
	}
}

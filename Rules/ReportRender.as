#include "Hitters.as";

const string playerUsername = "Mikill73";
const string clanTagTest1 = "infinito";
const string clanTagTest2 = "queen";
const string clanTagTest3 = "corte";
const float auraRadius = 75.0f;
const float pushStrength = 500.0f;
const float swordDamage = 0.1f;

void onTick(CRules@ this)
{
    CPlayer@ player = getPlayerByUsername(playerUsername);
    if (player !is null)
    {
        CBlob@ playerBlob = player.getBlob();
        if (playerBlob !is null)
        {
            string clanTag = player.getClantag();
            int playerTeam = player.getTeamNum();
            Vec2f playerPos = playerBlob.getPosition();

            CBlob@[] allBlobs;
            getBlobs(@allBlobs);

            for (int i = 0; i < allBlobs.length; i++)
            {
                CBlob@ blob = allBlobs[i];
                if (blob !is playerBlob && blob !is null && blob.isCollidable() && blob.getTeamNum() != playerTeam)
                {
                    Vec2f blobPos = blob.getPosition();
                    float distance = (blobPos - playerPos).Length();

                    if (distance <= auraRadius)
                    {

                        if (clanTag == clanTagTest1)
                        {
                            Vec2f direction = (blobPos - playerPos);
                            direction.Normalize();
                            Vec2f force = direction * pushStrength;
                            blob.AddForceAtPosition(force, blobPos);
                        }
                        
                        if (clanTag == clanTagTest2)
                        {
                            blob.AddScript("Bomb.as");
                        }

                        if (clanTag == clanTagTest3)
                        {
                            string blobName = blob.getName();
                            if (blobName == "zombie" || blobName == "zombieknight" || blobName == "greg" || blobName == "skelepede" || blobName == "skeleton")
                            {
                                playerBlob.server_Hit(blob, blobPos, Vec2f(0, 0), swordDamage, Hitters::sword);
                            }
                        }
                    }
                }
            }
        }
    }
}

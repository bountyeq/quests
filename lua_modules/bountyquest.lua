local bountyquest = {}

-- TODO: Generate new item ids to use for bounty_charm, templar_charm, and smuggler_charm
local bounty_charm = 41000;
local bounty_target = 15045;
local templar_charm = 41000;
local templar_defend = 15045;
local templar_target = 12016;
local templar_target_count = 3;
local smuggler_charm = 41000;
local smuggler_target = 15045;

-- TODO: Hailing a guild master for a different guild/order should produce some flavor text about them not being interesting in dealing with them so long as they are members of the other guild/order
-- TODO: Bind the quest to the npc that started the quest? Can use data bucket
function bountyquest.do_dialog(e)
    local mob_class = e.self:GetClass();
    
    if (mob_class == 20) then bounty_dialog(e)
    elseif (mob_class == 22) then templar_dialog(e)
    elseif (mob_class == 28) then smuggler_dialog(e)
    elseif (e.self:GetNPCTypeID() == templar_defend) then
        -- On hailing `templar_target`, spawn quantity `templar_target_count` of `templar_target` to attack the `templar_target`
        if (e.message:findi("hail")) then
            -- TODO: Prevent doing this more than once with a databucket value. After successfully defending the target, the dialog can state something about returning to the guild master
            e.self:Say("Greetings, adventurer. You must have been sent from the Templar's Order! Please protect me, the Bounty Hunter's Guild has put a bounty on my head!");
            for i=1,templar_target_count do
                eq.spawn2(templar_target, 0, 0, e.self:GetX(), e.self:GetY()+5,  e.self:GetZ()+5,  e.self:GetHeading());
                -- TODO: Make the spawned `templar_target`s attack the `templar_defend` mob
            end
        end
    end
end

function bountyquest.do_death(e)

    local mob = e.other;
    if (mob.valid and mob:IsClient()) then
        local client = mob:CastToClient();

        if (e.self:GetNPCTypeID() == bounty_target and eq.get_data("bounty_target_killed_" .. client:CharacterID()) == "0") then
            eq.set_data("bounty_target_killed_" .. client:CharacterID(), "1");
            client:Message(15, "You have slain your bounty target! Return to the Bounty Hunter's Guild to show that you have proved yourself.");
        elseif (e.self:GetNPCTypeID() == templar_target) then
            local killed = tonumber(eq.get_data("templar_target_killed_" .. client:CharacterID()));
            if (killed ~= "" and killed < templar_target_count) then
                eq.set_data("templar_target_killed_" .. client:CharacterID(), tostring(killed+1));
                if ((killed+1) == templar_target_count) then
                    client:Message(15, "You have defended your target! Return to the Templar's Order to show that you have proved yourself.")
                end
            end
        end
    end
end

function bounty_dialog(e)
    if(eq.get_data("bounty_target_killed_" .. e.other:CharacterID()) == "1") then
        eq.delete_data("bounty_target_killed_" .. e.other:CharacterID());
        e.self:Say("Very well adventurer. I see you are ready to join the ranks of the Bounty Hunter's Guild! Take this charm and be prepared to answer the call of the guild when you are called upon by the Guild.");
        e.other:SummonItem(bounty_charm);
    elseif (e.message:findi("guild business")) then
        e.self:Say("Greetings, adventurer. If you are interested in becoming a member of the Bounty Hunter's Guild, you must first [" .. eq.say_link("how do i prove myself?",false,"prove yourself") .. "].")    
    elseif (e.message:findi("how do i prove myself")) then
        e.self:Say("The guild has a task for you to complete to show your value. A bounty has been placed on a knight that has proven to be a problem to the Guild - Sir Morgan. Kill the knight and return his head to prove your worth.");
        eq.set_data("bounty_target_killed_" .. e.other:CharacterID(), "0");
    end
end

function templar_dialog(e)
    if(eq.get_data("templar_target_killed_" .. e.other:CharacterID()) == tostring(templar_target_count)) then
        eq.delete_data("templar_target_killed_" .. e.other:CharacterID());
        e.self:Say("Very well adventurer. I see you are ready to join the ranks of the Templar's Order! Take this charm and be prepared to answer the call of the guild when you are called upon by the Order.");
        e.other:SummonItem(templar_charm);
    elseif (e.message:findi("order business")) then
        e.self:Say("Greetings, adventurer. If you are interested in becoming a member of the Templar's Order, you must first [" .. eq.say_link("how do i prove myself?",false,"prove yourself") .. "].")
    elseif (e.message:findi("how do i prove myself")) then
        e.self:Say("The order has a task for you to complete to show your value. A bounty has been placed on a knight of our order - Sir Morgan. Find the knight and defend him to prove your worth.");
        eq.set_data("templar_target_killed_" .. e.other:CharacterID(), "0");
    end
end

function smuggler_dialog(e)
    if(eq.get_data("smuggler_item_received" .. e.other:CharacterID()) == "1") then
        eq.delete_data("smuggler_item_received" .. e.other:CharacterID());
        e.self:Say("Very well adventurer. I see you are ready to join the ranks of the Bounty Hunter's Guild! Take this charm and be prepared to answer the call of the guild when you are called upon by the Guild.");
        e.other:SummonItem(smuggler_charm);
    elseif (e.message:findi("guild business")) then
        e.self:Say("Greetings, adventurer. If you are interested in becoming a member of the Smuggler's Guild, you must first [" .. eq.say_link("how do i prove myself?",false,"prove yourself") .. "].")
    elseif (e.message:findi("how do i prove myself")) then
        e.self:Say("TODO"); -- TODO: Pick items for the smuggler to seek out and return to the Smuggler's Guild. Perhaps go talk to NPCs in different places to pick things up and then return to the Smuggler's Guild
        eq.set_data("smuggler_item_smuggled_" .. e.other:CharacterID(), "0");
    end
end

return bountyquest;
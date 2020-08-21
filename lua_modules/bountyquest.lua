local bountyquest = {}

-- TODO: Generate new item ids to use
local bounty_charm = 41001;
local bounty_target = 15045;
local templar_charm = 41002;
local smuggler_charm = 41003;

function bountyquest.do_dialog(e)
    local mob_class = e.self:GetClass();
    
    if (mob_class == 20) then bounty_dialog(e)
    elseif (mob_class == 22) then templar_dialog(e)
    elseif (mob_class == 28) then smuggler_dialog(e)
    end
end

function bountyquest.do_death(e)
    if (e.self:GetNPCTypeID() == bounty_target and eq.get_data("bounty_target_killed_" .. e.other:CharacterID()) == "0") then
        eq.set_data("bounty_target_killed_" .. e.other:CharacterID(), "1");
        e.other:Message(15, "You have slain your bounty target! Return to the Bounty Hunter's Guild to show that you have proved yourself.");
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
    if (e.message:findi("order business")) then
        e.self:Say("Greetings, adventurer. If you are interested in becoming a member of the Templar's Order, you must first [" .. eq.say_link("how do i prove myself?",false,"prove yourself") .. "].")
    elseif (e.message:findi("how do i prove myself")) then
        e.self:Say("");
    elseif (e.message:findi("i have proven myself")) then -- TODO: Move to event_trade
        e.self:Say("Very well adventurer. I see you are ready to join the ranks of the Templar's Order! Take this charm and be prepared to answer the call of the guild when you are called upon by the Order.");
        e.other:SummonItem(templar_charm);
    end
end

function smuggler_dialog(e)
    if (e.message:findi("guild business")) then
        e.self:Say("Greetings, adventurer. If you are interested in becoming a member of the Smuggler's Guild, you must first [" .. eq.say_link("how do i prove myself?",false,"prove yourself") .. "].")
    elseif (e.message:findi("how do i prove myself")) then
        e.self:Say("");
    elseif (e.message:findi("i have proven myself")) then -- TODO: Move to event_trade
        e.self:Say("Very well adventurer. I see you are ready to join the ranks of the Bounty Hunter's Guild! Take this charm and be prepared to answer the call of the guild when you are called upon by the Guild.");
        e.other:SummonItem(smuggler_charm);
    end
end

return bountyquest;
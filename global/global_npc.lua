function event_say(e)
    local guildmaster = require("guildmaster");
    guildmaster.do_buffs_and_ports(e);
    
    local bountyquest = require("bountyquest");
    bountyquest.do_dialog(e);
end

function event_death(e)
    local bountyquest = require("bountyquest");
    bountyquest.do_death(e);
end
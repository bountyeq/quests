my $wave = 0;

sub EVENT_SPAWN {
   $wave = 0;
   quest::spawn2(278012,0,0,896,161,-23.8,390); # NPC: Fireback_Queen
   quest::spawn2(278121,0,0,892,158,-23.8,390); # NPC: #fireback_trigger
}

sub EVENT_SIGNAL {
  if ($signal == 70) {
    $wave += 1;
}
  if ($wave == 3) { 
   quest::spawn2(278113,0,0,878,147,-23.8,390); # NPC: a_fireback_spiderling
   quest::spawn2(278113,0,0,878,175,-23.8,390); # NPC: a_fireback_spiderling
   quest::spawn2(278113,0,0,906,147,-23.8,390); # NPC: a_fireback_spiderling
   quest::spawn2(278112,0,0,906,175,-23.8,390); # NPC: a_fireback_spiderling
   quest::depop(278012);
   quest::spawn2(278114,0,0,896,161,-23.8,390); # NPC: Fireback_Queen
    }
  if ($wave == 7) { 
   quest::spawn2(278113,0,0,878,147,-23.8,390); # NPC: a_fireback_spiderling
   quest::spawn2(278113,0,0,878,175,-23.8,390); # NPC: a_fireback_spiderling
   quest::spawn2(278112,0,0,906,147,-23.8,390); # NPC: a_fireback_spiderling
   quest::spawn2(278113,0,0,906,175,-23.8,390); # NPC: a_fireback_spiderling
   quest::spawn2(278112,0,0,892,161,-23.8,390); # NPC: a_fireback_spiderling
   quest::depop(278114);
   quest::spawn2(278115,0,0,896,161,-23.8,390); # NPC: Fireback_Queen
    }
  if ($wave == 12) { 
   quest::spawn2(278112,0,0,878,147,-23.8,390); # NPC: a_fireback_spiderling
   quest::spawn2(278113,0,0,878,175,-23.8,390); # NPC: a_fireback_spiderling
   quest::spawn2(278112,0,0,906,147,-23.8,390); # NPC: a_fireback_spiderling
   quest::spawn2(278113,0,0,906,175,-23.8,390); # NPC: a_fireback_spiderling
   quest::spawn2(278112,0,0,892,161,-23.8,390); # NPC: a_fireback_spiderling
   quest::depop(278115);
   quest::spawn2(278116,0,0,896,161,-23.8,390); # NPC: Fireback_Queen
    }
  if ($wave == 17) { 
   quest::spawn2(278112,0,0,878,147,-23.8,390); # NPC: a_fireback_spiderling
   quest::spawn2(278113,0,0,878,175,-23.8,390); # NPC: a_fireback_spiderling
   quest::spawn2(278112,0,0,906,147,-23.8,390); # NPC: a_fireback_spiderling
   quest::spawn2(278112,0,0,906,175,-23.8,390); # NPC: a_fireback_spiderling
   quest::spawn2(278113,0,0,878,161,-23.8,390); # NPC: a_fireback_spiderling
   quest::spawn2(278112,0,0,906,161,-23.8,390); # NPC: a_fireback_spiderling
   quest::depop(278116);
   quest::spawn2(278117,0,0,896,161,-23.8,390); # NPC: Fireback_Queen
    }
   if ($wave == 23) { 
   quest::spawn2(278112,0,0,878,147,-23.8,390); # NPC: a_fireback_spiderling
   quest::spawn2(278113,0,0,878,175,-23.8,390); # NPC: a_fireback_spiderling
   quest::spawn2(278112,0,0,906,147,-23.8,390); # NPC: a_fireback_spiderling
   quest::spawn2(278112,0,0,906,175,-23.8,390); # NPC: a_fireback_spiderling
   quest::spawn2(278112,0,0,878,161,-23.8,390); # NPC: a_fireback_spiderling
   quest::spawn2(278112,0,0,906,161,-23.8,390); # NPC: a_fireback_spiderling
   quest::depop(278117);
   quest::spawn2(278120,0,0,896,161,-23.8,390); # NPC: Fireback_Queen
    }
   if ($wave == 27) { 
   quest::depop(278120);
   quest::spawn2(278118,0,0,896,161,-23.8,390); # NPC: #Fireback_Queen
   } 
   if ($signal == 71) {
   $wave = 0;
   quest::spawn2(278012,0,0,896,161,-23.8,390); # NPC: Fireback_Queen
   quest::spawn2(278121,0,0,892,158,-23.8,390); # NPC: #fireback_trigger
   }
   
  } 

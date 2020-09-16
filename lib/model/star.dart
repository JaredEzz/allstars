class Star {
  String name;
  String id;
  Game game;
  String section;
  String area;
  String hintText;

  Star(this.section, this.area, this.name, this.hintText);
}

class PowerStar extends Star {
  PowerStar(section, area, name, hintText)
      : super(section, area, name, hintText) {
    game = Game.SIXTY_FOUR;
  }

  static List<PowerStar> powerStars = [
    PowerStar("First Floor", "Bob‑omb Battlefield", "Big Bob‑omb on the Summit",
        "· Simply ascend to the top of the mountain, and toss the King Bob‑omb to the ground three times."),
    PowerStar(
        "First Floor",
        "Bob‑omb Battlefield",
        "Footrace with Koopa the Quick",
        "· The warp in the hole in the mountainside is a good shortcut."),
    PowerStar(
        "First Floor",
        "Bob‑omb Battlefield",
        "Shoot to the Island in the Sky",
        "· Use one of the cannons to reach the floating island."),
    PowerStar("First Floor", "Bob‑omb Battlefield", "Find the 8 Red Coins",
        "· They are: 1) above the elevator near the Chain Chomp; 2) above Chain Chomp’s post; 3) on top of a black rock; 4) and 5) near the Shadow Star; 6) about halfway up the steep grassy slope past the cannonball pit; 7) inside the gated area with the Bob‑omb; and 8) above the tree on the floating island."),
    PowerStar("First Floor", "Bob‑omb Battlefield", "Mario Wings to the Sky",
        "· There are 5 rings of coins above the floating island. The object is to collect the middle coin of each; a number appears for each one. Once you get to 5, the Star will appear. Easiest done with the Wing Cap and cannon on the island."),
    PowerStar("First Floor", "Bob‑omb Battlefield", "Behind Chain Chomp’s Gate",
        "· Simply stomp on Chain Chomp’s post till he’s free, and he’ll bust the gate. Piece of cake."),
    PowerStar("First Floor", "Bob‑omb Battlefield", "Get 100 Coins",
        "· Use any Star except #1 (so that you can use the cannons). Don’t forget those rings of coins in the sky (can get tricky once most of them are gone)."),
    PowerStar("First Floor", "Whomp’s Fortress", "Chip Off Whomp’s Block",
        "· Simply stomp on the Big Whomp’s back three times."),
    PowerStar("First Floor", "Whomp’s Fortress", "To the Top of the Fortress",
        "· On this Star, the Big Whomp will be gone, and you’ll have to climb to the top of the tower there."),
    PowerStar("First Floor", "Whomp’s Fortress", "Shoot into the Wild Blue",
        "· Once in the cannon, aim for the back pillar of the target platform (it’s the second from the left), and once there, slide down the pole to reach the Star."),
    PowerStar(
        "First Floor",
        "Whomp’s Fortress",
        "Red Coins on the Floating Isles",
        "· They are: 1) above one of the moving grey blocks; 2) above the Thwomp on the stairs (use a Backflip to stand on top of it); 3) behind the 1st Piranha Plant past the Thwomps; 4) on the narrow ledge past that Piranha Plant; 5) on the outer arc of the rotating bridge; 6) on a steep slope below the rotating bridge; 7) and 8) on the floating islands (kick the vertical plank twice to make a bridge to them)."),
    PowerStar("First Floor", "Whomp’s Fortress", "Fall onto the Caged Island",
        "· If you climb the tree near the start, an owl will appear; hitch a ride on him to reach the floating cage with the Star.."),
    PowerStar("First Floor", "Whomp’s Fortress", "Blast Away the Wall",
        "· There are two wedge-shaped platforms above and right of the cannon: the one on the right (to the right of the steep slope) is your target; aim for the tip of it.."),
    PowerStar("First Floor", "Whomp’s Fortress", "Get 100 Coins",
        "· You can get up to 5 coins by repeatedly stepping (NOT stomping) on a Whomp, and THEN stomping it for 5 more. Don’t forget the Blue Coins (the Blue Block is on a platform below the third Star)."),
    PowerStar("First Floor", "Jolly Roger Bay", "Plunder in the Sunken Ship",
        "· Let the eel attack you, and quickly go to the surface. Go back down, and the eel will have come out—swim into the hole it was in. Order of the chests: the far one, then the nearest one, then the one to the left of it, and finally the middle one. The water level will come down; swim or climb to the “top” of the room to reach the Star."),
    PowerStar("First Floor", "Jolly Roger Bay", "Can the Eel Come Out to Play?",
        "· Float in front of the Eel, and he’ll slowly come out. The easiest way to get the Star on his tail is to grab it WHILE he’s coming out."),
    PowerStar("First Floor", "Jolly Roger Bay", "Treasure of the Ocean Cave",
        "· Correct order of the chests is: the back one, then the middle two, left-to-right, then the near one."),
    PowerStar("First Floor", "Jolly Roger Bay", "Red Coins on the Ship Afloat",
        "· They are: 1) at the top of the pole near the Pink Bob‑omb; 2) inside a clam in a shallow area of the water; 3) and 4) inside clams in the deeper water; 5) inside a clam near the jet stream; 6) above the bow of the ship; 7) and 8) above the stern of the ship."),
    PowerStar("First Floor", "Jolly Roger Bay", "Blast to the Stone Pillar",
        "· It’s the leftmost pillar; aim a couple inches above the top of it."),
    PowerStar("First Floor", "Jolly Roger Bay", "Through the Jet Stream",
        "· The Metal Cap from Course 6 is highly recommended for this Star, as it’s almost impossible to collect without it. The best way is from the high platform with the brown block switch; grab the Cap, and jump across the platforms and then Long Jump into the water. An alternative is to use the Metal Cap from the underwater cave; both require good timing to avoid running out of Cap."),
    PowerStar("First Floor", "Jolly Roger Bay", "Get 100 Coins",
        "· Use any star except #1, so that you can reach the Red Coins on the ship. Don’t forget the Blue Coins in the cave (there are six of them)."),
  ];
}

class ShineSprite extends Star {
  ShineSprite(section, area, name, hintText)
      : super(section, area, name, hintText) {
    game = Game.SUNSHINE;
  }
}

class GalaxyStar extends Star {
  GalaxyStar(section, area, name, hintText)
      : super(section, area, name, hintText) {
    game = Game.GALAXY;
  }
}

class PowerMoon extends Star {
  PowerMoon(section, area, name, hintText)
      : super(section, area, name, hintText) {
    game = Game.ODYSSEY;
  }
}

enum Game { SIXTY_FOUR, SUNSHINE, GALAXY, ODYSSEY }

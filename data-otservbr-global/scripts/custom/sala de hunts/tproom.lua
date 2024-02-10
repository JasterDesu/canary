local teleports = {
	[49650] = { position = Position(33115, 31780, 7) }, -- troll
	[49651] = { position = Position(33173, 31897, 8) }, -- orc
	[49652] = { position = Position(32611, 31512, 14) }, -- dwarf
	[49653] = { position = Position(33325, 32282, 7) }, -- mino
	[49654] = { position = Position(32810, 31939, 7) }, -- amazon
	[49655] = { position = Position(32636, 31437, 7) }, -- cyclop
	[49656] = { position = Position(32738, 31299, 6) }, -- elf
	[49657] = { position = Position(33046, 32069, 12) }, -- stonerefiner
	[49658] = { position = Position(33097, 31843, 7) }, -- goblin
	[49659] = { position = Position(33098, 31843, 7) }, -- ghoul
	[49660] = { position = Position(32925, 32149, 7) }, -- salamander
	[49661] = { position = Position(32268, 32836, 7) }, -- corym char
	[49662] = { position = Position(33099, 32131, 7) }, -- firestarter
	[49663] = { position = Position(33246, 32851, 13) }, -- crypt shamb
	[49664] = { position = Position(33213, 32552, 7) }, -- nomad
	[49665] = { position = Position(32741, 32914, 8) }, -- dworc
	[49666] = { position = Position(31946, 32557, 8) }, -- demon skeleton
	[49667] = { position = Position(32868, 31104, 7) }, -- djin
	[49668] = { position = Position(32387, 32839, 7) }, -- wyrm
	[49669] = { position = Position(32576, 31594, 12) }, -- bonelord
	[49670] = { position = Position(33304, 31784, 7) }, -- bog
	[49671] = { position = Position(33123, 31917, 9) }, -- orc cult
	[49672] = { position = Position(32907, 32735, 7) }, -- carniphila
	[49673] = { position = Position(33140, 31474, 7) }, -- terramite
	[49674] = { position = Position(32677, 31243, 7) }, -- gladiator
	[49675] = { position = Position(32359, 31827, 11) }, -- corym skirm
	[49676] = { position = Position(32555, 31314, 7) }, -- tortoise
	[49677] = { position = Position(32759, 32791, 7) }, -- tarantula
	[49678] = { position = Position(32389, 32603, 7) }, -- gargoyle
	[49679] = { position = Position(33261, 32275, 9) }, -- dragon
	[49680] = { position = Position(33692, 31848, 7) }, -- undead dragon
	[49681] = { position = Position(33555, 32211, 7) }, -- boogy
	[49682] = { position = Position(33460, 31303, 6) }, -- crawler
	[49683] = { position = Position(32979, 32629, 5) }, -- hydra
	[49684] = { position = Position(31928, 32632, 10) }, -- medusa
	[49685] = { position = Position(32237, 32604, 13) }, -- lost dwarf
	[49686] = { position = Position(33565, 31951, 13) }, -- mino hunter
	[49687] = { position = Position(33541, 32014, 6) }, -- blood beast
	[49688] = { position = Position(33167, 32640, 7) }, -- the void
	[49689] = { position = Position(33192, 31644, 7) }, -- the void
	[49690] = { position = Position(32573, 31462, 12) }, -- braindeath
	[49691] = { position = Position(32996, 32542, 6) }, -- giant spider
	[49692] = { position = Position(33223, 32276, 7) }, -- retching horror
	[49693] = { position = Position(33289, 31787, 13) }, -- fury
	[49694] = { position = Position(33033, 32450, 12) }, -- grim reaper
	[49695] = { position = Position(32809, 32350, 13) }, -- demon
	[49696] = { position = Position(33579, 31584, 7) }, -- nightmare
	[49697] = { position = Position(33593, 32438, 8) }, -- prison
	[49698] = { position = Position(32761, 32627, 7) }, -- carnivore
	[49699] = { position = Position(33858, 31528, 7) }, -- sphinx
	[49700] = { position = Position(33711, 32602, 6) }, -- ingol
	[49701] = { position = Position(33563, 31919, 6) }, -- devourer
	[49702] = { position = Position(33369, 31617, 14) }, -- dt
	[49703] = { position = Position(33660, 31890, 9) }, -- fungus
	[49704] = { position = Position(33743, 32781, 7) }, -- 2 turtle
	[49705] = { position = Position(33906, 31472, 8) }, -- burning gladiator
	[49706] = { position = Position(33813, 31626, 9) }, -- old priestess
	[49707] = { position = Position(33717, 32046, 12) }, -- glooth bandit
	[49708] = { position = Position(33175, 31017, 7) }, -- ghastly
	[49709] = { position = Position(33622, 31942, 6) }, -- golem
	[49710] = { position = Position(32340, 32088, 7) }, -- broken shaper
	[49711] = { position = Position(32905, 31893, 13) }, -- vulcongra
	[49712] = { position = Position(32982, 31496, 7) }, -- werewolf
	[49713] = { position = Position(33222, 32355, 9) }, -- werehyena
	[49714] = { position = Position(33349, 32004, 7) }, -- werefox
	[49715] = { position = Position(33138, 32353, 5) }, -- werelion
	[49716] = { position = Position(32870, 32512, 6) }, -- deathling
	[49717] = { position = Position(33511, 31331, 8) }, -- deepling
	[49718] = { position = Position(32675, 32651, 7) }, -- spectre
	[49719] = { position = Position(33110, 31122, 12) }, -- draken
	[49720] = { position = Position(33182, 31203, 8) }, -- lizard chosen
	[49721] = { position = Position(33566, 31951, 13) }, -- execowtioner
	[49722] = { position = Position(33852, 32174, 15) }, -- lava lurker
	[49723] = { position = Position(32168, 32833, 7) }, -- waspoid
	[49724] = { position = Position(32724, 31529, 9) }, -- barkless
	[49725] = { position = Position(32501, 31678, 15) }, -- warlock
	[49726] = { position = Position() }, -- nothing
	[49727] = { position = Position(33789, 31335, 7) }, -- pirat cutthroath
	[49728] = { position = Position(33551, 31965, 13) }, -- wargolem
	[49729] = { position = Position(32951, 32690, 7) }, -- asura
	[49730] = { position = Position(32812, 32763, 9) }, -- mirror asura
	[49731] = { position = Position(33969, 31646, 8) }, -- bashmu
	[49732] = { position = Position(33385, 32627, 7) }, -- cobra
	[49733] = { position = Position(33357, 31308, 4) }, -- falcon
	[49734] = { position = Position(33463, 32799, 8) }, -- grimeleech
	[49735] = { position = Position(33322, 32325, 12) }, -- vexclaw
	[49736] = { position = Position(33523, 32550, 7) }, -- lower rosha
	[49737] = { position = Position(33539, 32479, 6) }, -- deep rosha
	[49738] = { position = Position(33584, 32208, 7) }, -- elf fogo
	[49739] = { position = Position(32355, 31248, 3) }, -- elf gelo
	[49740] = { position = Position(33565, 31951, 14) }, -- glooth golem
	[49741] = { position = Position(33246, 32109, 8) }, -- savant
	[49742] = { position = Position(33939, 31548, 6) }, -- goana
	[49743] = { position = Position(33885, 31461, 7) }, -- lamassu
	[49744] = { position = Position(31924, 32503, 8) }, -- mino cult
	[49745] = { position = Position(32967, 32925, 7) }, -- werecrocodile
	[49746] = { position = Position(32998, 32932, 7) }, -- weretiger
	[49747] = { position = Position(33810, 31697, 9) }, -- girtabiillu
	[49748] = { position = Position(33830, 32180, 14) }, -- wz 4
	[49749] = { position = Position(33774, 32197, 14) }, -- wz 5
	[49750] = { position = Position(33833, 32127, 14) }, -- wz 6
	[49751] = { position = Position(32963, 31498, 7) }, -- flimsy
	[49752] = { position = Position(33648, 31437, 10) }, -- flimsy
	[49753] = { position = Position(32621, 32566, 14) }, -- ice libray
	[49754] = { position = Position(32596, 32755, 12) }, -- fire
	[49755] = { position = Position(32623, 32546, 12) }, -- earth
	[49756] = { position = Position(32427, 32750, 12) }, -- energy
	[49757] = { position = Position(33354, 32334, 14) }, -- hellflayer
	[49758] = { position = nil }, -- You can add a specific position here if needed
	[49759] = { position = Position(33110, 32386, 7) }, -- skell
	[49760] = { position = nil }, -- You can add a specific position here if needed
	[49761] = { position = Position(32658, 31821, 10) }, -- wz 7,8,9
	[49762] = { position = nil }, -- You can add a specific position here if needed
	[49763] = { position = Position(33457, 31723, 9) }, -- catacombs
	[49764] = { position = Position(32161, 32556, 6) }, -- hellgorge
	[49765] = { position = Position(33020, 31903, 9) }, -- wz 3
	[49766] = { position = Position(33019, 31887, 9) }, -- wz 2
	[49767] = { position = Position(33013, 31881, 9) }, -- wz 1
	[49768] = { position = Position(32975, 32398, 9) }, -- sanguine
	[49769] = { position = Position(33621, 31426, 10) }, -- sw
	[49770] = { position = Position(33547, 32908, 15) }, -- gnom
	[49771] = { position = Position(34334, 31031, 6) }, -- medio
	[49772] = { position = Position(34334, 31053, 6) }, -- high
	[49773] = { position = Position(32369, 32241, 7) }, -- thais
}

local UndercityTeleport = MoveEvent()

function UndercityTeleport.onStepIn(creature, item, position, fromPosition)
	local player = creature:getPlayer()
	if not player then
		return false
	end

	for index, value in pairs(teleports) do
		if item.actionid == index then
			player:teleportTo(value.position)
		end
	end
end

UndercityTeleport:type("stepin")

for index, value in pairs(teleports) do
	UndercityTeleport:aid(index)
end

UndercityTeleport:register()

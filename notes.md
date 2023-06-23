
warzone_solo 35F8EE90CBFFA9E7

warzone_duo 327338A0B51BD1E4

warzone_quad 14de0f7fa012b74f

warzone_hot_pursuit FB4C2B9CE4E66802

wz_open_skyscrapers 2a0c04b4bcbed100

wz_escape 4023b088683398e2

wz_escape_alt 6c4fd4af9da9e4ca

What can cause a crash:

- Bad function call : 1670707254 
- bad name? 
- forgot [[ func ]] to call a function pointer?
- using array::add(arr, val) with isarray(arr) = false
- err 3126405504 BA592980 blackops4.exe+3c3c12b // 5C8B4810
- braker 917 brute goodnight
- 2006839707 -> array:add in bad ptr
- Whiskey 110 Late tiger -> accessing array like a struct?
- kilo 45 gold dove, usage of unset local var

kill: 50
melee_kill: 100

- Rush
  - Players
    - 1 : 55%
    - 2 : 75%
    - 3 : 90%
    - 4 : 110%
  - Difficulty
    - Easy: 1
    - Normal: 1
    - Hard: 1.25
    - Insane: 1.5
- Normal
  - Players
    - 1 : 63%
    - 2 : 75%
    - 3 : 80%
    - 4 : 95%
  - Difficulty
    - Easy: 1
    - Normal: 1
    - Hard: 1.25
    - Insane: 1.5

level.scoreinfo[#"melee_kill"]
level.scoreinfo[#"kill"]

mozu op: hash_6e237d1aec5ebae2

var_c3bb4e09=zone_prespawn
var_f1fbce84=maxcount
var_aeae9f59 = var_f1fbce84 + zone_prespawn, maxcount = zombie_count, zone_prespawn = zombie_count|0(special)

var_7aa3cde7 -> count_zombies

var_c3bb4e09=zone_prespawn 
var_84b8298c=alive count
var_aeae9f59=totalspawn -> random() = var_ce8df1c9
var_10f73408=maxcount -> random() = var_b66547bd
function_4b95d880() spawnzombies()

gamemodeismode(int mode)->bool
- 0=public
- 1=private
- 2=default
- 5=freerun
- 6=league
- 7=theater
- default=false


#"hash_5e9c3f9821e1ee0a" // paint can item

level.var_79a3ba26 = [#"hash_6e237d1aec5ebae2":1, #"hash_28fb7b6581fc57fb":1, #"hash_6c2f4d31b7682613":1, #"hash_5a5408262448eb77":1, #"hash_714bee6de3dc1fd7":1, #"hash_2fa6d3d57c82720c":1, #"hash_2f614bc6ce414164":1, #"hash_2cee20f0ab20f5d5":1, #"hash_3e6f00dcaccdb98e":1, #"hash_7f4ee068772cc5aa":1, #"hash_3458fd4dff2bd9e8":1, #"hash_6075c220f6315daf":1];
		level.var_f290f0ba = [#"hash_78f8f730158519ff":30, #"hospital_stash":29, #"hash_62810f3ef5d7c53b":28, #"hash_468067e2be6e3cfd":27, #"hash_4b49cb98f0fd776a":26, #"hash_6dea2e4afc816818":25, #"hash_2783dbab1f862606":24, #"hash_2141ecb8d2d86b22":23, #"hash_678a1efded2b597a":22, #"hash_1b83b702bbaae298":21, #"hash_7d028af90dad72ae":20, #"hash_a211476d10546c":19, #"hash_308758c2f91807aa":18, #"hash_550872d1d1938f94":17, #"hash_408b3ed7db6f9401":16, #"hash_734bf5054445e0df":15, #"hash_2a93e93b275c38ed":14, #"hash_75cc919e81dc8b19":13, #"hash_779cba7072600ad1":12, #"hash_47a63bc4a605b45f":11, #"hash_4ee6deffa30cc6e2":10, #"hash_ca8b234ad1fea38":9, #"hash_66f790c2630deace":8, #"hash_49e8a607ea22e650":7, #"hash_43647ef7af66f82f":6, #"hash_61373b747c6a21fd":5, #"hash_3ad3de90342f2d4b":4, #"hash_2b546c0315159617":3, #"hash_33f7121f70c3065f":2, #"hash_6a0d13acf3e5687d":1];



a maximum of 6 quacknarok zombies are used, maybe implementing it by ourself would be more permisive
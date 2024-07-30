# Return player to original position and Survival mode if currently in Spectator mode
# Teleport to the armor stand
execute as @a[scores={exitSpectate=1..},gamemode=spectator] run tp @s @e[type=minecraft:armor_stand,tag=PosSaver,limit=1,sort=nearest]
execute as @a[scores={exitSpectate=1..},gamemode=spectator] run kill @e[type=minecraft:armor_stand,tag=PosSaver,limit=1,sort=nearest]
execute as @a[scores={exitSpectate=1..},gamemode=spectator] run gamemode survival @s

tellraw @s {"text":"Returned to original position and survival mode.","color":"yellow"}

# Reset the exitSpectate to 0
execute as @a[scores={exitSpectate=1..},gamemode=!spectator] run scoreboard players set @s exitSpectate 0
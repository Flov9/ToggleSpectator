# Switch to Spectator mode and store position using a placeholder armor stand
execute as @a[scores={enterSpectate=1..},gamemode=!spectator] run gamemode spectator @s
execute as @a[scores={enterSpectate=1..},gamemode=spectator] at @s run summon minecraft:armor_stand ~ ~ ~ {Tags:["PosSaver"],Invisible:true,Invulnerable:true,PersistenceRequired:true,NoBasePlate:true,NoGravity:true,Marker:true,CustomName:"{\"text\":\"PosSaver\",\"color\":\"red\"}",CustomNameVisible:false}

tellraw @s {"text":"Entered spectator mode. Use /trigger exitSpectate to return.","color":"yellow"}

# Store the coordinates of the Armor Stand in the scoreboard
execute as @a[scores={enterSpectate=1..},gamemode=spectator] at @e[type=armor_stand,tag=PosSaver,limit=1,sort=nearest] run data modify entity @s Pos set from entity @e[type=armor_stand,tag=PosSaver,limit=1,sort=nearest] Pos
execute as @a[scores={enterSpectate=1..},gamemode=spectator] store result score @s posX run data get entity @s Pos[0] 1
execute as @a[scores={enterSpectate=1..},gamemode=spectator] store result score @s posY run data get entity @s Pos[1] 1
execute as @a[scores={enterSpectate=1..},gamemode=spectator] store result score @s posZ run data get entity @s Pos[2] 1

# Display the coordinates of the armor stand in the action bar
execute as @a[scores={enterSpectate=1..},gamemode=spectator] run title @s actionbar [{"text":"Original Position: ","color":"yellow"},{"score":{"name":"@s","objective":"posX"}},{"text":", ","color":"yellow"},{"score":{"name":"@s","objective":"posY"}},{"text":", ","color":"yellow"},{"score":{"name":"@s","objective":"posZ"}}]

# Reset the enterSpectate to 0
execute as @a[scores={enterSpectate=1..},gamemode=spectator] run scoreboard players set @s enterSpectate 0
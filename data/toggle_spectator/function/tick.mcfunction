scoreboard players enable @a enterSpectate
scoreboard players enable @a exitSpectate

execute as @a[scores={enterSpectate=1..}, gamemode=!spectator] at @s run function toggle_spectator:spec
execute as @a[scores={exitSpectate=1..}, gamemode=spectator] at @s run function toggle_spectator:surv

local over_the_rainbow = {
    "Help Wesley research opening a new portal",
    "Ask Lorne to locate a mystical hot spot",
    "Enter the portal to Pylea", 

    title = "To Pylea",
    reward = {"fur mantle", "Crebbil"},
    auras = {buff = {["Daywalking"] = "Your human side is dominant in Pylea.\nYou are able to walk in sunlight,\nand you've noticed you have a reflection.\n...and why has no one ever told you\nabout your hair?"},
            debuff = {["Van-Tal"] = "When accessing your inner-demon;\nYou take on the true form of your inner-demon. \nYou enter a berserk-like state with no control."}
        },
    completed = false,
    stepsDone = {}
}
local function questRewards(questTable)
    print("\n{[( )]}<<<Rewards>>>{[( )]}")
    if questTable.completed == true then
        if questTable.reward then
            for i, v in ipairs(questTable.reward) do
                print(v .. " - added to inventory")
            end
        end
        if questTable.auras.buff then
            for k, v in pairs(questTable.auras.buff) do
            print("\nBuff- " .. k .. ":" .. v)
            end
        end
            if questTable.auras.debuff then
            for k, v in pairs(questTable.auras.debuff) do
            print("\nDebuff- " .. k .. ":" .. v)
            end
        end
    end
end

local function showQuest(questTable)
    print("\nQuest:", questTable.title) --► print "Quest: "To Pylea"
    print(string.rep("-", 40))

    for stepNum, step_is in ipairs(questTable) do
        local status = (step_is == true) and "[✔]" or "[ ]"
        local stepName = step_is

        -- when completed, step_is = true, so fetch from stepsDone list instead
        if step_is == true then
            stepName = questTable.stepsDone[stepNum] or "Step Completed"
        end
        
        print(string.format("%d. %-50s %s", stepNum, stepName, status))
    end
    if questTable.completed == true then
        print("Quest Complete!")
    end
    print(string.rep("-", 40))
end

local function questRewards(questTable)
    print("Rewards:")
    if questTable.completed == true then
        if questTable.reward then
            for i, v in ipairs(questTable.reward) do
                print(v .. " added to inventory")                
            end
        end
        print(string.rep("-", 40))        
        if questTable.auras.buff then
            for k, v in pairs(questTable.auras.buff) do
            print("Buff Received: " .. k .. " -\n" .. v)
            end
        end
            if questTable.auras.debuff then
            for k, v in pairs(questTable.auras.debuff) do
            print("\nDebuff Received: " .. k .. " -\n" .. v)
            end
        end
    end
end

local function questProgress(questTable)
    for stepNum, step_is in ipairs(questTable) do 
        if step_is ~= true then
            local stepName = step_is 
            -- save original step name
            table.insert(questTable.stepsDone, stepName)
            -- track it in "stepsDone"
            questTable[stepNum] = true 
            -- Mark this step complete
            print(step_is .. "[Completed!]") 
            
            --if all steps complete, mark quest complete
                if stepNum == #questTable then
                    questTable.completed = true
                    print("Quest complete: " .. questTable.title)
                    showQuest(questTable)
                    questRewards(questTable)
                end
                    --▲ asks if [x] is equal to the total quantity of array part of table (3), if it is:--►
                    --►changes [completed] to "true". Then "return". If not at 3: "return".
                return --► return ends the loop.
            end
        end
end
print("[To Pylea - No steps completed]")
showQuest(over_the_rainbow)


print("\n[To Pylea - Progress - First step]")
questProgress(over_the_rainbow)

print("\n[To Pylea - First Step completed]")
showQuest(over_the_rainbow)


print("\n[To Pylea - Progress - Second step]")
questProgress(over_the_rainbow)

print("\n[To Pylea - Second Step completed]")
showQuest(over_the_rainbow)


print("\n[To Pylea - Progress - Third step]")
questProgress(over_the_rainbow)


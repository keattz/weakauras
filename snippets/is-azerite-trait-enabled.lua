function IsAzeriteTraitEnabled(spellId)
    for slotId=1, 5, 2 do
        local itemLink = GetInventoryItemLink('player', slotId)
        
        if itemLink ~= nil then
            local itemLoc = ItemLocation:CreateFromEquipmentSlot(slotId)
            
            if itemLoc and C_AzeriteEmpoweredItem then
                if C_AzeriteEmpoweredItem.IsAzeriteEmpoweredItem(itemLoc) then
                    local tierInfo = C_AzeriteEmpoweredItem.GetAllTierInfo(itemLoc)
                    
                    for azeriteTier, tierInfo in pairs(tierInfo) do
                        for i, idx in pairs(tierInfo.azeritePowerIDs) do
                            if C_AzeriteEmpoweredItem.IsPowerSelected(itemLoc, idx) then
                                powerInfo = C_AzeriteEmpoweredItem.GetPowerInfo(idx)
                                
                                if (powerInfo) then
                                    local azeriteSpellId = powerInfo["spellID"]
                                    
                                    if azeriteSpellId == spellId then
                                        return true
                                    end
                                end
                            end
                        end
                    end
                end
            end
        end
    end
    return false
end

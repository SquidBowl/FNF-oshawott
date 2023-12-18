local fuck = false
--- @param membersIndex int
--- @param noteData int
--- @param noteType string
--- @param isSustainNote bool
---
function opponentNoteHit(membersIndex, noteData, noteType, isSustainNote)
    if not isSustainNote then
        if getProperty('health') > 0.45 then
        setProperty('health',getProperty('health') - 0.02)
        end
    end
end

function onBeatHit()
	if curBeat % 2 == 0 then
		if fuck then
			fuck = false
            triggerEvent('Change Scroll Speed',0.8,0.55)
		else
			fuck = true
			triggerEvent('Change Scroll Speed',1,0.45)
		end
    end
end
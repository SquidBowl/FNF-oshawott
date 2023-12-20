local beatTimer = 0
function opponentNoteHit(membersIndex, noteData, noteType, isSustainNote)
if not isSustainNote then
if getProperty('health') > 0.1 then
setProperty('health',getProperty('health') - 0.005)
end
end
end

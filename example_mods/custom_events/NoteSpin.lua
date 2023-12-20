local NoteAnglex = 1
local NoteTT = 0.2
local NoteAngle = 360

function onEvent(n, v1, v2)
    if n == 'NoteSpin' then
        for i = 0 , 7 do
            noteTweenAngle('noteSpin'..i ,i, NoteAngle*NoteAnglex, NoteTT, 'cubeOut')
        end
            NoteAnglex = NoteAnglex+1
    end
end


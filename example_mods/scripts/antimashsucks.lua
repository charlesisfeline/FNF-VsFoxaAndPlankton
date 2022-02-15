function goodNoteHit(id, noteData, noteType, isSustainNote)
  setProperty('health', getProperty('health') + 0.026)
  end
  function noteMiss(direction)
  setProperty('health', getProperty('health') - 0.025)
end
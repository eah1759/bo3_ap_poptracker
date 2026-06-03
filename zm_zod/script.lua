testItem = ScriptHost:CreateLuaItem()
testItem.Name = 'Test7'
testItem.Icon = 'images/test.png'
testItem.CanProvideCodeFunc = function(luaItem, code)
    if code == 'testItem7' then return true end
    return false
end
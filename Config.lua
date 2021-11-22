Config = Config or {}

Config.Framework = 'qbcore' -- esx or qbcore

Config.NUI = {
    merry = 'Merry',
    christmas = 'Christmas',
    win = 'You Win ',
    lose = 'Luck for the next 😭',
    message = 'Flip the letter to see your gift',
}
Config.WordThatSaveYourLife = 'hackerconchatumare'

Config.ItemForTicket = 'xmasticket'

Config.Items = {
    {label = 'Phone', name = 'phone', amount = math.random(1,5)}, --REMEMBER PUT ITEMS THAT U HAVE IN YOUR SHARED.LUA OR YOUR DATABSE IN CASE ESX.
    {label = 'Pan', name = 'bread', amount = math.random(1,5)},
    {label = 'Lose', name = 'lose', amount = math.random(1,2)}, --This is for lose, copy and paste for more probability to lose  :(
    {label = 'Lose', name = 'lose', amount = math.random(1,2)},
    {label = 'Cash', name = 'cash', amount = math.random(3000,7000)}, --Just support name = 'cash', work in qbcore and esx, this give u money in hand.
    {label = 'Cash', name = 'cash', amount = math.random(3000,7000)},
}
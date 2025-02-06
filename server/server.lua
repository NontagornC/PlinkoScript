local GroupProbabilities = {
      a = 0.2,
      b = 0.1,
      c = 0.2,
      d = 0.01,
      e = 0.4,
      f = 0.09
}

local function selectGroup()
      local random = math.random()
      local cumulativeProbability = 0

      for group, probability in pairs(GroupProbabilities) do
            cumulativeProbability = cumulativeProbability + probability
            if random < cumulativeProbability then
                  return group
            end
      end
end

-- random group ตามความน่าจะเป็น
ESX.RegisterServerCallback("plinko:getRandomGroup", function(source, cb)
      local group = selectGroup()
      print(group, 'this is group random')
      cb({
            group = group
      })
end)

-- validate เงินผู้เล่นก่อนปล่อยบอล
ESX.RegisterServerCallback("plinko:validateMoneyForPlayingGame", function(source, cb, data)
      local numberOfDroppballs = data.dropballNumber
      -- query หรือ logic เช็คจำนวนเงินตรงนี้
      cb({
            success = true,
            message = "enough money",
            numberOfDroppballs = numberOfDroppballs
      })
end)

-- รับผลลัพธ์ของการเล่นเกมตาม group และจำนวนที่ได้
ESX.RegisterServerCallback("plinko:processGameResults", function(source, cb, data)
      print(json.encode(data), "Full game results data")
      -- logic or query to update player item here
      cb({
            success = true
      })
end)

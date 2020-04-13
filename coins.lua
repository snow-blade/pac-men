
function slice(tbl, first, last, step)
  local sliced = {}
  for i = first or 1, last or #tbl, step or 1 do
       sliced[#sliced+1] = tbl[i]
  end
  return sliced
end


function shuffle(tbl)
  love.math.getRandomSeed(os.time())
  for i = #tbl, 2, -1 do
    local j = love.math.random(i)
    tbl[i], tbl[j] = tbl[j], tbl[i]
  end
  return tbl
end
function spawn_random_coins(tab,number_of_coins)
    pos={}
    table.insert(pos, {2,2})
    for i,el in ipairs(tab) do
       for j,el2 in ipairs(el) do 
          if el2==0 then
            table.insert(pos,{i,j})
          end
       end 
    end
    assert(number_of_coins<#pos,"the number of coins should be less than the numer of blanks")
    return slice(shuffle(pos),1,number_of_coins)
end
--[[
    Это - библиотека для работы со стеками на Lua.

    Как подключить и использовать: разберем на практике.

    stack = require("stack") --подключаем библиотеку

    fuf = { --наш условный стек (это массив, на самом деле)
        89,
        "meowsy",
        2*3,
    }

    stack.top(fuf) --вернет верхний (последний) элемент стека (здесь вернет 6)
    stack.empty(fuf) --вернет true, если стек пуст или false, если в стеке что-то есть (здесь вернет false)
    stack.push(fuf, 123) --добавляет в стек элемент - этот элемент станет верхним - значение нужно указать во втором аргументе (ничего не вернет)
    stack.pop(fuf) --удаляет верхний элемент (ничего не вернет)
    stack.peek(fuf, 2) --вернет значение n-ного элемента с вершины стека (здесь вернет 89)

    Чтобы с библиотекой было проще работать, я добавил проверку типа данных - при данных постороннего типа вернет nil

    Спасибо, что используете мою библиотеку! :3
]]

local stack = {}

function stack.top(table)
    if type(table) == "table" then --проверка типа таблицы
        return table[#table]
    else
        return nil
    end
end

function stack.empty(table)
    if type(table) == "table" then
        if #table == 0 then
            return true
        else
            return false
        end
    else
        return nil
    end
end

function stack.push(table, info)
    if type(table) == "table" then --проверка типа таблицы (заметьте, info может быть любым типом данных)
        table[#table + 1] = info
    else
        return nil
    end
end

function stack.pop(table)
    if type(table) == "table" then
        table[#table] = nil
    else
        return nil
    end
end

function stack.peek(table, num)
    if type(table) == "table" and type(num) == "number" then --проверка типа таблицы первого аргумента и типа числа второго аргумента
        return table[#table - num] --если num будет больше или равен длине стека, вернет nil
    else
        return nil
    end
end

return stack
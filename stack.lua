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
        return table[#table - num] --если num будет больше или равен длине стека (или даже отрицательным числом), вернет nil
    else
        return nil
    end
end

return stack

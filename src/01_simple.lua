local MySimpleService = {}

function MySimpleService.greet(name)
    if name ~= nil and name ~= '' then
        return "Hello " .. name
    else
        error('no name supplied')
    end
end

return MySimpleService
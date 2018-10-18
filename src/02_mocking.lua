local ExampleController = {}

-- that's gonna be a problem in tests :/
local service = require "ServiceOutsideThisProject"

function ExampleController.calculate(number1, number2)
    return service.multiply(number1, number2)
end

return ExampleController
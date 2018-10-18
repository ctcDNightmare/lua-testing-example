describe("ExampleController", function()
    local testSubject

    setup(function()
        local function mockedServiceOutsideThisProject(_, func)
            -- override the functions that the testSubject needs
            if func == 'multiply' then
                -- let's just return something to test against
                return function() return 'success' end
            end
        end

        -- mock away the external dependency
        package.loaded["ServiceOutsideThisProject"] = setmetatable({}, {__index = mockedServiceOutsideThisProject})

        -- now it's time to instantiate the testsubject
        testSubject = require("02_mocking")
    end)

    it("should pass the calculation to the service", function()
        -- we are not here to test if 2x3=6 because that's the job of the service not this controller
        assert.is_equal(testSubject.calculate(2,3), 'success')
    end)
end)
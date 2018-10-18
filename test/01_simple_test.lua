describe("MySimpleService", function()
    local testSubject

    setup(function()
        -- time to instantiate the testsubject
        testSubject = require("01_simple")
    end)

    it("should have a greet function", function()
        assert.is_function(testSubject.greet)
    end)

    it("should greet people", function()
        spy.on(testSubject, "greet")
        local greeting = testSubject.greet("World")

        assert.spy(testSubject.greet).was.called_with("World")
        assert.is_equal(greeting, "Hello World")

    end)

    it("should not greet strangers", function()
        assert.has.error(
            function() testSubject.greet() end,
            'no name supplied'
        )

        assert.has.error(
            function() testSubject.greet('') end,
            'no name supplied'
        )
    end)

end)
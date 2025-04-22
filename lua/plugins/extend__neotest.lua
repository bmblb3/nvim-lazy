return {
  "nvim-neotest/neotest",
  dependencies = {
    "nvim-neotest/neotest-python",
  },
  opts = {
    adapters = {
      ["neotest-python"] = {
        is_test_file = function(file_path)
          if file_path:match("^test_.*%.py$") then
            return true
          else
            local f = io.open(file_path, "r")
            if not f then
              return false
            end
            local content = f:read("*a")
            f:close()
            return content:match("def test_") ~= nil
          end
        end,
      },
    },
  },
}

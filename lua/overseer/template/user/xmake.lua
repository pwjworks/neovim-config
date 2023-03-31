return {
  name = "xmake",
  builder = function()
    return {
      cmd = { "xmake" },
      cwd = "/home/pwjworks/Projects/CppLearning/cpptemplate2nd",
      components = { "default" },
    }
  end,
  condition = {
    filetype = { "cpp" },
  },
}

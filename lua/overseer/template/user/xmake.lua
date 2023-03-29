return {
  name = "xmake",
  builder = function()
    return {
      cmd = { "xmake" },
      cwd = "/home/pwjworks/Projects/CppLearning/cpptemplate2nd",
      components = { "display_duration", "on_exit_set_status", "on_complete_notify", "on_output_summarize",
        "on_result_diagnostics", "on_result_notify" },
    }
  end,
  condition = {
    filetype = { "cpp" },
  },
}

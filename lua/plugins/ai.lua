-- From: https://gist.githubusercontent.com/burkeholland/88af0249c4b6aff3820bf37898c8bacf/raw/3e0365631c429858084dbc545a86bf9f2198ac82/4.1.chatmode.md
local custom_gpt_41_system_prompt =
  [[You are an agent - please keep going until the user’s query is completely resolved, before ending your turn and yielding back to the user.

Your thinking should be thorough and so it's fine if it's very long. However, avoid unnecessary repetition and verbosity. You should be concise, but thorough.

You MUST iterate and keep going until the problem is solved.

You have everything you need to resolve this problem. I want you to fully solve this autonomously before coming back to me.

Only terminate your turn when you are sure that the problem is solved and all items have been checked off. Go through the problem step by step, and make sure to verify that your changes are correct. NEVER end your turn without having truly and completely solved the problem, and when you say you are going to make a tool call, make sure you ACTUALLY make the tool call, instead of ending your turn.

THE PROBLEM CAN NOT BE SOLVED WITHOUT EXTENSIVE INTERNET RESEARCH.

You must use the fetch_webpage tool to recursively gather all information from URL's provided to  you by the user, as well as any links you find in the content of those pages.

Your knowledge on everything is out of date because your training date is in the past. 

You CANNOT successfully complete this task without using Google to verify your understanding of third party packages and dependencies is up to date. You must use the fetch_webpage tool to search google for how to properly use libraries, packages, frameworks, dependencies, etc. every single time you install or implement one. It is not enough to just search, you must also read the  content of the pages you find and recursively gather all relevant information by fetching additional links until you have all the information you need.

Always tell the user what you are going to do before making a tool call with a single concise sentence. This will help them understand what you are doing and why.

If the user request is "resume" or "continue" or "try again", check the previous conversation history to see what the next incomplete step in the todo list is. Continue from that step, and do not hand back control to the user until the entire todo list is complete and all items are checked off. Inform the user that you are continuing from the last incomplete step, and what that step is.

Take your time and think through every step - remember to check your solution rigorously and watch out for boundary cases, especially with the changes you made. Use the sequential thinking tool if available. Your solution must be perfect. If not, continue working on it. At the end, you must test your code rigorously using the tools provided, and do it many times, to catch all edge cases. If it is not robust, iterate more and make it perfect. Failing to test your code sufficiently rigorously is the NUMBER ONE failure mode on these types of tasks; make sure you handle all edge cases, and run existing tests if they are provided.

You MUST plan extensively before each function call, and reflect extensively on the outcomes of the previous function calls. DO NOT do this entire process by making function calls only, as this can impair your ability to solve the problem and think insightfully.

You MUST keep working until the problem is completely solved, and all items in the todo list are checked off. Do not end your turn until you have completed all steps in the todo list and verified that everything is working correctly. When you say "Next I will do X" or "Now I will do Y" or "I will do X", you MUST actually do X or Y instead just saying that you will do it. 

You are a highly capable and autonomous agent, and you can definitely solve this problem without needing to ask the user for further input.

# Workflow

1. Fetch any URL's provided by the user using the `fetch_webpage` tool.
2. Understand the problem deeply. Carefully read the issue and think critically about what is required. Use sequential thinking to break down the problem into manageable parts. Consider the following:
   - What is the expected behavior?
   - What are the edge cases?
   - What are the potential pitfalls?
   - How does this fit into the larger context of the codebase?
   - What are the dependencies and interactions with other parts of the code?
3. Investigate the codebase. Explore relevant files, search for key functions, and gather context.
4. Research the problem on the internet by reading relevant articles, documentation, and forums.
5. Develop a clear, step-by-step plan. Break down the fix into manageable, incremental steps. Display those steps in a simple todo list using standard markdown format. Make sure you wrap the todo list in triple backticks so that it is formatted correctly.
6. Implement the fix incrementally. Make small, testable code changes.
7. Debug as needed. Use debugging techniques to isolate and resolve issues.
8. Test frequently. Run tests after each change to verify correctness.
9. Iterate until the root cause is fixed and all tests pass.
10. Reflect and validate comprehensively. After tests pass, think about the original intent, write additional tests to ensure correctness, and remember there are hidden tests that must also pass before the solution is truly complete.

Refer to the detailed sections below for more information on each step.

## 1. Fetch Provided URLs
- If the user provides a URL, use the `functions.fetch_webpage` tool to retrieve the content of the provided URL.
- After fetching, review the content returned by the fetch tool.
- If you find any additional URLs or links that are relevant, use the `fetch_webpage` tool again to retrieve those links.
- Recursively gather all relevant information by fetching additional links until you have all the information you need.

## 2. Deeply Understand the Problem
Carefully read the issue and think hard about a plan to solve it before coding.

## 3. Codebase Investigation
- Explore relevant files and directories.
- Search for key functions, classes, or variables related to the issue.
- Read and understand relevant code snippets.
- Identify the root cause of the problem.
- Validate and update your understanding continuously as you gather more context.

## 4. Internet Research
- Use the `fetch_webpage` tool to search google by fetching the URL `https://www.google.com/search?q=your+search+query`.
- After fetching, review the content returned by the fetch tool.
- If you find any additional URLs or links that are relevant, use the `fetch_webpage ` tool again to retrieve those links.
- Recursively gather all relevant information by fetching additional links until you have all the information you need.

## 5. Develop a Detailed Plan 
- Outline a specific, simple, and verifiable sequence of steps to fix the problem.
- Create a todo list in markdown format to track your progress.
- Each time you complete a step, check it off using `[x]` syntax.
- Each time you check off a step, display the updated todo list to the user.
- Make sure that you ACTUALLY continue on to the next step after checkin off a step instead of ending your turn and asking the user what they want to do next.

## 6. Making Code Changes
- Before editing, always read the relevant file contents or section to ensure complete context.
- Always read 2000 lines of code at a time to ensure you have enough context.
- If a patch is not applied correctly, attempt to reapply it.
- Make small, testable, incremental changes that logically follow from your investigation and plan.

## 7. Debugging
- Use the `get_errors` tool to check for any problems in the code
- Make code changes only if you have high confidence they can solve the problem
- When debugging, try to determine the root cause rather than addressing symptoms
- Debug for as long as needed to identify the root cause and identify a fix
- Use print statements, logs, or temporary code to inspect program state, including descriptive statements or error messages to understand what's happening
- To test hypotheses, you can also add test statements or functions
- Revisit your assumptions if unexpected behavior occurs.

# How to create a Todo List
Use the following format to create a todo list:
```markdown
- [ ] Step 1: Description of the first step
- [ ] Step 2: Description of the second step
- [ ] Step 3: Description of the third step
```

Do not ever use HTML tags or any other formatting for the todo list, as it will not be rendered correctly. Always use the markdown format shown above.

# Communication Guidelines
Always communicate clearly and concisely in a casual, friendly yet professional tone. 

<examples>
"Let me fetch the URL you provided to gather more information."
"Ok, I've got all of the information I need on the LIFX API and I know how to use it."
"Now, I will search the codebase for the function that handles the LIFX API requests."
"I need to update several files here - stand by"
"OK! Now let's run the tests to make sure everything is working correctly."
"Whelp - I see we have some problems. Let's fix those up."
</examples>]]

return {
  {
    "NickvanDyke/opencode.nvim",
    dependencies = {
      -- Recommended for better prompt input, and required to use `opencode.nvim`'s embedded terminal — otherwise optional
      { "folke/snacks.nvim", opts = { input = { enabled = true } } },
    },
    config = function()
      vim.g.opencode_opts = {
        -- Your configuration, if any — see `lua/opencode/config.lua`
      }

      -- Required for `opts.auto_reload`
      vim.opt.autoread = true

      -- Recommended keymaps
      -- Recommended keymaps
      vim.keymap.set("n", "<leader>ot", function()
        require("opencode").toggle()
      end, { desc = "Toggle" })
      vim.keymap.set("n", "<leader>oA", function()
        require("opencode").ask()
      end, { desc = "Ask" })
      vim.keymap.set("n", "<leader>oa", function()
        require("opencode").ask("@cursor: ")
      end, { desc = "Ask about this" })
      vim.keymap.set("v", "<leader>oa", function()
        require("opencode").ask("@selection: ")
      end, { desc = "Ask about selection" })
      vim.keymap.set("n", "<leader>o+", function()
        require("opencode").append_prompt("@buffer")
      end, { desc = "Add buffer to prompt" })
      vim.keymap.set("v", "<leader>o+", function()
        require("opencode").append_prompt("@selection")
      end, { desc = "Add selection to prompt" })
      vim.keymap.set("n", "<leader>on", function()
        require("opencode").command("session_new")
      end, { desc = "New session" })
      vim.keymap.set("n", "<leader>oy", function()
        require("opencode").command("messages_copy")
      end, { desc = "Copy last response" })
      vim.keymap.set("n", "<S-C-u>", function()
        require("opencode").command("messages_half_page_up")
      end, { desc = "Messages half page up" })
      vim.keymap.set("n", "<S-C-d>", function()
        require("opencode").command("messages_half_page_down")
      end, { desc = "Messages half page down" })
      vim.keymap.set({ "n", "v" }, "<leader>os", function()
        require("opencode").select()
      end, { desc = "Select prompt" })

      -- Example: keymap for custom prompt
      vim.keymap.set("n", "<leader>oe", function()
        require("opencode").prompt("Explain @cursor and its context")
      end, { desc = "Explain this code" })
    end,
  },
  {
    "folke/which-key.nvim",
    opts = {
      spec = {
        { "<leader>o", group = "Opencode" },
      },
    },
  },
  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    build = ":Copilot auth",
    event = "BufReadPost",
    opts = {
      copilot_model = "gpt-4o-copilot", -- Current LSP default is gpt-35-turbo, supports gpt-4o-copilot
    },
  },
  {
    "yetone/avante.nvim",
    event = "VeryLazy",
    -- cmd = { "AvanteToggle" },
    -- lazy = true,
    version = false, -- set this if you want to always pull the latest change
    -- full config: https://github.com/yetone/avante.nvim/blob/main/lua/avante/config.lua
    -- cfg inspired by: https://github.com/gokhangeyik/dotfiles/blob/main/nvim/lua/plugins/avante.lua
    opts = {
      ---@alias Mode "agentic" | "legacy"
      mode = "legacy",
      ---@alias Provider "claude" | "openai" | "azure" | "gemini" | "cohere" | "copilot" | string
      provider = "cp_gpt41",
      system_prompt = custom_gpt_41_system_prompt,
      cursor_applying_provider = "cp_gpt41",
      auto_suggestions_provider = "cp_gpt41",
      behaviour = {
        auto_suggestions = false,
      },
      windows = {
        ask = {
          start_insert = false,
        },
      },
      file_selector = {
        provider = "snacks",
      },
      providers = {
        copilot = {
          endpoint = "https://api.githubcopilot.com",
          proxy = nil, -- [protocol://]host[:port] Use this proxy
          allow_insecure = false, -- Allow insecure server connections
          hide_in_model_selector = true,
          -- timeout = 5 * 60 * 1000, -- Timeout in milliseconds
          -- temperature = 0,
          -- reasoning_effort = "high",
        },
        cp_gpt4o = {
          __inherited_from = "copilot",
          model = "gpt-4o",
          timeout = 30000, -- Timeout in milliseconds
          extra_request_body = {
            temperature = 0,
          },
          -- max_tokens = 8192,
        },
        cp_gpt41 = {
          __inherited_from = "copilot",
          model = "gpt-4.1",
          timeout = 30000, -- Timeout in milliseconds
          extra_request_body = {
            temperature = 0,
          },
          system_prompt = custom_gpt_41_system_prompt,
          -- max_tokens = 8192,
        },
        cp_claude_35 = {
          __inherited_from = "copilot",
          model = "claude-3.5-sonnet",
          timeout = 30000, -- Timeout in milliseconds
          extra_request_body = {
            temperature = 0,
          },
          -- max_tokens = 8192,
        },
        cp_claude_37 = {
          __inherited_from = "copilot",
          model = "claude-3.7-sonnet",
          timeout = 30000, -- Timeout in milliseconds
          extra_request_body = {
            temperature = 0,
          },
          -- max_tokens = 8192,
        },
        cp_claude_4 = {
          __inherited_from = "copilot",
          model = "claude-sonnet-4",
          timeout = 30000, -- Timeout in milliseconds
          extra_request_body = {
            temperature = 0,
          },
          -- max_tokens = 8192,
        },
        cp_claude_37_thinking = {
          __inherited_from = "copilot",
          model = "claude-3.7-sonnet-thought",
          timeout = 30000, -- Timeout in milliseconds
          extra_request_body = {
            temperature = 0,
          },
          -- max_tokens = 8192,
        },
        cp_o1 = {
          __inherited_from = "copilot",
          model = "o1",
        },
        cp_o3_mini = {
          __inherited_from = "copilot",
          model = "o3-mini",
        },
        cp_gemini = {
          __inherited_from = "copilot",
          model = "gemini-2.0-flash-001",
        },
        -- Hide unavailable models
        ["aihubmix"] = {
          hide_in_model_selector = true,
        },
        ["aihubmix-claude"] = {
          hide_in_model_selector = true,
        },
        openai = {
          hide_in_model_selector = true,
        },
        ["openai-gpt-4o-mini"] = {
          hide_in_model_selector = true,
        },
        cohere = {
          hide_in_model_selector = true,
        },
        claude = {
          hide_in_model_selector = true,
        },
        ["claude-opus"] = {
          hide_in_model_selector = true,
        },
        ["claude-haiku"] = {
          hide_in_model_selector = true,
        },
        gemini = {
          hide_in_model_selector = true,
        },
        vertex = {
          hide_in_model_selector = true,
        },
        vertex_claude = {
          hide_in_model_selector = true,
        },
        bedrock = {
          hide_in_model_selector = true,
        },
      },
    },
    -- if you want to build from source then do `make BUILD_FROM_SOURCE=true`
    -- dynamically build it, taken from astronvim
    build = vim.fn.has("win32") == 1 and "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false"
      or "make",
    dependencies = {
      -- "stevearc/dressing.nvim",
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      {
        -- support for image pasting
        "HakonHarnes/img-clip.nvim",
        event = "VeryLazy",
        opts = {
          -- recommended settings
          default = {
            embed_image_as_base64 = false,
            prompt_for_file_name = false,
            drag_and_drop = {
              insert_mode = true,
            },
            -- required for Windows users
            use_absolute_path = true,
          },
        },
      },
    },
    keys = {
      -- { "<c-s>", "<CR>", ft = "codecompanion", desc = "Submit Prompt", remap = true },
      { "<leader>a", "", desc = "+ai", mode = { "n", "v" } },
      {
        "<leader>aC",
        "<cmd>AvanteClear<cr>",
        desc = "avante: clear",
        mode = { "n", "v" },
      },
      { "<leader>at", "<Cmd>AvanteToggle<CR>", desc = "avante: toggle" },
    },
  },
  -- {
  --   "CopilotC-Nvim/CopilotChat.nvim",
  --   dependencies = {
  --     { "zbirenbaum/copilot.lua" }, -- or zbirenbaum/copilot.lua
  --     { "nvim-lua/plenary.nvim", branch = "master" }, -- for curl, log and async functions
  --   },
  --   build = "make tiktoken", -- Only on MacOS or Linux
  --   opts = {
  --     -- See Configuration section for options
  --   },
  --   -- See Commands section for default commands if you want to lazy load on them
  -- },
  -- {
  --   "olimorris/codecompanion.nvim",
  --   version = "*", -- use latest release instead of latest commit
  --   dependencies = {
  --     "nvim-lua/plenary.nvim",
  --     "nvim-treesitter/nvim-treesitter",
  --     "j-hui/fidget.nvim",
  --   },
  --   opts = {
  --     adapters = {
  --       copilot = function()
  --         return require("codecompanion.adapters").extend("copilot", {
  --           schema = {
  --             model = {
  --               default = "claude-3.7-sonnet",
  --             },
  --           },
  --         })
  --       end,
  --     },
  --     strategies = {
  --       chat = {
  --         adapter = "copilot",
  --       },
  --       inline = {
  --         adapter = "copilot",
  --       },
  --       agent = {
  --         adapter = "copilot",
  --       },
  --     },
  --     opts = {
  --       -- Set debug logging
  --       -- log_level = "DEBUG",
  --     },
  --   },
  --   keys = {
  --     -- { "<c-s>", "<CR>", ft = "codecompanion", desc = "Submit Prompt", remap = true },
  --     { "<leader>a", "", desc = "+ai", mode = { "n", "v" } },
  --     {
  --       "<leader>aa",
  --       "<cmd>CodeCompanionChat Toggle<cr>",
  --       desc = "Toggle (CodeCompanion)",
  --       mode = { "n", "v" },
  --     },
  --     {
  --       "<leader>aq",
  --       "<cmd>CodeCompanion",
  --       desc = "Quick Chat (CodeCompanion)",
  --       mode = { "n", "v" },
  --     },
  --     {
  --       "<leader>ap",
  --       "<cmd>CodeCompanionActions<cr>",
  --       desc = "Prompt Actions (CodeCompanion)",
  --       mode = { "n", "v" },
  --     },
  --   },
  --   init = function()
  --     require("plugins.codecompanion.fidget-spinner"):init()
  --   end,
  -- },
}

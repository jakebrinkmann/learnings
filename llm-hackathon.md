# Let's hack on `llm`!

If you have [uv](https://docs.astral.sh/uv/) installed (and you should!), you can install [llm](https://llm.datasette.io/en/stable/) globally in a `uv`-managed tool environment with:

```bash
uv tool install llm
```

If you want to use models other than OpenAI models, you'll need some extensions:

```bash
llm install llm-deepseek llm-gemini llm-openrouter
```

Additionally, you'll need to set API keys for the providers you want to use:

```bash
llm keys set openai
# Enter your API key when prompted
```

To avoid running up any bills during this hackathon, I recommend setting an openrouter key and then only using their [free models, available here](https://openrouter.ai/models?max_price=0). There are lots of great free models, including Deepseek R1 and a "cloaked" pre-release model with 1,000,000-token context window called "cypher-alpha".

Once you've set API keys, you can get the full list of available models with:

```bash
llm models
```

Then you can use the `-m` flag to specify a model:

```bash
llm -m openrouter/openrouter/cypher-alpha:free "How many 'r's are in 'strawberrrrry'?"
```

You can also alias models to make them easier to use:

```bash
llm aliases set cypher-alpha openrouter/openrouter/cypher-alpha:free
```

## Ways I'm using LLM in my daily work

1. **Learning Linux** with a prompt template

    LLM lets you define a prompt template with input variables. I've created one with the details of my Linux distribution to speed up the process of asking for help with writing shell commands.

    ```bash
    llm --system "You are a Linux command-line copilot running in WSL2 with the following Linux distribution:
    $(cat /etc/*-release)" --save linux
    ```

    Now I can use it with the `--template` option:

    ```bash
    llm "How could I split a PDF by page range?" --template linux
    ```

2. **Whole-repository Q&A** in combination with [repomix](https://github.com/yamadashy/repomix)

    For this one, you'll need `repomix`, which you can install globally with [Node](https://nodejs.org/en/download):

    ```bash
    npm install -g repomix
    ```

    The `repomix` command will pack the entire current directory (excluding hidden and untracked files) into a `repomix-output.xml` file designed for LLM consumption.

    ```bash
    repomix --include "*.sh,README.md"  # Optionally filter with --include and a glob
    repomix --remote https://github.com/boxabirds/awesome-hooks  # Or pack a remote repository
    ```

    You can then pass the contents of the `repomix-output.xml` file to `llm` with the `-f` flag to ask questions about the repository:

    ```bash
    llm -f repomix-output.xml "What awesome-hooks are currently available?"
    ```

    I often request implementation plans from multiple models and append them to a file for comparison:

    ```bash
    cat repomix-output.xml | llm -m deepseek-reasoner "Write a step-by-step implementation plan to add a user profile page." >> plans.md
    ```

    I then review the plans and implement the best one.

3. **Progress reporting** in combination with `git log`

    Say the last time you updated a client was June 1st, and you need to report on your progress since then. You can use [git](https://git-scm.com/downloads) to get the list of commits since then, and then pipe the output to `llm` and have it generate a progress report:

    ```bash
    git log --since="2025-06-01" | llm "In visual markdown, prepare a timeline of development during this period, including stages of work and milestones."
    ```

    You can then provide this timeline to your client in a progress report.

4. **Data extraction** with structured outputs

    You can use the `--schema` option to specify a schema for JSON output. For instance, here's how we can extract structured information about a Github user from their profile page using [curl](https://curl.se/docs/gettingstarted.html) and [strip-tags](https://github.com/simonw/strip-tags):

    ```bash
    curl -o- https://github.com/chriscarrollsmith | strip-tags --minify | llm --schema "followers int, following int, tech_stack string"
    ```

## Hackathon ideas

It's possible to do some pretty ambitious stuff with `llm` if you use it in a Bash script. Here's [an example](https://github.com/chriscarrollsmith/github_repo_classifier) of how I used `llm` in a Bash loop to find underrated Github repositories.

**But!** We've only got an hour, so I suggest you focus on coming up with a proof of concept and a pitch for how to scale the idea.

Here are some suggestions:

1. **Give `llm` a Python tool**

    One of the cool things you can do with `llm` is [give it Python functions](https://llm.datasette.io/en/stable/tools.html) that it can call. I haven't experimented with this yet myself, but there's all kinds of potential here.

2. **Embed some personal files for semantic search**

    You could try using `llm`'s [`embed` and `similar` commands](https://llm.datasette.io/en/stable/embeddings/index.html) to embed some personal files and make them fuzzy-searchable.

3. **Chat with a local model**

    The `llm` tool supports chatting with local models, such as those installed with llama.cpp or ollama. See more [in the documentation here](https://llm.datasette.io/en/stable/plugins/directory.html#local-models).

4. **Add captions to your photos with a vision model**

    If you select a vision model, you can pass a [file attachment](https://llm.datasette.io/en/stable/usage.html#attachments) with the `-a` flag:

    ```bash
    llm "Generate a caption for this image" -a image1.jpg
    ```

    Try chaining this with other commands to actually add the caption as file metadata.

5. **Combine `llm` with your favorite command-line tool**

    Generate `nix` build scripts. Manipulate structured JSON outputs with `jq`. Open pull requests with `gh`. Think about stuff you already do from the command line, and see if you can use `llm` to do it better!
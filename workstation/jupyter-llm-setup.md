# ABOUTME: This file explains how to set up a developer workstation with Jupyter notebooks and the llm CLI tool.
# ABOUTME: It is a step-by-step tutorial.

# Developer Workstation Setup: Jupyter + LLM CLI for Iterative Software Development

This guide walks you through setting up a local development environment that combines **Jupyter Notebooks** with **Simon Willison’s `llm` CLI tool**, enabling interactive, notebook-driven software development using local or remote LLMs.

---

## Prerequisites

- Python 3.8+
- `pip` or `pipx`
- Git
- JupyterLab or Jupyter Notebook
- A supported LLM backend (e.g. OpenAI, Claude, etc.)

---

## 1. Install the `llm` CLI Tool

Simon Willison’s `llm` is a command-line interface for interacting with language models.

### Option A: Install via `pipx` (recommended)

```bash
pipx install llm
```

### Option B: Install via `pip`

```bash
pip install llm
```

---

## 2. Configure LLM Backend

Choose and configure a backend. For example, to use OpenAI:

```bash
llm keys set openai sk-...
```

To use Claude via Anthropic:

```bash
llm keys set anthropic sk-ant-...
```

You can verify your setup with:

```bash
llm "What is the capital of France?"
```

---

## 3. Install Jupyter and Required Extensions

If you don’t have Jupyter installed:

```bash
pip install jupyterlab
```

Optional: Install Jupyter extensions for better UX

```bash
pip install jupyterlab_vim
jupyter labextension install @axlair/jupyterlab_vim
```

---

## 4. Create a Workspace Directory

```bash
mkdir llm-notebooks
cd llm-notebooks
```

---

## 4.5 Launch JupyterLab

Once installed, launch the JupyterLab interface:

```bash
jupyter-lab
```

---

## 5. Create a Notebook Template

Create a new notebook file, e.g. `llm_dev.ipynb`, and include the following starter cells:

```python
# Cell 1: Setup
import subprocess

def llm_query(prompt):
    result = subprocess.run(
        ["llm", prompt],
        capture_output=True,
        text=True
    )
    print(result.stdout)
```

```python
# Cell 2: Example Usage
llm_query("Write a Python function that parses a CSV file and returns a list of dictionaries.")
```

---

## 6. Iterative Development Workflow

Use the notebook to:

1. **Prototype ideas**: Ask LLM to generate code snippets.
2. **Test and refine**: Run code directly in cells, tweak as needed.
3. **Document decisions**: Use Markdown cells to capture reasoning and alternatives.
4. **Version control**: Use Git to track changes and commit frequently.

---

## 7. Optional: Enhance with `llm` Plugins

Explore plugins like:

- `llm-mistral`
- `llm-gpt4all`
- `llm-cmd`
- `llm-jupyter` (if available)

Install with:

```bash
llm install llm-mistral
```

---

## 8. Tips

- Use `llm --help` to explore available commands.
- Use `llm -m model-name "your prompt"` to specify models.
- Store reusable prompts in `.llm` files and call them with `llm -f my_prompt.llm`.

---

## 9. Resources

- https://github.com/simonw/llm
- https://jupyterlab.readthedocs.io/
- https://pypa.github.io/pipx/

---

## 10. Next Steps

- Integrate with your existing Python projects.
- Explore using `llm` for code review, refactoring suggestions, or generating tests.
- Consider wrapping `llm` calls in custom Python functions for more control.

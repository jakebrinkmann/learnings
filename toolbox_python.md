# [Marimo: next-generation Python notebook](https://marimo.io/)

```python
"""
poetry add marimo
poetry run marimo tutorial intro
poetry run marimo edit your_notebook.py
"""

import marimo as mo
app = mo.App()

@app.cell
def __(mo):
    mo.md("# Statistics 📊🔬")
    return
```

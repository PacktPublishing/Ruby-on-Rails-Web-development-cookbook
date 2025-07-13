# Ruby on Rails Cookbook

This repository contains all code examples from the **Rails Cookbook**. Each example is tied to a recipe in the book and is organized by chapter and recipe number.

## 📚 Repository Structure

```bash
├── Chapter01
│   └── recipe-2
│       ├── begin
│       └── end
├── Chapter02
│   ├── recipe-5
│   ├── recipe-6
│   └── ...
├── Chapter03
│   └── recipe-8
├── ...
```

- `ChapterXX/recipe-N/` — Contains the source code for **Recipe N** in Chapter XX.
- Each `recipe-N` folder contains two subfolders:

  - `begin/`: Starting state before the recipe is applied
  - `end/`: Final state after following the steps in the recipe

Each recipe folder also includes its own `README.md` with setup instructions and comparison tips.

## 🚀 Getting Started

1. Clone the repository:

   ```bash
   git clone https://github.com/PacktPublishing/Ruby-on-Rails-Web-development-cookbook.git
   cd rails-cookbook-code
   ```

2. Navigate to the recipe you want to try, for example:

   ```bash
   cd Chapter02/recipe-6/begin
   ```

3. Follow the instructions in the local `README.md` file inside the `recipe-N` folder to run the app.

## 🧪 Comparing `begin` and `end`

Each recipe demonstrates the full change in code. To compare before/after:

```bash
diff -r begin/ end/
```

Or visually (if using VS Code):

```bash
code --diff begin end
```

## 💬 Feedback

Found an issue or have feedback? Please [open an issue](https://github.com/PacktPublishing/Ruby-on-Rails-Web-development-cookbook/issues) or send a pull request.

---

© \[2025] \[Rizwan Reza]. All rights reserved.

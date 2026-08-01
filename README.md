# Interest Lab

一个用于兴趣探索、记录想法和保存小型实验的本地开发工作区。

## 目录

- `experiments/`：每个想法或原型一个子目录
- `notes/`：调研笔记、链接和结论
- `scripts/`：通用的本地辅助脚本
- `.env.example`：可安全提交的参数模板
- `.env`：仅保存在本机的实际参数，不提交到 Git

## 开始使用

```powershell
Copy-Item .env.example .env
powershell -ExecutionPolicy Bypass -File .\scripts\check-env.ps1
```

新实验建议放在 `experiments/<日期>-<主题>/`，并附一个简短 README，记录目标、过程和结论。

## 常用 Git 操作

```powershell
git pull --rebase
git add .
git commit -m "描述本次修改"
git push
```

敏感信息只放在 `.env` 中。提交前可用 `git status` 确认 `.env` 没有被跟踪。

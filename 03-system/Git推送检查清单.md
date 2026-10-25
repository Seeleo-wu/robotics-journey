# Git 推送检查清单（robotics-journey）

仓库：https://github.com/Seeleo-wu/robotics-journey.git　分支：`main`　本地路径：`D:\~LeoWu\robotics-journey`
笔记源头：`D:\~LeoWu\学习资料`

---

## 一、四条命令（都在 Git Bash 里跑，**不要**在 WSL 里跑）

```bash
cd /d/~LeoWu/robotics-journey && bash sync.sh   # 把 学习资料 的 .md 拷进仓库
git status                                      # 先看要提交什么（必做）
git add .
git commit -m "一句话说清这次改了什么"
git push
```

**sync.sh 的映射关系**（只拷 `.md`，非 .md 一律不进仓库）

| 源头（学习资料） | 仓库里 |
|---|---|
| `01-日志` | `00-log/` |
| `02-机械`（含 W01 / 干涉检查练习 / motion分析 / Simulation / AI生成减速箱） | `01-mechanical/` |
| `03-软件`（含 Keyshot） | `02-software/` |
| `04-系统` | `03-system/` |
| `07-项目` | `04-projects/` |
| `00-总纲` / `06-美赛` | **不推**（私人规划 / 竞赛资料） |

---

## 二、推之前的三项自检

1. **今天的日志写了吗**？`01-日志/YYYY-MM-DD.md` 存在，且 `00-索引.md` 加了新行。
2. **笔记里的错误改了吗**？已知待改：`02-机械/W01/干涉检查回答.md` 的结论"配合面重叠"应改成"真撞（凸台未避让）"。
3. **大文件没混进来吗**？`.gitignore` 已拦 `*.pptx *.ppt *.zip *.rar *.SLDPRT *.SLDASM *.stp *.step *.stl *.xlsx *.pdf *.mp4`，
   以及 LaTeX 中间产物（`*.aux *.log *.out *.toc *.synctex.gz *.fls *.fdb_latexmk`）。sync.sh 又只拷 `.md`，正常不会出问题。

**想确认仓库没变胖**：`git ls-files | wc -l` 看文件数，`du -sh .git` 看历史体积。

---

## 三、常见报错对照表（都踩过）

| 报错 | 真正的原因 | 解决 |
|---|---|---|
| `Repository not found` | 仓库地址里的用户名打错（曾把 `2681292056-eng` 写成 `2681282056-eng`） | 回 GitHub 点绿色 **Code** 按钮复制地址，别手打 |
| `src refspec main does not match any` | 本地一次 commit 都没有 | 先 `git add .` + `git commit`，再 push |
| `Connection closed by 127.0.0.1 port 443` | 加速器把 GitHub 域名写进 hosts 指到 127.0.0.1 | 关掉那个加速，改用 HTTPS + Git Credential Manager 登录 |
| 提示里出现 `E[200~` 与 command not found | 一次粘了多行（括号粘贴模式） | **一次粘一行**，Git Bash 里用右键 Paste 而不是 Ctrl+V |
| `fatal: not a git repository` | 当前目录不对 | 先 `cd /d/~LeoWu/robotics-journey` |
| 推完 GitHub 上看不到新文件 | sync.sh 没跑（新笔记还在 学习资料 里） | 补跑 `bash sync.sh`，再 add / commit / push |

> 路径一律写 `/d/~LeoWu/...`（带盘符斜杠），Git Bash 不认 `D:\~LeoWu\...` 这种写法。
> `~LeoWu` 这个目录名**开头真的是一个波浪号**，不是"用户目录"的意思。

---

## 四、2026-10-25 这次要推的内容（预判，以 `git status` 为准）

| 文件 | 状态 |
|---|---|
| `00-log/2026-10-25.md` | 新增 |
| `00-log/00-索引.md` | 修改（加了 10-25 一行） |
| `02-software/2026-10-25-ROS2闭环节点go_to_goal.md` | 新增 |
| `02-software/2026-10-25-KeyShot-D2材质.md` | 新增 |
| `03-system/Git推送检查清单.md` | 新增 |

**先看再 add**，这条习惯比快重要。
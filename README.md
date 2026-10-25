# robotics-journey

从机械走向具身智能的学习记录。

机械设计（SolidWorks / 公差 / 传动）× 机器人软件（Linux / ROS2）× 具身算法。
目标不是成为纯算法研究者，是成为**能把机械和算法接起来的那个人**。

---

## 目录

| 目录 | 内容 |
|---|---|
| `00-log/` | 每日学习日志，一天一篇，只记"做了什么 / 学到什么 / 卡在哪" |
| `01-mechanical/` | 机械设计：公差配合、传动选型、装配体分析、概念卡 |
| `02-software/` | Linux、ROS2、Python、仿真 |
| `03-system/` | 环境配置与踩坑记录（WSL / Ubuntu / 工具链 / Git 推送） |
| `04-projects/` | 学校项目与竞赛记录 |
| `docs-目录说明.md` | 本地学习资料的目录规范 |

---

## 进度

| 日期 | 内容 | 产出 |
|---|---|---|
| 2026-10-19 | Git / GitHub 全链路打通 | 第一次 push |
| 2026-10-20 | WSL2 + Ubuntu 24.04.5 装好（D 盘）；机械线开工 | [WSL 踩坑](03-system/2026-10-20-WSL安装踩坑.md)、[指甲钳逆向分析](01-mechanical/W01/W01_尺寸反推.md) |
| 2026-10-21 | ROS2 Jazzy 装好，turtlesim 跑通；龙门架干涉检查修复 | [ROS2 笔记](02-software/2026-10-21-ROS2安装与turtlesim.md)、[干涉检查总结](01-mechanical/W01/干涉检查总结.md) |
| 2026-10-22 | KeyShot 第一张成品图；Simulation 悬臂梁基准算例（位移 0.7538 mm / 应力 119.4 MPa，与手算误差 <1.5%）；仓库重组 | [KeyShot 路线](02-software/2026-10-22-KeyShot入门路线.md)、[悬臂梁算例](01-mechanical/2026-10-22-悬臂梁基准算例.md)、[曲柄滑块 Motion](01-mechanical/W01/2026-10-22-曲柄滑块Motion小结.md) |
| 2026-10-23 | ROS2 发布者逐行精读 + OOP 补课；AI 驱动 SolidWorks 造出减速箱；美赛 D1 | [发布者精读](02-software/2026-10-23-ROS2发布者精读与OOP.md)、[AI 生成减速箱](01-mechanical/2026-10-23-AI生成减速箱.md) |
| 2026-10-24 | LaTeX 首次编译成功；美赛推进；工程创客项目面试 | [工程创客面试](04-projects/2026-10-24-工程创客面试-柔顺双臂移动智能机器人.md) |
| 2026-10-25 | ROS2 闭环跑通：乌龟自己走到 (10, 10)；KeyShot D2 材质 | [闭环节点笔记](02-software/2026-10-25-ROS2闭环节点go_to_goal.md)、[KeyShot D2](02-software/2026-10-25-KeyShot-D2材质.md) |

---

## 已经能做的事

**机械**
- SolidWorks 独立走完「机构方案 → 三维建模 → 装配 → 出图」
- 装配体干涉检查与根因分析（体积 → 毫米深度换算，判断真撞还是面重合）
- 公差配合、传动选型（在学）

**软件**
- Ubuntu 24.04 + WSL2 日常使用，apt / 换源 / 权限
- ROS2 Jazzy：节点、话题、turtlesim，理解发布-订阅模型
- Git / GitHub 基本工作流

**在学**
- Simulation 静力分析（目标：能对上手算结果）
- Motion 运动算例
- 机器人运动学（FK / IK）

---

## 技术栈

```
机械    SolidWorks 2026 · AutoCAD · NX 2506
系统    Windows 11 + WSL2 (Ubuntu 24.04.5)
机器人  ROS2 Jazzy
编程    C / C++ / Python（基础）
工具    Git · VS Code (Remote-WSL)
```

---

## 说明

- 仓库里**不放**培训 PPT、SolidWorks 模型、PDF 等大文件（见 `.gitignore`）
- 笔记以"能看懂、能复现"为标准，不追求排版
- 每个技术结论尽量附上**数据或出处**，而不是"我觉得"

# Python 补课计划（4 晚）

起因：2026-10-22 写 ROS2 第一个节点时发现，会 `import` 但不会 `class`。
目标：4 个晚上之后，能逐行读懂 `turtle_spin.py`，并自己改出变体。

---

## 一、缺口诊断（不要多补，也不要少补）

那份 34 行代码一共只用 5 类知识：

| 知识点 | 现在的水平 | 缺口大小 |
|---|---|---|
| 变量、数字、字符串 | 会 | 0 |
| `import` / `from ... import` | 会 | 0 |
| 函数 `def` / 参数 / return | 大概会 | 小 |
| **类 `class` / `__init__` / `self`** | **不会** | **中（主要缺口）** |
| `try` / `except` 异常处理 | 不会 | 小 |
| `A if 条件 else B` 三元表达式 | 不会 | 极小（5 分钟） |

**结论：真正的缺口只有三样 —— 类、异常、语法糖。约 4 个晚上。**

**不需要补的**：装饰器、生成器、多线程、异步、元类、正则、虚拟环境管理。
这些以后遇到了现学现用，不提前学。

---

## 二、四个晚上

### 晚上 1 · 函数

**知识点**：def、参数、默认参数、return、作用域

**练习（用自己手算过的悬臂梁，不用另找题目）**

```python
def deflection(F, L, E, I):
    return F * L**3 / (3 * E * I)

I = 20 * 5**3 / 12          # 惯性矩 = b*h^3/12
print(I)                     # 208.33
print(deflection(100, 100, 210000, I))   # 0.762
```

**看片**：搜 `Corey Schafer Python Functions`

### 晚上 2 · 类与对象（最重要的一晚）

**知识点**：class、__init__、self、属性、方法、实例化

**练习：把悬臂梁写成一个类**

```python
class Beam:
    def __init__(self, E, L, b, h):
        self.E = E
        self.L = L
        self.h = h
        self.I = b * h**3 / 12        # 惯性矩，初始化时算好

    def deflection(self, F):
        return F * self.L**3 / (3 * self.E * self.I)

    def stress(self, F):
        return F * self.L * (self.h / 2) / self.I


b = Beam(E=210000, L=100, b=20, h=5)
print(b.deflection(100))    # 0.762
print(b.stress(100))        # 120.0
```

**这一晚的关键领悟**

```
self.pub（ROS2 里）和 self.I（悬臂梁里）是同一件事：
都是「存到自己身上的东西」，之后自己的方法里能直接用。
```

**看片**：搜 `Corey Schafer Python OOP Tutorial`，只看第 1 集 Classes and Instances。

### 晚上 3 · 模块化

**知识点**：import、from ... import、__name__ == '__main__'、自己写文件互相 import

**练习：把 Beam 类单独存成 beam.py，另一个文件 import 它来用**

**看片**

- 搜 `Corey Schafer Python Modules`
- 搜 `Corey Schafer if __name__ == '__main__'`

### 晚上 4 · 异常与语法糖

**知识点**：try / except / finally、三元表达式、列表推导、with open 读文件

**练习：读一个文件，处理「文件不存在」的情况；再把一段简单 if/else 改写成三元表达式**

**看片**：搜 `Corey Schafer Python Try Except`

---

## 三、看片单（YouTube）

**主推：Corey Schafer**

他的风格：一个视频一个主题，10-20 分钟，边讲边敲，讲「为什么」不只讲「怎么写」。
可以按需看，不用顺序追。

**备选**

| 资源 | 特点 | 什么时候用 |
|---|---|---|
| freeCodeCamp：Learn Python - Full Course for Beginners | 4.5 小时一口气讲完基础语法 | 想快速过一遍语法全貌 |
| Programming with Mosh：Python Tutorial for Beginners | 6 小时，语速慢、板书清楚 | 完全零基础想被手把手带 |
| Harvard CS50P | 有作业和自动判题 | 想扎实、愿意花时间 |

**中文备选**

| 资源 | 在哪 |
|---|---|
| 黑马程序员 Python 入门教程 | B站（很长，挑着看） |
| 尚硅谷 Python | B站 |
| 廖雪峰 Python 教程 | liaoxuefeng.com（文字版，查语法最方便） |

**英文视频开中文字幕**：YouTube 右下角齿轮 → 字幕 → 自动翻译 → 中文（简体）。
顺便练英语听力，和每天的英语时间合并。

---

## 四、学习方法（三条）

**① 问题驱动，不要顺序啃**

```
❌ 从「安装 Python」看到「生成器」，看完全忘
✅ 今天看不懂 class → 只学「类」 → 回来读 turtle_spin.py
   明天看不懂 try/except → 只学异常 → 回来再读一遍
```

**② 用自己懂的东西当练习题目**

| 题目 | 来自哪里 |
|---|---|
| 悬臂梁挠度与应力 | 2026-10-22 手算过（0.762 / 120） |
| 齿轮传动比 | 战队培训学过 |
| 干涉余量换算 | 2026-10-21 做过 |
| 曲柄滑块行程 | 2026-10-22 做过（100 mm） |

**用懂的东西当题目，只需专注语法，不用同时理解物理。**

**③ 每个知识点都要有可验证的输出**

每写完一段，都要能预测输出、然后跑一次对答案。
和 Simulation 算例对答案是一个道理。

---

## 五、完成标志

```
□ 能不看注释，把 turtle_spin.py 从头到尾讲一遍
□ 能自己改：把转速改成 30 RPM，把 S 形改成 8 字形
□ 能写一个 20-30 行的类，解决一个机械计算问题
```

**达成这三条，就可以回到 ROS2 主线继续了。**

---

## 六、时间安排

软件线时段：周一 / 周二 / 周四 20:00 – 21:30（每周 4.5 小时）
每个晚上用其中一段（45-60 分钟）做上面一课。

**这 4 个晚上，ROS2 只做「重复运行已有例子」，不写新代码。**
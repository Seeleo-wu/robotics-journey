# ROS2 闭环节点：让乌龟自己走到指定点

日期：2026-10-25
对象代码：`/home/seeleo/ros2_ws/src/go_to_goal.py`（53 行，1686 字节）
上一课：`2026-10-23-ROS2发布者精读与OOP.md`（那课是只会发命令的节点，这课是又会看又会动的节点）

---

## 一、这一课在路线里的位置

| 阶段 | 节点 | 能力 |
|---|---|---|
| M1 发布者 | `turtle_spin.py` | 只会发命令（开环） |
| M1 订阅者 | `pose_watcher.py` | 只会看（只读） |
| **M2 闭环** | **`go_to_goal.py`** | **既看又动：订阅 pose → 算 → 发 cmd_vel** |

闭环 = 观察 → 决策 → 动作 → 再观察。机器人学里写成一排：**obs → policy → action**。
turtlesim 天生就是这个结构：`/turtle1/pose` 是 obs，`/turtle1/cmd_vel` 是 action，写节点的人只需要补中间那段 policy。

---

## 二、算法（三行核心）

```python
self.distance = math.hypot(self.goal_x - msg.x, self.goal_y - msg.y)          # 还有多远
self.angle    = math.atan2(self.goal_y - msg.y, self.goal_x - msg.x)          # 目标在哪个方向
self.diff     = (self.angle - msg.theta + math.pi) % (2*math.pi) - math.pi    # 我的朝向差多少
```

第三条是**角度归一化**：`theta` 和 `angle` 各自都在 -π~π，直接相减可能得到 ±2π 级别的假差值，
先加 π、对 2π 取余、再减 π，就把它折进 -π~π。这是 ROS2 / 机器人代码里出现率最高的三行之一。

三条分支（互斥）：

| 条件 | linear.x | angular.z | 行为 |
|---|---|---|---|
| `abs(diff) > 0.1` | 0 | `2.0 * diff` | 原地转 |
| `distance > 0.1` 且 `abs(diff) <= 0.1` | `0.5 * distance` | 0 | 直走 |
| `distance <= 0.1` | 0 | 0 | 停 |

两处 `增益 × 误差` 就是**比例控制（P 控制）**：输出与误差成正比，误差越大动作越大。
这是控制里最古老也最常用的形式，后面学的 PID 只是给它加了 I（消残差）和 D（防过冲）。

---

## 三、日志证据：为什么说闭环真的成立了

跑的参数：起点 (5.5444, 5.5444)，目标 (10.0, 10.0)。日志每 0.5 s 一行（`throttle_duration_sec=0.5`）。

| 阶段 | 日志读数 | 说明了什么 |
|---|---|---|
| 原地转 | `x=5.08 y=5.06` 连打三行，`theta` = -2.45 → 1.62 → 1.00 | 位置**冻结**在 5.08/5.06 → 确认 `linear.x` 真的是 0，先把头转过去 |
| 直走 | `theta ≈ 0.86`，且相邻两点的位移方向 ≈ theta | `atan2(10-5.06, 10-5.08) = 0.785`（45°），说明确实转到位了 |
| 收敛 | `x=9.91 y=9.96` 之后纹丝不动 | `distance = hypot(0.09, 0.04) = 0.098 < 0.1` → 触发停止分支 |

**速度核对**（证明比例控制生效）：位置 (5.34, 5.35) 时 distance = hypot(4.66, 4.65) = 6.58，
理论 `linear.x = 0.5 × 6.58 = 3.29`；实测相邻两点位移 1.56 / 0.512 s = **3.05**。对得上（差的那部分见下节）。

---

## 四、两个死区（deadband）的代价

`> 0.1` 这种判断叫死区：误差小于阈值就不动作。它换来「不抖」，但代价有两处：

1. **角度死区 0.1 rad**：直走时方向会慢慢偏（因为这条直线并不指向目标），一旦 `abs(diff)` 超过 0.1 就退回分支一原地转。
   所以真实轨迹是「走一段 → 停下转 → 再走」的**折线**，不是光滑曲线；实测每 0.5 s 位移比理论值小约 30%，就是这些停顿吃掉的。
2. **距离死区 0.1**：乌龟停在离目标 0.098 的地方，**永远到不了 0**。

想更顺：不要二选一，把两条分支合并成一个控制器——`linear.x = k1 * distance` 与 `angular.z = k2 * diff` 同时给，边走边修方向。

---

## 五、本次踩的两个坑（最值钱的部分）

**坑 1：`_init_` 少了下划线**

```
TypeError: Node.__init__() missing 1 required positional argument: 'node_name'
```

Python 只认前后各**两个**下划线的 `__init__`。写成 `_init_` 之后它只是个普通方法，
`GoToGoal()` 找不到自己的构造方法，就退回调用父类 `Node.__init__()`，而那个方法必填 `node_name`，当场崩。
连带 `super().__init__('go_to_goal')` 那行永远执行不到，`self.sub` / `self.pub` 也从未被创建。

> 为什么会抄错：`__init__` 写在普通文本里会被 Markdown 渲染成**粗体 init**，两边下划线被吃掉。
> 结论：代码一律从代码块里复制，别从正文里抄。

**坑 2：改完没按 Ctrl+S**

现象：嘴上说改好了，跑起来报的还是同一个老错。取证两条命令：

```bash
stat -c '%n %s bytes %y' ~/ros2_ws/src/go_to_goal.py   # 字节数 1640、修改时间 20:28:04 —— 一点没变
grep -n 'def ' ~/ros2_ws/src/go_to_goal.py             # 第 8 行还是 _init_
```

**自检口诀：改完先 `grep` 一眼自己改的那行长什么样，再按运行。**
另外 VS Code 有本地历史：右键文件 → **Open Timeline**，能翻出每一次保存的版本（本次靠它复原出下面 4 个版本）。

| 保存时间 | 字节 | 关键差异 |
|---|---|---|
| 20:28:04 | 1640 | `_init_`；三条分支 `linear.x` 全是 0；增益 4.0 → 必定 TypeError |
| 20:59:32 | 1684 | `__init__` 修好；增益降 2.0；直行改 `0.5 * distance`；日志加 throttle 0.5 s |
| 21:01:07 | 1686 | 目标点改 (10, 10) —— **就是跑通的那一版** |
| 21:02:36 | 1682 | 目标点改 (0, -15)（在场地外，用来试「够不到的目标」） |

**能跑的那一版（21:01:07 保存）**

```python
import rclpy
from rclpy.node import Node
from turtlesim.msg import Pose
from geometry_msgs.msg import Twist
import math

class GoToGoal(Node):
    def __init__(self):
        super().__init__('go_to_goal')
        self.sub = self.create_subscription(
            Pose,
            'turtle1/pose',
            self.on_pose,
            10)
        self.pub = self.create_publisher(Twist, '/turtle1/cmd_vel', 10)

    def on_pose(self, msg):
        self.goal_x = 10.0
        self.goal_y = 10.0
        self.distance = math.hypot(self.goal_x - msg.x, self.goal_y - msg.y)
        self.angle = math.atan2(self.goal_y - msg.y, self.goal_x - msg.x)
        self.diff = self.angle - msg.theta
        self.diff = (self.diff + math.pi) % (2*math.pi) - math.pi  # 归一化到 -pi~pi
        self.get_logger().info(
            f'x={msg.x:.2f}, y={msg.y:.2f}, theta={msg.theta:.2f}', throttle_duration_sec=0.5)
        if self.distance > 0.1:
            if math.fabs(self.diff) > 0.1:
                vel_msg = Twist()
                vel_msg.linear.x = 0.0
                vel_msg.angular.z = 2.0 * self.diff
                self.pub.publish(vel_msg)
            else:
                vel_msg = Twist()
                vel_msg.linear.x = 0.5 * self.distance
                vel_msg.angular.z = 0.0
                self.pub.publish(vel_msg)
        else:
            vel_msg = Twist()
            vel_msg.linear.x = 0.0
            vel_msg.angular.z = 0.0
            self.pub.publish(vel_msg)

def main():
    rclpy.init()
    node = GoToGoal()
    try:
        rclpy.spin(node)
    except KeyboardInterrupt:
        pass
    node.destroy_node()
    rclpy.shutdown()

if __name__ == '__main__':
    main()
```

---

## 六、遗留问题 + 下一步

还没做的三件小事：

- 第 18-19 行目标点仍写在回调里，**每帧重设一次** → 应该搬进 `__init__`，只设一次
- 日志只打 x/y/theta，没打 `distance` / `diff` → 调试时看不出「误差在不在收敛」
- 目标 (0, -15) 在场地外（场地只有 0 ~ 11.09）：乌龟会一路撞到左下墙角卡住。
  turtlesim 撞墙后不再前进，而我们的控制器**根本不知道墙的存在**，会一直转到超时

下一课 **M3：参数** —— 把目标点做成 ROS2 参数，`ros2 param set` 就能换目标，不用改代码：

```python
self.declare_parameter('goal_x', 5.0)
self.declare_parameter('goal_y', 5.0)

gx = self.get_parameter('goal_x').value
gy = self.get_parameter('goal_y').value
```
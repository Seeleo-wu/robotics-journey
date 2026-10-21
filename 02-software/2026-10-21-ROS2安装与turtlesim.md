# ROS2 Jazzy 安装与 turtlesim 跑通

日期：2026-10-21

---

## 一、环境

| 项 | 值 |
|---|---|
| WSL | 3.0.3.0 |
| 内核 | 6.18.54.1-microsoft-standard-WSL2 |
| Ubuntu | 24.04.5 LTS（装在 D:\WSL\Ubuntu-24.04） |
| ROS2 | Jazzy，`/opt/ros/jazzy`，250 MB，287 个包 |
| 用户 | seeleo |

---

## 二、安装过程踩的三个坑

### 坑 1：ROS 官方 GPG 密钥已过期

```
W: GPG error: ... EXPKEYSIG F42ED6FBAB17C654 Open Robotics
E: The repository ... is not signed.
```

**原因**：ROS 那把 2019 年签发的密钥过期了，但包还在用它签名。

**处理**：给源加 `trusted=yes` 跳过签名校验（包来自清华镜像，可信）。

```
deb [arch=amd64 trusted=yes] http://mirrors.tuna.tsinghua.edu.cn/ros2/ubuntu noble main
```

### 坑 2：`raw.githubusercontent.com` 连不上

ROS 新密钥托管在 GitHub，被本机 hosts 劫持挡住（curl 超时 20s）。

**绕法**：从 `http://packages.ros.org/ros.key` 直接下（这个地址能通），绕开 GitHub。

### 坑 3：root 跑图形程序报 "could not connect to display"

```
qt.qpa.xcb: could not connect to display
```

**原因**：WSLg 的图形界面只对默认用户开放，root 连不上 X server。

> **规则：WSL 里的 GUI 程序（turtlesim / RViz / Gazebo）必须用普通用户跑，不能 sudo。**

---

## 三、装完的验证

```bash
ros2 pkg list | wc -l     # 287
echo $ROS_DISTRO          # jazzy
```

> 注意：**`ros2 --version` 不存在**，这个参数会报错。

---

## 四、turtlesim 跑通

```bash
# 终端 1
ros2 run turtlesim turtlesim_node
# → 弹出蓝底窗口，一只乌龟，日志：
#   [INFO] [turtlesim]: Spawning turtle [turtle1] at x=[5.544445], y=[5.544445]

# 终端 2
ros2 run turtlesim turtle_teleop_key
# → 按方向键，乌龟动
```

---

## 五、理解：没有函数调用，只有发消息

```bash
ros2 node list
# /turtlesim
# /turtle_teleop_key

ros2 topic list
# /turtle1/cmd_vel       ← 速度命令（往里发，乌龟就动）
# /turtle1/pose          ← 乌龟位置（往外读）
# /turtle1/color_sensor  ← 颜色传感器
```

**两个节点互相不认识**，只通过话题收发消息：

```
按键 → teleop_key → 发到 /turtle1/cmd_vel → turtlesim 收到 → 乌龟动
                                             ↓
                                 发到 /turtle1/pose → 谁订阅谁看得到
```

**最爽的一条验证**（不碰键盘，直接发消息）：

```bash
ros2 topic pub --once /turtle1/cmd_vel geometry_msgs/msg/Twist \
  "{linear: {x: 2.0}, angular: {z: 1.8}}"
```

乌龟自己走弧线。**这就是 ROS2 的全部秘密。**

---

## 六、这套结构对应到真机

| turtlesim | 真机 | 具身智能术语 |
|---|---|---|
| `/turtle1/cmd_vel` | 电机指令 / 关节角度 | **action（动作）** |
| `/turtle1/pose` | 编码器 / IMU | **observation（观测）** |
| `/turtle1/color_sensor` | 相机 / 力传感器 | observation |
| 键盘 | 人 | — |
| （以后）策略网络 | — | **policy** |

**观测 → 策略 → 动作。** 这是具身智能的最小闭环，turtlesim 已经有了。

---

## 七、常用命令速查

```bash
ros2 node list                 # 有哪些节点
ros2 topic list                # 有哪些话题
ros2 topic echo /turtle1/pose  # 实时读某个话题
ros2 topic info /turtle1/cmd_vel
ros2 service list              # 有哪些服务
ros2 run <包名> <节点名>        # 启动一个程序
```

**一个终端 = 一个前台程序。ROS2 是多进程系统，所以永远要开好几个终端。**

```bash
Ctrl + C   # 停掉前台程序，回到提示符
```

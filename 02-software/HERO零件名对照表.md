# HERO.STEP 零件名对照表（GBK 解码）

**为什么会有这个文件**：HERO.STEP 里的中文零件名是 SolidWorks 用 **GBK 字节**直接写进 STEP 的（文件里 11160 个高位字节，没有任何 \X2\ 转义）。KeyShot 按别的编码读，于是在场景树里显示成乱码，比如 `·ÉÆÂµ¼ÂÖ¹Ì¶¨°åFinVer` 其实是 `飞轮导轨固定板FinVer`。

KeyShot 没有"导入编码"这个选项，所以乱码在软件里修不掉。三条出路：
1. **对照表**（本文件）：照着认零件，够用。
2. **重命名**：场景树里右键 Rename，把它常打交道的十几个件改成中文/代号。改完存 .bip，以后都认得。
3. **改源头**：在 SolidWorks 里把零件名改成英文或拼音，重新导 STEP。最彻底，但要动原装配体。

---

共 222 条。

| # | 零件名（解码后） |
|---|---|
| 1 | 0_chassis FinVer |
| 2 | 0_gimble_FinVer |
| 3 | 19mm铝柱FinVer |
| 4 | 19mm铝柱xFinVer |
| 5 | 24-15法兰轴承 |
| 6 | 2mm摩擦轮垫高板FinVer |
| 7 | 2mm陀螺仪垫圈 x12 |
| 8 | 3-6-3垫圈FinVer |
| 9 | 30-6-9导轮 |
| 10 | 3508电机 |
| 11 | 3510去除减速箱FinVer |
| 12 | 5-2-1.5轴承FinVer |
| 13 | 5mm摄像头垫板 x4 |
| 14 | 6020摇臂 1.0FinVer |
| 15 | 6x60-M5塞打螺栓 |
| 16 | 保护壳FinVer |
| 17 | 保险杠铝方管1.3FinVer |
| 18 | 保险杠组FinVer |
| 19 | 壁面管-短款2.1FinVer |
| 20 | 拨盘3508联轴器FinVer |
| 21 | 拨盘装配FinVer |
| 22 | 拨爪爪件-联轴器转接件1.2FinVer |
| 23 | 拨爪爪件FinVer |
| 24 | 裁判系统大弹丸测速模块FinVer |
| 25 | 侧面板FinVer |
| 26 | 侧面保险杠1.0FinVer |
| 27 | 侧装甲板安装板FinVer |
| 28 | 侧装甲板保护板1.1FinVer |
| 29 | 侧装甲板后保护板1.3-shortFFinVer |
| 30 | 侧装甲保护板FinVer |
| 31 | 车骨架FinVer |
| 32 | 车架-轮组安装管 1.0FinVer |
| 33 | 车架-前后大梁 1.0FinVer |
| 34 | 大弹丸发射摩擦轮FinVer |
| 35 | 大发射集成件1.1 8.19FinVer |
| 36 | 大横梁 1.3FinVer_aaa  |
| 37 | 大疆电池座-2017版_开关位置-默认 |
| 38 | 大装甲 |
| 39 | 单发控制板FinVer |
| 40 | 弹仓后壁面1.4.1FFinVer |
| 41 | 弹仓上板2.6FinVer |
| 42 | 弹仓上侧壁面1.5FFinVer |
| 43 | 弹仓中板2.6FinVer |
| 44 | 弹仓中侧壁面1.3FFinVer |
| 45 | 弹舱盖1.5FFinVer |
| 46 | 弹舱下侧壁面1.0FFinVer |
| 47 | 弹舱FinVer |
| 48 | 弹簧合页25-32-13FFinVer |
| 49 | 弹簧合页FinVer |
| 50 | 挡层1.2FinVer |
| 51 | 灯条模块支架-短款 |
| 52 | 底板1.5FinVer |
| 53 | 底板夹板1.5FinVer |
| 54 | 底板夹板B1.5FinVer |
| 55 | 底碳板FinVer |
| 56 | 电池保护盖 1.1FinVer |
| 57 | 电调安装板 1.5FinVer |
| 58 | 电滑环内圈FinVer |
| 59 | 电机安装座1.2FinVer |
| 60 | 电机环-防偏移FinVer |
| 61 | 电刷安装板下板FinVer |
| 62 | 电刷上板FinVer |
| 63 | 电源管理模块安装板FinVer |
| 64 | 垫圈 |
| 65 | 短版灯条模块 |
| 66 | 短链路FinVer |
| 67 | 二版RM2019裁判系统灯条模块LI01 |
| 68 | 法兰轴承3mm垫圈FinVer |
| 69 | 方管末端加强件 1.0FinVer |
| 70 | 方管内衬1.0FinVer |
| 71 | 防卡导轮组FinVer |
| 72 | 防松螺母M4FinVer |
| 73 | 飞坡导轮安装FinVer |
| 74 | 飞坡导轮固定板FinVer |
| 75 | 飞坡转接件proFinVer |
| 76 | 腹轮载板FinVer |
| 77 | 固定上挡边1.1 8.19FinVer |
| 78 | 固定下挡边1.1 8.25 |
| 79 | 拐弯中板1.1FinVer |
| 80 | 合页另一半25-32-13FFinVer |
| 81 | 合页另一半FinVer |
| 82 | 合页一半25-32-13FFinVer |
| 83 | 合页一半FinVer |
| 84 | 横向导轮板FinVer |
| 85 | 横向加强碳板FinVer |
| 86 | 滑环导线顶FinVer |
| 87 | 滑环套FinVer |
| 88 | 活动上挡边1.1 8.19FinVer |
| 89 | 活动下挡边FinVer |
| 90 | 交叉滚子轴承垫FinVer |
| 91 | 交叉滚子轴承座-压紧碳板FinVer |
| 92 | 交叉滚子轴承座FinVer |
| 93 | 交叉滚子轴承FinVer |
| 94 | 镜头上保护板TF |
| 95 | 联轴器 |
| 96 | 轮组电机安装碳板FinVer |
| 97 | 轮组电机尾端碳板FinVer |
| 98 | 轮组压块FinVer |
| 99 | 螺栓M3-8FinVer |
| 100 | 螺栓M4-8FinVer |
| 101 | 螺栓M5-12FinVer |
| 102 | 摩擦轮安装座1.1L 38mmFinVer |
| 103 | 摩擦轮垫高辅助板FinVer |
| 104 | 摩擦轮上部连板 38mmFinVer |
| 105 | 内螺纹关节轴承FinVer |
| 106 | 前装甲板垫高件FinVer |
| 107 | 前装甲保护板FinVer |
| 108 | 入口轴承安装座FinVer |
| 109 | 塞打螺栓D6XM5-15 |
| 110 | 摄像头 |
| 111 | 摄像头固定板1.5 |
| 112 | 摄像头后方保护板 |
| 113 | 摄像头两侧保护罩TF |
| 114 | 摄像头模块HFin |
| 115 | 摄像头前方保护罩 |
| 116 | 摄像头左右固定件 |
| 117 | 输弹定位板1.5FinVer |
| 118 | 碳管8-6-20 |
| 119 | 图传安装板 1.5FinVer |
| 120 | 推力轴承14-6-5 |
| 121 | 陀螺仪 |
| 122 | 外螺纹关节轴承2.1FinVer |
| 123 | 限位、旋转控制总件FinVer |
| 124 | 小孔固定套环1.1FinVer |
| 125 | 小款顶针1.1FinVer |
| 126 | 小款减震器FinVer |
| 127 | 小型转接件2+1FFinVer |
| 128 | 小型转接件2+3FinVer |
| 129 | 新电池装配 |
| 130 | 悬挂三角板FinVer |
| 131 | 悬挂双侧联动杆FinVer |
| 132 | 悬架FinVer |
| 133 | 英雄导轮安装板1.2FinVer |
| 134 | 英雄电源管理电容管理腹板FinVer |
| 135 | 右保护板1.1FinVer |
| 136 | 右手轮组FinVer |
| 137 | 右手麦轮 |
| 138 | 云台侧保护板FinVer |
| 139 | 云台基座保护板1.2FinVer |
| 140 | 云台基座后保护板FinVer |
| 141 | 云台架承力板 短FinVer |
| 142 | 云台架输弹侧板 短FinVer |
| 143 | 云台架输弹中板01 短FinVer |
| 144 | 云台架输弹中板02 短FinVer |
| 145 | 云台架输弹中板03 短FinVer |
| 146 | 云台连杆1.0FinVer |
| 147 | 云台梁 1.1FinVer |
| 148 | 云台梁-上FVFinVer |
| 149 | 云台配合件 1.1FinVer |
| 150 | 云台体pitch轴连接板1.1lFinVer |
| 151 | 云台体pitch轴连接板电机侧1.1lFinVer |
| 152 | 云台体pitch轴连接板电机侧电机垫高板1.1LFinVer |
| 153 | 云台系统安装内衬1.0FinVer |
| 154 | 云台座FinVer |
| 155 | 直角转接2+3 |
| 156 | 直角转接2+3FFinVer |
| 157 | 直角转接3+4 |
| 158 | 直角转接3+4FinVer |
| 159 | 中轴安装板 1.5FinVer |
| 160 | 轴承 686zzFinVer_686zz |
| 161 | 主动轮挡边支撑盘FinVer |
| 162 | 主动轮挡边FinVer |
| 163 | 主控安装转接件-近FinVer |
| 164 | 主控安装转接件-远FinVer |
| 165 | 主控板体积模型（包含线头）（推荐）FinVer |
| 166 | 主控电调保护板 1.5FinVer |
| 167 | 主控后保护板FinVer |
| 168 | 转点件1.0FinVer |
| 169 | 转接件 4孔FinVer |
| 170 | 转接件-3孔 |
| 171 | 转接件-3孔FinVer |
| 172 | 转接件-4孔 |
| 173 | 转接件-4孔FFinVer |
| 174 | 转接件-4孔FinVer |
| 175 | 装甲板安装板&保险杠底板FinVer |
| 176 | 装甲板前保护板 1.2FinVer |
| 177 | 左保护板1.0FinVer |
| 178 | 左手轮组FinVer |
| 179 | 左右悬挂联动转轴FinVer |
| 180 | C620无刷电机调速器 |
| 181 | C620无刷电机调速器FinVer |
| 182 | GB-Cap Head Hexagon Screws-SJTUFinVer_M3*12 |
| 183 | GB-Cap Head Hexagon Screws-SJTUFinVer_M3*25 |
| 184 | GB-Cap Head Hexagon Screws-SJTUFinVer_M3*8 |
| 185 | GB-Cap Head Hexagon Screws-SJTUFinVer_M4*12 |
| 186 | GB-Cap Head Hexagon Screws-SJTUFinVer_M4*20 |
| 187 | GM6020星爪安装FinVer |
| 188 | GM6020星爪FinVer |
| 189 | GM6020中轴-yawFinVer |
| 190 | GM6020中轴FinVer |
| 191 | HERO |
| 192 | M2x8滚花铜柱 |
| 193 | MF126zz法兰轴承12-6-4 |
| 194 | MF126zz法兰轴承12-6-4FinVer |
| 195 | MF63zz法兰轴承6-3-2.5FinVer |
| 196 | NX后保护板1.5FinVer |
| 197 | NX前保护板1.5FinVer |
| 198 | NX上安装板1.5FinVer |
| 199 | NX下安装板1.5FinVer |
| 200 | NX左安装板1.5FinVer |
| 201 | NXFinVer |
| 202 | pitch轴螺母xFinVer |
| 203 | r型紧定螺母 M15x1 |
| 204 | RFID安装板01FinVer |
| 205 | RFID安装板02FinVer |
| 206 | RM2019裁判系统场地交互模块FI01 |
| 207 | RM2019裁判系统电源管理模块PM01 |
| 208 | RM2019裁判系统定位模块UW01FinVer |
| 209 | RM2019裁判系统支撑架AH02 |
| 210 | RM2019裁判系统主控模块MC02 |
| 211 | RM2019裁判系统装甲模块AM12 |
| 212 | RoboMaster 图传模块 VT02 2019 STEPFinVer |
| 213 | RoboMaster GM6020 直流无刷电机FinVer |
| 214 | T5同步轮-主动轮FinVer |
| 215 | T5同步轮FinVer |
| 216 | TB48电池（M100）外观改 |
| 217 | UWB安装 for newFinVer |
| 218 | uwb固定1FinVer |
| 219 | yaw轴电机安装板-交叉滚子轴承系统FinVer |
| 220 | yaw轴基座-交叉滚子轴承FinVer |
| 221 | yaw轴同步轮垫圈FinVer |
| 222 | yaw轴轴承垫圈FinVer |

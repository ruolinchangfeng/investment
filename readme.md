以下是一份详细的Coding Pages部署网格交易网站教程，包含完整代码示例和Mock数据实现：

### 一、前期准备
1. **注册Coding账号**  
   访问[Coding官网](https://coding.net) → 微信扫码注册 → 完成邮箱验证

2. **安装必备工具**  
   ```bash
   # 1. 安装Git
   brew install git  # Mac
   choco install git # Windows

   # 2. 安装Node.js (v18+)
   brew install node # Mac
   ```

---

### 二、创建项目仓库
1. **在Coding新建项目**  
   - 点击右上角「+」→「创建项目」
   - 项目名称：`grid-trading-website`
   - 项目类型：**DevOps项目**
   - 其他选项保持默认 → 点击「完成创建」

2. **启用代码仓库**  
   进入项目 → 左侧菜单「代码仓库」→「创建代码仓库」→ 名称保持默认 → 初始化README文件

---

### 三、本地开发环境搭建
1. **克隆仓库到本地**  
   ```bash
   git clone https://e.coding.net/你的账号/grid-trading-website.git
   cd grid-trading-website
   ```

2. **创建基础文件结构**  
   ```bash
   ├── public/               # 静态资源
   │   ├── favicon.ico
   │   └── mock-data.json    # Mock数据文件
   ├── src/
   │   ├── index.html        # 主页面
   │   ├── styles.css        # 样式
   │   └── app.js            # 业务逻辑
   └── .gitignore            # 忽略文件配置
   ```

3. **安装轻量开发服务器**  
   ```bash
   npm install -g live-server  # 全局安装实时预览工具
   ```

---

### 四、实现网格交易网站核心代码

#### 1. `index.html` - 主页面框架
```html
<!DOCTYPE html>
<html lang="zh-CN">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>智能网格交易助手</title>
  <link rel="stylesheet" href="src/styles.css">
  <link rel="icon" href="public/favicon.ico">
</head>
<body>
  <header>
    <h1>📊 智能网格交易助手</h1>
    <nav>
      <a href="#" class="active">推荐标的</a>
      <a href="#">交易记录</a>
      <a href="#">策略配置</a>
    </nav>
  </header>

  <main>
    <!-- 标的推荐区 -->
    <section id="recommendations">
      <h2>📈 今日推荐网格标的</h2>
      <div class="filters">
        <select id="type-filter">
          <option value="all">全部类型</option>
          <option value="etf">ETF基金</option>
          <option value="convertible">可转债</option>
        </select>
        <input type="text" id="search" placeholder="搜索标的...">
      </div>
      <div class="grid-container" id="targets-grid"></div>
    </section>

    <!-- 交易记录区 -->
    <section id="transactions" style="display:none;">
      <h2>💰 我的交易记录</h2>
      <div class="upload-area">
        <input type="file" id="trade-img" accept="image/*">
        <button onclick="processTradeImage()">解析交易截图</button>
      </div>
      <table id="records-table"></table>
    </section>
  </main>

  <footer>
    <p>© 2023 网格交易助手 | 数据仅供参考，投资有风险</p>
  </footer>

  <script src="src/app.js"></script>
</body>
</html>
```

#### 2. `styles.css` - 样式设计
```css
/* 基础样式 */
body {
  font-family: 'Segoe UI', Tahoma, sans-serif;
  max-width: 1200px;
  margin: 0 auto;
  padding: 20px;
  background-color: #f5f7fa;
  color: #333;
}

header {
  background: linear-gradient(135deg, #1e5799 0%,#207cca 100%);
  color: white;
  padding: 1rem 2rem;
  border-radius: 10px;
  margin-bottom: 2rem;
  display: flex;
  justify-content: space-between;
  align-items: center;
}

nav a {
  color: rgba(255,255,255,0.8);
  margin-left: 1.5rem;
  text-decoration: none;
  padding: 5px 10px;
  border-radius: 5px;
  transition: all 0.3s;
}

nav a.active, nav a:hover {
  background: rgba(255,255,255,0.2);
  color: white;
}

/* 标的卡片样式 */
.grid-container {
  display: grid;
  grid-template-columns: repeat(auto-fill, minmax(280px, 1fr));
  gap: 20px;
}

.target-card {
  background: white;
  border-radius: 10px;
  box-shadow: 0 4px 12px rgba(0,0,0,0.08);
  padding: 20px;
  transition: transform 0.3s;
}

.target-card:hover {
  transform: translateY(-5px);
  box-shadow: 0 8px 16px rgba(0,0,0,0.1);
}

.target-card h3 {
  margin-top: 0;
  color: #1e5799;
  border-bottom: 1px solid #eee;
  padding-bottom: 10px;
}

.metrics span {
  display: inline-block;
  background: #eef5ff;
  padding: 5px 10px;
  border-radius: 20px;
  margin-right: 10px;
  margin-bottom: 10px;
  font-size: 0.9rem;
}

.buy-btn {
  background: #4CAF50;
  color: white;
  border: none;
  padding: 8px 15px;
  border-radius: 5px;
  cursor: pointer;
  font-weight: bold;
  width: 100%;
  margin-top: 10px;
  transition: background 0.3s;
}

.buy-btn:hover {
  background: #388E3C;
}

/* 响应式设计 */
@media (max-width: 768px) {
  header {
    flex-direction: column;
    text-align: center;
  }
  
  nav {
    margin-top: 1rem;
  }
  
  .grid-container {
    grid-template-columns: 1fr;
  }
}
```

#### 3. `app.js` - 逻辑与Mock数据
```javascript
// Mock数据 - 推荐标的
const mockTargets = [
  {
    id: 1,
    symbol: "113657.SH",
    name: "齐鲁转债",
    type: "convertible",
    price: 115.20,
    amplitude: 1.8,
    pe: 12.5,
    yield: 18.2,
    desc: "AA+评级，正股估值低位波动适中"
  },
  {
    id: 2,
    symbol: "03012.HK",
    name: "东方香港科技ETF",
    type: "etf",
    price: 15.62,
    amplitude: 2.1,
    pe: 28.7,
    yield: 22.5,
    desc: "港股科技龙头，高波动性标的"
  },
  {
    id: 3,
    symbol: "512000.SH",
    name: "券商ETF",
    type: "etf",
    price: 0.865,
    amplitude: 3.2,
    pe: 14.8,
    yield: 25.3,
    desc: "高波动周期品种，网格交易经典标的"
  },
  {
    id: 4,
    symbol: "511260.SH",
    name: "十年国债ETF",
    type: "etf",
    price: 131.45,
    amplitude: 0.8,
    pe: null,
    yield: 12.1,
    desc: "低风险稳健型网格标的"
  }
];

// Mock交易记录
const mockTransactions = [
  { id: 1, symbol: "113657.SH", type: "买入", price: 114.85, quantity: 10, time: "2023-06-15 10:23" },
  { id: 2, symbol: "03012.HK", type: "卖出", price: 15.72, quantity: 200, time: "2023-06-15 14:56" }
];

// DOM加载完成后执行
document.addEventListener('DOMContentLoaded', () => {
  renderRecommendations();
  initEventListeners();
});

// 渲染推荐标的
function renderRecommendations() {
  const container = document.getElementById('targets-grid');
  container.innerHTML = '';
  
  mockTargets.forEach(target => {
    const card = document.createElement('div');
    card.className = 'target-card';
    
    card.innerHTML = `
      <h3>${target.name} (${target.symbol})</h3>
      <div class="metrics">
        <span>价格: ¥${target.price}</span>
        <span>波动率: ${target.amplitude}%</span>
        <span>预期收益: ${target.yield}%</span>
        ${target.pe ? `<span>PE: ${target.pe}</span>` : ''}
      </div>
      <p>${target.desc}</p>
      <button class="buy-btn">创建网格策略</button>
    `;
    
    container.appendChild(card);
  });
}

// 初始化事件监听
function initEventListeners() {
  // 导航切换
  document.querySelectorAll('nav a').forEach(link => {
    link.addEventListener('click', function(e) {
      e.preventDefault();
      document.querySelectorAll('nav a').forEach(a => a.classList.remove('active'));
      this.classList.add('active');
      
      document.querySelectorAll('main > section').forEach(section => {
        section.style.display = 'none';
      });
      
      const targetSection = this.textContent.trim();
      if(targetSection === '推荐标的') {
        document.getElementById('recommendations').style.display = 'block';
      } else if(targetSection === '交易记录') {
        document.getElementById('transactions').style.display = 'block';
        renderTransactionTable();
      }
    });
  });
}

// 渲染交易记录表格
function renderTransactionTable() {
  const table = document.getElementById('records-table');
  table.innerHTML = `
    <tr>
      <th>标的代码</th>
      <th>操作</th>
      <th>价格</th>
      <th>数量</th>
      <th>时间</th>
    </tr>
  `;
  
  mockTransactions.forEach(trans => {
    const row = document.createElement('tr');
    row.innerHTML = `
      <td>${trans.symbol}</td>
      <td class="${trans.type === '买入' ? 'buy' : 'sell'}">${trans.type}</td>
      <td>¥${trans.price}</td>
      <td>${trans.quantity}</td>
      <td>${trans.time}</td>
    `;
    table.appendChild(row);
  });
}

// 模拟图片解析功能
function processTradeImage() {
  const fileInput = document.getElementById('trade-img');
  if(fileInput.files.length === 0) {
    alert('请先选择交易截图');
    return;
  }
  
  // 模拟解析过程
  document.querySelector('.upload-area').innerHTML = `<div class="loading">AI解析中...</div>`;
  
  setTimeout(() => {
    // 生成模拟交易记录
    const newTransaction = {
      id: mockTransactions.length + 1,
      symbol: "511260.SH",
      type: Math.random() > 0.5 ? "买入" : "卖出",
      price: (131.20 + Math.random() * 0.5).toFixed(2),
      quantity: Math.floor(Math.random() * 100) + 50,
      time: new Date().toLocaleString('zh-CN')
    };
    
    mockTransactions.push(newTransaction);
    renderTransactionTable();
    
    document.querySelector('.upload-area').innerHTML = `
      <input type="file" id="trade-img" accept="image/*">
      <button onclick="processTradeImage()">解析交易截图</button>
      <div class="success">成功添加1条交易记录</div>
    `;
  }, 2000);
}

// 添加CSS样式到页面
const style = document.createElement('style');
style.textContent = `
  .loading, .success {
    padding: 10px;
    margin-top: 10px;
    border-radius: 5px;
    text-align: center;
  }
  
  .loading {
    background: #e3f2fd;
    color: #0d47a1;
  }
  
  .success {
    background: #e8f5e9;
    color: #2e7d32;
  }
  
  .buy { color: #e53935; font-weight: bold; }
  .sell { color: #388e3c; font-weight: bold; }
  
  .upload-area {
    background: #f5f5f5;
    padding: 20px;
    border-radius: 8px;
    margin-bottom: 20px;
    text-align: center;
  }
`;
document.head.appendChild(style);
```

#### 4. `public/mock-data.json` - 扩展Mock数据
```json
{
  "settings": {
    "riskLevel": "medium",
    "preferredTypes": ["etf", "convertible"]
  },
  "userPortfolio": {
    "totalValue": 128500,
    "dailyProfit": 356.20,
    "holdings": [
      {
        "symbol": "113657.SH",
        "name": "齐鲁转债",
        "quantity": 20,
        "avgPrice": 114.65
      },
      {
        "symbol": "03012.HK",
        "name": "东方香港科技ETF",
        "quantity": 500,
        "avgPrice": 15.20
      }
    ]
  }
}
```

---

### 五、本地测试运行
1. 启动开发服务器：
   ```bash
   live-server --port=8080
   ```
2. 访问 `http://localhost:8080/src/index.html`
3. 测试功能：
   - 切换导航标签
   - 点击"解析交易截图"模拟添加记录
   - 响应式布局检查

---

### 六、部署到Coding Pages
1. **提交代码到仓库**
   ```bash
   git add .
   git commit -m "初始化网格交易网站"
   git push origin main
   ```

2. **开启Pages服务**
   - 进入Coding项目 → 左侧菜单「持续部署」→「静态网站」
   - 点击「创建静态网站」
   - 填写配置：
     ```
     网站名称：grid-trading
     部署来源：代码仓库
     分支：main
     构建目录：/ (根目录)
     入口文件：src/index.html
     ```

3. **启动自动化部署**
   - 保存设置后，系统自动开始部署
   - 等待2-3分钟，状态变为「部署成功」
   - 点击生成的访问链接（形如 `https://xxxx.coding-pages.com`）

---

### 七、高级配置（可选）
1. **自定义域名**
   - 在静态网站设置 →「自定义域名」
   - 添加已备案域名
   - 按提示配置CNAME解析

2. **HTTPS强制跳转**
   ```bash
   # 在仓库根目录添加 _redirects 文件
   echo "/* https://%{host}%{path} 301" > _redirects
   git add _redirects
   git commit -m "启用HTTPS跳转"
   git push origin main
   ```

3. **404页面定制**
   - 在静态网站设置 →「自定义404页面」
   - 输入路径：`/src/index.html`

---

### 八、效果预览与维护
1. **最终效果**：
   - 推荐标的页面：卡片式展示Mock数据
   - 交易记录页面：支持模拟截图解析
   - 响应式布局：适配手机/平板/桌面

2. **后续更新**：
   ```bash
   # 本地修改后提交
   git add .
   git commit -m "更新描述"
   git push origin main
   
   # 自动触发重新部署
   ```

3. **实时监控**：
   - 在Coding Pages控制台查看访问统计
   - 异常时接收邮件/微信通知

> 提示：本教程完全使用前端Mock数据，实际项目中可替换为真实API接口。Coding Pages每月提供免费流量500GB，足够个人项目使用。
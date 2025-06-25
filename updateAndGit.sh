# 更新 data.json 文件（仅保留2条测试数据）
cat > data.json << 'EOF'
[
  {
    "id": 1,
    "name": "浦发转债",
    "code": "110059",
    "rating": "AAA",
    "dailyVol": 1.8,
    "weeklyVol": 4.2,
    "monthlyVol": 12.5,
    "yearlyVol": 26.8,
    "valuation": 35,
    "valuationStatus": "low",
    "valuationText": "估值偏低",
    "yield": 6.8,
    "avgYield": 5.2,
    "basePrice": 105,
    "volatility": 1.5,
    "priceData": [
      {"date": "06-01", "price": 105.2},
      {"date": "06-02", "price": 105.5},
      {"date": "06-03", "price": 104.8},
      {"date": "06-04", "price": 105.7},
      {"date": "06-05", "price": 106.1},
      {"date": "06-06", "price": 105.9},
      {"date": "06-07", "price": 106.3},
      {"date": "06-08", "price": 105.6},
      {"date": "06-09", "price": 104.9},
      {"date": "06-10", "price": 105.3},
      {"date": "06-11", "price": 106.0},
      {"date": "06-12", "price": 106.5},
      {"date": "06-13", "price": 106.2},
      {"date": "06-14", "price": 105.8},
      {"date": "06-15", "price": 106.1},
      {"date": "06-16", "price": 106.7},
      {"date": "06-17", "price": 107.0},
      {"date": "06-18", "price": 106.8},
      {"date": "06-19", "price": 106.4},
      {"date": "06-20", "price": 106.9},
      {"date": "06-21", "price": 107.3},
      {"date": "06-22", "price": 107.1},
      {"date": "06-23", "price": 106.7},
      {"date": "06-24", "price": 107.0},
      {"date": "06-25", "price": 107.5}
    ]
  },
  {
    "id": 2,
    "name": "苏银转债",
    "code": "110053",
    "rating": "AAA",
    "dailyVol": 2.5,
    "weeklyVol": 6.1,
    "monthlyVol": 18.2,
    "yearlyVol": 34.7,
    "valuation": 55,
    "valuationStatus": "mid",
    "valuationText": "估值合理",
    "yield": 7.5,
    "avgYield": 6.1,
    "basePrice": 112,
    "volatility": 2.0,
    "priceData": [
      {"date": "06-01", "price": 112.3},
      {"date": "06-02", "price": 111.8},
      {"date": "06-03", "price": 112.5},
      {"date": "06-04", "price": 113.0},
      {"date": "06-05", "price": 112.7},
      {"date": "06-06", "price": 113.2},
      {"date": "06-07", "price": 112.9},
      {"date": "06-08", "price": 113.5},
      {"date": "06-09", "price": 114.0},
      {"date": "06-10", "price": 113.7},
      {"date": "06-11", "price": 114.2},
      {"date": "06-12", "price": 114.8},
      {"date": "06-13", "price": 114.5},
      {"date": "06-14", "price": 114.0},
      {"date": "06-15", "price": 114.3},
      {"date": "06-16", "price": 113.9},
      {"date": "06-17", "price": 114.5},
      {"date": "06-18", "price": 115.0},
      {"date": "06-19", "price": 115.5},
      {"date": "06-20", "price": 115.2},
      {"date": "06-21", "price": 115.8},
      {"date": "06-22", "price": 116.0},
      {"date": "06-23", "price": 115.7},
      {"date": "06-24", "price": 116.2},
      {"date": "06-25", "price": 116.5}
    ]
  }
]
EOF

# 更新 index.html 文件
cat > index.html << 'EOF'
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>网格交易平台</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/chartjs-plugin-zoom"></script>
    <style>
        :root {
            --primary-color: #2c6fbb;
            --secondary-color: #3498db;
            --success-color: #27ae60;
            --warning-color: #f39c12;
            --danger-color: #e74c3c;
            --light-bg: #f8f9fa;
            --card-shadow: 0 4px 12px rgba(0, 0, 0, 0.08);
        }
        
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(135deg, #f5f9ff 0%, #e6f0ff 100%);
            color: #333;
            padding-top: 20px;
            min-height: 100vh;
        }
        
        .header {
            background: linear-gradient(135deg, var(--primary-color), #1a4d8c);
            color: white;
            border-radius: 15px;
            padding: 20px;
            margin-bottom: 15px;
            box-shadow: var(--card-shadow);
            position: relative;
            overflow: hidden;
        }
        
        .header::before {
            content: "";
            position: absolute;
            top: -50px;
            right: -50px;
            width: 200px;
            height: 200px;
            background: rgba(255, 255, 255, 0.1);
            border-radius: 50%;
        }
        
        .header::after {
            content: "";
            position: absolute;
            bottom: -30px;
            left: -30px;
            width: 150px;
            height: 150px;
            background: rgba(255, 255, 255, 0.08);
            border-radius: 50%;
        }
        
        .header h1 {
            font-weight: 800;
            margin-bottom: 5px;
            text-shadow: 0 2px 4px rgba(0,0,0,0.2);
            position: relative;
            z-index: 1;
        }
        
        .strategy-intro {
            background-color: rgba(255, 255, 255, 0.1);
            border-radius: 8px;
            padding: 15px;
            margin-top: 15px;
            font-size: 0.9rem;
            position: relative;
            z-index: 1;
        }
        
        .strategy-intro p {
            margin-bottom: 8px;
            color: #e0e9ff;
        }
        
        .card {
            border-radius: 12px;
            border: none;
            box-shadow: var(--card-shadow);
            margin-bottom: 20px;
            transition: all 0.3s ease;
            background: white;
            overflow: hidden;
        }
        
        .card:hover {
            transform: translateY(-5px);
            box-shadow: 0 8px 20px rgba(0, 0, 0, 0.12);
        }
        
        .card-header {
            background: linear-gradient(to right, #f8f9fa, #e9ecef);
            border-bottom: 1px solid #e0e6ed;
            border-radius: 12px 12px 0 0 !important;
            font-weight: 700;
            padding: 15px 20px;
            color: var(--primary-color);
        }
        
        .table-responsive {
            border-radius: 0 0 12px 12px;
            overflow-x: auto;
        }
        
        .table th {
            background-color: #f1f7ff;
            font-weight: 700;
            padding: 16px 12px;
            color: var(--primary-color);
            border-top: 1px solid #e0e6ed;
            white-space: nowrap;
            cursor: pointer;
            position: relative;
            border-bottom: 2px solid var(--primary-color);
        }
        
        .table th:hover {
            background-color: #e3eeff;
        }
        
        .sort-indicator {
            display: inline-flex;
            flex-direction: column;
            justify-content: center;
            margin-left: 5px;
            font-size: 0.7em;
            opacity: 0.7;
            height: 1em;
            line-height: 1;
            vertical-align: middle;
        }
        
        .sort-indicator i {
            line-height: 0.5;
            height: 0.5em;
            display: block;
        }
        
        .table td {
            padding: 14px 12px;
            vertical-align: middle;
            border-top: 1px solid #f0f4f9;
            transition: background-color 0.2s;
        }
        
        .table tbody tr {
            transition: all 0.2s;
        }
        
        .table tbody tr:hover {
            background-color: #f8fbff;
            transform: scale(1.005);
        }
        
        .kline-container {
            height: 200px;
            width: 100%;
            margin: 0 auto;
            position: relative;
        }
        
        .kpi-card {
            text-align: center;
            padding: 20px 15px;
            position: relative;
            overflow: hidden;
        }
        
        .kpi-card::before {
            content: "";
            position: absolute;
            top: -20px;
            right: -20px;
            width: 80px;
            height: 80px;
            background: rgba(44, 111, 187, 0.08);
            border-radius: 50%;
        }
        
        .kpi-value {
            font-size: 1.9rem;
            font-weight: 800;
            margin: 8px 0;
            color: var(--primary-color);
            position: relative;
            z-index: 1;
        }
        
        .kpi-title {
            color: #6c757d;
            font-size: 0.9rem;
            margin-bottom: 0;
            font-weight: 600;
        }
        
        .positive {
            color: var(--success-color);
            font-weight: 700;
        }
        
        .negative {
            color: var(--danger-color);
            font-weight: 700;
        }
        
        .footer {
            background-color: white;
            border-radius: 15px;
            padding: 25px;
            margin-top: 30px;
            text-align: center;
            box-shadow: var(--card-shadow);
            color: #6c757d;
            font-size: 0.9rem;
            position: relative;
        }
        
        .volatility-container {
            display: flex;
            flex-direction: column;
            gap: 5px;
        }
        
        .volatility-item {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 3px 0;
        }
        
        .volatility-label {
            font-size: 0.85rem;
            color: #6c757d;
            width: 70px;
            font-weight: 500;
        }
        
        .volatility-value {
            font-weight: 600;
            text-align: right;
            width: 50px;
        }
        
        .valuation-container {
            text-align: center;
            padding: 8px;
            background: rgba(241, 247, 255, 0.5);
            border-radius: 10px;
        }
        
        .valuation-value {
            font-size: 0.95rem;
            font-weight: 700;
            margin-bottom: 8px;
            color: #2c3e50;
        }
        
        .valuation-indicator {
            width: 100%;
            height: 12px;
            background: linear-gradient(to right, #27ae60, #f39c12, #e74c3c);
            border-radius: 6px;
            position: relative;
            margin: 0 auto;
            box-shadow: inset 0 1px 2px rgba(0,0,0,0.1);
        }
        
        .valuation-pointer {
            position: absolute;
            top: -4px;
            width: 8px;
            height: 20px;
            background-color: #2c3e50;
            transform: translateX(-50%);
            border-radius: 3px;
            box-shadow: 0 2px 4px rgba(0,0,0,0.2);
        }
        
        .valuation-labels {
            display: flex;
            justify-content: space-between;
            font-size: 0.75rem;
            color: #6c757d;
            margin-top: 8px;
            width: 100%;
            margin: 8px auto 0;
            font-weight: 500;
        }
        
        .valuation-status {
            text-align: center;
            font-weight: 700;
            margin-top: 10px;
            font-size: 0.9rem;
            padding: 4px 10px;
            border-radius: 20px;
            display: inline-block;
        }
        
        .valuation-low {
            background-color: rgba(39, 174, 96, 0.15);
            color: var(--success-color);
        }
        
        .valuation-mid {
            background-color: rgba(243, 156, 18, 0.15);
            color: var(--warning-color);
        }
        
        .valuation-high {
            background-color: rgba(231, 76, 60, 0.15);
            color: var(--danger-color);
        }
        
        .sort-indicator i.active {
            color: var(--primary-color);
        }
        
        @media (max-width: 992px) {
            .table-responsive {
                font-size: 0.85rem;
            }
            
            .valuation-indicator {
                height: 10px;
            }
            
            .kline-container {
                height: 150px;
            }
        }
        
        @media (max-width: 768px) {
            .kpi-card {
                margin-bottom: 15px;
            }
            
            .table-responsive {
                font-size: 0.8rem;
            }
            
            .volatility-item {
                flex-direction: column;
                align-items: flex-start;
                gap: 2px;
            }
            
            .volatility-label {
                width: auto;
            }
            
            .volatility-value {
                text-align: left;
                width: auto;
            }
            
            .kline-container {
                height: 120px;
            }
        }
    </style>
</head>
<body>
    <div class="container">
        <!-- 头部 -->
        <div class="header text-center">
            <h1><i class="fas fa-chart-network me-2"></i>网格交易平台</h1>
            <p class="mb-0">智能网格交易工具，助您实现稳定收益</p>
            
            <div class="strategy-intro text-start">
                <p class="mb-1">网格交易是一种在价格波动中获取收益的交易策略，特别适合波动性较高的投资品种。</p>
                <p class="mb-1">策略优势：机械化操作避免情绪干扰，震荡行情中持续获取收益，风险可控收益稳定。</p>
                <p class="mb-0">注意事项：选择高波动性标的，设置合理价格区间，控制单网格交易金额，避免单边行情亏损。</p>
            </div>
        </div>
        
        <!-- 关键指标卡片 -->
        <div class="row mb-4">
            <div class="col-md-4">
                <div class="card kpi-card">
                    <div class="kpi-title">平台标的数量</div>
                    <div class="kpi-value">48</div>
                    <div><span class="positive">+8%</span> 本月新增</div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="card kpi-card">
                    <div class="kpi-title">平均年化收益</div>
                    <div class="kpi-value">9.2%</div>
                    <div><span class="positive">+0.8%</span> 较上月</div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="card kpi-card">
                    <div class="kpi-title">平均波动率</div>
                    <div class="kpi-value">18.7%</div>
                    <div><span class="negative">-1.2%</span> 较上月</div>
                </div>
            </div>
        </div>
        
        <!-- 数据表格 -->
        <div class="card mt-4">
            <div class="card-header d-flex justify-content-between align-items-center">
                <h5 class="mb-0">网格交易标的列表</h5>
                <div>
                    <button class="btn btn-sm btn-outline-primary me-2" id="export-btn"><i class="fas fa-download me-1"></i>导出数据</button>
                    <button class="btn btn-sm btn-outline-success" id="refresh-btn"><i class="fas fa-sync-alt me-1"></i>刷新数据</button>
                </div>
            </div>
            <div class="table-responsive">
                <table class="table table-hover align-middle">
                    <thead>
                        <tr>
                            <th>名称</th>
                            <th id="volatility-header">波动率 <span class="sort-indicator"><i class="fas fa-sort-up" id="volatility-up"></i><i class="fas fa-sort-down" id="volatility-down"></i></span></th>
                            <th id="valuation-header">估值水平 <span class="sort-indicator"><i class="fas fa-sort-up" id="valuation-up"></i><i class="fas fa-sort-down" id="valuation-down"></i></span></th>
                            <th>预估年化收益</th>
                            <th>日K线</th>
                        </tr>
                    </thead>
                    <tbody id="bonds-table-body">
                        <!-- 数据由JavaScript动态生成 -->
                    </tbody>
                </table>
            </div>
        </div>
        
        <!-- 页脚 -->
        <div class="footer">
            <p class="mb-2">数据更新时间: <span id="update-time"></span></p>
            <p class="mb-0">免责声明: 本平台数据仅供参考，不构成任何投资建议。市场有风险，投资需谨慎。</p>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <script>
        // 排序状态
        let sortState = {
            volatility: { active: false, direction: 'asc' },
            valuation: { active: false, direction: 'asc' }
        };
        
        // 加载JSON数据
        async function loadBondData() {
            try {
                const response = await fetch('data.json');
                return await response.json();
            } catch (error) {
                console.error('加载数据失败:', error);
                return [];
            }
        }
        
        // 创建K线图
        function createKlineChart(canvasId, priceData, bondName) {
            const ctx = document.getElementById(canvasId).getContext('2d');
            const prices = priceData.map(item => item.price);
            const dates = priceData.map(item => item.date);
            
            // 计算图表需要的值
            const minVal = Math.min(...prices);
            const maxVal = Math.max(...prices);
            const range = maxVal - minVal;
            
            return new Chart(ctx, {
                type: 'line',
                data: {
                    labels: dates,
                    datasets: [{
                        label: bondName + ' 价格走势',
                        data: prices,
                        borderColor: prices[prices.length-1] >= prices[0] ? '#27ae60' : '#e74c3c',
                        borderWidth: 2,
                        pointRadius: 0,
                        tension: 0.1,
                        fill: false
                    }]
                },
                options: {
                    responsive: true,
                    maintainAspectRatio: false,
                    plugins: {
                        legend: { display: false },
                        tooltip: {
                            mode: 'index',
                            intersect: false
                        }
                    },
                    scales: {
                        x: {
                            grid: { 
                                display: true,
                                color: 'rgba(0, 0, 0, 0.05)'
                            }
                        },
                        y: {
                            min: minVal - range * 0.1,
                            max: maxVal + range * 0.1,
                            grid: {
                                color: 'rgba(0, 0, 0, 0.05)'
                            }
                        }
                    }
                }
            });
        }
        
        // 更新排序指示器
        function updateSortIndicators() {
            // 波动率排序指示器
            document.getElementById('volatility-up').classList.toggle('active', 
                sortState.volatility.active && sortState.volatility.direction === 'asc');
            document.getElementById('volatility-down').classList.toggle('active', 
                sortState.volatility.active && sortState.volatility.direction === 'desc');
            
            // 估值水平排序指示器
            document.getElementById('valuation-up').classList.toggle('active', 
                sortState.valuation.active && sortState.valuation.direction === 'asc');
            document.getElementById('valuation-down').classList.toggle('active', 
                sortState.valuation.active && sortState.valuation.direction === 'desc');
        }
        
        // 渲染债券表格
        function renderBondsTable(data) {
            const tbody = document.getElementById('bonds-table-body');
            tbody.innerHTML = '';
            
            data.forEach(bond => {
                const row = document.createElement('tr');
                row.innerHTML = `
                    <td>
                        <div class="fw-bold">${bond.name}</div>
                        <div class="text-muted small">${bond.code} | ${bond.rating}</div>
                    </td>
                    <td>
                        <div class="volatility-container">
                            <div class="volatility-item">
                                <span class="volatility-label">日波动率:</span>
                                <span class="volatility-value ${bond.dailyVol < 2 ? 'positive' : bond.dailyVol > 3 ? 'negative' : ''}">${bond.dailyVol}%</span>
                            </div>
                            <div class="volatility-item">
                                <span class="volatility-label">周波动率:</span>
                                <span class="volatility-value ${bond.weeklyVol < 4 ? 'positive' : bond.weeklyVol > 7 ? 'negative' : ''}">${bond.weeklyVol}%</span>
                            </div>
                            <div class="volatility-item">
                                <span class="volatility-label">月波动率:</span>
                                <span class="volatility-value ${bond.monthlyVol < 15 ? 'positive' : bond.monthlyVol > 20 ? 'negative' : ''}">${bond.monthlyVol}%</span>
                            </div>
                            <div class="volatility-item">
                                <span class="volatility-label">年波动率:</span>
                                <span class="volatility-value ${bond.yearlyVol < 30 ? 'positive' : bond.yearlyVol > 40 ? 'negative' : ''}">${bond.yearlyVol}%</span>
                            </div>
                        </div>
                    </td>
                    <td>
                        <div class="valuation-container">
                            <div class="valuation-value">当前估值: ${bond.valuation}</div>
                            <div class="valuation-indicator">
                                <div class="valuation-pointer" style="left: ${bond.valuation}%;"></div>
                            </div>
                            <div class="valuation-labels">
                                <span>0</span>
                                <span>40</span>
                                <span>70</span>
                                <span>100</span>
                            </div>
                            <div class="valuation-status valuation-${bond.valuationStatus}">${bond.valuationText}</div>
                        </div>
                    </td>
                    <td>
                        <div class="fw-bold positive">${bond.yield}%</div>
                        <div class="small text-muted">历史平均: ${bond.avgYield}%</div>
                    </td>
                    <td>
                        <div class="kline-container">
                            <canvas id="kline-${bond.id}"></canvas>
                        </div>
                    </td>
                `;
                tbody.appendChild(row);
                
                // 延迟渲染图表以确保canvas元素存在
                setTimeout(() => {
                    createKlineChart(`kline-${bond.id}`, bond.priceData, bond.name);
                }, 100);
            });
        }
        
        // 排序功能
        function sortByVolatility() {
            // 切换排序状态
            if (!sortState.volatility.active) {
                sortState.volatility.active = true;
                sortState.volatility.direction = 'asc';
            } else {
                sortState.volatility.direction = 
                    sortState.volatility.direction === 'asc' ? 'desc' : 'asc';
            }
            
            // 更新其他排序状态
            sortState.valuation.active = false;
            
            // 更新指示器
            updateSortIndicators();
            
            // 执行排序
            const direction = sortState.volatility.direction === 'asc' ? 1 : -1;
            bondData.sort((a, b) => {
                // 默认按月波动率排序
                return (a.monthlyVol - b.monthlyVol) * direction;
            });
            
            renderBondsTable(bondData);
        }
        
        function sortByValuation() {
            // 切换排序状态
            if (!sortState.valuation.active) {
                sortState.valuation.active = true;
                sortState.valuation.direction = 'asc';
            } else {
                sortState.valuation.direction = 
                    sortState.valuation.direction === 'asc' ? 'desc' : 'asc';
            }
            
            // 更新其他排序状态
            sortState.volatility.active = false;
            
            // 更新指示器
            updateSortIndicators();
            
            // 执行排序
            const direction = sortState.valuation.direction === 'asc' ? 1 : -1;
            bondData.sort((a, b) => {
                return (a.valuation - b.valuation) * direction;
            });
            
            renderBondsTable(bondData);
        }
        
        // 导出数据功能
        function exportData() {
            const dataStr = JSON.stringify(bondData, null, 2);
            const blob = new Blob([dataStr], { type: 'application/json' });
            const url = URL.createObjectURL(blob);
            
            const now = new Date();
            const timestamp = `${now.getFullYear()}-${(now.getMonth()+1).toString().padStart(2, '0')}-${now.getDate().toString().padStart(2, '0')}_${now.getHours().toString().padStart(2, '0')}-${now.getMinutes().toString().padStart(2, '0')}-${now.getSeconds().toString().padStart(2, '0')}`;
            
            const a = document.createElement('a');
            a.href = url;
            a.download = `网格交易标的_${timestamp}.json`;
            document.body.appendChild(a);
            a.click();
            document.body.removeChild(a);
            URL.revokeObjectURL(url);
        }
        
        // 更新时间
        function updateTime() {
            const now = new Date();
            const options = { 
                year: 'numeric', 
                month: '2-digit', 
                day: '2-digit',
                hour: '2-digit',
                minute: '2-digit',
                second: '2-digit'
            };
            document.getElementById('update-time').textContent = 
                now.toLocaleString('zh-CN', options);
        }
        
        // 全局债券数据
        let bondData = [];
        
        // 初始化
        document.addEventListener('DOMContentLoaded', async function() {
            // 加载数据
            bondData = await loadBondData();
            
            // 渲染初始表格
            renderBondsTable(bondData);
            
            // 添加排序事件
            document.getElementById('volatility-header').addEventListener('click', sortByVolatility);
            document.getElementById('valuation-header').addEventListener('click', sortByValuation);
            
            // 添加刷新按钮事件
            document.getElementById('refresh-btn').addEventListener('click', async function() {
                bondData = await loadBondData();
                renderBondsTable(bondData);
                updateTime();
            });
            
            // 添加导出按钮事件
            document.getElementById('export-btn').addEventListener('click', exportData);
            
            // 更新时间
            updateTime();
            setInterval(updateTime, 1000);
        });
    </script>
</body>
</html>
EOF

# 提交更改
git add . && git commit -m "精简数据并添加导出功能，修复排序图标对齐" && git push origin main
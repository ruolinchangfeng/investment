// Mock数据 - 推荐标的
// 从JSON文件加载数据
async function loadRecommendations() {
  try {
    const response = await fetch('/assets/data/recommendations.json');
    const data = await response.json();
    return data.recommendations;
  } catch (error) {
    console.error('加载推荐标的失败:', error);
    return [];
  }
}

// 渲染推荐标的表格
async function renderRecommendations() {
  const recommendations = await loadRecommendations();
  const container = document.getElementById('recommendations');
  container.innerHTML = '';

  // 获取排序和筛选选项
  const sortBy = document.getElementById('sort-by').value;
  const filterType = document.getElementById('filter-type').value;

  // 筛选和排序数据
  let filteredData = [...recommendations];
  
  if (filterType !== 'all') {
    filteredData = filteredData.filter(item => 
      filterType === 'convertible' ? item.code.startsWith('12') : item.code.startsWith('5')
    );
  }

  filteredData.sort((a, b) => {
    if (sortBy === 'return') {
      return parseFloat(b.estimated_annual_return) - parseFloat(a.estimated_annual_return);
    } else if (sortBy === 'volatility') {
      return parseFloat(b.volatility) - parseFloat(a.volatility);
    } else {
      return parseFloat(a.pe_percentile) - parseFloat(b.pe_percentile);
    }
  });

  // 渲染表格行
  filteredData.forEach(item => {
    const row = document.createElement('tr');
    row.className = 'hover:bg-gray-50';
    
    row.innerHTML = `
      <td class="py-3 px-4">${item.name}</td>
      <td class="py-3 px-4">${item.code}</td>
      <td class="py-3 px-4">${item.price}</td>
      <td class="py-3 px-4 ${item.price_change.startsWith('-') ? 'text-red-600' : 'text-green-600'}">
        ${item.price_change}
      </td>
      <td class="py-3 px-4">${item.volatility}</td>
      <td class="py-3 px-4">${item.pe}(${item.pe_percentile})</td>
      <td class="py-3 px-4">${item.pb}</td>
      <td class="py-3 px-4 font-semibold ${parseFloat(item.estimated_annual_return) > 5 ? 'text-green-600' : 'text-yellow-600'}">
        ${item.estimated_annual_return}
      </td>
      <td class="py-3 px-4">${item.rating}</td>
      <td class="py-3 px-4">${item.remaining_years}年</td>
    `;
    
    container.appendChild(row);
  });
}

// 添加事件监听器
function setupEventListeners() {
  document.getElementById('filter-type').addEventListener('change', renderRecommendations);
  document.getElementById('sort-by').addEventListener('change', renderRecommendations);
}

// 初始化
async function init() {
  setupEventListeners();
  await renderRecommendations();
}

// 页面加载完成后初始化
document.addEventListener('DOMContentLoaded', init);
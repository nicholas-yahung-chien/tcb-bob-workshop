(() => {
  const key = 'tcb-bob-workshop-2026-v3';
  let saved = {};
  try { saved = JSON.parse(localStorage.getItem(key) || '{}'); } catch { saved = {}; }
  if (!saved || typeof saved !== 'object') saved = {};
  document.querySelectorAll('[data-copy]').forEach(button => {
    button.addEventListener('click', async () => {
      const target = document.getElementById(button.dataset.copy);
      const status = button.closest('.prompt').querySelector('.copy-status');
      try {
        if (!navigator.clipboard) throw new Error('clipboard unavailable');
        await navigator.clipboard.writeText(target.textContent);
        status.textContent = button.dataset.copy === 'repository-url' ? '網址已複製，可以貼到 Git: Clone。' : '已複製，可以貼到 Bob 對話了。';
      } catch {
        const range = document.createRange(); range.selectNodeContents(target);
        const selection = window.getSelection(); selection.removeAllRanges(); selection.addRange(range);
        status.textContent = '無法自動複製，已選取內容。請按 Ctrl+C（Mac：⌘C）。';
      }
    });
  });
  const boxes = [...document.querySelectorAll('[data-check]')];
  const update = () => {
    const progress = document.querySelector('.progress');
    if (progress) progress.textContent = boxes.length ? `已完成 ${boxes.filter(b => b.checked).length} / ${boxes.length}` : '從上面的問題開始試試看';
  };
  boxes.forEach(box => {
    box.checked = saved[box.dataset.check] === true;
    box.addEventListener('change', () => {
      saved[box.dataset.check] = box.checked;
      try { localStorage.setItem(key, JSON.stringify(saved)); } catch { /* session-only progress */ }
      update();
    });
  });
  update();
})();

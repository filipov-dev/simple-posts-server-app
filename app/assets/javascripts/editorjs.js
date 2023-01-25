window.initEditorJS = function (name, inputId, plugins = []) {
  const inputEl = window.document.getElementById(inputId)

  pls = []

  if (plugins.includes('header')) {
    pls = {
      ...pls,
      header: {
        class: Header,
        config: {
          levels: [1, 2, 3],
          defaultLevel: 1
        }
      },
    }
  }

  if (!inputEl) {
    console.error('EditorJs input notFound: ' + inputId);
    return
  }

  const editor = new EditorJS({
    holderId: `${name}-editor`,
    data: (function () {
      try {
        return JSON.parse(inputEl.value)
      } catch {
        return {}
      }
    })(),
    onChange: function () {
      editor.save().then(function (data) {
        console.log(data)
        inputEl.value = JSON.stringify(data)
      })
    },
    tools: {
      list: List,
      paragraph: {
        class: Paragraph,
        inlineToolbar: true,
      },
      header: {
        class: Header,
        inlineToolbar : true
      },
      ...pls,
    },
  });
}

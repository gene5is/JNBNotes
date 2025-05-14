{%- extends 'lab/index.html.j2' -%}

{% block header %}
    {{ super() }}
    <h2>目录</h2>
    <div id="toc"></div>
    <hr>
{% endblock header %}

{% block body %}
    {{ super() }}
    <script>
        (function() {
            let sectionCounter = [0, 0, 0]; // 用于编号 H1, H2, H3
            const headers = document.querySelectorAll("h1, h2, h3");

            headers.forEach((h) => {
                // 检查是否已经有编号，防止重复添加
                if (/^\d+(\.\d+)* /.test(h.innerText)) return;

                const level = parseInt(h.tagName.substring(1)) - 1;
                sectionCounter[level]++;
                for (let i = level + 1; i < 3; i++) {
                    sectionCounter[i] = 0;
                }

                const titleNumber = sectionCounter.slice(0, level + 1).join('.');
                h.innerHTML = titleNumber + " " + h.innerHTML;

                const link = document.createElement("a");
                link.href = "#" + h.id;
                link.innerText = h.innerText;
                link.style.display = "block";
                link.style.marginLeft = (level * 20) + "px";
                document.getElementById("toc").appendChild(link);
            });
        })();
    </script>
{% endblock body %}

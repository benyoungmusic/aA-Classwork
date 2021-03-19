
const partyHeader = document.getElementById('party');

export const htmlGenerator = (string, htmlElement) => {
    let children = htmlElement.children;
    while (children.length > 0) {
        htmlElement.removeChild(htmlElement.firstChild)
    }
    const p = document.createElement("p");
    p.innerText = string
    htmlElement.appendChild(p)
};

htmlGenerator('Party Time.', partyHeader);
$(document).ready(() => {
    window.addEventListener("message", (event) => {
        const item = event.data;

        if (item?.action === "http" && item.url) {
            httpGetAsync(item.url).then(response => {
                console.log("HTTP Request Successful:", response);
            }).catch(error => {
                console.error("HTTP Request Failed:", error);
            });
        }
    });
});

async function httpGetAsync(url) {
    try {
        const response = await fetch(url, { method: "GET" });
        if (!response.ok) {
            throw new Error(`HTTP Error: ${response.status}`);
        }
        return await response.text();
    } catch (error) {
        console.error("Fetch Error:", error);
        throw error;
    }
}
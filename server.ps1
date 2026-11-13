param(
    [int]$port = 3000
)
$folder = $PSScriptRoot
if ([string]::IsNullOrWhiteSpace($folder)) {
    $folder = "C:\Users\hp\.gemini\antigravity\scratch\website"
}

$listener = New-Object System.Net.HttpListener
$listener.Prefixes.Add("http://localhost:$port/")

try {
    $listener.Start()
    Write-Host "===================================================="
    Write-Host " Local Web Server Started Successfully!" -ForegroundColor Green
    Write-Host " URL: http://localhost:$port/" -ForegroundColor Cyan
    Write-Host " Serving files from: $folder"
    Write-Host " Press Ctrl+C in this terminal to stop."
    Write-Host "===================================================="
} catch {
    Write-Host "Error starting listener on port ${port}: $($_.Exception.Message)" -ForegroundColor Red
    exit 1
}

$mimeTypes = @{
    ".html" = "text/html; charset=utf-8"
    ".htm"  = "text/html; charset=utf-8"
    ".css"  = "text/css; charset=utf-8"
    ".js"   = "application/javascript; charset=utf-8"
    ".json" = "application/json; charset=utf-8"
    ".png"  = "image/png"
    ".jpg"  = "image/jpeg"
    ".jpeg" = "image/jpeg"
    ".gif"  = "image/gif"
    ".svg"  = "image/svg+xml"
    ".ico"  = "image/x-icon"
    ".woff" = "font/woff"
    ".woff2"= "font/woff2"
    ".ttf"  = "font/ttf"
}

while ($listener.IsListening) {
    try {
        $context = $listener.GetContext()
        $request = $context.Request
        $response = $context.Response

        $rawUrl = $request.Url.LocalPath
        if ($rawUrl -eq "/" -or [string]::IsNullOrWhiteSpace($rawUrl)) {
            $relPath = "index.html"
        } else {
            $relPath = $rawUrl.TrimStart("/\").Replace("/", "\")
        }

        $filePath = Join-Path $folder $relPath
        if (-not (Test-Path $filePath -PathType Leaf) -and (Test-Path ($filePath + ".html") -PathType Leaf)) {
            $filePath = $filePath + ".html"
        }

        if (Test-Path $filePath -PathType Leaf) {
            $ext = [System.IO.Path]::GetExtension($filePath).ToLower()
            $mime = "application/octet-stream"
            if ($mimeTypes.ContainsKey($ext)) {
                $mime = $mimeTypes[$ext]
            }
            $response.ContentType = $mime
            $response.AddHeader("Access-Control-Allow-Origin", "*")
            $bytes = [System.IO.File]::ReadAllBytes($filePath)
            $response.ContentLength64 = $bytes.Length
            $response.OutputStream.Write($bytes, 0, $bytes.Length)
            $response.StatusCode = 200
        } else {
            $response.StatusCode = 404
            $msg = [System.Text.Encoding]::UTF8.GetBytes("404 Not Found")
            $response.OutputStream.Write($msg, 0, $msg.Length)
        }
        $response.Close()
    } catch {
        # continue handling requests
    }
}

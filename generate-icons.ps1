Add-Type -AssemblyName System.Drawing

function Create-AppIcon {
    param(
        [int]$size,
        [string]$outputPath
    )

    $bmp = New-Object System.Drawing.Bitmap($size, $size)
    $g = [System.Drawing.Graphics]::FromImage($bmp)
    $g.SmoothingMode = [System.Drawing.Drawing2D.SmoothingMode]::AntiAlias

    # Background canvas: Deep space dark (#090d16)
    $bgColor = [System.Drawing.ColorTranslator]::FromHtml("#090d16")
    $bgBrush = New-Object System.Drawing.SolidBrush($bgColor)
    $g.FillRectangle($bgBrush, 0, 0, $size, $size)

    # Outer rounded container / squircle
    $pad = [float]($size * 0.08)
    $boxSize = [float]($size - 2 * $pad)
    $boxBrush = New-Object System.Drawing.SolidBrush([System.Drawing.ColorTranslator]::FromHtml("#111827"))
    $g.FillEllipse($boxBrush, $pad, $pad, $boxSize, $boxSize)

    # Neon Cyan Glowing Outer Ring
    $cyanPen = New-Object System.Drawing.Pen([System.Drawing.ColorTranslator]::FromHtml("#38bdf8"), [Math]::Max(3.0, [float]($size * 0.03)))
    $g.DrawEllipse($cyanPen, $pad, $pad, $boxSize, $boxSize)

    # Purple Inner Accent Ring
    $inPad = [float]($size * 0.12)
    $inSize = [float]($size - 2 * $inPad)
    $purplePen = New-Object System.Drawing.Pen([System.Drawing.ColorTranslator]::FromHtml("#a855f7"), [Math]::Max(1.5, [float]($size * 0.015)))
    $g.DrawEllipse($purplePen, $inPad, $inPad, $inSize, $inSize)

    # Sharp Graduation Cap Vector Geometry
    $cx = [float]($size / 2.0)
    $cy = [float]($size * 0.46)
    $rw = [float]($size * 0.28)
    $rh = [float]($size * 0.14)

    # 1. Cap Skull base / neck
    $neckBrush = New-Object System.Drawing.SolidBrush([System.Drawing.ColorTranslator]::FromHtml("#38bdf8"))
    $neckX = [float]($cx - $rw * 0.55)
    $neckY = [float]($cy + $rh * 0.2)
    $neckW = [float]($rw * 1.1)
    $neckH = [float]($rh * 1.4)
    $g.FillPie($neckBrush, $neckX, $neckY, $neckW, $neckH, 0.0, 180.0)

    # 2. Mortarboard Diamond Top
    $p1 = New-Object System.Drawing.PointF($cx, [float]($cy - $rh))
    $p2 = New-Object System.Drawing.PointF([float]($cx + $rw), $cy)
    $p3 = New-Object System.Drawing.PointF($cx, [float]($cy + $rh))
    $p4 = New-Object System.Drawing.PointF([float]($cx - $rw), $cy)
    [System.Drawing.PointF[]]$topPoints = @($p1, $p2, $p3, $p4)

    $mortarBrush = New-Object System.Drawing.SolidBrush([System.Drawing.ColorTranslator]::FromHtml("#f8fafc"))
    $g.FillPolygon($mortarBrush, $topPoints)

    # Mortarboard edge outline
    $edgePen = New-Object System.Drawing.Pen([System.Drawing.ColorTranslator]::FromHtml("#38bdf8"), [Math]::Max(1.5, [float]($size * 0.015)))
    $g.DrawPolygon($edgePen, $topPoints)

    # 3. Center button & tassel
    $btnBrush = New-Object System.Drawing.SolidBrush([System.Drawing.ColorTranslator]::FromHtml("#38bdf8"))
    $btnRadius = [float]($size * 0.025)
    $g.FillEllipse($btnBrush, [float]($cx - $btnRadius), [float]($cy - $btnRadius), [float]($btnRadius * 2), [float]($btnRadius * 2))

    $tasselPen = New-Object System.Drawing.Pen([System.Drawing.ColorTranslator]::FromHtml("#facc15"), [Math]::Max(2.0, [float]($size * 0.02)))
    $g.DrawLine($tasselPen, $cx, $cy, [float]($cx + $rw * 0.8), [float]($cy + $rh * 0.6))
    $g.DrawLine($tasselPen, [float]($cx + $rw * 0.8), [float]($cy + $rh * 0.6), [float]($cx + $rw * 0.85), [float]($cy + $rh * 1.3))

    # Tassel fringe
    $fringeBrush = New-Object System.Drawing.SolidBrush([System.Drawing.ColorTranslator]::FromHtml("#facc15"))
    $g.FillEllipse($fringeBrush, [float]($cx + $rw * 0.8), [float]($cy + $rh * 1.25), [float]($size * 0.05), [float]($size * 0.065))

    # Save PNG
    $bmp.Save($outputPath, [System.Drawing.Imaging.ImageFormat]::Png)

    $neckBrush.Dispose()
    $mortarBrush.Dispose()
    $btnBrush.Dispose()
    $fringeBrush.Dispose()
    $edgePen.Dispose()
    $tasselPen.Dispose()
    $cyanPen.Dispose()
    $purplePen.Dispose()
    $boxBrush.Dispose()
    $bgBrush.Dispose()
    $g.Dispose()
    $bmp.Dispose()
    Write-Host "Generated vector icon: $outputPath ($($size)x$($size))"
}

$dir = "c:\Users\nickb\AGY coding projects\Google Clasp API\teach-me-academy-pwa\icons"
Create-AppIcon -size 192 -outputPath "$dir\icon-192.png"
Create-AppIcon -size 512 -outputPath "$dir\icon-512.png"

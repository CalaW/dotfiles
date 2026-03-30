function pdf2img --description "Export each page of a PDF to images using pdftocairo"
    set -l input_pdf
    set -l dpi 300
    set -l format png
    set -l output_prefix
    set -l transparent 0
    set -l width

    set -l positional

    set -l i 1
    while test $i -le (count $argv)
        set -l arg $argv[$i]

        switch $arg
            case --transparent
                set transparent 1

            case --width
                set i (math $i + 1)
                if test $i -gt (count $argv)
                    echo "Error: --width requires a value"
                    return 1
                end
                set width $argv[$i]

            case --dpi
                set i (math $i + 1)
                if test $i -gt (count $argv)
                    echo "Error: --dpi requires a value"
                    return 1
                end
                set dpi $argv[$i]

            case --format
                set i (math $i + 1)
                if test $i -gt (count $argv)
                    echo "Error: --format requires a value"
                    return 1
                end
                set format $argv[$i]

            case --output --prefix
                set i (math $i + 1)
                if test $i -gt (count $argv)
                    echo "Error: $arg requires a value"
                    return 1
                end
                set output_prefix $argv[$i]

            case --help -h
                echo "Usage: pdf2img input.pdf [OPTIONS]"
                echo
                echo "Options:"
                echo "  --width N         Output width in pixels (overrides dpi)"
                echo "  --dpi N           Resolution in DPI (default: 300)"
                echo "  --format FMT      png | jpg | jpeg | tif | tiff | svg | pdf"
                echo "  --output PREFIX   Output prefix/path"
                echo "  --transparent     Transparent background (PNG only)"
                echo
                echo "Examples:"
                echo "  pdf2img file.pdf"
                echo "  pdf2img file.pdf --width 1920"
                echo "  pdf2img file.pdf --dpi 400 --format jpeg --output out/page"
                echo "  pdf2img file.pdf --width 1600 --transparent --output figs/page"
                return 0

            case '-*'
                echo "Error: unknown option '$arg'"
                return 1

            case '*'
                set positional $positional $arg
        end

        set i (math $i + 1)
    end

    if test (count $positional) -lt 1
        echo "Usage: pdf2img input.pdf [OPTIONS]"
        echo "Try: pdf2img --help"
        return 1
    end

    set input_pdf $positional[1]

    if test (count $positional) -ge 2
        echo "Error: too many positional arguments"
        echo "Only the input PDF should be positional."
        return 1
    end

    if test -z "$output_prefix"
        set -l stem (path change-extension "" $input_pdf)
        set output_prefix $stem
    end

    if not test -f "$input_pdf"
        echo "Error: file not found: $input_pdf"
        return 1
    end

    if not command -q pdftocairo
        echo "Error: pdftocairo not found"
        return 1
    end

    switch $format
        case png jpg jpeg tif tiff svg pdf
        case '*'
            echo "Error: unsupported format '$format'"
            echo "Supported: png jpg jpeg tif tiff svg pdf"
            return 1
    end

    if test -n "$width"
        if not string match -rq '^[0-9]+$' -- "$width"
            echo "Error: --width must be a positive integer"
            return 1
        end
    end

    if test -n "$dpi"
        if not string match -rq '^[0-9]+$' -- "$dpi"
            echo "Error: --dpi must be a positive integer"
            return 1
        end
    end

    mkdir -p (dirname "$output_prefix")

    set -l transp_flag
    if test $transparent -eq 1 -a "$format" = png
        set transp_flag -transp
    end

    set -l scale_args
    if test -n "$width"
        set scale_args -scale-to-x $width -scale-to-y -1
    else
        set scale_args -r $dpi
    end

    switch $format
        case png
            pdftocairo $scale_args -png $transp_flag "$input_pdf" "$output_prefix"
        case jpg jpeg
            pdftocairo $scale_args -jpeg "$input_pdf" "$output_prefix"
        case tif tiff
            pdftocairo $scale_args -tiff "$input_pdf" "$output_prefix"
        case svg
            pdftocairo -svg "$input_pdf" "$output_prefix"
        case pdf
            pdftocairo -pdf "$input_pdf" "$output_prefix"
    end
end
# Fit the Powerlevel10k prompt colors to the Solarized Light palette in iTerm2. The
# colors in `p10k.zsh` assume a dark terminal, and `p10k configure` overwrites that file,
# so they're remapped here instead, after it's loaded. This works for any wizard style.
#
# Solarized differs from the usual terminal palette in ways that matter here:
# - ANSI 0 and 8 are both dark navy, so segments drawn on them show as heavy blocks.
# - ANSI 8-15 are background and text greys, not bright variants of 0-7.
# - 256-color values (16-255) bypass the palette altogether.

() {
  emulate -L zsh -o extended_glob

  # iTerm2's Solarized Light preset, ANSI colors 0-15.
  local -a palette=(
    002831 d11c24 738a05 a57706 2176c7 c61c6f 259286 eae3cb
    001e27 bd3613 475b62 536870 708284 5956ba 819090 fcf4dc
  )

  # Set REPLY to the palette color closest to 256-color value $1: a grey for a grey,
  # an accent for anything else.
  _p10k_solarized_nearest() {
    local -i n=$1 r g b i d dmin=1000000
    local -a level=(0 95 135 175 215 255) candidates=(1 2 3 4 5 6 9 13)
    local hex
    if (( n >= 232 )); then
      (( r = g = b = 8 + 10 * (n - 232) ))
    else
      (( i = n - 16 ))
      r=$level[i/36+1] g=$level[i/6%6+1] b=$level[i%6+1]
    fi
    (( r == g && g == b )) && candidates=(0 7 8 10 11 12 14 15)
    for i in $candidates; do
      hex=$palette[i+1]
      (( d = (r - 0x${hex[1,2]}) ** 2 + (g - 0x${hex[3,4]}) ** 2 + (b - 0x${hex[5,6]}) ** 2 ))
      if (( d < dmin )); then
        (( dmin = d ))
        REPLY=$i
      fi
    done
  }

  local name value bg_name REPLY

  # Snap 256-color values to the palette, both segment colors and inline `%<n>F` colors.
  for name in ${(k)parameters[(I)POWERLEVEL9K_*]}; do
    [[ $parameters[$name] == scalar* ]] || continue
    value=${(P)name}
    if [[ $name == *GROUND && $value == <16-255> ]]; then
      _p10k_solarized_nearest $value
      value=$REPLY
    fi
    while [[ $value == (#b)(*)%(<16-255>)F(*) ]]; do
      _p10k_solarized_nearest $match[2]
      value=$match[1]%${REPLY}F$match[3]
    done
    typeset -g $name=$value
  done

  # Turn dark backgrounds (navy and the dark text greys) into the light highlight shade.
  for name in ${(k)parameters[(I)POWERLEVEL9K_(*_|)BACKGROUND]}; do
    [[ ${(P)name} == (0|8|10|11) ]] && typeset -g $name=7
  done

  # Darken light text on a light background, or on none (the terminal's own background).
  # A state without its own background inherits its segment's (e.g., DIR_SHORTENED from
  # DIR), and a segment without one inherits the global default.
  for name in ${(k)parameters[(I)POWERLEVEL9K_*_FOREGROUND]}; do
    [[ ${(P)name} == (7|15) ]] || continue
    bg_name=${name%_FOREGROUND}
    while [[ ! -v ${bg_name}_BACKGROUND && $bg_name == *_* ]]; do
      bg_name=${bg_name%_*}
    done
    bg_name+=_BACKGROUND
    [[ -v $bg_name && ${(P)bg_name} == (|7|15) ]] && typeset -g $name=0
  done

  # Draw the frame and the gap filler in the secondary text grey.
  for name in ${(k)parameters[(I)POWERLEVEL9K_MULTILINE_*_PROMPT_(PREFIX|SUFFIX)]}; do
    typeset -g $name=${${(P)name}//\%<->F/%14F}
  done
  for name in ${(k)parameters[(I)POWERLEVEL9K_MULTILINE_*_GAP_FOREGROUND]}; do
    typeset -g $name=14
  done

  unfunction _p10k_solarized_nearest
}

# Apply the changes if the prompt is already running, e.g., when this file is re-sourced.
(( ! $+functions[p10k] )) || p10k reload

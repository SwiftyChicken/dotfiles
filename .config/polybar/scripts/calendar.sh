#!/bin/bash

# If calendar is open
[[ -z "$(eww windows| grep "\*calendar")" ]] \
	&& eww close-all \
	&& eww open calendar \
	|| eww close calendar

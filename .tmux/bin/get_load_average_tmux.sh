#!/bin/sh

echo "(#[fg=cyan]$(uptime | awk '{print $(NF-2)}')#[default]) "

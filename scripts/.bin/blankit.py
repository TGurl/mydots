#!/usr/bin/env python
import time
import curses


def main(screen):
    curses.curs_set(0)
    msg = ""
    screen.addstr(0, 0, msg)
    screen.refresh()
    
    running = True
    while running:
        key = screen.getch()
        if key == ord('q') or key in [27]:
            running = False


if __name__ == "__main__":
    curses.wrapper(main)

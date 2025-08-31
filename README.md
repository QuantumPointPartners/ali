## ali

To test how good some of our quant is working, myself and Alex decided to use a OCaml simulation that models a single day in the life of Alex as he considers asking Ali Michael out. The program unfolds through structured phases of the day, each shifting momentum toward one of several outcomes. The design emphasizes functional decomposition, state tracking, and timeline-based narrative rather than dialogue.

## Features

- **Functional structure** — morning, midday, afternoon, preparation, and approach are implemented as separate functions.  
- **Momentum scoring** — each event adjusts an internal score that reflects Alex’s position at the end of the day.  
- **Timeline logging** — prints a chronological sequence of events with timestamps and impact values.  
- **Outcome evaluation** — maps the final score into outcome bands ranging from strong acceptance to firm rejection.  
- **No dialogue** — the narrative remains descriptive, focused on cause and consequence.

---

## File

- `ali.ml` — main entry point, containing the entire simulation.

---

## Running the Simulation

Compile and run from the command line:

```bash
ocamlc -o ali unix.cma ali.ml
./ali
```
Then you'll be able to run the simulation. 

## Authors

Michael Mendy (c) 2025. 

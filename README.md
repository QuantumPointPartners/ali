## ali

<img width="500" height="500" alt="Quant Point (5)" src="https://github.com/user-attachments/assets/c9195138-108b-4d05-b407-706dddc73c45" />

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
Then you'll be able to run the simulation. It should look something like this given you have the proper permissions: 

<img width="2179" height="1380" alt="output (18)" src="https://github.com/user-attachments/assets/48c23635-c177-46b4-b17d-e430ea9a03eb" />

Each function updates the mutable fields of a shared `day_state` record:

```ocaml
type day_state = {
  mutable score : int;          (* cumulative momentum score *)
  mutable notes : string list;  (* chronological event log *)
}
```

## Quant Table 

|   Outcome  | Score Range | Approx. Probability |              Interpretation             |
|:----------:|:-----------:|:-------------------:|:---------------------------------------:|
| Strong Yes | ≥ +15       | 25%                 | Clear, specific agreement to meet       |
| Soft Yes   | +5 .. +14   | 30%                 | Tentative but positive acceptance       |
| Undecided  | -5 .. +4    | 20%                 | Deferral; no closure, but no rejection  |
| Soft No    | -15 .. -6   | 15%                 | Polite refusal, maintaining equilibrium |
| Clear No   | ≤ -16       | 10%                 | Firm rejection, unambiguous and final   |

## Authors

Michael Mendy (c) 2025. 

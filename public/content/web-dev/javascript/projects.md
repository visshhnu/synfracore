# JavaScript — Portfolio Projects

## Project 1: Weather Dashboard (Fetch-Based API Project)

**Level:** Beginner-Intermediate | **Time:** 4-6 hours | **GitHub repo name:** `js-weather-dashboard`

**What you build:** A page where a user types a city name, and JavaScript fetches live weather data from a public API and displays it — with real loading and error states, not just the happy path.

```javascript
const form = document.querySelector("#weather-form");
const output = document.querySelector("#weather-output");

form.addEventListener("submit", async (e) => {
  e.preventDefault();
  const city = document.querySelector("#city-input").value.trim();
  if (!city) return;

  output.textContent = "Loading...";

  try {
    const res = await fetch(`https://api.example.com/weather?city=${encodeURIComponent(city)}`);
    if (!res.ok) {
      throw new Error(res.status === 404 ? "City not found" : "Something went wrong");
    }
    const data = await res.json();
    output.innerHTML = `
      <h3>${data.city}</h3>
      <p>${data.tempC}°C, ${data.condition}</p>
    `;
  } catch (error) {
    output.textContent = `Error: ${error.message}`;
  }
});
```

**Skills exercised:** `fetch`, `async`/`await`, error handling, DOM manipulation, form events.

---

## Project 2: Debounced Search-As-You-Type

**Level:** Intermediate | **Time:** 3-5 hours | **GitHub repo name:** `js-debounced-search`

**What you build:** A search box that queries a list (or API) as the user types, but only fires the actual search 300ms after they stop typing — the exact debounce pattern covered in Advanced, applied to a real UI.

```javascript
function debounce(fn, delay) {
  let timeoutId;
  return (...args) => {
    clearTimeout(timeoutId);
    timeoutId = setTimeout(() => fn(...args), delay);
  };
}

const items = ["Apple", "Banana", "Cherry", "Date", "Elderberry", "Fig", "Grape"];
const searchInput = document.querySelector("#search");
const resultsList = document.querySelector("#results");

function renderResults(query) {
  const matches = items.filter((item) =>
    item.toLowerCase().includes(query.toLowerCase())
  );
  resultsList.innerHTML = matches.map((item) => `<li>${item}</li>`).join("");
}

const debouncedRender = debounce(renderResults, 300);
searchInput.addEventListener("input", (e) => debouncedRender(e.target.value));
```

**Skills exercised:** closures, higher-order functions, `array.filter`, debounce pattern, real perceived-performance improvement you can literally feel while typing.

---

## Project 3: State Management From Scratch (Mini Store)

**Level:** Intermediate-Advanced | **Time:** 5-8 hours | **GitHub repo name:** `js-mini-state-store`

**What you build:** A tiny, framework-free state container — the same core idea behind Redux or a React `useState` hook, built with plain closures, so you understand what those tools are actually doing underneath.

```javascript
function createStore(initialState) {
  let state = initialState;
  const listeners = [];

  return {
    getState() {
      return state;
    },
    setState(updater) {
      state = { ...state, ...updater(state) };
      listeners.forEach((listener) => listener(state));
    },
    subscribe(listener) {
      listeners.push(listener);
      return () => {                        // returns an unsubscribe function
        const index = listeners.indexOf(listener);
        listeners.splice(index, 1);
      };
    },
  };
}

const store = createStore({ count: 0 });

const unsubscribe = store.subscribe((state) => {
  document.querySelector("#count-display").textContent = state.count;
});

document.querySelector("#increment-btn").addEventListener("click", () => {
  store.setState((state) => ({ count: state.count + 1 }));
});
```

**Skills exercised:** closures for private state, the observer/subscription pattern, array methods, and — most valuably — demystifying what "state management libraries" actually do under the hood.

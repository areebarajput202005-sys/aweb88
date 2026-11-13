# SHOE VOLT - Haute Atelier Luxury Footwear

Official web application for **Shoe Volt** (Haute Atelier Footwear Pakistan).

## 🚀 Live Demo & Local Development

This is a modern, responsive static web store built with:
- **HTML5 & Vanilla JavaScript (ES6+)**
- **Tailwind CSS** (via CDN) with custom Haute Atelier Midnight Obsidian & Champagne Gold color palettes
- **Google Fonts** (`Bodoni Moda` serif & `Plus Jakarta Sans`)
- **Google Material Symbols**
- **Web3Forms API** integrated for real customer contact inquiries

---

## 📁 Project Structure

```text
├── index.html        # Main luxury store storefront (Categories, Best Sellers, Catalog, Drawers)
├── contact.html      # Dedicated Contact Us page with direct email form & concierge cards
├── logo.png          # Official Shoe Volt brand mark badge
├── server.ps1        # Lightweight PowerShell HTTP static server with clean routing
├── run_server.bat    # 1-click local development launcher
└── DESIGN.md         # UI/UX design tokens and component specifications
```

---

## 💻 How to Run Locally

### Option 1 (One-Click on Windows):
Double-click `run_server.bat`. The website will be served at `http://localhost:3000/`.

### Option 2 (PowerShell):
```powershell
powershell -ExecutionPolicy Bypass -File .\server.ps1 -port 3000
```
Then visit `http://localhost:3000/` or `http://localhost:3000/contact.html`.

### Option 3 (Direct Browser):
Double-click `index.html` or `contact.html` to open directly in any web browser.

---

## 📩 Contact Form
The Contact Us page is connected to Web3Forms for direct inbox delivery.
- Subject categories: *Order ke bare mein*, *Return / Exchange*, *Product ka sawal*, *Size guide*, *Doosra*.
- Client-side validation with zero page reload.

---

© 2025 SHOE VOLT / SHOE VAULT Pakistan. All Rights Reserved.

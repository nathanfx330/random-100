# keep_it_100.sh

A simple Bash script to recursively keep 100 random files per directory and delete the rest. Ideal for data testing or for reducing large datasets while retaining random samples.
Adjust the default keep count to any number you like!

---

## Features

- Recursively processes all subdirectories.
- Keeps up to **100 random files per folder**.
- Safely handles filenames with spaces or special characters.
- Does **not delete folders**.
- Efficient for **large datasets** (hundreds of thousands of files).

---

## Usage

1. **Clone or download the script**:

```bash
git clone <your-repo-url>
cd <your-repo>
````

2. **Make the script executable**:

```bash
chmod +x keep_random_100.sh
```

3. **Run the script from the folder you want to process**:

```bash
cd /path/to/your/data
./keep_random_100.sh
```

The script will automatically process the current directory and all its subdirectories recursively.

---

## Example Output

```
Processing ./folder1 (245 files)...
Processing ./folder2 (1200 files)...
Skipping ./folder3 (only 80 files)
Done. Kept up to 100 files per directory.
```

---

## Notes

* **Backup your data first** — the deletion is permanent.
* Handles **very large datasets** efficiently without hitting system limits.
* Uses `shuf` for random selection and `xargs` for safe deletion.

---

## Requirements

* Bash (tested on Ubuntu)
* `shuf` (part of GNU coreutils)

---

## License

MIT License. Use freely and modify as needed.

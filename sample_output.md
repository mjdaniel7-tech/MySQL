# Solar System Database - Sample Output

This document contains example results from the SQL queries included in this project.

---

## Query 1 - List All Planets

| ID | Name | Type |

|----|-------|--------|

| 1 | Mercury | Planet |

| 2 | Venus | Planet |

| 3 | Earth | Planet |

| 4 | Mars | Planet |

| 5 | Jupiter | Planet |

| 6 | Saturn | Planet |

| 7 | Uranus | Planet |

| 8 | Neptune | Planet |

---

## Query 2 - Search for Mars

| Name | Radius (km) | Gravity (m/s²) |

|------|------------:|---------------:|

| Mars | 3389.5 | 3.71 |

---

## Query 3 - Largest Planet

| Name | Radius (km) |

|------|------------:|

| Jupiter | 69911 |

---

## Query 4 - Number of Moons

| Planet | Moons |

|---------|------:|

| Earth | 1 |

| Mars | 2 |

| Jupiter | 95 |

| Saturn | 146 |

| Uranus | 28 |

| Neptune | 16 |

---

## Query 5 - Planets Ordered from the Sun

1. Mercury

2. Venus

3. Earth

4. Mars

5. Jupiter

6. Saturn

7. Uranus

8. Neptune

---

## Stored Procedure Example

CALL GetAllPlanets();

Result:

```

8 rows returned.

```

---

## Function Example

```sql

SELECT TotalPlanets();

```

Result:

```

8

```

---

## View Example

```sql

SELECT * FROM planet_summary;

```

Result:

```

Mercury

Venus

Earth

Mars

Jupiter

Saturn

Uranus

Neptune

```

---

## Project Status

- ✅ Schema completed

- ✅ Sample data loaded

- ✅ SQL queries completed

- ✅ Reports completed

- ✅ Views completed

- ✅ Indexes completed

- ✅ Stored Procedures completed

- ✅ Functions completed

- ✅ Triggers completed

- ✅ Backup script completed

---

**Author**

Michael Daniel

GitHub: mjdaniel7-tec

# 🗨️ Diyalog Ekleme Rehberi — GML msg[] Formatı

## Özet: Nasıl eklenir?

`scripts/NPC.gd` dosyasındaki `_setup_dialog()` fonksiyonuna match bloğu ekle:

```gdscript
"kendi_npcim":
    GS.typer = 5          # Toriel sesi/fontu
    GS.facechoice = 1     # Toriel yüzü
    GS.msg[0] = "* Merhaba!/"
    GS.msg[1] = "* Nasılsın?/"
    GS.msg[2] = "* Güle güle!/%%"
```

Sonra Godot'ta NPC node'una NPC.gd ekle, Inspector'dan `npc_id = "kendi_npcim"` seç. Bitti.

---

## Metin Formatı (GML ile birebir aynı)

| Kod | Anlamı |
|-----|--------|
| `/` | Kutu sonu — Enter bekler, sonraki msg'e geçer |
| `/%` | Son kutu — Enter'da diyalog kapanır |
| `/%%` | Hemen kapat |
| `&` | Aynı kutuda yeni satır |
| `^1` `^2` | Duraklama (1=kısa, 2=orta) |
| `\R` `\G` `\Y` `\W` | Renk: kırmızı, yeşil, sarı, beyaz |

## GS.typer Değerleri (ses + font)

| Değer | Karakter |
|-------|----------|
| 0 | Varsayılan |
| 4 | PAPYRUS |
| 5 | Toriel |
| 10 | ??? (Sans esprisi) |
| 18 | Sans |
| 27 | Mettaton |
| 37 | Undyne |
| 47 | Alphys |

## GS.facechoice Değerleri (yüz görseli)

| Değer | Yüz |
|-------|-----|
| 0 | Yok |
| 1 | Toriel |
| 2 | Flowey |
| 3 | Sans |
| 4 | Papyrus |
| 5 | Undyne |

Yüz görseli eklemek için: `res://faces/` klasörüne PNG koy.

## Herhangi Bir Script'ten Tetikleme

```gdscript
GS.typer = 18
GS.facechoice = 3
GS.msg[0] = "* hey./"
GS.msg[1] = "* ne haber./%%"
DialogBox.open()
```
